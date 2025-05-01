Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F43C3ABC7
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:34:08 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.1789.1746113616102970307
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=MVuu54AO;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=dKO5tqMY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101968c7bbe6e-140e9a8f-1cc4-49ec-8c41-d9cce8ca54a6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113642;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0gbYBoqNKOJqJLwV5bXGNzOCYNnelRrshuK+fZGcYKA=;
	b=MVuu54AObrNTplX5Prw2c1QR58m5MUnCc9swYVvfXB8tzwD+KamGQW0rDESCsc+d
	9RwNDLPf1Fo+d50xesaTaXYwX+UvOKfdSOrRBQtT37dl3ekN6kTz3tvN77u7Jl0u7uB
	Sq6J3TPEeVs6DFYYE6kmLRozhZvptwPWH6NK2MZQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113642;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0gbYBoqNKOJqJLwV5bXGNzOCYNnelRrshuK+fZGcYKA=;
	b=dKO5tqMYAB2MMsnrZ6zj4gX8ZRuaQudEj7qAbWG/u0FDmpHNkTo1fFQbxsl5DXL+
	VJBzNkLe7le7msjPaDcN0ZrGKBgnK6GOse7rTOe5cXauuQ1ACqVdS1JiuPgtE8fhpvu
	Lxs3gRRDYzr9TsH/0Xqdxk1mH1F+Fv3Gev1qsQpw=
Content-Type: multipart/mixed; boundary="===============8797993421015738967=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] re2c: upgrading to 4.2 SUCCEEDED
Message-ID: <010101968c7bbe6e-140e9a8f-1cc4-49ec-8c41-d9cce8ca54a6-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:34:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:34:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215899

--===============8797993421015738967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *re2c* to *4.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-re2c-upgrade-4.1-4.2.patch
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
From cd50e6b22f0fc60fd570435030349267ddd975d2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 15:29:09 +0000
Subject: [PATCH] re2c: upgrade 4.1 -> 4.2

