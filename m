Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76ACE10FCAF2
	for <webhook@archiver.kernel.org>; Wed,  1 Apr 2026 14:36:08 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14746.1775054159060256522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Apr 2026 07:36:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=rl+aN48x;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=pAgJ97dh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019d49791c24-7decd15e-1bc1-4ca8-b44e-ba871f11f81a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1775054167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=rZ3CIbKuRMl/WjUBD60xvWW+uEpEvwOpO0nIHmrUCcw=;
	b=rl+aN48xSai0YUFOcAjYr8K58f4gsxwPMUW29586LwqxUchGctSmxNUtz4alkWor
	rTbkjBh7pmvrLuRLqj3mzQfdLjSrplYl+nHg7/5KkHSZdKY04CX9m/ZJMmrxWTO+53K
	YlxaWlvZJYcwNRb5MYMolU6hRcrnujZ8K4b6cPAg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1775054167;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=rZ3CIbKuRMl/WjUBD60xvWW+uEpEvwOpO0nIHmrUCcw=;
	b=pAgJ97dhvi0tEgJQDw86Haz2XA2BaK+V0mrVGiVOcErgTPJVnH5ffOnm12lC2eHE
	E4JX4GHl6qWQVNYMHAmDEUkpCteFL0DoCmE6V193ZeMdHUNFns9zHN7rGglNYOSuVrV
	Xi3j1PPPGMlNCHn0nn4d1aNlxyQJ5NiEVkXZM5Bg=
Content-Type: multipart/mixed; boundary="===============8507478938826620652=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vala: upgrading to 0.56.19 SUCCEEDED
Message-ID: <0101019d49791c24-7decd15e-1bc1-4ca8-b44e-ba871f11f81a-000000@us-west-2.amazonses.com>
Date: Wed, 1 Apr 2026 14:36:07 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Apr 2026 14:36:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234397

--===============8507478938826620652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *vala* to *0.56.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.18-0.56.19.patch
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
From 6609d573fb0f833d4b671209e6af2f5d07817ff0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Apr 2026 11:04:44 +0000
Subject: [PATCH] vala: upgrade 0.56.18 -> 0.56.19

---
 meta/recipes-devtools/vala/{vala_0.56.18.bb => vala_0.56.19.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/vala/{vala_0.56.18.bb => vala_0.56.19.bb} (96%)

diff --git a/meta/recipes-devtools/vala/vala_0.56.18.bb b/meta/recipes-devtools/vala/vala_0.56.19.bb
similarity index 96%
rename from meta/recipes-devtools/vala/vala_0.56.18.bb
rename to meta/recipes-devtools/vala/vala_0.56.19.bb
index 16e5d2b7c8..ae31c2f991 100644
--- a/meta/recipes-devtools/vala/vala_0.56.18.bb
+++ b/meta/recipes-devtools/vala/vala_0.56.19.bb
@@ -20,7 +20,7 @@ GNOMEBASEBUILDCLASS = "autotools"
 
 inherit gnomebase upstream-version-is-even
 
-SRC_URI[archive.sha256sum] = "f2affe7d40ab63db8e7b9ecc3f6bdc9c2fc7e3134c84ff2d795f482fe926a382"
+SRC_URI[archive.sha256sum] = "5ad7cbbfcc0de61b403d6797c9ef60455bfbebd8e162aec33b5b0b097adfb9d5"
 
 SHRT_VER = "${@gnome_verdir("${PV}")}"
 
-- 
2.47.1


--===============8507478938826620652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vala: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala: SRC_URI changed from "https://download.gnome.org/sources//vala/0.56/vala-0.56.18.tar.xz;name=archive" to "https://download.gnome.org/sources//vala/0.56/vala-0.56.19.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/vala/vala-dbg: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-dbg: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-dbg: PKGSIZE changed from 19599392 to 19589344 (-0%)
packages/x86-64-v3-poky-linux/vala/vala-dev: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-dev: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-doc: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-doc: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-doc: PKGSIZE changed from 10250 to 10256 (+0%)
packages/x86-64-v3-poky-linux/vala/vala-locale: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-locale: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-src: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-src: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-src: FILELIST: directory renamed /usr/src/debug/vala/0.56.18/ccode -> /usr/src/debug/vala/0.56.19/ccode, directory renamed /usr/src/debug/vala/0.56.18/codegen -> /usr/src/debug/vala/0.56.19/codegen, directory renamed /usr/src/debug/vala/0.56.18/gee -> /usr/src/debug/vala/0.56.19/gee, directory renamed /usr/src/debug/vala/0.56.18/vala -> /usr/src/debug/vala/0.56.19/vala, directory renamed /usr/src/debug/vala/0.56.18/compiler -> /usr/src/debug/vala/0.56.19/compiler, directory renamed /usr/src/debug/vala/0.56.18/gobject-introspection -> /usr/src/debug/vala/0.56.19/gobject-introspection, directory renamed /usr/src/debug/vala/0.56.18/vapigen -> /usr/src/debug/vala/0.56.19/vapigen
packages/x86-64-v3-poky-linux/vala/vala-src: PKGSIZE changed from 15930205 to 15931461 (+0%)
packages/x86-64-v3-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-staticdev: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala: PKGSIZE changed from 12430968 to 12486488 (+0%)

--===============8507478938826620652==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.18-0.56.19.patch"

RnJvbSA2NjA5ZDU3M2ZiMGY4MzNkNGI2NzEyMDllNmFmMmY1ZDA3ODE3ZmYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBBcHIgMjAyNiAxMTowNDo0NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZh
bGE6IHVwZ3JhZGUgMC41Ni4xOCAtPiAwLjU2LjE5CgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy92YWxhL3t2YWxhXzAuNTYuMTguYmIgPT4gdmFsYV8wLjU2LjE5LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy92YWxhL3t2YWxhXzAuNTYuMTguYmIgPT4gdmFsYV8wLjU2LjE5LmJifSAo
OTYlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4x
OC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xOS5iYgpzaW1pbGFy
aXR5IGluZGV4IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxh
XzAuNTYuMTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41
Ni4xOS5iYgppbmRleCAxNmU1ZDJiN2M4Li5hZTMxYzJmOTkxIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE5LmJiCkBAIC0yMCw3ICsyMCw3IEBAIEdOT01FQkFTRUJV
SUxEQ0xBU1MgPSAiYXV0b3Rvb2xzIgogCiBpbmhlcml0IGdub21lYmFzZSB1cHN0cmVhbS12ZXJz
aW9uLWlzLWV2ZW4KIAotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZjJhZmZlN2Q0MGFi
NjNkYjhlN2I5ZWNjM2Y2YmRjOWMyZmM3ZTMxMzRjODRmZjJkNzk1ZjQ4MmZlOTI2YTM4MiIKK1NS
Q19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjVhZDdjYmJmY2MwZGU2MWI0MDNkNjc5N2M5ZWY2
MDQ1NWJmYmViZDhlMTYyYWVjMzNiNWIwYjA5N2FkZmI5ZDUiCiAKIFNIUlRfVkVSID0gIiR7QGdu
b21lX3ZlcmRpcigiJHtQVn0iKX0iCiAKLS0gCjIuNDcuMQoK

--===============8507478938826620652==--

