Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305F5C9832A
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 06:18:51 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1855.1790662724947967574
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 23:18:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=OOjS7/dD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=vSQmA2A8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a0ebd0ca19-e8538a16-6229-4061-8bbb-a6dd3a79d435-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790662724;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wNap3wlS9EQjeg9pCUMckh83fkPY9+R0j8irRW6VImg=;
	b=OOjS7/dDwiQM9E8YxS8yCXJXjiot3s1PBmcXXhxFm5h5Az7n7g97VeXdKlFpkBIO
	C6Aq55LZCRldf4vFyB7/H5rzmbjMuCXcfgT7eGPc1CGusTa4o8IELtPV9YEmn6/Seyo
	izjWYPd7fOpCynpVsA6AkQ9L/0a6mV9UuQ7/FAGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790662724;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wNap3wlS9EQjeg9pCUMckh83fkPY9+R0j8irRW6VImg=;
	b=vSQmA2A8bseeze8IK8nk0YO+3uTcNMmhwGcQFRBdWhhq2PIC1YGjUp3ZaLomIzNP
	r9sp0X4jDcHuAzEh4tRMUyqCBVxOXwANXgpvzHYaK6AVHllSO93BDvAf1UVmsCfREaU
	6fz73Eot/aGxVzQQ2SsW1JXKa0jpy45cNCh3wdJk=
Content-Type: multipart/mixed; boundary="===============0055935145459416678=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libpcre2: upgrading to 10.49 SUCCEEDED
Message-ID: <010101a0ebd0ca19-e8538a16-6229-4061-8bbb-a6dd3a79d435-000000@us-west-2.amazonses.com>
Date: Tue, 29 Sep 2026 06:18:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.29-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 06:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246837

--===============0055935145459416678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libpcre2* to *10.49* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libpcre2-upgrade-10.48-10.49.patch
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
From 5aaa53e9188f5e46ed743d97a73d020055724357 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 29 Sep 2026 06:18:33 +0000
Subject: [PATCH] libpcre2: upgrade 10.48 -> 10.49

Version 10.49 28-September-2026
-------------------------------

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m.

Compared to 10.48, this release has only a minimal code change to prevent an
out-of-bounds write with arbitrary data. An attacker-controlled regex pattern
is required, and applications are only affected if using the
pcre2_jit_stack_create() and pcre2_jit_stack_assign() APIs to provide a growable
JIT stack, and then matching against a pattern with unusually high JIT stack
usage, such as a large number of capturing groups.

The implications of an out-of-bounds write could include arbitrary code
execution.

The issue is not a regression and affects releases 10.48 and earlier.
---
 .../libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libpcre/{libpcre2_10.48.bb => libpcre2_10.49.bb} (96%)

diff --git a/meta/recipes-support/libpcre/libpcre2_10.48.bb b/meta/recipes-support/libpcre/libpcre2_10.49.bb
similarity index 96%
rename from meta/recipes-support/libpcre/libpcre2_10.48.bb
rename to meta/recipes-support/libpcre/libpcre2_10.49.bb
index d5daff03c0..8e0c44fb4c 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.48.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.49.bb
@@ -19,7 +19,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/pcre2-(?P<pver>\d+(\.\d+)+)$"
 
-SRC_URI[sha256sum] = "b6c68fdf6f3ac31388b50aa89ff0fc49c00c987c16e7b5146491d12003f2c8ed"
+SRC_URI[sha256sum] = "53c156e1ba416a20da8e65395daa132da0d80e76910424caca3fcdae7831d384"
 
 CVE_PRODUCT = "pcre2"
 
-- 
2.47.1


--===============0055935145459416678==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libpcre2-upgrade-10.48-10.49.patch"

