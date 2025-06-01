Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59116C71151
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 13:55:34 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web10.27795.1748786131029556291
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 06:55:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=z25k3mmj;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=I9a21kqZ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 010101972bc6b922-a9412898-b456-4d06-84e8-a70465c4e6d0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1748786133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qzf4CPZUq8CqRbZ9xBhnP0LGdD2vaB4CS13QiM1ia08=;
	b=z25k3mmjLNdNhAdnieo2EYsDVarV7pxtpy9y3OPWoQN0++5qGvcsnw05/at7Te1l
	zUf8d5k/ce+EJ4vkey72XT7q8iucKi9VeU2kWerHOhsjOKc1FqIHv5Iz425NvpVYc8W
	Gb/G5/Pqy+sCVjRlrirZyNfu2EwnqlvDgz4Dwge4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1748786133;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qzf4CPZUq8CqRbZ9xBhnP0LGdD2vaB4CS13QiM1ia08=;
	b=I9a21kqZKpyzaXM0LHNSofCIeKQrjCQTnib0R3TwQue5lJTHhkPcXcafKpjDZL9v
	mKIMRlTu8ZXrxASjDIi+aTM6MyttBCvhSZOy8SvQbgJjwrM+tFnsMOaup97p94/d+p9
	vPGfJIrWLT9mQzHG4mhkqUmHI4GkziPh/NlGFvYI=
Content-Type: multipart/mixed; boundary="===============8690752649625479855=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Marta Rybczynska <marta.rybczynska@ygreky.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-beartype: upgrading to 0.21.0 SUCCEEDED
Message-ID: <010101972bc6b922-a9412898-b456-4d06-84e8-a70465c4e6d0-000000@us-west-2.amazonses.com>
Date: Sun, 1 Jun 2025 13:55:33 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.06.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 13:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217598

--===============8690752649625479855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-beartype* to *0.21.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-beartype-upgrade-0.20.2-0.21.0.patch
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
From 54cc21af6454a0deaf0e3da873b0b6d9597e2c59 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Jun 2025 09:07:15 +0000
Subject: [PATCH] python3-beartype: upgrade 0.20.2 -> 0.21.0

---
 .../{python3-beartype_0.20.2.bb => python3-beartype_0.21.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-beartype_0.20.2.bb => python3-beartype_0.21.0.bb} (78%)

diff --git a/meta/recipes-devtools/python/python3-beartype_0.20.2.bb b/meta/recipes-devtools/python/python3-beartype_0.21.0.bb
similarity index 78%
rename from meta/recipes-devtools/python/python3-beartype_0.20.2.bb
rename to meta/recipes-devtools/python/python3-beartype_0.21.0.bb
index 9941b28fd8..43427c1472 100644
--- a/meta/recipes-devtools/python/python3-beartype_0.20.2.bb
+++ b/meta/recipes-devtools/python/python3-beartype_0.21.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://beartype.readthedocs.io"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3a5bc05a109d235912da97a053cd7a58"
 
-SRC_URI[sha256sum] = "38c60c065ad99364a8c767e8a0e71ba8263d467b91414ed5dcffb7758a2e8079"
+SRC_URI[sha256sum] = "f9a5078f5ce87261c2d22851d19b050b64f6a805439e8793aecf01ce660d3244"
 
 inherit pypi python_hatchling
 
-- 
2.47.1


--===============8690752649625479855==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-beartype-upgrade-0.20.2-0.21.0.patch"

