Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3723.1794377110722826348
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2026 22:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=iPZYBGf2;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=y/msXl5V;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 010101a1c935d0ab-b81a934b-c9dc-499d-ad84-58950d0366a9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r6mZT8cPLubzz+wkIafVwyubfnfIgSxYI2cFlzph4jk=;
	b=iPZYBGf2pAMRvRWcHLsUbg6fDcc6k605CVT56hzV/2CAC+IbG7jQ7HJ/DT96t3so
	nK726vmJqRK4u9rHLUdaoMEbnmJjqk86YXhuT1fKLjtJ6kSPxRikUEdC9ygJ0C+E7ny
	u0I+FK4jR3eP3rh+Ni8ykqSORY7gtSJ9cP3LpNxA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1794377109;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r6mZT8cPLubzz+wkIafVwyubfnfIgSxYI2cFlzph4jk=;
	b=y/msXl5VzZ6nhwwz622Uj1/c1o73MUCLuwObHEZrpuhUBMDiQNA5EP+KlQbgSJfs
	rY9OCKdu0U/RE3aFyaxNjBcLL/PmEBWkQRts2cetvH7KeKCLMeUR1fW3RJGFQpyP5C1
	JPjMKyPSusJB+f2IHRxIBh8Vi6ug6A6GJv7TVADE=
Content-Type: multipart/mixed; boundary="===============8189338951089573327=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx-design: upgrading to 0.8.0 SUCCEEDED
Message-ID: <010101a1c935d0ab-b81a934b-c9dc-499d-ad84-58950d0366a9-000000@us-west-2.amazonses.com>
Date: Wed, 11 Nov 2026 06:05:09 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.11.11-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 06:05:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249957

--===============8189338951089573327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx-design* to *0.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-design-upgrade-0.7.0-0.8.0.patch
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
From 30ba199029dac0b6ef4f4be57dba4cbbb75bf460 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 11 Nov 2026 05:33:17 +0000
Subject: [PATCH] python3-sphinx-design: upgrade 0.7.0 -> 0.8.0

---
 ...n3-sphinx-design_0.7.0.bb => python3-sphinx-design_0.8.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx-design_0.7.0.bb => python3-sphinx-design_0.8.0.bb} (79%)

diff --git a/meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb b/meta/recipes-devtools/python/python3-sphinx-design_0.8.0.bb
similarity index 79%
rename from meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb
rename to meta/recipes-devtools/python/python3-sphinx-design_0.8.0.bb
index 908ac0846e..920205ae1c 100644
--- a/meta/recipes-devtools/python/python3-sphinx-design_0.7.0.bb
+++ b/meta/recipes-devtools/python/python3-sphinx-design_0.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://sphinx-design.readthedocs.io/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=484a29024499c025d11c52f22a6f0bb8"
 
-SRC_URI[sha256sum] = "d2a3f5b19c24b916adb52f97c5f00efab4009ca337812001109084a740ec9b7a"
+SRC_URI[sha256sum] = "57fa4d96378525122947ab6109c6e490190e3119dc10f3e3adf6b71444bf3bb4"
 
 inherit pypi python_flit_core
 
-- 
2.47.1


--===============8189338951089573327==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-design-upgrade-0.7.0-0.8.0.patch"

RnJvbSAzMGJhMTk5MDI5ZGFjMGI2ZWY0ZjRiZTU3ZGJhNGNiYmI3NWJmNDYwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTEgTm92IDIwMjYgMDU6MzM6MTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueC1kZXNpZ246IHVwZ3JhZGUgMC43LjAgLT4gMC44LjAKCi0tLQogLi4ubjMt
c3BoaW54LWRlc2lnbl8wLjcuMC5iYiA9PiBweXRob24zLXNwaGlueC1kZXNpZ25fMC44LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zcGhpbngtZGVzaWdu
XzAuNy4wLmJiID0+IHB5dGhvbjMtc3BoaW54LWRlc2lnbl8wLjguMC5iYn0gKDc5JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LWRlc2ln
bl8wLjcuMC5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngt
ZGVzaWduXzAuOC4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNzklCnJlbmFtZSBmcm9tIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbngtZGVzaWduXzAuNy4wLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LWRlc2lnbl8w
LjguMC5iYgppbmRleCA5MDhhYzA4NDZlLi45MjAyMDVhZTFjIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LWRlc2lnbl8wLjcuMC5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54LWRlc2lnbl8wLjgu
MC5iYgpAQCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cHM6Ly9zcGhpbngtZGVzaWduLnJl
YWR0aGVkb2NzLmlvLyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vTElDRU5TRTttZDU9NDg0YTI5MDI0NDk5YzAyNWQxMWM1MmYyMmE2ZjBiYjgiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICJkMmEzZjViMTljMjRiOTE2YWRiNTJmOTdjNWYwMGVmYWI0MDA5Y2Ez
Mzc4MTIwMDExMDkwODRhNzQwZWM5YjdhIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjU3ZmE0ZDk2
Mzc4NTI1MTIyOTQ3YWI2MTA5YzZlNDkwMTkwZTMxMTlkYzEwZjNlM2FkZjZiNzE0NDRiZjNiYjQi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fZmxpdF9jb3JlCiAKLS0gCjIuNDcuMQoK

