Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AE66C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 05:42:35 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5179.1788932547861822213
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Sep 2026 22:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=KGJe9B3e;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=2Zax2ZZZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a084b0603a-147a983b-5bf9-4883-a389-f391136505e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1788932547;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=hbA4tgqxdiSOkoJTFsqOYxCi04oNhEEmlW28jAGe3LE=;
	b=KGJe9B3eWjcmepAxbcJPvRy2U0xChgC3PYhAAfqMByy2/jrP5M2NnT4BkssgE1ix
	b7JdUHb0+gJb859rwoLP732qPUkfWQeZTGtilIOyyZPI4zTF6pUWJTMOjOT4raICmsI
	LrWYuvIjfdIqXBfwlfr0Fn+XX1+Nh8PdS0MZs5KY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1788932547;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=hbA4tgqxdiSOkoJTFsqOYxCi04oNhEEmlW28jAGe3LE=;
	b=2Zax2ZZZa1R+UerW3o2lTf1Zaain6LfhBoXzaIMNGpX4RVZsWX+RI3XcVOy8M7lK
	3kgYLKZLjIQq5ubhSqnlAPit3Oh6IrxviWTDYFA7ekwOnzoyF8SGmhEyQj8Fsplu/Mw
	rkfb6YxqX6BJU1ADB7+5lleb9pdVU7rKBXXzEJ4o=
Content-Type: multipart/mixed; boundary="===============2766084119217058620=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.67 SUCCEEDED
Message-ID: <010101a084b0603a-147a983b-5bf9-4883-a389-f391136505e2-000000@us-west-2.amazonses.com>
Date: Wed, 9 Sep 2026 05:42:26 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.09-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Sep 2026 05:42:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245398

--===============2766084119217058620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.67* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.66.1-2.67.patch
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
From 69081737e11a8c4a455f4ccd040bb7146a2397ac Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 9 Sep 2026 05:25:47 +0000
Subject: [PATCH] repo: upgrade 2.66.1 -> 2.67

