Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FE6D2168A
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 12:16:15 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.11869.1728994557647032112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Oct 2024 05:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=NNip5rhy;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=NKFNJzqu;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010192901b78fc-b8ec0a9d-ec7b-4317-ad7f-aed858cb64f5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1728994572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BRTWjZGYPgabwTe5k4buBEX4nB89JQI1CaMugUW7RNQ=;
	b=NNip5rhykguwd1/rPbToPGFcstUpO9WKBj2eSEO6ejh4zL7mc4CqgLb+k/+aOuxs
	YPNjybChLjj8kYMlIaHE/YJx3UBxAtOOKWZ5mnMr+mH1QYO0KbnBV10HY+sjD1LkdOa
	JxELvkZYNDizy51hpgLwbQ2P3WRH52WQZclLdplg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1728994572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BRTWjZGYPgabwTe5k4buBEX4nB89JQI1CaMugUW7RNQ=;
	b=NKFNJzqudJYzgWapZmaZ/4p08twhf9zGQ284LGJYopKGOyIOAXDpskEFqXq1+2SV
	KptGlkHigxhdae4eVa3mjX3c9NeiGB9+fEgMzYtqlEy72MtbvTXqNGMmGfELuYEv3b4
	Kj72TlyVJjRg3eA/pLDF68UCnNbDsvHh7EFu9YCI=
Content-Type: multipart/mixed; boundary="===============0953766285557899101=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.4 SUCCEEDED
Message-ID: <01010192901b78fc-b8ec0a9d-ec7b-4317-ad7f-aed858cb64f5-000000@us-west-2.amazonses.com>
Date: Tue, 15 Oct 2024 12:16:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.10.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Oct 2024 12:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205892

--===============0953766285557899101==
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
From 9d685b6522f3e4d1bdb9fd18bc96dee06774b5a3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Oct 2024 11:36:58 +0000
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


--===============0953766285557899101==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.3-1.8.4.patch"

RnJvbSA5ZDY4NWI2NTIyZjNlNGQxYmRiOWZkMThiYzk2ZGVlMDY3NzRiNWEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgT2N0IDIwMjQgMTE6MzY6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
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

--===============0953766285557899101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.3", added "/usr/lib/libtraceevent.so.1.8.4"
Changes to packages/core2-64-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.3 to libtraceevent.so.1.8.4
  /usr/lib/libtraceevent.so.1.8.3 moved to /usr/lib/libtraceevent.so.1.8.4

--===============0953766285557899101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libtraceevent: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.8.3", added "/usr/lib/.debug/libtraceevent.so.1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 592664 to 596272 (+1%)
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 392855 to 393827 (+0%)
packages/core2-64-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 738390 to 744750 (+1%)
packages/core2-64-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.8.3" to "1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.3", added "/usr/lib/libtraceevent.so.1.8.4"
packages/core2-64-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.8.3 [default] to 1.8.4 [default]
packages/core2-64-poky-linux/libtraceevent/libtraceevent: PV changed from "1.8.3" to "1.8.4"
Changes to packages/core2-64-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.3 to libtraceevent.so.1.8.4
  /usr/lib/libtraceevent.so.1.8.3 moved to /usr/lib/libtraceevent.so.1.8.4

--===============0953766285557899101==--

