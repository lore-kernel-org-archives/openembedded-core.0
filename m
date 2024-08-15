Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D546DC54730
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 18:59:02 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.131429.1723748334518123422
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Aug 2024 11:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FHW1utku;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=a6RzpobO;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101019157683f7c-ee72de78-0819-483c-ba4b-9d074919bddd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=I4QD8Plw/jLVSkIOEz4T/aO9p3ZiWYmT3rPV04Ifmhw=;
	b=FHW1utku095gxxRjTx6fbAixDsZRZJPQ1NTeqpgAkKqSJ+NqKAC7ZzImYHhMDjRs
	fUVxb4SJOgro8re/GC8qchoL50uGndXNoC0EfU7icRWuO5f8cOSfYzbKKBAgdDswdk8
	g1ecbIDTZTT6lRIt8sunBZ5oVX+kxM4pJU2jLvuA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1723748335;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=I4QD8Plw/jLVSkIOEz4T/aO9p3ZiWYmT3rPV04Ifmhw=;
	b=a6RzpobOitcsZyuCoVtc8wO1/DBmy3QbGnDBQ4Y/Z5Qcl81GZ+32eAscvjCG9j81
	LJ+ZnMG9qRfRpG1W8qIcSvu3Wpp21PwYh7vy+ktKThA50QPUlGw620zchL0PhNkLoG/
	401TnGuVlcxluZFyIuleM8yJmkeqZ5AkiNy3T4/w=
Content-Type: multipart/mixed; boundary="===============4886169545839688596=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 274 SUCCEEDED
Message-ID: <0101019157683f7c-ee72de78-0819-483c-ba4b-9d074919bddd-000000@us-west-2.amazonses.com>
Date: Thu, 15 Aug 2024 18:58:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Aug 2024 18:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203436

--===============4886169545839688596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *274* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-272-274.patch
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
From 63fe024ecc061ef4a62b16480ad6ea61aa41d0d8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Aug 2024 18:15:19 +0000
Subject: [PATCH] diffoscope: upgrade 272 -> 274

---
 .../diffoscope/{diffoscope_272.bb => diffoscope_274.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_272.bb => diffoscope_274.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_272.bb b/meta/recipes-support/diffoscope/diffoscope_274.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_272.bb
rename to meta/recipes-support/diffoscope/diffoscope_274.bb
index 55e4cc7832..37df53ef02 100644
--- a/meta/recipes-support/diffoscope/diffoscope_272.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_274.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "f8983580efb8f4644719705590a43817d1159d4136836d7ce6dd4fec754c3943"
+SRC_URI[sha256sum] = "f324de203b2c20479bf1875803d4780d46d921aa86065fd5b1a889865f04abb0"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.0


--===============4886169545839688596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (0 cached, 916 parsed). 1868 targets, 51 skipped, 0 masked, 0 errors.
Removing 118 recipes from the core2-64 sysroot...done.
Removing 131 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============4886169545839688596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-272.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-274.dist-info

--===============4886169545839688596==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "272" to "274"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "272" to "274"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "272" to "274"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "272" to "274"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "272" to "274"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "272" to "274"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1357777 to 1357785 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "272" to "274"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 272 [default] to 274 [default]
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-272.tar.gz;downloadfilename=diffoscope-272.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-274.tar.gz;downloadfilename=diffoscope-274.tar.gz"
packages/core2-64-poky-linux/diffoscope: PV changed from "272" to "274"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.12/site-packages/diffoscope-272.dist-info moved to /usr/lib/python3.12/site-packages/diffoscope-274.dist-info

--===============4886169545839688596==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-272-274.patch"

RnJvbSA2M2ZlMDI0ZWNjMDYxZWY0YTYyYjE2NDgwYWQ2ZWE2MWFhNDFkMGQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgQXVnIDIwMjQgMTg6MTU6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
aWZmb3Njb3BlOiB1cGdyYWRlIDI3MiAtPiAyNzQKCi0tLQogLi4uL2RpZmZvc2NvcGUve2RpZmZv
c2NvcGVfMjcyLmJiID0+IGRpZmZvc2NvcGVfMjc0LmJifSAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS97ZGlmZm9zY29wZV8yNzIuYmIgPT4gZGlmZm9zY29wZV8y
NzQuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI3Mi5iYiBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2NvcGUvZGlm
Zm9zY29wZV8yNzQuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNp
cGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI3Mi5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZmb3Njb3BlXzI3NC5iYgppbmRleCA1NWU0Y2M3
ODMyLi4zN2RmNTNlZjAyIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Nj
b3BlL2RpZmZvc2NvcGVfMjcyLmJiCisrKyBiL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yNzQuYmIKQEAgLTEyLDcgKzEyLDcgQEAgUFlQSV9QQUNLQUdFID0gImRp
ZmZvc2NvcGUiCiAKIGluaGVyaXQgcHlwaSBzZXR1cHRvb2xzMwogCi1TUkNfVVJJW3NoYTI1NnN1
bV0gPSAiZjg5ODM1ODBlZmI4ZjQ2NDQ3MTk3MDU1OTBhNDM4MTdkMTE1OWQ0MTM2ODM2ZDdjZTZk
ZDRmZWM3NTRjMzk0MyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJmMzI0ZGUyMDNiMmMyMDQ3OWJm
MTg3NTgwM2Q0NzgwZDQ2ZDkyMWFhODYwNjVmZDViMWE4ODk4NjVmMDRhYmIwIgogCiBSREVQRU5E
Uzoke1BOfSArPSAiXAogICAgICAgICBiaW51dGlscyBcCi0tIAoyLjQ0LjAKCg==

--===============4886169545839688596==--

