Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f175.google.com (mail-ea0-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 64DB66D5A0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 13:52:26 +0000 (UTC)
Received: by mail-ea0-f175.google.com with SMTP id z16so1864618ead.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2013 05:52:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=SNirS1QQnYXG5S7HijH8iJDjdDGcdPCoZ2VREA0Lqew=;
	b=f8trCvW+j5qR3WeEETrmuTxlLU2ECMt1j25tUl+jjv5VevtwmHyV2x6rby6NXQY/i/
	220S392idrp1mwxSsYIgjazgFjSgVIA/rjt5h85wFSIfMhLv4CUPkJ456l7ramGoxJHa
	vPkTd4vFQPKE8CwdJEfPkhJy1mLAhivW6X9OPd5F8g70fo0IOtAfmZK+ts9WCCtadjQp
	8ADt5kz4aXs8jfSSPfdiwF7v98CMXAu5tf0KkLvJ0VgiZEfyj8k4R/D1+gAJsESBXMEs
	UGA29fRLZ62TQhtSfPw7+R63ooXZ5dpk88uEd7bu+JIAfm9oXiYBs5fEEOxHmPFjunAq
	Wegw==
X-Received: by 10.15.99.72 with SMTP id bk48mr4555420eeb.22.1384696347748;
	Sun, 17 Nov 2013 05:52:27 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id h8sm27442301eew.16.2013.11.17.05.52.27
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Nov 2013 05:52:27 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 17 Nov 2013 14:52:18 +0100
Message-Id: <1384696338-5390-7-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.4.3
In-Reply-To: <1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
	<1384696338-5390-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 7/7] resolvconf: Drop allarch
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
X-List-Received-Date: Sun, 17 Nov 2013 13:52:26 -0000

* has runtime dependency on TUNE_PKGARCH bash
  Hash for dependent task bash_4.2.bb.do_packagedata changed from d6eafb155c37bc2da7327492afa449fb to 0ae080aaa92025af690cf16ef0cd2b7e

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
index 5897e40..c1d7b19 100644
--- a/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
+++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.74.bb
@@ -16,8 +16,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/r/resolvconf/resolvconf_${PV}.tar.gz"
 SRC_URI[md5sum] = "2f190d3bb8960b69157f63590c262e93"
 SRC_URI[sha256sum] = "2e72e6884e9105cbf57101ab0f11e768717b6f76b7f5100c6a2a0cc69bb3d4a0"
 
-inherit allarch
-
 do_compile () {
 	:
 }
-- 
1.8.4.3


