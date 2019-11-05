Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 40B427F895
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47739F1qGLz8t
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:44:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572990289;
	bh=fT9NXWW+VsL9ZQgUw6bbtaeBeEvr2xyHwMKzUXLwHNc=;
	h=From:To:Subject:Date:From;
	b=BeonIoZhMk+CiQMIWAy1akMZGXECj0OWeu1TmzdsBhYPtxM1/1X3kkoepe5/RM8xj
	29GUFV+zILt1QDE3iUfyPq8q0idSY1bG1sEMz9waVZ8CsUHbu6POWS4lz6aPNUrAN/
	KTlBglGlXg+BZO4Hj+enpui4BJaF68fz6+58WIrrJvnwkmmGCVbKMLJBtBb7yaotlg
	N8clzFBp2ilzH4Xvm0VWgC6buvf7Dn9CUzK240Rqix8DcgJKrvsLXXDAkeYw9HH7rO
	UGh0T/wMJZtfn59Q26hkD9LPGvXQV2LnszPxhF1+mK4yy261DRnh/2km8yKK7ctcIa
	RiYc/tlwzvrKfLO1fh/tH8uBNbLmcWrYdT2qnBg0vdbIhbYa2Z12lPLyhqQwAJLOIw
	KG3HiSNsAaX+1fI1/nb5/ctJK+txnI9eh9h1zSqW3hMXwiNP3KQqBSas8bH7adpd/E
	bxp1KbgbGcRdimlyszlgIetyfThgHc0FLlF6+W7bQMzd8O1aa41EjTbw6LfiZPo7VR
	kIEnKV2cVReTFlRBNwoio6n9SGTfrHqWj5WDdVfFEcVKe9DFoDnELn9JQgkGsoKSWA
	WK8xsCldsND+EXzw0HWxZlSN91XYG5MEFey2ExlqhqJ1TsLriCuwaoP+Fmg9YIIxNz
	i4BDRS3VajhyUq0Rskgj+xMs=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:44:37 +0200
Message-Id: <20191105214448.2511-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [warrior][PATCH] openssl: set CVE vendor to openssl
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

From: Anuj Mittal <anuj.mittal@intel.com>

Differentiate it from openssl gem for Ruby.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1b.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
index 9e36df807c..13e6ad4db7 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1b.bb
@@ -204,3 +204,5 @@ RREPLACES_openssl-conf = "openssl10-conf"
 RCONFLICTS_openssl-conf = "openssl10-conf"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_PRODUCT = "openssl:openssl"
-- 
2.17.1


