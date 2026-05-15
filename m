Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5A1CD343F
	for <webhook@archiver.kernel.org>; Fri, 15 May 2026 13:20:33 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34763.1778851231778229599
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2026 06:20:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=g712qMbu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=tTeYXVWZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 0101019e2bcbb5c8-bd568206-9476-46f9-b3ab-bfce65039e24-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1778851231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=nXcEnqIGmLSGRCyYC0meGydwdvNiSnK5irO1xyisd+8=;
	b=g712qMbu96BzU0Dbu2o6JVQxlEAZcugQ4Tr1ykb6mDcr+LwSSL1lCLVKh+zS8pPi
	VgHt3S2wMydySNn381OLM8i8ufBvBmHbIqYwRSjO0VcdHsvyi14DuZDNoev9LDQCE0P
	/Tz4ao+lC757W7UJqqcWGMnh5KlBJvCtlpu4TJRw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1778851231;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=nXcEnqIGmLSGRCyYC0meGydwdvNiSnK5irO1xyisd+8=;
	b=tTeYXVWZkJd0nDSi8SZamMFz1WGZgBYk64iFXx9fpYeee15tDFuQc/7xs1dkzwDh
	yO06JJdL54Z1rlpRQ7nYR8CknERDI4YW8ZFqzohD/2t4MMHyd6TbTy/Weos0KUBGYYu
	ZfaS9WYaZ9bQSlqklv1Zlg0VxPIMYlqQGwOBAPVg=
Content-Type: multipart/mixed; boundary="===============4974019278205786268=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-packaging: upgrading to 26.2 SUCCEEDED
Message-ID: <0101019e2bcbb5c8-bd568206-9476-46f9-b3ab-bfce65039e24-000000@us-west-2.amazonses.com>
Date: Fri, 15 May 2026 13:20:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.05.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 May 2026 13:20:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237117

--===============4974019278205786268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-packaging* to *26.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-packaging-upgrade-26.0-26.2.patch
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
From b121122fb2b01c58557203d7f37a6ac6ec881ead Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 May 2026 08:39:14 +0000
Subject: [PATCH] python3-packaging: upgrade 26.0 -> 26.2

