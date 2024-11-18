Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D7BD60058
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 21:17:10 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.4806.1731964626975460625
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Nov 2024 13:17:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=S4ii/8G8;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=acecbOqW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101934122e5ba-4f79d294-f3d2-4d7b-983e-f3481abbe684-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1731964626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OaMVvg9RA5U+7OLU4bzaTm5Felmrj+EG3E7YCq94AbM=;
	b=S4ii/8G8mIsE5prsrdw6hX0SRxXaooBs/SkhsItrokBtDMVmVR1Fp7B2KqAODhf5
	GsKCIyGo47yiF/wwOZTk2P4/roBVf7NLa7W4okt+H0Zdmfih/M3Az1Ue/1TKglcYIbM
	eTgPvPgo6RHbf6yOAZWjwyZvcWzcTZqHAgy1p18Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1731964626;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OaMVvg9RA5U+7OLU4bzaTm5Felmrj+EG3E7YCq94AbM=;
	b=acecbOqWcWdg8QQCmQYcii9RV7xHd3q0Q6xrEQwmrkRmn1WQaY7fhwPgfouyupTV
	msqEBpmH4XtfivThNXT2Jj0VhudllLXiQq7Jxeg/h0Itzbr6OCEblMrW0XVfOjeQFM1
	pW7iUEqFC9OO64pZAbShPfRVk6Njl0LyiOd4rEJk=
Content-Type: multipart/mixed; boundary="===============0065635231041996488=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-flit-core: upgrading to 3.10.1 SUCCEEDED
Message-ID: <010101934122e5ba-4f79d294-f3d2-4d7b-983e-f3481abbe684-000000@us-west-2.amazonses.com>
Date: Mon, 18 Nov 2024 21:17:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.11.18-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Nov 2024 21:17:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207276

--===============0065635231041996488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-flit-core* to *3.10.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-flit-core-upgrade-3.9.0-3.10.1.patch
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
From 76e4baa9c98c54603b5a848a6b89bb5a3eb2ff6d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 16 Nov 2024 21:04:49 +0000
Subject: [PATCH] python3-flit-core: upgrade 3.9.0 -> 3.10.1

