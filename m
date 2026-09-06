Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F837C79F9F
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 05:28:10 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8534.1788672481973235514
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 22:28:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HNItqMNu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Gn9kAy/2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101a075301693-a46a56f0-4d22-486d-b3be-bfb4eaffe31a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788672481;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=yx4obTmF4ukLFhw6XDTui9gdptE4QfzeSKUbyJ5z/fA=;
	b=HNItqMNuWKz6T+Tq9mMP3yMTusgkkIyOj5zfIvZp8o/no3piEPNIL/gJAWdabwmf
	Uswj/ttL3ojfjnGLFyXPVPWpi/ROCeBgt7Gba62ZicHWjZEGCdkmLkqe6CiX42bqiqW
	wHInn608RakatzQF/RGp2KsAfPnMP/V+se3nT0Is=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788672481;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=yx4obTmF4ukLFhw6XDTui9gdptE4QfzeSKUbyJ5z/fA=;
	b=Gn9kAy/2wfQHeZpNdW3ANYNmmpEos4mEh1x489bW8cVwiNseUxsz5cGP6TtFmCT3
	Ag1biJqAG8bwLySkUI7lsSZAEAqELglmPg1KCnvgIxKwYxFUV/E4w6ZcDd95lviBO+O
	8BG0Ahs4zTcMIjyYWNgV6qcCWItJQR3o2jX5Vq3Q=
Content-Type: multipart/mixed; boundary="===============1783215815037993180=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcap: upgrading to 1.10.7 SUCCEEDED
Message-ID: <010101a075301693-a46a56f0-4d22-486d-b3be-bfb4eaffe31a-000000@us-west-2.amazonses.com>
Date: Sun, 6 Sep 2026 05:28:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.06-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Sep 2026 05:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245199

--===============1783215815037993180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpcap* to *1.10.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcap-upgrade-1.10.6-1.10.7.patch
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
From b7d9c7a17272477e082260e2d29859768fdba973 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 6 Sep 2026 05:26:05 +0000
Subject: [PATCH] libpcap: upgrade 1.10.6 -> 1.10.7

Source: CHANGES

