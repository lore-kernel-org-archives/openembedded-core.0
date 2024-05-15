Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CCEC27C4F
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 17:32:19 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.1271.1715794337753463316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 10:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=W+IkAHBk;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=VpxeCqzn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018f7d4fdd4e-63ac60d0-785b-4bdb-8d00-10ca04e14b9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=G9/tXb/OwZBTKZyV+PYMrRpcSKfarlFng/t20Yd7V+8=;
	b=W+IkAHBku9boylxH3rmbKv/ZscxE5ztUwW3CmH4t446SOXOn65le0fJgBxtPOLrD
	qDQO42G8Eb0dzmThm3vKgIr8yS+lWiU3MSPY7oMPyLGjVbBh+ard2uqAmUa1/wuio2C
	incQHIMITSFvOIK4cVNjSQ+EhY8hTHhmQbWKT5UM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1715794337;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=G9/tXb/OwZBTKZyV+PYMrRpcSKfarlFng/t20Yd7V+8=;
	b=VpxeCqznaXw0RIns/rmNuvstOiGQ0KLan+4sCevIWX3wE02OSryyaTksrX3FySyu
	bL4FueX5AyFWmZNaGfDL8gTP2VETJCK01a9ueuWphhcq2l3jIjzVd1dW+Wp3hhCnV8B
	rMer4WORfHAObGIpJa5RWe0AhhQBAWy/al4lxzSU=
Content-Type: multipart/mixed; boundary="===============3232361379604176420=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] dmidecode: upgrading to 3.6 SUCCEEDED
Message-ID: <0101018f7d4fdd4e-63ac60d0-785b-4bdb-8d00-10ca04e14b9e-000000@us-west-2.amazonses.com>
Date: Wed, 15 May 2024 17:32:17 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.05.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 17:32:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199314

--===============3232361379604176420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *dmidecode* to *3.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-dmidecode-upgrade-3.5-3.6.patch
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
From f7c25b679851a5436efac99da48163fd15cde89e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 May 2024 08:38:07 +0000
Subject: [PATCH] dmidecode: upgrade 3.5 -> 3.6

---
 .../dmidecode/{dmidecode_3.5.bb => dmidecode_3.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/dmidecode/{dmidecode_3.5.bb => dmidecode_3.6.bb} (89%)

diff --git a/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb b/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
similarity index 89%
rename from meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
rename to meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
index 3e2bb6e30b..e5b4e27687 100644
--- a/meta/recipes-devtools/dmidecode/dmidecode_3.5.bb
+++ b/meta/recipes-devtools/dmidecode/dmidecode_3.6.bb
@@ -18,4 +18,4 @@ do_install() {
         install
 }
 
-SRC_URI[sha256sum] = "79d76735ee8e25196e2a722964cf9683f5a09581503537884b256b01389cc073"
+SRC_URI[sha256sum] = "e40c65f3ec3dafe31ad8349a4ef1a97122d38f65004ed66575e1a8d575dd8bae"
-- 
2.44.0


--===============3232361379604176420==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-dmidecode-upgrade-3.5-3.6.patch"

RnJvbSBmN2MyNWI2Nzk4NTFhNTQzNmVmYWM5OWRhNDgxNjNmZDE1Y2RlODllIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWF5IDIwMjQgMDg6Mzg6MDcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBk
bWlkZWNvZGU6IHVwZ3JhZGUgMy41IC0+IDMuNgoKLS0tCiAuLi4vZG1pZGVjb2RlL3tkbWlkZWNv
ZGVfMy41LmJiID0+IGRtaWRlY29kZV8zLjYuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvZG1pZGVjb2RlL3tkbWlkZWNvZGVfMy41LmJiID0+IGRtaWRlY29kZV8zLjYu
YmJ9ICg4OSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RtaWRlY29kZS9k
bWlkZWNvZGVfMy41LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2RtaWRlY29kZS9kbWlkZWNv
ZGVfMy42LmJiCnNpbWlsYXJpdHkgaW5kZXggODklCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1k
ZXZ0b29scy9kbWlkZWNvZGUvZG1pZGVjb2RlXzMuNS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2RtaWRlY29kZS9kbWlkZWNvZGVfMy42LmJiCmluZGV4IDNlMmJiNmUzMGIuLmU1
YjRlMjc2ODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9kbWlkZWNvZGUvZG1p
ZGVjb2RlXzMuNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZG1pZGVjb2RlL2RtaWRl
Y29kZV8zLjYuYmIKQEAgLTE4LDQgKzE4LDQgQEAgZG9faW5zdGFsbCgpIHsKICAgICAgICAgaW5z
dGFsbAogfQogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiNzlkNzY3MzVlZThlMjUxOTZlMmE3MjI5
NjRjZjk2ODNmNWEwOTU4MTUwMzUzNzg4NGIyNTZiMDEzODljYzA3MyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICJlNDBjNjVmM2VjM2RhZmUzMWFkODM0OWE0ZWYxYTk3MTIyZDM4ZjY1MDA0ZWQ2NjU3
NWUxYThkNTc1ZGQ4YmFlIgotLSAKMi40NC4wCgo=

--===============3232361379604176420==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/dmidecode/dmidecode-dbg: PKGSIZE changed from 365224 to 374464 (+3%)
packages/core2-64-poky-linux/dmidecode/dmidecode-dbg: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-dbg: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-dev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-dev: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-doc: PKGSIZE changed from 30266 to 31365 (+4%)
packages/core2-64-poky-linux/dmidecode/dmidecode-doc: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-doc: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-locale: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-locale: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-src: PKGSIZE changed from 252624 to 269813 (+7%)
packages/core2-64-poky-linux/dmidecode/dmidecode-src: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-src: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode-staticdev: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode-staticdev: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode/dmidecode: PKGSIZE changed from 210832 to 219088 (+4%)
packages/core2-64-poky-linux/dmidecode/dmidecode: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode/dmidecode: PV changed from "3.5" to "3.6"
packages/core2-64-poky-linux/dmidecode: PKGV changed from 3.5 [default] to 3.6 [default]
packages/core2-64-poky-linux/dmidecode: SRC_URI changed from "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.5.tar.xz" to "https://download.savannah.nongnu.org/releases/dmidecode/dmidecode-3.6.tar.xz"
packages/core2-64-poky-linux/dmidecode: PV changed from "3.5" to "3.6"

--===============3232361379604176420==--

