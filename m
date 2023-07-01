Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C028C27C42
	for <webhook@archiver.kernel.org>; Sat,  1 Jul 2023 16:02:08 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.10506.1688227323727153084
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Jul 2023 09:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=MX6fFDgr;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 0101018912309c71-ba81f508-f433-4037-a980-1c0b873649e3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ced9FaYngKswbcvPiBMll4DR2tyGooz3fZQUmhmlCWo=;
	b=MX6fFDgrF4QNqmSl+C+dFJn7JjwI2N8HkliWinyWRqutLkNLIAQlD4pP3sXyLpXP
	d3A7GkmGkP8aJRwjGjmo4Zi7cUqHzZL7oaKZT+fipmFhf5RC9AWe3wSB0F/hfu3LDfE
	5p7emp2tCqlvb8Z4ScYqAE8vH2Keo3xwJn058nJs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1688227323;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ced9FaYngKswbcvPiBMll4DR2tyGooz3fZQUmhmlCWo=;
	b=GT5S/lbFixb/aV5cZxGxsWytyJ+hUSxEiwA+OG7N5Fz1qaOIaL06lrOJUEdiFxfB
	aIkdpKXEqZmTKlgK+EwG1pxEoSrEezC19g7lUsGOw/UVjh5yURfZHcR88mb02jp++Dh
	9QcqxIZgg598Vrj/snzHyYVVnWl9BCBEgwQVQtQE=
Content-Type: multipart/mixed; boundary="===============4500886637736946765=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.24 SUCCEEDED
Message-ID: <0101018912309c71-ba81f508-f433-4037-a980-1c0b873649e3-000000@us-west-2.amazonses.com>
Date: Sat, 1 Jul 2023 16:02:02 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Jul 2023 16:02:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183738

--===============4500886637736946765==
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
From eff7ececfb3a297a15bf40811106049c336e4def Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Jul 2023 10:42:25 +0000
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


--===============4500886637736946765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ru"

--===============4500886637736946765==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.23-1.8.24.patch"

RnJvbSBlZmY3ZWNlY2ZiM2EyOTdhMTViZjQwODExMTA2MDQ5YzMzNmU0ZGVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBKdWwgMjAyMyAxMDo0MjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
bXRwOiB1cGdyYWRlIDEuOC4yMyAtPiAxLjguMjQKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
bXNtdHAve21zbXRwXzEuOC4yMy5iYiA9PiBtc210cF8xLjguMjQuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL3ttc210cF8xLjguMjMuYmIgPT4gbXNtdHBfMS44LjI0LmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjgu
MjMuYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI0LmJiCnNpbWls
YXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9t
c210cF8xLjguMjMuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210
cF8xLjguMjQuYmIKaW5kZXggNWU2OGE3ZWE5Mi4uYjhjODY3MTYxYiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yMy5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI0LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgw
ZDQ3ZmFlNTA0IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vbWFybGFtLmRlL21zbXRw
L2Rvd25sb2FkLyIKIAogU1JDX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS8ke0JQTn0vcmVsZWFz
ZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gImNmMDRjMTZiMDk5YjNkNDE0
ZGI0YjViOTNmYzVlZDlkNDZhYWQ1NjRjODFhMzUyYWExMDdhMzM5NjRjMzU2YjgiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiYmQ2NjQ0YjFhYWFiMTdkNjFiODY2NDc5OTNlM2VmYWQ4NjBiMjNjNTQy
ODNiMDBkZGM1NzljMWY1MTEwYWE1OSIKIAogaW5oZXJpdCBnZXR0ZXh0IGF1dG90b29scyB1cGRh
dGUtYWx0ZXJuYXRpdmVzIHBrZ2NvbmZpZwogCi0tIAoyLjM5LjIKCg==

--===============4500886637736946765==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/msmtp: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.23.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.24.tar.xz"
packages/core2-32-poky-linux/msmtp: PACKAGES: added "msmtp-locale-ru"
packages/core2-32-poky-linux/msmtp: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 349028 to 349272 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 114647 to 114861 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-sv: PKGSIZE changed from 32593 to 35142 (+8%)
packages/core2-32-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-src: PKGSIZE changed from 512894 to 514085 (+0%)
packages/core2-32-poky-linux/msmtp/msmtp-src: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.23" to "1.8.24"
packages/core2-32-poky-linux/msmtp/msmtp: PKGV changed from 1.8.23 [default] to 1.8.24 [default]
packages/core2-32-poky-linux/msmtp/msmtp: PV changed from "1.8.23" to "1.8.24"

--===============4500886637736946765==--

