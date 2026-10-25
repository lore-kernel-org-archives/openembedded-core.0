Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18335.1792905490559892465
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Oct 2026 22:18:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Zd1sziqa;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=LlMM80ds;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a1717eac70-3c13bd49-ff3e-4c77-bee7-7bca09449bfc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792905489;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=ERfsd9rjzNt8HqFEUOEgzyPP3czr6a+Qh9QjkGhxpY8=;
	b=Zd1sziqawdAOHNWaLaRKFLiAhVO4ZKTHY8wwYSNRq5Pr2x61l8RqxyFBxIP7mk+R
	Yraqj4RUCHOz5sy2uga1IQFo2IsYi3cnqRagMNHBDw7V5tETo8Nwtld9iJJU4C7RHjd
	mCB7cpYhz9nVS+oQ/B78ag2f/IC0Dw4DboKSpHOM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792905489;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=ERfsd9rjzNt8HqFEUOEgzyPP3czr6a+Qh9QjkGhxpY8=;
	b=LlMM80dsiirmE6cN41fQ6l/zAouctweqzV2Ce7P8PjJ2ngffu7GGdKD4KSOPgl9P
	43DZvW+uOfl2UlG9FrXarwjfFTGoOdk95bMwxKv9ZblICgwHB78bd+YsHON7/az/bbJ
	Tb3ngaCBCEl7m9m9csbJ9r1UGDiKajSHVcuJr1Qg=
Content-Type: multipart/mixed; boundary="===============6651186188060620361=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libslirp: upgrading to 4.9.6 SUCCEEDED
Message-ID: <010101a1717eac70-3c13bd49-ff3e-4c77-bee7-7bca09449bfc-000000@us-west-2.amazonses.com>
Date: Sun, 25 Oct 2026 05:18:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.25-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2026 05:18:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248598

--===============6651186188060620361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libslirp* to *4.9.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.9.5-4.9.6.patch
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
From dbfb42c57dbfac4828bfc3c7410ec1684783bc28 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 25 Oct 2026 05:11:13 +0000
Subject: [PATCH] libslirp: upgrade 4.9.5 -> 4.9.6

## [4.9.6] - 2026-10-25
## Security

  - Fix Buffer Underflow in `tftp_handle_rrq()` When Handling Empty Filename
    #100
  - Fix Echo Reply Length Desynchronization in `icmp_receive()` and
    `icmp6_receive()` #105
  - Reject martians
  - tftp: check actual available room

## Fixed

  - Fix memory leak of tftp_server_name #99
  - Fix Protocol Type Mismatch in `icmp6_receive()`: IPv4 `ICMP_UNREACH` Emitted
    as ICMPv6 #101
  - Fix Double Socket Descriptor Leak in `fork_exec()` on Argument Parsing
    Failure #102
  - Fix Socket Heap Memory & Buffer Leak in `slirp_state_load()` on
    Deserialization or Validation Failure #103
  - Avoid Non-Reentrant Static Variable in `tcp_emu()` #104
  - pingtest: use SLIRP_CONFIG_VERSION_MAX
  - icmp: preserve guest TTL and forward traceroute ICMP errors !166
  - dns: proxy DNS queries sent to the virtual gateway address !163
  - tftp: Drop TFTP_BLOCKSIZE_MAX

  - Fix bounds-check in processing OEM commands (CVE-2026-95507)
  - Fix bounds-check in dhcpv6 against MTU (CVE-2026-95508)
