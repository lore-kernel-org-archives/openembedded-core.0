Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7759BE776F4
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:19 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.64746.1696183992157938871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TGygzHCq;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HDHToqjq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018aec71bcd2-f914587d-a1f9-4694-a6e2-7cded7fabe53-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=O8oi1Xn5N+Ahhs3TpaOthNpVg7f6m/hrFvky7we8x9c=;
	b=TGygzHCq9c937+RsxvBdEtbnmRCQgFQ9eDlCB41mOwxCOFexNgZ+PlSa3MABRwHv
	zXOPkRaSDBTZSVYZCxlDpQlxiMkOhiWxKSXdEoejsdOPihe+VHCbTbcQQvOb+wBLRK5
	a9xKBIcIC9Pwvso8kD6k9Qhg1zuPaVs2jbVF5iXs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=O8oi1Xn5N+Ahhs3TpaOthNpVg7f6m/hrFvky7we8x9c=;
	b=HDHToqjqtItqx0+nybRSB3rnCGxLcBW+zAj2XPUqjdKhhCRYGac/pb3hB6xm4WKo
	jI8kDO4q55ZEMfY5yJp9cCB7Tnipim/VwF3nQba54ZFz/MGHIvPq8QHR/Yim7bcDC/B
	CwK/0lKh913svy+TuqJT6ChipOtlxZhSH7rdEX7A=
Content-Type: multipart/mixed; boundary="===============8126244358291586527=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmod: upgrading to 31 SUCCEEDED
Message-ID: <0101018aec71bcd2-f914587d-a1f9-4694-a6e2-7cded7fabe53-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188567

--===============8126244358291586527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kmod* to *31* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmod-upgrade-30-31.patch
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
From af86dd0d7fc9fbc68f3ccad54ea82131e8d09106 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 16:13:18 +0000
Subject: [PATCH] kmod: upgrade 30 -> 31

