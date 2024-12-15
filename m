Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43080E7716A
	for <webhook@archiver.kernel.org>; Sun, 15 Dec 2024 09:30:01 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.33348.1734254985155954521
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Dec 2024 01:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=M+oQ3e9L;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=Vc7MhvDO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010193c9a7164a-0deed5d6-11ce-43b4-886c-e2a7061fdded-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1734254991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=03iyvmbnOIqP27s8H9M11CTi7tZwhRvTvV1cupL53es=;
	b=M+oQ3e9Lb6Kvx/585UFEh/WxIBTcF7ZNmVoS95fEdwvFuksYlBbWD5XRzS/K2J3E
	v50p4/ZwBwlAuVC7BdJba12Ogl3D/+WK0G6PaEm/yFVERoQuW+FECXHBIgenjpjPD9g
	icG3KKYWm0pKp/8x6krZF/cKZKkN8NkXXerxnQbU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1734254991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=03iyvmbnOIqP27s8H9M11CTi7tZwhRvTvV1cupL53es=;
	b=Vc7MhvDOt3YQAIHv3r/tobWwkqorfuENq4VXyb/LOCg8QIwBZYfGuRuXKsWVs+No
	p+Li3SI32ddb2cJUjhPuOloFGxgTVkVbLhb43Hv1yLJ/rnXOa20dwX6m1+4yvnT5AjZ
	3i96tERMcpY/tMBy9to8PXw+iTA3bXcrP3avOKtE=
Content-Type: multipart/mixed; boundary="===============6525522526028793116=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.0.2 SUCCEEDED
Message-ID: <01010193c9a7164a-0deed5d6-11ce-43b4-886c-e2a7061fdded-000000@us-west-2.amazonses.com>
Date: Sun, 15 Dec 2024 09:29:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.12.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Dec 2024 09:30:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208743

--===============6525522526028793116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.0.1-4.0.2.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 415e199c5f349fb392a3a927688a0eedee2fb69b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Dec 2024 09:29:30 +0000
Subject: [PATCH] re2c: upgrade 4.0.1 -> 4.0.2

