Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 919DB7FA0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:04:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znV01q65z5d
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280664;
	bh=idY/6/k9nENk224QN5Lx2Q/o9A4nOJv+gn4d7puiDw8=;
	h=From:To:Subject:Date:From;
	b=ItgJVnCsq/NxiZihLzYnvRc4dC6Wq16KYalOAxFgqsTLt5BVZcxmicVRVVxA3cw3s
	gCdQeX1J6Rj6ok+qyP9M5N5J5LFJVVMQtRi/V/1G7UE+NvDwC6/EEUboFjyvPC0Vz0
	/OqRwekfYmbcBYveXleDwy3ezZWkUV7Y7fKDCrRHAhz0KsUo0SufFc+o60ApwCrhJY
	QYqX+uRJdIg3Cq1lz7f4Kl1w2PGiy5EDqcuhvlRYd7klRALNAJ4g1sQ4KqtIYLUvX/
	/UmvqdHf7Bvk/GxqcGrQuvgo/Scks1gYi5JDgIniwj6u1hRN6M1iaBoNSZ4bShNr8+
	EIL0bxlyfFEi+wj+Dp90YMvKjuHxfqXozygJQLRtVJPIKpeLvii3T1BVqGXtaZFsJC
	8wa3BsIqOHlUNm0yHIr7iDMC4tPKfpv3RTA6lchlRpWGtfl5VzxUHg6xeme2j6D16a
	AJ3Vq/GLhWwJ1SIsFB5KDfy04RxdVaLQ9W2q4AjE32YU0hRdt2zRxjZC2bPVwbcRTh
	V9lhN4AsjbCP4B55jLhxCHdF7TrJw+WrrBMTkqlMYHHxWVBBZMkJ70RHGMA8VsoDOg
	0id4kOmGoWsvtbVpRC0g6l9ycE4DQ77rcuuwviRTVV4RI50BiKKDp2qmTUMX7nwZjQ
	lPIqQX1cpEVDcaV1425LM2JM=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:04:20 +0200
Message-Id: <20200117170423.2990-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] python: Whitelist CVE-2017-17522 CVE-2017-18207 CVE-2015-5652
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
X-List-Received-Date: Fri, 17 Jan 2020 17:04:23 -0000

One Windows-only CVE that cannot be fixed, and two CVEs
where upstream agreement is that they are not vulnerabilities.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index b093ea6f09..5d280dc63b 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -19,6 +19,16 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>2(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# Upstream agreement is that these are not security issues:
+# https://bugs.python.org/issue32367
+CVE_CHECK_WHITELIST += "CVE-2017-17522"
+# https://bugs.python.org/issue32056
+CVE_CHECK_WHITELIST += "CVE-2017-18207"
+
+# Windows-only, "It was determined that this is a longtime behavior
+# of Python that cannot really be altered at this point."
+CVE_CHECK_WHITELIST += "CVE-2015-5652"
+
 PYTHON_MAJMIN = "2.7"
 
 inherit autotools pkgconfig
-- 
2.17.1


