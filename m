Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37042.1793167562342097346
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Jt5iFvZD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=rnQAF4/l;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1811d9248-b8205734-ad76-4824-b731-9d54ae2996cd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167561;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=SHAMSykAvA+bAprk91H3NWRLesYtV7WvNDi12Z2FbGo=;
	b=Jt5iFvZDJBwiRu6nbyKADTxk/BygthyLaRAyGKBSWLOVPRj6oAAHV3V2fn+9LvF1
	yYkUeh1Hv88QfbCSz56fk/YZCZR6dacmBhAbiuNyIu/a96DRiNuQyFd5x3BegWB3Tzc
	yFdvg2pAmCCxExX1KYBrbo88/yKcK1hE0jSECGY8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167561;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=SHAMSykAvA+bAprk91H3NWRLesYtV7WvNDi12Z2FbGo=;
	b=rnQAF4/lAHuIes2Q/fFN4uPfCm8Nr+wQs9Gsye4Ujbajjy6CS3heNXynbaqxDjsf
	PLCOmMEKl5AoS5funOXbbeZSUAsPuJuu+3ME42Z5n0XdecO4N82MCJJwiAgFGJMOxiS
	DmrDk2sagofTCq+lxk6MH629kmY/WbtoRPaXtlzY=
Content-Type: multipart/mixed; boundary="===============3766011304718827584=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.71 SUCCEEDED
Message-ID: <010101a1811d9248-b8205734-ad76-4824-b731-9d54ae2996cd-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:06:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248780

--===============3766011304718827584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.71* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.69-2.71.patch
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
From c4c6a0be4fb845cca22e07a99f13ff40b7588f9d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 28 Oct 2026 06:03:53 +0000
Subject: [PATCH] repo: upgrade 2.69 -> 2.71

