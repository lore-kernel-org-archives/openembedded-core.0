Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52E14C5CFCF
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 06:00:11 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1830.1786514410902148382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Aug 2026 23:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=sa46FzfN;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=RTudzebp;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019ff48e8a4d-cef6b374-841d-4499-8d0b-075455749537-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1786514410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=deX3oe6SV7bnDO6O281dUy0zUuoJbTEABOy9mEGutPM=;
	b=sa46FzfNfH7Qgox7X8lWbJTGVzAe0a3iXN3bWjrRVuum1ukBnFgdmD7szX+XptYP
	pySkDjsKKc1pnlhbwwm3l1m5pLEHOYXEt4YUL5346gewQWBzXHEmtzR7ea0H04L0bsj
	O0tHpC+o29nV7d1nqyaf3CGZ/W5QcKc6GQcwtWdw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1786514410;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=deX3oe6SV7bnDO6O281dUy0zUuoJbTEABOy9mEGutPM=;
	b=RTudzebpk73DQlraRZE62JPmMFwF5jvf+Abo/mSwgyoL5FDDg+pyxZyJQ2/oUrId
	HY3uEIzEtyZy+NI78De5AnZleN2RhNWIR/oEAC76o0rh9+gXUmeeNhYYl2bCuTp+/0B
	z/5OninFd+j/r2bR+8t/M+ioynUOqdQdw3nuifp0=
Content-Type: multipart/mixed; boundary="===============6183363886851643506=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gn: upgrading to 152bfad24cc836064b449a756ca8482a76cecdf9
 SUCCEEDED
Message-ID: <0101019ff48e8a4d-cef6b374-841d-4499-8d0b-075455749537-000000@us-west-2.amazonses.com>
Date: Wed, 12 Aug 2026 06:00:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.08.12-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 06:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243239

--===============6183363886851643506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gn* to *152bfad24cc836064b449a756ca8482a76cecdf9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gn-upgrade-to-latest-revision.patch
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
From 82109575a27ba47066c0969a57eaf1800c0702c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 12 Aug 2026 05:21:07 +0000
Subject: [PATCH] gn: upgrade to latest revision

152bfad2 Implement a Result<T> type.
6b0190f7 Fix formatter on main branch
73243639 Fix path to build/gen.py.
d1996a79 Add pre-upload checks into ninja targets
64cfb834 Add --exclude-type command-line argument
925dd782 Add CQ to starlark branch
a01a5a9b Refactor main.star to support multiple branches.
f9cea148 Implement rule implementation execution.
3a817c2e Create a simple session type and create a test for it.
37ab73c2 Fix lifetime of starlark struct keys passed to C++.
4ac29005 Rename .bzl to .scl in accordance with design doc guidance.
---
 meta/recipes-devtools/gn/gn_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gn/gn_git.bb b/meta/recipes-devtools/gn/gn_git.bb
index eddbbcdf7f..7fcbacb462 100644
--- a/meta/recipes-devtools/gn/gn_git.bb
+++ b/meta/recipes-devtools/gn/gn_git.bb
@@ -8,7 +8,7 @@ UPSTREAM_CHECK_COMMITS = "1"
 
 SRC_URI = "git://gn.googlesource.com/gn;protocol=https;branch=main \
 "
-SRCREV = "17b0057970fa2b07a20cbb4289ab78cf93565f35"
+SRCREV = "152bfad24cc836064b449a756ca8482a76cecdf9"
 PV = "0+git"
 
 BB_GIT_SHALLOW = ""
-- 
2.47.1


--===============6183363886851643506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c

--===============6183363886851643506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="gn-changelog.txt"

Changelog for gn: 0+git -> 0+git

152bfad2 Implement a Result<T> type.
6b0190f7 Fix formatter on main branch
73243639 Fix path to build/gen.py.
d1996a79 Add pre-upload checks into ninja targets
64cfb834 Add --exclude-type command-line argument
925dd782 Add CQ to starlark branch
a01a5a9b Refactor main.star to support multiple branches.
f9cea148 Implement rule implementation execution.
3a817c2e Create a simple session type and create a test for it.
37ab73c2 Fix lifetime of starlark struct keys passed to C++.
4ac29005 Rename .bzl to .scl in accordance with design doc guidance.

