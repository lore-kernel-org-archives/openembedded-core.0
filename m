Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F1DCA0ED0
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:51 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.12484.1752594936053273342
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=b/c1D/6+;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NRUqOOH9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 010101980ecca9b9-9af72455-1ce5-4cb8-b6bc-b01bf93378cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HgkLBIVDKqZJwbt2bd6HUDnAdvfyaeInl5+ZNG2hjUg=;
	b=b/c1D/6++LxdqURdEAcH5tbZ4DajQ0dno49agKf8cyGcp3aFZskI1995SwoOeTlr
	s5q5PcMOUTlyUMXbyfWVJu325Qx09Zgeuk6tMYtT3waGijKuVQxe6dGXIgNw8UlB5GK
	/iriHei2VexUdBsxjMG2uRdLgRBTtYGnXZgwCOak=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594950;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HgkLBIVDKqZJwbt2bd6HUDnAdvfyaeInl5+ZNG2hjUg=;
	b=NRUqOOH9qmMmgTBTFtEkMZPnAbxKHrkGtURj7Lu7GPGQZB5H6/BrJjk+8vGhtEe8
	f6VC/ZPwSXpMXmHB3E/wEWC6Sij6VgSpey6MOsW3xnLISlpeuuE1AR4tg+Sn6uUCqq/
	6ab6zYsNbROiKcgJF+gX1oocIGReu3kfnwJWQPQg=
Content-Type: multipart/mixed; boundary="===============1183950700955537187=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Carlos Rafael Giani <crg7475@mailbox.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kmscube: upgrading to e05830984e15ae77bd3dbcf41d4cd0a60010dda2
 SUCCEEDED
Message-ID: <010101980ecca9b9-9af72455-1ce5-4cb8-b6bc-b01bf93378cd-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220377

--===============1183950700955537187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *kmscube* to *e05830984e15ae77bd3dbcf41d4cd0a60010dda2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-kmscube-upgrade-to-latest-revision.patch
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
From 56ef685fa55c1bd6ab7a3a27b13bb306756e48be Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 13:28:42 +0000
Subject: [PATCH] kmscube: upgrade to latest revision

---
 meta/recipes-graphics/kmscube/kmscube_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/kmscube/kmscube_git.bb b/meta/recipes-graphics/kmscube/kmscube_git.bb
index 013fdfb6bf..66bd7b08ef 100644
--- a/meta/recipes-graphics/kmscube/kmscube_git.bb
+++ b/meta/recipes-graphics/kmscube/kmscube_git.bb
@@ -10,7 +10,7 @@ DEPENDS = "virtual/libgles3 virtual/libgles2 virtual/egl libdrm virtual/libgbm"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=2a12bf7a66f5f663d75186bf01eb607b"
 
-SRCREV = "311eaaaa473d593c30d118799aa19ac4ad53cd65"
+SRCREV = "e05830984e15ae77bd3dbcf41d4cd0a60010dda2"
 SRC_URI = "git://gitlab.freedesktop.org/mesa/kmscube;branch=master;protocol=https \
            "
 
-- 
2.47.1


--===============1183950700955537187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGSIZE changed from 1838112 to 1837688 (-0%)
packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube: PKGSIZE changed from 1585736 to 1585712 (-0%)
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e

--===============1183950700955537187==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/kmscube/kmscube-dbg: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-dev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-doc: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-locale: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-src: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube-staticdev: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e
packages/core2-64-poky-linux/kmscube/kmscube: PKGV changed from 0.0.1+git0+311eaaaa47 to 0.0.1+git0+e05830984e

--===============1183950700955537187==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-kmscube-upgrade-to-latest-revision.patch"

RnJvbSA1NmVmNjg1ZmE1NWMxYmQ2YWI3YTNhMjdiMTNiYjMwNjc1NmU0OGJlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMTM6Mjg6NDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBr
bXNjdWJlOiB1cGdyYWRlIHRvIGxhdGVzdCByZXZpc2lvbgoKLS0tCiBtZXRhL3JlY2lwZXMtZ3Jh
cGhpY3Mva21zY3ViZS9rbXNjdWJlX2dpdC5iYiB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9rbXNjdWJlL2ttc2N1YmVfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1
YmUva21zY3ViZV9naXQuYmIKaW5kZXggMDEzZmRmYjZiZi4uNjZiZDdiMDhlZiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL2ttc2N1YmUva21zY3ViZV9naXQuYmIKQEAgLTEwLDcgKzEwLDcg
QEAgREVQRU5EUyA9ICJ2aXJ0dWFsL2xpYmdsZXMzIHZpcnR1YWwvbGliZ2xlczIgdmlydHVhbC9l
Z2wgbGliZHJtIHZpcnR1YWwvbGliZ2JtIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT0yYTEyYmY3YTY2ZjVmNjYzZDc1MTg2YmYwMWViNjA3YiIKIAotU1JDUkVWID0g
IjMxMWVhYWFhNDczZDU5M2MzMGQxMTg3OTlhYTE5YWM0YWQ1M2NkNjUiCitTUkNSRVYgPSAiZTA1
ODMwOTg0ZTE1YWU3N2JkM2RiY2Y0MWQ0Y2QwYTYwMDEwZGRhMiIKIFNSQ19VUkkgPSAiZ2l0Oi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tZXNhL2ttc2N1YmU7YnJhbmNoPW1hc3Rlcjtwcm90b2Nv
bD1odHRwcyBcCiAgICAgICAgICAgICIKIAotLSAKMi40Ny4xCgo=

--===============1183950700955537187==--

