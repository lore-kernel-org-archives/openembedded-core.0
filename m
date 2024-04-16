Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 933BCC27C44
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 06:14:09 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.13598.1713248039711506174
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 23:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=R6j3dTqC;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=1MYzNHCv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018ee58a711d-093c4113-b185-464c-a381-82911b7e9f01-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=OhDiUYUXtlwuvfNwdj8NcBcGjpK9m5x6TU958/RlWK8=;
	b=R6j3dTqCcZdpVBSM9IE68497ygFzyLVQUMVMGP80sFKBJ0gtiMFnR+CGKWexhsGN
	9Mt8jbb3M7Y43gOf+0VIzjt1vHy8lu9ua3k590+nrH6ipN8Xno0EwckxbUN1nQ+fkrQ
	EmNnIBAMJdfv243ZRpxGIeQsF5xsUZ2W4B/Wmdeo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1713248039;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=OhDiUYUXtlwuvfNwdj8NcBcGjpK9m5x6TU958/RlWK8=;
	b=1MYzNHCv0LPMdUkMb0Q67ZZvWuIqbLCemYv/MIs0G5GNgDUntaRsBg+nPH2essbb
	fTlpENy/HaxfLVcte63myPKZOL415KZreeiuCPVZpMyISyhFUWBfNoslDbAddnoEdSo
	JT+FQrrICp3JNL++obNKekCe/BKNNV+4VNYeErv8=
Content-Type: multipart/mixed; boundary="===============0653444483164907095=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 8.1.1 SUCCEEDED
Message-ID: <0101018ee58a711d-093c4113-b185-464c-a381-82911b7e9f01-000000@us-west-2.amazonses.com>
Date: Tue, 16 Apr 2024 06:13:59 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Apr 2024 06:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198303

--===============0653444483164907095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *8.1.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pytest-upgrade-8.0.2-8.1.1.patch
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
From 7732fd98ba52ff84f8f6c86edc16933d6e942dee Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Apr 2024 19:55:08 +0000
Subject: [PATCH] python3-pytest: upgrade 8.0.2 -> 8.1.1

---
 .../python/{python3-pytest_8.0.2.bb => python3-pytest_8.1.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pytest_8.0.2.bb => python3-pytest_8.1.1.bb} (92%)

diff --git a/meta/recipes-devtools/python/python3-pytest_8.0.2.bb b/meta/recipes-devtools/python/python3-pytest_8.1.1.bb
similarity index 92%
rename from meta/recipes-devtools/python/python3-pytest_8.0.2.bb
rename to meta/recipes-devtools/python/python3-pytest_8.1.1.bb
index 57e979e909..b1cf23fbc4 100644
--- a/meta/recipes-devtools/python/python3-pytest_8.0.2.bb
+++ b/meta/recipes-devtools/python/python3-pytest_8.1.1.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The pytest framework makes it easy to write small tests, yet scal
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bd27e41b6550fe0fc45356d1d81ee37c"
 
-SRC_URI[sha256sum] = "d4051d623a2e0b7e51960ba963193b09ce6daeb9759a451844a21e4ddedfc1bd"
+SRC_URI[sha256sum] = "ac978141a75948948817d360297b7aae0fcb9d6ff6bc9ec6d514b85d5a65c044"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-- 
2.42.0


--===============0653444483164907095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pytest/python3-pytest: FILELIST: removed "/usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/entry_points.txt /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/top_level.txt /usr/lib/python3.12/site-packages/_pytest/__pycache__/nose.cpython-312.pyc /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/METADATA /usr/lib/python3.12/site-packages/_pytest/nose.py /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/RECORD /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/WHEEL", added "/usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/AUTHORS /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/entry_points.txt /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/top_level.txt /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/METADATA /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/pytest-
 8.1.1.dist-info/RECORD /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/WHEEL"
Changes to packages/core2-64-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info moved to /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info
  /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/AUTHORS was added
  /usr/lib/python3.12/site-packages/_pytest/nose.py was removed
  /usr/lib/python3.12/site-packages/_pytest/__pycache__/nose.cpython-312.pyc was removed

