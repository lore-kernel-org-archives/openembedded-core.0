Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B045DC98305
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 05:42:15 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3736.1790055735225131072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 22:42:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=mM0SvzF1;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=fOFOzj+W;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101a0c7a2dac4-eb52c756-40d8-47d1-9003-2b01f1f7d0fc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1790055734;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=wpsc7AuK4s6iQMQd3TKvy/JNFzAF8Xsj5TJjIoowrBk=;
	b=mM0SvzF1ZNoVIQjW68rfHKDtcgXrvCkBn0k+zkLbG5Sz2SDu/sBOis6XoGAj9IZP
	EudXOH704MZqtniRwyc5j17r6DTYnbDBA0vZadc/Ps2ynsA7RuzGALfW1nncZpjx/Hd
	Sp3jfjunpfPWmZ1vKbbgccg4jzR+UGgjSURZVCVw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1790055734;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=wpsc7AuK4s6iQMQd3TKvy/JNFzAF8Xsj5TJjIoowrBk=;
	b=fOFOzj+WRZIGzQEOYwO/qADzKFj0U3ogokMIZp2KSUm0h4Uc7IfswnINmxakIEg7
	pdrwnar9YhNQjOngu08UuIxudyhwn9S0TaWnLcJCwbpfzQGLhOe/jrUsadKJ2M/G/Y/
	Xgrs6S2veH4gZ4nTz//CrgcxWNQHVjaWP0w6mvLA=
Content-Type: multipart/mixed; boundary="===============3941112282516973458=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.68 SUCCEEDED
Message-ID: <010101a0c7a2dac4-eb52c756-40d8-47d1-9003-2b01f1f7d0fc-000000@us-west-2.amazonses.com>
Date: Tue, 22 Sep 2026 05:42:13 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.09.22-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 05:42:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246375

--===============3941112282516973458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.68* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.67-2.68.patch
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
From e352d191a55929b76dd9cd00cabd7fbfc3884593 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 22 Sep 2026 05:33:10 +0000
Subject: [PATCH] repo: upgrade 2.67 -> 2.68

