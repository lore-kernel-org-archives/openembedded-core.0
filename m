Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id E163A7F870
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 19:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TQjq6wc1z40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 20:28:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575574096;
	bh=4HvIdVQaV7QYrgjb2MAFZshxsiQsTxbugBhFtf3WffA=;
	h=From:To:Subject:Date:From;
	b=HLdZH7BYLBCKTm4vsfA1Jsu15RfxrUWXp7Egh+moDCPMlCy95Y0gGc9B73pyui+vI
	iyCxXi5rVSZTsujhpdwKl5BB3rx1la9UfH4nB5bOgWu0yjW2nX2LvgzgPdRKf3JdPf
	XVA9ifm9ORHs0qDccrK9/m7Nd6+XhHyVTc4JP47Ix5XCS4DR3ZrSN4H9Qi0W6ZjRTS
	xu4n+Pe0HC7lJ2C1bmrguA1IfAlC5EQm570DZJSppK8y6hQv2yepqOyNiBwkz8oTuk
	cC4byV7arNwAwg13uu1jPa5vEILNrvhjLf3mtO+yaf7H9pwE7r8sjg7F0rO8TyPs7n
	UeSxulX8bW3FDI8FyqfQ2anUeMNTPbt0ogqem1O52rRKsCUHwy0EWluXAOUDwWunrd
	Pbz1M3P3oiyl8hQPGtYjaIxiV6va7QNR9TBNX8ll1sgL4yNBTMk+jNK2qU8IS7u9ac
	ibj40dccQPH8c3rVCw3amzYAPlwgwv4BabrFFa+PhTATP5VYjQeGbU6Ype1/SWI4Nm
	4H08wif9baT8qYo1fWAILE7mLLqF/SwUFz0BmmDCHTj0bUkD9HA3rzws+BT1k6GVZ2
	JH5usIrY1tsTL9k0Aj6toum99hT298fbNIx8a3wunJq1CrlD7Eb8LA0/uvAs676z36
	g6LJ9jZVmq8/G3s/vk8mTzZU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 21:28:13 +0200
Message-Id: <20191205192814.18201-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] python: Whitelist CVE-2017-17522 CVE-2017-18207 CVE-2015-5652
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
X-List-Received-Date: Thu, 05 Dec 2019 19:28:18 -0000

One Windows-only CVE that cannot be fixed, and two CVEs
where upstream agreement is that they are not vulnerabilities.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/python/python.inc | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index a630c26e89..110ec315d9 100644
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


