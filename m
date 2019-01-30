Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9094F7C2D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 10:59:53 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id u4so25532235wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 02:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=7Ln8MoPUog/uUJQthgc55F/LsfQK5Ds+OoUSljYpLcg=;
	b=LhnqoIxl8iVA3C4E+JZLbqxbD3PReM9ieW5URI+4yco9UtqYCyvOyR8ymdJaihJNzl
	Biegw17Py4gvzUMhIzJ0dx5fomqovoC3gzMrKXfvS++XnIzus8b8xB3xgc+DDCpYVqnm
	MZwNgMjLr7AMpiTKhfFKgDLYdX2Z8D61iUMg4OGoArviJaCoep6Lc+3IlH0N9QLtUwBk
	Tk+qcufy4ar57ZOJRnwA/A2HolungR/wAJ4rOw7o5iePr9FQszxllBE04V+dd4GRSGXz
	QhOl0/lCvPDrtTPhQiy+4TpOUZ9azEWXo7iI5sMLnfq+iC6WTn1VTCulQiP7JOF+yet6
	fzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=7Ln8MoPUog/uUJQthgc55F/LsfQK5Ds+OoUSljYpLcg=;
	b=ky2xF+ollpTSspvK8sLhf2XQC6KNizCKjFyqTVGqDPlf0wD6lqXKvMrHy/icojB1/U
	GbSAPD4nxU0s/4Hk2n48BSvNvXspY3RB5m3rVbwCLL+IB9/bznKEOiNArgUkfd0DH7Wq
	oqBupxAAz8GbClhv8yCB4R3oTuYp4DmtML++N+2HDDoCRR402YXokwFP1osXLEi07JD/
	s4VN7M/GVJImmgBAW5Tzg/evg/GPn9hsd/WUSvf9tCCpFXWWU/+kUFB7IrKhL0oVuegF
	fJ+Bgn+hh7m3dVCVSxGLDaQCYW1oDGT4qvPjwCRaLHXq1xZVcp9UBRFmjIU0Z6MGcRRy
	YJKg==
X-Gm-Message-State: AJcUukfHalvrwCvLQY+NeWvb0f6FKVXur7A610B3OUcZEIvi/YHi+miG
	CsUQvSuuu1BDPwt8Sf5JvRPXOsr4
X-Google-Smtp-Source: ALg8bN5t3u2gEQjK5M3MbqO1x05cT6+c29aInHFlnU6LybcL8DLBMknrLR+xaxb1KncCfT/r7pfrdw==
X-Received: by 2002:adf:900f:: with SMTP id h15mr29604472wrh.18.1548845994026; 
	Wed, 30 Jan 2019 02:59:54 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.02.59.53
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 02:59:53 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:27 +0100
Message-Id: <fb39ca120c0158ec77de2d4bb09f9b55cbd3c4f1.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 04/20] default-providers: set mesa as default provider for nativesdk-mesa
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jan 2019 10:59:53 -0000

The alternative is mesa-gl, but it lacks all of the bits that make
accelerated qemu possible.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/default-providers.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 019ceeb290a..21419038f04 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -54,3 +54,5 @@ PREFERRED_PROVIDER_pkgconfig ?= "pkgconfig"
 PREFERRED_PROVIDER_nativesdk-pkgconfig ?= "nativesdk-pkgconfig"
 PREFERRED_PROVIDER_pkgconfig-native ?= "pkgconfig-native"
 PREFERRED_RPROVIDER_initd-functions ?= "initscripts"
+
+PREFERRED_PROVIDER_nativesdk-mesa ?= "nativesdk-mesa"
-- 
2.17.1


