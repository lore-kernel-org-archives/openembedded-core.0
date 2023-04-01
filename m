Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1FAC77B79
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:01 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.32131.1680384534398605197
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=m/cGoosX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101873eb93013-4bce7aba-1f16-4a1d-b305-72475b84ecf5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6Fi+Ecu0k5VcxqnOIym7bVfioBRg/UUYIxiILlQAh+0=;
	b=m/cGoosXRvIKFdikKW2ojdAyVVEb0HjUPhM8720czDAW89u3r/BM5dYjk5UL0+m9
	idn6ZDRy9c//arTSSRW+egqqXCaFESsfeKGfzzbiGAmWBLNDvSSxvWIsUJpCPnWHsfA
	wM76o4J7m9T9nOaimCMg2ubNljvcJoA+ru5UN11A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384536;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6Fi+Ecu0k5VcxqnOIym7bVfioBRg/UUYIxiILlQAh+0=;
	b=BGflEbUcnUYvC9It1wkWqgwV36E7E786CQ0irLb9vJsRlo+Gt/ewStrl/gGlsRsl
	/AHlwg1Tvx+KtYOy6ZtEw4KJwWaV3/ZOsm3ncyFRF+wefDJur9uWA4cXL0BlF3zvKcL
	pcU1ueepMHSToPggT4sux6QmU7Mw7fAxg2yXY3Pc=
Content-Type: multipart/mixed; boundary="===============3268513869284544942=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] wpebackend-fdo: upgrading to 1.14.2 SUCCEEDED
Message-ID: <010101873eb93013-4bce7aba-1f16-4a1d-b305-72475b84ecf5-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:56 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179562

--===============3268513869284544942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *wpebackend-fdo* to *1.14.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-wpebackend-fdo-upgrade-1.14.0-1.14.2.patch
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
--===============3268513869284544942==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-wpebackend-fdo-upgrade-1.14.0-1.14.2.patch"

RnJvbSBiZDQzZmQwYTc0MzZkMTlkMGNmODU5MmVjZTk5MTNkMTkxMWE0ZjQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAyMDoxMjo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHdw
ZWJhY2tlbmQtZmRvOiB1cGdyYWRlIDEuMTQuMCAtPiAxLjE0LjIKCi0tLQogLi4uL3t3cGViYWNr
ZW5kLWZkb18xLjE0LjAuYmIgPT4gd3BlYmFja2VuZC1mZG9fMS4xNC4yLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLXNhdG8vd2Via2l0L3t3cGViYWNrZW5kLWZkb18xLjE0LjAuYmIgPT4gd3Bl
YmFja2VuZC1mZG9fMS4xNC4yLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1z
YXRvL3dlYmtpdC93cGViYWNrZW5kLWZkb18xLjE0LjAuYmIgYi9tZXRhL3JlY2lwZXMtc2F0by93
ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTAlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93cGViYWNrZW5kLWZkb18xLjE0LjAuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1zYXRvL3dlYmtpdC93cGViYWNrZW5kLWZkb18xLjE0LjIu
YmIKaW5kZXggNzA4MjAxMDQzYi4uYjNkN2IyMjljOCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXNhdG8vd2Via2l0L3dwZWJhY2tlbmQtZmRvXzEuMTQuMC5iYgorKysgYi9tZXRhL3JlY2lwZXMt
c2F0by93ZWJraXQvd3BlYmFja2VuZC1mZG9fMS4xNC4yLmJiCkBAIC0xMyw3ICsxMyw3IEBAIGlu
aGVyaXQgbWVzb24gZmVhdHVyZXNfY2hlY2sgcGtnY29uZmlnCiBSRVFVSVJFRF9ESVNUUk9fRkVB
VFVSRVMgPSAib3BlbmdsIgogCiBTUkNfVVJJID0gImh0dHBzOi8vd3Bld2Via2l0Lm9yZy9yZWxl
YXNlcy8ke0JQTn0tJHtQVn0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImU3NWIwY2Iy
YzcxNDU0NDg0MTZlODY5NjAxM2Q4ODgzZjY3NWM2NmMxMWVkNzUwZTA2ODY1ZWZlYzU4MDkxNTUi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTNjOTc2NmFlOTg2NGVlYWVhZWUyYjBhNzRmMjJjYmNh
MDhkZjQyYzFhMWJkYjU1YjA4NmYyNTI4ZTM4MGQzOCIKIAogIyBFc3BlY2lhbGx5IGhlbHBzIGNv
bXBpbGluZyB3aXRoIGNsYW5nIHdoaWNoIGVuYWJsZSB0aGlzIGFzIGVycm9yIHdoZW4KICMgdXNp
bmcgYysrMTEKLS0gCjIuMzkuMgoK

--===============3268513869284544942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/wpebackend-fdo: SRC_URI changed from "https://wpewebkit.org/releases/wpebackend-fdo-1.14.0.tar.xz" to "https://wpewebkit.org/releases/wpebackend-fdo-1.14.2.tar.xz"
packages/core2-32-poky-linux/wpebackend-fdo: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo: PV changed from "1.14.0" to "1.14.2"
Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.9.2 to libWPEBackend-fdo-1.0.so.1.9.4
  /usr/lib/libWPEBackend-fdo-1.0.so.1.9.2 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.9.4
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: FILELIST: removed "/usr/lib/.debug/libWPEBackend-fdo-1.0.so.1.9.2", added "/usr/lib/.debug/libWPEBackend-fdo-1.0.so.1.9.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGSIZE changed from 1471744 to 1472340 (+0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dbg: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-dev: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-doc: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-locale: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGSIZE changed from 336403 to 336578 (+0%)
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-src: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo-staticdev: PV changed from "1.14.0" to "1.14.2"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.2", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.4"
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PKGV changed from 1.14.0 [default] to 1.14.2 [default]
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: PV changed from "1.14.0" to "1.14.2"

--===============3268513869284544942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-32-poky-linux/wpebackend-fdo (sysroot):
  /usr/lib/libWPEBackend-fdo-1.0.so.1 changed symlink target from libWPEBackend-fdo-1.0.so.1.9.2 to libWPEBackend-fdo-1.0.so.1.9.4
  /usr/lib/libWPEBackend-fdo-1.0.so.1.9.2 moved to /usr/lib/libWPEBackend-fdo-1.0.so.1.9.4
packages/core2-32-poky-linux/wpebackend-fdo/wpebackend-fdo: FILELIST: removed "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.2", added "/usr/lib/libWPEBackend-fdo-1.0.so.1.9.4"

--===============3268513869284544942==--

