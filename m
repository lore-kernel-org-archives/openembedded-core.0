Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B9DACDE00D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 16:32:10 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50434.1781195519072822403
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 09:32:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ip2YDej9;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=XXdBm6rc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019eb786c055-92142269-dafb-4734-914d-2a624274a82e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781195522;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=wl1MzAn4Sy8oViguPsXGTgN+KuWdibYR9CXSBA3el7o=;
	b=Ip2YDej9Fb0JweOTHZefbQpFJI4tXi8hxn4bCent6GToQA6a0RB4UvyoONUicxdf
	HE0xauDefGeuwzHB3sO224Qt1iS/gf6l4jKp56nugank7lIMQTZYzpI4E8lGUQTwrG+
	fVh74ECWWSqJNTMxblobN4x3rgSa0/tkwX28d7dY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781195522;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=wl1MzAn4Sy8oViguPsXGTgN+KuWdibYR9CXSBA3el7o=;
	b=XXdBm6rc5B9HTfp2dH6vpyAZnODM05q9+PHY1lHNKZiLjhzPGPRjVHx2pOqdYqSg
	/MJjbFzKJXFpOJkcsdSDTkV+1C+WWf40Lmddlam66dwvZvVWmZLYhgwudQuoAFnwIyf
	e2/QPSuHbPEsprl8GuHzqChU4KBnfMlUkq1YAnKU=
Content-Type: multipart/mixed; boundary="===============3670620852169763100=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dos2unix: upgrading to 7.5.6 SUCCEEDED
Message-ID: <0101019eb786c055-92142269-dafb-4734-914d-2a624274a82e-000000@us-west-2.amazonses.com>
Date: Thu, 11 Jun 2026 16:32:02 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.11-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 16:32:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238566

--===============3670620852169763100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *dos2unix* to *7.5.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dos2unix-upgrade-7.5.5-7.5.6.patch
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
From 84110fdfffc8ab4e24a2a3a57bd4f7672354f3bd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 11 Jun 2026 15:02:25 +0000
Subject: [PATCH] dos2unix: upgrade 7.5.5 -> 7.5.6

---
 .../dos2unix/{dos2unix_7.5.5.bb => dos2unix_7.5.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/dos2unix/{dos2unix_7.5.5.bb => dos2unix_7.5.6.bb} (95%)

diff --git a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb b/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
similarity index 95%
rename from meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
rename to meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
index aa078ed200..b6ecdc109e 100644
--- a/meta/recipes-support/dos2unix/dos2unix_7.5.5.bb
+++ b/meta/recipes-support/dos2unix/dos2unix_7.5.6.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=af1174fd3d1a254eec3a4a1d1da170a9"
 SRC_URI = "git://git.code.sf.net/p/dos2unix/dos2unix;branch=master;protocol=https"
 UPSTREAM_CHECK_GITTAGREGEX = "dos2unix-(?P<pver>(\d+(\.\d+)+))"
 
-SRCREV = "54524999eece4e9ad0dab580c79b02855fc85028"
+SRCREV = "9c2ea173af3bc49324f8288d81c5a2bbfc0884d0"
 
 S = "${UNPACKDIR}/${BP}/dos2unix"
 
-- 
2.47.1


--===============3670620852169763100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dbg: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-dev: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGSIZE changed from 208609 to 209374 (+0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.5 -> /usr/share/doc/dos2unix-7.5.6
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-locale: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGSIZE changed from 201918 to 201906 (-0%)
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: FILELIST: directory renamed /usr/src/debug/dos2unix/7.5.5 -> /usr/src/debug/dos2unix/7.5.6
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-src: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix-staticdev: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix/dos2unix: PKGV changed from 7.5.5 [default] to 7.5.6 [default]
packages/x86-64-v3-poky-linux/dos2unix: PV changed from "7.5.5" to "7.5.6"
packages/x86-64-v3-poky-linux/dos2unix: PKGV changed from 7.5.5 [default] to 7.5.6 [default]

--===============3670620852169763100==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dos2unix-upgrade-7.5.5-7.5.6.patch"

RnJvbSA4NDExMGZkZmZmYzhhYjRlMjRhMmEzYTU3YmQ0Zjc2NzIzNTRmM2JkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTEgSnVuIDIwMjYgMTU6MDI6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
b3MydW5peDogdXBncmFkZSA3LjUuNSAtPiA3LjUuNgoKLS0tCiAuLi4vZG9zMnVuaXgve2RvczJ1
bml4XzcuNS41LmJiID0+IGRvczJ1bml4XzcuNS42LmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kb3MydW5peC97ZG9zMnVuaXhfNy41LjUuYmIgPT4gZG9zMnVuaXhfNy41
LjYuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgv
ZG9zMnVuaXhfNy41LjUuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kb3MydW5peC9kb3MydW5p
eF83LjUuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9kb3MydW5peC9kb3MydW5peF83LjUuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhfNy41LjYuYmIKaW5kZXggYWEwNzhlZDIwMC4uYjZl
Y2RjMTA5ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVu
aXhfNy41LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZG9zMnVuaXgvZG9zMnVuaXhf
Ny41LjYuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORy50eHQ7bWQ1PWFmMTE3NGZkM2QxYTI1NGVlYzNhNGExZDFkYTE3MGE5IgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQuY29kZS5zZi5uZXQvcC9kb3MydW5peC9kb3MydW5peDticmFuY2g9bWFzdGVy
O3Byb3RvY29sPWh0dHBzIgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAiZG9zMnVuaXgt
KD9QPHB2ZXI+KFxkKyhcLlxkKykrKSkiCiAKLVNSQ1JFViA9ICI1NDUyNDk5OWVlY2U0ZTlhZDBk
YWI1ODBjNzliMDI4NTVmYzg1MDI4IgorU1JDUkVWID0gIjljMmVhMTczYWYzYmM0OTMyNGY4Mjg4
ZDgxYzVhMmJiZmMwODg0ZDAiCiAKIFMgPSAiJHtVTlBBQ0tESVJ9LyR7QlB9L2RvczJ1bml4Igog
Ci0tIAoyLjQ3LjEKCg==

--===============3670620852169763100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/dos2unix/dos2unix-doc: FILELIST: directory renamed /usr/share/doc/dos2unix-7.5.5 -> /usr/share/doc/dos2unix-7.5.6

--===============3670620852169763100==--