RnJvbSA1YWFhNTNlOTE4OGY1ZTQ2ZWQ3NDNkOTdhNzNkMDIwMDU1NzI0MzU3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjkgU2VwIDIwMjYgMDY6MTg6MzMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwY3JlMjogdXBncmFkZSAxMC40OCAtPiAxMC40OQoKVmVyc2lvbiAxMC40OSAyOC1TZXB0ZW1i
ZXItMjAyNgotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCgpUaGlzIGlzIGEgc2VjdXJp
dHktb25seSByZWxlYXNlLCB0byBhZGRyZXNzIEdIU0Etcjloai1qMnJ3LTRxM20uCgpDb21wYXJl
ZCB0byAxMC40OCwgdGhpcyByZWxlYXNlIGhhcyBvbmx5IGEgbWluaW1hbCBjb2RlIGNoYW5nZSB0
byBwcmV2ZW50IGFuCm91dC1vZi1ib3VuZHMgd3JpdGUgd2l0aCBhcmJpdHJhcnkgZGF0YS4gQW4g
YXR0YWNrZXItY29udHJvbGxlZCByZWdleCBwYXR0ZXJuCmlzIHJlcXVpcmVkLCBhbmQgYXBwbGlj
YXRpb25zIGFyZSBvbmx5IGFmZmVjdGVkIGlmIHVzaW5nIHRoZQpwY3JlMl9qaXRfc3RhY2tfY3Jl
YXRlKCkgYW5kIHBjcmUyX2ppdF9zdGFja19hc3NpZ24oKSBBUElzIHRvIHByb3ZpZGUgYSBncm93
YWJsZQpKSVQgc3RhY2ssIGFuZCB0aGVuIG1hdGNoaW5nIGFnYWluc3QgYSBwYXR0ZXJuIHdpdGgg
dW51c3VhbGx5IGhpZ2ggSklUIHN0YWNrCnVzYWdlLCBzdWNoIGFzIGEgbGFyZ2UgbnVtYmVyIG9m
IGNhcHR1cmluZyBncm91cHMuCgpUaGUgaW1wbGljYXRpb25zIG9mIGFuIG91dC1vZi1ib3VuZHMg
d3JpdGUgY291bGQgaW5jbHVkZSBhcmJpdHJhcnkgY29kZQpleGVjdXRpb24uCgpUaGUgaXNzdWUg
aXMgbm90IGEgcmVncmVzc2lvbiBhbmQgYWZmZWN0cyByZWxlYXNlcyAxMC40OCBhbmQgZWFybGll
ci4KLS0tCiAuLi4vbGlicGNyZS97bGlicGNyZTJfMTAuNDguYmIgPT4gbGlicGNyZTJfMTAuNDku
YmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL3tsaWJwY3Jl
Ml8xMC40OC5iYiA9PiBsaWJwY3JlMl8xMC40OS5iYn0gKDk2JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQ4LmJiIGIvbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlicGNyZS9saWJwY3JlMl8xMC40OS5iYgpzaW1pbGFyaXR5IGluZGV4IDk2JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQ4LmJi
CnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwY3JlL2xpYnBjcmUyXzEwLjQ5LmJi
CmluZGV4IGQ1ZGFmZjAzYzAuLjhlMGM0NGZiNGMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1z
dXBwb3J0L2xpYnBjcmUvbGlicGNyZTJfMTAuNDguYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBv
cnQvbGlicGNyZS9saWJwY3JlMl8xMC40OS5iYgpAQCAtMTksNyArMTksNyBAQCBTUkNfVVJJID0g
IiR7R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC9wY3JlMi0ke1BWfS9wY3JlMi0ke1BWfS50YXIu
YnoyIFwKIEdJVEhVQl9CQVNFX1VSSSA9ICJodHRwczovL2dpdGh1Yi5jb20vUENSRTJQcm9qZWN0
L3BjcmUyL3JlbGVhc2VzIgogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAicmVsZWFzZXMvdGFnL3Bj
cmUyLSg/UDxwdmVyPlxkKyhcLlxkKykrKSQiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJiNmM2
OGZkZjZmM2FjMzEzODhiNTBhYTg5ZmYwZmM0OWMwMGM5ODdjMTZlN2I1MTQ2NDkxZDEyMDAzZjJj
OGVkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjUzYzE1NmUxYmE0MTZhMjBkYThlNjUzOTVkYWEx
MzJkYTBkODBlNzY5MTA0MjRjYWNhM2ZjZGFlNzgzMWQzODQiCiAKIENWRV9QUk9EVUNUID0gInBj
cmUyIgogCi0tIAoyLjQ3LjEKCg==

