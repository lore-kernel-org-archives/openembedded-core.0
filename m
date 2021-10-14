Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84CBC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 01:23:29 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web11.3641.1634174608562302977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Oct 2021 18:23:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=zBDCn8GF;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634174606; i=@fujitsu.com;
	bh=3oDC8DTTMM7zVGh4a60bs2qhlVwuCCRA27o6lIk6yLI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=zBDCn8GFay6QDWrsfvYqAE60oXn8xlktBj92CNlThs7dBJFLdBKQcSfjKop1ydhg9
	 al/TC/aCNwkJ09brunLojWwgmYvXZSdBiqjzvWpBjEw3vF/wJMxCg3mWTuXvwiBXD3
	 bNGJzNxaKcVZvCRRX5DJTF67TW/VpTyFgILeCSxoUyWe09PNVTwhvT5Ja3u408OByo
	 Q6hk43ls0dSkKhpvZkh4C7iZaAH6svgE6ecpcGZmBbYUxVpfIorU0OwCkqq0QTtlOp
	 6bKfdlaWIIgxb0h2mRIIamILKqctQUO3Ncs80mbQrRmg5LSLKfvd5FtJK18l0zfWnd
	 Is8Gm2HGVW5kA==
Received: from [100.113.0.18] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id BA/CF-11692-E8687616;
 Thu, 14 Oct 2021 01:23:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkkeJIrShJLcpLzFFi42Kxs+EI1e1rS08
  0OD6PxeLOz3fsDowe5zauYAxgjGLNzEvKr0hgzbi7dA5jwVmJiivPTrE1MO4Q62Lk4hASmMUk
  8erIbSYIZw+jRPu/K6xdjJwcbAK6Eucer2XvYuTgEBHQk7j6TxQkLCzgKfHv8VQWkDCLgKrE/
  KsGIGFeAXeJDQ9fs4PYEgIKElMevmeGiAtKnJz5hAXEZhaQkDj44gUzSKuEgKLE7OnyEOUVEq
  8PX2KewMgzC0nHLCQdCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa6xrpmhrqJVbpJuqlluomp+a
  VFCUCJfUSy4v1iitzk3NS9PJSSzYxAkMopZDJeAfjtdcf9A4xSnIwKYnyqhelJwrxJeWnVGYk
  FmfEF5XmpBYfYpTh4FCS4HVvAcoJFqWmp1akZeYAwxkmLcHBoyTC6w2S5i0uSMwtzkyHSJ1iV
  JQS581oBUoIgCQySvPg2mAxdIlRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMC8fyBSezLwSuO
  mvgBYzAS0OjEoBWVySiJCSamCSNlklLyP368T+p74nosSyP91c5c2S3u/5b23D/l9p261VpZt
  tkmZNU89d3Rm0erWRu/33xa2tcm6M285/XbO82He65s6OuburWjyqTc9v8coWV/RnyGJYHp2d
  aRUnk3nKTfuY44WTkSaX9nyI5VzD/bis+sfcE3HcfDKOv/MvXmNb61/y8yXzBYdfH3+yvfr7w
  04t2Oz+NYHnETF8G9urfj2+vPH8e7druz6uUyu2a5/DvYltz50uto3ehb9676Tayh65G6K9U9
  F/0/+TosxX/12K3bHYZW/IgcQTh0zdD5/ZO/9lQPFOmXSzGTz1HzWSD6U6bp0oczKMyf33JL9
  FH1dskEqvtWBP+LFt37UgJZbijERDLeai4kQAQV6iiRwDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-16.tower-228.messagelabs.com!1634174605!1445626!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24478 invoked from network); 14 Oct 2021 01:23:26 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-16.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 01:23:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 19E1NKGj030341
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Oct 2021 02:23:25 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 02:23:19 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core] [PATCH] python3-pycryptodome: upgrade 3.10.1 -> 3.11.0
Date: Thu, 14 Oct 2021 18:23:12 +0800
Message-ID: <1634206992-7759-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Oct 2021 01:23:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156927

3.11.0 (8 October 2021)
Resolved issues
GH#512: Especially for very small bit sizes,
Crypto.Util.number.getPrime() was occasionally generating primes
larger than given the bit size. Thanks to Koki Takahashi.
GH#552: Correct typing annotations for PKCS115_Cipher.decrypt().
GH#555: decrypt() method of a PKCS#1v1.5 cipher returned a bytearray
instead of bytes.
GH#557: External DSA domain parameters were accepted even when the
modulus (p) was not prime. This affected
Crypto.PublicKey.DSA.generate() and Crypto.PublicKey.DSA.construct().
Thanks to Koki Takahashi.

New features
Added cSHAKE128 and cSHAKE256 (of SHA-3 family).
Thanks to Michael Schaffner.
GH#558: The flag RTLD_DEEPBIND passed to dlopen() is not well
supported by address sanitizers. It is now possible to set the
environment variable PYCRYPTDOME_DISABLE_DEEPBIND to drop that flag
and allow security testing.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb  | 5 -----
 meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb  | 5 +++++
 ...cryptodomex_3.10.1.bb => python3-pycryptodomex_3.11.0.bb} | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb
 rename meta/recipes-devtools/python/{python3-pycryptodomex_3.10.1.bb => python3-pycryptodomex_3.11.0.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
deleted file mode 100644
index 28448b84fe..0000000000
--- a/meta/recipes-devtools/python/python3-pycryptodome_3.10.1.bb
+++ /dev/null
@@ -1,5 +0,0 @@
-require python-pycryptodome.inc
-inherit setuptools3
-
-SRC_URI[sha256sum] = "3e2e3a06580c5f190df843cdb90ea28d61099cf4924334d5297a995de68e4673"
-
diff --git a/meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb b/meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb
new file mode 100644
index 0000000000..b0e37178e0
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pycryptodome_3.11.0.bb
@@ -0,0 +1,5 @@
+require python-pycryptodome.inc
+inherit setuptools3
+
+SRC_URI[sha256sum] = "428096bbf7a77e207f418dfd4d7c284df8ade81d2dc80f010e92753a3e406ad0"
+
diff --git a/meta/recipes-devtools/python/python3-pycryptodomex_3.10.1.bb b/meta/recipes-devtools/python/python3-pycryptodomex_3.11.0.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-pycryptodomex_3.10.1.bb
rename to meta/recipes-devtools/python/python3-pycryptodomex_3.11.0.bb
index 2d929f11d0..f1132c21ac 100644
--- a/meta/recipes-devtools/python/python3-pycryptodomex_3.10.1.bb
+++ b/meta/recipes-devtools/python/python3-pycryptodomex_3.11.0.bb
@@ -1,7 +1,7 @@
 require python-pycryptodome.inc
 inherit setuptools3
 
-SRC_URI[sha256sum] = "541cd3e3e252fb19a7b48f420b798b53483302b7fe4d9954c947605d0a263d62"
+SRC_URI[sha256sum] = "0398366656bb55ebdb1d1d493a7175fc48ade449283086db254ac44c7d318d6d"
 
 FILES:${PN}-tests = " \
     ${PYTHON_SITEPACKAGES_DIR}/Cryptodome/SelfTest/ \
-- 
2.25.1


