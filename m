Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F04C05051
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:38 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web10.5951.1689456455533757753
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KNKZRaND;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101895b73b2fd-b68281bc-15c0-4fdb-a3b6-c2566b742227-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qlmtz6VKbv37GDwmiboFqAcXQBsUSkyyXH7gvgb6V8w=;
	b=KNKZRaNDHJaPeBTrFj+JLw/hsj4+iz97nIgmYLZWinUM51Ox168RLsERcQQM9ZEK
	cpEfSKS/KugJ0zjDzJQwj+ds2u6AhalCy8J/IYVVK6Hacq4GHtDK1OTHqOBO7DE1Yzr
	x6kBfT4ybxNzZWG/3nLOyb8urfQTUs8WiepjnsuM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456456;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qlmtz6VKbv37GDwmiboFqAcXQBsUSkyyXH7gvgb6V8w=;
	b=kgiY1kVf2YXPKKLX/AkISwPkj1UbHzLnMXXfou+iz0ZCGAcQ/ECIF//EkSGi8EgD
	SaQHfWnRLB+5+eE6WAYF094IKQkkTC8I0EbN+1jOmFJFgwvuKOxID7exXLfkjNZprog
	mifJRXlq7lLFJmtDQuHm+TIIgutg8nlFaluKAN0U=
Content-Type: multipart/mixed; boundary="===============4411076086260743739=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libproxy: upgrading to 0.5.3 SUCCEEDED
Message-ID: <010101895b73b2fd-b68281bc-15c0-4fdb-a3b6-c2566b742227-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:36 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184399

--===============4411076086260743739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libproxy* to *0.5.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libproxy-upgrade-0.5.2-0.5.3.patch
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
From 3581a13abeda98d75500de125839aa4108860a8d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 21:02:26 +0000
Subject: [PATCH] libproxy: upgrade 0.5.2 -> 0.5.3

---
 .../libproxy/{libproxy_0.5.2.bb => libproxy_0.5.3.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libproxy/{libproxy_0.5.2.bb => libproxy_0.5.3.bb} (95%)

diff --git a/meta/recipes-support/libproxy/libproxy_0.5.2.bb b/meta/recipes-support/libproxy/libproxy_0.5.3.bb
similarity index 95%
rename from meta/recipes-support/libproxy/libproxy_0.5.2.bb
rename to meta/recipes-support/libproxy/libproxy_0.5.3.bb
index 7faec2d3d6..db88af093e 100644
--- a/meta/recipes-support/libproxy/libproxy_0.5.2.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.5.3.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 DEPENDS = "glib-2.0"
 
 SRC_URI = "git://github.com/libproxy/libproxy;protocol=https;branch=main"
-SRCREV = "e4f467b05c8adf25e5a2d5464914fc7e92bb7990"
+SRCREV = "29d51a611f28af0bdbd51a5779cc8df264c8dcff"
 S = "${WORKDIR}/git"
 
 inherit meson pkgconfig gobject-introspection vala gi-docgen
-- 
2.39.2


--===============4411076086260743739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libproxy: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy-dbg: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy/libproxy-dbg: PKGSIZE changed from 118700 to 118648 (-0%)
packages/core2-32-poky-linux/libproxy/libproxy-dbg: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy-dev: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy/libproxy-dev: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy-doc: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy/libproxy-doc: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy-locale: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy/libproxy-locale: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy-src: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy/libproxy-src: PKGSIZE changed from 63443 to 63507 (+0%)
packages/core2-32-poky-linux/libproxy/libproxy-src: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy-staticdev: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy/libproxy-staticdev: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy: PKGV changed from 0.5.2 [default] to 0.5.3 [default]
packages/core2-32-poky-linux/libproxy/libproxy: PV changed from "0.5.2" to "0.5.3"
packages/core2-32-poky-linux/libproxy/libproxy: FILES: removed "/usr/lib/libproxy/0.5.2/modules", added "/usr/lib/libproxy/0.5.3/modules"

--===============4411076086260743739==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libproxy-upgrade-0.5.2-0.5.3.patch"

RnJvbSAzNTgxYTEzYWJlZGE5OGQ3NTUwMGRlMTI1ODM5YWE0MTA4ODYwYThkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMjE6MDI6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJwcm94eTogdXBncmFkZSAwLjUuMiAtPiAwLjUuMwoKLS0tCiAuLi4vbGlicHJveHkve2xpYnBy
b3h5XzAuNS4yLmJiID0+IGxpYnByb3h5XzAuNS4zLmJifSAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJwcm94eS97bGlicHJveHlfMC41LjIuYmIgPT4gbGlicHJveHlfMC41
LjMuYmJ9ICg5NSUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkv
bGlicHJveHlfMC41LjIuYmIgYi9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJwcm94eS9saWJwcm94
eV8wLjUuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMt
c3VwcG9ydC9saWJwcm94eS9saWJwcm94eV8wLjUuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlfMC41LjMuYmIKaW5kZXggN2ZhZWMyZDNkNi4uZGI4
OGFmMDkzZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJv
eHlfMC41LjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlicHJveHkvbGlicHJveHlf
MC41LjMuYmIKQEAgLTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09Q
WUlORzttZDU9NGZiZDY1MzgwY2RkMjU1OTUxMDc5MDA4YjM2NDUxNmMgXAogREVQRU5EUyA9ICJn
bGliLTIuMCIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL2xpYnByb3h5L2xpYnByb3h5
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluIgotU1JDUkVWID0gImU0ZjQ2N2IwNWM4YWRmMjVl
NWEyZDU0NjQ5MTRmYzdlOTJiYjc5OTAiCitTUkNSRVYgPSAiMjlkNTFhNjExZjI4YWYwYmRiZDUx
YTU3NzljYzhkZjI2NGM4ZGNmZiIKIFMgPSAiJHtXT1JLRElSfS9naXQiCiAKIGluaGVyaXQgbWVz
b24gcGtnY29uZmlnIGdvYmplY3QtaW50cm9zcGVjdGlvbiB2YWxhIGdpLWRvY2dlbgotLSAKMi4z
OS4yCgo=

--===============4411076086260743739==--

