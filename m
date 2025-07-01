Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00D7FC83F0D
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 16:20:12 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.1415.1751386811078833265
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 09:20:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fo5DmyQD;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=D9Bmw1L7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010197c6c9e713-a0c99119-04fa-4bc1-bf73-b027b5ca31c9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=plnyCS4DSCH0ttuP3m3IV78FS6COk0vQxXUdPLmMYNA=;
	b=fo5DmyQDDu/a+PtrhUFNGGVz3ruvOl612VRmYI+85g8/dU77RHZ4+XG4UTi4IUCx
	LXTFxjSuBE6mdshRqHLhTwq7j5+gy/pPoGp9kYmPuvrcyfGnGoZG5edGImwZiaQSrfY
	UEymFBSF3KasREXN2KMg/619pRG08CgH1EJ0JVWc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1751386810;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=plnyCS4DSCH0ttuP3m3IV78FS6COk0vQxXUdPLmMYNA=;
	b=D9Bmw1L7M4sTsK5sK0rcZcLOTzK1nuf/kiEGM3duQWB7TXHev1c4LqzSzU4ijvfs
	Pi8u0lisbEv8dnWPofFJLkAYcWNOjAzdCQHLLn4lLdol0nPqYTpft3u851T/urwn6oZ
	1svIDm1qX9QlHqCxzl8oq3VUpVn7G15/pg09TrDA=
Content-Type: multipart/mixed; boundary="===============8848193947301883869=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] erofs-utils: upgrading to 1.8.9 SUCCEEDED
Message-ID: <01010197c6c9e713-a0c99119-04fa-4bc1-bf73-b027b5ca31c9-000000@us-west-2.amazonses.com>
Date: Tue, 1 Jul 2025 16:20:10 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 16:20:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219625

--===============8848193947301883869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *erofs-utils* to *1.8.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-erofs-utils-upgrade-1.8.5-1.8.9.patch
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
From df7beb43473a245c99535a11efa22c20e95d28e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Jul 2025 08:22:36 +0000
Subject: [PATCH] erofs-utils: upgrade 1.8.5 -> 1.8.9

---
 .../erofs-utils/{erofs-utils_1.8.5.bb => erofs-utils_1.8.9.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/erofs-utils/{erofs-utils_1.8.5.bb => erofs-utils_1.8.9.bb} (94%)

diff --git a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.9.bb
similarity index 94%
rename from meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
rename to meta/recipes-devtools/erofs-utils/erofs-utils_1.8.9.bb
index 2bedd6e16b..3049a54631 100644
--- a/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.5.bb
+++ b/meta/recipes-devtools/erofs-utils/erofs-utils_1.8.9.bb
@@ -5,7 +5,7 @@ SECTION = "base"
 LIC_FILES_CHKSUM = "file://COPYING;md5=73001d804ea1e3d84365f652242cca20"
 HOMEPAGE = "https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git/tree/README"
 
-SRCREV = "7bc147fafd53a2a9ff7c22399491079e5bfffafc"
+SRCREV = "81169bf3cfd26b8f2b3aa3b20da23971168a90a9"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs-utils.git;branch=master;protocol=https"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>(\d+(\.\d+)+))"
-- 
2.47.1


--===============8848193947301883869==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-erofs-utils-upgrade-1.8.5-1.8.9.patch"

RnJvbSBkZjdiZWI0MzQ3M2EyNDVjOTk1MzVhMTFlZmEyMmMyMGU5NWQyOGUzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBKdWwgMjAyNSAwODoyMjozNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVy
b2ZzLXV0aWxzOiB1cGdyYWRlIDEuOC41IC0+IDEuOC45CgotLS0KIC4uLi9lcm9mcy11dGlscy97
ZXJvZnMtdXRpbHNfMS44LjUuYmIgPT4gZXJvZnMtdXRpbHNfMS44LjkuYmJ9ICB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy97ZXJvZnMtdXRpbHNfMS44LjUuYmIgPT4gZXJv
ZnMtdXRpbHNfMS44LjkuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOC41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2Vyb2ZzLXV0aWxzL2Vyb2ZzLXV0aWxzXzEuOC45LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGls
c18xLjguNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Vyb2ZzLXV0aWxzL2Vy
b2ZzLXV0aWxzXzEuOC45LmJiCmluZGV4IDJiZWRkNmUxNmIuLjMwNDlhNTQ2MzEgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9lcm9mcy11dGlscy9lcm9mcy11dGlsc18xLjguNS5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZXJvZnMtdXRpbHMvZXJvZnMtdXRpbHNfMS44
LjkuYmIKQEAgLTUsNyArNSw3IEBAIFNFQ1RJT04gPSAiYmFzZSIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTczMDAxZDgwNGVhMWUzZDg0MzY1ZjY1MjI0MmNjYTIwIgog
SE9NRVBBR0UgPSAiaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQveGlhbmcvZXJvZnMtdXRpbHMuZ2l0L3RyZWUvUkVBRE1FIgogCi1TUkNSRVYgPSAiN2JjMTQ3
ZmFmZDUzYTJhOWZmN2MyMjM5OTQ5MTA3OWU1YmZmZmFmYyIKK1NSQ1JFViA9ICI4MTE2OWJmM2Nm
ZDI2YjhmMmIzYWEzYjIwZGEyMzk3MTE2OGE5MGE5IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXQua2Vy
bmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQveGlhbmcvZXJvZnMtdXRpbHMuZ2l0O2Jy
YW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMiCiAKIFVQU1RSRUFNX0NIRUNLX0dJVFRBR1JFR0VY
ID0gInYoP1A8cHZlcj4oXGQrKFwuXGQrKSspKSIKLS0gCjIuNDcuMQoK

--===============8848193947301883869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGV changed from 1.8.5 [default] to 1.8.9 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dbg: PKGSIZE changed from 2070016 to 2158104 (+4%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-dev: PKGV changed from 1.8.5 [default] to 1.8.9 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGV changed from 1.8.5 [default] to 1.8.9 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-doc: PKGSIZE changed from 13129 to 13532 (+3%)
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-locale: PKGV changed from 1.8.5 [default] to 1.8.9 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-src: PKGV changed from 1.8.5 [default] to 1.8.9 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils/erofs-utils-staticdev: PKGV changed from 1.8.5 [default] to 1.8.9 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGV changed from 1.8.5 [default] to 1.8.9 [default]
packages/core2-64-poky-linux/erofs-utils/erofs-utils: PKGSIZE changed from 546344 to 571048 (+5%)
packages/core2-64-poky-linux/erofs-utils: PV changed from "1.8.5" to "1.8.9"
packages/core2-64-poky-linux/erofs-utils: PKGV changed from 1.8.5 [default] to 1.8.9 [default]

--===============8848193947301883869==--

