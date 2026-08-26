Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13C64C61DBD
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 05:59:58 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6427.1787723988971337945
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 22:59:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=qL1VvkxK;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gl6YXYzT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a03ca73bb9-f9a4f838-08c0-4ec4-b42c-7d8e63d1e226-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1787723988;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=skFfJ5OstdHCZcOyIsxxb+e6s+aSzIhRZzjD8p2GAek=;
	b=qL1VvkxKRrw5A4ka31JU8ttjlfzzyBMTMqFUkBsm05s7jwY2ztnUV6w/ePX/VDkC
	/b1etHHdQocT3+x/IdAX1E8XAkdH1p4DczLgO8NrCEd5jQitzcmGUPLW9oY80kPojqj
	q63/LDd49vc1dfbNkT/Xyj46raDQn5nNNe7YQofo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1787723988;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=skFfJ5OstdHCZcOyIsxxb+e6s+aSzIhRZzjD8p2GAek=;
	b=Gl6YXYzTd8ndCd0gW/oqJt6NQAe0nEfxLk9/qUhJnQlNYz0IKHjg2zlQKKtqvvCv
	iBG1cG4pY9C56tenuMXKOaX3jS5n9cQUWaI+joypZYjJJptVHaMa9PrYDXKzrKPo4ou
	H2NLB3BwZOfBVBNDBZzxkw9GImwGzAOPIi4502eI=
Content-Type: multipart/mixed; boundary="===============7264196260795971908=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libslirp: upgrading to 4.9.4 SUCCEEDED
Message-ID: <010101a03ca73bb9-f9a4f838-08c0-4ec4-b42c-7d8e63d1e226-000000@us-west-2.amazonses.com>
Date: Wed, 26 Aug 2026 05:59:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.26-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Aug 2026 05:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244307

--===============7264196260795971908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libslirp* to *4.9.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.9.3-4.9.4.patch
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
From 4d944bfa36b4e100da62b8ce62f637befd05668e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 26 Aug 2026 05:40:34 +0000
Subject: [PATCH] libslirp: upgrade 4.9.3 -> 4.9.4

Source: CHANGELOG.md

## [4.9.4] - 2026-08-25

## Security

  - Fix information leak on fragmented packets with different header lengths

### Fixed

  - Fix reporting oob output #95
  - Fix buffer trimming to ip6-announced length #96

## Changed

  - slirp: permit guestfwd to vhost_addr/vnameserver_addr #81 #140

  - oob: cap urgent data count to what is actually available #93 (CVE-2026-9539)
