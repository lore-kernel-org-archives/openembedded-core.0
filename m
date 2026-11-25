Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36438.1795585771565872306
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hsUYmIhY;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=duc+5zGS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a211408472-8761a761-3397-44aa-a938-3c3fd93c6815-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585770;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=orMuScjaNchr+9Uz8pjjKmnEqTwSJF9wZ5K7n/+1+58=;
	b=hsUYmIhY3sS4iSD14TxOER902mt2guW9erqLAEBzCrqkdcoiCdmpk9p+VfXsLxq7
	qN4S41YOO9QIwFoRQtn5Dv6EXNudgcWLNlw8eeuE3tGIWPKb61+/EMCuICYa7m8CmgS
	TJy/2++WYiUN6g0JZmBtYFpsnGJJjxP5kgFFnMDg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585770;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=orMuScjaNchr+9Uz8pjjKmnEqTwSJF9wZ5K7n/+1+58=;
	b=duc+5zGSPvLfGtFx4pdm0fEKUoqx94bPK5Ko1KPtjrcsC1fyXoNqVUlne8otehWa
	NixpSXNudnPMpbk7UyrlvmxW/qHfSYuQt8m3jqCJNoHDTbiAt8yur13vrTihxFxvTnB
	xiAjOAeSix8tHudXub+Ni5lwS/30b4O3aUaJeMJ8=
Content-Type: multipart/mixed; boundary="===============5403308600168582277=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.74.1 SUCCEEDED
Message-ID: <010101a211408472-8761a761-3397-44aa-a938-3c3fd93c6815-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251155

--===============5403308600168582277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.74.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.73-2.74.1.patch
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
From 0c73261fdd19b907300aae08d54c529bae2a7bc4 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:37:57 +0000
Subject: [PATCH] repo: upgrade 2.73 -> 2.74.1

