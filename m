Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226A0D5E37F
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:52 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17197.1765872154647957023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=H5KrTkkY;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KhWq8kV8;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019b262ed8cf-b8761561-7634-4f1b-aa11-a56c2301cb96-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=f90jsy4WOwoJzgbngYljdCVAemLWKxKBzVUnyCl+AYA=;
	b=H5KrTkkY/VqKWymVG3PA2UHIuvOzwLGMNdEACzc8VNl0x0eXfXVZBD+pQz8nkrQO
	UGa2tmQ56vHECg56+CwcsjCCdbCVQadIhDTXlbuAw1AzDZ25UB5+thCVbh1Q7+zcTLP
	AlEtLsR4lLPRXscQ0sq+r+PU5TD3/3nLx2aiSbvI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872163;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=f90jsy4WOwoJzgbngYljdCVAemLWKxKBzVUnyCl+AYA=;
	b=KhWq8kV8jVVa8T3gcBXuNQhZI8jwn25iDC6OSOeEhgqo/FnKIU9Wy3f2c1fRrbp9
	t93n0bFCDD7AfilbPFqY+KvvG6/vEzFbhoz5AOPpkRknHRoZ/6yl8yApBgHmuyDF1AN
	1Xwug3SIdaKibtDg68JA5tCF4S5KnxNCxcfF92Xs=
Content-Type: multipart/mixed; boundary="===============4646845098202983777=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.6 SUCCEEDED
Message-ID: <0101019b262ed8cf-b8761561-7634-4f1b-aa11-a56c2301cb96-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:43 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227883

--===============4646845098202983777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.8.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.8.4-1.8.6.patch
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
From d7ba9fd772a2057902e99b70b515c79ed71424b0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 05:39:44 +0000
Subject: [PATCH] libtraceevent: upgrade 1.8.4 -> 1.8.6

---
 .../{libtraceevent_1.8.4.bb => libtraceevent_1.8.6.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.4.bb => libtraceevent_1.8.6.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
index 75762e4def..deddb60f63 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.4.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "bd47bd544c9ebc9f44bd88c2b2f2049230741058"
+SRCREV = "98c217427183f66f09f4a27300ad87d71814c38f"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
-- 
2.47.1


--===============4646845098202983777==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.4-1.8.6.patch"

RnJvbSBkN2JhOWZkNzcyYTIwNTc5MDJlOTliNzBiNTE1Yzc5ZWQ3MTQyNGIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDU6Mzk6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWV2ZW50OiB1cGdyYWRlIDEuOC40IC0+IDEuOC42CgotLS0KIC4uLi97bGlidHJhY2Vl
dmVudF8xLjguNC5iYiA9PiBsaWJ0cmFjZWV2ZW50XzEuOC42LmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC97bGlidHJhY2VldmVudF8xLjguNC5iYiA9
PiBsaWJ0cmFjZWV2ZW50XzEuOC42LmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC40LmJiIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS44LjYuYmIKc2ltaWxhcml0
eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50
L2xpYnRyYWNlZXZlbnRfMS44LjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGli
dHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC42LmJiCmluZGV4IDc1NzYyZTRkZWYuLmRlZGRi
NjBmNjMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0
cmFjZWV2ZW50XzEuOC40LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVu
dC9saWJ0cmFjZWV2ZW50XzEuOC42LmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wO21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIx
NWQxM2Y5NwogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjE7bWQ1
PWIzNzA4ODc5ODBkYjVkZDQwNjU5YjUwOTA5MjM4ZGJkIgogU0VDVElPTiA9ICJsaWJzIgogCi1T
UkNSRVYgPSAiYmQ0N2JkNTQ0YzllYmM5ZjQ0YmQ4OGMyYjJmMjA0OTIzMDc0MTA1OCIKK1NSQ1JF
ViA9ICI5OGMyMTc0MjcxODNmNjZmMDlmNGEyNzMwMGFkODdkNzE4MTRjMzhmIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpYnMvbGlidHJhY2UvbGlidHJhY2VldmVu
dC5naXQ7YnJhbmNoPSR7QlBOfTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIgogCi0tIAoy
LjQ3LjEKCg==

--===============4646845098202983777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: FILELIST: added "/usr/lib/traceevent/plugins/plugin_net.so"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.4", added "/usr/lib/libtraceevent.so.1.8.6"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.4 to libtraceevent.so.1.8.6
  /usr/lib/libtraceevent.so.1.8.4 moved to /usr/lib/libtraceevent.so.1.8.6
  /usr/lib/traceevent/plugins/plugin_net.so was added

--===============4646845098202983777==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtraceevent: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 594096 to 608312 (+2%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.8.4", added "/usr/lib/.debug/libtraceevent.so.1.8.6 /usr/lib/traceevent/plugins/.debug/plugin_net.so"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGSIZE changed from 29796 to 28895 (-3%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGSIZE changed from 177621 to 191693 (+8%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: FILELIST: added "/usr/lib/traceevent/plugins/plugin_net.so"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 393827 to 398698 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: FILELIST: directory renamed /usr/src/debug/libtraceevent/1.8.4/src -> /usr/src/debug/libtraceevent/1.8.6/src, directory renamed /usr/src/debug/libtraceevent/1.8.4/include/traceevent -> /usr/src/debug/libtraceevent/1.8.6/include/traceevent, removed "/usr/src/debug/libtraceevent/1.8.4/plugins/plugin_hrtimer.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_futex.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_kmem.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_cfg80211.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_function.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_jbd2.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_mac80211.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_kvm.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_scsi.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_xen.c /usr/src/debug/libtraceevent/1.8.4/plugins/plugin_sched_switch.c /usr/src/debug/libtraceevent/1.8.4/pl
 ugins/plugin_tlb.c", added "/usr/src/debug/libtraceevent/1.8.6/plugins/plugin_hrtimer.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_futex.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_kmem.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_cfg80211.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_function.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_jbd2.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_mac80211.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_kvm.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_scsi.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_xen.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_net.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_sched_switch.c /usr/src/debug/libtraceevent/1.8.6/plugins/plugin_tlb.c"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 739390 to 745342 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGSIZE changed from 129174 to 133270 (+3%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.4", added "/usr/lib/libtraceevent.so.1.8.6"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.4 to libtraceevent.so.1.8.6
  /usr/lib/libtraceevent.so.1.8.4 moved to /usr/lib/libtraceevent.so.1.8.6
  /usr/lib/traceevent/plugins/plugin_net.so was added

--===============4646845098202983777==--

