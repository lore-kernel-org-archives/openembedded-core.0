Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5423.1792563749980982882
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 23:22:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZYXcIs7O;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=ay2TkC8N;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101a15d2020ac-2a4a567a-7cb9-4811-b34d-b2d8b605d13f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1792563749;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=fiiiAiS33Y1shAk8RADq4uzSFWD5lW4XJM0yuuZK3wc=;
	b=ZYXcIs7OX3pWTsaaDckOA5dIKcppqjHjTCxmplszkyyDLFjExA1Daq+iqZyghzBs
	EFuYWqqgR0TWrE8+MFw5cZeAy7fIHRwlZq3Oie+7NpWum1Ypcbbg/extv9+3O1wV1Us
	U+EIq7wSJyNGYeceuQZsJuVFAIYur+8aE7JlUa6U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1792563749;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=fiiiAiS33Y1shAk8RADq4uzSFWD5lW4XJM0yuuZK3wc=;
	b=ay2TkC8NitaLjohvuUOFGVbEDxc83NSGddcUrmG6QuLeoFOh6pFgmK6ToNgW0Yoj
	av8+R+7+E9yzdIuyV3fnURJ1hxok+xMQp8Eg+56dTK6jCijWVeValaN8kEKfizEwrIF
	dL9/eQL/RHmnGj7HVomcYNEPKor8KDqhLV204nvk=
Content-Type: multipart/mixed; boundary="===============1878061973736325784=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.70 SUCCEEDED
Message-ID: <010101a15d2020ac-2a4a567a-7cb9-4811-b34d-b2d8b605d13f-000000@us-west-2.amazonses.com>
Date: Wed, 21 Oct 2026 06:22:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.21-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248361

--===============1878061973736325784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.70* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.68.1-2.70.patch
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
From 4a762fd37cfc27539543edfab351789ddf1c656a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 21 Oct 2026 06:11:55 +0000
Subject: [PATCH] repo: upgrade 2.68.1 -> 2.70

