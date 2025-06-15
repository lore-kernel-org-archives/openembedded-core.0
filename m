Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7365C83F14
	for <webhook@archiver.kernel.org>; Sun, 15 Jun 2025 13:15:05 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.8873.1749993296238126232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Jun 2025 06:14:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=IqmHQPef;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=MSSQmX8R;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019773ba8f5f-b7bd823e-b474-4dbf-b02f-1885b1a67c3a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1749993295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nRfU9XpLsZ7CbTaL2Tt2vgsL/iLe7BazvIVh6B3qyZ8=;
	b=IqmHQPefzpsZY6IzZuVuzTaIOgJWsYIclKoKmgFCjAvTOH4N3da3CRm52MtPPPE8
	aEuBbLI+3vtRTlpuN6JmtrCoKGRvDLGhN6fuP2cuOgacBo346tzbKIC5KOgarkAlgHu
	/f5byrUpU4cZp5W98YZdlHh6F85MxrNv65RRQLRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1749993295;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nRfU9XpLsZ7CbTaL2Tt2vgsL/iLe7BazvIVh6B3qyZ8=;
	b=MSSQmX8RiyLAS4eKdxK+EeRsce/0R/lqy5Qf5q1mcTzFmHQ6ztjqDqXCNFQNxmWF
	frBMxdFsG2Qu0IMfcasSpeAQyoae4MxSP4q48VEZgtfdRFmtg8Dmu1TaEA9S6sV27TH
	N49hA1q/OPSUaX7o0v8XRdNExbI13IjlDE3/wEqU=
Content-Type: multipart/mixed; boundary="===============0290619921587169174=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] screen: upgrading to 5.0.1 SUCCEEDED
Message-ID: <0101019773ba8f5f-b7bd823e-b474-4dbf-b02f-1885b1a67c3a-000000@us-west-2.amazonses.com>
Date: Sun, 15 Jun 2025 13:14:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jun 2025 13:15:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218709

--===============0290619921587169174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *screen* to *5.0.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-screen-upgrade-5.0.0-5.0.1.patch
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
From 8c58861cc4a97c1940392e7cc743035aa2e9ec0b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Jun 2025 10:23:30 +0000
Subject: [PATCH] screen: upgrade 5.0.0 -> 5.0.1

---
 .../screen/{screen_5.0.0.bb => screen_5.0.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/screen/{screen_5.0.0.bb => screen_5.0.1.bb} (95%)

diff --git a/meta/recipes-extended/screen/screen_5.0.0.bb b/meta/recipes-extended/screen/screen_5.0.1.bb
similarity index 95%
rename from meta/recipes-extended/screen/screen_5.0.0.bb
rename to meta/recipes-extended/screen/screen_5.0.1.bb
index fec5663fc2..69f4098519 100644
--- a/meta/recipes-extended/screen/screen_5.0.0.bb
+++ b/meta/recipes-extended/screen/screen_5.0.1.bb
@@ -20,7 +20,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'file://screen.pam', '', d)} \
            "
 
-SRC_URI[sha256sum] = "f04a39d00a0e5c7c86a55338808903082ad5df4d73df1a2fd3425976aed94971"
+SRC_URI[sha256sum] = "2dae36f4db379ffcd14b691596ba6ec18ac3a9e22bc47ac239789ab58409869d"
 
 inherit autotools-brokensep texinfo
 
-- 
2.47.1


