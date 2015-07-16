Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 27F74607A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 21:52:58 +0000 (UTC)
Received: by widjy10 with SMTP id jy10so26837707wid.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 14:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kSkDQjBKgLRMJ5Jz/Jb4Kk4EFlHtZO9v1O9wUFhHKAA=;
	b=FUxcMMCf2gnZsEOOxEkU5fN7nXQ2+HqjSDper3VkyvwNb0f16/hrJFaTdQubq2aEOs
	BgMc4MWaCiSMb7sqmf01PKUVDxM5Kc9Gix/NOqFtQ0Bj/3kbe3LhnLpACqAnNQv2Nmy/
	5mZlPEIsRuL6fUMbEOh+R/eepJmIWrnW6lRgeMiKDoy2TNSiF9ScmFAK8dyBI+EJ4MA8
	Fs4hkfNJ0PMHLfqBv0/ybxir1ia4bk14nF8/15DvDQBzwsXXbQmoPqWNAsPbs7eHeyEY
	1RcrVv+zrgLHDmGvdAGOZ05GigLtHNFxj5qFY2GtbON8W1XY0LMslSleRocAfZ4PN5wY
	RIQQ==
X-Gm-Message-State: ALoCoQmLK3YlktS0aq1vw2L/JVJ/bodgJfNAHYc3qTQSvrySrm5nRvv8pzmYSNg1qjyA6XlOmJBR
X-Received: by 10.194.178.1 with SMTP id cu1mr23221990wjc.59.1437083577975;
	Thu, 16 Jul 2015 14:52:57 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	sc16sm15140053wjb.28.2015.07.16.14.52.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 16 Jul 2015 14:52:57 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 22:47:16 +0100
Message-Id: <1437083236-26095-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH][V2] pseudo: upgrade to 1.6.6
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
X-List-Received-Date: Thu, 16 Jul 2015 21:53:01 -0000

Fixes include proper support for creating FIFOs, and bug fixes regarding xattrs.

[ YOCTO #7990 ]
[ YOCTO #7993 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/pseudo/{pseudo_1.6.5.bb => pseudo_1.6.6.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.5.bb => pseudo_1.6.6.bb} (77%)

diff --git a/meta/recipes-devtools/pseudo/pseudo_1.6.5.bb b/meta/recipes-devtools/pseudo/pseudo_1.6.6.bb
similarity index 77%
rename from meta/recipes-devtools/pseudo/pseudo_1.6.5.bb
rename to meta/recipes-devtools/pseudo/pseudo_1.6.6.bb
index 2a9dc63..1946021 100644
--- a/meta/recipes-devtools/pseudo/pseudo_1.6.5.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_1.6.6.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
     file://fallback-group \
 "
 
-SRC_URI[md5sum] = "a5545ff365e243193c81981df98e870b"
-SRC_URI[sha256sum] = "f5a0af976c958915503f516dd02097ab6a64c98a3c0cb4ceb0ce8b1ef8e38b3c"
+SRC_URI[md5sum] = "6a7c01a1780350a695bc0f4939b58626"
+SRC_URI[sha256sum] = "1512b91d62739ff8d266e161e27f6da29c3012f4a1e77100021808d4173c0740"
 
 PSEUDO_EXTRA_OPTS ?= "--enable-force-async --without-passwd-fallback"
 
-- 
2.1.4


