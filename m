Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1449C3601A
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:20 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web11.10351.1742048287062527983
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Vkh/mfRd;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=KuL+/FGl;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101959a2b8cfd-7d3d6f51-6345-4991-a6b4-e883057fa751-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=C9OGFSWouYDb4PbPpuFrXKCfW0GoPBfOX/nRXFlEqSA=;
	b=Vkh/mfRdRNljI9ZziKxT8IPBOmk1+3NEWK800IgSeTszXIMz+E5gv05kdtXIcbET
	EGwU76cOmI5uwujyz3WB3pziTqjwDpDAwuzTsEkymfDF/tHbvjB2E4sqP7J6fpJKR61
	/yKEssW1E06Ch4CUGZFvf6rZP2gC73K1tdlRj4E0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048300;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=C9OGFSWouYDb4PbPpuFrXKCfW0GoPBfOX/nRXFlEqSA=;
	b=KuL+/FGlYRNHl5Jg6xQYAlx56BVM9mPSN1niICIKPwa5Wk85XZuvvnnXI7bHdMCm
	vg0v1ay0WN3zEWqomYXsdU6Ag9emNV0byy52HF7tx9r9PaQ8dQcLpizgzZHhJu0Ip89
	OeNTMW80erWIRQfjdpv5HewiqO1qdimyTb2BRgDQ=
Content-Type: multipart/mixed; boundary="===============3571660697565349373=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-scons: upgrading to 4.9.0 SUCCEEDED
Message-ID: <010101959a2b8cfd-7d3d6f51-6345-4991-a6b4-e883057fa751-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:20 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212917

--===============3571660697565349373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-scons* to *4.9.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-scons-upgrade-4.8.1-4.9.0.patch
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
From 53311f7cdd6e865fb4905f13e52c4406f2c3e6f6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 09:34:18 +0000
Subject: [PATCH] python3-scons: upgrade 4.8.1 -> 4.9.0