---
 meta/recipes-support/re2c/{re2c_4.0.1.bb => re2c_4.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.0.1.bb => re2c_4.0.2.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.0.1.bb b/meta/recipes-support/re2c/re2c_4.0.2.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.0.1.bb
rename to meta/recipes-support/re2c/re2c_4.0.2.bb
index b876d2b844..2a0fb197ff 100644
--- a/meta/recipes-support/re2c/re2c_4.0.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.0.2.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7c35d54fdf2c4b5981b80362d1c742aec4d011589673e02f2e9566f7e66c44af"
+SRC_URI[sha256sum] = "5e52ce0e26326115e41bc45d34dc2d5e10f2e44ed3a413fa2a826aa3500c8d56"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.44.1


--===============6525522526028793116==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-re2c-upgrade-4.0.1-4.0.2.patch"

RnJvbSA0MTVlMTk5YzVmMzQ5ZmIzOTJhM2E5Mjc2ODhhMGVlZGVlMmZiNjliIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgRGVjIDIwMjQgMDk6Mjk6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZTJjOiB1cGdyYWRlIDQuMC4xIC0+IDQuMC4yCgotLS0KIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3Jl
MmMve3JlMmNfNC4wLjEuYmIgPT4gcmUyY180LjAuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9yZTJjL3tyZTJjXzQuMC4xLmJiID0+IHJlMmNfNC4wLjIuYmJ9ICg5MCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMC4xLmJiIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjAuMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMC4yLmJiCmluZGV4IGI4NzZkMmI4NDQu
LjJhMGZiMTk3ZmYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180
LjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4wLjIuYmIKQEAg
LTcsNyArNyw3IEBAIExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFO21kNT02NGVjYTRkOGEzYjY3ZjlkYzc2NTYwOTQ3MzFhMmM4ZCIKIAogU1JDX1VSSSA9
ICIke0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICI3YzM1ZDU0ZmRmMmM0YjU5ODFiODAzNjJkMWM3NDJhZWM0
ZDAxMTU4OTY3M2UwMmYyZTk1NjZmN2U2NmM0NGFmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjVl
NTJjZTBlMjYzMjYxMTVlNDFiYzQ1ZDM0ZGMyZDVlMTBmMmU0NGVkM2E0MTNmYTJhODI2YWEzNTAw
YzhkNTYiCiBHSVRIVUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3NrdmFkcmlrL3Jl
MmMvcmVsZWFzZXMiCiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIu
NDQuMQoK

--===============6525522526028793116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/gcc-runtime/gcc-runtime-src: PKGSIZE changed from 9424302 to 9622467 (+2%)
packages/core2-64-poky-linux/re2c: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.0.1/re2c-4.0.1.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.0.2/re2c-4.0.2.tar.xz"
packages/core2-64-poky-linux/re2c: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c-dbg: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 174624408 to 173655544 (-1%)
packages/core2-64-poky-linux/re2c/re2c-dev: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c/re2c-dev: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c-doc: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c/re2c-doc: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c-locale: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c/re2c-locale: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c-src: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.0.1/src/debug -> /usr/src/debug/re2c/4.0.2/src/debug, directory renamed /usr/src/debug/re2c/4.0.1/src/codegen -> /usr/src/debug/re2c/4.0.2/src/codegen, directory renamed /usr/src/debug/re2c/4.0.1/src/nfa -> /usr/src/debug/re2c/4.0.2/src/nfa, directory renamed /usr/src/debug/re2c/4.0.1/src/parse -> /usr/src/debug/re2c/4.0.2/src/parse, directory renamed /usr/src/debug/re2c/4.0.1/src/dfa -> /usr/src/debug/re2c/4.0.2/src/dfa, directory renamed /usr/src/debug/re2c/4.0.1/src/regexp -> /usr/src/debug/re2c/4.0.2/src/regexp, directory renamed /usr/src/debug/re2c/4.0.1/src/cfg -> /usr/src/debug/re2c/4.0.2/src/cfg, directory renamed /usr/src/debug/re2c/4.0.1/src/msg -> /usr/src/debug/re2c/4.0.2/src/msg, directory renamed /usr/src/debug/re2c/4.0.1/src/adfa -> /usr/src/debug/re2c/4.0.2/src/adfa, directory renamed /usr/src/debug/re2c/4.0.1/src/util -> /usr/src/debug/re2c/4.0.2/src/util, directory renamed 
 /usr/src/debug/re2c/4.0.1/src/skeleton -> /usr/src/debug/re2c/4.0.2/src/skeleton, directory renamed /usr/src/debug/re2c/4.0.1/src/options -> /usr/src/debug/re2c/4.0.2/src/options, directory renamed /usr/src/debug/re2c/4.0.1/src/test/range -> /usr/src/debug/re2c/4.0.2/src/test/range, directory renamed /usr/src/debug/re2c/4.0.1/src/encoding -> /usr/src/debug/re2c/4.0.2/src/encoding, removed "/usr/src/debug/re2c/4.0.1/src/default_syntax_zig.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_d.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_c.cc /usr/src/debug/re2c/4.0.1/src/constants.h /usr/src/debug/re2c/4.0.1/src/default_syntax_v.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_go.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_java.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_python.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_js.cc /usr/src/debug/re2c/4.0.1/src/main.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_ocaml.cc /usr/src/debug/re2c/4.0.1/src/default_syntax_haskell.cc /u
 sr/src/debug/re2c/4.0.1/src/default_syntax_rust.cc", added "/usr/src/debug/re2c/4.0.2/src/default_syntax_haskell.h /usr/src/debug/re2c/4.0.2/src/default_syntax_rust.h /usr/src/debug/re2c/4.0.2/src/default_syntax_c.h /usr/src/debug/re2c/4.0.2/src/constants.h /usr/src/debug/re2c/4.0.2/src/default_syntax_d.h /usr/src/debug/re2c/4.0.2/src/default_syntax_ocaml.h /usr/src/debug/re2c/4.0.2/src/default_syntax_python.h /usr/src/debug/re2c/4.0.2/src/default_syntax_v.h /usr/src/debug/re2c/4.0.2/src/default_syntax_java.h /usr/src/debug/re2c/4.0.2/src/default_syntax_zig.h /usr/src/debug/re2c/4.0.2/src/default_syntax_go.h /usr/src/debug/re2c/4.0.2/src/default_syntax_js.h /usr/src/debug/re2c/4.0.2/src/main.cc"
packages/core2-64-poky-linux/re2c/re2c-src: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c-src: PKGSIZE changed from 1675916 to 1675689 (-0%)
packages/core2-64-poky-linux/re2c/re2c-staticdev: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c: PV changed from "4.0.1" to "4.0.2"
packages/core2-64-poky-linux/re2c/re2c: PKGV changed from 4.0.1 [default] to 4.0.2 [default]
packages/core2-64-poky-linux/re2c/re2c: PKGSIZE changed from 11091788 to 11090908 (-0%)

--===============6525522526028793116==--

