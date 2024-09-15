Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F7BFC618C
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:21 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.115393.1726410840756965070
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=RbJKfj7f;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=IQYjqZk+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61ad862-03faf3ca-5998-4250-8800-c11720302d15-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L4GtMBofqZ6yJnF7TEy1gh+54bOoTPpWd8a8OezJ/Mc=;
	b=RbJKfj7feRmVxcG0MEIzhxV+TgmjGrTEL2MyGg/JjaYe6GKVkFIcmD6gldnkDp/I
	LbgxrBsdv/8SiB5EFfFTQS/UnvlNPzVQzFuK9KNeUPgAwrf22c2/MFXMtdlU+TPqhtm
	GtyeSd7Mx+8xLMF55WZPH1X4sMgd2X2/7GuAhL8g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410840;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L4GtMBofqZ6yJnF7TEy1gh+54bOoTPpWd8a8OezJ/Mc=;
	b=IQYjqZk+krhgrSBDA/IkC7rD+HHJRgr7J1SAYc6V0TMcg0M5bL88A/ZA/sm5NGff
	LsYgYYwUiEydN1Azui4VgtorIr0vOJjCo5HyIwsiF9AxqebDUD/WtvsAo2D9BFgxGoA
	ZxgdozjtnbpLwYJ2st6/Rij9JDeSbBDziaZAjbr4=
Content-Type: multipart/mixed; boundary="===============0778877663175559885=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Tim Orling <tim.orling@konsulko.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pyasn1: upgrading to 0.6.1 SUCCEEDED
Message-ID: <01010191f61ad862-03faf3ca-5998-4250-8800-c11720302d15-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204526

--===============0778877663175559885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-pyasn1* to *0.6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-pyasn1-upgrade-0.6.0-0.6.1.patch
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
From 55c4d3ca4774e07b0c05018be452d00dd6b4200b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 08:53:40 +0000
Subject: [PATCH] python3-pyasn1: upgrade 0.6.0 -> 0.6.1

---
 .../python/{python3-pyasn1_0.6.0.bb => python3-pyasn1_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyasn1_0.6.0.bb => python3-pyasn1_0.6.1.bb} (88%)

diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
similarity index 88%
rename from meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
rename to meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
index 7237557f44..3913cb51d2 100644
--- a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
+++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://pyasn1.sourceforge.net/"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=190f79253908c986e6cacf380c3a5f6d"
 
-SRC_URI[sha256sum] = "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706ccd82328cfc8f64c"
+SRC_URI[sha256sum] = "6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.44.0


--===============0778877663175559885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_octets.py /usr/lib/python3-pyasn1/ptest/tests/compat/test_integer.py"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pyasn1-0.6.0.dist-info -> /usr/lib/python3.12/site-packages/pyasn1-0.6.1.dist-info, removed "/usr/lib/python3.12/site-packages/pyasn1/compat/octets.py /usr/lib/python3.12/site-packages/pyasn1/compat/__pycache__/octets.cpython-312.pyc"
Changes to packages/core2-64-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.12/site-packages/pyasn1-0.6.0.dist-info moved to /usr/lib/python3.12/site-packages/pyasn1-0.6.1.dist-info
  /usr/lib/python3.12/site-packages/pyasn1/compat/octets.py was removed
  /usr/lib/python3.12/site-packages/pyasn1/compat/__pycache__/octets.cpython-312.pyc was removed

--===============0778877663175559885==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-pyasn1: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1: SRC_URI changed from "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.0.tar.gz;downloadfilename=pyasn1-0.6.0.tar.gz file://run-ptest" to "https://files.pythonhosted.org/packages/source/p/pyasn1/pyasn1-0.6.1.tar.gz;downloadfilename=pyasn1-0.6.1.tar.gz file://run-ptest"
packages/core2-64-poky-linux/python3-pyasn1: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dbg: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dev: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-dev: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-doc: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-doc: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-locale: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-locale: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGSIZE changed from 330792 to 318785 (-4%)
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-ptest: FILELIST: removed "/usr/lib/python3-pyasn1/ptest/tests/compat/test_integer.py /usr/lib/python3-pyasn1/ptest/tests/compat/test_octets.py"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-src: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-src: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1-staticdev: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: PV changed from "0.6.0" to "0.6.1"
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: PKGSIZE changed from 837610 to 815942 (-3%)
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: PKGV changed from 0.6.0 [default] to 0.6.1 [default]
packages/core2-64-poky-linux/python3-pyasn1/python3-pyasn1: FILELIST: directory renamed /usr/lib/python3.12/site-packages/pyasn1-0.6.0.dist-info -> /usr/lib/python3.12/site-packages/pyasn1-0.6.1.dist-info, removed "/usr/lib/python3.12/site-packages/pyasn1/compat/__pycache__/octets.cpython-312.pyc /usr/lib/python3.12/site-packages/pyasn1/compat/octets.py"
Changes to packages/core2-64-poky-linux/python3-pyasn1 (sysroot):
  /usr/lib/python3.12/site-packages/pyasn1-0.6.0.dist-info moved to /usr/lib/python3.12/site-packages/pyasn1-0.6.1.dist-info
  /usr/lib/python3.12/site-packages/pyasn1/compat/octets.py was removed
  /usr/lib/python3.12/site-packages/pyasn1/compat/__pycache__/octets.cpython-312.pyc was removed

--===============0778877663175559885==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-pyasn1-upgrade-0.6.0-0.6.1.patch"

RnJvbSA1NWM0ZDNjYTQ3NzRlMDdiMGMwNTAxOGJlNDUyZDAwZGQ2YjQyMDBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMDg6NTM6NDAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXB5YXNuMTogdXBncmFkZSAwLjYuMCAtPiAwLjYuMQoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXB5YXNuMV8wLjYuMC5iYiA9PiBweXRob24zLXB5YXNuMV8wLjYuMS5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXB5YXNuMV8wLjYuMC5iYiA9PiBw
eXRob24zLXB5YXNuMV8wLjYuMS5iYn0gKDg4JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24xXzAuNi4wLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjYuMS5iYgpzaW1pbGFyaXR5IGluZGV4IDg4
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcHlhc24x
XzAuNi4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
cHlhc24xXzAuNi4xLmJiCmluZGV4IDcyMzc1NTdmNDQuLjM5MTNjYjUxZDIgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1weWFzbjFfMC42LjAuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXB5YXNuMV8wLjYuMS5iYgpA
QCAtMyw3ICszLDcgQEAgSE9NRVBBR0UgPSAiaHR0cDovL3B5YXNuMS5zb3VyY2Vmb3JnZS5uZXQv
IgogTElDRU5TRSA9ICJCU0QtMi1DbGF1c2UiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9M
SUNFTlNFLnJzdDttZDU9MTkwZjc5MjUzOTA4Yzk4NmU2Y2FjZjM4MGMzYTVmNmQiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICIzYTM1YWIyYzRiNWVmOThlMTdkZmRlYzhhYjA3NDA0NmZiZGE3NmUy
ODFjNWE3MDZjY2Q4MjMyOGNmYzhmNjRjIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjZmNTgwZDJi
ZGQ4NDM2NTM4MDgzMGFjZjQ1NTUwZjI1MTE0NjlmNjczY2I0YTVhZTM4NTdhMzE3MDEyOGIwMzQi
CiAKIGluaGVyaXQgcHlwaSBweXRob25fc2V0dXB0b29sc19idWlsZF9tZXRhIHB0ZXN0CiAKLS0g
CjIuNDQuMAoK

--===============0778877663175559885==--

