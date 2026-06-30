Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75AEC43327
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 05:52:37 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15162.1782798751211445206
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 22:52:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ma6U1yWi;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=Op08n+dh;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019f17161158-bc8d52c4-6008-40be-aa30-ac6aea8468c7-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Eo+dundNOI3jceJh9gAcScrKKFawKoj1qMvqfdmpD/A=;
	b=Ma6U1yWi9CKNo9bf6RI4/ekPx0mrLP1kfe35vjGoe29VlkirbKVMZ8FZGF9aQtXr
	+iRK+VXeujjWevFESb7vSD7FPMD/wx+dNJiUz0uQ9XF15LTQcO34qB3kWjp6ex1rXUv
	R/bNgZj1aoHs94MDm2PWV4bO49XnwoXOqk/s38+k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1782798750;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Eo+dundNOI3jceJh9gAcScrKKFawKoj1qMvqfdmpD/A=;
	b=Op08n+dhetOw6DuEg0kLBiGPmxBtn5ABLx9fo8oYQ5fhkOCmPDLVa2YVd2aE7JjW
	6rxIuM4//jJXV6eJI4IoAWO3wGjsQh52DxCf+0HRs5PFbEQ+JdgAHhGy2w+OXrsI64k
	dc2X5ys/wZyLhIgThlnFhrx1UnKqGnYWH1C8UWF8=
Content-Type: multipart/mixed; boundary="===============6654650068588228578=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-wcwidth: upgrading to 0.8.2 SUCCEEDED
Message-ID: <0101019f17161158-bc8d52c4-6008-40be-aa30-ac6aea8468c7-000000@us-west-2.amazonses.com>
Date: Tue, 30 Jun 2026 05:52:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.30-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2026 05:52:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239846

--===============6654650068588228578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-wcwidth* to *0.8.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-wcwidth-upgrade-0.8.1-0.8.2.patch
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
From 087cf03d7e273a2b532a702d6c8621f16ec65369 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 30 Jun 2026 05:22:40 +0000
Subject: [PATCH] python3-wcwidth: upgrade 0.8.1 -> 0.8.2

---
 .../{python3-wcwidth_0.8.1.bb => python3-wcwidth_0.8.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-wcwidth_0.8.1.bb => python3-wcwidth_0.8.2.bb} (84%)

diff --git a/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb b/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
similarity index 84%
rename from meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
rename to meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
index 9b306225d9..d5867ef9b8 100644
--- a/meta/recipes-devtools/python/python3-wcwidth_0.8.1.bb
+++ b/meta/recipes-devtools/python/python3-wcwidth_0.8.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/jquast/wcwidth"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b15979c39a2543892fca8cd86b4b52cb"
 
-SRC_URI[sha256sum] = "faf5b4a5366a72dc49cad48cdf21f52bdf63bdda995178e483ba247ff79089b9"
+SRC_URI[sha256sum] = "91fbef97204b96a3d4d421609b80340b760cf33e26da123ff243d76b1fda8dda"
 
 inherit pypi python_hatchling ptest-python-pytest
 
-- 
2.47.1


--===============6654650068588228578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth: SRC_URI changed from "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.8.1.tar.gz;downloadfilename=wcwidth-0.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/w/wcwidth/wcwidth-0.8.2.tar.gz;downloadfilename=wcwidth-0.8.2.tar.gz"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dbg: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-dev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-doc: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-locale: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-ptest: PKGSIZE changed from 193807 to 194309 (+0%)
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-src: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth-staticdev: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PV changed from "0.8.1" to "0.8.2"
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGV changed from 0.8.1 [default] to 0.8.2 [default]
packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: PKGSIZE changed from 4375331 to 4375656 (+0%)
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-1.1.1.dist-info
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/_discover_vcs.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/_jj.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/__pycache__/_discover_vcs.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/__pycache__/_jj.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_environment.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_fallback_workdir.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/_jj.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/__pycache__/_jj.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_legacy_parse.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_paths.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_project_overrides.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_protocols.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_environment.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_fallback_workdir.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_legacy_parse.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_paths.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_project_overrides.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_protocols.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_scm_metadata.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_version_fields.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_worktree_discovery.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/py.typed was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_scm_metadata.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_version_fields.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_worktree_discovery.py was removed

--===============6654650068588228578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-wcwidth/python3-wcwidth: FILELIST: directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info -> /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info/licenses
Changes to packages/x86-64-v3-poky-linux/python3-wcwidth (sysroot):
  /usr/lib/python3.14/site-packages/wcwidth-0.8.1.dist-info moved to /usr/lib/python3.14/site-packages/wcwidth-0.8.2.dist-info
Changes to packages/x86_64-linux/python3-vcs-versioning-native (sysroot):
  /usr/lib/python3.14/site-packages/vcs_versioning-2.2.2.dist-info moved to /usr/lib/python3.14/site-packages/vcs_versioning-1.1.1.dist-info
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/_discover_vcs.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/_jj.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/__pycache__/_discover_vcs.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_backends/__pycache__/_jj.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_environment.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_fallback_workdir.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/_jj.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_file_finders/__pycache__/_jj.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_legacy_parse.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_paths.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_project_overrides.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_protocols.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_environment.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_fallback_workdir.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_legacy_parse.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_paths.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_project_overrides.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_protocols.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_scm_metadata.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_version_fields.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/__pycache__/_worktree_discovery.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/py.typed was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_scm_metadata.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_version_fields.py was removed
  /usr/lib/python3.14/site-packages/vcs_versioning/_worktree_discovery.py was removed

--===============6654650068588228578==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-wcwidth-upgrade-0.8.1-0.8.2.patch"

RnJvbSAwODdjZjAzZDdlMjczYTJiNTMyYTcwMmQ2Yzg2MjFmMTZlYzY1MzY5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMzAgSnVuIDIwMjYgMDU6MjI6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXdjd2lkdGg6IHVwZ3JhZGUgMC44LjEgLT4gMC44LjIKCi0tLQogLi4uL3tweXRob24z
LXdjd2lkdGhfMC44LjEuYmIgPT4gcHl0aG9uMy13Y3dpZHRoXzAuOC4yLmJifSAgICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy13Y3dpZHRoXzAuOC4xLmJiID0+
IHB5dGhvbjMtd2N3aWR0aF8wLjguMi5iYn0gKDg0JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjguMS5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13Y3dpZHRoXzAuOC4yLmJiCnNpbWlsYXJpdHkgaW5k
ZXggODQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy13
Y3dpZHRoXzAuOC4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtd2N3aWR0aF8wLjguMi5iYgppbmRleCA5YjMwNjIyNWQ5Li5kNTg2N2VmOWI4IDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8wLjgu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtd2N3aWR0aF8w
LjguMi5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2px
dWFzdC93Y3dpZHRoIgogTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9MSUNFTlNFO21kNT1iMTU5NzljMzlhMjU0Mzg5MmZjYThjZDg2YjRiNTJjYiIKIAotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImZhZjViNGE1MzY2YTcyZGM0OWNhZDQ4Y2RmMjFmNTJiZGY2M2JkZGE5
OTUxNzhlNDgzYmEyNDdmZjc5MDg5YjkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOTFmYmVmOTcy
MDRiOTZhM2Q0ZDQyMTYwOWI4MDM0MGI3NjBjZjMzZTI2ZGExMjNmZjI0M2Q3NmIxZmRhOGRkYSIK
IAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcgcHRlc3QtcHl0aG9uLXB5dGVzdAogCi0t
IAoyLjQ3LjEKCg==

--===============6654650068588228578==--

