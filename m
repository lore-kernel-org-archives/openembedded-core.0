Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9809C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.1241.1715794337734037318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CfsRy5Vh;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=DM8j3MwM;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018f7d4fe4d0-1864c244-9491-49ee-b3d1-07f8a578294c-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=/QM537s3Ut28yhSxAUeUb4/9hLe81mGV3LZRvAUPkoA=;
	b=CfsRy5VhF6LMNxldMPFrIdi+xTrG/5s+vbbkiExo4frWhRQtMW27XFDRoz19S5hL
	nV8teCgQn1LB/ih0Vjd3eZghOkDr6koDwNI6aNbW18jgRB2Q24JYufFHY+EEqfE2de8
	Gy9qXzjcv+oDbLfb7mRKqAA0ZWSE6w12tb8tUqi0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794339;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=/QM537s3Ut28yhSxAUeUb4/9hLe81mGV3LZRvAUPkoA=;
	b=DM8j3MwMFHDXoGszfL1oagqvHmQuwM/tilR9BJ2J0RQ84GU4E2D7DdvSJO+O8uLV
	T2M0u59lRRdKWz65iZguz34E7hfxahw98emlhXS+AaPW2zhRwh+3A8lmsbw3WQOb9Y1
	uwwPZPocPypGPxbSnXqtwtTLt1ir87Lci5DgzyHo=
Content-Type: multipart/mixed; boundary="===============1985770012631671258=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-volk: upgrading to 1.3.283.0 SUCCEEDED
Message-ID: <0101018f7d4fe4d0-1864c244-9491-49ee-b3d1-07f8a578294c-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:19 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199360

--===============1985770012631671258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-volk* to *1.3.283.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-vulkan-volk-upgrade-1.3.280.0-1.3.283.0.patch
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
From f7d5fe4a65132e4df04c15e58ff2ba0d76999bc2 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 14:38:24 +0000
Subject: [PATCH] vulkan-volk: upgrade 1.3.280.0 -> 1.3.283.0

---
 .../{vulkan-volk_1.3.280.0.bb => vulkan-volk_1.3.283.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/vulkan/{vulkan-volk_1.3.280.0.bb => vulkan-volk_1.3.283.0.bb} (95%)

diff --git a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
similarity index 95%
rename from meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
rename to meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
index 2ef12fedf8..334c760345 100644
--- a/meta/recipes-graphics/vulkan/vulkan-volk_1.3.280.0.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-volk_1.3.283.0.bb
@@ -10,7 +10,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=12e6af3a0e2a5e5dbf7796aa82b64626"
 
 SRC_URI = "git://github.com/zeux/volk.git;branch=master;protocol=https"
-SRCREV = "01986ac85fa2e5c70df09aeae9c907e27c5d50b2"
+SRCREV = "3a8068a57417940cf2bf9d837a7bb60d015ca2f1"
 
 S = "${WORKDIR}/git"
 
-- 
2.44.0


--===============1985770012631671258==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-vulkan-volk-upgrade-1.3.280.0-1.3.283.0.patch"

RnJvbSBmN2Q1ZmU0YTY1MTMyZTRkZjA0YzE1ZTU4ZmYyYmEwZDc2OTk5YmMyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMTQ6Mzg6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
dWxrYW4tdm9sazogdXBncmFkZSAxLjMuMjgwLjAgLT4gMS4zLjI4My4wCgotLS0KIC4uLi97dnVs
a2FuLXZvbGtfMS4zLjI4MC4wLmJiID0+IHZ1bGthbi12b2xrXzEuMy4yODMuMC5iYn0gICAgICB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92dWxrYW4ve3Z1bGthbi12b2xrXzEuMy4yODAuMC5i
YiA9PiB2dWxrYW4tdm9sa18xLjMuMjgzLjAuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMuMjgwLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGthbi12b2xrXzEuMy4yODMuMC5iYgpzaW1pbGFyaXR5
IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdnVsa2FuL3Z1bGth
bi12b2xrXzEuMy4yODAuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGth
bi92dWxrYW4tdm9sa18xLjMuMjgzLjAuYmIKaW5kZXggMmVmMTJmZWRmOC4uMzM0Yzc2MDM0NSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18xLjMu
MjgwLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Z1bGthbi92dWxrYW4tdm9sa18x
LjMuMjgzLjAuYmIKQEAgLTEwLDcgKzEwLDcgQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT0xMmU2YWYzYTBlMmE1ZTVkYmY3Nzk2YWE4
MmI2NDYyNiIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3pldXgvdm9say5naXQ7YnJh
bmNoPW1hc3Rlcjtwcm90b2NvbD1odHRwcyIKLVNSQ1JFViA9ICIwMTk4NmFjODVmYTJlNWM3MGRm
MDlhZWFlOWM5MDdlMjdjNWQ1MGIyIgorU1JDUkVWID0gIjNhODA2OGE1NzQxNzk0MGNmMmJmOWQ4
MzdhN2JiNjBkMDE1Y2EyZjEiCiAKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKLS0gCjIuNDQuMAoK

--===============1985770012631671258==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/vulkan-volk: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dbg: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGSIZE changed from 387180 to 387597 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-dev: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-doc: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-locale: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGSIZE changed from 379153 to 379570 (+0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-src: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGSIZE changed from 650918 to 650910 (-0%)
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk-staticdev: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PV changed from "1.3.280.0" to "1.3.283.0"
packages/core2-64-poky-linux/vulkan-volk/vulkan-volk: PKGV changed from 1.3.280.0 [default] to 1.3.283.0 [default]

--===============1985770012631671258==--

