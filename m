Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06F6C27C5F
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.6032.1689456454968061103
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=K6JQHgUE;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101895b73aae8-5b99fc4a-6f7d-4984-ab37-fdf5081fddf8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GDaqFCOsxTc7hiEkFyWzWqWzm+o90Pktqk9TDchNJlM=;
	b=K6JQHgUEo28KX3Ql3SyqMc8K8TmclShlyCFvgeVa+oQro2ngohoj/ZjAzEyDUuQC
	qBPuas8qPGmd7rvgiQkXhlwMQBPxOUFWqoCr7sg0Ko2X49DnUatZgxWXfAKm5/OyQS4
	2OxT7XbCbGvip6RCR9Hu8V0insLyXTMJghxc+qCE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456454;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GDaqFCOsxTc7hiEkFyWzWqWzm+o90Pktqk9TDchNJlM=;
	b=EO4IwOsMJWiQA6BSED38BV9b83zUdzRuMz3v7/OeW7FVffEnSAjtePJ6xolD8Fx3
	Cz+ecD17qbdP2pmL7eQw41cJX6ZDz87GZb+JXA4SrgdvZnSGYZOF66ComAVLEXrNScl
	P4sD4rSmta4AtdEoBee6Xv7UyjSgLogjE0CsUnfY=
Content-Type: multipart/mixed; boundary="===============8246474307111144204=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.18.3 SUCCEEDED
Message-ID: <010101895b73aae8-5b99fc4a-6f7d-4984-ab37-fdf5081fddf8-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184355

--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.18.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.17.3-4.18.3.patch
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
From 99b82893163c19e678723806e0396b7f3c76cc3f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 12:23:05 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.17.3 -> 4.18.3

---
 ...ython3-jsonschema_4.17.3.bb => python3-jsonschema_4.18.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.17.3.bb => python3-jsonschema_4.18.3.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb b/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb
index 24cde3711c..6ce2259f16 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d"
+SRC_URI[sha256sum] = "64b7104d72efe856bea49ca4af37a14a9eba31b40bb7238179f3803130fd34d9"
 
 inherit pypi python_hatchling
 
-- 
2.39.2


