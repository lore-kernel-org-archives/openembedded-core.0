Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC6D8CC6B39
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 05:44:18 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32824.1792043050009188346
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 22:44:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ePn12QJu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Cwce2qOn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a13e16e04b-a86e13f1-9438-41c2-bd71-be988d94243f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792043049;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=tIH4Fxske0NptiBWC2J82O+jIy1IY+wC2SUL75dLoLc=;
	b=ePn12QJuaZMz+PTvPXAoozAOfaViRvwmZKkrcTzgDkEj7xufvGg0XJEIm6ZYr5dA
	gu3I4t4nPdkGWbhOKKylxOsySTauKRDgslZUHau7rgQmNy43Nkltn93K7rZWj0b84rc
	UboSz9v/MFpy05V28FAN8Sf/9WJwyTlWKYgS9vz0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792043049;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=tIH4Fxske0NptiBWC2J82O+jIy1IY+wC2SUL75dLoLc=;
	b=Cwce2qOnr7egeuXuJkSXo8tXxVTvPyhjl2KqrQWs3HaCJQq2NKuSN/sbdvrhzCBr
	3n6qxICh4vZvVc1exS6WeJLO/EaqGVHWXsmWg+oqQVzJzK7RFZbHslib77ybGcbK3oP
	sBToFVqgGkle9lRjWmK+iw7MtwGUWJQkcePVpQGI=
Content-Type: multipart/mixed; boundary="===============7790155089721067505=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.69 SUCCEEDED
Message-ID: <010101a13e16e04b-a86e13f1-9438-41c2-bd71-be988d94243f-000000@us-west-2.amazonses.com>
Date: Thu, 15 Oct 2026 05:44:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.15-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 05:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247859

--===============7790155089721067505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.69* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.68.1-2.69.patch
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
From 61ab532745f88df184b61c7b3d9996a33cdb625d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Oct 2026 05:37:31 +0000
Subject: [PATCH] repo: upgrade 2.68.1 -> 2.69

