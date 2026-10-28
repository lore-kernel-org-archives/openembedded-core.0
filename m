Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36891.1793167562239435057
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 23:06:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=FIqiO5Y3;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=4SI5t0vC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101a1811d91f3-81ffa0c2-794a-4aab-a3ae-4a580f73cdc3-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=VsnJm1+QckZkEvV5U4xJNyLB2CWO6s9t2GH01mJmgEg=;
	b=FIqiO5Y33GGY7/VDt3+YbsyzDdsJmSLhb9VECKmEW+etOZxw9mZTne7ziM9wxH59
	tQBkhXzwkI2wo9uiAIgmZZstjGuwgzDX+gWM5gVvFkgwxQtdTPSiV3wWk0dshiF5hz+
	zLpgIu9wBzY07OTpI/O/wesyyc8RasnxdYULqIbs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1793167561;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=VsnJm1+QckZkEvV5U4xJNyLB2CWO6s9t2GH01mJmgEg=;
	b=4SI5t0vCrbtv0vaa1vtTwmrM0j40ZrUy6zN22fFm0OAAO8iNb0h8lRfIN9Sziy37
	jw2uBhq1VtiFgooM6hLfbKO4qoZ1JQ1ylaKhNEZxpsZsA9F31knxbkci5zJUC1MNF1g
	ho4Jb7rn5PjBr2DCtgImQ6Hps00UDMbMzGYGh738=
Content-Type: multipart/mixed; boundary="===============7939403425353266363=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 9.2.0 SUCCEEDED
Message-ID: <010101a1811d91f3-81ffa0c2-794a-4aab-a3ae-4a580f73cdc3-000000@us-west-2.amazonses.com>
Date: Wed, 28 Oct 2026 06:06:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.10.28-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 06:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248777

--===============7939403425353266363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pytest* to *9.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-9.1.1-9.2.0.patch
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
From 8ec63d635b9eb99c2dc39a78f494fe3b66b4f501 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 28 Oct 2026 05:57:40 +0000
Subject: [PATCH] python3-pytest: upgrade 9.1.1 -> 9.2.0

pytest-9.2.0
=======================================

The pytest team is proud to announce the 9.2.0 release!

This release contains new features, improvements, and bug fixes,
the full list of changes is available in the changelog:

    https://docs.pytest.org/en/stable/changelog.html
For complete documentation, please visit:
    https://docs.pytest.org/en/stable/
As usual, you can upgrade from PyPI via:
    pip install -U pytest
Thanks to all of the contributors to this release:

