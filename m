Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F1FDE6527D
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29202.1769951582401661861
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:13:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=F+UsqzZe;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=YkQcOku2;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019c1955d616-54f24a4c-ef3d-45de-a3fb-84d2c88e406b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RgNZT8+X7rEvyW/UPORUuqtCCu8Sqn2DemIroSJxqTM=;
	b=F+UsqzZe26XM89dscLqDeq39AwJJsaPtpV7eCcaLdaHLM8mM6mg2PbADKoQ8ryUX
	x/oDI92L01hJGnJn6k2H5mNXyK1MUFUYjF6Cs3Vr/tw1VlHIuVY2SMCfAnRYTa5h1pk
	tSkR7dLUbVQ1E02I66Np0nhyw/mRf4kOnRY/Dniw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951581;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RgNZT8+X7rEvyW/UPORUuqtCCu8Sqn2DemIroSJxqTM=;
	b=YkQcOku2ES7gmupdUyw4wWZDDXKKR8qsfw7ZEl+VIaEXU62J2PIbSQNDuRETfW7U
	fyGQadVcX/c1hYseu8mcKWXVkMsSuPec+Hq/B4mrKRNBOcRTKldvoV//3HNfIlOKXJR
	2gHkTKOR9K2U6yAxnH9P4mGm0bL28/nL2w34YVFA=
Content-Type: multipart/mixed; boundary="===============4417566994945860241=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Wang Mingyu <wangmy@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] liburcu: upgrading to 0.15.6 SUCCEEDED
Message-ID: <0101019c1955d616-54f24a4c-ef3d-45de-a3fb-84d2c88e406b-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:13:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230333

--===============4417566994945860241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *liburcu* to *0.15.6* has Succeeded.

Next steps:
    - apply the patch: git am 0001-liburcu-upgrade-0.15.5-0.15.6.patch
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
From 3b58eab1ba010832703e3c58d9f23ae838cf18cf Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 13:07:21 +0000
Subject: [PATCH] liburcu: upgrade 0.15.5 -> 0.15.6

---
 .../liburcu/{liburcu_0.15.5.bb => liburcu_0.15.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.5.bb => liburcu_0.15.6.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.5.bb b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.5.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.6.bb
index 94124c6391..1cb349f55d 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.5.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.6.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "b2f787a8a83512c32599e71cdabcc5131464947b82014896bd11413b2d782de1"
+SRC_URI[sha256sum] = "850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f"
 
 S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header
-- 
2.47.1


--===============4417566994945860241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/liburcu: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu: SRC_URI changed from "http://lttng.org/files/urcu/userspace-rcu-0.15.5.tar.bz2" to "http://lttng.org/files/urcu/userspace-rcu-0.15.6.tar.bz2"
packages/x86-64-v3-poky-linux/liburcu: PKGV changed from 0.15.5 [default] to 0.15.6 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGV changed from 0.15.5 [default] to 0.15.6 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dbg: PKGSIZE changed from 896680 to 898400 (+0%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGV changed from 0.15.5 [default] to 0.15.6 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-dev: PKGSIZE changed from 365006 to 365958 (+0%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu/liburcu-doc: PKGV changed from 0.15.5 [default] to 0.15.6 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu/liburcu-locale: PKGV changed from 0.15.5 [default] to 0.15.6 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PKGV changed from 0.15.5 [default] to 0.15.6 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: FILELIST: directory renamed /usr/src/debug/liburcu/0.15.5/include/urcu -> /usr/src/debug/liburcu/0.15.6/include/urcu, directory renamed /usr/src/debug/liburcu/0.15.5/include/urcu/uatomic -> /usr/src/debug/liburcu/0.15.6/include/urcu/uatomic, directory renamed /usr/src/debug/liburcu/0.15.5/src -> /usr/src/debug/liburcu/0.15.6/src, directory renamed /usr/src/debug/liburcu/0.15.5/include/urcu/static -> /usr/src/debug/liburcu/0.15.6/include/urcu/static
packages/x86-64-v3-poky-linux/liburcu/liburcu-src: PKGSIZE changed from 427707 to 428659 (+0%)
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu/liburcu-staticdev: PKGV changed from 0.15.5 [default] to 0.15.6 [default]
packages/x86-64-v3-poky-linux/liburcu/liburcu: PV changed from "0.15.5" to "0.15.6"
packages/x86-64-v3-poky-linux/liburcu/liburcu: PKGV changed from 0.15.5 [default] to 0.15.6 [default]

--===============4417566994945860241==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-liburcu-upgrade-0.15.5-0.15.6.patch"

RnJvbSAzYjU4ZWFiMWJhMDEwODMyNzAzZTNjNThkOWYyM2FlODM4Y2YxOGNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMzowNzoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnVyY3U6IHVwZ3JhZGUgMC4xNS41IC0+IDAuMTUuNgoKLS0tCiAuLi4vbGlidXJjdS97bGlidXJj
dV8wLjE1LjUuYmIgPT4gbGlidXJjdV8wLjE1LjYuYmJ9ICAgICAgICAgICAgfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtc3VwcG9ydC9saWJ1cmN1L3tsaWJ1cmN1XzAuMTUuNS5iYiA9PiBsaWJ1cmN1XzAuMTUu
Ni5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtc3VwcG9ydC9saWJ1cmN1L2xp
YnVyY3VfMC4xNS41LmJiIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAu
MTUuNi5iYgpzaW1pbGFyaXR5IGluZGV4IDkxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ1cmN1L2xpYnVyY3VfMC4xNS41LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtc3Vw
cG9ydC9saWJ1cmN1L2xpYnVyY3VfMC4xNS42LmJiCmluZGV4IDk0MTI0YzYzOTEuLjFjYjM0OWY1
NWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1zdXBwb3J0L2xpYnVyY3UvbGlidXJjdV8wLjE1
LjUuYmIKKysrIGIvbWV0YS9yZWNpcGVzLXN1cHBvcnQvbGlidXJjdS9saWJ1cmN1XzAuMTUuNi5i
YgpAQCAtMTMsNyArMTMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1k
O21kNT1jMmE5MjQ5OGI2ZTg4ZTI3NmY5ODY4Nzc5OTU0MjViOCBcCiAKIFNSQ19VUkkgPSAiaHR0
cDovL2x0dG5nLm9yZy9maWxlcy91cmN1L3VzZXJzcGFjZS1yY3UtJHtQVn0udGFyLmJ6MiIKIAot
U1JDX1VSSVtzaGEyNTZzdW1dID0gImIyZjc4N2E4YTgzNTEyYzMyNTk5ZTcxY2RhYmNjNTEzMTQ2
NDk0N2I4MjAxNDg5NmJkMTE0MTNiMmQ3ODJkZTEiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODUw
YjE5MjA5NmViMTFlYmYyYzcwZThmOTdiYzdkYTc0NzllZTQxZGExYmViZWI0NGUzOTg2OTA4YmFj
NDE0ZiIKIAogUyA9ICIke1VOUEFDS0RJUn0vdXNlcnNwYWNlLXJjdS0ke1BWfSIKIGluaGVyaXQg
YXV0b3Rvb2xzIG11bHRpbGliX2hlYWRlcgotLSAKMi40Ny4xCgo=

--===============4417566994945860241==--