--===============0290619921587169174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/screen: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen: SRC_URI changed from "https://ftpmirror.gnu.org/gnu/screen/screen-5.0.0.tar.gz file://screen.pam" to "https://ftpmirror.gnu.org/gnu/screen/screen-5.0.1.tar.gz file://screen.pam"
packages/core2-64-poky-linux/screen: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-dbg: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-dbg: PKGSIZE changed from 1352704 to 1354792 (+0%)
packages/core2-64-poky-linux/screen/screen-dbg: FILELIST: removed "/usr/bin/.debug/screen-5.0.0", added "/usr/bin/.debug/screen-5.0.1"
packages/core2-64-poky-linux/screen/screen-dbg: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-dev: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-dev: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-doc: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-doc: PKGSIZE changed from 165722 to 165922 (+0%)
packages/core2-64-poky-linux/screen/screen-doc: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-locale: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-locale: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-src: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-src: PKGSIZE changed from 942487 to 944647 (+0%)
packages/core2-64-poky-linux/screen/screen-src: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen-staticdev: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen-staticdev: PKGV changed from 5.0.0 [default] to 5.0.1 [default]
packages/core2-64-poky-linux/screen/screen: PV changed from "5.0.0" to "5.0.1"
packages/core2-64-poky-linux/screen/screen: PKGSIZE changed from 744708 to 744740 (+0%)
packages/core2-64-poky-linux/screen/screen: FILELIST: removed "/usr/bin/screen-5.0.0", added "/usr/bin/screen-5.0.1"
packages/core2-64-poky-linux/screen/screen: PKGV changed from 5.0.0 [default] to 5.0.1 [default]

--===============0290619921587169174==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-screen-upgrade-5.0.0-5.0.1.patch"

RnJvbSA4YzU4ODYxY2M0YTk3YzE5NDAzOTJlN2NjNzQzMDM1YWEyZTllYzBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgSnVuIDIwMjUgMTA6MjM6MzAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
Y3JlZW46IHVwZ3JhZGUgNS4wLjAgLT4gNS4wLjEKCi0tLQogLi4uL3NjcmVlbi97c2NyZWVuXzUu
MC4wLmJiID0+IHNjcmVlbl81LjAuMS5iYn0gICAgICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL3NjcmVlbi97c2NyZWVuXzUuMC4wLmJiID0+IHNjcmVlbl81LjAuMS5iYn0g
KDk1JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2NyZWVuL3NjcmVlbl81
LjAuMC5iYiBiL21ldGEvcmVjaXBlcy1leHRlbmRlZC9zY3JlZW4vc2NyZWVuXzUuMC4xLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTUlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zY3Jl
ZW4vc2NyZWVuXzUuMC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2NyZWVu
L3NjcmVlbl81LjAuMS5iYgppbmRleCBmZWM1NjYzZmMyLi42OWY0MDk4NTE5IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc2NyZWVuL3NjcmVlbl81LjAuMC5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZXh0ZW5kZWQvc2NyZWVuL3NjcmVlbl81LjAuMS5iYgpAQCAtMjAsNyArMjAsNyBA
QCBTUkNfVVJJID0gIiR7R05VX01JUlJPUn0vc2NyZWVuL3NjcmVlbi0ke1BWfS50YXIuZ3ogXAog
ICAgICAgICAgICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3BhbScs
ICdmaWxlOi8vc2NyZWVuLnBhbScsICcnLCBkKX0gXAogICAgICAgICAgICAiCiAKLVNSQ19VUklb
c2hhMjU2c3VtXSA9ICJmMDRhMzlkMDBhMGU1YzdjODZhNTUzMzg4MDg5MDMwODJhZDVkZjRkNzNk
ZjFhMmZkMzQyNTk3NmFlZDk0OTcxIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjJkYWUzNmY0ZGIz
NzlmZmNkMTRiNjkxNTk2YmE2ZWMxOGFjM2E5ZTIyYmM0N2FjMjM5Nzg5YWI1ODQwOTg2OWQiCiAK
IGluaGVyaXQgYXV0b3Rvb2xzLWJyb2tlbnNlcCB0ZXhpbmZvCiAKLS0gCjIuNDcuMQoK

--===============0290619921587169174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/screen/screen: FILELIST: removed "/usr/bin/screen-5.0.0", added "/usr/bin/screen-5.0.1"

--===============0290619921587169174==--

