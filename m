Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E46C021B6
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 13:21:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.42721.1738416054114536634
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 05:20:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=fEbb7YIX;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=dJKV63QU;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010194c1abdcab-7737cbe6-b7c0-4622-a7f2-7575a79241ad-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1738416053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=FEz5pNPg306k9iCAMTYwM8pbqgNUKc7iJYeM8keFZyo=;
	b=fEbb7YIXhVEXM9FpvKn4j1RNkuSft6A5syuvoPjxEOea11mMOzlQrzEeI5RrKa7O
	QpB2Tf/9yHPCrw90LtHoqGlI0QW20nSx9W4BVc0WEhNT2hARoNwg7IosGQHtjdSetX5
	h8/zguqJYLvCtO8dDOTQDnY5uISEPO/sHcY8+rDQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1738416053;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=FEz5pNPg306k9iCAMTYwM8pbqgNUKc7iJYeM8keFZyo=;
	b=dJKV63QU3uftouM+y8/IvpDdEo2HPrGx5k9p1OkPwbZ75FjgsVSa5Enkk5DbE1M7
	4hKa6Q/SvS6i1R/EAoLczaoyOKCwvDbC3H0r7DFEt1XaISv5H7yCYQRqPNNse6sd8Er
	vdwN5DoVHgIsOsvJgv20OQ2eFKVqRv/A3ySwQ1ZM=
Content-Type: multipart/mixed; boundary="===============0886529575593278677=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Zang Ruochen <zangruochen@loongson.cn>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pip: upgrading to 25.0 SUCCEEDED
Message-ID: <01010194c1abdcab-7737cbe6-b7c0-4622-a7f2-7575a79241ad-000000@us-west-2.amazonses.com>
Date: Sat, 1 Feb 2025 13:20:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.02.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 13:21:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210537

--===============0886529575593278677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pip* to *25.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pip-upgrade-24.3.1-25.0.patch
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
From 61e49c251e40994bb32a7c2e9817858c7c9236f1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 1 Feb 2025 08:14:53 +0000
Subject: [PATCH] python3-pip: upgrade 24.3.1 -> 25.0

---
 .../python/python3-pip/no_shebang_mangling.patch                | 2 +-
 .../python/{python3-pip_24.3.1.bb => python3-pip_25.0.bb}       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-pip_24.3.1.bb => python3-pip_25.0.bb} (96%)

diff --git a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
index f95071bfb2..71836dca07 100644
--- a/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
+++ b/meta/recipes-devtools/python/python3-pip/no_shebang_mangling.patch
@@ -1,4 +1,4 @@
-From 5d0b54ea2aae600a2c3a2b6ec71acf99290640e7 Mon Sep 17 00:00:00 2001
+From a715a622989ac182d18f6f2ada8201122282d889 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 23 Feb 2022 12:27:06 +0000
 Subject: [PATCH] python3-pip: Don't change shebang
diff --git a/meta/recipes-devtools/python/python3-pip_24.3.1.bb b/meta/recipes-devtools/python/python3-pip_25.0.bb
similarity index 96%
rename from meta/recipes-devtools/python/python3-pip_24.3.1.bb
rename to meta/recipes-devtools/python/python3-pip_25.0.bb
index 1fa246e4f1..8908fc9115 100644
--- a/meta/recipes-devtools/python/python3-pip_24.3.1.bb
+++ b/meta/recipes-devtools/python/python3-pip_25.0.bb
@@ -27,7 +27,7 @@ inherit pypi python_setuptools_build_meta
 
 SRC_URI += "file://no_shebang_mangling.patch"
 
-SRC_URI[sha256sum] = "ebcb60557f2aefabc2e0f918751cd24ea0d56d8ec5445fe1807f1d2109660b99"
+SRC_URI[sha256sum] = "8e0a97f7b4c47ae4a494560da84775e9e2f671d415d8d828e052efefb206b30b"
 
 RDEPENDS:${PN} = "\
   python3-compile \
-- 
2.44.1


--===============0886529575593278677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pip: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pip/pip-24.3.1.tar.gz;downloadfilename=pip-24.3.1.tar.gz file://no_shebang_mangling.patch" to "https://files.pythonhosted.org/packages/source/p/pip/pip-25.0.tar.gz;downloadfilename=pip-25.0.tar.gz file://no_shebang_mangling.patch"
packages/core2-64-poky-linux/python3-pip: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip: PV changed from "24.3.1" to "25.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-dbg: PV changed from "24.3.1" to "25.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-dev: PV changed from "24.3.1" to "25.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-doc: PV changed from "24.3.1" to "25.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-locale: PV changed from "24.3.1" to "25.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-src: PV changed from "24.3.1" to "25.0"
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip-staticdev: PV changed from "24.3.1" to "25.0"
packages/core2-64-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info -> /usr/lib/python3.13/site-packages/pip-25.0.dist-info, removed "/usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/_compat.py /usr/lib/python3.13/site-packages/pip/_internal/utils/encoding.py /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/encoding.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/py.typed /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__init__.py /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/_spdx.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/_spdx.py"
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGSIZE changed from 10885186 to 11068145 (+2%)
packages/core2-64-poky-linux/python3-pip/python3-pip: PKGV changed from 24.3.1 [default] to 25.0 [default]
packages/core2-64-poky-linux/python3-pip/python3-pip: PV changed from "24.3.1" to "25.0"
Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/AUTHORS.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__init__.py was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__ was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/_spdx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/_spdx.py was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/py.typed was added
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/AUTHORS.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/encoding.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/encoding.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/_compat.py was removed
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/__pycache__/_compat.cpython-313.pyc was removed

