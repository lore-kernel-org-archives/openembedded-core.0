Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0B4C021A6
	for <webhook@archiver.kernel.org>; Sat, 15 Feb 2025 12:42:32 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.8049.1739623329945473569
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Feb 2025 04:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=DWMjxQ2R;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SUGZFaCd;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019509a1a108-01aaf145-e869-449e-bae9-663b5fe177d5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1739623342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K1RmtAMif14R1LijC2DyvTI2qMwOVCqb7PrIWACzlgs=;
	b=DWMjxQ2RbNmlVsOBeScrLNf0neQh9cjeU4677fWf3sb+xHP9GHBNUjw7xD/Vdfa0
	J8PM8tymPxKlRJxzVgj1/kp+zlarQBX4WKIBOsTRbU8/tYjKGbQAgdIsduXBpwZ3cku
	ZLOGzrGopbAdCS8edEo2QkJq+qBEiIVr/c7FOuDo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1739623342;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K1RmtAMif14R1LijC2DyvTI2qMwOVCqb7PrIWACzlgs=;
	b=SUGZFaCdvuDv2uChWKCNPQNJBgx6Sc3dJjdy57TfW0qaW1TllPRKqz1LTRcP01N7
	PVTcqiNzpuFqijguSwyfcyMGgC/BAP5Jm8SP4a6gHQ3RUfFq/NRz4nGnVHNSUzgiDH0
	q7cT4WQ9Yzolw3gVmf72Pdtu1uHp2/roRCZ2ImTs=
Content-Type: multipart/mixed; boundary="===============6830310434993531653=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] stress-ng: upgrading to 0.18.10 SUCCEEDED
Message-ID: <0101019509a1a108-01aaf145-e869-449e-bae9-663b5fe177d5-000000@us-west-2.amazonses.com>
Date: Sat, 15 Feb 2025 12:42:22 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Feb 2025 12:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211442

--===============6830310434993531653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *stress-ng* to *0.18.10* has Succeeded.

Next steps:
    - apply the patch: git am 0001-stress-ng-upgrade-0.18.09-0.18.10.patch
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
From b04445fffe8360b425175e869230421495655a77 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Feb 2025 09:05:38 +0000
Subject: [PATCH] stress-ng: upgrade 0.18.09 -> 0.18.10

---
 .../stress-ng/{stress-ng_0.18.09.bb => stress-ng_0.18.10.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.18.09.bb => stress-ng_0.18.10.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb b/meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
index 25ac66517a..7fcb5af0ee 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.18.09.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.18.10.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master \
            "
-SRCREV = "c84c8d5f5edb1ca8961d3bd97816d24e90392895"
+SRCREV = "e00c355b8e9af3f7ce091e88ec6ddb5c439dc972"
 S = "${WORKDIR}/git"
 
 DEPENDS = "coreutils-native libbsd"
-- 
2.44.1


--===============6830310434993531653==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/stress-ng: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng-bash-completion: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-bash-completion: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PKGSIZE changed from 29495592 to 29573840 (+0%)
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-dbg: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng-dev: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-dev: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng-doc: PKGSIZE changed from 93214 to 93307 (+0%)
packages/core2-64-poky-linux/stress-ng/stress-ng-doc: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-doc: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng-locale: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-locale: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PKGSIZE changed from 5848182 to 5898305 (+1%)
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-src: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng-staticdev: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng-staticdev: PV changed from "0.18.09" to "0.18.10"
packages/core2-64-poky-linux/stress-ng/stress-ng: PKGSIZE changed from 12440404 to 12460756 (+0%)
packages/core2-64-poky-linux/stress-ng/stress-ng: PKGV changed from 0.18.09 [default] to 0.18.10 [default]
packages/core2-64-poky-linux/stress-ng/stress-ng: PV changed from "0.18.09" to "0.18.10"

--===============6830310434993531653==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-stress-ng-upgrade-0.18.09-0.18.10.patch"

RnJvbSBiMDQ0NDVmZmZlODM2MGI0MjUxNzVlODY5MjMwNDIxNDk1NjU1YTc3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgRmViIDIwMjUgMDk6MDU6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJlc3Mtbmc6IHVwZ3JhZGUgMC4xOC4wOSAtPiAwLjE4LjEwCgotLS0KIC4uLi9zdHJlc3Mtbmcv
e3N0cmVzcy1uZ18wLjE4LjA5LmJiID0+IHN0cmVzcy1uZ18wLjE4LjEwLmJifSAgICB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcve3N0cmVzcy1uZ18wLjE4LjA5LmJiID0+IHN0
cmVzcy1uZ18wLjE4LjEwLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRl
bmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTguMDkuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5k
ZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE4LjEwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5nXzAuMTgu
MDkuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9zdHJlc3Mtbmcvc3RyZXNzLW5n
XzAuMTguMTAuYmIKaW5kZXggMjVhYzY2NTE3YS4uN2ZjYjVhZjBlZSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL3N0cmVzcy1uZy9zdHJlc3MtbmdfMC4xOC4wOS5iYgorKysgYi9t
ZXRhL3JlY2lwZXMtZXh0ZW5kZWQvc3RyZXNzLW5nL3N0cmVzcy1uZ18wLjE4LjEwLmJiCkBAIC03
LDcgKzcsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1iMjM0ZWU0
ZDY5ZjVmY2U0NDg2YTgwZmRhZjRhNDI2MyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29t
L0NvbGluSWFuS2luZy9zdHJlc3MtbmcuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIg
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiYzg0YzhkNWY1ZWRiMWNhODk2MWQzYmQ5NzgxNmQy
NGU5MDM5Mjg5NSIKK1NSQ1JFViA9ICJlMDBjMzU1YjhlOWFmM2Y3Y2UwOTFlODhlYzZkZGI1YzQz
OWRjOTcyIgogUyA9ICIke1dPUktESVJ9L2dpdCIKIAogREVQRU5EUyA9ICJjb3JldXRpbHMtbmF0
aXZlIGxpYmJzZCIKLS0gCjIuNDQuMQoK

--===============6830310434993531653==--

