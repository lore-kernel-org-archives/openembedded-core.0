Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B44C7C43334
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 12:27:44 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.31380.1654518455274884667
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 05:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=cOyOPYJx;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1654518453; i=@fujitsu.com;
	bh=q4p3zOfuI9vk+jCozgx1qk5ST6T11fN7er4w280SRqE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=cOyOPYJxKrdn9Sl4SlC1wDBTXbXhbrRuwtSM2vsRoyEVollsrvsS3DZmpl2UIfIXE
	 xBiBiHSWU5dIJZSEGqZhV1RnkYQSLFnl6bZwjf03LUapBaKf+oskgbyCLgyIUzC9zV
	 7TmJJETczmlWbKQqj9EJ8/KOgJsg6Z4Aj2x9+Ux4nTIBmkGWjJUy7Pb8NNfLBF6utX
	 o74yw4m7Hh43nJRK+fPnu744YDhLLWxayYUfyh6iH1uVBd65CGl1YHj91VX/0GgaIE
	 FLOr/8Xrek3MoKl5PpfXIvgeC4lOsqK5s8nw6MDneW6OdqrKMF6ppKzHpHoWZNvW2s
	 DnSStco5rX85g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrOIsWRWlGSWpSXmKPExsViZ8ORpLv109w
  kg6lfOCzu/HzH7sDocW7jCsYAxijWzLyk/IoE1ozNG/+xFDyVrVj++zJrA+MqyS5GLg4hgYeM
  ErMmHmaDcM4ySew7eZMJwtnNKPGk8z9QhpODTUBNYvqtG6xdjBwcIgJ6Elf/iYKEmQVUJF787
  mEHsYUFzCWOzH4HVs4CFN/T38MIYvMKOEq8friNFcSWEFCQmPLwPTNEXFDi5MwnLBBzNCVat/
  9mh7DlJZq3zmaGqFeUmH25mQXCrpCYMWMbG4StJnH13CbmCYwCs5CMmoVk1CwkoxYwMq9itE4
  qykzPKMlNzMzRNTQw0DU0NNU1ttQ1MjTWS6zSTdRLLdUtTy0u0TXSSywv1kstLtYrrsxNzknR
  y0st2cQIDOOUYvWrOxg3r/qpd4hRkoNJSZTX/trcJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSv
  HUfgHKCRanpqRVpmTnAmIJJS3DwKInwWr8DSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy9VSp
  z3OMgMAZCijNI8uBGw+L7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3AcgUnsy8ErhNr4C
  OYAI6wufBHJAjShIRUlINTLOOTnpjtrE8RcST9TZLy9LqxmpdDteQPYKnez8fSldYcdHXY9ON
  tsXZuf/Me7ZaqPTvZSxy0d/i9pwvxDXkiL8wc+Yfzq23M399OMY6V3S/ao7x8krDiDOl5V/nz
  ueS+fX0mViiRPKl0hPfTXf8PPmgZGV/bHvMYpN3z+utbf/OCM5etmfBepMD7R1vcy0Kj7zefX
  /T77mzxVRPzT77q3ov84INVpd/nXx9xI9FXShz+ZcN0VkFxp3VHikLT7N7fF2veGb9lnRZHYE
  Dgq0ZT1/9CuJctUva6MCc502FBxTaeC9PPrxg/t31DFv+nCr04V1rbZ6y50gmJ+OTnDdedtrr
  l8dceZx/4vPMGUkz99grsRRnJBpqMRcVJwIApsm1S2oDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1654518452!98887!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5972 invoked from network); 6 Jun 2022 12:27:33 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 6 Jun 2022 12:27:33 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id C294F8B8B
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:32 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id B4B418B6E
	for <openembedded-core@lists.openembedded.org>;
 Mon,  6 Jun 2022 13:27:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 6 Jun 2022 13:27:26 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] nettle: upgrade 3.7.3 -> 3.8
Date: Mon, 6 Jun 2022 20:27:10 +0800
Message-ID: <1654518434-9263-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 12:27:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166620

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
This release includes a couple of new features, and many
performance improvements. It adds assembly code for two more
architectures: ARM64 and S390x.

The new version is intended to be fully source and binary
compatible with Nettle-3.6. The shared library names are
libnettle.so.8.5 and libhogweed.so.6.5, with sonames
libnettle.so.8 and libhogweed.so.6.

New features:
--------------
* AES keywrap (RFC 3394), contributed by Nicolas Mora.

* SM3 hash function, contributed by Tianjia Zhang.

* New functions cbc_aes128_encrypt, cbc_aes192_encrypt,
  cbc_aes256_encrypt.

  On processors where AES is fast enough, e.g., x86_64 with
  aesni instructions, the overhead of using Nettle's general
  cbc_encrypt can be significant. The new functions can be
  implemented in assembly, to do multiple blocks with reduced
  per-block overhead.

  Note that there's no corresponding new decrypt functions,
  since the general cbc_decrypt doesn't suffer from the same
  performance problem.

Bug fixes:
-------------
* Fix fat builds for x86_64 windows, these appear to never
  have worked.

Optimizations:
----------------
* New ARM64 implementation of AES, GCM, Chacha, SHA1 and
  SHA256, for processors supporting crypto extensions. Great
  speedups, and fat builds are supported. Contributed by
  Mamone Tarsha.

* New s390x implementation of AES, GCM, Chacha, memxor, SHA1,
  SHA256, SHA512 and SHA3. Great speedups, and fat builds are
  supported. Contributed by Mamone Tarsha.

* New PPC64 assembly for ecc modulo/redc operations,
  contributed by Amitay Isaacs, Martin Schwenke and Alastair
  D=C2=B4Silva.

* The x86_64 AES implementation using aesni instructions has
  been reorganized with one separate function per key size,
  each interleaving the processing of two blocks at a time
  (when the caller processes multiple blocks with each call).
  This gives a modest performance improvement on some
  processors.

* Rewritten and faster x86_64 poly1305 assembly.

Known issues:
-------------
* Nettle's testsuite doesn't work out-of-the-box on recent
  MacOS, due to /bin/sh discarding the DYLD_LIBRARY_PATH
  environment variable. Nettle's test scripts handle this in
  some cases, but currently fails the test cases that are
  themselves written as /bin/sh scripts. As a workaround, use

  make check EMULATOR=3D'env DYLD_LIBRARY_PATH=3D$(TEST_SHLIB_DIR)'

Miscellaneous:
--------------
* Updated manual to current makeinfo conventions, with no
  explicit node pointers. Generate pdf version with texi2pdf,
  to get working hyper links.

* Added square root functions for NIST ecc curves, as a
  preparation for supporting compact point representation.

* Reworked internal GCM/ghash interfaces, simplifying assembly
  implementations. Deleted unused GCM C implementation
  variants with less than 8-bit lookup table.


Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/nettle/{nettle_3.7.3.bb =3D> nettle_3.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.7.3.bb =3D> nettle_3.8.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.7.3.bb b/meta/recipes-support/nettle/nettle_3.8.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.7.3.bb
rename to meta/recipes-support/nettle/nettle_3.8.bb
index 889dc74667..0d6562dbce 100644
--- a/meta/recipes-support/nettle/nettle_3.7.3.bb
+++ b/meta/recipes-support/nettle/nettle_3.8.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-target =3D "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] =3D "661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0"
+SRC_URI[sha256sum] =3D "7576c68481c198f644b08c160d1a4850ba9449e308069455b5213319f234e8e6"
 
 UPSTREAM_CHECK_REGEX =3D "nettle-(=3FP<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