--===============0886529575593278677==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pip/python3-pip: FILELIST: directory renamed /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info -> /usr/lib/python3.13/site-packages/pip-25.0.dist-info, removed "/usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/_compat.py /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/__pycache__/_compat.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_internal/utils/encoding.py /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/encoding.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__init__.py /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/py.typed /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/_spdx.py /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/_spdx.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-pip (sysroot):
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/AUTHORS.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/entry_points.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/LICENSE.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/METADATA was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/top_level.txt was added
  /usr/lib/python3.13/site-packages/pip-25.0.dist-info/WHEEL was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__init__.py was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__ was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/__pycache__/_spdx.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/pip/_vendor/packaging/licenses/_spdx.py was added
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/py.typed was added
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/AUTHORS.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/entry_points.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/LICENSE.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/METADATA was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/top_level.txt was removed
  /usr/lib/python3.13/site-packages/pip-24.3.1.dist-info/WHEEL was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/encoding.py was removed
  /usr/lib/python3.13/site-packages/pip/_internal/utils/__pycache__/encoding.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/_compat.py was removed
  /usr/lib/python3.13/site-packages/pip/_vendor/pyproject_hooks/__pycache__/_compat.cpython-313.pyc was removed

--===============0886529575593278677==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pip-upgrade-24.3.1-25.0.patch"

RnJvbSA2MWU0OWMyNTFlNDA5OTRiYjMyYTdjMmU5ODE3ODU4YzdjOTIzNmYxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBGZWIgMjAyNSAwODoxNDo1MyArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtcGlwOiB1cGdyYWRlIDI0LjMuMSAtPiAyNS4wCgotLS0KIC4uLi9weXRob24vcHl0aG9u
My1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5wYXRjaCAgICAgICAgICAgICAgICB8IDIgKy0KIC4u
Li9weXRob24ve3B5dGhvbjMtcGlwXzI0LjMuMS5iYiA9PiBweXRob24zLXBpcF8yNS4wLmJifSAg
ICAgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtcGlwXzI0
LjMuMS5iYiA9PiBweXRob24zLXBpcF8yNS4wLmJifSAoOTYlKQoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFuZ19tYW5nbGluZy5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waXAvbm9fc2hlYmFu
Z19tYW5nbGluZy5wYXRjaAppbmRleCBmOTUwNzFiZmIyLi43MTgzNmRjYTA3IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwL25vX3NoZWJhbmdfbWFu
Z2xpbmcucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBp
cC9ub19zaGViYW5nX21hbmdsaW5nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1ZDBiNTRl
YTJhYWU2MDBhMmMzYTJiNmVjNzFhY2Y5OTI5MDY0MGU3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBhNzE1YTYyMjk4OWFjMTgyZDE4ZjZmMmFkYTgyMDExMjIyODJkODg5IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBXZWQsIDIzIEZlYiAyMDIyIDEyOjI3OjA2ICswMDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIHB5dGhvbjMtcGlwOiBEb24ndCBjaGFuZ2Ugc2hlYmFuZwpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpcF8yNC4zLjEu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI1LjAuYmIKc2lt
aWxhcml0eSBpbmRleCA5NiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhv
bi9weXRob24zLXBpcF8yNC4zLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9w
eXRob24vcHl0aG9uMy1waXBfMjUuMC5iYgppbmRleCAxZmEyNDZlNGYxLi44OTA4ZmM5MTE1IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI0LjMu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlwXzI1LjAu
YmIKQEAgLTI3LDcgKzI3LDcgQEAgaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1aWxk
X21ldGEKIAogU1JDX1VSSSArPSAiZmlsZTovL25vX3NoZWJhbmdfbWFuZ2xpbmcucGF0Y2giCiAK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlYmNiNjA1NTdmMmFlZmFiYzJlMGY5MTg3NTFjZDI0ZWEw
ZDU2ZDhlYzU0NDVmZTE4MDdmMWQyMTA5NjYwYjk5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjhl
MGE5N2Y3YjRjNDdhZTRhNDk0NTYwZGE4NDc3NWU5ZTJmNjcxZDQxNWQ4ZDgyOGUwNTJlZmVmYjIw
NmIzMGIiCiAKIFJERVBFTkRTOiR7UE59ID0gIlwKICAgcHl0aG9uMy1jb21waWxlIFwKLS0gCjIu
NDQuMQoK

--===============0886529575593278677==--

