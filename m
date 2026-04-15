Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00E0BF43853
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:58 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19806.1776261867822313060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=3LgX6Owi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=u27FKPcn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d9175954e-80181fa3-0b3a-4fc5-bf59-0725db5617af-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=dV9+Npzh8M1LahacS0l7X2kM3b/VHYhCncI5agOfG/Y=;
	b=3LgX6Owid9VPcQ/bE+lmOnxZlgqYa1K//aYc1AKIc/5YrYjo6f7kQTyYrQJ0RyNp
	VpmCBsW39U/XJkO3mouO4V70z8dvk/FVw00hL6uBoKuVb5EG/YeiNA1lgUxVD88W8a8
	U3avaHJJqJ0w2d3MZqL4y/X3Q973xPTWUln8yrXc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261895;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=dV9+Npzh8M1LahacS0l7X2kM3b/VHYhCncI5agOfG/Y=;
	b=u27FKPcnR72yT0i8LgUvkBDY6ok0YBUJmwtGpv8j4HVbllKQFo0Z0PNooH7jMpqF
	r1jkmiCcDPQm0Xf8jGg6ChmN5vzvNjuTttupjGG6V/NstwyyJOT5lHsD5tMMxcHVvtN
	BlSgje5lPT/igcb4OQiTRa3tPIF3HOZt6CippV2M=
Content-Type: multipart/mixed; boundary="===============4665954167243613116=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.5.1 SUCCEEDED
Message-ID: <0101019d9175954e-80181fa3-0b3a-4fc5-bf59-0725db5617af-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235302

--===============4665954167243613116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.5.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.4-4.5.1.patch
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
From c8ecd7134a2fc2dea55f3ebd2fe8db6c0377b3f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 13:49:11 +0000
Subject: [PATCH] re2c: upgrade 4.4 -> 4.5.1

