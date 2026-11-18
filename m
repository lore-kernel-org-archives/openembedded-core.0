Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6633.1794980485889801155
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 21:41:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ZZwu6O5u;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Dt8eMa+u;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101a1ed2c9728-45afedd0-e613-406e-bb33-62d5a9bcd67a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794980485;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=2LFzfQRte9anDSat1qdMEPx5kz/rvxLdLrnILAq+oYE=;
	b=ZZwu6O5uu1EPicU1EQNO46s/bozrrTQeX4LFohBuehY29yZ7xTL/1d8tfHzS2r5o
	RPlhAw46h+Bvuwyja00lPKhAw7eDpZ+xdlM0HlsvXJN2Dvreaz7ap+PlrA6MrqSbVRk
	iLciUq6bTv46aSEr7Ue9aBgBskh9s9FaPSBa3P7I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794980485;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=2LFzfQRte9anDSat1qdMEPx5kz/rvxLdLrnILAq+oYE=;
	b=Dt8eMa+u3e7BnFrl6BKNr0Sdq97foNclxTLWNI7k+NoQ498gjTzkaHaflvSGThx0
	KP6Eho2k17saybvssgJFIpIyAq4z7nCDCTLr6vifo/M1b1K2GA33Saw/hMNVw37X4pD
	EzS0rdrUMgBHVJB/40fesKplv6ql4Mzc0VAQIlFw=
Content-Type: multipart/mixed; boundary="===============0322796554479311034=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.74 SUCCEEDED
Message-ID: <010101a1ed2c9728-45afedd0-e613-406e-bb33-62d5a9bcd67a-000000@us-west-2.amazonses.com>
Date: Wed, 18 Nov 2026 05:41:24 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.18-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 05:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250510

