Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD3BC001B1
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:27 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.813.1686887483896282298
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=JrMnoTFw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010188c2544d58-6312a897-17a8-49bf-a3e9-e08a2b1205f9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=EILcEGoQm87AuVSQykYaAHkbt/HurpnULvJncS5XU+Y=;
	b=JrMnoTFwVZmgd1XfS+e09z1srYGp4EvZ7j1FI1+xWmavxbLcxC0sQy0PzsvVlUKR
	SeJiXsfA9NaKwSRPvjG6xb2kCD0kaT8TQx6Pjsczfrh+rZoDzm+SPb5132BuIpkGaRB
	qeaT+f1d14Xs4XpesPfGbcetF5LD++OtBN959gUs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=EILcEGoQm87AuVSQykYaAHkbt/HurpnULvJncS5XU+Y=;
	b=nvOxd3lkcEcy9lhH0pXJIUMatk7zHJIh2KdiN7zyQcBK9ZyCfrxG+8iFgO5AoJw3
	3MNEyA2Mh/MrGOoOVNKpvdIMh+U7/5IGeaE6WYzjqw2fFnhh/a1xnf1fHwUsUkCzZUM
	eH9BnQ7ZkAwnjWhfekU8uxLmRkpgjnHUXLwOh9zY=
Content-Type: multipart/mixed; boundary="===============1927510041926039618=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libtraceevent: upgrading to 1.7.3 SUCCEEDED
Message-ID: <01010188c2544d58-6312a897-17a8-49bf-a3e9-e08a2b1205f9-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:24 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182973

--===============1927510041926039618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libtraceevent* to *1.7.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libtraceevent-upgrade-1.7.2-1.7.3.patch
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
From 2457479620ce9827b59c0d449a9081afffcea6fd Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 22:04:44 +0000
Subject: [PATCH] libtraceevent: upgrade 1.7.2 -> 1.7.3

