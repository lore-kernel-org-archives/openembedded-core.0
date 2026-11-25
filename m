Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36436.1795585771191280858
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 21:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=ACTkfwTu;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D6niJH4B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 010101a211408323-3a2fedc9-5713-46ee-b49a-eb07b9a43278-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1795585770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OnNFDi0RHU/0LTgQslifY34c9GgwftKD4IuvjMS/SDw=;
	b=ACTkfwTulVPZ868le1xPPutd2ReEEa3UH3w5z9nMTtX4sqUSAQ0vublEjUgXeDqF
	Ob5xmOGuD/XzFdKS75kL7ddFmFAQJKfrpEmkBdiH1oWzoZPXzraZCqMLfSP1rg4aXfc
	R+vqop/syLOD3cCh0ESOVBdmjCl4eY+4rQrBf4EM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1795585770;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OnNFDi0RHU/0LTgQslifY34c9GgwftKD4IuvjMS/SDw=;
	b=D6niJH4BBUOCmYP+zQ8gr84G4zKVn7CKs2EDFL/6EOkaCOhuJHN1Bdr2hopBSj9q
	DfsPOA9jHzQWgtKCUnJ7OIgSKFHLbpUD4eiv27aj/bOKdhCxStf/ord6L8fD8FKQ9Cz
	qMVHblR6qwPDrUcLItLgUItuae2Q2JwWvTg+GGis=
Content-Type: multipart/mixed; boundary="===============3944969380736609500=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-babel: upgrading to 2.19.0 FAILED
Message-ID: <010101a211408323-3a2fedc9-5713-46ee-b49a-eb07b9a43278-000000@us-west-2.amazonses.com>
Date: Wed, 25 Nov 2026 05:49:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.25-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 05:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251152

--===============3944969380736609500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-babel* to *2.19.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-python3-babel-upgrade-2.18.0-2.19.0.patch
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
From 06520219063813d631e2c6634030966851beb385 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 25 Nov 2026 05:19:10 +0000
Subject: [PATCH] python3-babel: upgrade 2.18.0 -> 2.19.0

Version 2.19.0
--------------

This release brings CLDR 49, new `pybabel concat` and `pybabel merge` commands,
command configuration via `pyproject.toml`, and a large number of bug fixes,
many of them from first-time contributors (and large language models).
Thank you all!

Babel now requires Python 3.9 or newer, and is built with a PEP 517 process
using Hatch instead of the legacy setup.py. This in particular may be of
interest
to downstream packagers.

Features
~~~~~~~~

Bugfixes
~~~~~~~~

Other improvements
~~~~~~~~~~~~~~~~~~

Deprecation and compatibility
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Infrastructure and documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
---
 .../python/{python3-babel_2.18.0.bb => python3-babel_2.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-babel_2.18.0.bb => python3-babel_2.19.0.bb} (86%)

diff --git a/meta/recipes-devtools/python/python3-babel_2.18.0.bb b/meta/recipes-devtools/python/python3-babel_2.19.0.bb
similarity index 86%
rename from meta/recipes-devtools/python/python3-babel_2.18.0.bb
rename to meta/recipes-devtools/python/python3-babel_2.19.0.bb
index 9beb002db1..2aca3f2da7 100644
--- a/meta/recipes-devtools/python/python3-babel_2.18.0.bb
+++ b/meta/recipes-devtools/python/python3-babel_2.19.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://babel.edgewall.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a2b86daab39fdb8ce59d97e9fecc90ee"
 
-SRC_URI[sha256sum] = "b80b99a14bd085fcacfa15c9165f651fbb3406e66cc603abf11c5750937c992d"
+SRC_URI[sha256sum] = "fddd2cbbbac7c299af3c2880be23609c331bd94f0912baca6cb0abfe054dfc27"
 
 inherit pypi setuptools3
 
-- 
2.47.1


--===============3944969380736609500==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-babel-upgrade-2.18.0-2.19.0.patch"