d27d682 project: check upstream ref ancestry for non-shallow clones
0ea57e2 project: gate the default-branch query by Git version
ba8ddf3 git_superproject: resolve one negotiation ref directly
d88ce8d upload: reuse the worker current-branch result
5e8d2a6 version: read describe and date in one Git call
e59c9cd cherry_pick: resolve and read commits in one process
83428a9 rebase: delegate automatic stashing to Git
948abc8 git_config: recognize only complete object IDs
c63a2f9 sync: tell apart same-path submanifest projects
0039e39 project: carry current state from the ref snapshot
5f37845 project: reuse ref OIDs in branch maintenance
d27034b project: centralize safe branch and commit resolution
6541729 project: reuse loaded refs when resolving HEAD
b85e76a git_refs: load HEAD with the ref snapshot on Git 2.45
e5bbb5c upload: prune ref scans for untouched projects and specific branches
4fe8761 project: read HEAD directly in-memory to avoid subprocesses
d729942 sync: skip submodules removed from their parent
3f087a8 sync: fetch submodules after their parent repository
3a6e25a sync: check out submodules at the parent's new revision
41c2597 project: don't use dest-branch or tags as SHA-1 upstream fallback
e6ad708 hooks: add --fix option to auto-apply hook fixes
09914bc Add detailed upload context to Trace2 telemetry
3f17756 project: allow re-reading submodule gitlinks
---
 meta/recipes-devtools/repo/{repo_2.66.1.bb => repo_2.67.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.66.1.bb => repo_2.67.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.66.1.bb b/meta/recipes-devtools/repo/repo_2.67.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.66.1.bb
rename to meta/recipes-devtools/repo/repo_2.67.bb
index 32c7a38a94..948a9a775c 100644
--- a/meta/recipes-devtools/repo/repo_2.66.1.bb
+++ b/meta/recipes-devtools/repo/repo_2.67.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "b85886fa9f5b4e2189cc5b2f40bd0a80459d4c77"
+SRCREV = "d27d6829a84f488b7253ea693dcc429076c33914"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============2766084119217058620==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.66.1-2.67.patch"

RnJvbSA2OTA4MTczN2UxMWE4YzRhNDU1ZjRjY2QwNDBiYjcxNDZhMjM5N2FjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgOSBTZXAgMjAyNiAwNToyNTo0NyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi42Ni4xIC0+IDIuNjcKCmQyN2Q2ODIgcHJvamVjdDogY2hlY2sgdXBzdHJl
YW0gcmVmIGFuY2VzdHJ5IGZvciBub24tc2hhbGxvdyBjbG9uZXMKMGVhNTdlMiBwcm9qZWN0OiBn
YXRlIHRoZSBkZWZhdWx0LWJyYW5jaCBxdWVyeSBieSBHaXQgdmVyc2lvbgpiYThkZGYzIGdpdF9z
dXBlcnByb2plY3Q6IHJlc29sdmUgb25lIG5lZ290aWF0aW9uIHJlZiBkaXJlY3RseQpkODhjZThk
IHVwbG9hZDogcmV1c2UgdGhlIHdvcmtlciBjdXJyZW50LWJyYW5jaCByZXN1bHQKNWU4ZDJhNiB2
ZXJzaW9uOiByZWFkIGRlc2NyaWJlIGFuZCBkYXRlIGluIG9uZSBHaXQgY2FsbAplNTljOWNkIGNo
ZXJyeV9waWNrOiByZXNvbHZlIGFuZCByZWFkIGNvbW1pdHMgaW4gb25lIHByb2Nlc3MKODM0Mjhh
OSByZWJhc2U6IGRlbGVnYXRlIGF1dG9tYXRpYyBzdGFzaGluZyB0byBHaXQKOTQ4YWJjOCBnaXRf
Y29uZmlnOiByZWNvZ25pemUgb25seSBjb21wbGV0ZSBvYmplY3QgSURzCmM2M2EyZjkgc3luYzog
dGVsbCBhcGFydCBzYW1lLXBhdGggc3VibWFuaWZlc3QgcHJvamVjdHMKMDAzOWUzOSBwcm9qZWN0
OiBjYXJyeSBjdXJyZW50IHN0YXRlIGZyb20gdGhlIHJlZiBzbmFwc2hvdAo1ZjM3ODQ1IHByb2pl
Y3Q6IHJldXNlIHJlZiBPSURzIGluIGJyYW5jaCBtYWludGVuYW5jZQpkMjcwMzRiIHByb2plY3Q6
IGNlbnRyYWxpemUgc2FmZSBicmFuY2ggYW5kIGNvbW1pdCByZXNvbHV0aW9uCjY1NDE3MjkgcHJv
amVjdDogcmV1c2UgbG9hZGVkIHJlZnMgd2hlbiByZXNvbHZpbmcgSEVBRApiODVlNzZhIGdpdF9y
ZWZzOiBsb2FkIEhFQUQgd2l0aCB0aGUgcmVmIHNuYXBzaG90IG9uIEdpdCAyLjQ1CmU1YmJiNWMg
dXBsb2FkOiBwcnVuZSByZWYgc2NhbnMgZm9yIHVudG91Y2hlZCBwcm9qZWN0cyBhbmQgc3BlY2lm
aWMgYnJhbmNoZXMKNGZlODc2MSBwcm9qZWN0OiByZWFkIEhFQUQgZGlyZWN0bHkgaW4tbWVtb3J5
IHRvIGF2b2lkIHN1YnByb2Nlc3NlcwpkNzI5OTQyIHN5bmM6IHNraXAgc3VibW9kdWxlcyByZW1v
dmVkIGZyb20gdGhlaXIgcGFyZW50CjNmMDg3YTggc3luYzogZmV0Y2ggc3VibW9kdWxlcyBhZnRl
ciB0aGVpciBwYXJlbnQgcmVwb3NpdG9yeQozYTZlMjVhIHN5bmM6IGNoZWNrIG91dCBzdWJtb2R1
bGVzIGF0IHRoZSBwYXJlbnQncyBuZXcgcmV2aXNpb24KNDFjMjU5NyBwcm9qZWN0OiBkb24ndCB1
c2UgZGVzdC1icmFuY2ggb3IgdGFncyBhcyBTSEEtMSB1cHN0cmVhbSBmYWxsYmFjawplNmFkNzA4
IGhvb2tzOiBhZGQgLS1maXggb3B0aW9uIHRvIGF1dG8tYXBwbHkgaG9vayBmaXhlcwowOTkxNGJj
IEFkZCBkZXRhaWxlZCB1cGxvYWQgY29udGV4dCB0byBUcmFjZTIgdGVsZW1ldHJ5CjNmMTc3NTYg
cHJvamVjdDogYWxsb3cgcmUtcmVhZGluZyBzdWJtb2R1bGUgZ2l0bGlua3MKLS0tCiBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcmVwby97cmVwb18yLjY2LjEuYmIgPT4gcmVwb18yLjY3LmJifSB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1l
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3tyZXBvXzIuNjYuMS5iYiA9PiByZXBvXzIuNjcu
YmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18y
LjY2LjEuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjcuYmIKc2ltaWxh
cml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVw
b18yLjY2LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42
Ny5iYgppbmRleCAzMmM3YTM4YTk0Li45NDhhOWE3NzVjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjYuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcmVwby9yZXBvXzIuNjcuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJkNTciCiAK
IFNSQ19VUkkgPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3By
b3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0gXAogICAgICAgICAgICAiCi1TUkNS
RVYgPSAiYjg1ODg2ZmE5ZjViNGUyMTg5Y2M1YjJmNDBiZDBhODA0NTlkNGM3NyIKK1NSQ1JFViA9
ICJkMjdkNjgyOWE4NGY0ODhiNzI1M2VhNjkzZGNjNDI5MDc2YzMzOTE0IgogCiBNSVJST1JTICs9
ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQgZ2l0Oi8vZ2l0aHVi
LmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAotLSAKMi40Ny4xCgo=

--===============2766084119217058620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.66.1" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.67"
packages/x86-64-v3-poky-linux/repo: PV changed from "2.66.1" to "2.67"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.66.1" to "2.67"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.66.1" to "2.67"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.66.1" to "2.67"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.66.1" to "2.67"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.66.1" to "2.67"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.66.1" to "2.67"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.66.1 [default] to 2.67 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.66.1" to "2.67"

--===============2766084119217058620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

Changelog for repo: 2.66.1 -> 2.67

d27d682 project: check upstream ref ancestry for non-shallow clones
0ea57e2 project: gate the default-branch query by Git version
ba8ddf3 git_superproject: resolve one negotiation ref directly
d88ce8d upload: reuse the worker current-branch result
5e8d2a6 version: read describe and date in one Git call
e59c9cd cherry_pick: resolve and read commits in one process
83428a9 rebase: delegate automatic stashing to Git
948abc8 git_config: recognize only complete object IDs
c63a2f9 sync: tell apart same-path submanifest projects
0039e39 project: carry current state from the ref snapshot
5f37845 project: reuse ref OIDs in branch maintenance
d27034b project: centralize safe branch and commit resolution
6541729 project: reuse loaded refs when resolving HEAD
b85e76a git_refs: load HEAD with the ref snapshot on Git 2.45
e5bbb5c upload: prune ref scans for untouched projects and specific branches
4fe8761 project: read HEAD directly in-memory to avoid subprocesses
d729942 sync: skip submodules removed from their parent
3f087a8 sync: fetch submodules after their parent repository
3a6e25a sync: check out submodules at the parent's new revision
41c2597 project: don't use dest-branch or tags as SHA-1 upstream fallback
e6ad708 hooks: add --fix option to auto-apply hook fixes
09914bc Add detailed upload context to Trace2 telemetry
3f17756 project: allow re-reading submodule gitlinks

--===============2766084119217058620==--