--===============8189338951089573327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx_design-0.7.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx_design-0.8.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sphinx_design-0.7.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx_design-0.8.0.dist-info, removed "/usr/lib/python3.14/site-packages/sphinx_design/compiled/sd_tabs.js /usr/lib/python3.14/site-packages/sphinx_design/compiled/style.min.css", added "/usr/lib/python3.14/site-packages/sphinx_design/__pycache__/accordion.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/steps.py /usr/lib/python3.14/site-packages/sphinx_design/static/design-tabs.js /usr/lib/python3.14/site-packages/sphinx_design/accordion.py /usr/lib/python3.14/site-packages/sphinx_design/aside.py /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/config.cpython-314.pyc /usr/lib/python3.14/site
 -packages/sphinx_design/__pycache__/testing.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/static/sphinx-design.min.css /usr/lib/python3.14/site-packages/sphinx_design/testing.py /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/aside.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/steps.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/config.py"
Changes to packages/x86-64-v3-poky-linux/python3-sphinx-design (sysroot):
  /usr/lib/python3.14/site-packages/sphinx_design-0.7.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx_design-0.8.0.dist-info
  /usr/lib/python3.14/site-packages/sphinx_design/accordion.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/aside.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/config.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/accordion.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/aside.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/config.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/steps.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/testing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/static was added
  /usr/lib/python3.14/site-packages/sphinx_design/static/design-tabs.js was added
  /usr/lib/python3.14/site-packages/sphinx_design/static/sphinx-design.min.css was added
  /usr/lib/python3.14/site-packages/sphinx_design/steps.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/testing.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/compiled/sd_tabs.js was removed
  /usr/lib/python3.14/site-packages/sphinx_design/compiled/style.min.css was removed

--===============8189338951089573327==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx-design: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx_design/sphinx_design-0.7.0.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx_design/sphinx_design-0.8.0.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinx-design: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-design: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-dbg: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-dbg: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-dev: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-dev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-doc: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-doc: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-locale: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-locale: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-src: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-src: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-staticdev: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design-staticdev: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design: PKGSIZE changed from 9782539 to 10343773 (+6%)
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design: FILELIST: directory renamed /usr/lib/python3.14/site-packages/sphinx_design-0.7.0.dist-info/licenses -> /usr/lib/python3.14/site-packages/sphinx_design-0.8.0.dist-info/licenses, directory renamed /usr/lib/python3.14/site-packages/sphinx_design-0.7.0.dist-info -> /usr/lib/python3.14/site-packages/sphinx_design-0.8.0.dist-info, removed "/usr/lib/python3.14/site-packages/sphinx_design/compiled/sd_tabs.js /usr/lib/python3.14/site-packages/sphinx_design/compiled/style.min.css", added "/usr/lib/python3.14/site-packages/sphinx_design/__pycache__/steps.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/testing.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/static/sphinx-design.min.css /usr/lib/python3.14/site-packages/sphinx_design/steps.py /usr/lib/python3.14/site-packages/sphinx_design/config.py /usr/lib/python3.14/site-packages/sphinx_design/static/design-tabs.js /usr/lib/p
 ython3.14/site-packages/sphinx_design/__pycache__/accordion.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/aside.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/aside.py /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/config.cpython-314.pyc /usr/lib/python3.14/site-packages/sphinx_design/accordion.py /usr/lib/python3.14/site-packages/sphinx_design/testing.py"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design: PV changed from "0.7.0" to "0.8.0"
packages/x86-64-v3-poky-linux/python3-sphinx-design/python3-sphinx-design: PKGV changed from 0.7.0 [default] to 0.8.0 [default]
Changes to packages/x86-64-v3-poky-linux/python3-sphinx-design (sysroot):
  /usr/lib/python3.14/site-packages/sphinx_design-0.7.0.dist-info moved to /usr/lib/python3.14/site-packages/sphinx_design-0.8.0.dist-info
  /usr/lib/python3.14/site-packages/sphinx_design/accordion.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/aside.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/config.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/accordion.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/aside.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/config.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/steps.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/__pycache__/testing.cpython-314.pyc was added
  /usr/lib/python3.14/site-packages/sphinx_design/static was added
  /usr/lib/python3.14/site-packages/sphinx_design/static/design-tabs.js was added
  /usr/lib/python3.14/site-packages/sphinx_design/static/sphinx-design.min.css was added
  /usr/lib/python3.14/site-packages/sphinx_design/steps.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/testing.py was added
  /usr/lib/python3.14/site-packages/sphinx_design/compiled/sd_tabs.js was removed
  /usr/lib/python3.14/site-packages/sphinx_design/compiled/style.min.css was removed

--===============8189338951089573327==--