RnJvbSAwNjUyMDIxOTA2MzgxM2Q2MzFlMmM2NjM0MDMwOTY2ODUxYmViMzg1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMjUgTm92IDIwMjYgMDU6MTk6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWJhYmVsOiB1cGdyYWRlIDIuMTguMCAtPiAyLjE5LjAKClZlcnNpb24gMi4xOS4wCi0t
LS0tLS0tLS0tLS0tCgpUaGlzIHJlbGVhc2UgYnJpbmdzIENMRFIgNDksIG5ldyBgcHliYWJlbCBj
b25jYXRgIGFuZCBgcHliYWJlbCBtZXJnZWAgY29tbWFuZHMsCmNvbW1hbmQgY29uZmlndXJhdGlv
biB2aWEgYHB5cHJvamVjdC50b21sYCwgYW5kIGEgbGFyZ2UgbnVtYmVyIG9mIGJ1ZyBmaXhlcywK
bWFueSBvZiB0aGVtIGZyb20gZmlyc3QtdGltZSBjb250cmlidXRvcnMgKGFuZCBsYXJnZSBsYW5n
dWFnZSBtb2RlbHMpLgpUaGFuayB5b3UgYWxsIQoKQmFiZWwgbm93IHJlcXVpcmVzIFB5dGhvbiAz
Ljkgb3IgbmV3ZXIsIGFuZCBpcyBidWlsdCB3aXRoIGEgUEVQIDUxNyBwcm9jZXNzCnVzaW5nIEhh
dGNoIGluc3RlYWQgb2YgdGhlIGxlZ2FjeSBzZXR1cC5weS4gVGhpcyBpbiBwYXJ0aWN1bGFyIG1h
eSBiZSBvZgppbnRlcmVzdAp0byBkb3duc3RyZWFtIHBhY2thZ2Vycy4KCkZlYXR1cmVzCn5+fn5+
fn5+CgpCdWdmaXhlcwp+fn5+fn5+fgoKT3RoZXIgaW1wcm92ZW1lbnRzCn5+fn5+fn5+fn5+fn5+
fn5+fgoKRGVwcmVjYXRpb24gYW5kIGNvbXBhdGliaWxpdHkKfn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn4KCkluZnJhc3RydWN0dXJlIGFuZCBkb2N1bWVudGF0aW9uCn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+Ci0tLQogLi4uL3B5dGhvbi97cHl0aG9uMy1iYWJlbF8yLjE4LjAu
YmIgPT4gcHl0aG9uMy1iYWJlbF8yLjE5LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi97cHl0aG9uMy1iYWJlbF8yLjE4LjAuYmIgPT4gcHl0aG9uMy1iYWJlbF8yLjE5LjAu
YmJ9ICg4NiUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRo
b24zLWJhYmVsXzIuMTguMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iYWJlbF8yLjE5LjAuYmIKc2ltaWxhcml0eSBpbmRleCA4NiUKcmVuYW1lIGZyb20gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTguMC5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJhYmVsXzIuMTkuMC5iYgppbmRl
eCA5YmViMDAyZGIxLi4yYWNhM2YyZGE3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmFiZWxfMi4xOC4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1iYWJlbF8yLjE5LjAuYmIKQEAgLTMsNyArMyw3IEBAIEhPTUVQ
QUdFID0gImh0dHA6Ly9iYWJlbC5lZGdld2FsbC5vcmcvIgogTElDRU5TRSA9ICJCU0QtMy1DbGF1
c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1hMmI4NmRhYWIzOWZk
YjhjZTU5ZDk3ZTlmZWNjOTBlZSIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gImI4MGI5OWExNGJk
MDg1ZmNhY2ZhMTVjOTE2NWY2NTFmYmIzNDA2ZTY2Y2M2MDNhYmYxMWM1NzUwOTM3Yzk5MmQiCitT
UkNfVVJJW3NoYTI1NnN1bV0gPSAiZmRkZDJjYmJiYWM3YzI5OWFmM2MyODgwYmUyMzYwOWMzMzFi
ZDk0ZjA5MTJiYWNhNmNiMGFiZmUwNTRkZmMyNyIKIAogaW5oZXJpdCBweXBpIHNldHVwdG9vbHMz
CiAKLS0gCjIuNDcuMQoK

