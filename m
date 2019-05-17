Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6832F7DFB2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 18:12:08 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id i3so7764390wml.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2019 11:12:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=gjTzYDu+cCWG3OG3izgrClo4VJ3URUBmY7SewjGUzTA=;
	b=Fv2xIMMmFVp5B3SM8WNWuHtvZ0PdRPyPi8cRE4Hy7v8TxgV/m0HK8QL4wsqIeIwV+j
	ORxSr4QRml0kzqRJM4hyELTRcCTVHfd/RVWX+hb9LeM1xpZ0v6M4IyuOyeWdrJ9jsbKu
	AmNJL3ea4W5+wodXS/2T8zVcwqTqwApgwI6apzExLlDsQos7/ZKkBLVERB12giDpTlAD
	esIaltrk3lKaHDdwVKoJPzpJVqK7ibNRkdC99RLBZwsR9vNPWcXBTFP43H/nNBpReH+C
	EElQI1CM6dfjmWvSB/MsolUfWcUXA/efqT3YhdWB5XzyRUMJtKVra1XNbtUZlOCIYCZ4
	LtLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=gjTzYDu+cCWG3OG3izgrClo4VJ3URUBmY7SewjGUzTA=;
	b=Pvy6JmThFMMRn39ddUzmzTnewwtgwCkI3GOHrVhX5KRLxSHL9jO1qxxydRASm7RIMu
	dOzU2m0XwhTXYKszR/N3/IIK+gITmmj15hOegd/U1x33DC9x/dYGKAa3NKOLdCEMsxcl
	r2QX/SsowJMoVSR/rypKiKpau1UDlY3clzEufQG8cY5akhsgX24pi2KMpcDZJoe9X/Qj
	yOBWLHcgmcZcejNNmxu/noS70Sb+fV9Wt/dtF82KbT+hJbq1qpotVN6Co4cMFAD2Kmek
	yodcKMwrWF8c65xR9AtYkAvcJ9VPTDimSNfagGxGtLYlZ2nwXrT/QtLZdFbUMSVDN5mp
	YczA==
X-Gm-Message-State: APjAAAWbSY+WvLOn289KewXKXrgOfs3rc2F7P2EgcPfLgIZ2oaFqXMhB
	v+0Iue16yWnI8m+pUnIWeTGyzDpB
X-Google-Smtp-Source: APXvYqw+dwdvQ8/I96pY3qhDlYUloFO0fvklExe74Dj6d9VbuR3YTXMxvRgf+GhCHEktDdMUFwx7Rg==
X-Received: by 2002:a1c:b789:: with SMTP id h131mr3150000wmf.71.1558116729038; 
	Fri, 17 May 2019 11:12:09 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	c63sm10188093wma.29.2019.05.17.11.12.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 May 2019 11:12:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2019 20:11:26 +0200
Message-Id: <20190517181151.44001-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190517181151.44001-1-alex.kanavin@gmail.com>
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
Subject: [PATCH 12/37] systemtap: upgrade 4.0 -> 4.1
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
X-List-Received-Date: Fri, 17 May 2019 18:12:08 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-kernel/systemtap/systemtap_git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/systemtap/systemtap_git.inc b/meta/recipes-kernel/systemtap/systemtap_git.inc
index 54de7226608..c5348b3204b 100644
--- a/meta/recipes-kernel/systemtap/systemtap_git.inc
+++ b/meta/recipes-kernel/systemtap/systemtap_git.inc
@@ -1,7 +1,7 @@
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-SRCREV = "90ff34ac0506f0d5440393a4c78565f6aaf9b726"
-PV = "4.0"
+SRCREV = "984d6d1696ed06626b07cb65ab55d6ae0ece1131"
+PV = "4.1"
 
 SRC_URI = "git://sourceware.org/git/systemtap.git \
            file://configure-allow-to-disable-libvirt.patch \
-- 
2.17.1


