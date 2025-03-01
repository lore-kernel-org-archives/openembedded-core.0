Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5382FC282DE
	for <webhook@archiver.kernel.org>; Sat,  1 Mar 2025 11:25:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.7060.1740828329051213110
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Mar 2025 03:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=SXnCFzXv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=nVSYJItR;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019551746ed9-f4423d46-23e8-466c-8289-db6c7fb0c038-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1740828340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=iLBqTl4Qw0j5+NZkyipJq9RYl1KpZR8kFHxJUn/EkE4=;
	b=SXnCFzXv7WH3qYp7DKXFC6F1Yj4zMRd2xapMhgZhox4lg+6F7hr3/bWvXskE7bJT
	rhlOFJo3D924kABKr1zg3B2D/grKBH6uO5pzqchEDFN/YKUAN1f1opfXS7TPdmn6N0q
	w18ybwGa4Gwy6aNRPxML0/eI9YQ+F0uB8oykcZ+Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1740828340;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=iLBqTl4Qw0j5+NZkyipJq9RYl1KpZR8kFHxJUn/EkE4=;
	b=nVSYJItR56xjUnTp6BEXOpAk1PqFuXgTsgy5NpKuhfDqtAxAOQ9lCOIDkWz0XIew
	UO+b5YO8bje8oge+wYFqX9CYQ3g7G1A/UMPZyGiroXnfeWl9loGiArR6Arpu02d6cfb
	S4qnNSu/XTlXMUhDh+TlR0e9UkirUH57D7TMsPIA=
Content-Type: multipart/mixed; boundary="===============8757474640978393185=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] diffoscope: upgrading to 289 SUCCEEDED
Message-ID: <0101019551746ed9-f4423d46-23e8-466c-8289-db6c7fb0c038-000000@us-west-2.amazonses.com>
Date: Sat, 1 Mar 2025 11:25:39 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Mar 2025 11:25:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212173

--===============8757474640978393185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *diffoscope* to *289* has Succeeded.

Next steps:
    - apply the patch: git am 0001-diffoscope-upgrade-287-289.patch
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
From c15a2d1da03d7c29a18df0bbfabc5a6b42b75087 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Mar 2025 11:07:41 +0000
Subject: [PATCH] diffoscope: upgrade 287 -> 289

---
 .../diffoscope/{diffoscope_287.bb => diffoscope_289.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/diffoscope/{diffoscope_287.bb => diffoscope_289.bb} (93%)

diff --git a/meta/recipes-support/diffoscope/diffoscope_287.bb b/meta/recipes-support/diffoscope/diffoscope_289.bb
similarity index 93%
rename from meta/recipes-support/diffoscope/diffoscope_287.bb
rename to meta/recipes-support/diffoscope/diffoscope_289.bb
index 8f8f114054..af7d6b5d73 100644
--- a/meta/recipes-support/diffoscope/diffoscope_287.bb
+++ b/meta/recipes-support/diffoscope/diffoscope_289.bb
@@ -12,7 +12,7 @@ PYPI_PACKAGE = "diffoscope"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "51702676957edb4c16ad93bcfc25bfdbcdb0c39fa7d1d16f657db71cfaa58ceb"
+SRC_URI[sha256sum] = "b9b2e598e62eb2220376e252692ac534d8d921d4314ec288d8c7415d3041dd9d"
 
 RDEPENDS:${PN} += "\
         binutils \
-- 
2.44.1


--===============8757474640978393185==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-diffoscope-upgrade-287-289.patch"

RnJvbSBjMTVhMmQxZGEwM2Q3YzI5YTE4ZGYwYmJmYWJjNWE2YjQyYjc1MDg3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBNYXIgMjAyNSAxMTowNzo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGRp
ZmZvc2NvcGU6IHVwZ3JhZGUgMjg3IC0+IDI4OQoKLS0tCiAuLi4vZGlmZm9zY29wZS97ZGlmZm9z
Y29wZV8yODcuYmIgPT4gZGlmZm9zY29wZV8yODkuYmJ9ICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL3tkaWZmb3Njb3BlXzI4Ny5iYiA9PiBkaWZmb3Njb3BlXzI4
OS5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9kaWZmb3Njb3Bl
L2RpZmZvc2NvcGVfMjg3LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29wZS9kaWZm
b3Njb3BlXzI4OS5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lw
ZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjg3LmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9kaWZmb3Njb3BlL2RpZmZvc2NvcGVfMjg5LmJiCmluZGV4IDhmOGYxMTQw
NTQuLmFmN2Q2YjVkNzMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2RpZmZvc2Nv
cGUvZGlmZm9zY29wZV8yODcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvZGlmZm9zY29w
ZS9kaWZmb3Njb3BlXzI4OS5iYgpAQCAtMTIsNyArMTIsNyBAQCBQWVBJX1BBQ0tBR0UgPSAiZGlm
Zm9zY29wZSIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMzCiAKLVNSQ19VUklbc2hhMjU2c3Vt
XSA9ICI1MTcwMjY3Njk1N2VkYjRjMTZhZDkzYmNmYzI1YmZkYmNkYjBjMzlmYTdkMWQxNmY2NTdk
YjcxY2ZhYTU4Y2ViIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImI5YjJlNTk4ZTYyZWIyMjIwMzc2
ZTI1MjY5MmFjNTM0ZDhkOTIxZDQzMTRlYzI4OGQ4Yzc0MTVkMzA0MWRkOWQiCiAKIFJERVBFTkRT
OiR7UE59ICs9ICJcCiAgICAgICAgIGJpbnV0aWxzIFwKLS0gCjIuNDQuMQoK

--===============8757474640978393185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dbg: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-dev: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-doc: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-locale: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-src: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope-staticdev: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope/diffoscope: PKGSIZE changed from 1376597 to 1376815 (+0%)
packages/core2-64-poky-linux/diffoscope/diffoscope: PV changed from "287" to "289"
packages/core2-64-poky-linux/diffoscope: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-287.tar.gz;downloadfilename=diffoscope-287.tar.gz" to "https://files.pythonhosted.org/packages/source/d/diffoscope/diffoscope-289.tar.gz;downloadfilename=diffoscope-289.tar.gz"
packages/core2-64-poky-linux/diffoscope: PKGV changed from 287 [default] to 289 [default]
packages/core2-64-poky-linux/diffoscope: PV changed from "287" to "289"
Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-287.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-289.dist-info

--===============8757474640978393185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (0 cached, 922 parsed). 1882 targets, 50 skipped, 0 masked, 0 errors.
Removing 101 recipes from the core2-64 sysroot...done.
Removing 131 recipes from the qemux86_64 sysroot...done.

Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'diffoscope'
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)
diffoscope was skipped: incompatible with host x86_64-poky-linux-musl (not in COMPATIBLE_HOST)

--===============8757474640978393185==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/diffoscope (sysroot):
  /usr/lib/python3.13/site-packages/diffoscope-287.dist-info moved to /usr/lib/python3.13/site-packages/diffoscope-289.dist-info

--===============8757474640978393185==--

