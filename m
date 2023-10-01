Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D60EE748F7
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:17 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.65012.1696183989899449159
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P/9NX/57;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=prm9XiF3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018aec71b317-1adc43b1-a383-40f8-9225-02756baed121-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=uBu8YRAb8G8yOmn1+nlCwoKMk2IgqNZifzDQli5PcwM=;
	b=P/9NX/57VEPWLfIY+cQ5Wu9v15ANK9W8eoeHQjI9bzEkUzO6Qkd7o/Ud42lg+GOn
	2MUQd9MJHPFJwjnsjaTcRGnqP55J/3C3s3qKRO1QKa6ZSaFXzsHiRQET+0meJ4JPNid
	ctpVyRtgaWCo0bRszPylmOgx6dhaN5w7TXnHwS1U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183989;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=uBu8YRAb8G8yOmn1+nlCwoKMk2IgqNZifzDQli5PcwM=;
	b=prm9XiF3fy9iT8+S1aejOQ4irJL41Xqn9I9mMHQhNUDvuu3Yc7jAlS0lOB6sCWl9
	5oa4zIoXYPrJ0r7dds2oW69rnjw6ASDI2pg9CMUmBQKZTb64ZwMmisfqyyade1ygefC
	M+KPu7kzHUfgFNOIYsVq2TG2kFaPUcE0ju1qTfB0=
Content-Type: multipart/mixed; boundary="===============0054083771842801041=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ell: upgrading to 0.59 SUCCEEDED
Message-ID: <0101018aec71b317-1adc43b1-a383-40f8-9225-02756baed121-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188517

--===============0054083771842801041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ell* to *0.59* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ell-upgrade-0.58-0.59.patch
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
From 2e8a0ffcb4742a19441a801e54d19f8f344f09fa Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 07:09:55 +0000
Subject: [PATCH] ell: upgrade 0.58 -> 0.59

---
 meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/ell/{ell_0.58.bb => ell_0.59.bb} (89%)

diff --git a/meta/recipes-core/ell/ell_0.58.bb b/meta/recipes-core/ell/ell_0.59.bb
similarity index 89%
rename from meta/recipes-core/ell/ell_0.58.bb
rename to meta/recipes-core/ell/ell_0.59.bb
index 04e8566305..0483dbe582 100644
--- a/meta/recipes-core/ell/ell_0.58.bb
+++ b/meta/recipes-core/ell/ell_0.59.bb
@@ -15,7 +15,7 @@ DEPENDS = "dbus"
 inherit autotools pkgconfig
 
 SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${BPN}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "531a980589c8954ff12a3110b4d958fa75a74c88ddcc3e2ace4317e76a7c1e9b"
+SRC_URI[sha256sum] = "370dc2b7c73cd57856017180a2a70a15ca1b0183bfd453b3cffe2d707c37da3d"
 
 do_configure:prepend () {
     mkdir -p ${S}/build-aux
-- 
2.39.2


--===============0054083771842801041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ell/ell-dbg: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-dbg: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-dbg: PKGSIZE changed from 1448232 to 1447792 (-0%)
packages/core2-32-poky-linux/ell/ell-dev: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-dev: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 150678 to 114676 (-24%)
packages/core2-32-poky-linux/ell/ell-doc: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-doc: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-locale: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-locale: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-src: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-src: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell-src: PKGSIZE changed from 1477495 to 1387849 (-6%)
packages/core2-32-poky-linux/ell/ell-staticdev: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell-staticdev: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell/ell: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell/ell: PKGV changed from 0.58 [default] to 0.59 [default]
packages/core2-32-poky-linux/ell: PV changed from "0.58" to "0.59"
packages/core2-32-poky-linux/ell: SRC_URI changed from "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.58.tar.xz" to "https://mirrors.edge.kernel.org/pub/linux/libs/ell/ell-0.59.tar.xz"
packages/core2-32-poky-linux/ell: PKGV changed from 0.58 [default] to 0.59 [default]

--===============0054083771842801041==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-ell-upgrade-0.58-0.59.patch"

RnJvbSAyZThhMGZmY2I0NzQyYTE5NDQxYTgwMWU1NGQxOWY4ZjM0NGYwOWZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAwNzowOTo1NSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVs
bDogdXBncmFkZSAwLjU4IC0+IDAuNTkKCi0tLQogbWV0YS9yZWNpcGVzLWNvcmUvZWxsL3tlbGxf
MC41OC5iYiA9PiBlbGxfMC41OS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29yZS9lbGwve2VsbF8w
LjU4LmJiID0+IGVsbF8wLjU5LmJifSAoODklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b3JlL2VsbC9lbGxfMC41OC5iYiBiL21ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC41OS5iYgpz
aW1pbGFyaXR5IGluZGV4IDg5JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29yZS9lbGwvZWxs
XzAuNTguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL2VsbC9lbGxfMC41OS5iYgppbmRl
eCAwNGU4NTY2MzA1Li4wNDgzZGJlNTgyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9l
bGwvZWxsXzAuNTguYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvcmUvZWxsL2VsbF8wLjU5LmJiCkBA
IC0xNSw3ICsxNSw3IEBAIERFUEVORFMgPSAiZGJ1cyIKIGluaGVyaXQgYXV0b3Rvb2xzIHBrZ2Nv
bmZpZwogCiBTUkNfVVJJID0gImh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL2xp
bnV4L2xpYnMvJHtCUE59LyR7QlBOfS0ke1BWfS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNTMxYTk4MDU4OWM4OTU0ZmYxMmEzMTEwYjRkOTU4ZmE3NWE3NGM4OGRkY2MzZTJhY2U0MzE3
ZTc2YTdjMWU5YiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIzNzBkYzJiN2M3M2NkNTc4NTYwMTcx
ODBhMmE3MGExNWNhMWIwMTgzYmZkNDUzYjNjZmZlMmQ3MDdjMzdkYTNkIgogCiBkb19jb25maWd1
cmU6cHJlcGVuZCAoKSB7CiAgICAgbWtkaXIgLXAgJHtTfS9idWlsZC1hdXgKLS0gCjIuMzkuMgoK

--===============0054083771842801041==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ell/ell-dev: PKGSIZE changed from 150678 to 114676 (-24%)

--===============0054083771842801041==--

