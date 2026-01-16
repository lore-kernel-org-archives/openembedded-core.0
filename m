Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2B6AD4A5EA
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:05 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1436.1768526749201889216
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=RoWATNmq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=SXQfE/wZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019bc468b345-9e7b4054-b3d1-4887-a316-3abdad000017-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YJcU8QzNga2wuMKHMQh6doBVsrWNAorBIwD/XmONjMY=;
	b=RoWATNmqXx5TYxbdISmh3SCqI5JrwvMvaiOdoLCoBO9bWWoik5rv7hgtGnHOnNFO
	NqekJrFGvRplqc9egqPtISo0PpUy8AZpDOsRwbv63zzHUj5Z1CFxBISoVX19hlvii1o
	0Ak05fSpChhJUmbD4ExwrsBiQWiZ6tDqwEv9Byxo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526754;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YJcU8QzNga2wuMKHMQh6doBVsrWNAorBIwD/XmONjMY=;
	b=SXQfE/wZwkzZB4DZBnGj7a+Wp7JrVSW4iKGLRRW6rFOdE+c0KsUYwJNRitzeXEiE
	dTo+R2t7XQiwFf6CbHzzzg2JKoz8rX4HaofiUmBoiI/h4FM7YvPJUBphF9vkN6pEa8g
	igBXIdCaUK68WGUY48pBgN1QYhtx9qnQxJEAFlqs=
Content-Type: multipart/mixed; boundary="===============3514195172848665882=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.7 SUCCEEDED
Message-ID: <0101019bc468b345-9e7b4054-b3d1-4887-a316-3abdad000017-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:54 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229493

--===============3514195172848665882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.8.7* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.8.6-1.8.7.patch
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
From 73eee64eb02de2d3809c3e29684813f1a1dfa4da Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 16 Jan 2026 00:07:40 +0000
Subject: [PATCH] libtraceevent: upgrade 1.8.6 -> 1.8.7