[Unreleased]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.4...master
[4.9.4]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.3...v4.9.4
---
 .../slirp/{libslirp_4.9.3.bb => libslirp_4.9.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.3.bb => libslirp_4.9.4.bb} (92%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
similarity index 92%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
index be13cbc1fc..79a24f3037 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.3.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "dd76415fce457e319d665eb8210d05c5731360ba"
+SRCREV = "d09dc9a70360ee7838acccbd234ab83f3b9b37a5"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
-- 
2.47.1


--===============7264196260795971908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libslirp: SRC_URI changed from "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v4.9.3" to "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v4.9.4"
packages/x86-64-v3-poky-linux/libslirp: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp: PV changed from "4.9.3" to "4.9.4"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 598344 to 598488 (+0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PV changed from "4.9.3" to "4.9.4"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PV changed from "4.9.3" to "4.9.4"
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PV changed from "4.9.3" to "4.9.4"
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PV changed from "4.9.3" to "4.9.4"
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 589021 to 588882 (-0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: FILELIST: directory renamed /usr/src/debug/libslirp/4.9.3/src -> /usr/src/debug/libslirp/4.9.4/src
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PV changed from "4.9.3" to "4.9.4"
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.9.3" to "4.9.4"
packages/x86-64-v3-poky-linux/libslirp/libslirp: PKGV changed from 4.9.3 [default] to 4.9.4 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp: PV changed from "4.9.3" to "4.9.4"

--===============7264196260795971908==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libslirp-changelog.txt"

Changelog for libslirp: 4.9.3 -> 4.9.4
Source: CHANGELOG.md

## [4.9.4] - 2026-08-25

## Security

  - Fix information leak on fragmented packets with different header lengths

### Fixed

  - Fix reporting oob output #95
  - Fix buffer trimming to ip6-announced length #96

## Changed

  - slirp: permit guestfwd to vhost_addr/vnameserver_addr #81 #140

  - oob: cap urgent data count to what is actually available #93 (CVE-2026-9539)
[Unreleased]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.4...master
[4.9.4]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.3...v4.9.4

--===============7264196260795971908==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.9.3-4.9.4.patch"

RnJvbSA0ZDk0NGJmYTM2YjRlMTAwZGE2MmI4Y2U2MmY2MzdiZWZkMDU2NjhlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjYgQXVnIDIwMjYgMDU6NDA6MzQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzbGlycDogdXBncmFkZSA0LjkuMyAtPiA0LjkuNAoKU291cmNlOiBDSEFOR0VMT0cubWQKCiMj
IFs0LjkuNF0gLSAyMDI2LTA4LTI1CgojIyBTZWN1cml0eQoKICAtIEZpeCBpbmZvcm1hdGlvbiBs
ZWFrIG9uIGZyYWdtZW50ZWQgcGFja2V0cyB3aXRoIGRpZmZlcmVudCBoZWFkZXIgbGVuZ3RocwoK
IyMjIEZpeGVkCgogIC0gRml4IHJlcG9ydGluZyBvb2Igb3V0cHV0ICM5NQogIC0gRml4IGJ1ZmZl
ciB0cmltbWluZyB0byBpcDYtYW5ub3VuY2VkIGxlbmd0aCAjOTYKCiMjIENoYW5nZWQKCiAgLSBz
bGlycDogcGVybWl0IGd1ZXN0ZndkIHRvIHZob3N0X2FkZHIvdm5hbWVzZXJ2ZXJfYWRkciAjODEg
IzE0MAoKICAtIG9vYjogY2FwIHVyZ2VudCBkYXRhIGNvdW50IHRvIHdoYXQgaXMgYWN0dWFsbHkg
YXZhaWxhYmxlICM5MyAoQ1ZFLTIwMjYtOTUzOSkKW1VucmVsZWFzZWRdOiBodHRwczovL2dpdGxh
Yi5mcmVlZGVza3RvcC5vcmcvc2xpcnAvbGlic2xpcnAvY29tcGFyZS92NC45LjQuLi5tYXN0ZXIK
WzQuOS40XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3NsaXJwL2xpYnNsaXJwL2Nv
bXBhcmUvdjQuOS4zLi4udjQuOS40Ci0tLQogLi4uL3NsaXJwL3tsaWJzbGlycF80LjkuMy5iYiA9
PiBsaWJzbGlycF80LjkuNC5iYn0gICAgICAgICAgICAgIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9zbGlycC97bGlic2xpcnBfNC45LjMuYmIgPT4gbGlic2xpcnBfNC45LjQuYmJ9ICg5
MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC9saWJzbGly
cF80LjkuMy5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfNC45
LjQuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9zbGlycC9saWJzbGlycF80LjkuMy5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWNv
bm5lY3Rpdml0eS9zbGlycC9saWJzbGlycF80LjkuNC5iYgppbmRleCBiZTEzY2JjMWZjLi43OWEy
NGYzMDM3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL2xpYnNs
aXJwXzQuOS4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xp
cnBfNC45LjQuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NP
UFlSSUdIVDttZDU9Zjk1YTliZjRhN2U0MTExNjRmZTg0MzY5N2NjZGE1OWUgXAogICAgICAgICAg
ICAgICAgICAgICBmaWxlOi8vTElDRU5TRTttZDU9Y2ZlYTYwNDQ2NDJmZDYzYjkwY2U5ZDc5ZjVk
YjY0ZDkiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9zbGlycC9s
aWJzbGlycC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9IgotU1JD
UkVWID0gImRkNzY0MTVmY2U0NTdlMzE5ZDY2NWViODIxMGQwNWM1NzMxMzYwYmEiCitTUkNSRVYg
PSAiZDA5ZGM5YTcwMzYwZWU3ODM4YWNjY2JkMjM0YWI4M2YzYjliMzdhNSIKIFVQU1RSRUFNX0NI
RUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKykiCiAKIERFUEVORFMgPSAi
Z2xpYi0yLjAiCi0tIAoyLjQ3LjEKCg==

--===============7264196260795971908==--

