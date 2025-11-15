Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 694A6CED279
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:39:04 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11929.1763224712422590111
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:39:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ug4ycwdJ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=ajiq8jG+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a886262c9-31a82aa2-4d21-4ccd-b915-c61dd1700ff7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CtSY+ICRuHm2tWH38mSru+X/WU3rbriUKu7xF3sCVIk=;
	b=ug4ycwdJV5Ooz0fVsPUVFXMTRxp+Gbj7IAmsWxEwPSApx3o+Cz6rlHlJ260NU4w6
	os44O4hWToSJgQL7aGI0ewglQe5CPYuGOfsaezjpuIC1cMglAsDjuWgaA6QcYLn3wzB
	NJkp997F4C7KztNYBqcrOQ1XRl40AFetWg2TGWY4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224740;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CtSY+ICRuHm2tWH38mSru+X/WU3rbriUKu7xF3sCVIk=;
	b=ajiq8jG+JASCl4uDKaPZnKWpguWc0HRdvEnZJyO7QcRJ2q7ALGH8ACX3HALFmveA
	ZfWm20s+V1yWVlRvA4pMZXTaJUM13k0Iy5SOguoBdsX+D6HifBestok0S0L+9bb3Ui7
	Hu74o/0W6ilFlWi1HrqByDHKe8ruk+SVMGBFXxqw=
Content-Type: multipart/mixed; boundary="===============1583978527084277265=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] less: upgrading to 685 SUCCEEDED
Message-ID: <0101019a886262c9-31a82aa2-4d21-4ccd-b915-c61dd1700ff7-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:39:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:39:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226397

--===============1583978527084277265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *less* to *685* has Succeeded.

Next steps:
    - apply the patch: git am 0001-less-upgrade-679-685.patch
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
From 573d3d1ac219f3d6b2d7de9b38312f3abbede147 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 12:17:38 +0000
Subject: [PATCH] less: upgrade 679 -> 685

---
 meta/recipes-extended/less/{less_679.bb => less_685.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/less/{less_679.bb => less_685.bb} (95%)

diff --git a/meta/recipes-extended/less/less_679.bb b/meta/recipes-extended/less/less_685.bb
similarity index 95%
rename from meta/recipes-extended/less/less_679.bb
rename to meta/recipes-extended/less/less_685.bb
index 613c71f571..904980a72f 100644
--- a/meta/recipes-extended/less/less_679.bb
+++ b/meta/recipes-extended/less/less_685.bb
@@ -29,7 +29,7 @@ SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
            file://run-ptest \
            "
 
-SRC_URI[sha256sum] = "9b68820c34fa8a0af6b0e01b74f0298bcdd40a0489c61649b47058908a153d78"
+SRC_URI[sha256sum] = "2701041e767e697ee420ce0825641cedc8f20b51576abe99d92c1666d332e9dc"
 
 UPSTREAM_CHECK_URI = "http://www.greenwoodsoftware.com/less/download.html"
 
-- 
2.47.1


--===============1583978527084277265==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/less: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less: SRC_URI changed from "http://www.greenwoodsoftware.com/less/less-679.tar.gz file://run-ptest" to "http://www.greenwoodsoftware.com/less/less-685.tar.gz file://run-ptest"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGSIZE changed from 927496 to 937240 (+1%)
packages/x86-64-v3-poky-linux/less/less-dbg: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-dbg: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-dev: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-dev: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-doc: PKGSIZE changed from 115972 to 118802 (+2%)
packages/x86-64-v3-poky-linux/less/less-doc: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-doc: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-locale: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-locale: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-ptest: PKGSIZE changed from 11254655 to 11254037 (-0%)
packages/x86-64-v3-poky-linux/less/less-ptest: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-ptest: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-src: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-src: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less-staticdev: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less-staticdev: PKGV changed from 679 [default] to 685 [default]
packages/x86-64-v3-poky-linux/less/less: PKGSIZE changed from 295176 to 299480 (+1%)
packages/x86-64-v3-poky-linux/less/less: PV changed from "679" to "685"
packages/x86-64-v3-poky-linux/less/less: PKGV changed from 679 [default] to 685 [default]

--===============1583978527084277265==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-less-upgrade-679-685.patch"

RnJvbSA1NzNkM2QxYWMyMTlmM2Q2YjJkN2RlOWIzODMxMmYzYWJiZWRlMTQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMTI6MTc6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
ZXNzOiB1cGdyYWRlIDY3OSAtPiA2ODUKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2xlc3Mv
e2xlc3NfNjc5LmJiID0+IGxlc3NfNjg1LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9s
ZXNzL3tsZXNzXzY3OS5iYiA9PiBsZXNzXzY4NS5iYn0gKDk1JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY3OS5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sZXNzL2xlc3NfNjg1LmJiCnNpbWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1leHRlbmRlZC9sZXNzL2xlc3NfNjc5LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMt
ZXh0ZW5kZWQvbGVzcy9sZXNzXzY4NS5iYgppbmRleCA2MTNjNzFmNTcxLi45MDQ5ODBhNzJmIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY3OS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbGVzcy9sZXNzXzY4NS5iYgpAQCAtMjksNyArMjksNyBAQCBT
UkNfVVJJID0gImh0dHA6Ly93d3cuZ3JlZW53b29kc29mdHdhcmUuY29tLyR7QlBOfS8ke0JQTn0t
JHtQVn0udGFyLmd6IFwKICAgICAgICAgICAgZmlsZTovL3J1bi1wdGVzdCBcCiAgICAgICAgICAg
ICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjliNjg4MjBjMzRmYThhMGFmNmIwZTAxYjc0ZjAy
OThiY2RkNDBhMDQ4OWM2MTY0OWI0NzA1ODkwOGExNTNkNzgiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiMjcwMTA0MWU3NjdlNjk3ZWU0MjBjZTA4MjU2NDFjZWRjOGYyMGI1MTU3NmFiZTk5ZDkyYzE2
NjZkMzMyZTlkYyIKIAogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHA6Ly93d3cuZ3JlZW53b29k
c29mdHdhcmUuY29tL2xlc3MvZG93bmxvYWQuaHRtbCIKIAotLSAKMi40Ny4xCgo=

--===============1583978527084277265==--