sync: Provide a CLI command to opt in/out of smartsync for a user.
upload: reject --fix with --ignore-hooks or --no-verify
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
 meta/recipes-devtools/repo/{repo_2.68.1.bb => repo_2.70.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.68.1.bb => repo_2.70.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.68.1.bb b/meta/recipes-devtools/repo/repo_2.70.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.68.1.bb
rename to meta/recipes-devtools/repo/repo_2.70.bb
index 053f1cabcf..6a4e73ef10 100644
--- a/meta/recipes-devtools/repo/repo_2.68.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.70.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "e1e215a14ea5373419acb8753b6865de19d1f122"
+SRCREV = "46e9866ca0f161604bd45a0c3b7c7887c9415dcb"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============1878061973736325784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.68.1" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.70"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.68.1" to "2.70"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.68.1" to "2.70"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.68.1" to "2.70"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.68.1" to "2.70"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.68.1" to "2.70"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.68.1" to "2.70"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.68.1" to "2.70"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.68.1 [default] to 2.70 [default]
packages/x86-64-v3-poky-linux/repo/repo: PKGSIZE changed from 45914 to 47370 (+3%)
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.68.1" to "2.70"

--===============1878061973736325784==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.68.1-2.70.patch"

RnJvbSA0YTc2MmZkMzdjZmMyNzUzOTU0M2VkZmFiMzUxNzg5ZGRmMWM2NTZhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjEgT2N0IDIwMjYgMDY6MTE6NTUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjguMSAtPiAyLjcwCgpzeW5jOiBQcm92aWRlIGEgQ0xJIGNvbW1hbmQg
dG8gb3B0IGluL291dCBvZiBzbWFydHN5bmMgZm9yIGEgdXNlci4KdXBsb2FkOiByZWplY3QgLS1m
aXggd2l0aCAtLWlnbm9yZS1ob29rcyBvciAtLW5vLXZlcmlmeQpnaXRfY29uZmlnOiBGaXggYnVn
cyBpbiBwcm9jZXNzaW5nIFJlcG9Db25maWcuCnN5bmM6IEFkZCBHZXRBcHByb3ZlZE1hbmlmZXN0
VjIgd2l0aCBuYW1lZCByZXF1ZXN0IG9wdGlvbnMKcmVwbzogdG9sZXJhdGUgYSB0cmFuc2llbnRs
eSBtaXNzaW5nIHN0YWJsZSBicmFuY2gKc3luYzoga2VlcCBzbWFydCBzeW5jIG92ZXJyaWRlIHdp
dGggLWwKc3luYzogc2tpcCBjbG9uZS5idW5kbGUgd2hlbiByZXBvLmZldGNoY21kIGlzIGNvbmZp
Z3VyZWQKcHJvamVjdDogcGVlbCBhbm5vdGF0ZWQgdGFncyBpbiBHZXRSZXZpc2lvbklkIHdpdGgg
Y2FjaGVkIHJlZnMKc3luYzogZG9uJ3QgcnVuIGdpdCBscy1yZW1vdGUgYmVmb3JlIGZldGNoY21k
IG9uIHVucGlubmVkIHJlZnMKYWdlbnRzOiBlbmFibGUgZ2VuZXJpYyBtdWx0aS1wZXJzcGVjdGl2
ZSBjb2RlIHJldmlldyBhZ2VudApzeW5jOiBrZWVwIC0tc3VwZXJwcm9qZWN0LXJldmlzaW9uIGFj
cm9zcyBtYW5pZmVzdCByZWxvYWRzCnN5bmM6IHJvbGwgYmFjayByZXBvIHdoZW4gc3RhYmxlIGlz
IHJld291bmQKc3luYzogU3VwcG9ydCBTWU5DX0JSQU5DSCB0byBvdmVycmlkZSB0aGUgc21hcnQg
c3luYyBicmFuY2gKc3luYzogZG9uJ3QgbGV0IC0tbm11IGFmZmVjdCBzbWFydCBzeW5jCnZweXRo
b246IHVwZGF0ZSB0byB1diBzcGVjIGZvcm1hdApzeW5jOiBTdXBwb3J0IG1hbmlmZXN0LWRyaXZl
biBkZWZhdWx0IHNtYXJ0IHN5bmMKZ2M6IGFkZCAtLWtlZXAtbWFuaWZlc3QtcHJvamVjdHMKc3lu
YzogcmVjb3JkIHN1cGVycHJvamVjdCBzeW5jIGFuYWx5c2lzIHN0YXRlIGFnYWluCmlzb3J0OiBw
cmludCBkaWZmIG9uIGZhaWx1cmVzCnN5bmM6IGtlZXAgbG9jYWwgc3luYyBzdGF0ZSBwYXRocyBy
ZWxhdGl2ZSB0byByZXBvIHJvb3QKaW5pdDogZG9uJ3Qgc3VnZ2VzdCAtLW5vLXVzZS1zdXBlcnBy
b2plY3Qgb24gZmFpbHVyZQpSZXZlcnQgInN5bmM6IFJlY29tbWVuZCB1c2luZyAtLW5vLXVzZS1z
dXBlcnByb2plY3QgaWYgc3luYyBmYWlscy4iCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi42OC4xLmJiID0+IHJlcG9fMi43MC5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcmVwby97cmVwb18yLjY4LjEuYmIgPT4gcmVwb18yLjcwLmJifSAoOTQlKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OC4xLmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjcwLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OC4xLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNzAuYmIKaW5kZXggMDUzZjFj
YWJjZi4uNmE0ZTczZWYxMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjY4LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjcw
LmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7
bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDov
L2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFu
Y2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImUxZTIxNWExNGVh
NTM3MzQxOWFjYjg3NTNiNjg2NWRlMTlkMWYxMjIiCitTUkNSRVYgPSAiNDZlOTg2NmNhMGYxNjE2
MDRiZDQ1YTBjM2I3Yzc4ODdjOTQxNWRjYiIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdv
b2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJl
dmlldy9naXQtcmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============1878061973736325784==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

sync: Provide a CLI command to opt in/out of smartsync for a user.
upload: reject --fix with --ignore-hooks or --no-verify
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

--===============1878061973736325784==--
