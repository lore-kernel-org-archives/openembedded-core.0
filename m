Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28F07F428F1
	for <webhook@archiver.kernel.org>; Wed, 15 Apr 2026 14:04:53 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19809.1776261870602113538
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2026 07:04:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ZtZydNXf;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=jnSBe/gA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019d91756da9-4efa7e5b-69a4-4c24-966e-320ab615558f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=v04uB+LyxoVLHQVCj6JXXTX/45Jqm9hVC+n0NeIakB0=;
	b=ZtZydNXfhV+DAmY0EAekLe5PeaycdFcS+ryyjZ9NCePbv503jm5ZgcgZLqTx0MfI
	c+O4PpNdfv99TbEJkceu6OcdKkEJjcgaOwUx+NZKymoeCQiWp37RdpXmri4+l1krMG3
	A1NfFSnKMw05q1WeiKg5vyCuZXZkb7FavIJqJ500=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1776261885;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=v04uB+LyxoVLHQVCj6JXXTX/45Jqm9hVC+n0NeIakB0=;
	b=jnSBe/gA7Mg8MvK7+CM7rZ0o6cTHABERpfUzarsC04LoSGvAw7mDmUbgwUx7xb+I
	Ne1NWFosjbblhB58CSqOoQZxqhvEjujUxYzNF4rajab8Ib0oUETR15lEMd+P6hQxx0y
	B9is2yTsvtdFdA1hnW6YgclIXLMHbP4Ip+nFkjok=
Content-Type: multipart/mixed; boundary="===============4831651846353660898=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] vala: upgrading to 0.56.19 SUCCEEDED
Message-ID: <0101019d91756da9-4efa7e5b-69a4-4c24-966e-320ab615558f-000000@us-west-2.amazonses.com>
Date: Wed, 15 Apr 2026 14:04:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.04.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2026 14:04:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235260

--===============4831651846353660898==
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
From c91cecdb028ac60c82b520f85038cc1a1e1acfd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Apr 2026 09:37:12 +0000
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


--===============4831651846353660898==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.18-0.56.19.patch"

RnJvbSBjOTFjZWNkYjAyOGFjNjBjODJiNTIwZjg1MDM4Y2MxYTFlMWFjZmQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgQXByIDIwMjYgMDk6Mzc6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxhOiB1cGdyYWRlIDAuNTYuMTggLT4gMC41Ni4xOQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvdmFsYS97dmFsYV8wLjU2LjE4LmJiID0+IHZhbGFfMC41Ni4xOS5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvdmFsYS97dmFsYV8wLjU2LjE4LmJiID0+IHZhbGFfMC41Ni4xOS5iYn0g
KDk2JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYu
MTguYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMTkuYmIKc2ltaWxh
cml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFs
YV8wLjU2LjE4LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAu
NTYuMTkuYmIKaW5kZXggMTZlNWQyYjdjOC4uYWUzMWMyZjk5MSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3ZhbGEvdmFsYV8wLjU2LjE4LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4xOS5iYgpAQCAtMjAsNyArMjAsNyBAQCBHTk9NRUJBU0VC
VUlMRENMQVNTID0gImF1dG90b29scyIKIAogaW5oZXJpdCBnbm9tZWJhc2UgdXBzdHJlYW0tdmVy
c2lvbi1pcy1ldmVuCiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gImYyYWZmZTdkNDBh
YjYzZGI4ZTdiOWVjYzNmNmJkYzljMmZjN2UzMTM0Yzg0ZmYyZDc5NWY0ODJmZTkyNmEzODIiCitT
UkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICI1YWQ3Y2JiZmNjMGRlNjFiNDAzZDY3OTdjOWVm
NjA0NTViZmJlYmQ4ZTE2MmFlYzMzYjViMGIwOTdhZGZiOWQ1IgogCiBTSFJUX1ZFUiA9ICIke0Bn
bm9tZV92ZXJkaXIoIiR7UFZ9Iil9IgogCi0tIAoyLjQ3LjEKCg==

--===============4831651846353660898==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/vala: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala: SRC_URI changed from "https://download.gnome.org/sources//vala/0.56/vala-0.56.18.tar.xz;name=archive" to "https://download.gnome.org/sources//vala/0.56/vala-0.56.19.tar.xz;name=archive"
packages/x86-64-v3-poky-linux/vala: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-dbg: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-dbg: PKGSIZE changed from 19599392 to 19589344 (-0%)
packages/x86-64-v3-poky-linux/vala/vala-dbg: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-dev: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-dev: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-doc: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-doc: PKGSIZE changed from 10250 to 10256 (+0%)
packages/x86-64-v3-poky-linux/vala/vala-doc: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-locale: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-locale: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-src: FILELIST: directory renamed /usr/src/debug/vala/0.56.18/ccode -> /usr/src/debug/vala/0.56.19/ccode, directory renamed /usr/src/debug/vala/0.56.18/gee -> /usr/src/debug/vala/0.56.19/gee, directory renamed /usr/src/debug/vala/0.56.18/vala -> /usr/src/debug/vala/0.56.19/vala, directory renamed /usr/src/debug/vala/0.56.18/codegen -> /usr/src/debug/vala/0.56.19/codegen, directory renamed /usr/src/debug/vala/0.56.18/gobject-introspection -> /usr/src/debug/vala/0.56.19/gobject-introspection, directory renamed /usr/src/debug/vala/0.56.18/vapigen -> /usr/src/debug/vala/0.56.19/vapigen, directory renamed /usr/src/debug/vala/0.56.18/compiler -> /usr/src/debug/vala/0.56.19/compiler
packages/x86-64-v3-poky-linux/vala/vala-src: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-src: PKGSIZE changed from 15930205 to 15931461 (+0%)
packages/x86-64-v3-poky-linux/vala/vala-src: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala-staticdev: PV changed from "0.56.18" to "0.56.19"
packages/x86-64-v3-poky-linux/vala/vala: PKGV changed from 0.56.18 [default] to 0.56.19 [default]
packages/x86-64-v3-poky-linux/vala/vala: PKGSIZE changed from 12430968 to 12486488 (+0%)
packages/x86-64-v3-poky-linux/vala/vala: PV changed from "0.56.18" to "0.56.19"

--===============4831651846353660898==--

