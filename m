Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id 92B3862176
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Aug 2013 06:03:13 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so395068pbb.33
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 23:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=NxFqPC3Tcz1jAf2xmWdolEvT0AXeHRQHezZuywPEic8=;
	b=nve9C8q6NWxC94Vl5aW1l2W6TDxKlQOkdDCBcDtjzC+/naufyYvx1b2qk1ZMSa2aDw
	WBJs1AJ0ShocRi7UFnAOhWLgO43yxBSyTW5HUY95VGjFjkc2gpdyFGLCuTu3STNM4qTf
	kLMa4Uq6+xzUyEhs1DDahttOuw36kQclbXuXNA/30BHl5CTOWaQAYMFMtVJ+Mw2V6/WB
	KsTunZJiNbUuDzG3JakZdLgWiSeJxtwZYvyj3jJsYTNU2aepY7e6MUlO5e3vgFW8FdSS
	KD4z9Xk5cOLcbLDMsaMzbmizwTpAnNdzLefmleQzV4X/u+cFGyEJOqhx5+dZ/OZFP8My
	kR1A==
X-Received: by 10.66.4.71 with SMTP id i7mr13634529pai.82.1376546594266;
	Wed, 14 Aug 2013 23:03:14 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id
	qf7sm57823505pac.14.2013.08.14.23.03.13 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 14 Aug 2013 23:03:13 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Aug 2013 23:02:28 -0700
Message-Id: <1376546549-2137-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH 1/2] uclibc: Upgrade to latest on git
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
X-List-Received-Date: Thu, 15 Aug 2013 06:03:14 -0000

It brings fixes needed for python3 to work on uclibc/64bit targets

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/uclibc/uclibc-git.inc | 3 +--
 meta/recipes-core/uclibc/uclibc.inc     | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/uclibc/uclibc-git.inc b/meta/recipes-core/uclibc/uclibc-git.inc
index dab243f..6fca9e4 100644
--- a/meta/recipes-core/uclibc/uclibc-git.inc
+++ b/meta/recipes-core/uclibc/uclibc-git.inc
@@ -1,7 +1,6 @@
-SRCREV="c2c684f88157f8bd0c236c7546f922fbf66b64a1"
+SRCREV="f22cca4722fa66e424562e69f4afa2bca0af871d"
 
 PV = "0.9.33+git${SRCPV}"
-PR = "${INC_PR}.4"
 
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/uclibc-git' ], d)}"
 
diff --git a/meta/recipes-core/uclibc/uclibc.inc b/meta/recipes-core/uclibc/uclibc.inc
index 29bc62b..e2de53c 100644
--- a/meta/recipes-core/uclibc/uclibc.inc
+++ b/meta/recipes-core/uclibc/uclibc.inc
@@ -13,7 +13,7 @@ SECTION = "libs"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 		    file://COPYING.LIB.boilerplate;md5=aaddeadcddeb918297e0e4afc52ce46f \
 file://${S}/test/regex/testregex.c;beginline=1;endline=31;md5=234efb227d0a40677f895e4a1e26e960"
-INC_PR = "r8"
+PR = "r9"
 
 require uclibc-config.inc
 
-- 
1.8.3.4