info: reuse branch snapshots and combine history walks
project: avoid unnecessary sync revision enumeration
project: make fast-forward merges explicit
project: fold normal stash detection into status
sync: reuse status HEAD in the bloat scan
project: render worktree status from one snapshot
project: use one status snapshot for dirty checks
git_status: parse one porcelain v2 worktree snapshot
git_command: allow lossless capture of machine output
project: pass --no-filter and --no-tags in DownloadPatchSet
project: rename UncommitedFiles to UncommittedFiles
command: preserve project filters in regex selection
tests: avoid losing trace2 socket readiness signal
sync: keep generated jobs-checkout help host-independent
sync: implement reprojectcmd for the local half
project: report why refreshing the index failed
command: fix group selection across submanifests
release: update-manpages: restore __main__ guard
manifest_xml: Improve error message on base check fail
upload: bypass branch editor with explicit branch and -y
---
 meta/recipes-devtools/repo/{repo_2.67.bb => repo_2.68.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.67.bb => repo_2.68.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.67.bb b/meta/recipes-devtools/repo/repo_2.68.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.67.bb
rename to meta/recipes-devtools/repo/repo_2.68.bb
index 948a9a775c..ee448583ab 100644
--- a/meta/recipes-devtools/repo/repo_2.67.bb
+++ b/meta/recipes-devtools/repo/repo_2.68.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "d27d6829a84f488b7253ea693dcc429076c33914"
+SRCREV = "8c7e0a683e88cf23f2c4765b26cfa1c917b660f4"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============3941112282516973458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.67" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.68"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.67 [default] to 2.68 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.67 [default] to 2.68 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.67 [default] to 2.68 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.67 [default] to 2.68 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.67 [default] to 2.68 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.67 [default] to 2.68 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.67 [default] to 2.68 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.67" to "2.68"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.67 [default] to 2.68 [default]

--===============3941112282516973458==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.67-2.68.patch"

RnJvbSBlMzUyZDE5MWE1NTkyOWI3NmRkOWNkMDBjYWJkN2ZiZmMzODg0NTkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMjIgU2VwIDIwMjYgMDU6MzM6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjcgLT4gMi42OAoKaW5mbzogcmV1c2UgYnJhbmNoIHNuYXBzaG90cyBh
bmQgY29tYmluZSBoaXN0b3J5IHdhbGtzCnByb2plY3Q6IGF2b2lkIHVubmVjZXNzYXJ5IHN5bmMg
cmV2aXNpb24gZW51bWVyYXRpb24KcHJvamVjdDogbWFrZSBmYXN0LWZvcndhcmQgbWVyZ2VzIGV4
cGxpY2l0CnByb2plY3Q6IGZvbGQgbm9ybWFsIHN0YXNoIGRldGVjdGlvbiBpbnRvIHN0YXR1cwpz
eW5jOiByZXVzZSBzdGF0dXMgSEVBRCBpbiB0aGUgYmxvYXQgc2Nhbgpwcm9qZWN0OiByZW5kZXIg
d29ya3RyZWUgc3RhdHVzIGZyb20gb25lIHNuYXBzaG90CnByb2plY3Q6IHVzZSBvbmUgc3RhdHVz
IHNuYXBzaG90IGZvciBkaXJ0eSBjaGVja3MKZ2l0X3N0YXR1czogcGFyc2Ugb25lIHBvcmNlbGFp
biB2MiB3b3JrdHJlZSBzbmFwc2hvdApnaXRfY29tbWFuZDogYWxsb3cgbG9zc2xlc3MgY2FwdHVy
ZSBvZiBtYWNoaW5lIG91dHB1dApwcm9qZWN0OiBwYXNzIC0tbm8tZmlsdGVyIGFuZCAtLW5vLXRh
Z3MgaW4gRG93bmxvYWRQYXRjaFNldApwcm9qZWN0OiByZW5hbWUgVW5jb21taXRlZEZpbGVzIHRv
IFVuY29tbWl0dGVkRmlsZXMKY29tbWFuZDogcHJlc2VydmUgcHJvamVjdCBmaWx0ZXJzIGluIHJl
Z2V4IHNlbGVjdGlvbgp0ZXN0czogYXZvaWQgbG9zaW5nIHRyYWNlMiBzb2NrZXQgcmVhZGluZXNz
IHNpZ25hbApzeW5jOiBrZWVwIGdlbmVyYXRlZCBqb2JzLWNoZWNrb3V0IGhlbHAgaG9zdC1pbmRl
cGVuZGVudApzeW5jOiBpbXBsZW1lbnQgcmVwcm9qZWN0Y21kIGZvciB0aGUgbG9jYWwgaGFsZgpw
cm9qZWN0OiByZXBvcnQgd2h5IHJlZnJlc2hpbmcgdGhlIGluZGV4IGZhaWxlZApjb21tYW5kOiBm
aXggZ3JvdXAgc2VsZWN0aW9uIGFjcm9zcyBzdWJtYW5pZmVzdHMKcmVsZWFzZTogdXBkYXRlLW1h
bnBhZ2VzOiByZXN0b3JlIF9fbWFpbl9fIGd1YXJkCm1hbmlmZXN0X3htbDogSW1wcm92ZSBlcnJv
ciBtZXNzYWdlIG9uIGJhc2UgY2hlY2sgZmFpbAp1cGxvYWQ6IGJ5cGFzcyBicmFuY2ggZWRpdG9y
IHdpdGggZXhwbGljaXQgYnJhbmNoIGFuZCAteQotLS0KIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3tyZXBvXzIuNjcuYmIgPT4gcmVwb18yLjY4LmJifSB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9yZXBvL3tyZXBvXzIuNjcuYmIgPT4gcmVwb18yLjY4LmJifSAoOTQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42Ny5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNjcuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OC5iYgppbmRleCA5NDhhOWE3NzVjLi5l
ZTQ0ODU4M2FiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIu
NjcuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY4LmJiCkBAIC0x
MSw3ICsxMSw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNl
Zjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZiZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5n
b29nbGVzb3VyY2UuY29tL2dpdC1yZXBvLmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0
YWc9diR7UFZ9IFwKICAgICAgICAgICAgIgotU1JDUkVWID0gImQyN2Q2ODI5YTg0ZjQ4OGI3MjUz
ZWE2OTNkY2M0MjkwNzZjMzM5MTQiCitTUkNSRVYgPSAiOGM3ZTBhNjgzZTg4Y2YyM2YyYzQ3NjVi
MjZjZmExYzkxN2I2NjBmNCIKIAogTUlSUk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJj
ZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDovL2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQt
cmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============3941112282516973458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

info: reuse branch snapshots and combine history walks
project: avoid unnecessary sync revision enumeration
project: make fast-forward merges explicit
project: fold normal stash detection into status
sync: reuse status HEAD in the bloat scan
project: render worktree status from one snapshot
project: use one status snapshot for dirty checks
git_status: parse one porcelain v2 worktree snapshot
git_command: allow lossless capture of machine output
project: pass --no-filter and --no-tags in DownloadPatchSet
project: rename UncommitedFiles to UncommittedFiles
command: preserve project filters in regex selection
tests: avoid losing trace2 socket readiness signal
sync: keep generated jobs-checkout help host-independent
sync: implement reprojectcmd for the local half
project: report why refreshing the index failed
command: fix group selection across submanifests
release: update-manpages: restore __main__ guard
manifest_xml: Improve error message on base check fail
upload: bypass branch editor with explicit branch and -y

--===============3941112282516973458==--