--===============0055935145459416678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libpcre2: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2: SRC_URI changed from "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.48/pcre2-10.48.tar.bz2 file://run-ptest" to "https://github.com/PCRE2Project/pcre2/releases/download/pcre2-10.49/pcre2-10.49.tar.bz2 file://run-ptest"
packages/x86-64-v3-poky-linux/libpcre2: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.16.0", added "/usr/lib/libpcre2-16.so.0.16.1"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.16.0", added "/usr/lib/libpcre2-32.so.0.16.1"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PKGSIZE changed from 4418400 to 4418552 (+0%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dbg: FILELIST: removed "/usr/lib/.debug/libpcre2-8.so.0.16.0 /usr/lib/.debug/libpcre2-posix.so.3.0.8 /usr/lib/.debug/libpcre2-32.so.0.16.0 /usr/lib/.debug/libpcre2-16.so.0.16.0", added "/usr/lib/.debug/libpcre2-8.so.0.16.1 /usr/lib/.debug/libpcre2-32.so.0.16.1 /usr/lib/.debug/libpcre2-posix.so.3.0.9 /usr/lib/.debug/libpcre2-16.so.0.16.1"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-dev: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PKGSIZE changed from 2865434 to 2867518 (+0%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-doc: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-locale: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-locale: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-ptest: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-ptest: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PKGSIZE changed from 2925848 to 2926731 (+0%)
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-src: FILELIST: directory renamed /usr/src/debug/libpcre2/10.48/src -> /usr/src/debug/libpcre2/10.49/src
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-staticdev: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-staticdev: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-8.so.0.16.0 /usr/lib/libpcre2-posix.so.3.0.8", added "/usr/lib/libpcre2-posix.so.3.0.9 /usr/lib/libpcre2-8.so.0.16.1"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep-doc: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep-doc: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/pcre2grep: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/pcre2test-doc: PKGV changed from 10.48 [default] to 10.49 [default]
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PV changed from "10.48" to "10.49"
packages/x86-64-v3-poky-linux/libpcre2/pcre2test: PKGV changed from 10.48 [default] to 10.49 [default]
Changes to packages/x86-64-v3-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-8.so.0.16.0 moved to /usr/lib/libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3.0.8 moved to /usr/lib/libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-16.so.0.16.1 was added
  /usr/lib/libpcre2-32.so.0.16.1 was added
  /usr/lib/libpcre2-16.so.0.16.0 was removed
  /usr/lib/libpcre2-32.so.0.16.0 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-8.so.0.16.0 moved to /usr/lib/libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3.0.8 moved to /usr/lib/libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-16.so.0.16.1 was added
  /usr/lib/libpcre2-32.so.0.16.1 was added
  /usr/lib/libpcre2-16.so.0.16.0 was removed
  /usr/lib/libpcre2-32.so.0.16.0 was removed

--===============0055935145459416678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="libpcre2-changelog.txt"

Version 10.49 28-September-2026
-------------------------------

This is a security-only release, to address GHSA-r9hj-j2rw-4q3m.

Compared to 10.48, this release has only a minimal code change to prevent an
out-of-bounds write with arbitrary data. An attacker-controlled regex pattern
is required, and applications are only affected if using the
pcre2_jit_stack_create() and pcre2_jit_stack_assign() APIs to provide a growable
JIT stack, and then matching against a pattern with unusually high JIT stack
usage, such as a large number of capturing groups.

The implications of an out-of-bounds write could include arbitrary code
execution.

The issue is not a regression and affects releases 10.48 and earlier.

--===============0055935145459416678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libpcre2/libpcre2-16: FILELIST: removed "/usr/lib/libpcre2-16.so.0.16.0", added "/usr/lib/libpcre2-16.so.0.16.1"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2-32: FILELIST: removed "/usr/lib/libpcre2-32.so.0.16.0", added "/usr/lib/libpcre2-32.so.0.16.1"
packages/x86-64-v3-poky-linux/libpcre2/libpcre2: FILELIST: removed "/usr/lib/libpcre2-posix.so.3.0.8 /usr/lib/libpcre2-8.so.0.16.0", added "/usr/lib/libpcre2-posix.so.3.0.9 /usr/lib/libpcre2-8.so.0.16.1"
Changes to packages/x86-64-v3-poky-linux/libpcre2 (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-8.so.0.16.0 moved to /usr/lib/libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3.0.8 moved to /usr/lib/libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-16.so.0.16.1 was added
  /usr/lib/libpcre2-32.so.0.16.1 was added
  /usr/lib/libpcre2-16.so.0.16.0 was removed
  /usr/lib/libpcre2-32.so.0.16.0 was removed
Changes to packages/x86_64-linux/libpcre2-native (sysroot):
  /usr/lib/libpcre2-16.so.0 changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-16.so changed symlink target from libpcre2-16.so.0.16.0 to libpcre2-16.so.0.16.1
  /usr/lib/libpcre2-32.so.0 changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-32.so changed symlink target from libpcre2-32.so.0.16.0 to libpcre2-32.so.0.16.1
  /usr/lib/libpcre2-8.so.0 changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-8.so changed symlink target from libpcre2-8.so.0.16.0 to libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3 changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-posix.so changed symlink target from libpcre2-posix.so.3.0.8 to libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-8.so.0.16.0 moved to /usr/lib/libpcre2-8.so.0.16.1
  /usr/lib/libpcre2-posix.so.3.0.8 moved to /usr/lib/libpcre2-posix.so.3.0.9
  /usr/lib/libpcre2-16.so.0.16.1 was added
  /usr/lib/libpcre2-32.so.0.16.1 was added
  /usr/lib/libpcre2-16.so.0.16.0 was removed
  /usr/lib/libpcre2-32.so.0.16.0 was removed

--===============0055935145459416678==--

