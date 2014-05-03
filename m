Return-Path: <martin.jansa@gmail.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 79467606E0
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 May 2014 17:24:32 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id lc6so1954516vcb.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 May 2014 10:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Jx/tEDaOxkPGSdNQOwMVwdDOnLtAo5xX2hKyJro0BsQ=;
	b=EONCP5qO3CUV3EQpT4ixXajSCyTM7AWsB5S1ItAVYnGnvsvUoHXqo8RN4ZBJC6tOSa
	468Tw8d3mK1E2xVRGVZedjlVaRBP1shrZomkbm5ofRm/vdFGMAMn8jTgkbAnH1m1gOEV
	2f2L7uqSdo9sBsRWEOGexscvUjuyJpWLWaRlvVXT9IoXjl5kRR3v/S7dWQHf1eWEB4Oo
	/82t8BkLtjHkCpGkZQhaokrljGfY1hTvbZtTqFBZskVkF2hgf4yQOExl4mviGxqY7GnY
	SVoctuIbkS9YhIXBK07r4f3L7S0IKoXf5W8SF1O4LLJyi82yNkxfStFziN9pkCNPnoSd
	kSTA==
X-Received: by 10.58.201.5 with SMTP id jw5mr18358648vec.6.1399137873863;
	Sat, 03 May 2014 10:24:33 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	d8sm3791988vek.11.2014.05.03.10.24.32 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 03 May 2014 10:24:33 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 May 2014 19:24:49 +0200
Message-Id: <1399137889-6482-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] defaultsetup: enable blacklist by default
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
X-List-Received-Date: Sat, 03 May 2014 17:24:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/conf/distro/defaultsetup.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index 5557350..4437267 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -17,6 +17,7 @@ CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'
 
 USER_CLASSES ?= ""
 PACKAGE_CLASSES ?= "package_ipk"
+INHERIT_BLACKLIST = "blacklist"
 INHERIT_DISTRO ?= "debian devshell sstate license"
-INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO}"
+INHERIT += "${PACKAGE_CLASSES} ${USER_CLASSES} ${INHERIT_DISTRO} ${INHERIT_BLACKLIST}"
 
-- 
1.9.1


