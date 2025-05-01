Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F035C3ABB9
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:44 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.1771.1746113606695801833
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=CBVTEmCl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Um+a1jxJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101968c7b6b3c-22925f93-e917-4921-b46c-62db9e3fd6a8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YbRzPTAd7b1IXmF5rCV0TCVei2K+LNfbmmkTWpxJnfg=;
	b=CBVTEmCl4NEB8qUc9vSexWFWJ2lFFakNewWQhE+/SOz2rSXy39hmuAkk8RmSPphP
	EhqSgJFANfj7RGJ18BXmNi4aqflGxO9dlmkGpUMqxasekmkAv2+6IzUGqr9R/PR89ja
	GKdeDOBsNHieF34eCLMNm56nismzoEsiwturGYo8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113620;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YbRzPTAd7b1IXmF5rCV0TCVei2K+LNfbmmkTWpxJnfg=;
	b=Um+a1jxJD+sqoMiSWzAC9Hvl2/Y30QZB+kAiQsjpX6GX7Ah6d123ZZqgQL1hvx5a
	XElLZALrRe/3tv/6GjFyV1F/WN+JU2E9Aq2hw7Dogi3ZLmmGbRP7h72IYb6i/evUoMx
	XzqImLp90SARKogEVpH+PFNfDYkpkH6SWiaXUDZw=
Content-Type: multipart/mixed; boundary="===============3318947948048131974=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pdm: upgrading to 2.24.1 SUCCEEDED
Message-ID: <010101968c7b6b3c-22925f93-e917-4921-b46c-62db9e3fd6a8-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:40 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215821

--===============3318947948048131974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pdm* to *2.24.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pdm-upgrade-2.23.1-2.24.1.patch
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
From 523e9447d149232277b3aa19bfe0606f4f3681b7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 09:15:30 +0000
Subject: [PATCH] python3-pdm: upgrade 2.23.1 -> 2.24.1

---
 .../python/{python3-pdm_2.23.1.bb => python3-pdm_2.24.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pdm_2.23.1.bb => python3-pdm_2.24.1.bb} (82%)

diff --git a/meta/recipes-devtools/python/python3-pdm_2.23.1.bb b/meta/recipes-devtools/python/python3-pdm_2.24.1.bb
similarity index 82%
rename from meta/recipes-devtools/python/python3-pdm_2.23.1.bb
rename to meta/recipes-devtools/python/python3-pdm_2.24.1.bb
index acab401392..3f251c7f0f 100644
--- a/meta/recipes-devtools/python/python3-pdm_2.23.1.bb
+++ b/meta/recipes-devtools/python/python3-pdm_2.24.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "cf12cd2201df78a6543a5485ac1d7015a73b3a6b10c98b66dfae6ebd481386fe"
+SRC_URI[sha256sum] = "fc8adf011caa4ee2b0f25dabf890152aa4153cc21599ea67fe0c14e533dcd6d9"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.47.1


--===============3318947948048131974==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pdm-upgrade-2.23.1-2.24.1.patch"

RnJvbSA1MjNlOTQ0N2QxNDkyMzIyNzdiM2FhMTliZmUwNjA2ZjRmMzY4MWI3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwOToxNTozMCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGRtOiB1cGdyYWRlIDIuMjMuMSAtPiAyLjI0LjEKCi0tLQogLi4uL3B5dGhvbi97cHl0
aG9uMy1wZG1fMi4yMy4xLmJiID0+IHB5dGhvbjMtcGRtXzIuMjQuMS5iYn0gICAgIHwgMiArLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wZG1fMi4yMy4xLmJiID0+IHB5dGhv
bjMtcGRtXzIuMjQuMS5iYn0gKDgyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjMuMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1wZG1fMi4yNC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggODIlCnJlbmFtZSBm
cm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wZG1fMi4yMy4xLmJiCnJl
bmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjQuMS5i
YgppbmRleCBhY2FiNDAxMzkyLi4zZjI1MWM3ZjBmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjMuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGRtXzIuMjQuMS5iYgpAQCAtNCw3ICs0LDcgQEAgTElD
RU5TRSA9ICJNSVQiCiBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0xJQ0VOU0U7bWQ1PTJlYjMxYTJjYzFhNzU4YzM0YjQ5OWYyODdkZDA0ZWYyIgog
Ci1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiY2YxMmNkMjIwMWRmNzhhNjU0M2E1NDg1YWMxZDcwMTVh
NzNiM2E2YjEwYzk4YjY2ZGZhZTZlYmQ0ODEzODZmZSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJm
YzhhZGYwMTFjYWE0ZWUyYjBmMjVkYWJmODkwMTUyYWE0MTUzY2MyMTU5OWVhNjdmZTBjMTRlNTMz
ZGNkNmQ5IgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX3NldHVwdG9vbHNfYnVpbGRfbWV0YQogCi0t
IAoyLjQ3LjEKCg==

--===============3318947948048131974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pdm: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.23.1.tar.gz;downloadfilename=pdm-2.23.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pdm/pdm-2.24.1.tar.gz;downloadfilename=pdm-2.24.1.tar.gz"
packages/core2-64-poky-linux/python3-pdm: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dbg: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-dev: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-doc: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-locale: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-src: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm-staticdev: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
packages/core2-64-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info, added "/usr/lib/python3.13/site-packages/pdm/formats/__pycache__/pylock.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/cli/commands/new.py /usr/lib/python3.13/site-packages/pdm/cli/commands/__pycache__/new.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/cli/templates/minimal/.gitignore /usr/lib/python3.13/site-packages/pdm/formats/pylock.py"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGSIZE changed from 2155818 to 2184505 (+1%)
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PV changed from "2.23.1" to "2.24.1"
packages/core2-64-poky-linux/python3-pdm/python3-pdm: PKGV changed from 2.23.1 [default] to 2.24.1 [default]
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info
  /usr/lib/python3.13/site-packages/pdm/cli/commands/new.py was added
  /usr/lib/python3.13/site-packages/pdm/cli/commands/__pycache__/new.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/cli/templates/minimal/.gitignore was added
  /usr/lib/python3.13/site-packages/pdm/formats/__pycache__/pylock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/formats/pylock.py was added

--===============3318947948048131974==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pdm/python3-pdm: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info -> /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info, directory renamed /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info/licenses, added "/usr/lib/python3.13/site-packages/pdm/formats/__pycache__/pylock.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/formats/pylock.py /usr/lib/python3.13/site-packages/pdm/cli/templates/minimal/.gitignore /usr/lib/python3.13/site-packages/pdm/cli/commands/__pycache__/new.cpython-313.pyc /usr/lib/python3.13/site-packages/pdm/cli/commands/new.py"
Changes to packages/core2-64-poky-linux/python3-pdm (sysroot):
  /usr/lib/python3.13/site-packages/pdm-2.23.1.dist-info moved to /usr/lib/python3.13/site-packages/pdm-2.24.1.dist-info
  /usr/lib/python3.13/site-packages/pdm/cli/commands/new.py was added
  /usr/lib/python3.13/site-packages/pdm/cli/commands/__pycache__/new.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/cli/templates/minimal/.gitignore was added
  /usr/lib/python3.13/site-packages/pdm/formats/__pycache__/pylock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pdm/formats/pylock.py was added

--===============3318947948048131974==--

