Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49512CEBF72
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:17 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12135.1763224742312639128
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=w/FdTJwW;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=j29molg7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019a88628271-aef36dd7-5550-40bd-807c-27b0751e0b53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=4rVp3rXVhz9w3U5vOCyNejLqJcid7rtUwQjmWQSjZRg=;
	b=w/FdTJwWmthD4ii807DNk8DJ0e8zcMClgiWgU6G5yZM5LQkC7W/HrQUsiP2qNv0W
	Qwy/OCF58BxudDKBjNKnbidFVMHMnwuTrzhEDyKZokFcUkv3z2hTpTmjDdl7XXKus+J
	s/jjBvYw/Hq59FnfZYBjZCBkovI7nA9mrDPoLfPs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224748;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=4rVp3rXVhz9w3U5vOCyNejLqJcid7rtUwQjmWQSjZRg=;
	b=j29molg7hzX0N/npU+SsN9yz7Kw+JKbfuI7NOvCm+D2ohvYw77Z4R4lEslBgGTWj
	sUOzJtei2CrCSGKGGfbwtpFeVViLk0fZbuwBEvOgHxJBXFi2knLm6BBe+57DFcE4yFH
	pBdwk7kq5LdHvvLD/EaZDtfitSi9pOYwpJSBscFo=
Content-Type: multipart/mixed; boundary="===============3898173795350113499=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.8.6 SUCCEEDED
Message-ID: <0101019a88628271-aef36dd7-5550-40bd-807c-27b0751e0b53-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226428

--===============3898173795350113499==
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
From c4abae151345e846425543d3d842165f435b586a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 15:03:58 +0000
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


--===============3898173795350113499==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.4-1.8.6.patch"

RnJvbSBjNGFiYWUxNTEzNDVlODQ2NDI1NTQzZDNkODQyMTY1ZjQzNWI1ODZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTU6MDM6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
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

--===============3898173795350113499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtraceevent: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.8.4", added "/usr/lib/traceevent/plugins/.debug/plugin_net.so /usr/lib/.debug/libtraceevent.so.1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 593920 to 608128 (+2%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGSIZE changed from 29796 to 28895 (-3%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: FILELIST: added "/usr/lib/traceevent/plugins/plugin_net.so"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGSIZE changed from 177621 to 191693 (+8%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 739446 to 745390 (+1%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PV changed from "1.8.4" to "1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.4", added "/usr/lib/libtraceevent.so.1.8.6"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGSIZE changed from 129174 to 133270 (+3%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.8.4 [default] to 1.8.6 [default]
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.4 to libtraceevent.so.1.8.6
  /usr/lib/libtraceevent.so.1.8.4 moved to /usr/lib/libtraceevent.so.1.8.6
  /usr/lib/traceevent/plugins/plugin_net.so was added

--===============3898173795350113499==
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

--===============3898173795350113499==--