[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.6...master
[4.9.5]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...v4.9.6
---
 .../slirp/{libslirp_4.9.5.bb => libslirp_4.9.6.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/slirp/{libslirp_4.9.5.bb => libslirp_4.9.6.bb} (92%)

diff --git a/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb b/meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
similarity index 92%
rename from meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
rename to meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
index d77121bf30..9d231f111d 100644
--- a/meta/recipes-connectivity/slirp/libslirp_4.9.5.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_4.9.6.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=f95a9bf4a7e411164fe843697ccda59e \
                     file://LICENSE;md5=cfea6044642fd63b90ce9d79f5db64d9"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "390848f47391f412451b2d259d8527fabb51e5e3"
+SRCREV = "392af90207fc51dd9f9044ee9b1f963f3c851c2c"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
 
 DEPENDS = "glib-2.0"
-- 
2.47.1


--===============6651186188060620361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libslirp: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp: SRC_URI changed from "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v4.9.5" to "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master;tag=v4.9.6"
packages/x86-64-v3-poky-linux/libslirp: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 598568 to 608568 (+2%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: FILELIST: directory renamed /usr/src/debug/libslirp/4.9.5/src -> /usr/src/debug/libslirp/4.9.6/src
packages/x86-64-v3-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 590033 to 607086 (+3%)
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp: PV changed from "4.9.5" to "4.9.6"
packages/x86-64-v3-poky-linux/libslirp/libslirp: PKGV changed from 4.9.5 [default] to 4.9.6 [default]
packages/x86-64-v3-poky-linux/libslirp/libslirp: PKGSIZE changed from 152793 to 156889 (+3%)

--===============6651186188060620361==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.9.5-4.9.6.patch"

RnJvbSBkYmZiNDJjNTdkYmZhYzQ4MjhiZmMzYzc0MTBlYzE2ODQ3ODNiYzI4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMjUgT2N0IDIwMjYgMDU6MTE6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzbGlycDogdXBncmFkZSA0LjkuNSAtPiA0LjkuNgoKIyMgWzQuOS42XSAtIDIwMjYtMTAtMjUK
IyMgU2VjdXJpdHkKCiAgLSBGaXggQnVmZmVyIFVuZGVyZmxvdyBpbiBgdGZ0cF9oYW5kbGVfcnJx
KClgIFdoZW4gSGFuZGxpbmcgRW1wdHkgRmlsZW5hbWUKICAgICMxMDAKICAtIEZpeCBFY2hvIFJl
cGx5IExlbmd0aCBEZXN5bmNocm9uaXphdGlvbiBpbiBgaWNtcF9yZWNlaXZlKClgIGFuZAogICAg
YGljbXA2X3JlY2VpdmUoKWAgIzEwNQogIC0gUmVqZWN0IG1hcnRpYW5zCiAgLSB0ZnRwOiBjaGVj
ayBhY3R1YWwgYXZhaWxhYmxlIHJvb20KCiMjIEZpeGVkCgogIC0gRml4IG1lbW9yeSBsZWFrIG9m
IHRmdHBfc2VydmVyX25hbWUgIzk5CiAgLSBGaXggUHJvdG9jb2wgVHlwZSBNaXNtYXRjaCBpbiBg
aWNtcDZfcmVjZWl2ZSgpYDogSVB2NCBgSUNNUF9VTlJFQUNIYCBFbWl0dGVkCiAgICBhcyBJQ01Q
djYgIzEwMQogIC0gRml4IERvdWJsZSBTb2NrZXQgRGVzY3JpcHRvciBMZWFrIGluIGBmb3JrX2V4
ZWMoKWAgb24gQXJndW1lbnQgUGFyc2luZwogICAgRmFpbHVyZSAjMTAyCiAgLSBGaXggU29ja2V0
IEhlYXAgTWVtb3J5ICYgQnVmZmVyIExlYWsgaW4gYHNsaXJwX3N0YXRlX2xvYWQoKWAgb24KICAg
IERlc2VyaWFsaXphdGlvbiBvciBWYWxpZGF0aW9uIEZhaWx1cmUgIzEwMwogIC0gQXZvaWQgTm9u
LVJlZW50cmFudCBTdGF0aWMgVmFyaWFibGUgaW4gYHRjcF9lbXUoKWAgIzEwNAogIC0gcGluZ3Rl
c3Q6IHVzZSBTTElSUF9DT05GSUdfVkVSU0lPTl9NQVgKICAtIGljbXA6IHByZXNlcnZlIGd1ZXN0
IFRUTCBhbmQgZm9yd2FyZCB0cmFjZXJvdXRlIElDTVAgZXJyb3JzICExNjYKICAtIGRuczogcHJv
eHkgRE5TIHF1ZXJpZXMgc2VudCB0byB0aGUgdmlydHVhbCBnYXRld2F5IGFkZHJlc3MgITE2Mwog
IC0gdGZ0cDogRHJvcCBURlRQX0JMT0NLU0laRV9NQVgKCiAgLSBGaXggYm91bmRzLWNoZWNrIGlu
IHByb2Nlc3NpbmcgT0VNIGNvbW1hbmRzIChDVkUtMjAyNi05NTUwNykKICAtIEZpeCBib3VuZHMt
Y2hlY2sgaW4gZGhjcHY2IGFnYWluc3QgTVRVIChDVkUtMjAyNi05NTUwOCkKW1VucmVsZWFzZWRd
OgpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvc2xpcnAvbGlic2xpcnAvY29tcGFyZS92
NC45LjYuLi5tYXN0ZXIKWzQuOS41XTogaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3Ns
aXJwL2xpYnNsaXJwL2NvbXBhcmUvdjQuOS41Li4udjQuOS42Ci0tLQogLi4uL3NsaXJwL3tsaWJz
bGlycF80LjkuNS5iYiA9PiBsaWJzbGlycF80LjkuNi5iYn0gICAgICAgICAgICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC97bGlic2xpcnBfNC45LjUuYmIgPT4gbGlic2xp
cnBfNC45LjYuYmJ9ICg5MiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0
eS9zbGlycC9saWJzbGlycF80LjkuNS5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2xp
cnAvbGlic2xpcnBfNC45LjYuYmIKc2ltaWxhcml0eSBpbmRleCA5MiUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC9saWJzbGlycF80LjkuNS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC9saWJzbGlycF80LjkuNi5iYgppbmRleCBk
NzcxMjFiZjMwLi45ZDIzMWYxMTFkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L3NsaXJwL2xpYnNsaXJwXzQuOS41LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZp
dHkvc2xpcnAvbGlic2xpcnBfNC45LjYuYmIKQEAgLTYsNyArNiw3IEBAIExJQ19GSUxFU19DSEtT
VU0gPSAiZmlsZTovL0NPUFlSSUdIVDttZDU9Zjk1YTliZjRhN2U0MTExNjRmZTg0MzY5N2NjZGE1
OWUgXAogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRTttZDU9Y2ZlYTYwNDQ2NDJm
ZDYzYjkwY2U5ZDc5ZjVkYjY0ZDkiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9zbGlycC9saWJzbGlycC5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcjt0
YWc9diR7UFZ9IgotU1JDUkVWID0gIjM5MDg0OGY0NzM5MWY0MTI0NTFiMmQyNTlkODUyN2ZhYmI1
MWU1ZTMiCitTUkNSRVYgPSAiMzkyYWY5MDIwN2ZjNTFkZDlmOTA0NGVlOWIxZjk2M2YzYzg1MWMy
YyIKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VYID0gInYoP1A8cHZlcj5cZCsoXC5cZCspKyki
CiAKIERFUEVORFMgPSAiZ2xpYi0yLjAiCi0tIAoyLjQ3LjEKCg==

--===============6651186188060620361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libslirp-changelog.txt"

## [4.9.6] - 2026-10-25
## Security

  - Fix Buffer Underflow in `tftp_handle_rrq()` When Handling Empty Filename
    #100
  - Fix Echo Reply Length Desynchronization in `icmp_receive()` and
    `icmp6_receive()` #105
  - Reject martians
  - tftp: check actual available room

## Fixed

  - Fix memory leak of tftp_server_name #99
  - Fix Protocol Type Mismatch in `icmp6_receive()`: IPv4 `ICMP_UNREACH` Emitted
    as ICMPv6 #101
  - Fix Double Socket Descriptor Leak in `fork_exec()` on Argument Parsing
    Failure #102
  - Fix Socket Heap Memory & Buffer Leak in `slirp_state_load()` on
    Deserialization or Validation Failure #103
  - Avoid Non-Reentrant Static Variable in `tcp_emu()` #104
  - pingtest: use SLIRP_CONFIG_VERSION_MAX
  - icmp: preserve guest TTL and forward traceroute ICMP errors !166
  - dns: proxy DNS queries sent to the virtual gateway address !163
  - tftp: Drop TFTP_BLOCKSIZE_MAX

  - Fix bounds-check in processing OEM commands (CVE-2026-95507)
  - Fix bounds-check in dhcpv6 against MTU (CVE-2026-95508)
[Unreleased]:
https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.6...master
[4.9.5]: https://gitlab.freedesktop.org/slirp/libslirp/compare/v4.9.5...v4.9.6

--===============6651186188060620361==--