---
 .../{python3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-flit-core_3.9.0.bb => python3-flit-core_3.10.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
rename to meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
index b0bef4b6b6..acd2f866f7 100644
--- a/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb
+++ b/meta/recipes-devtools/python/python3-flit-core_3.10.1.bb
@@ -8,7 +8,7 @@ BUGTRACKER = "https://github.com/pypa/flit/issues"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=41eb78fa8a872983a882c694a8305f08"
 
-SRC_URI[sha256sum] = "d75edf5eb324da20d53570a6a6f87f51e606eee8384925cd66a90611140844c7"
+SRC_URI[sha256sum] = "9c6258ae76d218ce60f9e39a43ca42006a3abcc5c44ea6bb2a1daa13857a8f1a"
 
 inherit pypi python_flit_core
 
-- 
2.44.1


--===============0065635231041996488==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-flit-core-upgrade-3.9.0-3.10.1.patch"

RnJvbSA3NmU0YmFhOWM5OGM1NDYwM2I1YTg0OGE2Yjg5YmI1YTNlYjJmZjZkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTYgTm92IDIwMjQgMjE6MDQ6NDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWZsaXQtY29yZTogdXBncmFkZSAzLjkuMCAtPiAzLjEwLjEKCi0tLQogLi4uL3tweXRo
b24zLWZsaXQtY29yZV8zLjkuMC5iYiA9PiBweXRob24zLWZsaXQtY29yZV8zLjEwLjEuYmJ9IHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5h
bWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1mbGl0LWNvcmVfMy45LjAu
YmIgPT4gcHl0aG9uMy1mbGl0LWNvcmVfMy4xMC4xLmJifSAoOTIlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1mbGl0LWNvcmVfMy45LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuMTAuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDkyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0
aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtZmxpdC1jb3JlXzMuMTAuMS5iYgppbmRleCBiMGJlZjRiNmI2
Li5hY2QyZjg2NmY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5
dGhvbjMtZmxpdC1jb3JlXzMuOS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1mbGl0LWNvcmVfMy4xMC4xLmJiCkBAIC04LDcgKzgsNyBAQCBCVUdUUkFDS0VS
ID0gImh0dHBzOi8vZ2l0aHViLmNvbS9weXBhL2ZsaXQvaXNzdWVzIgogTElDRU5TRSA9ICJCU0Qt
My1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT00MWViNzhm
YThhODcyOTgzYTg4MmM2OTRhODMwNWYwOCIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ3NWVk
ZjVlYjMyNGRhMjBkNTM1NzBhNmE2Zjg3ZjUxZTYwNmVlZTgzODQ5MjVjZDY2YTkwNjExMTQwODQ0
YzciCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWM2MjU4YWU3NmQyMThjZTYwZjllMzlhNDNjYTQy
MDA2YTNhYmNjNWM0NGVhNmJiMmExZGFhMTM4NTdhOGYxYSIKIAogaW5oZXJpdCBweXBpIHB5dGhv
bl9mbGl0X2NvcmUKIAotLSAKMi40NC4xCgo=

--===============0065635231041996488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-tests: PKGSIZE changed from 81152 to 0 (-100%)
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-tests: FILELIST: removed all items "/usr/lib/python3.13/site-packages/flit_core/tests/samples/invalid_version1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/foo.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/test_versionno.py /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_common.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/module1a.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-extra-envmark.toml /usr/lib/python3.13/site-packages/flit_co
 re/tests/samples/ns1-pkg/EG_README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/missing-description-file.toml /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_versionno.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/__pycache__/module1a.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/LICENSE /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/LICENSE /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/misspelled-key.toml /usr/lib/python3.13/site-packages/fl
 it_core/tests/samples/moduleunimportable.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1/foo.1 /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/EG_README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportabledouble.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir/test.md /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/pyproject.toml /usr/lib/python3.13/site
 -packages/flit_core/tests/samples/requires-dev.toml /usr/lib/python3.13/site-packages/flit_core/tests/test_build_thyself.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras.toml /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_build_thyself.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/module2.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/__pycache__/my_python_module.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_config.cpython-313.pyc /usr/lib/python3.13/site-pac
 kages/flit_core/tests/samples/conflicting_modules/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/my_python_module.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/module2.py /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_buildapi.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/LICENSE /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras-dev-conflict.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/test.txt /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/_ve
 rsion.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring-pkg.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.txt /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/test_common.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/bad-description-ext.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/foo.cpython-313.pyc /usr/lib/python3.
 13/site-packages/flit_core/tests/samples/pep621_nodynamic/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-requests.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/test_config.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/invalid_version1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-envmark.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/module1.py /usr/lib/python3.13/site-packages/flit_core
 /tests/samples/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES/README /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/no_docstring.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/my-description.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/moduleunimportabledouble.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/test_wheel.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/_version.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/moduleunimportable.cpython-313.pyc /usr/lib/python3.13/site-pac
 kages/flit_core/tests/__pycache__/test_sdist.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_wheel.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/test_sdist.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir/test.json /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir/foo.sh /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.ini /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/test_buildapi.py"
Changes to packages/core2-64-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/RECORD was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/RECORD was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.13/site-packages/flit_core/tests was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_buildapi.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_build_thyself.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_common.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_config.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_sdist.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_versionno.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_wheel.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/bad-description-ext.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras-dev-conflict.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/_version.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/_version.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir/test.md was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES/README was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/invalid_version1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/missing-description-file.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/misspelled-key.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.ini was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module2.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportabledouble.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportable.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/my-description.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/my_python_module.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/__pycache__/my_python_module.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir/foo.sh was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/foo.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/foo.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir/test.json was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/module1a.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/__pycache__/module1a.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/invalid_version1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/module2.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/moduleunimportable.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/moduleunimportabledouble.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/no_docstring.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-dev.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-extra-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-requests.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1/foo.1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_buildapi.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_build_thyself.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_common.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_config.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_sdist.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_versionno.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_wheel.py was removed
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/RECORD was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/RECORD was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.13/site-packages/flit_core/tests was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/bad-description-ext.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras-dev-conflict.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/_version.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir/test.md was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES/README was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/invalid_version1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/missing-description-file.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/misspelled-key.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.ini was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module2.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportabledouble.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportable.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/my-description.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/my_python_module.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir/foo.sh was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/foo.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir/test.json was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/module1a.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-dev.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-extra-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-requests.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1/foo.1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_buildapi.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_build_thyself.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_common.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_config.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_sdist.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_versionno.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_wheel.py was removed

--===============0065635231041996488==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-flit-core: SRC_URI changed from "https://files.pythonhosted.org/packages/source/f/flit/flit-3.9.0.tar.gz;downloadfilename=flit-3.9.0.tar.gz" to "https://files.pythonhosted.org/packages/source/f/flit/flit-3.10.1.tar.gz;downloadfilename=flit-3.10.1.tar.gz"
packages/core2-64-poky-linux/python3-flit-core: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-dbg: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-dbg: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-dev: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-dev: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-doc: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-doc: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-locale: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-locale: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-src: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-src: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-staticdev: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-staticdev: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-tests: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-tests: FILELIST: removed all items "/usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/moduleunimportable.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/module2.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/__pycache__/module1a.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/_version.py /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__
 /__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/test_versionno.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/module1a.py /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_sdist.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_wheel.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir/test.json /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES/README /usr/lib/python3.13/site-packages/flit_core/tests/samples/EG_README.rst /usr/lib/python3.13/site-packages/flit_core/tests/test_build_thyself.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycac
 he__/moduleunimportabledouble.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-requests.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.rst /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_build_thyself.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring-pkg.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/LICENSE /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/LICENSE /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/test_config.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/__pycache__/my_python_module.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/te
 sts/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportable.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/test_common.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/my-description.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_config.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-pack
 ages/flit_core/tests/samples/__pycache__/module2.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/EG_README.rst /usr/lib/python3.13/site-packages/flit_core/tests/samples/invalid_version1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-envmark.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/test.txt /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/_version.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/s
 amples/normalization/my_python_module.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/bad-description-ext.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/foo.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/no_docstring.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/LICENSE /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-dev.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/test_wheel.py /usr/lib/python3.13/site-packages/flit_core/t
 ests/samples/ns1-pkg/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1/foo.1 /usr/lib/python3.13/site-packages/flit_core/tests/test_sdist.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/foo.py /usr/lib/python3.13/site-packages/flit_core/tests/test_buildapi.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir/foo.sh /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/misspelled-key.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir/test.md /usr/lib/python3.13/si
 te-packages/flit_core/tests/samples/pep517/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_common.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-extra-envmark.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/__pycache__/module1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportabledouble.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.ini /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/__pycache__/module1.cpython-313.pyc /usr/l
 ib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras-dev-conflict.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/invalid_version1.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.txt /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_versionno.cpython-313.pyc /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/pyproject.toml /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__init__.py /usr/lib/python3.13/site-packages/flit_core/tests/samples/missing-description-file.toml /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_buildapi.cpython-313.pyc"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-tests: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core-tests: PKGSIZE changed from 81152 to 0 (-100%)
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core: PKGV changed from 3.9.0 [default] to 3.10.1 [default]
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core: PV changed from "3.9.0" to "3.10.1"
packages/core2-64-poky-linux/python3-flit-core/python3-flit-core: PKGSIZE changed from 227278 to 228570 (+1%)
Changes to packages/core2-64-poky-linux/python3-flit-core (sysroot):
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/RECORD was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/RECORD was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.13/site-packages/flit_core/tests was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_buildapi.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_build_thyself.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_common.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_config.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_sdist.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_versionno.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__pycache__/test_wheel.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/bad-description-ext.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras-dev-conflict.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__pycache__/_version.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/_version.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir/test.md was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES/README was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/invalid_version1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/missing-description-file.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/misspelled-key.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.ini was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module2.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportabledouble.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportable.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/my-description.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/my_python_module.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/__pycache__/my_python_module.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir/foo.sh was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/foo.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/foo.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir/test.json was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/module1a.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/__pycache__/module1a.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/invalid_version1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/module2.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/moduleunimportable.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/moduleunimportabledouble.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/__pycache__/no_docstring.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-dev.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-extra-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-requests.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1/foo.1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/__pycache__ was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/__pycache__/module1.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_buildapi.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_build_thyself.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_common.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_config.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_sdist.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_versionno.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_wheel.py was removed
Changes to packages/x86_64-linux/python3-flit-core-native (sysroot):
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/LICENSE was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/RECORD was added
  /usr/lib/python3.13/site-packages/flit_core-3.10.1.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/RECORD was removed
  /usr/lib/python3.13/site-packages/flit_core-3.9.0.dist-info/WHEEL was removed
  /usr/lib/python3.13/site-packages/flit_core/tests was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/bad-description-ext.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/conflicting_modules/src/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/constructed_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras-dev-conflict.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/extras.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/package1/_version.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/imported_version/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/subsubdir/test.md was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/subdir/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/doc/test.txt was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/LICENSES/README was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/inclusion/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/invalid_version1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/missing-description-file.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/misspelled-key.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.ini was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/module2.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportabledouble.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/moduleunimportable.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/my-description.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring-pkg.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/no_docstring.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/my_python_module.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/normalization/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/EG_README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/ns1/pkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/ns1-pkg/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/data_dir/foo.sh was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/foo.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg2/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/__init__.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1/subpkg/sp_data_dir/test.json was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/package1.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep517/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/module1a.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621_nodynamic/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/pep621/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-dev.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-extra-envmark.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/requires-requests.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/data/share/man/man1/foo.1 was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/LICENSE was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/module1.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/pyproject.toml was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/samples/with_data_dir/README.rst was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_buildapi.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_build_thyself.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_common.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_config.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_sdist.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_versionno.py was removed
  /usr/lib/python3.13/site-packages/flit_core/tests/test_wheel.py was removed

--===============0065635231041996488==--