--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonschema: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.17.3.tar.gz;downloadfilename=jsonschema-4.17.3.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.18.3.tar.gz;downloadfilename=jsonschema-4.18.3.tar.gz"
packages/core2-32-poky-linux/python3-jsonschema: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 466649 to 469244 (+1%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: removed "/usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py /usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.17.3" to "4.18.3"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 468705 to 452198 (-4%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.18.3.dist-info, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.18.3.dist-info/licenses, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data /us
 r/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion /usr/lib/python3.11/site-packages/jsonschema/schemas/draft3.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2020-12.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation /usr/lib/py
 thon3.11/site-packages/jsonschema/schemas/draft7.json", added "/usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/_typing.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.17.3 [default] to 4.18.3 [default]
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.18.3.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/_typing.py was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2020-12.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft3.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft7.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09 was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12 was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation was removed
  /usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py was removed
  /usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc was removed

--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: removed "/usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py /usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.18.3.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.18.3.dist-info, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2020-12.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion /usr/lib/python3.11/site-packages/jsonschema/schemas/draft3.json /usr/lib/python3.11/site-packages/jsonschema/schemas/dr
 aft7.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packa
 ges/jsonschema/schemas/vocabularies/draft2020-12/core", added "/usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/_typing.py"
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.18.3.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/_typing.py was added
  /usr/lib/python3.11/site-packages/jsonschema/schemas was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2020-12.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft3.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/draft7.json was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09 was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12 was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated was removed
  /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation was removed
  /usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py was removed
  /usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc was removed

--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 70 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee49a78059b8c63abf3b91959b76be0ae74fb1f4"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 31 Mirrors 0 Missed 21 Current 460 (59% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 475 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/python3-importlib-metadata/6.7.0-r0/temp/log.do_packagedata_setscene.1537888
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 511 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_setscene)
NOTE: Running task 1311 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Started
NOTE: Running task 1694 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1698 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 1699 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_unpack)
NOTE: Running task 1700 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1701 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: Running task 1702 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_collect_spdx_deps)
NOTE: Running task 1703 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_collect_spdx_deps)
NOTE: Running task 1719 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_rpm)
NOTE: Running task 1723 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1724 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Started
NOTE: Running task 1725 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1726 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1728 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_patch)
NOTE: Running task 1729 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1730 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_create_spdx)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1731 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx)
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1733 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1734 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Started
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 512 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1735 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_fetch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1736 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1737 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic)
NOTE: Running task 1738 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_unpack)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1746 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic unihash changed to 3a8197519cf69b63c4da8bb528037e10d9c6364dc54a3a7ebcfa32435713d715
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_create_spdx)
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1721 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 54 skipped, 0 masked, 0 errors.
Removing 2 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee49a78059b8c63abf3b91959b76be0ae74fb1f4"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 31 Mirrors 0 Missed 21 Current 460 (59% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 475 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/python3-importlib-metadata/6.7.0-r0/temp/log.do_packagedata_setscene.1523976
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 511 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_setscene)
NOTE: Running task 1311 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_fetch)
NOTE: Running task 1695 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Started
NOTE: Running task 1696 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1697 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_collect_spdx_deps)
NOTE: Running task 1698 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_unpack)
NOTE: Running task 1699 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1701 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: Running task 1702 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_collect_spdx_deps)
NOTE: Running task 1720 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1721 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm)
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1722 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1724 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 1725 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_patch)
NOTE: Running task 1726 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1727 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx)
NOTE: Running task 1728 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package_write_rpm)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1729 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx)
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1730 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_create_spdx)
NOTE: Running task 1731 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_create_spdx)
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Started
NOTE: Running setscene task 512 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1735 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1736 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1737 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Started
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_unpack)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic unihash changed to 3a8197519cf69b63c4da8bb528037e10d9c6364dc54a3a7ebcfa32435713d715
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1746 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_create_spdx)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Started
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_sysroot)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1721 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8246474307111144204==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.17.3-4.18.3.patch"

RnJvbSA5OWI4Mjg5MzE2M2MxOWU2Nzg3MjM4MDZlMDM5NmI3ZjNjNzZjYzNmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTI6MjM6MDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25zY2hlbWE6IHVwZ3JhZGUgNC4xNy4zIC0+IDQuMTguMwoKLS0tCiAuLi55dGhv
bjMtanNvbnNjaGVtYV80LjE3LjMuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMTguMy5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25zY2hlbWFfNC4x
Ny4zLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjE4LjMuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNy4z
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4x
OC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTcuMy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xOC4zLmJiCmluZGV4
IDI0Y2RlMzcxMWMuLjZjZTIyNTlmMTYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTcuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE4LjMuYmIKQEAgLTQsNyArNCw3
IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9N2E2MGE4MWMxNDZlYzI1NTk5YTNlMWRhYmI4NjEwYTggXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vanNvbi9MSUNFTlNFO21kNT05ZDRkZTQzMTExZDMzNTcwYzhmZTQ5YjRjYjBlMDFh
ZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBmODY0NDM3YWI4YjYwNzZiYTY3MDc0NTNlZjhm
OThhNmEwZDUxMmE4MGU5M2Y4YWJkYjY3NmY3MzdlY2I2MGQiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNjRiNzEwNGQ3MmVmZTg1NmJlYTQ5Y2E0YWYzN2ExNGE5ZWJhMzFiNDBiYjcyMzgxNzlmMzgw
MzEzMGZkMzRkOSIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi4zOS4y
Cgo=