---
 .../python/{python3-scons_4.8.1.bb => python3-scons_4.9.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-scons_4.8.1.bb => python3-scons_4.9.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-scons_4.8.1.bb b/meta/recipes-devtools/python/python3-scons_4.9.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-scons_4.8.1.bb
rename to meta/recipes-devtools/python/python3-scons_4.9.0.bb
index 8f5e268af8..2163d4b1a3 100644
--- a/meta/recipes-devtools/python/python3-scons_4.8.1.bb
+++ b/meta/recipes-devtools/python/python3-scons_4.9.0.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d903b0b8027f461402bac9b5169b36f7"
 
-SRC_URI[sha256sum] = "5b641357904d2f56f7bfdbb37e165ab996b6143c948b9df0efc7305f54949daa"
+SRC_URI[sha256sum] = "f1a5e161bf3d1411d780d65d7919654b9405555994621d3d68e42d62114b592a"
 
 inherit pypi python_setuptools_build_meta
 
-S = "${WORKDIR}/SCons-${PV}"
+S = "${WORKDIR}/scons-${PV}"
 
 RDEPENDS:${PN}:class-target = "\
   python3-core \
-- 
2.44.1


--===============3571660697565349373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-scons: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/scons/scons-4.8.1.tar.gz;downloadfilename=scons-4.8.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/scons/scons-4.9.0.tar.gz;downloadfilename=scons-4.9.0.tar.gz"
packages/core2-64-poky-linux/python3-scons: PV changed from "4.8.1" to "4.9.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-dbg: PV changed from "4.8.1" to "4.9.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-dev: PV changed from "4.8.1" to "4.9.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-doc: PV changed from "4.8.1" to "4.9.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-locale: PV changed from "4.8.1" to "4.9.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-src: PV changed from "4.8.1" to "4.9.0"
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons-staticdev: PV changed from "4.8.1" to "4.9.0"
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGV changed from 4.8.1 [default] to 4.9.0 [default]
packages/core2-64-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__ -> /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__, directory renamed /usr/lib/python3.13/site-packages/scons-4.8.1.dist-info -> /usr/lib/python3.13/site-packages/scons-4.9.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/SCons/Tool/ninja -> /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool, removed "/usr/lib/python3.13/site-packages/SCons/Util/sctyping.py /usr/lib/python3.13/site-packages/SCons/Util/__pycache__/sctyping.cpython-313.pyc"
packages/core2-64-poky-linux/python3-scons/python3-scons: PKGSIZE changed from 21945277 to 21989882 (+0%)
packages/core2-64-poky-linux/python3-scons/python3-scons: PV changed from "4.8.1" to "4.9.0"
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.8.1.dist-info moved to /usr/lib/python3.13/site-packages/scons-4.9.0.dist-info
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Globals.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__init__.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Methods.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/ninja_daemon_build.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/ninja_run_daemon.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/ninja_scons_daemon.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/NinjaState.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Overrides.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__ was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Globals.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Methods.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/ninja_daemon_build.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/ninja_run_daemon.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/ninja_scons_daemon.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/NinjaState.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Overrides.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Rules.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Rules.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Utils.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Globals.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__init__.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Methods.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/ninja_daemon_build.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/ninja_run_daemon.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/ninja_scons_daemon.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/NinjaState.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Overrides.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__ was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Globals.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Methods.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/ninja_daemon_build.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/ninja_run_daemon.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/ninja_scons_daemon.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/NinjaState.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Overrides.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Rules.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Utils.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Rules.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Utils.py was removed
  /usr/lib/python3.13/site-packages/SCons/Util/__pycache__/sctyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Util/sctyping.py was removed

--===============3571660697565349373==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-scons/python3-scons: FILELIST: directory renamed /usr/lib/python3.13/site-packages/SCons/Tool/ninja -> /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool, directory renamed /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__ -> /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__, directory renamed /usr/lib/python3.13/site-packages/scons-4.8.1.dist-info -> /usr/lib/python3.13/site-packages/scons-4.9.0.dist-info, removed "/usr/lib/python3.13/site-packages/SCons/Util/sctyping.py /usr/lib/python3.13/site-packages/SCons/Util/__pycache__/sctyping.cpython-313.pyc"
Changes to packages/core2-64-poky-linux/python3-scons (sysroot):
  /usr/lib/python3.13/site-packages/scons-4.8.1.dist-info moved to /usr/lib/python3.13/site-packages/scons-4.9.0.dist-info
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Globals.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__init__.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Methods.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/ninja_daemon_build.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/ninja_run_daemon.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/ninja_scons_daemon.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/NinjaState.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Overrides.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__ was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Globals.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Methods.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/ninja_daemon_build.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/ninja_run_daemon.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/ninja_scons_daemon.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/NinjaState.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Overrides.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Rules.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/__pycache__/Utils.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Rules.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja_tool/Utils.py was added
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Globals.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__init__.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Methods.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/ninja_daemon_build.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/ninja_run_daemon.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/ninja_scons_daemon.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/NinjaState.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Overrides.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__ was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Globals.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Methods.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/ninja_daemon_build.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/ninja_run_daemon.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/ninja_scons_daemon.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/NinjaState.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Overrides.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Rules.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/__pycache__/Utils.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Rules.py was removed
  /usr/lib/python3.13/site-packages/SCons/Tool/ninja/Utils.py was removed
  /usr/lib/python3.13/site-packages/SCons/Util/__pycache__/sctyping.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/SCons/Util/sctyping.py was removed

--===============3571660697565349373==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-scons-upgrade-4.8.1-4.9.0.patch"

RnJvbSA1MzMxMWY3Y2RkNmU4NjVmYjQ5MDVmMTNlNTJjNDQwNmYyYzNlNmY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMDk6MzQ6MTggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNjb25zOiB1cGdyYWRlIDQuOC4xIC0+IDQuOS4wCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc2NvbnNfNC44LjEuYmIgPT4gcHl0aG9uMy1zY29uc180LjkuMC5iYn0gfCA0ICsrLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0aG9uMy1zY29uc180LjguMS5iYiA9PiBw
eXRob24zLXNjb25zXzQuOS4wLmJifSAoODUlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjguMS5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1zY29uc180LjkuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDg1JQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC44
LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zY29u
c180LjkuMC5iYgppbmRleCA4ZjVlMjY4YWY4Li4yMTYzZDRiMWEzIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc2NvbnNfNC44LjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNjb25zXzQuOS4wLmJiCkBAIC00LDEx
ICs0LDExIEBAIFNFQ1RJT04gPSAiZGV2ZWwvcHl0aG9uIgogTElDRU5TRSA9ICJNSVQiCiBMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT1kOTAzYjBiODAyN2Y0NjE0MDJiYWM5
YjUxNjliMzZmNyIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjViNjQxMzU3OTA0ZDJmNTZmN2Jm
ZGJiMzdlMTY1YWI5OTZiNjE0M2M5NDhiOWRmMGVmYzczMDVmNTQ5NDlkYWEiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjFhNWUxNjFiZjNkMTQxMWQ3ODBkNjVkNzkxOTY1NGI5NDA1NTU1OTk0NjIx
ZDNkNjhlNDJkNjIxMTRiNTkyYSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9zZXR1cHRvb2xzX2J1
aWxkX21ldGEKIAotUyA9ICIke1dPUktESVJ9L1NDb25zLSR7UFZ9IgorUyA9ICIke1dPUktESVJ9
L3Njb25zLSR7UFZ9IgogCiBSREVQRU5EUzoke1BOfTpjbGFzcy10YXJnZXQgPSAiXAogICBweXRo
b24zLWNvcmUgXAotLSAKMi40NC4xCgo=

--===============3571660697565349373==--