Saturday, September 5, 2026 / The Tcpdump Group
  Summary for 1.10.7 libpcap release
    General:
      Free p->opt.device on close, not on cleanup (issue #1615). Issue
        reported by Harrison Green.
    Source code:
      Deprecate bpf_filter().
    Packet filtering:
      Initialize the scratch memory store to 0.
      In "net <n> mask <m>" catch ENOMEM for the "m" too.
      CVE-2026-0799: Access M[] safely in the BPF interpreter.
      CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
      CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
      CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
      CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
      Validate BPF opcodes stricter.
      For "lsh" and "rsh" guard "#k" as well.
    Windows:
      Fix error return from memory allocation error.
    rpcap:
      CVE-2026-18313: Fix a memory leak in rpcapd.
      CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.
    Documentation:
      Remove list of OSes that support "ipv6-icmp"; all the ones we
        support appear to do so.
      Fix pcap_next_ex(3PCAP) man page to clarify the PCAP_ERROR_BREAK
        return value.
    Building and testing:
      CMake: Disable remote capture support on Windows by default.
      RDMA: Avoid valgrind errors when calling rdmasniff_findalldevs().
      Autoconf: Add QNX support to AC_LBL_LIBRARY_NET().
      capturetest: Treat SA_RESTART as optional.
    QNX:
      Disable zero-copy BPF to work around portability issues.
    DAG:
      Fix packet filtering with low snaplen.
    SNF:
      Fix packet filtering with low snaplen.
    Netmap:
      Set packet captured length based on the snapshot length and return
        value of the capture filter.
---
 ...error-messages-about-32-bit-integer-overflow.patch | 11 ++++-------
 .../libpcap/{libpcap_1.10.6.bb => libpcap_1.10.7.bb}  |  2 +-
 2 files changed, 5 insertions(+), 8 deletions(-)
 rename meta/recipes-connectivity/libpcap/{libpcap_1.10.6.bb => libpcap_1.10.7.bb} (95%)

diff --git a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
index 4f2af53762..5c14e189f0 100644
--- a/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
+++ b/meta/recipes-connectivity/libpcap/libpcap/0001-Fix-error-messages-about-32-bit-integer-overflow.patch
@@ -1,4 +1,4 @@
-From 217c3a07c7db694324b5c61eaaa07774735e2d7d Mon Sep 17 00:00:00 2001
+From 936de20fdc8475d3627986ff5525198332cf2b0a Mon Sep 17 00:00:00 2001
 From: Denis Ovsienko <denis@ovsienko.info>
 Date: Thu, 9 Oct 2025 20:51:45 +0100
 Subject: [PATCH] Fix error messages about 32-bit integer overflow.
@@ -40,7 +40,7 @@ Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
  2 files changed, 32 insertions(+), 10 deletions(-)
 
 diff --git a/pcap-filter.manmisc.in b/pcap-filter.manmisc.in
-index bfb692ff..929d668d 100644
+index 2444ff7..3c8a190 100644
 --- a/pcap-filter.manmisc.in
 +++ b/pcap-filter.manmisc.in
 @@ -18,7 +18,7 @@
@@ -52,7 +52,7 @@ index bfb692ff..929d668d 100644
  .SH NAME
  pcap-filter \- packet filter syntax
  .br
-@@ -886,6 +886,13 @@ integer constants (expressed in standard C syntax), the normal binary operators
+@@ -885,6 +885,13 @@ integer constants (expressed in standard C syntax), the normal binary operators
  a length operator, and special packet data
  accessors.  Note that all comparisons are unsigned, so that, for example,
  0x80000000 and 0xffffffff are > 0.
@@ -67,7 +67,7 @@ index bfb692ff..929d668d 100644
  The
  .B %
 diff --git a/scanner.l b/scanner.l
-index 57779497..49aaeab2 100644
+index 405d331..bd708c9 100644
 --- a/scanner.l
 +++ b/scanner.l
 @@ -48,8 +48,8 @@ typedef enum {
@@ -153,6 +153,3 @@ index 57779497..49aaeab2 100644
  				return STOULEN_ERROR;
  			}
  			n = (n * 10) + digit;
--- 
-2.34.1
-
diff --git a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb b/meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb
similarity index 95%
rename from meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
rename to meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb
index d381a4eb2f..fcbac2dc26 100644
--- a/meta/recipes-connectivity/libpcap/libpcap_1.10.6.bb
+++ b/meta/recipes-connectivity/libpcap/libpcap_1.10.7.bb
@@ -13,7 +13,7 @@ DEPENDS = "flex-native bison-native"
 SRC_URI = "https://www.tcpdump.org/release/${BP}.tar.xz \
 	   file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch \
           "
-SRC_URI[sha256sum] = "ec97d1206bdd19cb6bdd043eaa9f0037aa732262ec68e070fd7c7b5f834d5dfc"
+SRC_URI[sha256sum] = "68fa62cffb974f4275641ce14c2e2d75739251f30e00e6a0900903b247d76a03"
 
 inherit autotools binconfig-disabled pkgconfig
 
-- 
2.47.1


--===============1783215815037993180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpcap-changelog.txt"

Changelog for libpcap: 1.10.6 -> 1.10.7
Source: CHANGES

Saturday, September 5, 2026 / The Tcpdump Group
  Summary for 1.10.7 libpcap release
    General:
      Free p->opt.device on close, not on cleanup (issue #1615). Issue
        reported by Harrison Green.
    Source code:
      Deprecate bpf_filter().
    Packet filtering:
      Initialize the scratch memory store to 0.
      In "net <n> mask <m>" catch ENOMEM for the "m" too.
      CVE-2026-0799: Access M[] safely in the BPF interpreter.
      CVE-2026-31912: Mind the program bounds in pcap_offline_filter().
      CVE-2026-31911: Fail opcodes safely in the BPF interpreter.
      CVE-2026-6244: Avoid division by zero via pcap_offline_filter().
      CVE-2026-6554: Limit "ja L" looping in pcap_offline_filter().
      Validate BPF opcodes stricter.
      For "lsh" and "rsh" guard "#k" as well.
    Windows:
      Fix error return from memory allocation error.
    rpcap:
      CVE-2026-18313: Fix a memory leak in rpcapd.
      CVE-2026-18238: Fix RPCAP_MSG_PACKET validation.
    Documentation:
      Remove list of OSes that support "ipv6-icmp"; all the ones we
        support appear to do so.
      Fix pcap_next_ex(3PCAP) man page to clarify the PCAP_ERROR_BREAK
        return value.
    Building and testing:
      CMake: Disable remote capture support on Windows by default.
      RDMA: Avoid valgrind errors when calling rdmasniff_findalldevs().
      Autoconf: Add QNX support to AC_LBL_LIBRARY_NET().
      capturetest: Treat SA_RESTART as optional.
    QNX:
      Disable zero-copy BPF to work around portability issues.
    DAG:
      Fix packet filtering with low snaplen.
    SNF:
      Fix packet filtering with low snaplen.
    Netmap:
      Set packet captured length based on the snapshot length and return
        value of the capture filter.

--===============1783215815037993180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.6", added "/usr/lib/libpcap.so.1.10.7"
Changes to packages/x86-64-v3-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.6 to libpcap.so.1.10.7
  /usr/lib/libpcap.so.1.10.6 moved to /usr/lib/libpcap.so.1.10.7

--===============1783215815037993180==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpcap: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap: PV changed from "1.10.6" to "1.10.7"
packages/x86-64-v3-poky-linux/libpcap: SRC_URI changed from "https://www.tcpdump.org/release/libpcap-1.10.6.tar.xz file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch" to "https://www.tcpdump.org/release/libpcap-1.10.7.tar.xz file://0001-Fix-error-messages-about-32-bit-integer-overflow.patch"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: FILELIST: removed "/usr/lib/.debug/libpcap.so.1.10.6", added "/usr/lib/.debug/libpcap.so.1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PV changed from "1.10.6" to "1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dbg: PKGSIZE changed from 1083760 to 1082264 (-0%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PV changed from "1.10.6" to "1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap-dev: PKGSIZE changed from 175091 to 175136 (+0%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PV changed from "1.10.6" to "1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap-doc: PKGSIZE changed from 251637 to 252247 (+0%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-locale: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-locale: PV changed from "1.10.6" to "1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: FILELIST: directory renamed /usr/src/debug/libpcap/1.10.6 -> /usr/src/debug/libpcap/1.10.7, directory renamed /usr/src/debug/libpcap/1.10.6/pcap -> /usr/src/debug/libpcap/1.10.7/pcap
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PV changed from "1.10.6" to "1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap-src: PKGSIZE changed from 1559412 to 1566392 (+0%)
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PV changed from "1.10.6" to "1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap-staticdev: PKGSIZE changed from 1928036 to 1924826 (-0%)
packages/x86-64-v3-poky-linux/libpcap/libpcap: FILELIST: removed "/usr/lib/libpcap.so.1.10.6", added "/usr/lib/libpcap.so.1.10.7"
packages/x86-64-v3-poky-linux/libpcap/libpcap: PKGV changed from 1.10.6 [default] to 1.10.7 [default]
packages/x86-64-v3-poky-linux/libpcap/libpcap: PV changed from "1.10.6" to "1.10.7"
Changes to packages/x86-64-v3-poky-linux/libpcap (sysroot):
  /usr/lib/libpcap.so.1 changed symlink target from libpcap.so.1.10.6 to libpcap.so.1.10.7
  /usr/lib/libpcap.so.1.10.6 moved to /usr/lib/libpcap.so.1.10.7

--===============1783215815037993180==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcap-upgrade-1.10.6-1.10.7.patch"

RnJvbSBiN2Q5YzdhMTcyNzI0NzdlMDgyMjYwZTJkMjk4NTk3NjhmZGJhOTczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgNiBTZXAgMjAyNiAwNToyNjowNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnBjYXA6IHVwZ3JhZGUgMS4xMC42IC0+IDEuMTAuNwoKU291cmNlOiBDSEFOR0VTCgpTYXR1cmRh
eSwgU2VwdGVtYmVyIDUsIDIwMjYgLyBUaGUgVGNwZHVtcCBHcm91cAogIFN1bW1hcnkgZm9yIDEu
MTAuNyBsaWJwY2FwIHJlbGVhc2UKICAgIEdlbmVyYWw6CiAgICAgIEZyZWUgcC0+b3B0LmRldmlj
ZSBvbiBjbG9zZSwgbm90IG9uIGNsZWFudXAgKGlzc3VlICMxNjE1KS4gSXNzdWUKICAgICAgICBy
ZXBvcnRlZCBieSBIYXJyaXNvbiBHcmVlbi4KICAgIFNvdXJjZSBjb2RlOgogICAgICBEZXByZWNh
dGUgYnBmX2ZpbHRlcigpLgogICAgUGFja2V0IGZpbHRlcmluZzoKICAgICAgSW5pdGlhbGl6ZSB0
aGUgc2NyYXRjaCBtZW1vcnkgc3RvcmUgdG8gMC4KICAgICAgSW4gIm5ldCA8bj4gbWFzayA8bT4i
IGNhdGNoIEVOT01FTSBmb3IgdGhlICJtIiB0b28uCiAgICAgIENWRS0yMDI2LTA3OTk6IEFjY2Vz
cyBNW10gc2FmZWx5IGluIHRoZSBCUEYgaW50ZXJwcmV0ZXIuCiAgICAgIENWRS0yMDI2LTMxOTEy
OiBNaW5kIHRoZSBwcm9ncmFtIGJvdW5kcyBpbiBwY2FwX29mZmxpbmVfZmlsdGVyKCkuCiAgICAg
IENWRS0yMDI2LTMxOTExOiBGYWlsIG9wY29kZXMgc2FmZWx5IGluIHRoZSBCUEYgaW50ZXJwcmV0
ZXIuCiAgICAgIENWRS0yMDI2LTYyNDQ6IEF2b2lkIGRpdmlzaW9uIGJ5IHplcm8gdmlhIHBjYXBf
b2ZmbGluZV9maWx0ZXIoKS4KICAgICAgQ1ZFLTIwMjYtNjU1NDogTGltaXQgImphIEwiIGxvb3Bp
bmcgaW4gcGNhcF9vZmZsaW5lX2ZpbHRlcigpLgogICAgICBWYWxpZGF0ZSBCUEYgb3Bjb2RlcyBz
dHJpY3Rlci4KICAgICAgRm9yICJsc2giIGFuZCAicnNoIiBndWFyZCAiI2siIGFzIHdlbGwuCiAg
ICBXaW5kb3dzOgogICAgICBGaXggZXJyb3IgcmV0dXJuIGZyb20gbWVtb3J5IGFsbG9jYXRpb24g
ZXJyb3IuCiAgICBycGNhcDoKICAgICAgQ1ZFLTIwMjYtMTgzMTM6IEZpeCBhIG1lbW9yeSBsZWFr
IGluIHJwY2FwZC4KICAgICAgQ1ZFLTIwMjYtMTgyMzg6IEZpeCBSUENBUF9NU0dfUEFDS0VUIHZh
bGlkYXRpb24uCiAgICBEb2N1bWVudGF0aW9uOgogICAgICBSZW1vdmUgbGlzdCBvZiBPU2VzIHRo
YXQgc3VwcG9ydCAiaXB2Ni1pY21wIjsgYWxsIHRoZSBvbmVzIHdlCiAgICAgICAgc3VwcG9ydCBh
cHBlYXIgdG8gZG8gc28uCiAgICAgIEZpeCBwY2FwX25leHRfZXgoM1BDQVApIG1hbiBwYWdlIHRv
IGNsYXJpZnkgdGhlIFBDQVBfRVJST1JfQlJFQUsKICAgICAgICByZXR1cm4gdmFsdWUuCiAgICBC
dWlsZGluZyBhbmQgdGVzdGluZzoKICAgICAgQ01ha2U6IERpc2FibGUgcmVtb3RlIGNhcHR1cmUg
c3VwcG9ydCBvbiBXaW5kb3dzIGJ5IGRlZmF1bHQuCiAgICAgIFJETUE6IEF2b2lkIHZhbGdyaW5k
IGVycm9ycyB3aGVuIGNhbGxpbmcgcmRtYXNuaWZmX2ZpbmRhbGxkZXZzKCkuCiAgICAgIEF1dG9j
b25mOiBBZGQgUU5YIHN1cHBvcnQgdG8gQUNfTEJMX0xJQlJBUllfTkVUKCkuCiAgICAgIGNhcHR1
cmV0ZXN0OiBUcmVhdCBTQV9SRVNUQVJUIGFzIG9wdGlvbmFsLgogICAgUU5YOgogICAgICBEaXNh
YmxlIHplcm8tY29weSBCUEYgdG8gd29yayBhcm91bmQgcG9ydGFiaWxpdHkgaXNzdWVzLgogICAg
REFHOgogICAgICBGaXggcGFja2V0IGZpbHRlcmluZyB3aXRoIGxvdyBzbmFwbGVuLgogICAgU05G
OgogICAgICBGaXggcGFja2V0IGZpbHRlcmluZyB3aXRoIGxvdyBzbmFwbGVuLgogICAgTmV0bWFw
OgogICAgICBTZXQgcGFja2V0IGNhcHR1cmVkIGxlbmd0aCBiYXNlZCBvbiB0aGUgc25hcHNob3Qg
bGVuZ3RoIGFuZCByZXR1cm4KICAgICAgICB2YWx1ZSBvZiB0aGUgY2FwdHVyZSBmaWx0ZXIuCi0t
LQogLi4uZXJyb3ItbWVzc2FnZXMtYWJvdXQtMzItYml0LWludGVnZXItb3ZlcmZsb3cucGF0Y2gg
fCAxMSArKysrLS0tLS0tLQogLi4uL2xpYnBjYXAve2xpYnBjYXBfMS4xMC42LmJiID0+IGxpYnBj
YXBfMS4xMC43LmJifSAgfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyks
IDggZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJwY2Fw
L3tsaWJwY2FwXzEuMTAuNi5iYiA9PiBsaWJwY2FwXzEuMTAuNy5iYn0gKDk1JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcC8wMDAxLUZpeC1l
cnJvci1tZXNzYWdlcy1hYm91dC0zMi1iaXQtaW50ZWdlci1vdmVyZmxvdy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwLzAwMDEtRml4LWVycm9yLW1lc3Nh
Z2VzLWFib3V0LTMyLWJpdC1pbnRlZ2VyLW92ZXJmbG93LnBhdGNoCmluZGV4IDRmMmFmNTM3NjIu
LjVjMTRlMTg5ZjAgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNh
cC9saWJwY2FwLzAwMDEtRml4LWVycm9yLW1lc3NhZ2VzLWFib3V0LTMyLWJpdC1pbnRlZ2VyLW92
ZXJmbG93LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9saWJw
Y2FwLzAwMDEtRml4LWVycm9yLW1lc3NhZ2VzLWFib3V0LTMyLWJpdC1pbnRlZ2VyLW92ZXJmbG93
LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyMTdjM2EwN2M3ZGI2OTQzMjRiNWM2MWVhYWEw
Nzc3NDczNWUyZDdkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA5MzZkZTIwZmRjODQ3
NWQzNjI3OTg2ZmY1NTI1MTk4MzMyY2YyYjBhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJv
bTogRGVuaXMgT3ZzaWVua28gPGRlbmlzQG92c2llbmtvLmluZm8+CiBEYXRlOiBUaHUsIDkgT2N0
IDIwMjUgMjA6NTE6NDUgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gRml4IGVycm9yIG1lc3NhZ2Vz
IGFib3V0IDMyLWJpdCBpbnRlZ2VyIG92ZXJmbG93LgpAQCAtNDAsNyArNDAsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBBZGFyc2ggSmFnYWRpc2ggS2FtaW5pIDxhZGFyc2guamFnYWRpc2gua2FtaW5pQGVz
dC50ZWNoPgogIDIgZmlsZXMgY2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9wY2FwLWZpbHRlci5tYW5taXNjLmluIGIvcGNhcC1maWx0ZXIu
bWFubWlzYy5pbgotaW5kZXggYmZiNjkyZmYuLjkyOWQ2NjhkIDEwMDY0NAoraW5kZXggMjQ0NGZm
Ny4uM2M4YTE5MCAxMDA2NDQKIC0tLSBhL3BjYXAtZmlsdGVyLm1hbm1pc2MuaW4KICsrKyBiL3Bj
YXAtZmlsdGVyLm1hbm1pc2MuaW4KIEBAIC0xOCw3ICsxOCw3IEBACkBAIC01Miw3ICs1Miw3IEBA
IGluZGV4IGJmYjY5MmZmLi45MjlkNjY4ZCAxMDA2NDQKICAuU0ggTkFNRQogIHBjYXAtZmlsdGVy
IFwtIHBhY2tldCBmaWx0ZXIgc3ludGF4CiAgLmJyCi1AQCAtODg2LDYgKzg4NiwxMyBAQCBpbnRl
Z2VyIGNvbnN0YW50cyAoZXhwcmVzc2VkIGluIHN0YW5kYXJkIEMgc3ludGF4KSwgdGhlIG5vcm1h
bCBiaW5hcnkgb3BlcmF0b3JzCitAQCAtODg1LDYgKzg4NSwxMyBAQCBpbnRlZ2VyIGNvbnN0YW50
cyAoZXhwcmVzc2VkIGluIHN0YW5kYXJkIEMgc3ludGF4KSwgdGhlIG5vcm1hbCBiaW5hcnkgb3Bl
cmF0b3JzCiAgYSBsZW5ndGggb3BlcmF0b3IsIGFuZCBzcGVjaWFsIHBhY2tldCBkYXRhCiAgYWNj
ZXNzb3JzLiAgTm90ZSB0aGF0IGFsbCBjb21wYXJpc29ucyBhcmUgdW5zaWduZWQsIHNvIHRoYXQs
IGZvciBleGFtcGxlLAogIDB4ODAwMDAwMDAgYW5kIDB4ZmZmZmZmZmYgYXJlID4gMC4KQEAgLTY3
LDcgKzY3LDcgQEAgaW5kZXggYmZiNjkyZmYuLjkyOWQ2NjhkIDEwMDY0NAogIFRoZQogIC5CICUK
IGRpZmYgLS1naXQgYS9zY2FubmVyLmwgYi9zY2FubmVyLmwKLWluZGV4IDU3Nzc5NDk3Li40OWFh
ZWFiMiAxMDA2NDQKK2luZGV4IDQwNWQzMzEuLmJkNzA4YzkgMTAwNjQ0CiAtLS0gYS9zY2FubmVy
LmwKICsrKyBiL3NjYW5uZXIubAogQEAgLTQ4LDggKzQ4LDggQEAgdHlwZWRlZiBlbnVtIHsKQEAg
LTE1Myw2ICsxNTMsMyBAQCBpbmRleCA1Nzc3OTQ5Ny4uNDlhYWVhYjIgMTAwNjQ0CiAgCQkJCXJl
dHVybiBTVE9VTEVOX0VSUk9SOwogIAkJCX0KICAJCQluID0gKG4gKiAxMCkgKyBkaWdpdDsKLS0t
IAotMi4zNC4xCi0KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNh
cC9saWJwY2FwXzEuMTAuNi5iYiBiL21ldGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9s
aWJwY2FwXzEuMTAuNy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3Jl
Y2lwZXMtY29ubmVjdGl2aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjYuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicGNhcC9saWJwY2FwXzEuMTAuNy5iYgppbmRleCBk
MzgxYTRlYjJmLi5mY2JhYzJkYzI2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29ubmVjdGl2
aXR5L2xpYnBjYXAvbGlicGNhcF8xLjEwLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9saWJwY2FwL2xpYnBjYXBfMS4xMC43LmJiCkBAIC0xMyw3ICsxMyw3IEBAIERFUEVORFMg
PSAiZmxleC1uYXRpdmUgYmlzb24tbmF0aXZlIgogU1JDX1VSSSA9ICJodHRwczovL3d3dy50Y3Bk
dW1wLm9yZy9yZWxlYXNlLyR7QlB9LnRhci54eiBcCiAJICAgZmlsZTovLzAwMDEtRml4LWVycm9y
LW1lc3NhZ2VzLWFib3V0LTMyLWJpdC1pbnRlZ2VyLW92ZXJmbG93LnBhdGNoIFwKICAgICAgICAg
ICAiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWM5N2QxMjA2YmRkMTljYjZiZGQwNDNlYWE5ZjAw
MzdhYTczMjI2MmVjNjhlMDcwZmQ3YzdiNWY4MzRkNWRmYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI2OGZhNjJjZmZiOTc0ZjQyNzU2NDFjZTE0YzJlMmQ3NTczOTI1MWYzMGUwMGU2YTA5MDA5MDNi
MjQ3ZDc2YTAzIgogCiBpbmhlcml0IGF1dG90b29scyBiaW5jb25maWctZGlzYWJsZWQgcGtnY29u
ZmlnCiAKLS0gCjIuNDcuMQoK

--===============1783215815037993180==--