--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 48 skipped, 0 masked, 0 errors.
Removing 32 recipes from the core2-32 sysroot...done.
Removing 50 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee49a78059b8c63abf3b91959b76be0ae74fb1f4"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 255 Local 234 Mirrors 0 Missed 21 Current 252 (91% match, 95% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 253 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 254 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 266 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 267 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 268 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 274 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pathlib2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 277 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 280 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 281 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 282 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 283 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-six_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pytest_7.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 287 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-unittest-automake-output_0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 288 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 289 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 290 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 383 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_fetch)
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 305 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-attrs_23.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-zipp-3.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 306 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb:do_packagedata_setscene)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Started
NOTE: Running setscene task 307 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_package_write_rpm_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/python3-importlib-metadata/6.7.0-r0/temp/log.do_packagedata_setscene.1544933
NOTE: Running setscene task 308 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-unittest-automake-output-0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-six-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pathlib2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytest-7.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 309 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_setscene)
NOTE: recipe python3-3.11.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-attrs-23.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3987-1.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_setscene)
NOTE: Running setscene task 314 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-more-itertools_9.1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 317 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package_setscene)
NOTE: Running setscene task 320 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_setscene)
NOTE: Running setscene task 327 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_setscene)
NOTE: Running setscene task 328 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-zipp_3.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 332 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 333 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 409 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_unpack)
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 349 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-zipp-3.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-more-itertools-9.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+8259375d30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 355 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 359 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 361 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 372 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 379 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 381 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_setscene: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 393 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 398 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 400 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 401 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 402 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 403 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 404 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 405 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 406 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 407 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1010 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_patch)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1115 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_fetch)
NOTE: recipe python3-idna-3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1116 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_fetch)
NOTE: Running task 1117 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_fetch)
NOTE: Running task 1118 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_fetch)
NOTE: Running task 1119 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_fetch)
NOTE: recipe python3-webcolors-1.13-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1120 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Succeeded
NOTE: Running task 1121 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1122 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_fetch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_fetch: Succeeded
NOTE: Running task 1127 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_unpack)
NOTE: Running task 1128 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_unpack)
NOTE: Running task 1129 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_unpack)
NOTE: Running task 1130 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_unpack)
NOTE: Running task 1131 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_unpack)
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_fetch: Succeeded
NOTE: Running task 1132 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_unpack)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_unpack: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic unihash changed to 3a8197519cf69b63c4da8bb528037e10d9c6364dc54a3a7ebcfa32435713d715
NOTE: recipe python3-webcolors-1.13-r0: task do_unpack: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 411 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 412 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 413 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 417 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 418 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 421 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 423 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 427 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 428 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 429 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 430 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 431 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 433 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 439 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 443 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 447 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 452 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 463 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 464 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 468 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 472 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 475 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 477 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 480 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 482 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 484 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 486 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 487 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 488 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 490 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+718f363bc2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 494 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 495 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 501 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 504 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 505 of 507 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1564 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1629 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata)
NOTE: Running task 1662 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_collect_spdx_deps)
NOTE: Running task 1699 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_collect_spdx_deps)
NOTE: Running task 1700 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1702 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 1703 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_collect_spdx_deps)
NOTE: Running task 1704 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Started
NOTE: Running task 1705 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1719 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_rpm)
NOTE: Running task 1720 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package_write_rpm)
NOTE: Running task 1722 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1723 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1724 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1726 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1727 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_create_spdx)
NOTE: Running task 1728 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_create_spdx)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1729 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1730 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Started
NOTE: Running task 1731 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_create_spdx)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Started
NOTE: Running task 1732 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1733 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_configure)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Succeeded
NOTE: Running task 1734 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_compile)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Succeeded
NOTE: Running task 1735 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_install)
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Succeeded
NOTE: Running task 1736 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package)
NOTE: Running task 1737 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Succeeded
NOTE: Running task 1738 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1739 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_spdx)
NOTE: Running task 1740 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_write_rpm)
NOTE: Running task 1741 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1742 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1743 of 1743 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1743 tasks of which 1694 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1806 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1804 targets, 37 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee49a78059b8c63abf3b91959b76be0ae74fb1f4"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 31 Mirrors 0 Missed 21 Current 460 (59% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 475 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/python3-importlib-metadata/6.7.0-r0/temp/log.do_packagedata_setscene.1517008
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 511 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_setscene)
NOTE: Running task 1311 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Started
NOTE: Running task 1694 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1696 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: Running task 1697 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_unpack)
NOTE: Running task 1698 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_collect_spdx_deps)
NOTE: Running task 1700 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_collect_spdx_deps)
NOTE: Running task 1703 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_collect_spdx_deps)
NOTE: Running task 1719 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1721 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1722 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1723 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_rpm)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 1725 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_patch)
NOTE: Running task 1726 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1728 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1729 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1730 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Started
NOTE: Running task 1731 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx)
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_create_spdx)
NOTE: Running task 1733 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_create_spdx)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 512 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1735 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1736 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1737 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Started
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_unpack)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1746 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata)
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic unihash changed to 3a8197519cf69b63c4da8bb528037e10d9c6364dc54a3a7ebcfa32435713d715
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_configure)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_compile)
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_create_spdx)
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1721 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8246474307111144204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1804 targets, 64 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ee49a78059b8c63abf3b91959b76be0ae74fb1f4"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 52 Local 31 Mirrors 0 Missed 21 Current 460 (59% match, 95% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 475 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/python3-importlib-metadata/6.7.0-r0/temp/log.do_packagedata_setscene.1530931
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 511 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_setscene)
NOTE: Running task 1311 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_fetch)
NOTE: Running task 1695 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Started
NOTE: Running task 1696 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_fetch: Succeeded
NOTE: Running task 1697 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_unpack)
NOTE: Running task 1698 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1699 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_collect_spdx_deps)
NOTE: Running task 1701 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_collect_spdx_deps)
NOTE: Running task 1702 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_collect_spdx_deps)
NOTE: Running task 1720 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_package_write_rpm)
NOTE: Running task 1721 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_package_write_rpm)
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 1722 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_package_write_rpm)
NOTE: Running task 1724 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1725 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_package_write_rpm)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_unpack: Succeeded
NOTE: Running task 1728 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_patch)
NOTE: Running task 1729 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1730 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyrsistent_0.19.3.bb:do_create_spdx)
NOTE: recipe python3-jsonpointer-2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1731 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonpointer_2.4.bb:do_create_spdx)
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1732 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb:do_create_spdx)
NOTE: recipe python3-idna-3.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Started
NOTE: Running task 1733 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-idna_3.4.bb:do_create_spdx)
NOTE: recipe python3-webcolors-1.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Started
NOTE: Running task 1734 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-webcolors_1.13.bb:do_create_spdx)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 512 of 512 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Started
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1735 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_fetch)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_patch: Succeeded
NOTE: Running task 1736 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1737 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1738 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_unpack)
NOTE: recipe python3-webcolors-1.13-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-rfc3339-validator-0.1.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_lic: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_lic unihash changed to 3a8197519cf69b63c4da8bb528037e10d9c6364dc54a3a7ebcfa32435713d715
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 1746 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_packagedata)
NOTE: Running task 1747 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-jsonpointer-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1748 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_configure)
NOTE: recipe python3-webcolors-1.13-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-idna-3.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Started
NOTE: recipe python3-pyrsistent-0.19.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_configure: Succeeded
NOTE: Running task 1749 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_compile)
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 1750 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_create_spdx)
NOTE: Running task 1751 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-importlib-metadata_6.7.0.bb:do_package_write_rpm)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_compile: Succeeded
NOTE: Running task 1752 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_install)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Started
NOTE: recipe python3-importlib-metadata-6.7.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_install: Succeeded
NOTE: Running task 1753 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package)
NOTE: Running task 1754 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_populate_sysroot)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package: Succeeded
NOTE: Running task 1755 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_packagedata)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1756 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_spdx)
NOTE: Running task 1757 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_write_rpm)
NOTE: Running task 1758 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_package_qa)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 1759 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_create_runtime_spdx)
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_qa: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-jsonschema-4.18.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1760 of 1760 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jsonschema_4.18.3.bb:do_build)
NOTE: Tasks Summary: Attempted 1760 tasks of which 1721 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There was 1 WARNING message.
Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-src went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dbg went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-staticdev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-dev went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-doc went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata-locale went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-importlib-metadata went backwards which would break package feeds (from 0:6.8.0-r0 to 0:6.7.0-r0) [version-going-backwards]
ERROR: python3-importlib-metadata-6.7.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8246474307111144204==--

