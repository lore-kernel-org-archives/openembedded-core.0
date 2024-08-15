Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB2DC5320E
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.131117.1723748336254780394
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=R07mr42j;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IZeMwHUs;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019157684024-f4f00754-71bd-4eec-91dd-476736ee37a7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IvUIqHFaAaIHCIj/YdczIaU5tVh3CjxLPp7wQuwJKBY=;
	b=R07mr42j+1LiyBuLUclsxH1BzjUKFdOwTqpCl++FvEEfhzj7qXTRwwsv9dvKEQqb
	XYBJ0COQBqli1HAVwqMfHMipmzEFeP9kokzD4FyxUWRFQ6ncO6evH/vgfL1zVqMnYWG
	SmqKd1gzrM6Z6a/SQmesnj1LbCK33yl+PyCdMu84=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IvUIqHFaAaIHCIj/YdczIaU5tVh3CjxLPp7wQuwJKBY=;
	b=IZeMwHUsDRuHO0dd1N3Vg9lZupSdNfP4UEPaAsmwroGxIYNrQQmbAW7OZtKxno22
	ubZGTVKfMWPjwCC455Q1umO1XdBltC3AAHsaZ8BNcwgwpuNfiYs5tV8jw9I58HyocEY
	/nasQETClpcbk/JS7pKWfQALMqHTPeWnF98apjME=
Content-Type: multipart/mixed; boundary="===============2482227229591311310=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libnl: upgrading to 3.10.0 SUCCEEDED
Message-ID: <0101019157684024-f4f00754-71bd-4eec-91dd-476736ee37a7-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203449

--===============2482227229591311310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libnl* to *3.10.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libnl-upgrade-3.9.0-3.10.0.patch
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
From 38e0cf669aff3f0d56f3a143b2f0f8efb720434e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 18:30:15 +0000
Subject: [PATCH] libnl: upgrade 3.9.0 -> 3.10.0

---
 meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libnl/{libnl_3.9.0.bb => libnl_3.10.0.bb} (96%)

diff --git a/meta/recipes-support/libnl/libnl_3.9.0.bb b/meta/recipes-support/libnl/libnl_3.10.0.bb
similarity index 96%
rename from meta/recipes-support/libnl/libnl_3.9.0.bb
rename to meta/recipes-support/libnl/libnl_3.10.0.bb
index b2825374cf..4691c6554f 100644
--- a/meta/recipes-support/libnl/libnl_3.9.0.bb
+++ b/meta/recipes-support/libnl/libnl_3.10.0.bb
@@ -18,7 +18,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}${@d.getVar('PV').replace('.','_')}
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "aed507004d728a5cf11eab48ca4bf9e6e1874444e33939b9d3dfed25018ee9bb"
+SRC_URI[sha256sum] = "49b3e2235fdb58f5910bbb3ed0de8143b71ffc220571540502eb6c2471f204f5"
 
 GITHUB_BASE_URI = "https://github.com/thom311/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/libnl(?P<pver>.+)"
-- 
2.44.0


--===============2482227229591311310==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libnl-upgrade-3.9.0-3.10.0.patch"

RnJvbSAzOGUwY2Y2NjlhZmYzZjBkNTZmM2ExNDNiMmYwZjhlZmI3MjA0MzRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6MzA6MTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJubDogdXBncmFkZSAzLjkuMCAtPiAzLjEwLjAKCi0tLQogbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlibmwve2xpYm5sXzMuOS4wLmJiID0+IGxpYm5sXzMuMTAuMC5iYn0gfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9saWJubC97bGlibmxfMy45LjAuYmIgPT4gbGlibmxfMy4xMC4wLmJifSAoOTYl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm5sL2xpYm5sXzMuOS4wLmJi
IGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlibmwvbGlibmxfMy4xMC4wLmJiCnNpbWlsYXJpdHkg
aW5kZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYm5sL2xpYm5sXzMu
OS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJubC9saWJubF8zLjEwLjAu
YmIKaW5kZXggYjI4MjUzNzRjZi4uNDY5MWM2NTU0ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlibmwvbGlibmxfMy45LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQv
bGlibmwvbGlibmxfMy4xMC4wLmJiCkBAIC0xOCw3ICsxOCw3IEBAIFNSQ19VUkkgPSAiJHtHSVRI
VUJfQkFTRV9VUkl9L2Rvd25sb2FkLyR7QlBOfSR7QGQuZ2V0VmFyKCdQVicpLnJlcGxhY2UoJy4n
LCdfJyl9CiAgICAgICAgICAgIGZpbGU6Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCiAKLVNS
Q19VUklbc2hhMjU2c3VtXSA9ICJhZWQ1MDcwMDRkNzI4YTVjZjExZWFiNDhjYTRiZjllNmUxODc0
NDQ0ZTMzOTM5YjlkM2RmZWQyNTAxOGVlOWJiIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjQ5YjNl
MjIzNWZkYjU4ZjU5MTBiYmIzZWQwZGU4MTQzYjcxZmZjMjIwNTcxNTQwNTAyZWI2YzI0NzFmMjA0
ZjUiCiAKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vdGhvbTMxMS8ke0JQ
Tn0vcmVsZWFzZXMiCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJyZWxlYXNlcy90YWcvbGlibmwo
P1A8cHZlcj4uKykiCi0tIAoyLjQ0LjAKCg==

--===============2482227229591311310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 71910 to 100590 (+40%)

--===============2482227229591311310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libnl: SRC_URI changed from "https://github.com/thom311/libnl/releases/download/libnl3_9_0/libnl-3.9.0.tar.gz file://run-ptest" to "https://github.com/thom311/libnl/releases/download/libnl3_10_0/libnl-3.10.0.tar.gz file://run-ptest"
packages/core2-64-poky-linux/libnl: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-cli: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-cli: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-dbg: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-dbg: PKGSIZE changed from 3955184 to 4096008 (+4%)
packages/core2-64-poky-linux/libnl/libnl-dbg: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-dev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-dev: PKGSIZE changed from 291075 to 293648 (+1%)
packages/core2-64-poky-linux/libnl/libnl-dev: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-doc: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-doc: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-genl: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-genl: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-idiag: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-idiag: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-locale: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-locale: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-nf: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-nf: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-ptest: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-ptest: PKGSIZE changed from 71910 to 100590 (+40%)
packages/core2-64-poky-linux/libnl/libnl-ptest: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-route: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-route: PKGSIZE changed from 595665 to 603857 (+1%)
packages/core2-64-poky-linux/libnl/libnl-route: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-src: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-src: PKGSIZE changed from 2940032 to 2977781 (+1%)
packages/core2-64-poky-linux/libnl/libnl-src: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-staticdev: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-staticdev: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl-xfrm: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl-xfrm: PV changed from "3.9.0" to "3.10.0"
packages/core2-64-poky-linux/libnl/libnl: PKGV changed from 3.9.0 [default] to 3.10.0 [default]
packages/core2-64-poky-linux/libnl/libnl: PV changed from "3.9.0" to "3.10.0"

--===============2482227229591311310==--

