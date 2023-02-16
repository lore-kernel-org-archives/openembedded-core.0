Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB110C6FD1F
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.10151.1676508397095045285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=BqftKZXj;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018657affb84-5aacfb5f-5a32-4ea0-8966-fb6306cee8aa-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=bFpIA49lWKc/6Vx7sWqktQrxCCcAPzKYq1oSqRqbLM4=;
	b=BqftKZXji0lc8zfRmYzGzRP6sdxxaq5jP08srdsjm828Bgm0mEWhIakuILWJldVK
	mVkbVCinfWd4/FYLwaWQFsmsSxrU8m9//eHZogcDVeFNAFu3uHOlMtWsH1YeunadVzU
	ON8SEzSLCb4QxOjPv6vRFYCNKAyFPc6gvvuT6CKU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508396;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=bFpIA49lWKc/6Vx7sWqktQrxCCcAPzKYq1oSqRqbLM4=;
	b=iX/hR2/HaEEmIz8rSgMLRdgtmm0NlUvkkTEDp1wekclSJukCDj5EncLEXpxXaueL
	ubnrjCs5Pwuif6Yy3cOl5o5aba9cdeWz7gxhL3I4e9souwH0jTVpuuWkgDzfUTR8q27
	Fq28CAkXamdAZQhwxZPMm+DLXjWh4bFP2qzZoCO8=
Content-Type: multipart/mixed; boundary="===============6967469712493606145=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vala: upgrading to 0.56.4 SUCCEEDED
Message-ID: <0101018657affb84-5aacfb5f-5a32-4ea0-8966-fb6306cee8aa-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177242

--===============6967469712493606145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vala* to *0.56.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vala-upgrade-0.56.3-0.56.4.patch
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
--===============6967469712493606145==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vala-upgrade-0.56.3-0.56.4.patch"

RnJvbSBiYzNlNGY3Zjg4MjkzNDg5MTk4NmQxZGYyNGMxOGE4YTQ4Y2U0N2M5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMTk6MzA6MjAgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
YWxhOiB1cGdyYWRlIDAuNTYuMyAtPiAwLjU2LjQKCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3ZhbGEve3ZhbGFfMC41Ni4zLmJiID0+IHZhbGFfMC41Ni40LmJifSB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy92YWxhL3t2YWxhXzAuNTYuMy5iYiA9PiB2YWxhXzAuNTYuNC5iYn0gKDE4JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuMy5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni40LmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTglCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy92YWxhL3ZhbGFfMC41Ni4z
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFsYS92YWxhXzAuNTYuNC5iYgpp
bmRleCA4M2Y2MWU1YjJmLi4zMmZhODFhMDhiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvdmFsYS92YWxhXzAuNTYuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvdmFs
YS92YWxhXzAuNTYuNC5iYgpAQCAtMSwzICsxLDMgQEAKIHJlcXVpcmUgJHtCUE59LmluYwogCi1T
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZTEwNjYyMjFiZjdiODljYjFmYTczMjdhMzg4ODY0NWNiMzNi
NjA0ZGUzYmY0NWFhODExMzJmZDA0MGI2OTliZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI4NjJj
NDFkOTM4NTQzZWQzZDhkODZjODIxOWE2MTA4Nzc5NzE5M2RlZmVlOGRhMGM1MGNhZjQ5OTkzYzY2
YjZhIgotLSAKMi4zNy4zCgo=