RnJvbSA1NGNjMjFhZjY0NTRhMGRlYWYwZTNkYTg3M2IwYjZkOTU5N2UyYzU5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBKdW4gMjAyNSAwOTowNzoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtYmVhcnR5cGU6IHVwZ3JhZGUgMC4yMC4yIC0+IDAuMjEuMAoKLS0tCiAuLi4ve3B5dGhv
bjMtYmVhcnR5cGVfMC4yMC4yLmJiID0+IHB5dGhvbjMtYmVhcnR5cGVfMC4yMS4wLmJifSAgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFt
ZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWJlYXJ0eXBlXzAuMjAuMi5i
YiA9PiBweXRob24zLWJlYXJ0eXBlXzAuMjEuMC5iYn0gKDc4JSkKCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4yMC4yLmJiIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWJlYXJ0eXBlXzAuMjEuMC5iYgpzaW1p
bGFyaXR5IGluZGV4IDc4JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9u
L3B5dGhvbjMtYmVhcnR5cGVfMC4yMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtYmVhcnR5cGVfMC4yMS4wLmJiCmluZGV4IDk5NDFiMjhmZDguLjQz
NDI3YzE0NzIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9u
My1iZWFydHlwZV8wLjIwLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9w
eXRob24zLWJlYXJ0eXBlXzAuMjEuMC5iYgpAQCAtNCw3ICs0LDcgQEAgSE9NRVBBR0UgPSAiaHR0
cHM6Ly9iZWFydHlwZS5yZWFkdGhlZG9jcy5pbyIKIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9M2E1YmMwNWExMDlkMjM1OTEyZGE5N2EwNTNj
ZDdhNTgiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICIzOGM2MGMwNjVhZDk5MzY0YThjNzY3ZThh
MGU3MWJhODI2M2Q0NjdiOTE0MTRlZDVkY2ZmYjc3NThhMmU4MDc5IgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gImY5YTUwNzhmNWNlODcyNjFjMmQyMjg1MWQxOWIwNTBiNjRmNmE4MDU0MzllODc5M2Fl
Y2YwMWNlNjYwZDMyNDQiCiAKIGluaGVyaXQgcHlwaSBweXRob25faGF0Y2hsaW5nCiAKLS0gCjIu
NDcuMQoK

--===============8690752649625479855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-beartype: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype: SRC_URI changed from "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.20.2.tar.gz;downloadfilename=beartype-0.20.2.tar.gz" to "https://files.pythonhosted.org/packages/source/b/beartype/beartype-0.21.0.tar.gz;downloadfilename=beartype-0.21.0.tar.gz"
packages/core2-64-poky-linux/python3-beartype: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dbg: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-dev: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-doc: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-locale: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-src: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype-staticdev: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PV changed from "0.20.2" to "0.21.0"
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGSIZE changed from 5961433 to 6108141 (+2%)
packages/core2-64-poky-linux/python3-beartype/python3-beartype: PKGV changed from 0.20.2 [default] to 0.21.0 [default]
packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype/_check/proposal -> /usr/lib/python3.13/site-packages/beartype/_check/pep, directory renamed /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__, directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/beartype/_decor/__pycache__/_decortype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasan
 e.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confcls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py /usr/lib/python3.13/site-packages/beartype/_decor/_decortype.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/confcls.py /usr/lib/python3.13/site-packages/beartype/_check/error/errget.py /usr/lib/python3.13/site-packages/beartype/_conf/confoverrides.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pe
 p/proposal/pep484585/pep484585container.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585type.py /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/__pycache__/errget.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep585.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep591.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep591.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/errnonpeptype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/
 __pycache__/utilpepsign.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindiota.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/errpep484585subclass.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_redrecurse.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintsane.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapipandera.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/errnonpeptype.py /usr/lib/python3.13/site-packages/beartype/_conf/_confoverrides.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep647742.py /usr/lib
 /python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585itemsview.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/confmain.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/_decortypepep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/codepep484585generic.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errpep484585subclass.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep647742.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepsign.py /usr/lib/p
 ython3.13/site-packages/beartype/_check/error/__pycache__/errmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/_decortypepep557.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsane.py /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/decortype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsmap.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/decortype.py /usr/lib/python3.13/site-packages/beartype/_check/error/errmain.py /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapipandera.py /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/_confoverrides.cpython-313.pyc /us
 r/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakindiota.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redrecurse.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585itemsview.py"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/codepep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapipandera.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapipandera.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585itemsview.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585itemsview.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep585.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep591.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep647742.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep585.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep591.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep647742.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redrecurse.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_redrecurse.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/errmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/errnonpeptype.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/errnonpeptype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/errpep484585subclass.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errpep484585subclass.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/__pycache__/errmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsane.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintsane.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/confmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/_confoverrides.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/_confoverrides.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindiota.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakindiota.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/decortype.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/_decortypepep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/_decortypepep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/decortype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsmap.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/__pycache__/utilpepsign.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepsign.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/errget.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/error/__pycache__/errget.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasane.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/checkpep484585generic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/checkpep484585generic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/confcls.py was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/confoverrides.py was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confcls.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_decortype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/__pycache__/_decortype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585container.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585type.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc was removed