--===============0653444483164907095==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pytest: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pytest/pytest-8.0.2.tar.gz;downloadfilename=pytest-8.0.2.tar.gz" to "https://files.pythonhosted.org/packages/source/p/pytest/pytest-8.1.1.tar.gz;downloadfilename=pytest-8.1.1.tar.gz"
packages/core2-64-poky-linux/python3-pytest: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dbg: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dbg: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dev: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-dev: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-doc: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-doc: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-locale: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-locale: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-src: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-src: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest-staticdev: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest-staticdev: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PV changed from "8.0.2" to "8.1.1"
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PKGSIZE changed from 2617637 to 2634171 (+1%)
packages/core2-64-poky-linux/python3-pytest/python3-pytest: PKGV changed from 8.0.2 [default] to 8.1.1 [default]
packages/core2-64-poky-linux/python3-pytest/python3-pytest: FILELIST: removed "/usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/LICENSE /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/METADATA /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/top_level.txt /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/RECORD /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/entry_points.txt /usr/lib/python3.12/site-packages/_pytest/__pycache__/nose.cpython-312.pyc /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info/WHEEL /usr/lib/python3.12/site-packages/_pytest/nose.py", added "/usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/LICENSE /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/METADATA /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/top_level.txt /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/RECORD /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/AUTHORS /usr/lib/python3.12/site-packages/pytest-8.1.1.dist
 -info/entry_points.txt /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/WHEEL"
Changes to packages/core2-64-poky-linux/python3-pytest (sysroot):
  /usr/lib/python3.12/site-packages/pytest-8.0.2.dist-info moved to /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info
  /usr/lib/python3.12/site-packages/pytest-8.1.1.dist-info/AUTHORS was added
  /usr/lib/python3.12/site-packages/_pytest/nose.py was removed
  /usr/lib/python3.12/site-packages/_pytest/__pycache__/nose.cpython-312.pyc was removed

--===============0653444483164907095==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pytest-upgrade-8.0.2-8.1.1.patch"

RnJvbSA3NzMyZmQ5OGJhNTJmZjg0ZjhmNmM4NmVkYzE2OTMzZDZlOTQyZGVlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgQXByIDIwMjQgMTk6NTU6MDggKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5dGVzdDogdXBncmFkZSA4LjAuMiAtPiA4LjEuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5dGVzdF84LjAuMi5iYiA9PiBweXRob24zLXB5dGVzdF84LjEuMS5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5dGVzdF84LjAuMi5iYiA9PiBw
eXRob24zLXB5dGVzdF84LjEuMS5iYn0gKDkyJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0XzguMC4yLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF84LjEuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDky
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHl0ZXN0
XzguMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHl0ZXN0XzguMS4xLmJiCmluZGV4IDU3ZTk3OWU5MDkuLmIxY2YyM2ZiYzQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weXRlc3RfOC4wLjIuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5dGVzdF84LjEuMS5iYgpA
QCAtNSw3ICs1LDcgQEAgREVTQ1JJUFRJT04gPSAiVGhlIHB5dGVzdCBmcmFtZXdvcmsgbWFrZXMg
aXQgZWFzeSB0byB3cml0ZSBzbWFsbCB0ZXN0cywgeWV0IHNjYWwKIExJQ0VOU0UgPSAiTUlUIgog
TElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9YmQyN2U0MWI2NTUwZmUwZmM0
NTM1NmQxZDgxZWUzN2MiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICJkNDA1MWQ2MjNhMmUwYjdl
NTE5NjBiYTk2MzE5M2IwOWNlNmRhZWI5NzU5YTQ1MTg0NGEyMWU0ZGRlZGZjMWJkIgorU1JDX1VS
SVtzaGEyNTZzdW1dID0gImFjOTc4MTQxYTc1OTQ4OTQ4ODE3ZDM2MDI5N2I3YWFlMGZjYjlkNmZm
NmJjOWVjNmQ1MTRiODVkNWE2NWMwNDQiCiAKIERFUEVORFMgKz0gInB5dGhvbjMtc2V0dXB0b29s
cy1zY20tbmF0aXZlIgogCi0tIAoyLjQyLjAKCg==

--===============0653444483164907095==--

