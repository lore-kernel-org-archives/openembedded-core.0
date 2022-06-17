Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41C78C43334
	for <webhook@archiver.kernel.org>; Fri, 17 Jun 2022 01:38:27 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.25606.1655429904358750121
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jun 2022 18:38:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PLLkv7mM;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655429902; i=@fujitsu.com;
	bh=+iFiByDbHX9oe8wOzjoufnYJ0sWbS2uxpqLQtzaGZhE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=PLLkv7mM0lC7d7KyWn26a0ZdAocQrHPpxjYywrDZ7XF0Fz/zHKh8LZ9Ddl7+DuwtY
	 qSRa4FiHE2TUmUxNX0DnPYFgYooPs2qrHdnKn49WcVKzxjsHb01QlpDFL+6CWLFqGf
	 1rOEi3Xl1P6cD+jeWg2D08FjOrfscQMOMYNiIatkmwEeZXuiQXhb4mlkNJOtHkUSNt
	 tp+3Kow+vQ8IWTz2Y4YZllNoPwbtKWeLjRVPhcf2e2ADIZQY2vLskMNlCyFqJM+enx
	 J2IS173B9dlVEbclmiZQZVn0VkX4sVOBAD5KOtiBaYUTb4Zl17IEUHGzRfOrUPKy7W
	 gzuhKFnmlCQ4A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpMtze3W
  SQfMXDYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePqzTdMBU2cFQ9n7mFtYOzi6GLk5BASeMAo
  8eKKYxcjF5B9hkni9fHjbBDOSUaJYxN2sIFUsQmoSzy++Zqxi5GDQ0RAT+LqP1GQMLOAqkT3x
  TXsILawgJPEuyPzwWwWoHjTlG0sIDavgLvEul/nmUBsCQEFiSkP3zODjOEU8JDY/koU4gZ3iY
  P7LrBBlAtKnJz5hAVivITEwRcvmCFalSROrPgINaZC4vXhS1BxNYmr5zYxT2AUnIWkfRaS9gW
  MTKsYbZOKMtMzSnITM3N0DQ0MdA0NTYG0ka6hqbFeYpVuol5qqW5eflFJhq6hXmJ5sV5qcbFe
  cWVuck6KXl5qySZGYBinFKfN3MG4Zd8vvUOMkhxMSqK8WsdXJwnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4H10AygnWJSanlqRlpkDjCmYtAQHj5IIr/1loDRvcUFibnFmOkTqFKMux8yvbQeYhV
  jy8vNSpcR5r94EKhIAKcoozYMbAYvvS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEedlApvB
  k5pXAbXoFdAQT0BGN+1aAHFGSiJCSamBy5lPl+TRLd7Zvc5PVnLN7nrppv2g/bvnB8XJv3aYX
  NW+/cXaeEin89Kx9kdsjm3kJYTYVpS5ej4JvnWS8+zJvXVaLiW7ygmD/2i2b7r/iev+kRvCm+
  NcAU/6yH5djMvgb4pOOpinNt/t4nMdHlT23/cFNbvsk/a3n1uX/VerdbVRdX+HrJnxDRsrbS7
  zkHG9rtOIO5j2n+j992jRD3+2CSGdr+PvDb+w3/41oDireHSlVeO30rgYVjuvyn3XX/Hy/K75
  Tbr6/89/G02E+Tz7PUzFIcDnbEvJ74rborTfk12eI7DC4k/Nj8+si5uLbFed5hLpzXu5vMpY7
  pfg0R+VjvU60+uQ9Oeut9L4xcSmxFGckGmoxFxUnAgANN7v+agMAAA==
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-732.messagelabs.com!1655429900!62297!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1667 invoked from network); 17 Jun 2022 01:38:20 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-3.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 17 Jun 2022 01:38:20 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 1A2B81AF
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:38:20 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 0F2541AB
	for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jun 2022 02:38:20 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 17 Jun 2022 02:38:00 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [OE-core] [PATCH] python3-magic: upgrade 0.4.26 -> 0.4.27
Date: Fri, 17 Jun 2022 09:37:50 +0800
Message-ID: <1655429870-19507-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655429870-19507-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1655429870-19507-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Jun 2022 01:38:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167012

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changes to 0.4.27:
  - remove spurious pyproject.toml that breaks source builds

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-magic_0.4.26.bb => python3-magic_0.4.27.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-magic_0.4.26.bb => python3-magic_0.4.27.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-magic_0.4.26.bb b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-magic_0.4.26.bb
rename to meta/recipes-devtools/python/python3-magic_0.4.27.bb
index 89495ecc7c..be58cdb71a 100644
--- a/meta/recipes-devtools/python/python3-magic_0.4.26.bb
+++ b/meta/recipes-devtools/python/python3-magic_0.4.27.bb
@@ -11,7 +11,7 @@ PYPI_PACKAGE = "python-magic"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8262c13001f904ad5b724d38b5e5b5f17ec0450ae249def398a62e4e33108a50"
+SRC_URI[sha256sum] = "c1ba14b08e4a5f5c31a302b7721239695b2f0f058d125bd5ce1ee36b9d9d3c3b"
 
 RDEPENDS:${PN} += "file \
                    ${PYTHON_PN}-ctypes \
-- 
2.25.1


