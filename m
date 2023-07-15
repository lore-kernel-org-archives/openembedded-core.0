Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545C8C3DA41
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5955.1689456455685763020
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=aKO6XZtH;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101895b73ad9a-b5043efa-6bfb-4376-8e28-d13028e41d37-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fRxYdFNVYxKsI80KTuXkzYCahdrAFAPsfPK7Cvg1ldg=;
	b=aKO6XZtHvv3061PMaQtukhg5m7ngv0xChIru9ibw0PXD5gu6QYaf8lANEjmJ38OF
	qI0xgoUnj30ImmbAunbiVBzRR4ShD/hYDDvZPdfJ38aT7ZZtYjO5+R4WpPaqvnXRV/0
	Wdh42k3F4HX9rUCNKknVZspkJnFGi1kNvA8j3Fpw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fRxYdFNVYxKsI80KTuXkzYCahdrAFAPsfPK7Cvg1ldg=;
	b=O1nBmKTQgxrwSPDf++1Zv6lnpbU9u0VdJT2wconChjcBblGfW4qVoTsMuF34tzgG
	AgR1JOwbxmwUDjAAAVZmUqgDE3aS/ouFLjRLNHJQhbshy1q9eLP0Ux8D5atQIs3q/fb
	BatNXmmmGuPL6o88+cWWws7Sp4+j0TtY2VRQswwE=
Content-Type: multipart/mixed; boundary="===============4807441081958184681=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.24 SUCCEEDED
Message-ID: <010101895b73ad9a-b5043efa-6bfb-4376-8e28-d13028e41d37-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184371

--===============4807441081958184681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *msmtp* to *1.8.24* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.23-1.8.24.patch
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
From 7d38bfa4080dd1a52afedef61390748fbaedd863 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 15:31:55 +0000
Subject: [PATCH] msmtp: upgrade 1.8.23 -> 1.8.24

---
 .../recipes-extended/msmtp/{msmtp_1.8.23.bb => msmtp_1.8.24.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.23.bb => msmtp_1.8.24.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.23.bb b/meta/recipes-extended/msmtp/msmtp_1.8.24.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.23.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.24.bb
index 5e68a7ea92..b8c867161b 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.23.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.24.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "cf04c16b099b3d414db4b5b93fc5ed9d46aad564c81a352aa107a33964c356b8"
+SRC_URI[sha256sum] = "bd6644b1aaab17d61b86647993e3efad860b23c54283b00ddc579c1f5110aa59"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.39.2


--===============4807441081958184681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/msmtp: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.23.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.24.tar.xz"
packages/core2-32-poky-linux/msmtp: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ru"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 349028 to 349272 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 114647 to 114861 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sv: PKGSIZE changed from 32593 to 35142 (+8%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 512894 to 514085 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp: PKGV changed from 1.8.23 [default] to 1.8.24 [default]

--===============4807441081958184681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ru"

--===============4807441081958184681==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.23-1.8.24.patch"

RnJvbSA3ZDM4YmZhNDA4MGRkMWE1MmFmZWRlZjYxMzkwNzQ4ZmJhZWRkODYzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTU6MzE6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBt
c210cDogdXBncmFkZSAxLjguMjMgLT4gMS44LjI0CgotLS0KIC4uLi9yZWNpcGVzLWV4dGVuZGVk
L21zbXRwL3ttc210cF8xLjguMjMuYmIgPT4gbXNtdHBfMS44LjI0LmJifSB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVj
aXBlcy1leHRlbmRlZC9tc210cC97bXNtdHBfMS44LjIzLmJiID0+IG1zbXRwXzEuOC4yNC5iYn0g
KDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44
LjIzLmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yNC5iYgpzaW1p
bGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAv
bXNtdHBfMS44LjIzLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNt
dHBfMS44LjI0LmJiCmluZGV4IDVlNjhhN2VhOTIuLmI4Yzg2NzE2MWIgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjguMjMuYmIKKysrIGIvbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yNC5iYgpAQCAtMTEsNyArMTEsNyBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1kMzIyMzliY2I2NzM0NjNhYjg3NGU4
MGQ0N2ZhZTUwNCIKIFVQU1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS9tc210
cC9kb3dubG9hZC8iCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9tYXJsYW0uZGUvJHtCUE59L3JlbGVh
c2VzLyR7QlB9LnRhci54eiIKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJjZjA0YzE2YjA5OWIzZDQx
NGRiNGI1YjkzZmM1ZWQ5ZDQ2YWFkNTY0YzgxYTM1MmFhMTA3YTMzOTY0YzM1NmI4IgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImJkNjY0NGIxYWFhYjE3ZDYxYjg2NjQ3OTkzZTNlZmFkODYwYjIzYzU0
MjgzYjAwZGRjNTc5YzFmNTExMGFhNTkiCiAKIGluaGVyaXQgZ2V0dGV4dCBhdXRvdG9vbHMgdXBk
YXRlLWFsdGVybmF0aXZlcyBwa2djb25maWcKIAotLSAKMi4zOS4yCgo=

--===============4807441081958184681==--