--===============6183363886851643506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-dbg: PKGSIZE changed from 108884032 to 109028192 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-dev: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-doc: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-locale: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-src: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn-src: PKGSIZE changed from 3265044 to 3274778 (+0%)
packages/x86-64-v3-poky-linux/gn/gn-staticdev: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn: PKGV changed from 0+git0+17b0057970 to 0+git0+152bfad24c
packages/x86-64-v3-poky-linux/gn/gn: PKGSIZE changed from 4112584 to 4116712 (+0%)

--===============6183363886851643506==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gn-upgrade-to-latest-revision.patch"

RnJvbSA4MjEwOTU3NWEyN2JhNDcwNjZjMDk2OWE1N2VhZjE4MDBjMDcwMmM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTIgQXVnIDIwMjYgMDU6MjE6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
bjogdXBncmFkZSB0byBsYXRlc3QgcmV2aXNpb24KCjE1MmJmYWQyIEltcGxlbWVudCBhIFJlc3Vs
dDxUPiB0eXBlLgo2YjAxOTBmNyBGaXggZm9ybWF0dGVyIG9uIG1haW4gYnJhbmNoCjczMjQzNjM5
IEZpeCBwYXRoIHRvIGJ1aWxkL2dlbi5weS4KZDE5OTZhNzkgQWRkIHByZS11cGxvYWQgY2hlY2tz
IGludG8gbmluamEgdGFyZ2V0cwo2NGNmYjgzNCBBZGQgLS1leGNsdWRlLXR5cGUgY29tbWFuZC1s
aW5lIGFyZ3VtZW50CjkyNWRkNzgyIEFkZCBDUSB0byBzdGFybGFyayBicmFuY2gKYTAxYTVhOWIg
UmVmYWN0b3IgbWFpbi5zdGFyIHRvIHN1cHBvcnQgbXVsdGlwbGUgYnJhbmNoZXMuCmY5Y2VhMTQ4
IEltcGxlbWVudCBydWxlIGltcGxlbWVudGF0aW9uIGV4ZWN1dGlvbi4KM2E4MTdjMmUgQ3JlYXRl
IGEgc2ltcGxlIHNlc3Npb24gdHlwZSBhbmQgY3JlYXRlIGEgdGVzdCBmb3IgaXQuCjM3YWI3M2My
IEZpeCBsaWZldGltZSBvZiBzdGFybGFyayBzdHJ1Y3Qga2V5cyBwYXNzZWQgdG8gQysrLgo0YWMy
OTAwNSBSZW5hbWUgLmJ6bCB0byAuc2NsIGluIGFjY29yZGFuY2Ugd2l0aCBkZXNpZ24gZG9jIGd1
aWRhbmNlLgotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9nbi9nbl9naXQuYmIgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2duL2duX2dpdC5iYgppbmRleCBlZGRiYmNkZjdmLi43ZmNiYWNiNDYyIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZ24vZ25fZ2l0LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9nbi9nbl9naXQuYmIKQEAgLTgsNyArOCw3IEBAIFVQU1RSRUFNX0NIRUNLX0NPTU1J
VFMgPSAiMSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9nbi5nb29nbGVzb3VyY2UuY29tL2duO3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1tYWluIFwKICIKLVNSQ1JFViA9ICIxN2IwMDU3OTcwZmEyYjA3YTIw
Y2JiNDI4OWFiNzhjZjkzNTY1ZjM1IgorU1JDUkVWID0gIjE1MmJmYWQyNGNjODM2MDY0YjQ0OWE3
NTZjYTg0ODJhNzZjZWNkZjkiCiBQViA9ICIwK2dpdCIKIAogQkJfR0lUX1NIQUxMT1cgPSAiIgot
LSAKMi40Ny4xCgo=

--===============6183363886851643506==--