Happy testing,
The pytest Development Team
---
 .../python/{python3-pytest_9.1.1.bb => python3-pytest_9.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_9.1.1.bb => python3-pytest_9.2.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-pytest_9.1.1.bb b/meta/recipes-devtools/python/python3-pytest_9.2.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-pytest_9.1.1.bb
rename to meta/recipes-devtools/python/python3-pytest_9.2.0.bb
index 8c97596ccc..bd580dabd6 100644
--- a/meta/recipes-devtools/python/python3-pytest_9.1.1.bb
+++ b/meta/recipes-devtools/python/python3-pytest_9.2.0.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "1088fbde8f2b49d95a549a195707afa7a76a3ce9bcadc26b6d71f0ffda5fe313"
+SRC_URI[sha256sum] = "97c4f3b1f3c7414aa36465e09b8220f1d03627993bd51b1282e193753c80557b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.47.1


--===============7939403425353266363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-pytest: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-9.1.1.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-9.2.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-pytest: PV changed from "9.1.1" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "9.1.1" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "9.1.1" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "9.1.1" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "9.1.1" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-src: PV changed from "9.1.1" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "9.1.1" to "9.2.0"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGV changed from 9.1.1 [default] to 9.2.0 [default]
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytest-9.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytest-9.2.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/pytest-9.1.1.dist-info -> /usr/lib/python3.14/site-packages/pytest-9.2.0.dist-info, removed "/usr/lib/python3.14/site-packages/_pytest/__pycache__/python_api.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/python_api.py", added "/usr/lib/python3.14/site-packages/_pytest/nodeid.py /usr/lib/python3.14/site-packages/_pytest/__pycache__/approx.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/__pycache__/nodeid.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/approx.py"
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 3278569 to 3456629 (+5%)
packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: PV changed from "9.1.1" to "9.2.0"
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.14/site-packages/pytest-9.1.1.dist-info moved to /usr/lib/python3.14/site-packages/pytest-9.2.0.dist-info
  /usr/lib/python3.14/site-packages/_pytest/approx.py was added
  /usr/lib/python3.14/site-packages/_pytest/nodeid.py was added
  /usr/lib/python3.14/site-packages/_pytest/__pycache__/approx.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/__pycache__/nodeid.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/__pycache__/python_api.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/_pytest/python_api.py was removed

--===============7939403425353266363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-pytest-changelog.txt"

pytest-9.2.0
=======================================

The pytest team is proud to announce the 9.2.0 release!

This release contains new features, improvements, and bug fixes,
the full list of changes is available in the changelog:

    https://docs.pytest.org/en/stable/changelog.html
For complete documentation, please visit:
    https://docs.pytest.org/en/stable/
As usual, you can upgrade from PyPI via:
    pip install -U pytest
Thanks to all of the contributors to this release:

Happy testing,
The pytest Development Team

--===============7939403425353266363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-pytest/python3-pytest: FILELIST: directory renamed /usr/lib/python3.14/site-packages/pytest-9.1.1.dist-info -> /usr/lib/python3.14/site-packages/pytest-9.2.0.dist-info, directory renamed /usr/lib/python3.14/site-packages/pytest-9.1.1.dist-info/licenses -> /usr/lib/python3.14/site-packages/pytest-9.2.0.dist-info/licenses, removed "/usr/lib/python3.14/site-packages/_pytest/python_api.py /usr/lib/python3.14/site-packages/_pytest/__pycache__/python_api.cpython-314.pyc", added "/usr/lib/python3.14/site-packages/_pytest/approx.py /usr/lib/python3.14/site-packages/_pytest/__pycache__/nodeid.cpython-314.pyc /usr/lib/python3.14/site-packages/_pytest/nodeid.py /usr/lib/python3.14/site-packages/_pytest/__pycache__/approx.cpython-314.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.14/site-packages/pytest-9.1.1.dist-info moved to /usr/lib/python3.14/site-packages/pytest-9.2.0.dist-info
  /usr/lib/python3.14/site-packages/_pytest/approx.py was added
  /usr/lib/python3.14/site-packages/_pytest/nodeid.py was added
  /usr/lib/python3.14/site-packages/_pytest/__pycache__/approx.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/__pycache__/nodeid.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/_pytest/__pycache__/python_api.cpython-314.pyc was removed
  /usr/lib/python3.14/site-packages/_pytest/python_api.py was removed

--===============7939403425353266363==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-9.1.1-9.2.0.patch"

RnJvbSA4ZWM2M2Q2MzViOWViOTljMmRjMzlhNzhmNDk0ZmUzYjY2YjRmNTAxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjggT2N0IDIwMjYgMDU6NTc6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA5LjEuMSAtPiA5LjIuMAoKcHl0ZXN0LTkuMi4wCj09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQoKVGhlIHB5dGVzdCB0ZWFtIGlzIHBy
b3VkIHRvIGFubm91bmNlIHRoZSA5LjIuMCByZWxlYXNlIQoKVGhpcyByZWxlYXNlIGNvbnRhaW5z
IG5ldyBmZWF0dXJlcywgaW1wcm92ZW1lbnRzLCBhbmQgYnVnIGZpeGVzLAp0aGUgZnVsbCBsaXN0
IG9mIGNoYW5nZXMgaXMgYXZhaWxhYmxlIGluIHRoZSBjaGFuZ2Vsb2c6CgogICAgaHR0cHM6Ly9k
b2NzLnB5dGVzdC5vcmcvZW4vc3RhYmxlL2NoYW5nZWxvZy5odG1sCkZvciBjb21wbGV0ZSBkb2N1
bWVudGF0aW9uLCBwbGVhc2UgdmlzaXQ6CiAgICBodHRwczovL2RvY3MucHl0ZXN0Lm9yZy9lbi9z
dGFibGUvCkFzIHVzdWFsLCB5b3UgY2FuIHVwZ3JhZGUgZnJvbSBQeVBJIHZpYToKICAgIHBpcCBp
bnN0YWxsIC1VIHB5dGVzdApUaGFua3MgdG8gYWxsIG9mIHRoZSBjb250cmlidXRvcnMgdG8gdGhp
cyByZWxlYXNlOgoKSGFwcHkgdGVzdGluZywKVGhlIHB5dGVzdCBEZXZlbG9wbWVudCBUZWFtCi0t
LQogLi4uL3B5dGhvbi97cHl0aG9uMy1weXRlc3RfOS4xLjEuYmIgPT4gcHl0aG9uMy1weXRlc3Rf
OS4yLjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1weXRl
c3RfOS4xLjEuYmIgPT4gcHl0aG9uMy1weXRlc3RfOS4yLjAuYmJ9ICg5MSUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF85LjEuMS5iYiBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfOS4yLjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXB5dGVzdF85LjEuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLXB5dGVzdF85LjIuMC5iYgppbmRleCA4Yzk3NTk2Y2NjLi5iZDU4MGRh
YmQ2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0
ZXN0XzkuMS4xLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1w
eXRlc3RfOS4yLjAuYmIKQEAgLTUsNyArNSw3IEBAIERFU0NSSVBUSU9OID0gIlRoZSBweXRlc3Qg
ZnJhbWV3b3JrIG1ha2VzIGl0IGVhc3kgdG8gd3JpdGUgc21hbGwgdGVzdHMsIHlldCBzY2FsCiBM
SUNFTlNFID0gIk1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWJk
MjdlNDFiNjU1MGZlMGZjNDUzNTZkMWQ4MWVlMzdjIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAi
MTA4OGZiZGU4ZjJiNDlkOTVhNTQ5YTE5NTcwN2FmYTdhNzZhM2NlOWJjYWRjMjZiNmQ3MWYwZmZk
YTVmZTMxMyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICI5N2M0ZjNiMWYzYzc0MTRhYTM2NDY1ZTA5
YjgyMjBmMWQwMzYyNzk5M2JkNTFiMTI4MmUxOTM3NTNjODA1NTdiIgogCiBERVBFTkRTICs9ICJw
eXRob24zLXNldHVwdG9vbHMtc2NtLW5hdGl2ZSIKIAotLSAKMi40Ny4xCgo=

--===============7939403425353266363==--
