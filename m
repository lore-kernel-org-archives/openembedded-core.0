Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.2115.1620949520561464856
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 16:45:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OM1OLQRw;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1620949518; i=@fujitsu.com;
	bh=+LkoVp93IHkGrDdRBfJVUIX+AAGLiHafr5fFEnBM2pY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OM1OLQRwP19zz1CIpmWhG3ZSkkDFZHim+y5NFSAUSPV+T1j7W5quf21t+m2ktG7AC
	 6kLG7GjsCH5dn1GLmIuLpU544j8+w0QCdIKdRT6yBtuwceR7noh4m9/XcrjhDCYDym
	 hc4igKO1WVu5vp3wKKxi3CXg2i3kBB4HHjAwsBZ/rY9NAtYmfSzaIqE+YdO9vEB6Vw
	 VV02VZX36n8D2PC7hE1M+RGFfKHRjFeNJ/uSfqrxDobjQTQuKh2GHzrkxDw6pey8+M
	 0aFkA/LPCLpe4k4eBGrhYd7oWaGzQj9xy7Nyn+5wJ2325XKhOzOWTwNhmuIQRRhdji
	 99wYsNwH/WpNQ==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.symcld.net id D2/C5-63525-D0ABD906; Thu, 13 May 2021 23:45:17 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MxVZd319w
  Eg9nThC3u/HzH7sDocW7jCsYAxijWzLyk/IoE1owPK1YwF/RxVtze3sTYwLiRo4uRi0NIYBaT
  xKKzX5ghnOOMEht6d7B0MXJysAmoSUy/dYO1i5GDQ0RAT+LqP1GQMLOAisSL3z3sIGFhASeJj
  sl8IGEWAVWJs0efMYHYvAKOEleb25hBbAkBBYkpD98zQ8QFJU7OfMICMUZC4uCLF1A1ihKzLz
  ezQNgVEq8PX2KewMg7C0nLLCQtCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrpmhrqJVbpJuq
  lluomp+aVFCUCJfUSy4v1iitzk3NS9PJSSzYxAoMrpZDJeAfjtdcf9A4xSnIwKYnynvScnSDE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgtd859wEIcGi1PTUirTMHGCgw6QlOHiURHizdgCleYsLE
  nOLM9MhUqcYFaXEeSeCJARAEhmleXBtsOi6xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY1w
  FkCk9mXgnc9FdAi5mAFt+YPgtkcUkiQkqqgWnNg7j5Mo9zv04Jin29/fjFX3eWOKUyZRedVP7
  RViX7ZZpMTVOXT/7WM8//tfwvi8wQ+rz/i375Mq8knbln0qerZ31a+rDR8+2r629WVEhc2B85
  dQUTizW326Y4Oy2ZbquI/62ms9O+3ngh4Glo8rBu9v9647qOxYZ1/qkzfaKXfTy2mXdyhKg4Z
  ynLMYkVBnvb5y8IX/zIbCb7sqNsvxYm/QnpsNv03+h0CM+mSx7nWFtS/r2T2XPdNJF9XtKkhy
  skq/ye5xe0i5csPhF9K6b1pPuRIz/SOY4k7g38LSVxZAr3Z9UH0zfFXuszCTrAezbbQWD6j6s
  uS/xmCq1nu12os3s2x592RaeYOEP9My1KLMUZiYZazEXFiQAweLPrKQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-13.tower-228.messagelabs.com!1620949516!326433!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16490 invoked from network); 13 May 2021 23:45:17 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-13.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 13 May 2021 23:45:17 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14DNjBv2000496
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 May 2021 00:45:16 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 14 May 2021 00:45:09 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-attrs: upgrade 20.3.0 -> 21.2.0
Date: Fri, 14 May 2021 07:44:58 +0800
Message-ID: <1620949499-3981-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-attrs_20.3.0.bb => python3-attrs_21.2.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-attrs_20.3.0.bb => python3-attrs_21.2.0.bb} (74%)

diff --git a/meta/recipes-devtools/python/python3-attrs_20.3.0.bb b/meta/recipes-devtools/python/python3-attrs_21.2.0.bb
similarity index 74%
rename from meta/recipes-devtools/python/python3-attrs_20.3.0.bb
rename to meta/recipes-devtools/python/python3-attrs_21.2.0.bb
index 55cfda7180..f8ae2d2b98 100644
--- a/meta/recipes-devtools/python/python3-attrs_20.3.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_21.2.0.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
 
-SRC_URI[sha256sum] = "832aa3cde19744e49938b91fea06d69ecb9e649c93ba974535d08ad92164f700"
-SRC_URI[md5sum] = "4fe38f89297b2b446d83190fce189f29"
+SRC_URI[sha256sum] = "ef6aaac3ca6cd92904cdd0d83f629a15f18053ec84e6432106f7a4d04ae4f5fb"
+SRC_URI[md5sum] = "06af884070d9180694becdb106e5cd65"
 
 inherit pypi setuptools3
 
-- 
2.25.1

