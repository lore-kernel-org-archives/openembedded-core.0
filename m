Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB44C531FC
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:02 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1390.1771440099760607578
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=Cw6f9Lsa;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=j2OH7zGZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 0101019c720efd67-f015fd77-3e1c-440a-8e5f-3fa1adcc6db8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xTxgOElZupeaGWzU/hRCJb8Tb2/COYNJl9uQf4aHlIM=;
	b=Cw6f9LsamnkmMroDKtz/PPKL84LlwtZ5nxwv/WEBBw1Sm4/UteupNobZlwEABIWR
	F5qf+5nlKef5nDiIvAaWRFXHdACcR7D8lijzTGaTTtLhDmghenMDRb7nnbAWlnBq5v7
	ohkOArfJEoTfD3ZeWkrGYW3Q4v39ctbbSEuh7erM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440111;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xTxgOElZupeaGWzU/hRCJb8Tb2/COYNJl9uQf4aHlIM=;
	b=j2OH7zGZcO3kXdCNTiZ7Wo9/rDGjbkZm8Tp8UJrP5iB+QAEEApyYJVPp8kDJ4qAI
	1u22HS+7zS442MEH+Ko7w+pBH6xrmbG+SB61AFljPd/orYfk81pyf+4FLzUWSZp9Gll
	EFepsX9vEgmw+2o6rV4HxsjZsFvvxNC21Aeg2UGQ=
Content-Type: multipart/mixed; boundary="===============2380184041793154254=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.9.0 SUCCEEDED
Message-ID: <0101019c720efd67-f015fd77-3e1c-440a-8e5f-3fa1adcc6db8-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231386

--===============2380184041793154254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libtraceevent* to *1.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.8.6-1.9.0.patch
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
From a579bb5f653dbba3aa44b35c70926fcb91523156 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 15:52:24 +0000
Subject: [PATCH] libtraceevent: upgrade 1.8.6 -> 1.9.0

---
 .../{libtraceevent_1.8.6.bb => libtraceevent_1.9.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.8.6.bb => libtraceevent_1.9.0.bb} (93%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
similarity index 93%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
index deddb60f63..bbd87e3881 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.8.6.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.9.0.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "98c217427183f66f09f4a27300ad87d71814c38f"
+SRCREV = "13701b5532e0c3295bf5670361692b0d0044228d"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
           "
 
-- 
2.47.1


--===============2380184041793154254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 745342 to 820248 (+10%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.6", added "/usr/lib/libtraceevent.so.1.9.0"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.6 to libtraceevent.so.1.9.0
  /usr/lib/libtraceevent.so.1.8.6 moved to /usr/lib/libtraceevent.so.1.9.0

--===============2380184041793154254==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.8.6-1.9.0.patch"

RnJvbSBhNTc5YmI1ZjY1M2RiYmEzYWE0NGIzNWM3MDkyNmZjYjkxNTIzMTU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTU6NTI6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWV2ZW50OiB1cGdyYWRlIDEuOC42IC0+IDEuOS4wCgotLS0KIC4uLi97bGlidHJhY2Vl
dmVudF8xLjguNi5iYiA9PiBsaWJ0cmFjZWV2ZW50XzEuOS4wLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC97bGlidHJhY2VldmVudF8xLjguNi5iYiA9
PiBsaWJ0cmFjZWV2ZW50XzEuOS4wLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOC42LmJiIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS45LjAuYmIKc2ltaWxhcml0
eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50
L2xpYnRyYWNlZXZlbnRfMS44LjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGli
dHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuOS4wLmJiCmluZGV4IGRlZGRiNjBmNjMuLmJiZDg3
ZTM4ODEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0
cmFjZWV2ZW50XzEuOC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVu
dC9saWJ0cmFjZWV2ZW50XzEuOS4wLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wO21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIx
NWQxM2Y5NwogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjE7bWQ1
PWIzNzA4ODc5ODBkYjVkZDQwNjU5YjUwOTA5MjM4ZGJkIgogU0VDVElPTiA9ICJsaWJzIgogCi1T
UkNSRVYgPSAiOThjMjE3NDI3MTgzZjY2ZjA5ZjRhMjczMDBhZDg3ZDcxODE0YzM4ZiIKK1NSQ1JF
ViA9ICIxMzcwMWI1NTMyZTBjMzI5NWJmNTY3MDM2MTY5MmIwZDAwNDQyMjhkIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpYnMvbGlidHJhY2UvbGlidHJhY2VldmVu
dC5naXQ7YnJhbmNoPSR7QlBOfTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIgogCi0tIAoy
LjQ3LjEKCg==

--===============2380184041793154254==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/libtraceevent: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 608312 to 645424 (+6%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.8.6", added "/usr/lib/.debug/libtraceevent.so.1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGSIZE changed from 28895 to 29502 (+2%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGSIZE changed from 191693 to 191714 (+0%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 398698 to 422457 (+6%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: FILELIST: directory renamed /usr/src/debug/libtraceevent/1.8.6/plugins -> /usr/src/debug/libtraceevent/1.9.0/plugins, directory renamed /usr/src/debug/libtraceevent/1.8.6/include/traceevent -> /usr/src/debug/libtraceevent/1.9.0/include/traceevent, removed "/usr/src/debug/libtraceevent/1.8.6/src/trace-seq.c /usr/src/debug/libtraceevent/1.8.6/src/kbuffer-parse.c /usr/src/debug/libtraceevent/1.8.6/src/parse-filter.c /usr/src/debug/libtraceevent/1.8.6/src/tep_strerror.c /usr/src/debug/libtraceevent/1.8.6/src/parse-utils.c /usr/src/debug/libtraceevent/1.8.6/src/event-parse-api.c /usr/src/debug/libtraceevent/1.8.6/src/event-plugin.c /usr/src/debug/libtraceevent/1.8.6/src/event-parse.c /usr/src/debug/libtraceevent/1.8.6/src/event-parse-local.h", added "/usr/src/debug/libtraceevent/1.9.0/src/trace-btf.c /usr/src/debug/libtraceevent/1.9.0/src/kbuffer-parse.c /usr/src/debug/libtraceevent/1.9.0/src/trace-seq.c /usr/src/debug/libtrac
 eevent/1.9.0/src/parse-filter.c /usr/src/debug/libtraceevent/1.9.0/src/tep_strerror.c /usr/src/debug/libtraceevent/1.9.0/src/parse-utils.c /usr/src/debug/libtraceevent/1.9.0/src/event-parse-api.c /usr/src/debug/libtraceevent/1.9.0/src/event-plugin.c /usr/src/debug/libtraceevent/1.9.0/src/event-parse.c /usr/src/debug/libtraceevent/1.9.0/src/event-parse-local.h"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 745342 to 820248 (+10%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.8.6" to "1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGSIZE changed from 133270 to 145558 (+9%)
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.8.6", added "/usr/lib/libtraceevent.so.1.9.0"
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.8.6 [default] to 1.9.0 [default]
packages/x86-64-v3-poky-linux/libtraceevent/libtraceevent: PV changed from "1.8.6" to "1.9.0"
Changes to packages/x86-64-v3-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.8.6 to libtraceevent.so.1.9.0
  /usr/lib/libtraceevent.so.1.8.6 moved to /usr/lib/libtraceevent.so.1.9.0

--===============2380184041793154254==--