---
 .../{libtraceevent_1.7.2.bb => libtraceevent_1.7.3.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/libtraceevent/{libtraceevent_1.7.2.bb => libtraceevent_1.7.3.bb} (94%)

diff --git a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
similarity index 94%
rename from meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
rename to meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
index b5c0834d89..f9a3811669 100644
--- a/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.2.bb
+++ b/meta/recipes-kernel/libtraceevent/libtraceevent_1.7.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97
                     file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd"
 SECTION = "libs"
 
-SRCREV = "1c6f0f3b2bb47571fc455dc565dc343152517d98"
+SRCREV = "dd148189b74da3e2f45c7e536319fec97cb71213"
 SRC_URI = "git://git.kernel.org/pub/scm/libs/libtrace/libtraceevent.git;branch=${BPN};protocol=https \
            file://0001-makefile-Do-not-preserve-ownership-in-cp-command.patch"
 
-- 
2.39.2


--===============1927510041926039618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libtraceevent: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-dbg: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent-dbg: FILELIST: removed "/usr/lib/.debug/libtraceevent.so.1.7.2", added "/usr/lib/.debug/libtraceevent.so.1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-dbg: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-dbg: PKGSIZE changed from 489868 to 489864 (-0%)
packages/core2-32-poky-linux/libtraceevent/libtraceevent-dev: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent-dev: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-doc: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent-doc: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-locale: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent-locale: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-plugins: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent-plugins: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-src: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent-src: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-src: PKGSIZE changed from 383574 to 383563 (-0%)
packages/core2-32-poky-linux/libtraceevent/libtraceevent-staticdev: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent-staticdev: PV changed from "1.7.2" to "1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent-staticdev: PKGSIZE changed from 484146 to 483990 (-0%)
packages/core2-32-poky-linux/libtraceevent/libtraceevent: PKGV changed from 1.7.2 [default] to 1.7.3 [default]
packages/core2-32-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.7.2", added "/usr/lib/libtraceevent.so.1.7.3"
packages/core2-32-poky-linux/libtraceevent/libtraceevent: PV changed from "1.7.2" to "1.7.3"
Changes to packages/core2-32-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.7.2 to libtraceevent.so.1.7.3
  /usr/lib/libtraceevent.so.1.7.2 moved to /usr/lib/libtraceevent.so.1.7.3

--===============1927510041926039618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libtraceevent/libtraceevent: FILELIST: removed "/usr/lib/libtraceevent.so.1.7.2", added "/usr/lib/libtraceevent.so.1.7.3"
Changes to packages/core2-32-poky-linux/libtraceevent (sysroot):
  /usr/lib/libtraceevent.so.1 changed symlink target from libtraceevent.so.1.7.2 to libtraceevent.so.1.7.3
  /usr/lib/libtraceevent.so.1.7.2 moved to /usr/lib/libtraceevent.so.1.7.3

--===============1927510041926039618==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libtraceevent-upgrade-1.7.2-1.7.3.patch"

RnJvbSAyNDU3NDc5NjIwY2U5ODI3YjU5YzBkNDQ5YTkwODFhZmZmY2VhNmZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMjI6MDQ6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ0cmFjZWV2ZW50OiB1cGdyYWRlIDEuNy4yIC0+IDEuNy4zCgotLS0KIC4uLi97bGlidHJhY2Vl
dmVudF8xLjcuMi5iYiA9PiBsaWJ0cmFjZWV2ZW50XzEuNy4zLmJifSAgICAgICAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC97bGlidHJhY2VldmVudF8xLjcuMi5iYiA9
PiBsaWJ0cmFjZWV2ZW50XzEuNy4zLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuNy4yLmJiIGIvbWV0YS9yZWNp
cGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50L2xpYnRyYWNlZXZlbnRfMS43LjMuYmIKc2ltaWxhcml0
eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWtlcm5lbC9saWJ0cmFjZWV2ZW50
L2xpYnRyYWNlZXZlbnRfMS43LjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbGli
dHJhY2VldmVudC9saWJ0cmFjZWV2ZW50XzEuNy4zLmJiCmluZGV4IGI1YzA4MzRkODkuLmY5YTM4
MTE2NjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVudC9saWJ0
cmFjZWV2ZW50XzEuNy4yLmJiCisrKyBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbGlidHJhY2VldmVu
dC9saWJ0cmFjZWV2ZW50XzEuNy4zLmJiCkBAIC04LDcgKzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VN
ID0gImZpbGU6Ly9MSUNFTlNFUy9HUEwtMi4wO21kNT1lNmE3NTM3MWJhNGQxNjc0OTI1NGE1MTIx
NWQxM2Y5NwogICAgICAgICAgICAgICAgICAgICBmaWxlOi8vTElDRU5TRVMvTEdQTC0yLjE7bWQ1
PWIzNzA4ODc5ODBkYjVkZDQwNjU5YjUwOTA5MjM4ZGJkIgogU0VDVElPTiA9ICJsaWJzIgogCi1T
UkNSRVYgPSAiMWM2ZjBmM2IyYmI0NzU3MWZjNDU1ZGM1NjVkYzM0MzE1MjUxN2Q5OCIKK1NSQ1JF
ViA9ICJkZDE0ODE4OWI3NGRhM2UyZjQ1YzdlNTM2MzE5ZmVjOTdjYjcxMjEzIgogU1JDX1VSSSA9
ICJnaXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpYnMvbGlidHJhY2UvbGlidHJhY2VldmVu
dC5naXQ7YnJhbmNoPSR7QlBOfTtwcm90b2NvbD1odHRwcyBcCiAgICAgICAgICAgIGZpbGU6Ly8w
MDAxLW1ha2VmaWxlLURvLW5vdC1wcmVzZXJ2ZS1vd25lcnNoaXAtaW4tY3AtY29tbWFuZC5wYXRj
aCIKIAotLSAKMi4zOS4yCgo=

--===============1927510041926039618==--