style: use `import git_refs` everywhere
upload: suppress git push progress when quiet or non-TTY
tests: e2e: add tests for more `repo init` options
tests: e2e: add tests for sync failures
tests: e2e: add tests for manifest groups
tests: e2e: add tests for partial clones & the Android setup
tests: e2e: add tests for network-only & local-only syncs
tests: e2e: add tests for init, sync & common workflows
tests: e2e: fix harness on Windows, CI & inside git checkouts
style: use `import git_command` everywhere
style: use `import repo_logging` everywhere
style: use `import repo_trace` everywhere
style: use `import ctypes` everywhere
style: use `import error` everywhere
tests: e2e: add pytest fixtures & `e2e` marker
tests: e2e: add a client to run repo against the local server
tests: e2e: add a local smart HTTP git server
tests: e2e: add helpers to create bare git repos
tests: fail skipped tests in CQ
config: add subcommand to manage ~/.repoconfig/config
project: accept v3 git bundles in _IsValidBundle
sync, init: support repo.smartsync config and --head alias
sync: Provide a CLI command to opt in/out of smartsync for a user.
upload: reject --fix with --ignore-hooks or --no-verify
---
 meta/recipes-devtools/repo/{repo_2.69.bb => repo_2.71.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.69.bb => repo_2.71.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.69.bb b/meta/recipes-devtools/repo/repo_2.71.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.69.bb
rename to meta/recipes-devtools/repo/repo_2.71.bb
index c98534ca44..9d9dceb32c 100644
--- a/meta/recipes-devtools/repo/repo_2.69.bb
+++ b/meta/recipes-devtools/repo/repo_2.71.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "a0bc2b14a30bef631b91a2ca37c5254d9af44718"
+SRCREV = "338ddb7d83ea35d5aef94d3c5d95c74fa3845780"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============3766011304718827584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.69" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.71"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.69" to "2.71"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.69 [default] to 2.71 [default]
packages/x86-64-v3-poky-linux/repo/repo: PKGSIZE changed from 47370 to 47744 (+1%)

--===============3766011304718827584==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.69-2.71.patch"

RnJvbSBjNGM2YTBiZTRmYjg0NWNjYTIyZTA3YTk5ZjEzZmY0MGI3NTg4ZjlkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjggT2N0IDIwMjYgMDY6MDM6NTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBy
ZXBvOiB1cGdyYWRlIDIuNjkgLT4gMi43MQoKc3R5bGU6IHVzZSBgaW1wb3J0IGdpdF9yZWZzYCBl
dmVyeXdoZXJlCnVwbG9hZDogc3VwcHJlc3MgZ2l0IHB1c2ggcHJvZ3Jlc3Mgd2hlbiBxdWlldCBv
ciBub24tVFRZCnRlc3RzOiBlMmU6IGFkZCB0ZXN0cyBmb3IgbW9yZSBgcmVwbyBpbml0YCBvcHRp
b25zCnRlc3RzOiBlMmU6IGFkZCB0ZXN0cyBmb3Igc3luYyBmYWlsdXJlcwp0ZXN0czogZTJlOiBh
ZGQgdGVzdHMgZm9yIG1hbmlmZXN0IGdyb3Vwcwp0ZXN0czogZTJlOiBhZGQgdGVzdHMgZm9yIHBh
cnRpYWwgY2xvbmVzICYgdGhlIEFuZHJvaWQgc2V0dXAKdGVzdHM6IGUyZTogYWRkIHRlc3RzIGZv
ciBuZXR3b3JrLW9ubHkgJiBsb2NhbC1vbmx5IHN5bmNzCnRlc3RzOiBlMmU6IGFkZCB0ZXN0cyBm
b3IgaW5pdCwgc3luYyAmIGNvbW1vbiB3b3JrZmxvd3MKdGVzdHM6IGUyZTogZml4IGhhcm5lc3Mg
b24gV2luZG93cywgQ0kgJiBpbnNpZGUgZ2l0IGNoZWNrb3V0cwpzdHlsZTogdXNlIGBpbXBvcnQg
Z2l0X2NvbW1hbmRgIGV2ZXJ5d2hlcmUKc3R5bGU6IHVzZSBgaW1wb3J0IHJlcG9fbG9nZ2luZ2Ag
ZXZlcnl3aGVyZQpzdHlsZTogdXNlIGBpbXBvcnQgcmVwb190cmFjZWAgZXZlcnl3aGVyZQpzdHls
ZTogdXNlIGBpbXBvcnQgY3R5cGVzYCBldmVyeXdoZXJlCnN0eWxlOiB1c2UgYGltcG9ydCBlcnJv
cmAgZXZlcnl3aGVyZQp0ZXN0czogZTJlOiBhZGQgcHl0ZXN0IGZpeHR1cmVzICYgYGUyZWAgbWFy
a2VyCnRlc3RzOiBlMmU6IGFkZCBhIGNsaWVudCB0byBydW4gcmVwbyBhZ2FpbnN0IHRoZSBsb2Nh
bCBzZXJ2ZXIKdGVzdHM6IGUyZTogYWRkIGEgbG9jYWwgc21hcnQgSFRUUCBnaXQgc2VydmVyCnRl
c3RzOiBlMmU6IGFkZCBoZWxwZXJzIHRvIGNyZWF0ZSBiYXJlIGdpdCByZXBvcwp0ZXN0czogZmFp
bCBza2lwcGVkIHRlc3RzIGluIENRCmNvbmZpZzogYWRkIHN1YmNvbW1hbmQgdG8gbWFuYWdlIH4v
LnJlcG9jb25maWcvY29uZmlnCnByb2plY3Q6IGFjY2VwdCB2MyBnaXQgYnVuZGxlcyBpbiBfSXNW
YWxpZEJ1bmRsZQpzeW5jLCBpbml0OiBzdXBwb3J0IHJlcG8uc21hcnRzeW5jIGNvbmZpZyBhbmQg
LS1oZWFkIGFsaWFzCnN5bmM6IFByb3ZpZGUgYSBDTEkgY29tbWFuZCB0byBvcHQgaW4vb3V0IG9m
IHNtYXJ0c3luYyBmb3IgYSB1c2VyLgp1cGxvYWQ6IHJlamVjdCAtLWZpeCB3aXRoIC0taWdub3Jl
LWhvb2tzIG9yIC0tbm8tdmVyaWZ5Ci0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8ve3Jl
cG9fMi42OS5iYiA9PiByZXBvXzIuNzEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Jl
cG8ve3JlcG9fMi42OS5iYiA9PiByZXBvXzIuNzEuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjY5LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3JlcG8vcmVwb18yLjcxLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjcxLmJiCmluZGV4IGM5ODUzNGNhNDQuLjlkOWRjZWIz
MmMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi42OS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcmVwby9yZXBvXzIuNzEuYmIKQEAgLTExLDcgKzEx
LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdm
MTQ2NTVmYzg1NGRkYzNjNmJkNTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNv
dXJjZS5jb20vZ2l0LXJlcG8uZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQ
Vn0gXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiYTBiYzJiMTRhMzBiZWY2MzFiOTFhMmNhMzdj
NTI1NGQ5YWY0NDcxOCIKK1NSQ1JFViA9ICIzMzhkZGI3ZDgzZWEzNWQ1YWVmOTRkM2M1ZDk1Yzc0
ZmEzODQ1NzgwIgogCiBNSVJST1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9n
aXQtcmVwby5naXQgZ2l0Oi8vZ2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdp
dCIKIAotLSAKMi40Ny4xCgo=

--===============3766011304718827584==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

style: use `import git_refs` everywhere
upload: suppress git push progress when quiet or non-TTY
tests: e2e: add tests for more `repo init` options
tests: e2e: add tests for sync failures
tests: e2e: add tests for manifest groups
tests: e2e: add tests for partial clones & the Android setup
tests: e2e: add tests for network-only & local-only syncs
tests: e2e: add tests for init, sync & common workflows
tests: e2e: fix harness on Windows, CI & inside git checkouts
style: use `import git_command` everywhere
style: use `import repo_logging` everywhere
style: use `import repo_trace` everywhere
style: use `import ctypes` everywhere
style: use `import error` everywhere
tests: e2e: add pytest fixtures & `e2e` marker
tests: e2e: add a client to run repo against the local server
tests: e2e: add a local smart HTTP git server
tests: e2e: add helpers to create bare git repos
tests: fail skipped tests in CQ
config: add subcommand to manage ~/.repoconfig/config
project: accept v3 git bundles in _IsValidBundle
sync, init: support repo.smartsync config and --head alias
sync: Provide a CLI command to opt in/out of smartsync for a user.
upload: reject --fix with --ignore-hooks or --no-verify

--===============3766011304718827584==--
