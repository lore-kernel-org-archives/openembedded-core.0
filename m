Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F90CC0219C
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:20:50 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.42624.1738416047960102175
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=XISdCfUv;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=pUTF0ic0;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010194c1abc4f5-f8ab040d-2205-40d6-97bc-bf5a246b9e31-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=llnmZcA+m0gQpJNERzH5lMIpUr0uRXrB88n4KlCrAmU=;
	b=XISdCfUvu2O39pZqdq9+85CQzSnnCaVC0FZY2zbdQo2R42Jlt4cjIxvs2GinsJJo
	HWl31vT4qwKKEoTAnG2Bu7oMH0de9VCl1zVXeEVY6GDi5Ocd7Ds88SOyQJQqc+Sy4sq
	XrfzP/9Afm/4Q6wWuJwZflJKzPk3YFxKKG52bvnA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416047;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=llnmZcA+m0gQpJNERzH5lMIpUr0uRXrB88n4KlCrAmU=;
	b=pUTF0ic0h21AmkEtpnflY8s49s7lQvUdqcp71z8zEfp4dTccALofNsHD6C7PkSTq
	WvBScURQq7yi+xZSUCfjBLJhRPorrkUSh4eBXmnHEP4QALKm/ZLXYbXFc0REmuskzs0
	In++IQ9rwbk2qEXNNoL1gSQfRtUEvbjX4jkrhHtE=
Content-Type: multipart/mixed; boundary="===============4736039480008462191=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] libslirp: upgrading to 4.9.0 SUCCEEDED
Message-ID: <01010194c1abc4f5-f8ab040d-2205-40d6-97bc-bf5a246b9e31-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:47 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:20:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210516

--===============4736039480008462191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *libslirp* to *4.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libslirp-upgrade-4.8.0-4.9.0.patch
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
From b9f135c62be326075a89fde1e7965d7cc2713ae6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 06:53:50 +0000
Subject: [PATCH] libslirp: upgrade 4.8.0 -> 4.9.0

---
 meta/recipes-connectivity/slirp/libslirp_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/slirp/libslirp_git.bb b/meta/recipes-connectivity/slirp/libslirp_git.bb
index 05830ce833..5b99a3168e 100644
--- a/meta/recipes-connectivity/slirp/libslirp_git.bb
+++ b/meta/recipes-connectivity/slirp/libslirp_git.bb
@@ -5,8 +5,8 @@ LICENSE = "BSD-3-Clause & MIT"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=bca0186b14e6b05e338e729f106db727"
 
 SRC_URI = "git://gitlab.freedesktop.org/slirp/libslirp.git;protocol=https;branch=master"
-SRCREV = "ce314e39458223c2c42245fe536fbe1bcd94e9b1"
-PV = "4.8.0"
+SRCREV = "c32a8a1ccaae8490142e67e078336a95c5ffc956"
+PV = "4.9.0"
 S = "${WORKDIR}/git"
 
 DEPENDS = " \
-- 
2.44.1


--===============4736039480008462191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/libslirp: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp: PKGV changed from 4.8.0 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PKGV changed from 4.8.0 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-dbg: PKGSIZE changed from 562760 to 574824 (+2%)
packages/core2-64-poky-linux/libslirp/libslirp-dev: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp/libslirp-dev: PKGV changed from 4.8.0 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-dev: PKGSIZE changed from 13770 to 16427 (+19%)
packages/core2-64-poky-linux/libslirp/libslirp-doc: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp/libslirp-doc: PKGV changed from 4.8.0 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-locale: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp/libslirp-locale: PKGV changed from 4.8.0 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-src: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp/libslirp-src: PKGV changed from 4.8.0 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp-src: PKGSIZE changed from 565458 to 585278 (+4%)
packages/core2-64-poky-linux/libslirp/libslirp-staticdev: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp/libslirp-staticdev: PKGV changed from 4.8.0 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/libslirp/libslirp: PV changed from "4.8.0" to "4.9.0"
packages/core2-64-poky-linux/libslirp/libslirp: PKGV changed from 4.8.0 [default] to 4.9.0 [default]

--===============4736039480008462191==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/libslirp/libslirp-dev: PKGSIZE changed from 13770 to 16427 (+19%)

--===============4736039480008462191==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libslirp-upgrade-4.8.0-4.9.0.patch"

RnJvbSBiOWYxMzVjNjJiZTMyNjA3NWE4OWZkZTFlNzk2NWQ3Y2MyNzEzYWU2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwNjo1Mzo1MCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnNsaXJwOiB1cGdyYWRlIDQuOC4wIC0+IDQuOS4wCgotLS0KIG1ldGEvcmVjaXBlcy1jb25uZWN0
aXZpdHkvc2xpcnAvbGlic2xpcnBfZ2l0LmJiIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1j
b25uZWN0aXZpdHkvc2xpcnAvbGlic2xpcnBfZ2l0LmJiIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9zbGlycC9saWJzbGlycF9naXQuYmIKaW5kZXggMDU4MzBjZTgzMy4uNWI5OWEzMTY4ZSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC9saWJzbGlycF9naXQu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zbGlycC9saWJzbGlycF9naXQuYmIK
QEAgLTUsOCArNSw4IEBAIExJQ0VOU0UgPSAiQlNELTMtQ2xhdXNlICYgTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vQ09QWVJJR0hUO21kNT1iY2EwMTg2YjE0ZTZiMDVlMzM4ZTcyOWYx
MDZkYjcyNyIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3NsaXJw
L2xpYnNsaXJwLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFzdGVyIgotU1JDUkVWID0gImNl
MzE0ZTM5NDU4MjIzYzJjNDIyNDVmZTUzNmZiZTFiY2Q5NGU5YjEiCi1QViA9ICI0LjguMCIKK1NS
Q1JFViA9ICJjMzJhOGExY2NhYWU4NDkwMTQyZTY3ZTA3ODMzNmE5NWM1ZmZjOTU2IgorUFYgPSAi
NC45LjAiCiBTID0gIiR7V09SS0RJUn0vZ2l0IgogCiBERVBFTkRTID0gIiBcCi0tIAoyLjQ0LjEK
Cg==

--===============4736039480008462191==--

