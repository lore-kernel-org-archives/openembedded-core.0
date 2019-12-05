Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id CB0FD7F944
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 21:42:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47TThh4y0Hz4s
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 22:42:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1575582148;
	bh=ph2aDioUs4iMcJ/XLikPYvlSWWk62mGDGcDjMvcgFdQ=;
	h=From:To:Subject:Date:From;
	b=r0y26KKbb36IOm+kiulR5wrONSbtpwNrejGhWc3fdaNQak717kmy7hgNLdkNBpkz4
	kKqudP8WSQCvPI+fCDwJV7mLioOvMbeZNmDHEb1plzCHzGFJN9wu+Y9HzUyRmfrXCz
	DOtA5Wszat2AsixAdAD+uPhwWUR2K8KPf9L+jdySIu3dKoR6TI4bzPmh12udxDKw4y
	btrKtbFLFrzjg04pn5ivsoR6jAuCgGE/nuO/wCFBORGiYPRDfVzVHqeIOFBu9sbvgM
	kXHNYQMG6P1QwgwKgZEWjJV6VzScfnfIz1XuZ+mIzt2Q1U6Cv6a3eQtG+iFqUOymza
	W0NKJ6BHzJNSar4B3aWzZUEOUyPag6QGUgDrOaYsivPHaL2VJSoIGpPObkmT6mgSmm
	Qy6vZygs3rtCVlz9vE5NWDLCgC1DT29f70pRfQRESdzSuD46G5c0KQzzlBgPSyxhUu
	dWHCQpt0cJA7Cx4t204gZrdrFLtKrPNoURFJTXm61shiiO++0ifGTohLNJfSGgxcmK
	jwNscwoivD5Xa7vSD6UFTMH//3TsKJDh4KZNgsXnF+osP2GEFs+kN27efS9kxdSeUB
	sonrtGl5NXZhrjpwd1KdPMRG0eg33OW0ah/1wjDw4WFdjtEGhmk9kLMfSZut6/NFqf
	/AgT29u4Hwfir2hBH/B0WG4A=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Dec 2019 23:42:27 +0200
Message-Id: <20191205214227.7842-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] openssl: Whitelist CVE-2019-0190
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
X-List-Received-Date: Thu, 05 Dec 2019 21:42:29 -0000

This is only a problem with older Apache versions.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1d.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
index 8819e19ec4..f653e05acc 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1d.bb
@@ -202,3 +202,7 @@ RDEPENDS_${PN}-ptest += "openssl-bin perl perl-modules bash"
 BBCLASSEXTEND = "native nativesdk"
 
 CVE_PRODUCT = "openssl:openssl"
+
+# Only affects OpenSSL >= 1.1.1 in combination with Apache < 2.4.37
+# Apache in meta-webserver is already recent enough
+CVE_CHECK_WHITELIST += "CVE-2019-0190"
-- 
2.17.1


