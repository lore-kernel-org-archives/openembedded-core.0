Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84553C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 06:45:54 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.3863.1653461153481440615
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 23:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KxO3Q3ck;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653461151; i=@fujitsu.com;
	bh=biuLsYssPD5qqUdu0bBJIbZz49a52Kw+s66mgvJlBlQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=KxO3Q3ckQU5ftwmYDFi4IJcpt/ka6DKrb5rKyAh+1rwnMD6l/h7NKNejiSVSRng62
	 oS8sL9L2BiovRhJFqauBVons1nm3OYiR4ylDA3VxZKapBawYMre5fZFijUwSt6xwC/
	 PNRthxB9lgTqu4CgdMUFlzCoipS46Vic+h7GYoPKTATGzChI7sNU+eEykPZ2lH8+ur
	 g8ZC53MIF8imSlodbNamy9nvtpx3qGxeTjhAWzklSvnvyzVOVHv0NzwNLR53pXykG/
	 dXJsIQ5Z53xeN5VizFBa+SgqDqLzwDAKgGMZKuQKoVwWmduscCGewOxe397WMK0tQi
	 +nfckSrDn0qPg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8ORpDvvQm+
  Swbl1WhZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bPE2+ZCl5zVOzdMYGpgfEdexcjF4eQwANG
  iYcnLzJBOGeYJH6sn8EG4exhlLj4dzNLFyMnB5uAmsT0WzdYuxg5OEQE9CSu/hMFCTMLqEi8+
  N3DDmILCzhJvN48D8xmEVCVePV5CRuIzQsUX/ttPyuILSGgIDHl4XtmiLigxMmZT1gg5khIHH
  zxghmiRlFi9uVmFgi7QmLGjG1sELaaxNVzm5gnMPLPQtI+C0n7AkamVYy2SUWZ6RkluYmZObq
  GBga6hoamQNpY18jQTC+xSjdRL7VUNy+/qCRD11AvsbxYL7W4WK+4Mjc5J0UvL7VkEyMwNFOK
  02/sYNy175feIUZJDiYlUd4TG3qThPiS8lMqMxKLM+KLSnNSiw8xynBwKEnwJp8HygkWpaanV
  qRl5gDjBCYtwcGjJML7AyTNW1yQmFucmQ6ROsWoy3Hs6/f9zEIsefl5qVLivL/OARUJgBRllO
  bBjYDF7CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryCIKt4MvNK4Da9AjqCCeiIfF6wI0o
  SEVJSDUzKpo43uLRyt3Yf7jPh0xY2qU+XOSd+eNJrtszJt2XSPaYuWjw58Oa+ogNbHu5nlG3t
  fPWjd8nTpMm3f5zU4+lR+S9o5G/4aGOhiFkAwxLF/FKzPLGXStbcwjNeSzMYSAavle77KsSUc
  +r+w/Y+c0bH6Yc3LTRyMrh+/qITx6nVudo3Fr/nTdt+Q1tlc7Ohz85Gdsd1VWrNpi2XGC98mi
  nDytQ16bD4Zotvr3k+Sl/6Urhf2XbJhJrOI7+Ou7Q22zY/dj8aw/jTQLrX/oHe897J9wMtv7o
  9iFuU1dHJtVKjOXrm47efD2RKTXaqUQy5+95DpO/9041TL4k+O7IlwerqBRVP510rzwWKlrgV
  3VViKc5INNRiLipOBABWVe50VAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-732.messagelabs.com!1653461150!85534!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3633 invoked from network); 25 May 2022 06:45:50 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 06:45:50 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1CD2CD67
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:45:50 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 119F6B51
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:45:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 07:45:46 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-magic: upgrade 0.4.25 -> 0.4.26
Date: Wed, 25 May 2022 14:45:30 +0800
Message-ID: <1653461133-12463-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 06:45:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166100

Changes to 0.4.26:
  - Use tox for all multi-version testing
  - Fix use of pytest, use it via tox

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-magic_0.4.25.bb => python3-magic_0.4.26.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.25.bb => python3-magic_0.4.26.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.25.bb b/meta/recipes-devtools/python/python3-magic_0.4.26.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-magic_0.4.25.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.26.bb
index efc8b6daaa..89495ecc7c 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.25.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.26.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "21f5f542aa0330f5c8a64442528542f6215c8e18d2466b399b0d9d39356d83fc"
+SRC_URI[sha256sum] = "8262c13001f904ad5b724d38b5e5b5f17ec0450ae249def398a62e4e33108a50"
 
 RDEPENDS:${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.25.1


