Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E8FA17FA0C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 17:04:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47znV04fgxz6m
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2020 18:04:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1579280664;
	bh=3G80wBQgu9BhSdIgv4zc+NhJiQSLoYF7dEIl6W/F51U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=avomeTneUqyiRq63g2WHsgIj9QJ9JdLy3e6+kAv7u/8S2Zw24kcIAwX/X53BrNY74
	F++3eR3hYMt0O++mYbKPxRn4jlxRe4dLUhfE5059iSQIdSEYoBNzaqe88ItyffQ6gz
	eG/KoapLU5+S7xPhzeuHglkWecWFPDVRccVs+nQmxFw0CmJAsmrrYOW3pF/BnE/gda
	vLymo36BRcZsEu36ZMNnV5Bdywfbt8xkV8VRCzVJF7fE6gXphFlubdJkjT1hyOPaYn
	Mls7Yljpcv59IyeXr122yMi+lfvYBFUEBMd4UEe8oZwMkm9R2SmAIL/8Jrot3gFTTo
	IB2o2OcqowUVtJoH4CPXIqVI7R0iYLMTTVA331pRzHtaJPPzUByFqRMn2QihI5/4oJ
	3NROiKVPn04OO6pjHMJ2SbLbndBhCCTDeHSNL/DR5xslQC5Eje6kMuMp9GEi2c5qE1
	m/4OsciVREcq7hl6mGuipWymhP/+jXwGYfS370Zw7ghYNrQ0TB61nlIQJQa73swIbF
	1Xfq2UpephY0mIrv/6EfVnHQ5I3mZkKWQdWOBpltUOcFAyvfqZrypNCxESK9FKbCfn
	1HUg5c7chdWQ8bHgPxwf2RGfsrkG/lpQAwxh+R9cefWbYWNOJNakUUFW6AJTlmH2Qb
	bK3wk/ZJx1VkFlh1FcLzIz1w=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Jan 2020 19:04:21 +0200
Message-Id: <20200117170423.2990-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200117170423.2990-1-bunk@stusta.de>
References: <20200117170423.2990-1-bunk@stusta.de>
Subject: [warrior][PATCH] python/python3: Whitelist CVE-2019-18348
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
X-List-Received-Date: Fri, 17 Jan 2020 17:04:24 -0000

This is not exploitable when glibc has CVE-2016-10739 fixed,
which is fixed in the upstream version since warrior.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/python/python.inc       | 3 +++
 meta/recipes-devtools/python/python3_3.7.5.bb | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 5d280dc63b..a2424a67bf 100644
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
index c560c4a29d..c90054d45a 100644
--- a/meta/recipes-devtools/python/python3_3.7.5.bb
+++ b/meta/recipes-devtools/python/python3_3.7.5.bb
@@ -46,6 +46,9 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python"
 
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_WHITELIST += "CVE-2019-18348"
+
 PYTHON_MAJMIN = "3.7"
 PYTHON_BINABI = "${PYTHON_MAJMIN}m"
 
-- 
2.17.1


