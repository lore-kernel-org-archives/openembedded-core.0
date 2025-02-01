Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87365C19F32
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:02 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.42621.1738416044724946212
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:21:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=LisfbR22;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=eCgCsN0x;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010194c1abf647-2d508b22-7dea-4054-9eb8-eddb9c4eee4b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vjm/GpqSEUwsKLDar5q7uXR32JnoU1msp0MuJDTEjPY=;
	b=LisfbR22Z2XNZ2UIR+nRlB216dMj8F4l/kGfiPGK+um6dxL9lCJo9ug+dt+/7CWL
	05nPqXSorViy8mioz+lTRUG37luQhosQxW8Pm6NX6L0DHlPg/af5xLqMz5MFgbeXa6A
	QHLRdKu6RQFkqRaBytimktYEsMkS01FhvunoL5V4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416060;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vjm/GpqSEUwsKLDar5q7uXR32JnoU1msp0MuJDTEjPY=;
	b=eCgCsN0xSPWNLvIYtftbl7WMwg5hj9KFaHBFzxe3TbR9XT6RxJelppsmbnJf/VIm
	XM2qpmJ6N5n5lRagL2f7DGKuLox5nokNORKa+KNRqNubtwP9XBEQ7TTr3369brQc/dH
	0OsirtR8H8AzTNTK7qFQI+GNzoJXXNtFkLEcgEtw=
Content-Type: multipart/mixed; boundary="===============9102636070195629116=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.18.09 SUCCEEDED
Message-ID: <01010194c1abf647-2d508b22-7dea-4054-9eb8-eddb9c4eee4b-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:59 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210561

--===============9102636070195629116==
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
From 65a054924addbdf5e2639aeb437a18d1f130eef1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 10:20:34 +0000
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


--===============9102636070195629116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/stress-ng: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 26387416 to 26388240 (+0%)
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 5848194 to 5848182 (-0%)
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.18.08" to "0.18.09"
packages/core2-64-poky-linux/stress-ng/stress-ng: PKGV changed from 0.18.08 [default] to 0.18.09 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng: PV changed from "0.18.08" to "0.18.09"

--===============9102636070195629116==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.18.08-0.18.09.patch"

RnJvbSA2NWEwNTQ5MjRhZGRiZGY1ZTI2MzlhZWI0MzdhMThkMWYxMzBlZWYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAxMDoyMDozNCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN0
cmVzcy1uZzogdXBncmFkZSAwLjE4LjA4IC0+IDAuMTguMDkKCi0tLQogLi4uL3N0cmVzcy1uZy97
c3RyZXNzLW5nXzAuMTguMDguYmIgPT4gc3RyZXNzLW5nXzAuMTguMDkuYmJ9ICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy97c3RyZXNzLW5nXzAuMTguMDguYmIgPT4gc3Ry
ZXNzLW5nXzAuMTguMDkuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4wOC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTguMDkuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4w
OC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3Mtbmdf
MC4xOC4wOS5iYgppbmRleCBmNzc5ZjZmZTZhLi4yNWFjNjY1MTdhIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE4LjA4LmJiCisrKyBiL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTguMDkuYmIKQEAgLTcs
NyArNyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWIyMzRlZTRk
NjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20v
Q29saW5JYW5LaW5nL3N0cmVzcy1uZy5naXQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBc
CiAgICAgICAgICAgICIKLVNSQ1JFViA9ICIwYjAzMTc1OTcwMTZlYTg5NDk4NTcwZWQyNjIxZWU1
ZWJlZWE3NjhjIgorU1JDUkVWID0gImM4NGM4ZDVmNWVkYjFjYTg5NjFkM2JkOTc4MTZkMjRlOTAz
OTI4OTUiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBERVBFTkRTID0gImNvcmV1dGlscy1uYXRp
dmUgbGliYnNkIgotLSAKMi40NC4xCgo=

--===============9102636070195629116==--

