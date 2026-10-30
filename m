Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6186.1793344580202982431
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Oct 2026 00:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K6Evy4cG;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tzQSaKSD;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a18baaa5cb-7fb85e67-7ebd-4f96-9915-5b99976d70a3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793344579;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=F6FGxe8nhqUmyWIiX1a04DfCNYn99tXO87eupIker4A=;
	b=K6Evy4cGbUoLnMuEhlroKrCx1jtD2p7PSZDQZUvCmkbbXmLt5lcGlslwWfihCz+t
	rBJ7mzksFBn32nFcspX4OycCim5JuYYRRtEIx7v4W7LWL3uhiQLHjyfcbfcAfp8gXT6
	RQVMVPUdvS4YMCQoNlSfbgvWThPiUMNa0kg/Lo0A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793344579;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=F6FGxe8nhqUmyWIiX1a04DfCNYn99tXO87eupIker4A=;
	b=tzQSaKSDQKeAjJ4FL8CU+euBEEZ2KoFbBM7HPp37wMNOuR1cNTK17gBaSbZU8yUi
	yZCKv5s1h0UR7vAPDSNdk+OPkA08N7DblKyhfdqpyFDzOWeeIXzPEku5/o3nq4JDkIP
	o3EB/tJamid4GK7J9yemQD7GyB41hK3GNMs/9VwI=
Content-Type: multipart/mixed; boundary="===============3054127222177550986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libslirp: upgrading to 4.9.7 SUCCEEDED
Message-ID: <010101a18baaa5cb-7fb85e67-7ebd-4f96-9915-5b99976d70a3-000000@us-west-2.amazonses.com>
Date: Fri, 30 Oct 2026 07:16:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.30-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 30 Oct 2026 07:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248995

--===============3054127222177550986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libslirp* to *4.9.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.9.6-4.9.7.patch
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
From c8f6d296019a8783d7b62dfb8bc8472fd8b86062 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 30 Oct 2026 05:13:09 +0000
Subject: [PATCH] libslirp: upgrade 4.9.6 -> 4.9.7

## [4.9.7] - 2026-10-30
### Security

  - ip6_icmp: Fix memory leak on ipv6 ping
  - icmp_forward_error: Fix Out-of-Bounds Heap Read & Information Disclosure
  - if_output: Fix Queue Pointer Corruption and Crash
  - ARP/NDP: avoid adding records for multicast addresses and our addresses

### Fixed

  - Fix build with llvm
  - bootp: Fix endianness of addition

