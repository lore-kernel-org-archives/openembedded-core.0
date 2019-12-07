Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id B7C296C4DA
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Dec 2019 23:11:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47VlZZ6rVNz3J
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Dec 2019 00:11:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575760295;
	bh=ZwltAIsRSeBvcxEXzwdxmGiKubhwl6qg9/+hdtp0md0=;
	h=From:To:Subject:Date:From;
	b=qYPJsCkS6KBxTWdkDg8sYZY93Uc9ZcUv5h4INBN2MsAmHzcPUx4IAHrdA6b6kJnC9
	LRCAuZhc2Vl/3D7LDY3aq8bS4d1HADjd3N+oO/ZuECUEDzIsZ+aCG112pbosluOuhz
	XkBmGxrbasFDuibepYwWAQN3hbWGyxbt2QGes3iadJ/pe7j79qDd61bSeE2CuKK9YU
	Q75dvaqc7XoaZwjqI2h884jOFH6d949Jpiw+pD/ZP1ILgPfBGrk1RBVT4omBqxoEnN
	MZLIG9VPWObVfxO5dP4LTn9Kxc4zXdKBtBMFoM8uCGKWfArDfcDUb5gTgAqBq4F9YU
	7kQ6YB+AJa6T+tC84q+rCdyI8tWgIXMQgcDwDVnfZvGNInYWY96l3A2wjbFAQtcgSL
	nVtaiT6GoQ/tqEqxeJQTfsITISWEcva3XiPZHv+aiX3V4ccSz6bLI3qDFM7f8iR4d7
	GG96pL6hDeevn1tvzcraz13yQOdzftscCWIa6wGJbsQz+czjnNdah2q8YTLvtBKSi9
	cFCWvvgyuEmle3Jfhho+ikWZpff6f1KZtol92p1R1riA2ablvhRoZQsOIMTTB3t5QQ
	8dbwGjoSbrZHEGgN2OsFdilSfCyPKTMcgBeGYP3o69gyMbfWpYfsnq/xqVSZZLFMWZ
	BEWO2xbImva+21qQEK15Gyn4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Dec 2019 01:11:34 +0200
Message-Id: <20191207231134.27610-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Sat, 07 Dec 2019 23:11:38 -0000

This is not exploitable when glibc has CVE-2016-10739 fixed,
which is fixed in the upstream version since warrior.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python.inc       | 3 +++
 meta/recipes-devtools/python/python3_3.7.5.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 110ec315d9..19a2f3e743 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -29,6 +29,9 @@ CVE_CHECK_WHITELIST += "CVE-2017-18207"
 # of Python that cannot really be altered at this point."
 CVE_CHECK_WHITELIST += "CVE-2015-5652"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-devtools/python/python3_3.7.5.bb b/meta/recipes-devtools/python/python3_3.7.5.bb
index 57eaaea5e7..da991f5139 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -47,6 +47,9 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "3.7"
 PYTHON_BINABI = "${PYTHON_MAJMIN}m"
 
-- 
2.17.1


