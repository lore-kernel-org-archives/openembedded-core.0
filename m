Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4479D48984
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:25:52 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1430.1768526746331128762
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=fjb/cZf1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=bYwVyQ5M;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019bc4688f40-cf2134c2-8afa-4605-a2ad-35ad4573dea5-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=vk07brXgMMKvCcAneDh5WxWKqQ1KMRBhMx3qeyX/xQk=;
	b=fjb/cZf183OgNf5L0m6/5T1amopwdZvcorQNABMJDXoGktr2iw0mpg70dS+F4n9w
	3+swcFYgUcsh6/rrEtcKqNuPrhZO2GdX5au3Wotz0n8ZRmLy4G/Nr40PFXdrUpv/CL+
	g5iKebW7hcfgeVD1fU2Kz3ej6QRqDmpAKoCY35cM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526745;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=vk07brXgMMKvCcAneDh5WxWKqQ1KMRBhMx3qeyX/xQk=;
	b=bYwVyQ5MHSvoyvmWtU3uLSFCM+DcGm4V77rZSwI07LWqPQVjgRLztb5m8XKD0SKA
	q9P5Qb7Z8hVdkSmQ/+nPduZM6yJC3Zfd7ptwAsMITGC0f7ZIkpgDF+++rdMJkdb17Lw
	CupEZLnvL6cdwbUV1G8mSR84zASyYb1+vPZslMKk=
Content-Type: multipart/mixed; boundary="===============3617271781366992177=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] seatd: upgrading to 0.9.2 SUCCEEDED
Message-ID: <0101019bc4688f40-cf2134c2-8afa-4605-a2ad-35ad4573dea5-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:45 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:25:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229457

--===============3617271781366992177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *seatd* to *0.9.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-seatd-upgrade-0.9.1-0.9.2.patch
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
From b3d2e2741db0b714c7708eda3f276b0d524d1983 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 20:20:19 +0000
Subject: [PATCH] seatd: upgrade 0.9.1 -> 0.9.2

---
 meta/recipes-core/seatd/{seatd_0.9.1.bb => seatd_0.9.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/seatd/{seatd_0.9.1.bb => seatd_0.9.2.bb} (97%)

diff --git a/meta/recipes-core/seatd/seatd_0.9.1.bb b/meta/recipes-core/seatd/seatd_0.9.2.bb
similarity index 97%
rename from meta/recipes-core/seatd/seatd_0.9.1.bb
rename to meta/recipes-core/seatd/seatd_0.9.2.bb
index 3be27dda9d..9e1b50c087 100644
--- a/meta/recipes-core/seatd/seatd_0.9.1.bb
+++ b/meta/recipes-core/seatd/seatd_0.9.2.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=715a99d2dd552e6188e74d4ed2914d5a"
 
 SRC_URI = "git://git.sr.ht/~kennylevinsen/seatd;protocol=https;branch=master \
            file://init"
-SRCREV = "566ffeb032af42865dc1210e48cec08368059bb9"
+SRCREV = "a3c56c324c3a84474cc1615d94ccd6a6255d0c10"
 
 inherit meson pkgconfig systemd update-rc.d useradd
 
-- 
2.47.1


--===============3617271781366992177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/seatd: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-dbg: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd/seatd-dbg: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-dbg: PKGSIZE changed from 340312 to 342664 (+1%)
packages/x86-64-v3-poky-linux/seatd/seatd-dev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd/seatd-dev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-doc: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd/seatd-doc: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-locale: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd/seatd-locale: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-src: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd/seatd-src: FILELIST: directory renamed /usr/src/debug/seatd/0.9.1/libseat -> /usr/src/debug/seatd/0.9.2/libseat, directory renamed /usr/src/debug/seatd/0.9.1/libseat/backend -> /usr/src/debug/seatd/0.9.2/libseat/backend, directory renamed /usr/src/debug/seatd/0.9.1/common -> /usr/src/debug/seatd/0.9.2/common, directory renamed /usr/src/debug/seatd/0.9.1/seatd-launch -> /usr/src/debug/seatd/0.9.2/seatd-launch, directory renamed /usr/src/debug/seatd/0.9.1/seatd -> /usr/src/debug/seatd/0.9.2/seatd, directory renamed /usr/src/debug/seatd/0.9.1/include -> /usr/src/debug/seatd/0.9.2/include
packages/x86-64-v3-poky-linux/seatd/seatd-src: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd-src: PKGSIZE changed from 138413 to 138672 (+0%)
packages/x86-64-v3-poky-linux/seatd/seatd-staticdev: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd/seatd-staticdev: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd: PV changed from "0.9.1" to "0.9.2"
packages/x86-64-v3-poky-linux/seatd/seatd: PKGV changed from 0.9.1 [default] to 0.9.2 [default]
packages/x86-64-v3-poky-linux/seatd/seatd: PKGSIZE changed from 135415 to 135647 (+0%)

--===============3617271781366992177==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-seatd-upgrade-0.9.1-0.9.2.patch"

RnJvbSBiM2QyZTI3NDFkYjBiNzE0Yzc3MDhlZGEzZjI3NmIwZDUyNGQxOTgzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjA6MjA6MTkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
ZWF0ZDogdXBncmFkZSAwLjkuMSAtPiAwLjkuMgoKLS0tCiBtZXRhL3JlY2lwZXMtY29yZS9zZWF0
ZC97c2VhdGRfMC45LjEuYmIgPT4gc2VhdGRfMC45LjIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWNv
cmUvc2VhdGQve3NlYXRkXzAuOS4xLmJiID0+IHNlYXRkXzAuOS4yLmJifSAoOTclKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4xLmJiIGIvbWV0YS9yZWNp
cGVzLWNvcmUvc2VhdGQvc2VhdGRfMC45LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5NyUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc2VhdGQvc2VhdGRfMC45LjEuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4yLmJiCmluZGV4IDNiZTI3ZGRhOWQuLjll
MWI1MGMwODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4x
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3NlYXRkL3NlYXRkXzAuOS4yLmJiCkBAIC04LDcg
KzgsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT03MTVhOTlkMmRk
NTUyZTYxODhlNzRkNGVkMjkxNGQ1YSIKIAogU1JDX1VSSSA9ICJnaXQ6Ly9naXQuc3IuaHQvfmtl
bm55bGV2aW5zZW4vc2VhdGQ7cHJvdG9jb2w9aHR0cHM7YnJhbmNoPW1hc3RlciBcCiAgICAgICAg
ICAgIGZpbGU6Ly9pbml0IgotU1JDUkVWID0gIjU2NmZmZWIwMzJhZjQyODY1ZGMxMjEwZTQ4Y2Vj
MDgzNjgwNTliYjkiCitTUkNSRVYgPSAiYTNjNTZjMzI0YzNhODQ0NzRjYzE2MTVkOTRjY2Q2YTYy
NTVkMGMxMCIKIAogaW5oZXJpdCBtZXNvbiBwa2djb25maWcgc3lzdGVtZCB1cGRhdGUtcmMuZCB1
c2VyYWRkCiAKLS0gCjIuNDcuMQoK

--===============3617271781366992177==--