--===============8690752649625479855==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-beartype/python3-beartype: FILELIST: directory renamed /usr/lib/python3.13/site-packages/beartype/_check/proposal -> /usr/lib/python3.13/site-packages/beartype/_check/pep, directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info -> /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info, directory renamed /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info/licenses -> /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info/licenses, directory renamed /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__ -> /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__, removed "/usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_decortype.py /usr/lib/python3.13/site-packages/bearty
 pe/_util/hint/pep/proposal/pep484585/pep484585type.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585container.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py /usr/lib/python3.13/site-packages/beartype/_conf/confoverrides.py /usr/lib/python3.13/site-packages/beartype/_conf/confcls.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/__pycache__/errget.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/errget.py /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py /usr/lib/python3.13/site-packages/beartype/_decor/__pycache__/_decortype.cpython-313.pyc 
 /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasane.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confcls.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/beartype/_decor/_type/__init__.py /usr/lib/python3.13/site-packages/beartype/_check/error/__pycache__/errmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/decortype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_type/decortype.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsane.py /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/_confoverrides.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/__pyc
 ache__/datakindiota.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/errpep484585subclass.py /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/errnonpeptype.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapipandera.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585itemsview.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redrecurse.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/errnonpeptype.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_redrecurse.py /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errpep484585subclass.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_c
 heck/code/_pep/pep484585/codepep484585generic.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep585.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep591.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/_decortypepep557.py /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintsane.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confmain.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindiota.py /usr/lib/python3.13/site-packages/beartype/_check/error/errmain.py /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepsign.py /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__init__.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/_decortype
 pep557.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/__pycache__/utilpepsign.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapipandera.py /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsmap.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep585.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep591.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep647742.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsmap.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep647742.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/_confoverrides.py /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585
 /__pycache__/redpep484585itemsview.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585generic.cpython-313.pyc /usr/lib/python3.13/site-packages/beartype/_conf/confmain.py /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__init__.py"
Changes to packages/core2-64-poky-linux/python3-beartype (sysroot):
  /usr/lib/python3.13/site-packages/beartype-0.20.2.dist-info moved to /usr/lib/python3.13/site-packages/beartype-0.21.0.dist-info
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/codepep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/code/_pep/pep484585/__pycache__/codepep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/__pycache__/redapipandera.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_nonpep/api/redapipandera.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/__pycache__/redpep484585itemsview.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/pep484585/redpep484585itemsview.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep585.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep591.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/__pycache__/redpep647742.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep585.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep591.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_pep/redpep647742.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/__pycache__/_redrecurse.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/convert/_reduce/_redrecurse.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/errmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/errnonpeptype.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/errnonpeptype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_nonpep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/errpep484585subclass.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/_pep/pep484585/__pycache__/errpep484585subclass.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/__pycache__/errmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/hintsane.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/hint/__pycache__/hintsane.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/checkpep484585generic.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/checkpep484585generic.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_check/pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/confmain.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/_confoverrides.py was added
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confmain.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/_confoverrides.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/datakindiota.py was added
  /usr/lib/python3.13/site-packages/beartype/_data/kind/__pycache__/datakindiota.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/decortype.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/_decortypepep557.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__init__.py was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/_decortypepep557.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/_pep/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__ was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/decortype.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_decor/_type/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsmap.py was added
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsmap.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/__pycache__/utilpepsign.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/utilpepsign.py was added
  /usr/lib/python3.13/site-packages/beartype/_check/error/errget.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/error/__pycache__/errget.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/metasane.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/metadata/__pycache__/metasane.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/checkpep484585generic.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__init__.py was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__ was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/checkpep484585generic.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_check/proposal/__pycache__/__init__.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/confcls.py was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/confoverrides.py was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confcls.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_conf/__pycache__/confoverrides.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_decortype.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/_decorpep557.py was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/_nontype/_pep/__pycache__/_decorpep557.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_decor/__pycache__/_decortype.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/doorclsget.py was removed
  /usr/lib/python3.13/site-packages/beartype/door/_cls/util/__pycache__/doorclsget.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585container.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/pep484585type.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585container.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep484585/__pycache__/pep484585type.cpython-313.pyc was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/pep647742.py was removed
  /usr/lib/python3.13/site-packages/beartype/_util/hint/pep/proposal/__pycache__/pep647742.cpython-313.pyc was removed

--===============8690752649625479855==--