---
 .../{python3-packaging_26.0.bb => python3-packaging_26.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-packaging_26.0.bb => python3-packaging_26.2.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-packaging_26.0.bb b/meta/recipes-devtools/python/python3-packaging_26.2.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-packaging_26.0.bb
rename to meta/recipes-devtools/python/python3-packaging_26.2.bb
index ff45cb5133..1e4c0a6bd3 100644
--- a/meta/recipes-devtools/python/python3-packaging_26.0.bb
+++ b/meta/recipes-devtools/python/python3-packaging_26.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "00243ae351a257117b6a241061796684b084ed1c516a08c48a3f7e147a9d80b4"
+SRC_URI[sha256sum] = "ff452ff5a3e828ce110190feff1178bb1f2ea2281fa2075aadb987c2fb221661"
 
 SRC_URI += "file://run-ptest.in"
 
-- 
2.47.1


--===============4974019278205786268==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-packaging-upgrade-26.0-26.2.patch"

RnJvbSBiMTIxMTIyZmIyYjAxYzU4NTU3MjAzZDdmMzdhNmFjNmVjODgxZWFkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWF5IDIwMjYgMDg6Mzk6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXBhY2thZ2luZzogdXBncmFkZSAyNi4wIC0+IDI2LjIKCi0tLQogLi4uL3tweXRob24z
LXBhY2thZ2luZ18yNi4wLmJiID0+IHB5dGhvbjMtcGFja2FnaW5nXzI2LjIuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1wYWNrYWdpbmdfMjYuMC5iYiA9
PiBweXRob24zLXBhY2thZ2luZ18yNi4yLmJifSAoOTQlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMC5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMi5iYgpzaW1pbGFyaXR5
IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhv
bjMtcGFja2FnaW5nXzI2LjAuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRo
b24vcHl0aG9uMy1wYWNrYWdpbmdfMjYuMi5iYgppbmRleCBmZjQ1Y2I1MTMzLi4xZTRjMGE2YmQz
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGFja2Fn
aW5nXzI2LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBh
Y2thZ2luZ18yNi4yLmJiCkBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1
Yi5jb20vcHlwYS9wYWNrYWdpbmciCiBMSUNFTlNFID0gIkFwYWNoZS0yLjAgfCBCU0QtMi1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1mYWFkYWVkY2E5MjUx
YTkwYjIwNWM5MTY3NTc4Y2U5MSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjAwMjQzYWUzNTFh
MjU3MTE3YjZhMjQxMDYxNzk2Njg0YjA4NGVkMWM1MTZhMDhjNDhhM2Y3ZTE0N2E5ZDgwYjQiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmY0NTJmZjVhM2U4MjhjZTExMDE5MGZlZmYxMTc4YmIxZjJl
YTIyODFmYTIwNzVhYWRiOTg3YzJmYjIyMTY2MSIKIAogU1JDX1VSSSArPSAiZmlsZTovL3J1bi1w
dGVzdC5pbiIKIAotLSAKMi40Ny4xCgo=

--===============4974019278205786268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/all-poky-linux/ca-certificates/ca-certificates-dev: FILES: removed "/lib/*.la /lib/lib*.so /lib/*.o"
packages/all-poky-linux/ca-certificates/ca-certificates-staticdev: FILES: removed "/lib/*.a"
packages/all-poky-linux/ca-certificates/ca-certificates: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/all-poky-linux/tzdata/tzdata: FILES: removed "/bin/* /lib/*.so.* /sbin/*", added "/usr/lib/*.so.*"
packages/x86-64-v3-poky-linux/python3-packaging: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.0.tar.gz;downloadfilename=packaging-26.0.tar.gz file://run-ptest.in" to "https://files.pythonhosted.org/packages/source/p/packaging/packaging-26.2.tar.gz;downloadfilename=packaging-26.2.tar.gz file://run-ptest.in"
packages/x86-64-v3-poky-linux/python3-packaging: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dbg: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-dev: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-doc: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-locale: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/test_structures.py", added "/usr/lib/python3-packaging/ptest/tests/test_direct_url.py /usr/lib/python3-packaging/ptest/tests/property/test_version_normalization.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_matching.py /usr/lib/python3-packaging/ptest/tests/property/strategies.py /usr/lib/python3-packaging/ptest/tests/test_dependency_groups.py /usr/lib/python3-packaging/ptest/tests/conftest.py /usr/lib/python3-packaging/ptest/tests/property/test_version_format.py /usr/lib/python3-packaging/ptest/tests/property/test_version_ordering.py /usr/lib/python3-packaging/ptest/tests/test_pylock_select.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_comparison.py /usr/lib/python3-packaging/ptest/tests/test_errors.py /usr/lib/python3-packaging/ptest/tests/property/__init__.py /usr/lib/python3-packaging/ptest/tests/property/test_s
 pecifier_extended.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_implied.py /usr/lib/python3-packaging/ptest/tests/property/test_version_releases.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 311714 to 651821 (+109%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-src: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-staticdev: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PV changed from "26.0" to "26.2"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info, directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info/licenses, added "/usr/lib/python3.14/site-packages/packaging/errors.py /usr/lib/python3.14/site-packages/packaging/direct_url.py /usr/lib/python3.14/site-packages/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGV changed from 26.0 [default] to 26.2 [default]
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 602735 to 835406 (+39%)
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added

--===============4974019278205786268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: PKGSIZE changed from 311714 to 651821 (+109%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging-ptest: FILELIST: removed "/usr/lib/python3-packaging/ptest/tests/test_structures.py", added "/usr/lib/python3-packaging/ptest/tests/property/test_specifier_implied.py /usr/lib/python3-packaging/ptest/tests/property/test_version_releases.py /usr/lib/python3-packaging/ptest/tests/property/__init__.py /usr/lib/python3-packaging/ptest/tests/test_errors.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_matching.py /usr/lib/python3-packaging/ptest/tests/property/test_version_ordering.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_extended.py /usr/lib/python3-packaging/ptest/tests/test_pylock_select.py /usr/lib/python3-packaging/ptest/tests/property/test_version_format.py /usr/lib/python3-packaging/ptest/tests/property/test_specifier_comparison.py /usr/lib/python3-packaging/ptest/tests/property/strategies.py /usr/lib/python3-packaging/ptest/tests/conftest.py /usr/lib/python3-packaging/ptest/
 tests/test_dependency_groups.py /usr/lib/python3-packaging/ptest/tests/property/test_version_normalization.py /usr/lib/python3-packaging/ptest/tests/test_direct_url.py"
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: PKGSIZE changed from 602735 to 835406 (+39%)
packages/x86-64-v3-poky-linux/python3-packaging/python3-packaging: FILELIST: directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/packaging-26.0.dist-info -> /usr/lib/python3.14/site-packages/packaging-26.2.dist-info, added "/usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc /usr/lib/python3.14/site-packages/packaging/dependency_groups.py /usr/lib/python3.14/site-packages/packaging/direct_url.py /usr/lib/python3.14/site-packages/packaging/errors.py"
Changes to packages/x86-64-v3-poky-linux/python3-packaging (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added
Changes to packages/x86_64-linux/python3-packaging-native (sysroot):
  /usr/lib/python3.14/site-packages/packaging-26.0.dist-info moved to /usr/lib/python3.14/site-packages/packaging-26.2.dist-info
  /usr/lib/python3.14/site-packages/packaging/dependency_groups.py was added
  /usr/lib/python3.14/site-packages/packaging/direct_url.py was added
  /usr/lib/python3.14/site-packages/packaging/errors.py was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/dependency_groups.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/direct_url.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/packaging/__pycache__/errors.cpython-314.pyc was added

--===============4974019278205786268==--