project: fast-forward tracking ref from prefetch
sync: add repo.smartsyncdefault checkout policy
init, sync: persist --manifest-depth across syncs
manifest: default sync-tags to false when depth is set
repo: bump launcher version to 2.74
init, sync: support per-branch smart sync branch config
sync: sort interleaved sync slowest-first
sync: add --force-jobs flag to override manifest sync-j-max
project: avoid git spawns in custom fetch ref checks
project: only unset core.bare when it is true
git_config, project: coalesce SetString writes in BatchWrites
sync: warm init.templateDir cache for sync workers
sync: trim preciousObjects work
pyrefly: initial support
typing: fix various errors caught by pyrefly
project: fix invalid logger call
project: fix Project.HasChanges API mismatches
pytest: only keep temp dirs of failed tests
tests: switch to mock.patch.object
run_tests: turn into multicall program
git_refs, project: read files-backend refs in Python
sync: handle smart sync when the manifest checkout has no branch
style: use `from subcmds import sync` everywhere
style: use `import hooks` everywhere
pytest: enable xdist usage
run_tests: regen uv.lock
flake8: fix warnings with newer versions
git_command: move _GetBasicEnv to module level
sync: remove obsolete projects before interleaved checkouts
style: use `import command` everywhere
tests: delete buggy git_command tests
style: use `import main` everywhere
style: use `import subcmds` everywhere
style: use `import command` in unittests
---
 meta/recipes-devtools/repo/{repo_2.73.bb => repo_2.74.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.73.bb => repo_2.74.1.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.73.bb b/meta/recipes-devtools/repo/repo_2.74.1.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.73.bb
rename to meta/recipes-devtools/repo/repo_2.74.1.bb
index 3b5ff064f7..3ac080c119 100644
--- a/meta/recipes-devtools/repo/repo_2.73.bb
+++ b/meta/recipes-devtools/repo/repo_2.74.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "d7c431b9968d928373fe9b463a51d304d3b2c48a"
+SRCREV = "83eb32ef8758d5f89bdc7237b7513e40cadd1409"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============5403308600168582277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.73" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.74.1"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.73" to "2.74.1"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.73" to "2.74.1"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.73" to "2.74.1"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.73" to "2.74.1"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.73" to "2.74.1"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.73" to "2.74.1"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.73" to "2.74.1"
packages/x86-64-v3-poky-linux/repo/repo: PKGSIZE changed from 47744 to 47958 (+0%)
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.73 [default] to 2.74.1 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.73" to "2.74.1"

--===============5403308600168582277==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

project: fast-forward tracking ref from prefetch
sync: add repo.smartsyncdefault checkout policy
init, sync: persist --manifest-depth across syncs
manifest: default sync-tags to false when depth is set
repo: bump launcher version to 2.74
init, sync: support per-branch smart sync branch config
sync: sort interleaved sync slowest-first
sync: add --force-jobs flag to override manifest sync-j-max
project: avoid git spawns in custom fetch ref checks
project: only unset core.bare when it is true
git_config, project: coalesce SetString writes in BatchWrites
sync: warm init.templateDir cache for sync workers
sync: trim preciousObjects work
pyrefly: initial support
typing: fix various errors caught by pyrefly
project: fix invalid logger call
project: fix Project.HasChanges API mismatches
pytest: only keep temp dirs of failed tests
tests: switch to mock.patch.object
run_tests: turn into multicall program
git_refs, project: read files-backend refs in Python
sync: handle smart sync when the manifest checkout has no branch
style: use `from subcmds import sync` everywhere
style: use `import hooks` everywhere
pytest: enable xdist usage
run_tests: regen uv.lock
flake8: fix warnings with newer versions
git_command: move _GetBasicEnv to module level
sync: remove obsolete projects before interleaved checkouts
style: use `import command` everywhere
tests: delete buggy git_command tests
style: use `import main` everywhere
style: use `import subcmds` everywhere
style: use `import command` in unittests

--===============5403308600168582277==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-repo-upgrade-2.73-2.74.1.patch"

RnJvbSAwYzczMjYxZmRkMTliOTA3MzAwYWFlMDhkNTRjNTI5YmFlMmE3YmM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6Mzc6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNzMgLT4gMi43NC4xCgpwcm9qZWN0OiBmYXN0LWZvcndhcmQgdHJhY2tp
bmcgcmVmIGZyb20gcHJlZmV0Y2gKc3luYzogYWRkIHJlcG8uc21hcnRzeW5jZGVmYXVsdCBjaGVj
a291dCBwb2xpY3kKaW5pdCwgc3luYzogcGVyc2lzdCAtLW1hbmlmZXN0LWRlcHRoIGFjcm9zcyBz
eW5jcwptYW5pZmVzdDogZGVmYXVsdCBzeW5jLXRhZ3MgdG8gZmFsc2Ugd2hlbiBkZXB0aCBpcyBz
ZXQKcmVwbzogYnVtcCBsYXVuY2hlciB2ZXJzaW9uIHRvIDIuNzQKaW5pdCwgc3luYzogc3VwcG9y
dCBwZXItYnJhbmNoIHNtYXJ0IHN5bmMgYnJhbmNoIGNvbmZpZwpzeW5jOiBzb3J0IGludGVybGVh
dmVkIHN5bmMgc2xvd2VzdC1maXJzdApzeW5jOiBhZGQgLS1mb3JjZS1qb2JzIGZsYWcgdG8gb3Zl
cnJpZGUgbWFuaWZlc3Qgc3luYy1qLW1heApwcm9qZWN0OiBhdm9pZCBnaXQgc3Bhd25zIGluIGN1
c3RvbSBmZXRjaCByZWYgY2hlY2tzCnByb2plY3Q6IG9ubHkgdW5zZXQgY29yZS5iYXJlIHdoZW4g
aXQgaXMgdHJ1ZQpnaXRfY29uZmlnLCBwcm9qZWN0OiBjb2FsZXNjZSBTZXRTdHJpbmcgd3JpdGVz
IGluIEJhdGNoV3JpdGVzCnN5bmM6IHdhcm0gaW5pdC50ZW1wbGF0ZURpciBjYWNoZSBmb3Igc3lu
YyB3b3JrZXJzCnN5bmM6IHRyaW0gcHJlY2lvdXNPYmplY3RzIHdvcmsKcHlyZWZseTogaW5pdGlh
bCBzdXBwb3J0CnR5cGluZzogZml4IHZhcmlvdXMgZXJyb3JzIGNhdWdodCBieSBweXJlZmx5CnBy
b2plY3Q6IGZpeCBpbnZhbGlkIGxvZ2dlciBjYWxsCnByb2plY3Q6IGZpeCBQcm9qZWN0Lkhhc0No
YW5nZXMgQVBJIG1pc21hdGNoZXMKcHl0ZXN0OiBvbmx5IGtlZXAgdGVtcCBkaXJzIG9mIGZhaWxl
ZCB0ZXN0cwp0ZXN0czogc3dpdGNoIHRvIG1vY2sucGF0Y2gub2JqZWN0CnJ1bl90ZXN0czogdHVy
biBpbnRvIG11bHRpY2FsbCBwcm9ncmFtCmdpdF9yZWZzLCBwcm9qZWN0OiByZWFkIGZpbGVzLWJh
Y2tlbmQgcmVmcyBpbiBQeXRob24Kc3luYzogaGFuZGxlIHNtYXJ0IHN5bmMgd2hlbiB0aGUgbWFu
aWZlc3QgY2hlY2tvdXQgaGFzIG5vIGJyYW5jaApzdHlsZTogdXNlIGBmcm9tIHN1YmNtZHMgaW1w
b3J0IHN5bmNgIGV2ZXJ5d2hlcmUKc3R5bGU6IHVzZSBgaW1wb3J0IGhvb2tzYCBldmVyeXdoZXJl
CnB5dGVzdDogZW5hYmxlIHhkaXN0IHVzYWdlCnJ1bl90ZXN0czogcmVnZW4gdXYubG9jawpmbGFr
ZTg6IGZpeCB3YXJuaW5ncyB3aXRoIG5ld2VyIHZlcnNpb25zCmdpdF9jb21tYW5kOiBtb3ZlIF9H
ZXRCYXNpY0VudiB0byBtb2R1bGUgbGV2ZWwKc3luYzogcmVtb3ZlIG9ic29sZXRlIHByb2plY3Rz
IGJlZm9yZSBpbnRlcmxlYXZlZCBjaGVja291dHMKc3R5bGU6IHVzZSBgaW1wb3J0IGNvbW1hbmRg
IGV2ZXJ5d2hlcmUKdGVzdHM6IGRlbGV0ZSBidWdneSBnaXRfY29tbWFuZCB0ZXN0cwpzdHlsZTog
dXNlIGBpbXBvcnQgbWFpbmAgZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBpbXBvcnQgc3ViY21kc2Ag
ZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBpbXBvcnQgY29tbWFuZGAgaW4gdW5pdHRlc3RzCi0tLQog
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8ve3JlcG9fMi43My5iYiA9PiByZXBvXzIuNzQuMS5i
Yn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby97cmVwb18yLjczLmJiID0+IHJlcG9f
Mi43NC4xLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBv
L3JlcG9fMi43My5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi43NC4xLmJi
CnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9y
ZXBvL3JlcG9fMi43My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVw
b18yLjc0LjEuYmIKaW5kZXggM2I1ZmYwNjRmNy4uM2FjMDgwYzExOSAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjczLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9yZXBvL3JlcG9fMi43NC4xLmJiCkBAIC0xMSw3ICsxMSw3IEBAIExJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTNiODNlZjk2Mzg3ZjE0NjU1ZmM4NTRkZGMzYzZi
ZDU3IgogCiBTUkNfVVJJID0gImdpdDovL2dlcnJpdC5nb29nbGVzb3VyY2UuY29tL2dpdC1yZXBv
LmdpdDtwcm90b2NvbD1odHRwczticmFuY2g9bWFpbjt0YWc9diR7UFZ9IFwKICAgICAgICAgICAg
IgotU1JDUkVWID0gImQ3YzQzMWI5OTY4ZDkyODM3M2ZlOWI0NjNhNTFkMzA0ZDNiMmM0OGEiCitT
UkNSRVYgPSAiODNlYjMyZWY4NzU4ZDVmODliZGM3MjM3Yjc1MTNlNDBjYWRkMTQwOSIKIAogTUlS
Uk9SUyArPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8uZ2l0IGdpdDov
L2dpdGh1Yi5jb20vR2Vycml0Q29kZVJldmlldy9naXQtcmVwby5naXQiCiAKLS0gCjIuNDcuMQoK

--===============5403308600168582277==--