---
 meta/recipes-kernel/kmod/{kmod_30.bb => kmod_31.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/kmod/{kmod_30.bb => kmod_31.bb} (98%)

diff --git a/meta/recipes-kernel/kmod/kmod_30.bb b/meta/recipes-kernel/kmod/kmod_31.bb
similarity index 98%
rename from meta/recipes-kernel/kmod/kmod_30.bb
rename to meta/recipes-kernel/kmod/kmod_31.bb
index 6fc9da9c82..934a678a06 100644
--- a/meta/recipes-kernel/kmod/kmod_30.bb
+++ b/meta/recipes-kernel/kmod/kmod_31.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
                    "
 inherit autotools bash-completion gtk-doc pkgconfig manpages update-alternatives
 
-SRCREV = "5d46434a63ae0160150a0efdde1914873697e273"
+SRCREV = "aff617ea871d0568cc491bd116c0be1e857463bb"
 
 SRC_URI = "git://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git;branch=master;protocol=https \
            file://depmod-search.conf \
-- 
2.39.2


--===============8126244358291586527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/kmod/kmod-bash-completion: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod-bash-completion: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/kmod-dbg: FILELIST: removed "/usr/lib/.debug/libkmod.so.2.4.0", added "/usr/lib/.debug/libkmod.so.2.4.1"
packages/core2-32-poky-linux/kmod/kmod-dbg: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod-dbg: PKGSIZE changed from 779336 to 783896 (+1%)
packages/core2-32-poky-linux/kmod/kmod-dbg: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/kmod-dev: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod-dev: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/kmod-doc: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod-doc: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/kmod-locale: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod-locale: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/kmod-src: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod-src: PKGSIZE changed from 401503 to 404687 (+1%)
packages/core2-32-poky-linux/kmod/kmod-src: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/kmod-staticdev: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod-staticdev: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/kmod: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/kmod: PKGSIZE changed from 177789 to 181845 (+2%)
packages/core2-32-poky-linux/kmod/kmod: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod: PKGV changed from 30 [default] to 31 [default]
packages/core2-32-poky-linux/kmod/libkmod: FILELIST: removed "/usr/lib/libkmod.so.2.4.0", added "/usr/lib/libkmod.so.2.4.1"
packages/core2-32-poky-linux/kmod/libkmod: PV changed from "30" to "31"
packages/core2-32-poky-linux/kmod/libkmod: PKGSIZE changed from 107948 to 107928 (-0%)
packages/core2-32-poky-linux/kmod/libkmod: PKGV changed from 30 [default] to 31 [default]
Changes to packages/core2-32-poky-linux/kmod (sysroot):
  /usr/lib/libkmod.so.2 changed symlink target from libkmod.so.2.4.0 to libkmod.so.2.4.1
  /usr/lib/libkmod.so changed symlink target from libkmod.so.2.4.0 to libkmod.so.2.4.1
  /usr/lib/libkmod.so.2.4.0 moved to /usr/lib/libkmod.so.2.4.1

--===============8126244358291586527==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-kmod-upgrade-30-31.patch"

RnJvbSBhZjg2ZGQwZDdmYzlmYmM2OGYzY2NhZDU0ZWE4MjEzMWU4ZDA5MTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNjoxMzoxOCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGtt
b2Q6IHVwZ3JhZGUgMzAgLT4gMzEKCi0tLQogbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL3trbW9k
XzMwLmJiID0+IGttb2RfMzEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL3trbW9k
XzMwLmJiID0+IGttb2RfMzEuYmJ9ICg5OCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWtl
cm5lbC9rbW9kL2ttb2RfMzAuYmIgYi9tZXRhL3JlY2lwZXMta2VybmVsL2ttb2Qva21vZF8zMS5i
YgpzaW1pbGFyaXR5IGluZGV4IDk4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMta2VybmVsL2tt
b2Qva21vZF8zMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2ttb2RfMzEu
YmIKaW5kZXggNmZjOWRhOWM4Mi4uOTM0YTY3OGEwNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWtlcm5lbC9rbW9kL2ttb2RfMzAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9rbW9kL2tt
b2RfMzEuYmIKQEAgLTE1LDcgKzE1LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9YTZmODllMjEwMGQ5YjZjZGZmY2VhNGYzOThlMzczNDMgXAogICAgICAgICAgICAg
ICAgICAgICIKIGluaGVyaXQgYXV0b3Rvb2xzIGJhc2gtY29tcGxldGlvbiBndGstZG9jIHBrZ2Nv
bmZpZyBtYW5wYWdlcyB1cGRhdGUtYWx0ZXJuYXRpdmVzCiAKLVNSQ1JFViA9ICI1ZDQ2NDM0YTYz
YWUwMTYwMTUwYTBlZmRkZTE5MTQ4NzM2OTdlMjczIgorU1JDUkVWID0gImFmZjYxN2VhODcxZDA1
NjhjYzQ5MWJkMTE2YzBiZTFlODU3NDYzYmIiCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS91dGlscy9rZXJuZWwva21vZC9rbW9kLmdpdDticmFuY2g9bWFzdGVyO3By
b3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovL2RlcG1vZC1zZWFyY2guY29uZiBcCi0t
IAoyLjM5LjIKCg==

--===============8126244358291586527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/kmod/libkmod: FILELIST: removed "/usr/lib/libkmod.so.2.4.0", added "/usr/lib/libkmod.so.2.4.1"
Changes to packages/core2-32-poky-linux/kmod (sysroot):
  /usr/lib/libkmod.so.2 changed symlink target from libkmod.so.2.4.0 to libkmod.so.2.4.1
  /usr/lib/libkmod.so changed symlink target from libkmod.so.2.4.0 to libkmod.so.2.4.1
  /usr/lib/libkmod.so.2.4.0 moved to /usr/lib/libkmod.so.2.4.1

--===============8126244358291586527==--