---
 meta/recipes-support/re2c/{re2c_4.4.bb => re2c_4.5.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.4.bb => re2c_4.5.1.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.4.bb b/meta/recipes-support/re2c/re2c_4.5.1.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.4.bb
rename to meta/recipes-support/re2c/re2c_4.5.1.bb
index 3be66d1388..08b62dc6a7 100644
--- a/meta/recipes-support/re2c/re2c_4.4.bb
+++ b/meta/recipes-support/re2c/re2c_4.5.1.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "6b6b865924447ef992d5db4e52fb9307e5f65f26edd43efa91395da810f4280a"
+SRC_URI[sha256sum] = "ffea067c11aa668bcb42885be6e6cd000302000b7747d2bb213299ec66b7864e"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============4665954167243613116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/re2c/re2c: FILELIST: added "/usr/share/re2c/stdlib/unicode_properties.re /usr/share/re2c/stdlib/unicode_blocks.re"
Changes to packages/x86-64-v3-poky-linux/re2c (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added

--===============4665954167243613116==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.4-4.5.1.patch"

RnJvbSBjOGVjZDcxMzRhMmZjMmRlYTU1ZjNlYmQyZmU4ZGI2YzAzNzdiM2Y3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMTM6NDk6MTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZTJjOiB1cGdyYWRlIDQuNCAtPiA0LjUuMQoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJj
L3tyZTJjXzQuNC5iYiA9PiByZTJjXzQuNS4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1zdXBwb3J0
L3JlMmMve3JlMmNfNC40LmJiID0+IHJlMmNfNC41LjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEv
bWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuNC5iYiBiL21ldGEvcmVjaXBlcy1zdXBw
b3J0L3JlMmMvcmUyY180LjUuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBt
ZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC40LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC41LjEuYmIKaW5kZXggM2JlNjZkMTM4OC4uMDhiNjJkYzZh
NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuNC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC41LjEuYmIKQEAgLTcsNyArNyw3IEBA
IExJQ0VOU0UgPSAiUEQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT02
NGVjYTRkOGEzYjY3ZjlkYzc2NTYwOTQ3MzFhMmM4ZCIKIAogU1JDX1VSSSA9ICIke0dJVEhVQl9C
QVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vJHtCUE59LSR7UFZ9LnRhci54eiIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI2YjZiODY1OTI0NDQ3ZWY5OTJkNWRiNGU1MmZiOTMwN2U1ZjY1ZjI2ZWRkNDNl
ZmE5MTM5NWRhODEwZjQyODBhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImZmZWEwNjdjMTFhYTY2
OGJjYjQyODg1YmU2ZTZjZDAwMDMwMjAwMGI3NzQ3ZDJiYjIxMzI5OWVjNjZiNzg2NGUiCiBHSVRI
VUJfQkFTRV9VUkkgPSAiaHR0cHM6Ly9naXRodWIuY29tL3NrdmFkcmlrL3JlMmMvcmVsZWFzZXMi
CiAKIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIG5hdGl2ZXNkayIKLS0gCjIuNDcuMQoK

--===============4665954167243613116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.4/re2c-4.4.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.5.1/re2c-4.5.1.tar.xz"
packages/x86-64-v3-poky-linux/re2c: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 197102904 to 198021632 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-dbg: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-dev: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1850085 to 1851284 (+0%)
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-doc: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-locale: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.4/src/options -> /usr/src/debug/re2c/4.5.1/src/options, directory renamed /usr/src/debug/re2c/4.4/src -> /usr/src/debug/re2c/4.5.1/src, directory renamed /usr/src/debug/re2c/4.4/src/msg -> /usr/src/debug/re2c/4.5.1/src/msg, directory renamed /usr/src/debug/re2c/4.4/src/adfa -> /usr/src/debug/re2c/4.5.1/src/adfa, directory renamed /usr/src/debug/re2c/4.4/src/dfa -> /usr/src/debug/re2c/4.5.1/src/dfa, directory renamed /usr/src/debug/re2c/4.4/src/util -> /usr/src/debug/re2c/4.5.1/src/util, directory renamed /usr/src/debug/re2c/4.4/src/skeleton -> /usr/src/debug/re2c/4.5.1/src/skeleton, directory renamed /usr/src/debug/re2c/4.4/src/regexp -> /usr/src/debug/re2c/4.5.1/src/regexp, directory renamed /usr/src/debug/re2c/4.4/src/nfa -> /usr/src/debug/re2c/4.5.1/src/nfa, directory renamed /usr/src/debug/re2c/4.4/src/cfg -> /usr/src/debug/re2c/4.5.1/src/cfg, directory renamed /usr/src/debug/re2c/4.4/s
 rc/parse -> /usr/src/debug/re2c/4.5.1/src/parse, directory renamed /usr/src/debug/re2c/4.4/src/debug -> /usr/src/debug/re2c/4.5.1/src/debug, directory renamed /usr/src/debug/re2c/4.4/src/codegen -> /usr/src/debug/re2c/4.5.1/src/codegen, directory renamed /usr/src/debug/re2c/4.4/src/test/range -> /usr/src/debug/re2c/4.5.1/src/test/range, removed "/usr/src/debug/re2c/4.4/src/encoding/ebcdic.h /usr/src/debug/re2c/4.4/src/encoding/ebcdic.cc /usr/src/debug/re2c/4.4/src/encoding/utf16.h /usr/src/debug/re2c/4.4/src/encoding/range_suffix.cc /usr/src/debug/re2c/4.4/src/encoding/utf16.cc /usr/src/debug/re2c/4.4/src/encoding/enc.h /usr/src/debug/re2c/4.4/src/encoding/enc.cc /usr/src/debug/re2c/4.4/src/encoding/range_suffix.h /usr/src/debug/re2c/4.4/src/encoding/utf8.cc /usr/src/debug/re2c/4.4/src/encoding/utf8.h", added "/usr/src/debug/re2c/4.5.1/src/encoding/ebcdic.h /usr/src/debug/re2c/4.5.1/src/encoding/range_suffix.cc /usr/src/debug/re2c/4.5.1/src/encoding/utf16.cc /usr/src/debug/re2c/4.5.
 1/src/encoding/utf16.h /usr/src/debug/re2c/4.5.1/src/encoding/range_suffix.h /usr/src/debug/re2c/4.5.1/src/encoding/utf8.h /usr/src/debug/re2c/4.5.1/src/encoding/ebcdic.cc /usr/src/debug/re2c/4.5.1/src/encoding/enc.cc /usr/src/debug/re2c/4.5.1/src/encoding/enc.h /usr/src/debug/re2c/4.5.1/src/encoding/utf8.cc /usr/src/debug/re2c/4.5.1/src/encoding/unicode_casemap.cc"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGSIZE changed from 1769258 to 1836662 (+4%)
packages/x86-64-v3-poky-linux/re2c/re2c-src: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-src: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.4 [default] to 4.5.1 [default]
packages/x86-64-v3-poky-linux/re2c/re2c: FILELIST: added "/usr/share/re2c/stdlib/unicode_properties.re /usr/share/re2c/stdlib/unicode_blocks.re"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGSIZE changed from 12645009 to 13103375 (+4%)
packages/x86-64-v3-poky-linux/re2c/re2c: PV changed from "4.4" to "4.5.1"
packages/x86-64-v3-poky-linux/re2c/re2c: PKGV changed from 4.4 [default] to 4.5.1 [default]
Changes to packages/x86-64-v3-poky-linux/re2c (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/share/re2c/stdlib/unicode_blocks.re was added
  /usr/share/re2c/stdlib/unicode_properties.re was added

--===============4665954167243613116==--

