Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CAE4CDE007
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 05:42:42 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5036.1782366154080167329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 22:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=N6RN5Use;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qi4MVwbz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019efd4d29ce-7316a410-1ab1-40eb-bf45-2893eb9bfa44-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782366153;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=bjAJ3tmkR+Zdvci8sDEsFgHEsF7nGtVf1MtTe2rQgSI=;
	b=N6RN5Uset72xeB2mQp4qojZAorTAxk0OvsHf0iZOEEYifXXXQOV+2I3UWgHf7D+s
	edJuw8PnUQoBa45QNioz5PVVwUcCZ5fhzerAgVcF0OSp+TS3G7S7feRCNhu1v6MoJGv
	ipKVzx7N/Fx2pG67zlQBZ6gDuJnB/CjZc0mNDwME=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782366153;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=bjAJ3tmkR+Zdvci8sDEsFgHEsF7nGtVf1MtTe2rQgSI=;
	b=qi4MVwbzmr1mNUArPrSmCMSwBQimUjHqQwATZjuYo8rQv3iHyfUve3y2hSJ9P4kc
	u5Qpjr/pISeeL9/H549J32/9nAlTAg345A5/ZedyyGnUh4dTAepyuPoL/M5W1s1Q5cJ
	X/Gz+NPcWCNWZtsd+Sz6/umarm2Ex2pBB2iFfTG4=
Content-Type: multipart/mixed; boundary="===============3620059412488855119=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpsl: upgrading to 0.22.0 SUCCEEDED
Message-ID: <0101019efd4d29ce-7316a410-1ab1-40eb-bf45-2893eb9bfa44-000000@us-west-2.amazonses.com>
Date: Thu, 25 Jun 2026 05:42:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.25-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 05:42:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239540

--===============3620059412488855119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpsl* to *0.22.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpsl-upgrade-0.21.5-0.22.0.patch
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
From 085ad9c675ad0c8295c84030f8616d1af81070a2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 25 Jun 2026 05:42:26 +0000
Subject: [PATCH] libpsl: upgrade 0.21.5 -> 0.22.0

