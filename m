Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40C4EC7EE3A
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:46 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.27777.1748786131307060688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GekrOnNs;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=LX5Lm62T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101972bc6e3fc-bb67e3a3-7324-4f12-a926-b2a33bb64727-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=UXzno8Jlw9hXdAMAxakF1Ip0zEY7gYpFb9KgdebG4dg=;
	b=GekrOnNs23R59a2fKL/aWj0iKgczSvBZmnXaNUUeg/7SH5/lvI6xb9+JPrYPBi/h
	04S+e55c+ONj3LMDROpvA1TOjpjk/NPWvtxBfi5sAS7/m9DSJ8+fGn/V2muh04/svSG
	iH6pXNDmRpNjAjomcX/zFMTUInNa1gx/RjhenYMw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786144;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=UXzno8Jlw9hXdAMAxakF1Ip0zEY7gYpFb9KgdebG4dg=;
	b=LX5Lm62TKqKcYafcmBbqV7J4EKaYbsZdTQOBHIHcxwiAaH5cXIOGhsnBATXvCBuy
	qmQJCRNPz/I84EtZSdLYojFf3L0y23i3ceO9a5TBSQ2ToeNkNqMvx/b3ItT1cVh3In2
	bmr/ReV6StywIrZUKKXu/uPHRHpSyHCi8UzhVvh0=
Content-Type: multipart/mixed; boundary="===============4482980348039430642=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] msmtp: upgrading to 1.8.29 SUCCEEDED
Message-ID: <010101972bc6e3fc-bb67e3a3-7324-4f12-a926-b2a33bb64727-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:44 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217633

--===============4482980348039430642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *msmtp* to *1.8.29* has Succeeded.

Next steps:
    - apply the patch: git am 0001-msmtp-upgrade-1.8.28-1.8.29.patch
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
From 94bccd4f707fd5d4aced1f2e50d43abf3689e180 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 11:18:13 +0000
Subject: [PATCH] msmtp: upgrade 1.8.28 -> 1.8.29

---
 .../recipes-extended/msmtp/{msmtp_1.8.28.bb => msmtp_1.8.29.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.8.28.bb => msmtp_1.8.29.bb} (91%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.8.28.bb b/meta/recipes-extended/msmtp/msmtp_1.8.29.bb
similarity index 91%
rename from meta/recipes-extended/msmtp/msmtp_1.8.28.bb
rename to meta/recipes-extended/msmtp/msmtp_1.8.29.bb
index 48c597de24..40b0b3ab73 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.8.28.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.8.29.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 UPSTREAM_CHECK_URI = "https://marlam.de/msmtp/download/"
 
 SRC_URI = "https://marlam.de/${BPN}/releases/${BP}.tar.xz"
-SRC_URI[sha256sum] = "3a57f155f54e4860f7dd42138d9bea1af615b99dfab5ab4cd728fc8c09a647a4"
+SRC_URI[sha256sum] = "13a78f3c6034b33008a7f2474fdddd0deaf7db6da89d0791d3d75eae721220d7"
 
 inherit gettext autotools update-alternatives pkgconfig
 
-- 
2.47.1


--===============4482980348039430642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/msmtp: SRC_URI changed from "https://marlam.de/msmtp/releases/msmtp-1.8.28.tar.xz" to "https://marlam.de/msmtp/releases/msmtp-1.8.29.tar.xz"
packages/core2-64-poky-linux/msmtp: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp: PACKAGES: added "msmtp-locale-zh-cn"
packages/core2-64-poky-linux/msmtp: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGSIZE changed from 501592 to 502584 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dbg: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-dev: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-dev: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGSIZE changed from 116972 to 117983 (+1%)
packages/core2-64-poky-linux/msmtp/msmtp-doc: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-doc: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGSIZE changed from 36941 to 36741 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-de: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGSIZE changed from 34965 to 34739 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-eo: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-es: PKGSIZE changed from 36761 to 36559 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-es: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-es: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PKGSIZE changed from 37679 to 37464 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-fr: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PKGSIZE changed from 36085 to 37341 (+3%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-pt-br: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PKGSIZE changed from 38268 to 38052 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ro: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGSIZE changed from 45260 to 45091 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ru: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGSIZE changed from 45662 to 45396 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sr: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGSIZE changed from 35276 to 35025 (-1%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-sv: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-ta: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGSIZE changed from 47494 to 47298 (-0%)
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-locale-uk: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-src: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-src: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp-staticdev: PV changed from "1.8.28" to "1.8.29"
packages/core2-64-poky-linux/msmtp/msmtp: PKGSIZE changed from 186448 to 186480 (+0%)
packages/core2-64-poky-linux/msmtp/msmtp: PKGV changed from 1.8.28 [default] to 1.8.29 [default]
packages/core2-64-poky-linux/msmtp/msmtp: PV changed from "1.8.28" to "1.8.29"

--===============4482980348039430642==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-msmtp-upgrade-1.8.28-1.8.29.patch"

RnJvbSA5NGJjY2Q0ZjcwN2ZkNWQ0YWNlZDFmMmU1MGQ0M2FiZjM2ODllMTgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAxMToxODoxMyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1z
bXRwOiB1cGdyYWRlIDEuOC4yOCAtPiAxLjguMjkKCi0tLQogLi4uL3JlY2lwZXMtZXh0ZW5kZWQv
bXNtdHAve21zbXRwXzEuOC4yOC5iYiA9PiBtc210cF8xLjguMjkuYmJ9IHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWV4dGVuZGVkL21zbXRwL3ttc210cF8xLjguMjguYmIgPT4gbXNtdHBfMS44LjI5LmJifSAo
OTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210cF8xLjgu
MjguYmIgYi9tZXRhL3JlY2lwZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI5LmJiCnNpbWls
YXJpdHkgaW5kZXggOTElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9t
c210cF8xLjguMjguYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9tc210cC9tc210
cF8xLjguMjkuYmIKaW5kZXggNDhjNTk3ZGUyNC4uNDBiMGIzYWI3MyAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWV4dGVuZGVkL21zbXRwL21zbXRwXzEuOC4yOC5iYgorKysgYi9tZXRhL3JlY2lw
ZXMtZXh0ZW5kZWQvbXNtdHAvbXNtdHBfMS44LjI5LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19G
SUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWQzMjIzOWJjYjY3MzQ2M2FiODc0ZTgw
ZDQ3ZmFlNTA0IgogVVBTVFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vbWFybGFtLmRlL21zbXRw
L2Rvd25sb2FkLyIKIAogU1JDX1VSSSA9ICJodHRwczovL21hcmxhbS5kZS8ke0JQTn0vcmVsZWFz
ZXMvJHtCUH0udGFyLnh6IgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjNhNTdmMTU1ZjU0ZTQ4NjBm
N2RkNDIxMzhkOWJlYTFhZjYxNWI5OWRmYWI1YWI0Y2Q3MjhmYzhjMDlhNjQ3YTQiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMTNhNzhmM2M2MDM0YjMzMDA4YTdmMjQ3NGZkZGRkMGRlYWY3ZGI2ZGE4
OWQwNzkxZDNkNzVlYWU3MjEyMjBkNyIKIAogaW5oZXJpdCBnZXR0ZXh0IGF1dG90b29scyB1cGRh
dGUtYWx0ZXJuYXRpdmVzIHBrZ2NvbmZpZwogCi0tIAoyLjQ3LjEKCg==

--===============4482980348039430642==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/msmtp: PACKAGES: added "msmtp-locale-zh-cn"

--===============4482980348039430642==--

