Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6F8608CC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 15:21:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JFRFff029539 for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 16:27:15 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kGzokGlW5_bh
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 16:27:15 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r5JFRAor029535
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT) for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 16:27:11 +0100
Message-ID: <1371655250.20823.196.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 16:20:50 +0100
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] bdwgc-native: Add missing pkgconfig DEPENDS
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
X-List-Received-Date: Wed, 19 Jun 2013 15:21:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This fixes configure errors like:

| configure.ac:70: error: possibly undefined macro: AC_MSG_ERROR
|       If this token and others are legitimate, please use m4_pattern_allow.
|       See the Autoconf documentation.
| configure.ac:358: error: possibly undefined macro: AS_IF

Reproduced with bitbake bdwgc-native pkgconfig-native -c clean; bitbake bdwgc-native

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
index 46e5257..2ba7aa5 100644
--- a/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
+++ b/meta/recipes-support/bdwgc/bdwgc_7.2d.bb
@@ -34,5 +34,5 @@ S = "${WORKDIR}/gc-${REAL_PV}"
 
 ARM_INSTRUCTION_SET = "arm"
 
-inherit autotools
+inherit autotools pkgconfig
 BBCLASSEXTEND = "native nativesdk"



