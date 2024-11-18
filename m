Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E94F9D6204E
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:18:03 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.4881.1731964674036023744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=eCCW2wJE;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=C4m96uso;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019341239e32-a52974d6-aa78-485a-a801-dfe58c76ae74-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964673;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Qq1uEaP3lC2Bjw7eGHOQobFMQ8PDgdbfGXm8TPlp3qE=;
	b=eCCW2wJEwQnaUW04HcPOxY6ZaqaizhexfZ0siXHDCgEG5dPC+5XvfiSug/HBTJSO
	w0J2lfIVbsgjUemWzj5Kb8IwmYviPPBR0xLrNbaZylQRY7cF1r+HHYc/mjuJDXqIPKp
	9a2lNTcCF9CvxhUMhVFctogPCZNFYXG1urSdgDFk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964673;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Qq1uEaP3lC2Bjw7eGHOQobFMQ8PDgdbfGXm8TPlp3qE=;
	b=C4m96usoF2YI++Be5vF2KKY3046nTba5Q/HRwyLCRLE73UxMgBKG8fREEGTy454K
	Yd17D76iDzzuEePvcFFd9h2dsMzs24zreRAgGVupCdNwyMY5XpPpyq+KNTX41ZGG3Hw
	E3C5+tPPiHFQWP44RMsJwZVMBvWJziqH23HVUXWQ=
Content-Type: multipart/mixed; boundary="===============9065602126544878469=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.4 SUCCEEDED
Message-ID: <0101019341239e32-a52974d6-aa78-485a-a801-dfe58c76ae74-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:18:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207341

--===============9065602126544878469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.8.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.8.3-1.8.4.patch
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
From e7180a6e32027b3cd34eb4433dafc5a7ee7bf746 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 18 Nov 2024 03:22:23 +0000
Subject: [PATCH] libtraceevent: upgrade 1.8.3 -> 1.8.4

---
 .../{libtraceevent_1.8.3.bb => libtraceevent_1.8.4.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.3.bb => libtraceevent_1.8.4.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
index 68174305f2..7a33da37c2 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.3.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "645a883516e343ee970ebb80398cfd7b7dbd227e"
+SRCREV = "bd47bd544c9ebc9f44bd88c2b2f2049230741058"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
-- 
2.44.1


--===============9065602126544878469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.3", added "/usr/lib/libtraceevent.so.1.8.4"
Changes to packages/core2-64-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.3 to libtraceevent.so.1.8.4
  /usr/lib/libtraceevent.so.1.8.3 moved to /usr/lib/libtraceevent.so.1.8.4

--===============9065602126544878469==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.3-1.8.4.patch"

RnJvbSBlNzE4MGE2ZTMyMDI3YjNjZDM0ZWI0NDMzZGFmYzVhN2VlN2JmNzQ2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTggTm92IDIwMjQgMDM6MjI6MjMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWV2ZW50OiB1cGdyYWRlIDEuOC4zIC0+IDEuOC40CgotLS0KIC4uLi97bGlidHJhY2Vl
dmVudF8xLjguMy5iYiA9PiBsaWJ0cmFjZWV2ZW50XzEuOC40LmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC97bGlidHJhY2VldmVudF8xLjguMy5iYiA9
PiBsaWJ0cmFjZWV2ZW50XzEuOC40LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC4zLmJiIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS44LjQuYmIKc2ltaWxhcml0
eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50
L2xpYnRyYWNlZXZlbnRfMS44LjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGli
dHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC40LmJiCmluZGV4IDY4MTc0MzA1ZjIuLjdhMzNk
YTM3YzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0
cmFjZWV2ZW50XzEuOC4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVu
dC9saWJ0cmFjZWV2ZW50XzEuOC40LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wO21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIx
NWQxM2Y5NwogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjE7bWQ1
PWIzNzA4ODc5ODBkYjVkZDQwNjU5YjUwOTA5MjM4ZGJkIgogU0VDVElPTiA9ICJsaWJzIgogCi1T
UkNSRVYgPSAiNjQ1YTg4MzUxNmUzNDNlZTk3MGViYjgwMzk4Y2ZkN2I3ZGJkMjI3ZSIKK1NSQ1JF
ViA9ICJiZDQ3YmQ1NDRjOWViYzlmNDRiZDg4YzJiMmYyMDQ5MjMwNzQxMDU4IgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpYnMvbGlidHJhY2UvbGlidHJhY2VldmVu
dC5naXQ7YnJhbmNoPSR7QlBOfTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIgogCi0tIAoy
LjQ0LjEKCg==

--===============9065602126544878469==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtraceevent: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.8.3", added "/usr/lib/.debug/libtraceevent.so.1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 669992 to 673616 (+1%)
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 392855 to 393827 (+0%)
packages/core2-64-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 738390 to 744750 (+1%)
packages/core2-64-poky-linux/libtraceevent/libtraceevent: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.3", added "/usr/lib/libtraceevent.so.1.8.4"
Changes to packages/core2-64-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.3 to libtraceevent.so.1.8.4
  /usr/lib/libtraceevent.so.1.8.3 moved to /usr/lib/libtraceevent.so.1.8.4

--===============9065602126544878469==--