--===============3944969380736609500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 963 .bb files complete (0 cached, 963 parsed). 2014 targets, 43 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.20.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
SDKMACHINE           = "x86_64"
DISTRO               = "poky"
DISTRO_VERSION       = "6.1.99+snapshot-0cbfca2fe5424d23253e96caeee4dcfb1adddae2"
TUNE_FEATURES        = "m64 x86-64-v3"
meta                 = "tmp-auh-upgrades:0cbfca2fe5424d23253e96caeee4dcfb1adddae2"
meta-yocto-bsp       
meta-poky            = "master:6ee74fbbe3a36dabb7f8f85ee10691eaf8aa3252"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 261 Local 247 Mirrors 0 Missed 14 Current 430 (94% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1400 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_recipe_qa)
NOTE: Running task 1765 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_create_recipe_spdx)
NOTE: recipe python3-babel-2.19.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_create_recipe_spdx: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1770 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_fetch)
NOTE: recipe python3-babel-2.19.0-r0: task do_create_recipe_spdx: Succeeded
NOTE: recipe python3-babel-2.19.0-r0: task do_fetch: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_fetch: Succeeded
NOTE: Running task 1771 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_unpack)
NOTE: Running task 1772 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.19.0-r0: task do_unpack: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_unpack: Succeeded
NOTE: Running task 1773 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_patch)
NOTE: recipe python3-babel-2.19.0-r0: task do_patch: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-babel-2.19.0-r0: task do_patch: Succeeded
NOTE: Running task 1774 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1775 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_check_backend)
NOTE: Running task 1776 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_populate_lic)
NOTE: recipe python3-babel-2.19.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_check_backend: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_populate_lic: Started
WARNING: python3-babel-2.19.0-r0 do_check_backend: QA Issue: inherits setuptools3 but has pyproject.toml specifying backend hatchling.build, use the correct class [pep517-backend]
NOTE: recipe python3-babel-2.19.0-r0: task do_check_backend: Succeeded
NOTE: recipe python3-babel-2.19.0-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-babel-2.19.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1777 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_configure)
NOTE: recipe python3-babel-2.19.0-r0: task do_configure: Started
NOTE: recipe python3-babel-2.19.0-r0: task do_configure: Succeeded
NOTE: Running task 1778 of 1789 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_compile)
NOTE: recipe python3-babel-2.19.0-r0: task do_compile: Started
Log data follows:
| DEBUG: Executing shell function do_compile
| nativepython3: can't open file '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/sources/babel-2.19.0/setup.py': [Errno 2] No such file or directory
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/temp/run.do_compile.3067558:165 exit 2 from 'nativepython3 setup.py --verbose build -j 16 bdist_wheel --dist-dir /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/dist'
| WARNING: Backtrace (BB generated script):
| 	#1: setuptools3_do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/temp/run.do_compile.3067558, line 165
| 	#2: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/temp/run.do_compile.3067558, line 147
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/temp/run.do_compile.3067558, line 172
NOTE: recipe python3-babel-2.19.0-r0: task do_compile: Failed
NOTE: Tasks Summary: Attempted 1778 tasks of which 1767 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261125051855.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20261125051855.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/temp/log.do_compile.3067558
Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: python3-babel-2.19.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/temp/run.do_compile.3067558' failed with exit code 2
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/python3-babel/2.19.0/temp/log.do_compile.3067558
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.19.0.bb:do_compile) failed with exit code '1'

--===============3944969380736609500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="python3-babel-changelog.txt"

Version 2.19.0
--------------

This release brings CLDR 49, new `pybabel concat` and `pybabel merge` commands,
command configuration via `pyproject.toml`, and a large number of bug fixes,
many of them from first-time contributors (and large language models).
Thank you all!

Babel now requires Python 3.9 or newer, and is built with a PEP 517 process
using Hatch instead of the legacy setup.py. This in particular may be of
interest
to downstream packagers.

Features
~~~~~~~~

Bugfixes
~~~~~~~~

Other improvements
~~~~~~~~~~~~~~~~~~

Deprecation and compatibility
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Infrastructure and documentation
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--===============3944969380736609500==--
