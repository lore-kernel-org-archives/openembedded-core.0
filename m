Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D994C2FC27
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 22:19:12 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.173816.1692224349809395467
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 15:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=YU3nuqXz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=EUVHX9ph;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a006e6423-ddc46543-576c-484a-8a6c-f5586b04a31e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=H8rX0LiP6DLboJYclOKMZdy37zD5XlEdPpKkQVaktVk=;
	b=YU3nuqXzbK2FyokwjcTMHM4opKvYf/NWP0Gq9hDx57ZagnBS/ghc5UKrff9X6CXs
	gIEAUXdtzHuSDA4P9dPMZ4GayEcdpIHfk12+jqPR/s1X5hRQWRH1WFGMxH0imoyBq9J
	HP3X88vtD+zD3D98GUMGyrqdEIQN7dCOZHoQq/xk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692224349;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=H8rX0LiP6DLboJYclOKMZdy37zD5XlEdPpKkQVaktVk=;
	b=EUVHX9phUIDEpQrhUPZCQfUaEw/Z9gtwnC2A4J/Xqyze0dq89+LyC/3WdXfJqReg
	1iAU9Y7Agbw7ArnrtFGNqhmWLYMt3I6bSt+a+z8KPbJv1QkbcMwrasrECeREKoGYOuN
	kQW5hPuZuZm8FPyyfM67qOfBwx8th6fIS3iWwpK0=
Content-Type: multipart/mixed; boundary="===============5558550577472569974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 643 SUCCEEDED
Message-ID: <0101018a006e6423-ddc46543-576c-484a-8a6c-f5586b04a31e-000000@us-west-2.amazonses.com>
Date: Wed, 16 Aug 2023 22:19:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 22:19:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186205

--===============5558550577472569974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *less* to *643* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-633-643.patch
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
From 04484ac8ae6c6ba0ce1a1f8152d5bd1790cbf33f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 16 Aug 2023 08:02:01 +0000
Subject: [PATCH] less: upgrade 633 -> 643

---
 meta/recipes-extended/less/{less_633.bb => less_643.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_633.bb => less_643.bb} (93%)

diff --git a/meta/recipes-extended/less/less_633.bb b/meta/recipes-extended/less/less_643.bb
similarity index 93%
rename from meta/recipes-extended/less/less_633.bb
rename to meta/recipes-extended/less/less_643.bb
index 2defb5ccb7..008bbd5581 100644
--- a/meta/recipes-extended/less/less_633.bb
+++ b/meta/recipes-extended/less/less_643.bb
@@ -27,7 +27,7 @@ DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "2f201d64b828b88af36dfe6cfdba3e0819ece2e446ebe6224813209aaefed04f"
+SRC_URI[sha256sum] = "2911b5432c836fa084c8a2e68f6cd6312372c026a58faaa98862731c8b6052e8"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.39.2


--===============5558550577472569974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-633.tar.gz" to "http://www.greenwoodsoftware.com/less/less-643.tar.gz"
packages/core2-32-poky-linux/less: PV changed from "633" to "643"
packages/core2-32-poky-linux/less: PKGV changed from 633 [default] to 643 [default]
packages/core2-32-poky-linux/less/less-dbg: PKGSIZE changed from 550556 to 550860 (+0%)
packages/core2-32-poky-linux/less/less-dbg: PV changed from "633" to "643"
packages/core2-32-poky-linux/less/less-dbg: PKGV changed from 633 [default] to 643 [default]
packages/core2-32-poky-linux/less/less-dev: PV changed from "633" to "643"
packages/core2-32-poky-linux/less/less-dev: PKGV changed from 633 [default] to 643 [default]
packages/core2-32-poky-linux/less/less-doc: PKGSIZE changed from 100555 to 101344 (+1%)
packages/core2-32-poky-linux/less/less-doc: PV changed from "633" to "643"
packages/core2-32-poky-linux/less/less-doc: PKGV changed from 633 [default] to 643 [default]
packages/core2-32-poky-linux/less/less-locale: PV changed from "633" to "643"
packages/core2-32-poky-linux/less/less-locale: PKGV changed from 633 [default] to 643 [default]
packages/core2-32-poky-linux/less/less-src: PKGSIZE changed from 726341 to 728588 (+0%)
packages/core2-32-poky-linux/less/less-src: PV changed from "633" to "643"
packages/core2-32-poky-linux/less/less-src: PKGV changed from 633 [default] to 643 [default]
packages/core2-32-poky-linux/less/less-staticdev: PV changed from "633" to "643"
packages/core2-32-poky-linux/less/less-staticdev: PKGV changed from 633 [default] to 643 [default]
packages/core2-32-poky-linux/less/less: PV changed from "633" to "643"
packages/core2-32-poky-linux/less/less: PKGV changed from 633 [default] to 643 [default]

--===============5558550577472569974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-633-643.patch"

RnJvbSAwNDQ4NGFjOGFlNmM2YmEwY2UxYTFmODE1MmQ1YmQxNzkwY2JmMzNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTYgQXVnIDIwMjMgMDg6MDI6MDEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ZXNzOiB1cGdyYWRlIDYzMyAtPiA2NDMKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3Mv
e2xlc3NfNjMzLmJiID0+IGxlc3NfNjQzLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9s
ZXNzL3tsZXNzXzYzMy5iYiA9PiBsZXNzXzY0My5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzYzMy5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sZXNzL2xlc3NfNjQzLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjMzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGVzcy9sZXNzXzY0My5iYgppbmRleCAyZGVmYjVjY2I3Li4wMDhiYmQ1NTgxIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzYzMy5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY0My5iYgpAQCAtMjcsNyArMjcsNyBAQCBE
RVBFTkRTID0gIm5jdXJzZXMiCiAKIFNSQ19VUkkgPSAiaHR0cDovL3d3dy5ncmVlbndvb2Rzb2Z0
d2FyZS5jb20vJHtCUE59LyR7QlBOfS0ke1BWfS50YXIuZ3oiCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICIyZjIwMWQ2NGI4MjhiODhhZjM2ZGZlNmNmZGJhM2UwODE5ZWNlMmU0NDZlYmU2MjI0ODEz
MjA5YWFlZmVkMDRmIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI5MTFiNTQzMmM4MzZmYTA4NGM4
YTJlNjhmNmNkNjMxMjM3MmMwMjZhNThmYWFhOTg4NjI3MzFjOGI2MDUyZTgiCiAKIFVQU1RSRUFN
X0NIRUNLX1VSSSA9ICJodHRwOi8vd3d3LmdyZWVud29vZHNvZnR3YXJlLmNvbS9sZXNzL2Rvd25s
b2FkLmh0bWwiCiAKLS0gCjIuMzkuMgoK

--===============5558550577472569974==--