git_config: Fix bugs in processing RepoConfig.
sync: Add GetApprovedManifestV2 with named request options
repo: tolerate a transiently missing stable branch
sync: keep smart sync override with -l
sync: skip clone.bundle when repo.fetchcmd is configured
project: peel annotated tags in GetRevisionId with cached refs
sync: don't run git ls-remote before fetchcmd on unpinned refs
agents: enable generic multi-perspective code review agent
sync: keep --superproject-revision across manifest reloads
sync: roll back repo when stable is rewound
sync: Support SYNC_BRANCH to override the smart sync branch
sync: don't let --nmu affect smart sync
vpython: update to uv spec format
sync: Support manifest-driven default smart sync
gc: add --keep-manifest-projects
sync: record superproject sync analysis state again
isort: print diff on failures
sync: keep local sync state paths relative to repo root
init: don't suggest --no-use-superproject on failure
Revert "sync: Recommend using --no-use-superproject if sync fails."
---
 meta/recipes-devtools/repo/{repo_2.68.1.bb => repo_2.69.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.68.1.bb => repo_2.69.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.68.1.bb b/meta/recipes-devtools/repo/repo_2.69.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.68.1.bb
rename to meta/recipes-devtools/repo/repo_2.69.bb
index 053f1cabcf..c98534ca44 100644
--- a/meta/recipes-devtools/repo/repo_2.68.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.69.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "e1e215a14ea5373419acb8753b6865de19d1f122"
+SRCREV = "a0bc2b14a30bef631b91a2ca37c5254d9af44718"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============7790155089721067505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

git_config: Fix bugs in processing RepoConfig.
sync: Add GetApprovedManifestV2 with named request options
repo: tolerate a transiently missing stable branch
sync: keep smart sync override with -l
sync: skip clone.bundle when repo.fetchcmd is configured
project: peel annotated tags in GetRevisionId with cached refs
sync: don't run git ls-remote before fetchcmd on unpinned refs
agents: enable generic multi-perspective code review agent
sync: keep --superproject-revision across manifest reloads
sync: roll back repo when stable is rewound
sync: Support SYNC_BRANCH to override the smart sync branch
sync: don't let --nmu affect smart sync
vpython: update to uv spec format
sync: Support manifest-driven default smart sync
gc: add --keep-manifest-projects
sync: record superproject sync analysis state again
isort: print diff on failures
sync: keep local sync state paths relative to repo root
init: don't suggest --no-use-superproject on failure
Revert "sync: Recommend using --no-use-superproject if sync fails."

--===============7790155089721067505==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.68.1-2.69.patch"

RnJvbSA2MWFiNTMyNzQ1Zjg4ZGYxODRiNjFjN2IzZDk5OTZhMzNjZGI2MjVkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgT2N0IDIwMjYgMDU6Mzc6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjguMSAtPiAyLjY5CgpnaXRfY29uZmlnOiBGaXggYnVncyBpbiBwcm9j
ZXNzaW5nIFJlcG9Db25maWcuCnN5bmM6IEFkZCBHZXRBcHByb3ZlZE1hbmlmZXN0VjIgd2l0aCBu
YW1lZCByZXF1ZXN0IG9wdGlvbnMKcmVwbzogdG9sZXJhdGUgYSB0cmFuc2llbnRseSBtaXNzaW5n
IHN0YWJsZSBicmFuY2gKc3luYzoga2VlcCBzbWFydCBzeW5jIG92ZXJyaWRlIHdpdGggLWwKc3lu
Yzogc2tpcCBjbG9uZS5idW5kbGUgd2hlbiByZXBvLmZldGNoY21kIGlzIGNvbmZpZ3VyZWQKcHJv
amVjdDogcGVlbCBhbm5vdGF0ZWQgdGFncyBpbiBHZXRSZXZpc2lvbklkIHdpdGggY2FjaGVkIHJl
ZnMKc3luYzogZG9uJ3QgcnVuIGdpdCBscy1yZW1vdGUgYmVmb3JlIGZldGNoY21kIG9uIHVucGlu
bmVkIHJlZnMKYWdlbnRzOiBlbmFibGUgZ2VuZXJpYyBtdWx0aS1wZXJzcGVjdGl2ZSBjb2RlIHJl
dmlldyBhZ2VudApzeW5jOiBrZWVwIC0tc3VwZXJwcm9qZWN0LXJldmlzaW9uIGFjcm9zcyBtYW5p
ZmVzdCByZWxvYWRzCnN5bmM6IHJvbGwgYmFjayByZXBvIHdoZW4gc3RhYmxlIGlzIHJld291bmQK
c3luYzogU3VwcG9ydCBTWU5DX0JSQU5DSCB0byBvdmVycmlkZSB0aGUgc21hcnQgc3luYyBicmFu
Y2gKc3luYzogZG9uJ3QgbGV0IC0tbm11IGFmZmVjdCBzbWFydCBzeW5jCnZweXRob246IHVwZGF0
ZSB0byB1diBzcGVjIGZvcm1hdApzeW5jOiBTdXBwb3J0IG1hbmlmZXN0LWRyaXZlbiBkZWZhdWx0
IHNtYXJ0IHN5bmMKZ2M6IGFkZCAtLWtlZXAtbWFuaWZlc3QtcHJvamVjdHMKc3luYzogcmVjb3Jk
IHN1cGVycHJvamVjdCBzeW5jIGFuYWx5c2lzIHN0YXRlIGFnYWluCmlzb3J0OiBwcmludCBkaWZm
IG9uIGZhaWx1cmVzCnN5bmM6IGtlZXAgbG9jYWwgc3luYyBzdGF0ZSBwYXRocyByZWxhdGl2ZSB0
byByZXBvIHJvb3QKaW5pdDogZG9uJ3Qgc3VnZ2VzdCAtLW5vLXVzZS1zdXBlcnByb2plY3Qgb24g
ZmFpbHVyZQpSZXZlcnQgInN5bmM6IFJlY29tbWVuZCB1c2luZyAtLW5vLXVzZS1zdXBlcnByb2pl
Y3QgaWYgc3luYyBmYWlscy4iCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8ve3JlcG9f
Mi42OC4xLmJiID0+IHJlcG9fMi42OS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVw
by97cmVwb18yLjY4LjEuYmIgPT4gcmVwb18yLjY5LmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OC4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3JlcG8vcmVwb18yLjY5LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OC4xLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjkuYmIKaW5kZXggMDUzZjFjYWJjZi4uYzk4
NTM0Y2E0NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY4
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY5LmJiCkBAIC0x
MSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNl
Zjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5n
b29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0
YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImUxZTIxNWExNGVhNTM3MzQxOWFj
Yjg3NTNiNjg2NWRlMTlkMWYxMjIiCitTUkNSRVYgPSAiYTBiYzJiMTRhMzBiZWY2MzFiOTFhMmNh
MzdjNTI1NGQ5YWY0NDcxOCIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJj
ZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQt
cmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============7790155089721067505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.68.1" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.69"
packages/x86-64-v3-poky-linux/repo: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.68.1 [default] to 2.69 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.68.1 [default] to 2.69 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.68.1 [default] to 2.69 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.68.1 [default] to 2.69 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.68.1 [default] to 2.69 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.68.1 [default] to 2.69 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.68.1 [default] to 2.69 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.68.1" to "2.69"
packages/x86-64-v3-poky-linux/repo/repo: PKGSIZE changed from 45914 to 47370 (+3%)
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.68.1 [default] to 2.69 [default]

--===============7790155089721067505==--