--===============0322796554479311034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.74* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.73-2.74.patch
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
From 67ba591e3454b936100972c7a6de7c397cc1208c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Nov 2026 05:36:46 +0000
Subject: [PATCH] repo: upgrade 2.73 -> 2.74

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
 meta/recipes-devtools/repo/{repo_2.73.bb => repo_2.74.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.73.bb => repo_2.74.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.73.bb b/meta/recipes-devtools/repo/repo_2.74.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.73.bb
rename to meta/recipes-devtools/repo/repo_2.74.bb
index 3b5ff064f7..67a90d467d 100644
--- a/meta/recipes-devtools/repo/repo_2.73.bb
+++ b/meta/recipes-devtools/repo/repo_2.74.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "d7c431b9968d928373fe9b463a51d304d3b2c48a"
+SRCREV = "a816b88d2319089d5cbaa3fa336a68db917cb0f7"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============0322796554479311034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.73" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.74"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.73 [default] to 2.74 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.73 [default] to 2.74 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.73 [default] to 2.74 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.73 [default] to 2.74 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.73 [default] to 2.74 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.73 [default] to 2.74 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.73 [default] to 2.74 [default]
packages/x86-64-v3-poky-linux/repo/repo: PKGSIZE changed from 47744 to 47986 (+1%)
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.73" to "2.74"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.73 [default] to 2.74 [default]

--===============0322796554479311034==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.73-2.74.patch"

RnJvbSA2N2JhNTkxZTM0NTRiOTM2MTAwOTcyYzdhNmRlN2MzOTdjYzEyMDhjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggTm92IDIwMjYgMDU6MzY6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNzMgLT4gMi43NAoKcmVwbzogYnVtcCBsYXVuY2hlciB2ZXJzaW9uIHRv
IDIuNzQKaW5pdCwgc3luYzogc3VwcG9ydCBwZXItYnJhbmNoIHNtYXJ0IHN5bmMgYnJhbmNoIGNv
bmZpZwpzeW5jOiBzb3J0IGludGVybGVhdmVkIHN5bmMgc2xvd2VzdC1maXJzdApzeW5jOiBhZGQg
LS1mb3JjZS1qb2JzIGZsYWcgdG8gb3ZlcnJpZGUgbWFuaWZlc3Qgc3luYy1qLW1heApwcm9qZWN0
OiBhdm9pZCBnaXQgc3Bhd25zIGluIGN1c3RvbSBmZXRjaCByZWYgY2hlY2tzCnByb2plY3Q6IG9u
bHkgdW5zZXQgY29yZS5iYXJlIHdoZW4gaXQgaXMgdHJ1ZQpnaXRfY29uZmlnLCBwcm9qZWN0OiBj
b2FsZXNjZSBTZXRTdHJpbmcgd3JpdGVzIGluIEJhdGNoV3JpdGVzCnN5bmM6IHdhcm0gaW5pdC50
ZW1wbGF0ZURpciBjYWNoZSBmb3Igc3luYyB3b3JrZXJzCnN5bmM6IHRyaW0gcHJlY2lvdXNPYmpl
Y3RzIHdvcmsKcHlyZWZseTogaW5pdGlhbCBzdXBwb3J0CnR5cGluZzogZml4IHZhcmlvdXMgZXJy
b3JzIGNhdWdodCBieSBweXJlZmx5CnByb2plY3Q6IGZpeCBpbnZhbGlkIGxvZ2dlciBjYWxsCnBy
b2plY3Q6IGZpeCBQcm9qZWN0Lkhhc0NoYW5nZXMgQVBJIG1pc21hdGNoZXMKcHl0ZXN0OiBvbmx5
IGtlZXAgdGVtcCBkaXJzIG9mIGZhaWxlZCB0ZXN0cwp0ZXN0czogc3dpdGNoIHRvIG1vY2sucGF0
Y2gub2JqZWN0CnJ1bl90ZXN0czogdHVybiBpbnRvIG11bHRpY2FsbCBwcm9ncmFtCmdpdF9yZWZz
LCBwcm9qZWN0OiByZWFkIGZpbGVzLWJhY2tlbmQgcmVmcyBpbiBQeXRob24Kc3luYzogaGFuZGxl
IHNtYXJ0IHN5bmMgd2hlbiB0aGUgbWFuaWZlc3QgY2hlY2tvdXQgaGFzIG5vIGJyYW5jaApzdHls
ZTogdXNlIGBmcm9tIHN1YmNtZHMgaW1wb3J0IHN5bmNgIGV2ZXJ5d2hlcmUKc3R5bGU6IHVzZSBg
aW1wb3J0IGhvb2tzYCBldmVyeXdoZXJlCnB5dGVzdDogZW5hYmxlIHhkaXN0IHVzYWdlCnJ1bl90
ZXN0czogcmVnZW4gdXYubG9jawpmbGFrZTg6IGZpeCB3YXJuaW5ncyB3aXRoIG5ld2VyIHZlcnNp
b25zCmdpdF9jb21tYW5kOiBtb3ZlIF9HZXRCYXNpY0VudiB0byBtb2R1bGUgbGV2ZWwKc3luYzog
cmVtb3ZlIG9ic29sZXRlIHByb2plY3RzIGJlZm9yZSBpbnRlcmxlYXZlZCBjaGVja291dHMKc3R5
bGU6IHVzZSBgaW1wb3J0IGNvbW1hbmRgIGV2ZXJ5d2hlcmUKdGVzdHM6IGRlbGV0ZSBidWdneSBn
aXRfY29tbWFuZCB0ZXN0cwpzdHlsZTogdXNlIGBpbXBvcnQgbWFpbmAgZXZlcnl3aGVyZQpzdHls
ZTogdXNlIGBpbXBvcnQgc3ViY21kc2AgZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBpbXBvcnQgY29t
bWFuZGAgaW4gdW5pdHRlc3RzCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8ve3JlcG9f
Mi43My5iYiA9PiByZXBvXzIuNzQuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
e3JlcG9fMi43My5iYiA9PiByZXBvXzIuNzQuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjczLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3JlcG8vcmVwb18yLjc0LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi43My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3JlcG8vcmVwb18yLjc0LmJiCmluZGV4IDNiNWZmMDY0ZjcuLjY3YTkwZDQ2N2Qg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi43My5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNzQuYmIKQEAgLTExLDcgKzExLDcg
QEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2
NTVmYzg1NGRkYzNjNmJkNTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJj
ZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0g
XAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiZDdjNDMxYjk5NjhkOTI4MzczZmU5YjQ2M2E1MWQz
MDRkM2IyYzQ4YSIKK1NSQ1JFViA9ICJhODE2Yjg4ZDIzMTkwODlkNWNiYWEzZmEzMzZhNjhkYjkx
N2NiMGY3IgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQt
cmVwby5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIK
IAotLSAKMi40Ny4xCgo=

--===============0322796554479311034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

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

--===============0322796554479311034==--
