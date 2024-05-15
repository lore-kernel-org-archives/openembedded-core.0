Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 782C5C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:18 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1273.1715794337765295571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=HtBFmz87;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=FFmN5WCC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fdc9b-d465dbdd-317a-449b-a303-450880fcbbe1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=l6BSv9BM5rUvTrxgDyopLNNtfZqlA6/BNb0CMGgWU4E=;
	b=HtBFmz87stQzDH3/uFbKn9uE8R/GuWgPLJLPxRBMVzBenVvTUNo+SHETh5zQPLQ8
	Av8twAH4MUNQUTjsZGR31BcP1wNWmN7NzFJmDEUhMYXNNNTqpc0kZCNSofpVSPNHYZ0
	vEoHHMWnFWEllvodxmHldWZGwHIxbC6el390/TCA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=l6BSv9BM5rUvTrxgDyopLNNtfZqlA6/BNb0CMGgWU4E=;
	b=FFmN5WCCVgFeMef0bMgu4wCjG1ACu6Z6lqXtSpZUBwPGqQ0bVR+sB4vLEDB56OzA
	XE7DVVT8FjvyRJveS2snDWM9xvCf3cXZIHhMm/gfXAeHdnMpjgohSmmQEbSTKWjmdod
	KFZrgoav0AtYgntZUiseYAbq1RGWcJGvXfqtIOHI=
Content-Type: multipart/mixed; boundary="===============7954511938178771784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] btrfs-tools: upgrading to 6.8.1 SUCCEEDED
Message-ID: <0101018f7d4fdc9b-d465dbdd-317a-449b-a303-450880fcbbe1-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:16 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199315

--===============7954511938178771784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *btrfs-tools* to *6.8.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-btrfs-tools-upgrade-6.8-6.8.1.patch
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
From 97d9d4386f556930262d9ea157ad4af1008ccb38 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 08:18:29 +0000
Subject: [PATCH] btrfs-tools: upgrade 6.8 -> 6.8.1

---
 ...1-Add-a-possibility-to-specify-where-python-modules-ar.patch | 2 +-
 .../btrfs-tools/{btrfs-tools_6.8.bb => btrfs-tools_6.8.1.bb}    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/btrfs-tools/{btrfs-tools_6.8.bb => btrfs-tools_6.8.1.bb} (98%)

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
index 4b1797b65f..756044628f 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-Add-a-possibility-to-specify-where-python-modules-ar.patch
@@ -1,4 +1,4 @@
-From 980f6edc269fa3ef8d4d4b9cd1aada2328131c19 Mon Sep 17 00:00:00 2001
+From 09f4a939d26331c3c2e2dec2a3edb6d4c07ef92f Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 23 May 2018 21:20:35 +0300
 Subject: [PATCH] Add a possibility to specify where python modules are
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
similarity index 98%
rename from meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
rename to meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
index 15cc7ac244..fac9f8f7ef 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.8.1.bb
@@ -18,7 +18,7 @@ DEPENDS = "util-linux zlib"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git;branch=master;protocol=https \
            file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
            "
-SRCREV = "3793e987d2b4e878410da16f33d963043d137d48"
+SRCREV = "5d97c32d6f94cf6f473a5f82964e3edaeb1b146e"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= " \
-- 
2.44.0


--===============7954511938178771784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-btrfs-tools-upgrade-6.8-6.8.1.patch"

