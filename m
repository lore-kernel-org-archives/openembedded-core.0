Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17309C9830B
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 06:27:49 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1224.1790144866632978802
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 23:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ofQnyYrH;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=h5Th+JQD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0ccf2e675-02d7a4d6-66fd-4c24-8810-5ac04e1ebd36-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790144866;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=loGfNxYft3PkHzI7mi3OVDZ6VbgD+HL8I7Dz9vBVLDo=;
	b=ofQnyYrHQOhIWsl5cGFuNpI+lMY71CSS9ofUByRDlUk6fgussVb0SlFASG89zQi/
	BQ+uaJy+N2nulZjzzfhxuicYxkHuD7q0OPv79gtq9QKdiLNZwCyBszbwd/WDNBWVeJZ
	JLtu9a0t1CWOVLT1Q8BbiKLEzsecDoXxtv6xI6xQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790144866;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=loGfNxYft3PkHzI7mi3OVDZ6VbgD+HL8I7Dz9vBVLDo=;
	b=h5Th+JQD0IRCtxde7WbteUuDQQGA9Uu36K++bN36gZs4S1W5Mfx6d5TWfHtuturr
	VGuJ1ZfaD0DWBer6Cna5wIyXM1bDtbwFm881PLz7yQGMUmF0FS4/2SUdn/I2kQjjZJi
	rSbIHilwKTxCu2BHTAeVCzTBreRpZZrNIR7NqbM4=
Content-Type: multipart/mixed; boundary="===============4063717347874906753=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libslirp: upgrading to 4.9.5 SUCCEEDED
Message-ID: <010101a0ccf2e675-02d7a4d6-66fd-4c24-8810-5ac04e1ebd36-000000@us-west-2.amazonses.com>
Date: Wed, 23 Sep 2026 06:27:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.23-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Sep 2026 06:27:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246438

--===============4063717347874906753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libslirp* to *4.9.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.9.4-4.9.5.patch
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
From 3197faf2ccdca39025d42e01a6cd37a26137f61e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 23 Sep 2026 05:23:21 +0000
Subject: [PATCH] libslirp: upgrade 4.9.4 -> 4.9.5

## [4.9.5] - 2026-09-22
## Security

  - Fix bounds-check in processing OEM commands
  - Fix bounds-check in dhcpv6 against MTU

### Fixed
  - Fix blocking sendto on UDP ockets #97

[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...master
[4.9.5]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.4...v4.9.5
---
 .../slirp/{libslirp_4.9.4.bb => libslirp_4.9.5.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.4.bb => libslirp_4.9.5.bb} (92%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
similarity index 92%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
index 79a24f3037..d77121bf30 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.4.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "d09dc9a70360ee7838acccbd234ab83f3b9b37a5"
+SRCREV = "390848f47391f412451b2d259d8527fabb51e5e3"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
-- 
2.47.1


--===============4063717347874906753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libslirp: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp: PKGV changed from 4.9.4 [default] to 4.9.5 [default]
packages/x86-64-v3-poky-linux/libslirp: SRC_URI changed from "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v4.9.4" to "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 598184 to 598568 (+0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.9.4 [default] to 4.9.5 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.9.4 [default] to 4.9.5 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.9.4 [default] to 4.9.5 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.9.4 [default] to 4.9.5 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 588882 to 590033 (+0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: FILELIST: directory renamed /usr/src/debug/libslirp/4.9.4/src -> /usr/src/debug/libslirp/4.9.5/src
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGV changed from 4.9.4 [default] to 4.9.5 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.9.4 [default] to 4.9.5 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp: PV changed from "4.9.4" to "4.9.5"
packages/x86-64-v3-poky-linux/libslirp/libslirp: PKGV changed from 4.9.4 [default] to 4.9.5 [default]

--===============4063717347874906753==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libslirp-changelog.txt"

## [4.9.5] - 2026-09-22
## Security

  - Fix bounds-check in processing OEM commands
  - Fix bounds-check in dhcpv6 against MTU

### Fixed
  - Fix blocking sendto on UDP ockets #97

[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...master
[4.9.5]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.4...v4.9.5

--===============4063717347874906753==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.9.4-4.9.5.patch"

RnJvbSAzMTk3ZmFmMmNjZGNhMzkwMjVkNDJlMDFhNmNkMzdhMjYxMzdmNjFlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjMgU2VwIDIwMjYgMDU6MjM6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzbGlycDogdXBncmFkZSA0LjkuNCAtPiA0LjkuNQoKIyMgWzQuOS41XSAtIDIwMjYtMDktMjIK
IyMgU2VjdXJpdHkKCiAgLSBGaXggYm91bmRzLWNoZWNrIGluIHByb2Nlc3NpbmcgT0VNIGNvbW1h
bmRzCiAgLSBGaXggYm91bmRzLWNoZWNrIGluIGRoY3B2NiBhZ2FpbnN0IE1UVQoKIyMjIEZpeGVk
CiAgLSBGaXggYmxvY2tpbmcgc2VuZHRvIG9uIFVEUCBvY2tldHMgIzk3CgpbVW5yZWxlYXNlZF06
Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9zbGlycC9saWJzbGlycC9jb21wYXJlL3Y0
LjkuNS4uLm1hc3RlcgpbNC45LjVdOiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvc2xp
cnAvbGlic2xpcnAvY29tcGFyZS92NC45LjQuLi52NC45LjUKLS0tCiAuLi4vc2xpcnAve2xpYnNs
aXJwXzQuOS40LmJiID0+IGxpYnNsaXJwXzQuOS41LmJifSAgICAgICAgICAgICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL3tsaWJzbGlycF80LjkuNC5iYiA9PiBsaWJzbGly
cF80LjkuNS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5
L3NsaXJwL2xpYnNsaXJwXzQuOS40LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGly
cC9saWJzbGlycF80LjkuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRh
L3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL2xpYnNsaXJwXzQuOS40LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL2xpYnNsaXJwXzQuOS41LmJiCmluZGV4IDc5
YTI0ZjMwMzcuLmQ3NzEyMWJmMzAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvc2xpcnAvbGlic2xpcnBfNC45LjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9zbGlycC9saWJzbGlycF80LjkuNS5iYgpAQCAtNiw3ICs2LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vQ09QWVJJR0hUO21kNT1mOTVhOWJmNGE3ZTQxMTE2NGZlODQzNjk3Y2NkYTU5
ZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFO21kNT1jZmVhNjA0NDY0MmZk
NjNiOTBjZTlkNzlmNWRiNjRkOSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0
b3Aub3JnL3NsaXJwL2xpYnNsaXJwLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyO3Rh
Zz12JHtQVn0iCi1TUkNSRVYgPSAiZDA5ZGM5YTcwMzYwZWU3ODM4YWNjY2JkMjM0YWI4M2YzYjli
MzdhNSIKK1NSQ1JFViA9ICIzOTA4NDhmNDczOTFmNDEyNDUxYjJkMjU5ZDg1MjdmYWJiNTFlNWUz
IgogVVBTVFJFQU1fQ0hFQ0tfR0lUVEFHUkVHRVggPSAidig/UDxwdmVyPlxkKyhcLlxkKykrKSIK
IAogREVQRU5EUyA9ICJnbGliLTIuMCIKLS0gCjIuNDcuMQoK

--===============4063717347874906753==--

