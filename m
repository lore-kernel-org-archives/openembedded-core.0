Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C575C10F00
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.129527.1692086043309543990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HR3XOi8H;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=CCGsmNdn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 01010189f830071e-737cb522-ead4-42a9-bfe0-53dcedd5ed0f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086044;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=6nCWlTX6MXcrhdJaVIZNF1FjYL1BQYkloEYzUh4NfAE=;
	b=HR3XOi8H79e6hjZiKk3cbPqh/NejBQ7168wQLYQLQ1B5yu2CipOFu5H9znx+ZYeg
	LJrtbGSDbAa/7p5E3lXSzGhHC14fRrn/t8o0M4VdwD/2rvRUj2lmhhemzvWL+MwH3tH
	A6yI5wvaX8eRSAQgG3xY+YrHcmYRNTTLjh2ckjj0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086044;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=6nCWlTX6MXcrhdJaVIZNF1FjYL1BQYkloEYzUh4NfAE=;
	b=CCGsmNdnYdcZsRYi/tdkN06kioz4IqOPamrdgyDZZOdh4u4Nntjt5tsaeU4+b5za
	NVsRuduZSNZw657n1y/epogP/IWQZhZq+/gmcDG+79dYeG8GKjhCPz0vQycoN3sWxE8
	RuhedYlECeiC0luH1wIYjYQGTyo8gMoj+BUzteHA=
Content-Type: multipart/mixed; boundary="===============7721624215037370716=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libsndfile1: upgrading to 1.2.2 SUCCEEDED
Message-ID: <01010189f830071e-737cb522-ead4-42a9-bfe0-53dcedd5ed0f-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:04 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186038

--===============7721624215037370716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libsndfile1* to *1.2.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libsndfile1-upgrade-1.2.0-1.2.2.patch
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
From 300d8d87732f5de5a65fa0bff197019cdacff74d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Aug 2023 07:47:38 +0000
Subject: [PATCH] libsndfile1: upgrade 1.2.0 -> 1.2.2

