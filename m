Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE58C0219B
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 10:26:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.17875.1736936774207624773
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 02:26:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=JfOy5+wi;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=u1ZN3aZh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 01010194697fd7a9-cf9145c0-ea75-492b-9707-5d234d431eae-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nftro2uEeDfrbAnboyKUV3/6xJQHdVOi/W3Pfic9/2g=;
	b=JfOy5+wi24js1T/ZmbOvccKOuzpusuQXCXTEZ8GrMmkv/UyzixLW1c3B6308KyT0
	EI1NOlJlIDu59qQNvSZKlkQPjSrh/TtNvvno2fViBVD1WPqSgo+DfrnHvwinbh7wWuG
	ZtOUWJrWfHR0Ug5LhnWb0JzeerS3sH5qaWnFoy20=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1736936773;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nftro2uEeDfrbAnboyKUV3/6xJQHdVOi/W3Pfic9/2g=;
	b=u1ZN3aZhsmx7/gaMme2ArNonfD719eeWHK9+eU7C6NADFv/LDZb9w7frrLnmsiMO
	I4J+pU3yKPnPT/A1yI5Ocz41JQHpYCgEMMoaSbn7oJCiRj8EV74QyDK56FkqGt5RP1y
	LOOmK/tsuizJBi3XdAhngfZSCK1V9Z/BWEzhH3P0=
Content-Type: multipart/mixed; boundary="===============7487995304357069479=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.18.09 SUCCEEDED
Message-ID: <01010194697fd7a9-cf9145c0-ea75-492b-9707-5d234d431eae-000000@us-west-2.amazonses.com>
Date: Wed, 15 Jan 2025 10:26:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.01.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 10:26:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209858

--===============7487995304357069479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *stress-ng* to *0.18.09* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.18.08-0.18.09.patch
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
From d608ae263c9b59eb7b2873c2ea5bd3fc140dad86 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Jan 2025 08:36:29 +0000
Subject: [PATCH] stress-ng: upgrade 0.18.08 -> 0.18.09

---
 .../stress-ng/{stress-ng_0.18.08.bb => stress-ng_0.18.09.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.08.bb => stress-ng_0.18.09.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
index f779f6fe6a..25ac66517a 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.08.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "0b0317597016ea89498570ed2621ee5ebeea768c"
+SRCREV = "c84c8d5f5edb1ca8961d3bd97816d24e90392895"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.44.1


--===============7487995304357069479==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/stress-ng: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 26387416 to 26388240 (+0%)
packages/core2-64-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 5848194 to 5848182 (-0%)
packages/core2-64-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng: PV changed from "0.18.08" to "0.18.09"

--===============7487995304357069479==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.18.08-0.18.09.patch"

RnJvbSBkNjA4YWUyNjNjOWI1OWViN2IyODczYzJlYTViZDNmYzE0MGRhZDg2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgSmFuIDIwMjUgMDg6MzY6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJlc3Mtbmc6IHVwZ3JhZGUgMC4xOC4wOCAtPiAwLjE4LjA5CgotLS0KIC4uLi9zdHJlc3Mtbmcv
e3N0cmVzcy1uZ18wLjE4LjA4LmJiID0+IHN0cmVzcy1uZ18wLjE4LjA5LmJifSAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcve3N0cmVzcy1uZ18wLjE4LjA4LmJiID0+IHN0
cmVzcy1uZ18wLjE4LjA5LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTguMDguYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE4LjA5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTgu
MDguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5n
XzAuMTguMDkuYmIKaW5kZXggZjc3OWY2ZmU2YS4uMjVhYzY2NTE3YSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4wOC5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE4LjA5LmJiCkBAIC03
LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0NvbGluSWFuS2luZy9zdHJlc3MtbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiMGIwMzE3NTk3MDE2ZWE4OTQ5ODU3MGVkMjYyMWVl
NWViZWVhNzY4YyIKK1NSQ1JFViA9ICJjODRjOGQ1ZjVlZGIxY2E4OTYxZDNiZDk3ODE2ZDI0ZTkw
MzkyODk1IgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogREVQRU5EUyA9ICJjb3JldXRpbHMtbmF0
aXZlIGxpYmJzZCIKLS0gCjIuNDQuMQoK

--===============7487995304357069479==--