---
 .../{libtraceevent_1.8.6.bb => libtraceevent_1.8.7.bb}        | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.6.bb => libtraceevent_1.8.7.bb} (90%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.7.bb
similarity index 90%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.7.bb
index deddb60f63..0e891c1498 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.7.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "98c217427183f66f09f4a27300ad87d71814c38f"
+SRCREV = "7a8fee57d87aa61c9d578cd67e99d2677b894772"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
@@ -19,3 +19,5 @@ EXTRA_OEMESON = "-Ddoc=false"
 PACKAGES += "${PN}-plugins"
 
 FILES:${PN}-plugins += "${libdir}/traceevent/plugins"
+
+BPN = "libtraceevent-v1.8"
-- 
2.47.1


--===============3514195172848665882==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.6-1.8.7.patch"

RnJvbSA3M2VlZTY0ZWIwMmRlMmQzODA5YzNlMjk2ODQ4MTNmMWExZGZhNGRhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTYgSmFuIDIwMjYgMDA6MDc6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWV2ZW50OiB1cGdyYWRlIDEuOC42IC0+IDEuOC43CgotLS0KIC4uLi97bGlidHJhY2Vl
dmVudF8xLjguNi5iYiA9PiBsaWJ0cmFjZWV2ZW50XzEuOC43LmJifSAgICAgICAgfCA0ICsrKy0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMta2VybmVsL2xpYnRyYWNlZXZlbnQve2xpYnRyYWNlZXZlbnRfMS44LjYuYmIg
PT4gbGlidHJhY2VldmVudF8xLjguNy5iYn0gKDkwJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMta2VybmVsL2xpYnRyYWNlZXZlbnQvbGlidHJhY2VldmVudF8xLjguNi5iYiBiL21ldGEvcmVj
aXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC43LmJiCnNpbWlsYXJp
dHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVu
dC9saWJ0cmFjZWV2ZW50XzEuOC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMta2VybmVsL2xp
YnRyYWNlZXZlbnQvbGlidHJhY2VldmVudF8xLjguNy5iYgppbmRleCBkZWRkYjYwZjYzLi4wZTg5
MWMxNDk4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVsL2xpYnRyYWNlZXZlbnQvbGli
dHJhY2VldmVudF8xLjguNi5iYgorKysgYi9tZXRhL3JlY2lwZXMta2VybmVsL2xpYnRyYWNlZXZl
bnQvbGlidHJhY2VldmVudF8xLjguNy5iYgpAQCAtOCw3ICs4LDcgQEAgTElDX0ZJTEVTX0NIS1NV
TSA9ICJmaWxlOi8vTElDRU5TRVMvR1BMLTIuMDttZDU9ZTZhNzUzNzFiYTRkMTY3NDkyNTRhNTEy
MTVkMTNmOTcKICAgICAgICAgICAgICAgICAgICAgZmlsZTovL0xJQ0VOU0VTL0xHUEwtMi4xO21k
NT1iMzcwODg3OTgwZGI1ZGQ0MDY1OWI1MDkwOTIzOGRiZCIKIFNFQ1RJT04gPSAibGlicyIKIAot
U1JDUkVWID0gIjk4YzIxNzQyNzE4M2Y2NmYwOWY0YTI3MzAwYWQ4N2Q3MTgxNGMzOGYiCitTUkNS
RVYgPSAiN2E4ZmVlNTdkODdhYTYxYzlkNTc4Y2Q2N2U5OWQyNjc3Yjg5NDc3MiIKIFNSQ19VUkkg
PSAiZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saWJzL2xpYnRyYWNlL2xpYnRyYWNlZXZl
bnQuZ2l0O2JyYW5jaD0ke0JQTn07cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICIKIApAQCAt
MTksMyArMTksNSBAQCBFWFRSQV9PRU1FU09OID0gIi1EZG9jPWZhbHNlIgogUEFDS0FHRVMgKz0g
IiR7UE59LXBsdWdpbnMiCiAKIEZJTEVTOiR7UE59LXBsdWdpbnMgKz0gIiR7bGliZGlyfS90cmFj
ZWV2ZW50L3BsdWdpbnMiCisKK0JQTiA9ICJsaWJ0cmFjZWV2ZW50LXYxLjgiCi0tIAoyLjQ3LjEK
Cg==

--===============3514195172848665882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.6", added "/usr/lib/libtraceevent.so.1.8.7"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.6 to libtraceevent.so.1.8.7
  /usr/lib/libtraceevent.so.1.8.6 moved to /usr/lib/libtraceevent.so.1.8.7

--===============3514195172848665882==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtraceevent: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent: SRC_URI changed from "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=libtraceevent;protocol=https" to "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=libtraceevent-v1.8;protocol=https"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 608312 to 612704 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.8.6", added "/usr/lib/.debug/libtraceevent.so.1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGSIZE changed from 28895 to 29056 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: FILES: removed "/usr/lib/libtraceevent/*.la", added "/usr/lib/libtraceevent-v1.8/*.la"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 398698 to 400743 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: FILELIST: directory renamed /usr/src/debug/libtraceevent/1.8.6/plugins -> /usr/src/debug/libtraceevent/1.8.7/plugins, directory renamed /usr/src/debug/libtraceevent/1.8.6/include/traceevent -> /usr/src/debug/libtraceevent/1.8.7/include/traceevent, directory renamed /usr/src/debug/libtraceevent/1.8.6/src -> /usr/src/debug/libtraceevent/1.8.7/src
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 745342 to 751910 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: FILES: removed "/usr/lib/libtraceevent/*.a", added "/usr/lib/libtraceevent-v1.8/*.a"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PV changed from "1.8.6" to "1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.6", added "/usr/lib/libtraceevent.so.1.8.7"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.8.6 [default] to 1.8.7 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILES: removed "/usr/lib/libtraceevent/* /usr/share/libtraceevent", added "/usr/lib/libtraceevent-v1.8/* /usr/share/libtraceevent-v1.8"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.6 to libtraceevent.so.1.8.7
  /usr/lib/libtraceevent.so.1.8.6 moved to /usr/lib/libtraceevent.so.1.8.7

--===============3514195172848665882==--

