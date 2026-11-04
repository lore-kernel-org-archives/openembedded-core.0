Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2306.1793770293061193448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2026 21:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=CT9TqwSz;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iN+1aTmc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101a1a50a82c0-0932da9a-6a02-4f54-af96-6b7efd67f5e1-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793770292;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=kNir0m2F76i38pfzOiCbQqNyGcB+ItDhK1gFuji9Nxk=;
	b=CT9TqwSzeEJdaXAtbF1B7bCeBwiL3XblV0cGw67o8+Xa7yAn+cBfleZneO3VCwWY
	QZJdyyjqRl9sfhn77IOeiLP2PfgF1lrXIbJoEHKX7Jq2Trgtx+5Xsg7claa/QcL2r1M
	pz5qZAOQYDg2FeJa3m8v4m+yzqP6oPsBROazIpaU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793770292;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=kNir0m2F76i38pfzOiCbQqNyGcB+ItDhK1gFuji9Nxk=;
	b=iN+1aTmcqEdl1IaRsXguUc6iiM0rHo4VWizH9+23d6cFUCXXWIPZOx+CnhWDa+T/
	lOgadAPVioa8aGZaMPP8hwUjEiiFMefoTzAKbzeTJvD74aSxDOJoVRlOpx++hqWoFl8
	jVBsoSZQCxxVilySPc9lpETbQ+NmAcYOeGSWT+Zw=
Content-Type: multipart/mixed; boundary="===============5413066155063988714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] repo: upgrading to 2.72 SUCCEEDED
Message-ID: <010101a1a50a82c0-0932da9a-6a02-4f54-af96-6b7efd67f5e1-000000@us-west-2.amazonses.com>
Date: Wed, 4 Nov 2026 05:31:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.04-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249320

--===============5413066155063988714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *repo* to *2.72* has Succeeded.

Next steps:
    - apply the patch: git am 0001-repo-upgrade-2.71-2.72.patch
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
From 91664bd531e2fae6599869fd763d17d66969121f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 4 Nov 2026 05:14:46 +0000
Subject: [PATCH] repo: upgrade 2.71 -> 2.72

upload: add --ignore-remote-commits
docs: add Repology links for distro package versions
docs: release: update release process to match current practice
docs: release: remove stale Project References table
---
 meta/recipes-devtools/repo/{repo_2.71.bb => repo_2.72.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/repo/{repo_2.71.bb => repo_2.72.bb} (94%)

diff --git a/meta/recipes-devtools/repo/repo_2.71.bb b/meta/recipes-devtools/repo/repo_2.72.bb
similarity index 94%
rename from meta/recipes-devtools/repo/repo_2.71.bb
rename to meta/recipes-devtools/repo/repo_2.72.bb
index 9d9dceb32c..10e9208ebf 100644
--- a/meta/recipes-devtools/repo/repo_2.71.bb
+++ b/meta/recipes-devtools/repo/repo_2.72.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 SRC_URI = "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "338ddb7d83ea35d5aef94d3c5d95c74fa3845780"
+SRCREV = "365629015667e04739f59070e745548a728549c8"
 
 MIRRORS += "git://gerrit.googlesource.com/git-repo.git git://github.com/GerritCodeReview/git-repo.git"
 
-- 
2.47.1


--===============5413066155063988714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="repo-changelog.txt"

upload: add --ignore-remote-commits
docs: add Repology links for distro package versions
docs: release: update release process to match current practice
docs: release: remove stale Project References table

--===============5413066155063988714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/repo: SRC_URI changed from "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.71" to "git://gerrit.googlesource.com/git-repo.git;protocol=https;branch=main;tag=v2.72"
packages/x86-64-v3-poky-linux/repo: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo: PV changed from "2.71" to "2.72"
packages/x86-64-v3-poky-linux/repo/repo-dbg: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo/repo-dbg: PV changed from "2.71" to "2.72"
packages/x86-64-v3-poky-linux/repo/repo-dev: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo/repo-dev: PV changed from "2.71" to "2.72"
packages/x86-64-v3-poky-linux/repo/repo-doc: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo/repo-doc: PV changed from "2.71" to "2.72"
packages/x86-64-v3-poky-linux/repo/repo-locale: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo/repo-locale: PV changed from "2.71" to "2.72"
packages/x86-64-v3-poky-linux/repo/repo-src: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo/repo-src: PV changed from "2.71" to "2.72"
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo/repo-staticdev: PV changed from "2.71" to "2.72"
packages/x86-64-v3-poky-linux/repo/repo: PKGV changed from 2.71 [default] to 2.72 [default]
packages/x86-64-v3-poky-linux/repo/repo: PV changed from "2.71" to "2.72"

--===============5413066155063988714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-repo-upgrade-2.71-2.72.patch"

RnJvbSA5MTY2NGJkNTMxZTJmYWU2NTk5ODY5ZmQ3NjNkMTdkNjY5NjkxMjFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNCBOb3YgMjAyNiAwNToxNDo0NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHJl
cG86IHVwZ3JhZGUgMi43MSAtPiAyLjcyCgp1cGxvYWQ6IGFkZCAtLWlnbm9yZS1yZW1vdGUtY29t
bWl0cwpkb2NzOiBhZGQgUmVwb2xvZ3kgbGlua3MgZm9yIGRpc3RybyBwYWNrYWdlIHZlcnNpb25z
CmRvY3M6IHJlbGVhc2U6IHVwZGF0ZSByZWxlYXNlIHByb2Nlc3MgdG8gbWF0Y2ggY3VycmVudCBw
cmFjdGljZQpkb2NzOiByZWxlYXNlOiByZW1vdmUgc3RhbGUgUHJvamVjdCBSZWZlcmVuY2VzIHRh
YmxlCi0tLQogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8ve3JlcG9fMi43MS5iYiA9PiByZXBv
XzIuNzIuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8ve3JlcG9fMi43MS5iYiA9
PiByZXBvXzIuNzIuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3JlcG8vcmVwb18yLjcxLmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8vcmVwb18yLjcy
LmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29s
cy9yZXBvL3JlcG9fMi43MS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3JlcG8v
cmVwb18yLjcyLmJiCmluZGV4IDlkOWRjZWIzMmMuLjEwZTkyMDhlYmYgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9yZXBvL3JlcG9fMi43MS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcmVwby9yZXBvXzIuNzIuYmIKQEAgLTExLDcgKzExLDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2I4M2VmOTYzODdmMTQ2NTVmYzg1NGRkYzNjNmJk
NTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2Vycml0Lmdvb2dsZXNvdXJjZS5jb20vZ2l0LXJlcG8u
Z2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYWluO3RhZz12JHtQVn0gXAogICAgICAgICAgICAi
Ci1TUkNSRVYgPSAiMzM4ZGRiN2Q4M2VhMzVkNWFlZjk0ZDNjNWQ5NWM3NGZhMzg0NTc4MCIKK1NS
Q1JFViA9ICIzNjU2MjkwMTU2NjdlMDQ3MzlmNTkwNzBlNzQ1NTQ4YTcyODU0OWM4IgogCiBNSVJS
T1JTICs9ICJnaXQ6Ly9nZXJyaXQuZ29vZ2xlc291cmNlLmNvbS9naXQtcmVwby5naXQgZ2l0Oi8v
Z2l0aHViLmNvbS9HZXJyaXRDb2RlUmV2aWV3L2dpdC1yZXBvLmdpdCIKIAotLSAKMi40Ny4xCgo=

--===============5413066155063988714==--
