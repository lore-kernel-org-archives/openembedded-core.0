Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 3FC156D147
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739F5HTjzHg
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990289;
	bh=NULK/Y2BKfH/AafT8wCteR+98OOVr9xAxf2ih2ZOV5A=;
	h=From:To:Subject:Date:From;
	b=Oav0fkKfO5pcLnyWU5GC4hN1XqfbWe/lTRmFyHKVcmONUhSA0CzDipcUEybEbUSSU
	qCjxox2+v5r/XwgBPWCxR3iHzX4Es3CIuei8yIsIcq9eLAcI6mv/xxiNWbs8e9bLZx
	Ak2go9nWdnuFFJfXZBmivzfXu9WPbmiS9TBd5fjbixdyyNaLbHW/2s1BXsO2pqSqik
	XWaLK8nuaApNZ5f/VrTZhVpma48+EiLVQb2w0nEN/xx0FIZeBPmDFYHxxTEpoI0+lx
	SmNKpikIdXgqnvjBg/A8X7mQq4I6SEtvC3tpzdpfMaO/hdf7KdnH//n9yLsNWeKJD7
	Gg8HcJgkies+7OkR2E7G6a/2duQfBJztsfRzNWTPU70p3VzvL58CsTnlXnxKXZyiW/
	snS3LoMAfLp1rvNUWnqiXmDVkNM/Ga7IR0gm2V07xndxmLePIjnJGAoMFtCl8ffbyz
	Vs4UAzrfxGfH6yi+z+AS/QboO7deMEVGZfdEy2Ja4mpfdZVhvB9nm3RHjhe1CjIQrM
	w+c8BgKPyNDS14+Tc8V7ZG3ZkJ6JCmRuek3g/NDUs8VrSoTq94vHe7/X4ewATcZhPK
	yzWXUppVbuAUiJseKYw7oDDWzuL51Bwuho9n94MvrAelnwnGDY+DAwLac1QTY+5Th5
	tbuDim5bhHWsqzB+kXJIdsL4=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:38 +0200
Message-Id: <20191105214448.2511-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] flex: set CVE_PRODUCT to include vendor
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
X-List-Received-Date: Tue, 05 Nov 2019 21:44:49 -0000

From: Ross Burton <ross.burton@intel.com>

There are many projects called Flex and they have CVEs, so also set the vendor
to remove these false positives.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-devtools/flex/flex_2.6.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/flex/flex_2.6.0.bb b/meta/recipes-devtools/flex/flex_2.6.0.bb
index b477cd8c7f..12ce0cb461 100644
--- a/meta/recipes-devtools/flex/flex_2.6.0.bb
+++ b/meta/recipes-devtools/flex/flex_2.6.0.bb
@@ -68,3 +68,6 @@ do_install_ptest() {
 	    -e 's/^builddir = \(.*\)/builddir = ./' -e 's/^top_builddir = \(.*\)/top_builddir = ./' \
 	    -i ${D}${PTEST_PATH}/Makefile
 }
+
+# Not Apache Flex, or Adobe Flex, or IBM Flex.
+CVE_PRODUCT = "flex_project:flex"
-- 
2.17.1