--===============6967469712493606145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/vala: SRC_URI changed from "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.3.tar.xz" to "http://ftp.gnome.org/pub/GNOME/sources/vala/0.56/vala-0.56.4.tar.xz"
packages/core2-32-poky-linux/vala: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala: PV changed from "0.56.3" to "0.56.4"
Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/share/vala-0.56/vapi/javascriptcoregtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.vapi was added
packages/core2-32-poky-linux/vala/vala-dbg: PKGSIZE changed from 15454580 to 15513040 (+0%)
packages/core2-32-poky-linux/vala/vala-dbg: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala/vala-dbg: PV changed from "0.56.3" to "0.56.4"
packages/core2-32-poky-linux/vala/vala-dev: PKGSIZE changed from 439282 to 439364 (+0%)
packages/core2-32-poky-linux/vala/vala-dev: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala/vala-dev: PV changed from "0.56.3" to "0.56.4"
packages/core2-32-poky-linux/vala/vala-doc: PKGSIZE changed from 10319 to 10316 (-0%)
packages/core2-32-poky-linux/vala/vala-doc: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala/vala-doc: PV changed from "0.56.3" to "0.56.4"
packages/core2-32-poky-linux/vala/vala-locale: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala/vala-locale: PV changed from "0.56.3" to "0.56.4"
packages/core2-32-poky-linux/vala/vala-src: PKGSIZE changed from 15767528 to 15772079 (+0%)
packages/core2-32-poky-linux/vala/vala-src: FILELIST: directory renamed /usr/src/debug/vala/0.56.3-r0/vala -> /usr/src/debug/vala/0.56.4-r0/vala, directory renamed /usr/src/debug/vala/0.56.3-r0/gee -> /usr/src/debug/vala/0.56.4-r0/gee, directory renamed /usr/src/debug/vala/0.56.3-r0/vapigen -> /usr/src/debug/vala/0.56.4-r0/vapigen, directory renamed /usr/src/debug/vala/0.56.3-r0/codegen -> /usr/src/debug/vala/0.56.4-r0/codegen, directory renamed /usr/src/debug/vala/0.56.3-r0/compiler -> /usr/src/debug/vala/0.56.4-r0/compiler, directory renamed /usr/src/debug/vala/0.56.3-r0/gobject-introspection -> /usr/src/debug/vala/0.56.4-r0/gobject-introspection, removed "/usr/src/debug/vala/0.56.3-r0/ccode/valaccodeinitializerlist.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodecasestatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodecomment.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodebreakstatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodefunctiondeclarator.c /usr/src/debug/vala/0.56
 .3-r0/ccode/valaccodeincludedirective.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodemodifiers.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeelementaccess.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodedeclaration.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeforstatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeenum.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeifstatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodestatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodedostatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodenewline.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodefunctioncall.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodelinedirective.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodetypedefinition.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodebinaryexpression.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodedefine.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeassignment.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeexpression.c /usr/src/debug/vala/0
 .56.3-r0/ccode/valaccodecastexpression.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodemacroreplacement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodegotostatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeconstantidentifier.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeswitchstatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodecontinuestatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodefile.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeconstant.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodenode.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodestruct.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeenumvalue.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeoncesection.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeexpressionstatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodefunction.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodefragment.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodewhilestatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeconditionalexpression
 .c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeblock.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeemptystatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeparameter.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeidentifier.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodecommaexpression.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccode.h /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeggnucsection.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccode.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodevariabledeclarator.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodedeclarator.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeinvalidexpression.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodelabel.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodememberaccess.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodewriter.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodereturnstatement.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeunaryexpression.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeparenthesizedexpre
 ssion.c /usr/src/debug/vala/0.56.3-r0/ccode/valaccodeifsection.c", added "/usr/src/debug/vala/0.56.4-r0/ccode/valaccodeinitializerlist.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodecasestatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodecomment.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodebreakstatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodefunctiondeclarator.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeincludedirective.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodemodifiers.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeelementaccess.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodedeclaration.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeforstatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeenum.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeifstatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodenewline.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodedostatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodestatement.c /usr/src/debug/vala/0.56.4-r0/cco
 de/valaccodefunctioncall.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodelinedirective.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodetypedefinition.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodebinaryexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodedefine.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeassignment.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodecastexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodemacroreplacement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodegotostatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeconstantidentifier.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeswitchstatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodecontinuestatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodefile.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeconstant.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodenode.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodestruct.c /usr/src/debug/val
 a/0.56.4-r0/ccode/valaccodeenumvalue.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeoncesection.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeexpressionstatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodefunction.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodefragment.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodewhilestatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeconditionalexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeblock.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodebinarycompareexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeemptystatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeparameter.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeidentifier.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodecommaexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccode.h /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeggnucsection.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccode.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodevariabledeclarator.c /us
 r/src/debug/vala/0.56.4-r0/ccode/valaccodedeclarator.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeinvalidexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodelabel.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodememberaccess.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodewriter.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodereturnstatement.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeunaryexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeparenthesizedexpression.c /usr/src/debug/vala/0.56.4-r0/ccode/valaccodeifsection.c"
packages/core2-32-poky-linux/vala/vala-src: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala/vala-src: PV changed from "0.56.3" to "0.56.4"
packages/core2-32-poky-linux/vala/vala-staticdev: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala/vala-staticdev: PV changed from "0.56.3" to "0.56.4"
packages/core2-32-poky-linux/vala/vala: PKGSIZE changed from 13077345 to 13417050 (+3%)
packages/core2-32-poky-linux/vala/vala: FILELIST: added "/usr/share/vala-0.56/vapi/javascriptcoregtk-6.0.vapi /usr/share/vala-0.56/vapi/webkitgtk-6.0.deps /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.vapi /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.deps /usr/share/vala-0.56/vapi/webkitgtk-6.0.vapi"
packages/core2-32-poky-linux/vala/vala: PKGV changed from 0.56.3 [default] to 0.56.4 [default]
packages/core2-32-poky-linux/vala/vala: PV changed from "0.56.3" to "0.56.4"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/share/vala-0.56/vapi/javascriptcoregtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.vapi was added

--===============6967469712493606145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/vala (sysroot):
  /usr/share/vala-0.56/vapi/javascriptcoregtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.vapi was added
packages/core2-32-poky-linux/vala/vala: FILELIST: added "/usr/share/vala-0.56/vapi/webkitgtk-6.0.deps /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.vapi /usr/share/vala-0.56/vapi/webkitgtk-6.0.vapi /usr/share/vala-0.56/vapi/javascriptcoregtk-6.0.vapi /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.deps"
Changes to packages/x86_64-linux/vala-native (sysroot):
  /usr/share/vala-0.56/vapi/javascriptcoregtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-6.0.vapi was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.deps was added
  /usr/share/vala-0.56/vapi/webkitgtk-web-extension-6.0.vapi was added

--===============6967469712493606145==--