### Security
### Fixed
### Security
### Security
### Security
[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.7...master
[4.9.7]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.6...v4.9.7
[4.9.6]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...v4.9.6
---
 .../slirp/{libslirp_4.9.6.bb => libslirp_4.9.7.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.6.bb => libslirp_4.9.7.bb} (86%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.6.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.7.bb
similarity index 86%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.7.bb
index 9d231f111d..11e6679dea 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.7.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause AND MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
-SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "392af90207fc51dd9f9044ee9b1f963f3c851c2c"
+SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=stable-4.9;tag=v${PV}"
+SRCREV = "ce12dcddf710a71dc0de6450ec95edbadf8e9f66"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
-- 
2.47.1


--===============3054127222177550986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libslirp: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp: SRC_URI changed from "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v4.9.6" to "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=stable-4.9;tag=v4.9.7"
packages/x86-64-v3-poky-linux/libslirp: PV changed from "4.9.6" to "4.9.7"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 608568 to 609128 (+0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PV changed from "4.9.6" to "4.9.7"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PV changed from "4.9.6" to "4.9.7"
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PV changed from "4.9.6" to "4.9.7"
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PV changed from "4.9.6" to "4.9.7"
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: FILELIST: directory renamed /usr/src/debug/libslirp/4.9.6/src -> /usr/src/debug/libslirp/4.9.7/src
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 607086 to 607597 (+0%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PV changed from "4.9.6" to "4.9.7"
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.9.6" to "4.9.7"
packages/x86-64-v3-poky-linux/libslirp/libslirp: PKGV changed from 4.9.6 [default] to 4.9.7 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp: PV changed from "4.9.6" to "4.9.7"

--===============3054127222177550986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.9.6-4.9.7.patch"

RnJvbSBjOGY2ZDI5NjAxOWE4NzgzZDdiNjJkZmI4YmM4NDcyZmQ4Yjg2MDYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMzAgT2N0IDIwMjYgMDU6MTM6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzbGlycDogdXBncmFkZSA0LjkuNiAtPiA0LjkuNwoKIyMgWzQuOS43XSAtIDIwMjYtMTAtMzAK
IyMjIFNlY3VyaXR5CgogIC0gaXA2X2ljbXA6IEZpeCBtZW1vcnkgbGVhayBvbiBpcHY2IHBpbmcK
ICAtIGljbXBfZm9yd2FyZF9lcnJvcjogRml4IE91dC1vZi1Cb3VuZHMgSGVhcCBSZWFkICYgSW5m
b3JtYXRpb24gRGlzY2xvc3VyZQogIC0gaWZfb3V0cHV0OiBGaXggUXVldWUgUG9pbnRlciBDb3Jy
dXB0aW9uIGFuZCBDcmFzaAogIC0gQVJQL05EUDogYXZvaWQgYWRkaW5nIHJlY29yZHMgZm9yIG11
bHRpY2FzdCBhZGRyZXNzZXMgYW5kIG91ciBhZGRyZXNzZXMKCiMjIyBGaXhlZAoKICAtIEZpeCBi
dWlsZCB3aXRoIGxsdm0KICAtIGJvb3RwOiBGaXggZW5kaWFubmVzcyBvZiBhZGRpdGlvbgoKIyMj
IFNlY3VyaXR5CiMjIyBGaXhlZAojIyMgU2VjdXJpdHkKIyMjIFNlY3VyaXR5CiMjIyBTZWN1cml0
eQpbVW5yZWxlYXNlZF06Cmh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9zbGlycC9saWJz
bGlycC9jb21wYXJlL3Y0LjkuNy4uLm1hc3RlcgpbNC45LjddOiBodHRwczovL2dpdGxhYi5mcmVl
ZGVza3RvcC5vcmcvc2xpcnAvbGlic2xpcnAvY29tcGFyZS92NC45LjYuLi52NC45LjcKWzQuOS42
XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3NsaXJwL2xpYnNsaXJwL2NvbXBhcmUv
djQuOS41Li4udjQuOS42Ci0tLQogLi4uL3NsaXJwL3tsaWJzbGlycF80LjkuNi5iYiA9PiBsaWJz
bGlycF80LjkuNy5iYn0gICAgICAgICAgICB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3NsaXJwL3tsaWJzbGlycF80LjkuNi5iYiA9PiBsaWJzbGlycF80LjkuNy5iYn0gKDg2JSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L3NsaXJwL2xpYnNsaXJwXzQu
OS42LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC9saWJzbGlycF80LjkuNy5i
YgpzaW1pbGFyaXR5IGluZGV4IDg2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3NsaXJwL2xpYnNsaXJwXzQuOS42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtY29ubmVj
dGl2aXR5L3NsaXJwL2xpYnNsaXJwXzQuOS43LmJiCmluZGV4IDlkMjMxZjExMWQuLjExZTY2Nzlk
ZWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBf
NC45LjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC9saWJzbGlycF80
LjkuNy5iYgpAQCAtNSw4ICs1LDggQEAgTElDRU5TRSA9ICJCU0QtMy1DbGF1c2UgQU5EIE1JVCIK
IExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlSSUdIVDttZDU9Zjk1YTliZjRhN2U0MTEx
NjRmZTg0MzY5N2NjZGE1OWUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRTtt
ZDU9Y2ZlYTYwNDQ2NDJmZDYzYjkwY2U5ZDc5ZjVkYjY0ZDkiCiAKLVNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9zbGlycC9saWJzbGlycC5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPW1hc3Rlcjt0YWc9diR7UFZ9IgotU1JDUkVWID0gIjM5MmFmOTAyMDdmYzUxZGQ5Zjkw
NDRlZTliMWY5NjNmM2M4NTFjMmMiCitTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3Rv
cC5vcmcvc2xpcnAvbGlic2xpcnAuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1zdGFibGUtNC45
O3RhZz12JHtQVn0iCitTUkNSRVYgPSAiY2UxMmRjZGRmNzEwYTcxZGMwZGU2NDUwZWM5NWVkYmFk
ZjhlOWY2NiIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5c
ZCspKykiCiAKIERFUEVORFMgPSAiZ2xpYi0yLjAiCi0tIAoyLjQ3LjEKCg==

--===============3054127222177550986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libslirp-changelog.txt"

## [4.9.7] - 2026-10-30
### Security

  - ip6_icmp: Fix memory leak on ipv6 ping
  - icmp_forward_error: Fix Out-of-Bounds Heap Read & Information Disclosure
  - if_output: Fix Queue Pointer Corruption and Crash
  - ARP/NDP: avoid adding records for multicast addresses and our addresses

### Fixed

  - Fix build with llvm
  - bootp: Fix endianness of addition

### Security
### Fixed
### Security
### Security
### Security
[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.7...master
[4.9.7]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.6...v4.9.7
[4.9.6]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...v4.9.6

--===============3054127222177550986==--
