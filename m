Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 66EBC7733D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 02:15:36 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id y78so1812674oif.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:15:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+VzQf/XytjVEYB9cdiunQt0z9FIecDFBRMSpS4RgKho=;
	b=RtGqvPvsFvYxO6UMncww1O2jspTpWNrZjx7A0l3dL54XNHIuy4ZAKdaUWnHT0i47UP
	gQzLP2fOxBKDtq2E1rA40pcoE9/jlu9ikzRCXJbYiKRDRx190G3SwZ3YBcEbSp37b+kR
	CpOeGk3bEVyV+JO2XcwEarRaAL6GB+eBkPwj8wlwenGgCPjwA0PMwVdTdWyr56HMntDX
	lHw8z2rTXGUfGMK8AUO5TlU+UmfqnhiH4ze4N9qOKch105r3ucl1k4wobwvEIYclsLz4
	d8MnBy1g3ZCwIKXrYxMFvknk2O7jGFtIypCYs4YVwdivCSKzsdaAvabNpHkZFtwbg430
	x3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+VzQf/XytjVEYB9cdiunQt0z9FIecDFBRMSpS4RgKho=;
	b=OEW7YQQpSDWcQkTHLf8ZApa1+3830JsuvAJKbvznOvwhR0/FnEjY9yaIwogxh453ae
	43dQNKfrGshGb8nF6E9b+U4qpOLiFD3MxYnUb89UwOL2VDeZisgsf5OIKp9FRYdiaw59
	zPDw3woSaXFARD8Sp+qW2YYtzVn8RLiOkNtqK8u0AfrllHxD9uIlt+xv6psg7R46iYsD
	tj+wR9t+JTa0YzCM8Cb888kPln9xvublRZNSrDbLESAiPasAa8Sn/r6lE0ecNgWb3y4n
	PWB9RTY+L3xXa8F3IJPdcPFmFUbOfDLe7HdP6YvEFAVcLn+0uLSo8p3S7DXy8nASR91z
	X3Rw==
X-Gm-Message-State: AG10YOTWzzVqg3an1cGaVYy6O6nWg6qmiIHVgzx4WNZVWyaTZelH/gkzTrBUFXBNp6Uj6w==
X-Received: by 10.202.175.151 with SMTP id y145mr33893319oie.107.1456366537227;
	Wed, 24 Feb 2016 18:15:37 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id to9sm112844oec.9.2016.02.24.18.15.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 24 Feb 2016 18:15:36 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:15:22 -0800
Message-Id: <1456366525-7522-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
References: <1456366525-7522-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/4] gstreamer1.0-libav_git: add --ranlib option to LIBAV_EXTRA_CONFIGURE_COMMON_ARG
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
X-List-Received-Date: Thu, 25 Feb 2016 02:15:36 -0000

The versioned gstreamer1.0-libav recipe includes --ranlib in
LIBAV_EXTRA_CONFIGURE_COMMON_ARG, but the git recipe does not.
It appears to be a historical mistake.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index 1957a5a..428d401 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -35,6 +35,7 @@ S = "${WORKDIR}/git"
 
 LIBAV_EXTRA_CONFIGURE_COMMON_ARG = "--target-os=linux \
   --cc='${CC}' --as='${CC}' --ld='${CC}' --nm='${NM}' --ar='${AR}' \
+  --ranlib='${RANLIB}' \
   ${GSTREAMER_1_0_DEBUG} \
   --cross-prefix='${HOST_PREFIX}'"
 
-- 
1.9.1