RnJvbSA5N2Q5ZDQzODZmNTU2OTMwMjYyZDllYTE1N2FkNGFmMTAwOGNjYjM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDg6MTg6MjkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBi
dHJmcy10b29sczogdXBncmFkZSA2LjggLT4gNi44LjEKCi0tLQogLi4uMS1BZGQtYS1wb3NzaWJp
bGl0eS10by1zcGVjaWZ5LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoIHwgMiArLQogLi4u
L2J0cmZzLXRvb2xzL3tidHJmcy10b29sc182LjguYmIgPT4gYnRyZnMtdG9vbHNfNi44LjEuYmJ9
ICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL3tidHJmcy10b29s
c182LjguYmIgPT4gYnRyZnMtdG9vbHNfNi44LjEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9z
c2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29scy8wMDAxLUFkZC1hLXBvc3Np
YmlsaXR5LXRvLXNwZWNpZnktd2hlcmUtcHl0aG9uLW1vZHVsZXMtYXIucGF0Y2gKaW5kZXggNGIx
Nzk3YjY1Zi4uNzU2MDQ0NjI4ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0
cmZzLXRvb2xzL2J0cmZzLXRvb2xzLzAwMDEtQWRkLWEtcG9zc2liaWxpdHktdG8tc3BlY2lmeS13
aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YnRyZnMtdG9vbHMvYnRyZnMtdG9vbHMvMDAwMS1BZGQtYS1wb3NzaWJpbGl0eS10by1zcGVjaWZ5
LXdoZXJlLXB5dGhvbi1tb2R1bGVzLWFyLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5ODBm
NmVkYzI2OWZhM2VmOGQ0ZDRiOWNkMWFhZGEyMzI4MTMxYzE5IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAwOWY0YTkzOWQyNjMzMWMzYzJlMmRlYzJhM2VkYjZkNGMwN2VmOTJmIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZp
bkBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDIzIE1heSAyMDE4IDIxOjIwOjM1ICswMzAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIEFkZCBhIHBvc3NpYmlsaXR5IHRvIHNwZWNpZnkgd2hlcmUgcHl0aG9uIG1v
ZHVsZXMgYXJlCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYnRyZnMtdG9vbHMv
YnRyZnMtdG9vbHNfNi44LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2J0cmZzLXRvb2xzL2J0
cmZzLXRvb2xzXzYuOC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjguYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjguMS5iYgpp
bmRleCAxNWNjN2FjMjQ0Li5mYWM5ZjhmN2VmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYnRyZnMtdG9vbHMvYnRyZnMtdG9vbHNfNi44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9idHJmcy10b29scy9idHJmcy10b29sc182LjguMS5iYgpAQCAtMTgsNyArMTgsNyBA
QCBERVBFTkRTID0gInV0aWwtbGludXggemxpYiIKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2tkYXZlL2J0cmZzLXByb2dzLmdpdDticmFu
Y2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtQWRkLWEt
cG9zc2liaWxpdHktdG8tc3BlY2lmeS13aGVyZS1weXRob24tbW9kdWxlcy1hci5wYXRjaCBcCiAg
ICAgICAgICAgICIKLVNSQ1JFViA9ICIzNzkzZTk4N2QyYjRlODc4NDEwZGExNmYzM2Q5NjMwNDNk
MTM3ZDQ4IgorU1JDUkVWID0gIjVkOTdjMzJkNmY5NGNmNmY0NzNhNWY4Mjk2NGUzZWRhZWIxYjE0
NmUiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBQQUNLQUdFQ09ORklHID8/PSAiIFwKLS0gCjIu
NDQuMAoK

--===============7954511938178771784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PV changed from "6.8" to "6.8.1"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGSIZE changed from 25049752 to 25055168 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dbg: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PV changed from "6.8" to "6.8.1"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGSIZE changed from 218986 to 218990 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-dev: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PV changed from "6.8" to "6.8.1"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-doc: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PV changed from "6.8" to "6.8.1"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-locale: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PV changed from "6.8" to "6.8.1"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGSIZE changed from 4179121 to 4179759 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-src: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PV changed from "6.8" to "6.8.1"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools-staticdev: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PV changed from "6.8" to "6.8.1"
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGSIZE changed from 5824850 to 5828948 (+0%)
packages/core2-64-poky-linux/btrfs-tools/btrfs-tools: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools: PKGV changed from 6.8 [default] to 6.8.1 [default]
packages/core2-64-poky-linux/btrfs-tools: PV changed from "6.8" to "6.8.1"
Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/top_level.txt was removed

--===============7954511938178771784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

Changes to packages/core2-64-poky-linux/btrfs-tools (sysroot):
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/dependency_links.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/PKG-INFO was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/SOURCES.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8.1-py3.12.egg-info/top_level.txt was added
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/dependency_links.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/PKG-INFO was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/SOURCES.txt was removed
  /usr/lib/python3.12/site-packages/btrfsutil-6.8-py3.12.egg-info/top_level.txt was removed

--===============7954511938178771784==--