---
 meta/recipes-support/re2c/{re2c_4.1.bb => re2c_4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/re2c/{re2c_4.1.bb => re2c_4.2.bb} (90%)

diff --git a/meta/recipes-support/re2c/re2c_4.1.bb b/meta/recipes-support/re2c/re2c_4.2.bb
similarity index 90%
rename from meta/recipes-support/re2c/re2c_4.1.bb
rename to meta/recipes-support/re2c/re2c_4.2.bb
index 238f95f745..0696080603 100644
--- a/meta/recipes-support/re2c/re2c_4.1.bb
+++ b/meta/recipes-support/re2c/re2c_4.2.bb
@@ -7,7 +7,7 @@ LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=64eca4d8a3b67f9dc7656094731a2c8d"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "cd7d9bbadb3f04f20da25e20e155655de57beef48e0807266938069f0e322e8b"
+SRC_URI[sha256sum] = "c9dc2b24f340d135a07a1ac63ff53f7f8f74997fed5a4e9132a64050dbc3da1f"
 GITHUB_BASE_URI = "https://github.com/skvadrik/re2c/releases"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.47.1


--===============8797993421015738967==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-re2c-upgrade-4.1-4.2.patch"

RnJvbSBjZDUwZTZiMjJmMGZjNjBmZDU3MDQzNTAzMDM0OTI2N2RkZDk3NWQyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAxNToyOTowOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
MmM6IHVwZ3JhZGUgNC4xIC0+IDQuMgoKLS0tCiBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJjL3ty
ZTJjXzQuMS5iYiA9PiByZTJjXzQuMi5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9yZTJj
L3tyZTJjXzQuMS5iYiA9PiByZTJjXzQuMi5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4xLmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvcmUy
Yy9yZTJjXzQuMi5iYgpzaW1pbGFyaXR5IGluZGV4IDkwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9yZTJjL3JlMmNfNC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9y
dC9yZTJjL3JlMmNfNC4yLmJiCmluZGV4IDIzOGY5NWY3NDUuLjA2OTYwODA2MDMgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L3JlMmMvcmUyY180LjEuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLXN1cHBvcnQvcmUyYy9yZTJjXzQuMi5iYgpAQCAtNyw3ICs3LDcgQEAgTElDRU5TRSA9ICJQ
RCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTY0ZWNhNGQ4YTNiNjdm
OWRjNzY1NjA5NDczMWEyYzhkIgogCiBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0VfVVJJfS9kb3du
bG9hZC8ke1BWfS8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNk
N2Q5YmJhZGIzZjA0ZjIwZGEyNWUyMGUxNTU2NTVkZTU3YmVlZjQ4ZTA4MDcyNjY5MzgwNjlmMGUz
MjJlOGIiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYzlkYzJiMjRmMzQwZDEzNWEwN2ExYWM2M2Zm
NTNmN2Y4Zjc0OTk3ZmVkNWE0ZTkxMzJhNjQwNTBkYmMzZGExZiIKIEdJVEhVQl9CQVNFX1VSSSA9
ICJodHRwczovL2dpdGh1Yi5jb20vc2t2YWRyaWsvcmUyYy9yZWxlYXNlcyIKIAogQkJDTEFTU0VY
VEVORCA9ICJuYXRpdmUgbmF0aXZlc2RrIgotLSAKMi40Ny4xCgo=

--===============8797993421015738967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/re2c: SRC_URI changed from "https://github.com/skvadrik/re2c/releases/download/4.1/re2c-4.1.tar.xz" to "https://github.com/skvadrik/re2c/releases/download/4.2/re2c-4.2.tar.xz"
packages/core2-64-poky-linux/re2c: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c: PV changed from "4.1" to "4.2"
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 178225488 to 197382248 (+11%)
packages/core2-64-poky-linux/re2c/re2c-dbg: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c/re2c-dbg: FILELIST: added "/usr/bin/.debug/re2swift"
packages/core2-64-poky-linux/re2c/re2c-dbg: PV changed from "4.1" to "4.2"
packages/core2-64-poky-linux/re2c/re2c-dev: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c/re2c-dev: PV changed from "4.1" to "4.2"
packages/core2-64-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1648952 to 1837365 (+11%)
packages/core2-64-poky-linux/re2c/re2c-doc: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c/re2c-doc: FILELIST: added "/usr/share/man/man1/re2swift.1"
packages/core2-64-poky-linux/re2c/re2c-doc: PV changed from "4.1" to "4.2"
packages/core2-64-poky-linux/re2c/re2c-locale: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c/re2c-locale: PV changed from "4.1" to "4.2"
packages/core2-64-poky-linux/re2c/re2c-src: PKGSIZE changed from 993639 to 1044830 (+5%)
packages/core2-64-poky-linux/re2c/re2c-src: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c/re2c-src: FILELIST: directory renamed /usr/src/debug/re2c/4.1/src/options -> /usr/src/debug/re2c/4.2/src/options, directory renamed /usr/src/debug/re2c/4.1/src/parse -> /usr/src/debug/re2c/4.2/src/parse, removed "/usr/src/debug/re2c/4.1/src/msg/help_re2hs.cc /usr/src/debug/re2c/4.1/src/default_syntax_zig.h /usr/src/debug/re2c/4.1/src/default_syntax_d.h /usr/src/debug/re2c/4.1/src/msg/help_re2go.cc /usr/src/debug/re2c/4.1/src/default_syntax_c.h /usr/src/debug/re2c/4.1/src/msg/help_re2ocaml.cc /usr/src/debug/re2c/4.1/src/msg/ver_to_vernum.cc /usr/src/debug/re2c/4.1/src/msg/help_re2v.cc /usr/src/debug/re2c/4.1/src/default_syntax_v.h /usr/src/debug/re2c/4.1/src/msg/help_re2c.cc /usr/src/debug/re2c/4.1/src/default_syntax_go.h /usr/src/debug/re2c/4.1/src/default_syntax_python.h /usr/src/debug/re2c/4.1/src/msg/help_re2d.cc /usr/src/debug/re2c/4.1/src/msg/help_re2js.cc /usr/src/debug/re2c/4.1/src/msg/help_re2py.cc /usr/src/debug/re2c/4.1/src/default_syntax_j
 ava.h /usr/src/debug/re2c/4.1/src/default_syntax_rust.h /usr/src/debug/re2c/4.1/src/msg/help_re2zig.cc /usr/src/debug/re2c/4.1/src/default_syntax_haskell.h /usr/src/debug/re2c/4.1/src/default_syntax_js.h /usr/src/debug/re2c/4.1/src/msg/help_re2rust.cc /usr/src/debug/re2c/4.1/src/default_syntax_ocaml.h", added "/usr/src/debug/re2c/4.2/src/msg/help_re2swift.cc /usr/src/debug/re2c/4.2/src/msg/help_re2hs.cc /usr/src/debug/re2c/4.2/src/default_syntax_zig.h /usr/src/debug/re2c/4.2/src/default_syntax_d.h /usr/src/debug/re2c/4.2/src/msg/help_re2go.cc /usr/src/debug/re2c/4.2/src/default_syntax_c.h /usr/src/debug/re2c/4.2/src/msg/help_re2ocaml.cc /usr/src/debug/re2c/4.2/src/msg/ver_to_vernum.cc /usr/src/debug/re2c/4.2/src/msg/help_re2v.cc /usr/src/debug/re2c/4.2/src/default_syntax_v.h /usr/src/debug/re2c/4.2/src/msg/help_re2c.cc /usr/src/debug/re2c/4.2/src/default_syntax_go.h /usr/src/debug/re2c/4.2/src/default_syntax_python.h /usr/src/debug/re2c/4.2/src/msg/help_re2d.cc /usr/src/debug/re2c/4
 .2/src/msg/help_re2js.cc /usr/src/debug/re2c/4.2/src/msg/help_re2py.cc /usr/src/debug/re2c/4.2/src/default_syntax_java.h /usr/src/debug/re2c/4.2/src/default_syntax_rust.h /usr/src/debug/re2c/4.2/src/default_syntax_swift.h /usr/src/debug/re2c/4.2/src/msg/help_re2zig.cc /usr/src/debug/re2c/4.2/src/default_syntax_haskell.h /usr/src/debug/re2c/4.2/src/default_syntax_js.h /usr/src/debug/re2c/4.2/src/msg/help_re2rust.cc /usr/src/debug/re2c/4.2/src/default_syntax_ocaml.h"
packages/core2-64-poky-linux/re2c/re2c-src: PV changed from "4.1" to "4.2"
packages/core2-64-poky-linux/re2c/re2c-staticdev: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c/re2c-staticdev: PV changed from "4.1" to "4.2"
packages/core2-64-poky-linux/re2c/re2c: PKGSIZE changed from 11214280 to 12598190 (+12%)
packages/core2-64-poky-linux/re2c/re2c: PKGV changed from 4.1 [default] to 4.2 [default]
packages/core2-64-poky-linux/re2c/re2c: FILELIST: added "/usr/share/re2c/stdlib/swift /usr/bin/re2swift"
packages/core2-64-poky-linux/re2c/re2c: PV changed from "4.1" to "4.2"
Changes to packages/core2-64-poky-linux/re2c (sysroot):
  /usr/share/re2c/stdlib/swift was added
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/bin/re2swift was added
  /usr/share/re2c/stdlib/swift was added

--===============8797993421015738967==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/re2c/re2c-dbg: PKGSIZE changed from 178225488 to 197382248 (+11%)
packages/core2-64-poky-linux/re2c/re2c-doc: PKGSIZE changed from 1648952 to 1837365 (+11%)
packages/core2-64-poky-linux/re2c/re2c-doc: FILELIST: added "/usr/share/man/man1/re2swift.1"
packages/core2-64-poky-linux/re2c/re2c: PKGSIZE changed from 11214280 to 12598190 (+12%)
packages/core2-64-poky-linux/re2c/re2c: FILELIST: added "/usr/share/re2c/stdlib/swift /usr/bin/re2swift"
Changes to packages/core2-64-poky-linux/re2c (sysroot):
  /usr/share/re2c/stdlib/swift was added
Changes to packages/x86_64-linux/re2c-native (sysroot):
  /usr/bin/re2swift was added
  /usr/share/re2c/stdlib/swift was added

--===============8797993421015738967==--