---
 .../libpsl/{libpsl_0.21.5.bb => libpsl_0.22.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpsl/{libpsl_0.21.5.bb => libpsl_0.22.0.bb} (92%)

diff --git a/meta/recipes-support/libpsl/libpsl_0.21.5.bb b/meta/recipes-support/libpsl/libpsl_0.22.0.bb
similarity index 92%
rename from meta/recipes-support/libpsl/libpsl_0.21.5.bb
rename to meta/recipes-support/libpsl/libpsl_0.22.0.bb
index b9341a986e..741038ddc5 100644
--- a/meta/recipes-support/libpsl/libpsl_0.21.5.bb
+++ b/meta/recipes-support/libpsl/libpsl_0.22.0.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9f9e317096db2a598fc44237c5b8a4f7 \
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/${BP}.tar.gz \
            "
-SRC_URI[sha256sum] = "1dcc9ceae8b128f3c0b3f654decd0e1e891afc6ff81098f227ef260449dae208"
+SRC_URI[sha256sum] = "c45c3aa17576b99873e05a9b09a44041b065bbfa390e6d474d06fbfaeb9c7722"
 
 GITHUB_BASE_URI = "https://github.com/rockdaboot/libpsl/releases"
 
-- 
2.47.1


--===============3620059412488855119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: RRECOMMENDS: added "icu-dbg"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: RDEPENDS: added "icu-dev"
packages/x86-64-v3-poky-linux/libpsl/libpsl: FILELIST: removed "/usr/lib/libpsl.so.5.3.5", added "/usr/lib/libpsl.so.5.3.6"
Changes to packages/x86-64-v3-poky-linux/libpsl (sysroot):
  /usr/lib/libpsl.so.5 changed symlink target from libpsl.so.5.3.5 to libpsl.so.5.3.6
  /usr/lib/libpsl.so changed symlink target from libpsl.so.5.3.5 to libpsl.so.5.3.6
  /usr/lib/libpsl.so.5.3.5 moved to /usr/lib/libpsl.so.5.3.6

--===============3620059412488855119==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpsl-upgrade-0.21.5-0.22.0.patch"

RnJvbSAwODVhZDljNjc1YWQwYzgyOTVjODQwMzBmODYxNmQxYWY4MTA3MGEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMjUgSnVuIDIwMjYgMDU6NDI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwc2w6IHVwZ3JhZGUgMC4yMS41IC0+IDAuMjIuMAoKLS0tCiAuLi4vbGlicHNsL3tsaWJwc2xf
MC4yMS41LmJiID0+IGxpYnBzbF8wLjIyLjAuYmJ9ICAgICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwc2wve2xpYnBzbF8wLjIxLjUuYmIgPT4gbGlicHNsXzAuMjIuMC5i
Yn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwc2wvbGlicHNs
XzAuMjEuNS5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnBzbC9saWJwc2xfMC4yMi4wLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1zdXBwb3J0L2xp
YnBzbC9saWJwc2xfMC4yMS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJw
c2wvbGlicHNsXzAuMjIuMC5iYgppbmRleCBiOTM0MWE5ODZlLi43NDEwMzhkZGM1IDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwc2wvbGlicHNsXzAuMjEuNS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwc2wvbGlicHNsXzAuMjIuMC5iYgpAQCAtMTMsNyArMTMs
NyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT05ZjllMzE3MDk2ZGIy
YTU5OGZjNDQyMzdjNWI4YTRmNyBcCiAKIFNSQ19VUkkgPSAiJHtHSVRIVUJfQkFTRV9VUkl9L2Rv
d25sb2FkLyR7UFZ9LyR7QlB9LnRhci5neiBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hhMjU2
c3VtXSA9ICIxZGNjOWNlYWU4YjEyOGYzYzBiM2Y2NTRkZWNkMGUxZTg5MWFmYzZmZjgxMDk4ZjIy
N2VmMjYwNDQ5ZGFlMjA4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImM0NWMzYWExNzU3NmI5OTg3
M2UwNWE5YjA5YTQ0MDQxYjA2NWJiZmEzOTBlNmQ0NzRkMDZmYmZhZWI5Yzc3MjIiCiAKIEdJVEhV
Ql9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vcm9ja2RhYm9vdC9saWJwc2wvcmVsZWFz
ZXMiCiAKLS0gCjIuNDcuMQoK

--===============3620059412488855119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpsl: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl: SRC_URI changed from "https://github.com/rockdaboot/libpsl/releases/download/0.21.5/libpsl-0.21.5.tar.gz" to "https://github.com/rockdaboot/libpsl/releases/download/0.22.0/libpsl-0.22.0.tar.gz"
packages/x86-64-v3-poky-linux/libpsl: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-bin: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: RRECOMMENDS: added "icu-dbg"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: FILELIST: removed "/usr/lib/.debug/libpsl.so.5.3.5", added "/usr/lib/.debug/libpsl.so.5.3.6"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dbg: PKGSIZE changed from 150888 to 157664 (+4%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: PKGSIZE changed from 6039 to 6093 (+1%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-dev: RDEPENDS: added "icu-dev"
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-doc: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-locale: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: FILELIST: directory renamed /usr/src/debug/libpsl/0.21.5/src -> /usr/src/debug/libpsl/0.22.0/src, directory renamed /usr/src/debug/libpsl/0.21.5/tools -> /usr/src/debug/libpsl/0.22.0/tools, directory renamed /usr/src/debug/libpsl/0.21.5/include -> /usr/src/debug/libpsl/0.22.0/include
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl-src: PKGSIZE changed from 401045 to 428970 (+7%)
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl-staticdev: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl: PV changed from "0.21.5" to "0.22.0"
packages/x86-64-v3-poky-linux/libpsl/libpsl: FILELIST: removed "/usr/lib/libpsl.so.5.3.5", added "/usr/lib/libpsl.so.5.3.6"
packages/x86-64-v3-poky-linux/libpsl/libpsl: PKGV changed from 0.21.5 [default] to 0.22.0 [default]
packages/x86-64-v3-poky-linux/libpsl/libpsl: PKGSIZE changed from 79775 to 83871 (+5%)
Changes to packages/x86-64-v3-poky-linux/libpsl (sysroot):
  /usr/lib/libpsl.so.5 changed symlink target from libpsl.so.5.3.5 to libpsl.so.5.3.6
  /usr/lib/libpsl.so changed symlink target from libpsl.so.5.3.5 to libpsl.so.5.3.6
  /usr/lib/libpsl.so.5.3.5 moved to /usr/lib/libpsl.so.5.3.6

--===============3620059412488855119==--