---
 .../libsndfile/{libsndfile1_1.2.0.bb => libsndfile1_1.2.2.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libsndfile/{libsndfile1_1.2.0.bb => libsndfile1_1.2.2.bb} (92%)

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
similarity index 92%
rename from meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
rename to meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
index 58eea0baf9..9c1f601aab 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb
@@ -12,7 +12,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libsndfile-${PV}.tar.xz \
           "
 GITHUB_BASE_URI = "https://github.com/libsndfile/libsndfile/releases/"
 
-SRC_URI[sha256sum] = "0e30e7072f83dc84863e2e55f299175c7e04a5902ae79cfb99d4249ee8f6d60a"
+SRC_URI[sha256sum] = "3799ca9924d3125038880367bf1468e53a1b7e3686a934f098b7e1d286cdb80e"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=e77fe93202736b47c07035910f47974a"
 
-- 
2.39.2


--===============7721624215037370716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libsndfile1: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1: SRC_URI changed from "https://github.com/libsndfile/libsndfile/releases//download/1.2.0/libsndfile-1.2.0.tar.xz file://noopus.patch" to "https://github.com/libsndfile/libsndfile/releases//download/1.2.2/libsndfile-1.2.2.tar.xz file://noopus.patch"
packages/core2-32-poky-linux/libsndfile1: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-bin: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1-bin: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-dbg: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1-dbg: PKGSIZE changed from 2029848 to 2030572 (+0%)
packages/core2-32-poky-linux/libsndfile1/libsndfile1-dbg: FILELIST: removed "/usr/lib/.debug/libsndfile.so.1.0.35", added "/usr/lib/.debug/libsndfile.so.1.0.37"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-dbg: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-dev: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1-dev: PKGSIZE changed from 43225 to 43810 (+1%)
packages/core2-32-poky-linux/libsndfile1/libsndfile1-dev: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-doc: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1-doc: PKGSIZE changed from 189600 to 189836 (+0%)
packages/core2-32-poky-linux/libsndfile1/libsndfile1-doc: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-locale: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1-locale: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-src: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1-src: PKGSIZE changed from 1892417 to 1893613 (+0%)
packages/core2-32-poky-linux/libsndfile1/libsndfile1-src: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1-staticdev: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1-staticdev: PV changed from "1.2.0" to "1.2.2"
packages/core2-32-poky-linux/libsndfile1/libsndfile1: PKGV changed from 1.2.0 [default] to 1.2.2 [default]
packages/core2-32-poky-linux/libsndfile1/libsndfile1: FILELIST: removed "/usr/lib/libsndfile.so.1.0.35", added "/usr/lib/libsndfile.so.1.0.37"
packages/core2-32-poky-linux/libsndfile1/libsndfile1: PV changed from "1.2.0" to "1.2.2"
Changes to packages/core2-32-poky-linux/libsndfile1 (sysroot):
  /usr/lib/libsndfile.so.1 changed symlink target from libsndfile.so.1.0.35 to libsndfile.so.1.0.37
  /usr/lib/libsndfile.so changed symlink target from libsndfile.so.1.0.35 to libsndfile.so.1.0.37
  /usr/lib/libsndfile.so.1.0.35 moved to /usr/lib/libsndfile.so.1.0.37

--===============7721624215037370716==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libsndfile1-upgrade-1.2.0-1.2.2.patch"

RnJvbSAzMDBkOGQ4NzczMmY1ZGU1YTY1ZmEwYmZmMTk3MDE5Y2RhY2ZmNzRkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgQXVnIDIwMjMgMDc6NDc6MzggKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJzbmRmaWxlMTogdXBncmFkZSAxLjIuMCAtPiAxLjIuMgoKLS0tCiAuLi4vbGlic25kZmlsZS97
bGlic25kZmlsZTFfMS4yLjAuYmIgPT4gbGlic25kZmlsZTFfMS4yLjIuYmJ9ICAgfCAyICstCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9saWJzbmRmaWxlL3tsaWJzbmRmaWxlMV8xLjIuMC5iYiA9PiBs
aWJzbmRmaWxlMV8xLjIuMi5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVs
dGltZWRpYS9saWJzbmRmaWxlL2xpYnNuZGZpbGUxXzEuMi4wLmJiIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvbGlic25kZmlsZS9saWJzbmRmaWxlMV8xLjIuMi5iYgpzaW1pbGFyaXR5IGluZGV4
IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJzbmRmaWxlL2xpYnNu
ZGZpbGUxXzEuMi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJzbmRm
aWxlL2xpYnNuZGZpbGUxXzEuMi4yLmJiCmluZGV4IDU4ZWVhMGJhZjkuLjljMWY2MDFhYWIgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2xpYnNuZGZpbGUvbGlic25kZmlsZTFf
MS4yLjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvbGlic25kZmlsZS9saWJzbmRm
aWxlMV8xLjIuMi5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gIiR7R0lUSFVCX0JBU0Vf
VVJJfS9kb3dubG9hZC8ke1BWfS9saWJzbmRmaWxlLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAg
IgogR0lUSFVCX0JBU0VfVVJJID0gImh0dHBzOi8vZ2l0aHViLmNvbS9saWJzbmRmaWxlL2xpYnNu
ZGZpbGUvcmVsZWFzZXMvIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGUzMGU3MDcyZjgzZGM4
NDg2M2UyZTU1ZjI5OTE3NWM3ZTA0YTU5MDJhZTc5Y2ZiOTlkNDI0OWVlOGY2ZDYwYSIKK1NSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzNzk5Y2E5OTI0ZDMxMjUwMzg4ODAzNjdiZjE0NjhlNTNhMWI3ZTM2
ODZhOTM0ZjA5OGI3ZTFkMjg2Y2RiODBlIgogCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9D
T1BZSU5HO21kNT1lNzdmZTkzMjAyNzM2YjQ3YzA3MDM1OTEwZjQ3OTc0YSIKIAotLSAKMi4zOS4y
Cgo=

--===============7721624215037370716==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libsndfile1/libsndfile1: FILELIST: removed "/usr/lib/libsndfile.so.1.0.35", added "/usr/lib/libsndfile.so.1.0.37"
Changes to packages/core2-32-poky-linux/libsndfile1 (sysroot):
  /usr/lib/libsndfile.so.1 changed symlink target from libsndfile.so.1.0.35 to libsndfile.so.1.0.37
  /usr/lib/libsndfile.so changed symlink target from libsndfile.so.1.0.35 to libsndfile.so.1.0.37
  /usr/lib/libsndfile.so.1.0.35 moved to /usr/lib/libsndfile.so.1.0.37

--===============7721624215037370716==--

