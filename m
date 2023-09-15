Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C564EEE24A
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 19:00:00 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.29675.1694804393886994636
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=L9bIzrYQ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=KAuKbN4T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018a9a36bce1-127bf7c9-7c90-47da-96ec-9e8fe88619ed-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aDiWLrC1ltDUgxhkvQdB5mmN15odA2/qqIbZ2XBS07g=;
	b=L9bIzrYQ4MQDEmV0zMf2rcxLXranVMSb3+72WgVlt5ctpeP3NK8U2CDaC0hWw2q9
	/x88ti/4w1Oa6NqCioqQ5VvFgVJxrfORAi48AusK3pZ3zQgCx5/ky/LxjfW1ao1f6d0
	+hcgSZpkKK4/gMkgpR5Qamws1qWCSfUX8lCRYX5A=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804393;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aDiWLrC1ltDUgxhkvQdB5mmN15odA2/qqIbZ2XBS07g=;
	b=KAuKbN4T1rRcdvfrZZng2jckOWrlaQtrxsPurEbtnL3Ou4bsn4hjsr1Cz7b0Tp7w
	edYyJdCxPGJsPg4rNzRrrSBDG5dGu0E33OeO3/2K/naJ4W1Eb75+yPb9m1yGF9BnfE2
	cidbw5KG3WyKC/fo901jlxL9DWbtj+pKzYkXUW5M=
Content-Type: multipart/mixed; boundary="===============6693178536712185820=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.19.0 SUCCEEDED
Message-ID: <0101018a9a36bce1-127bf7c9-7c90-47da-96ec-9e8fe88619ed-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:53 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 19:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187702

--===============6693178536712185820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.19.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.17.3-4.19.0.patch
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
From 306e9043d7e43e4fde051fc3737d296b1feaf2d7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 10:09:03 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.17.3 -> 4.19.0

---
 ...ython3-jsonschema_4.17.3.bb => python3-jsonschema_4.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.17.3.bb => python3-jsonschema_4.19.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb b/meta/recipes-devtools/python/python3-jsonschema_4.19.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.19.0.bb
index 24cde3711c..4f726ff0e1 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.19.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d"
+SRC_URI[sha256sum] = "6e1e7569ac13be8139b2dd2c21a55d350066ee3f80df06c608b398cdc6f30e8f"
 
 inherit pypi python_hatchling
 
-- 
2.39.2


--===============6693178536712185820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.17.3.tar.gz;downloadfilename=jsonschema-4.17.3.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.19.0.tar.gz;downloadfilename=jsonschema-4.19.0.tar.gz"
packages/core2-32-poky-linux/python3-jsonschema: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: removed "/usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py /usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 466649 to 477073 (+2%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.17.3" to "4.19.0"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.19.0.dist-info, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.19.0.dist-info/licenses, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-d
 ata /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft3.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation /usr/lib/python3.11/site-packages/jsonschema/schemas/draft7.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.
 11/site-packages/jsonschema/schemas/draft2020-12.json", added "/usr/lib/python3.11/site-packages/jsonschema/_typing.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/nested_schemas.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.17.3 [default] to 4.19.0 [default]
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 468705 to 462335 (-1%)
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.17.3" to "4.19.0"
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.19.0.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/nested_schemas.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py was added
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

--===============6693178536712185820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: removed "/usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py /usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc"
packages/core2-32-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.19.0.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.19.0.dist-info, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data /u
 sr/lib/python3.11/site-packages/jsonschema/schemas/draft2020-12.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.11/site-packages/jsonschema/schemas/draft7.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/draft3.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/js
 onschema/schemas/vocabularies/draft2020-12/applicator", added "/usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py /usr/lib/python3.11/site-packages/jsonschema/_typing.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/nested_schemas.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py"
Changes to packages/core2-32-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.19.0.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/nested_schemas.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py was added
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

--===============6693178536712185820==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.17.3-4.19.0.patch"

RnJvbSAzMDZlOTA0M2Q3ZTQzZTRmZGUwNTFmYzM3MzdkMjk2YjFmZWFmMmQ3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTA6MDk6MDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLWpzb25zY2hlbWE6IHVwZ3JhZGUgNC4xNy4zIC0+IDQuMTkuMAoKLS0tCiAuLi55dGhv
bjMtanNvbnNjaGVtYV80LjE3LjMuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMTkuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLWpzb25zY2hlbWFfNC4x
Ny4zLmJiID0+IHB5dGhvbjMtanNvbnNjaGVtYV80LjE5LjAuYmJ9ICg5MyUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNy4z
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4x
OS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTcuMy5iYgpyZW5hbWUgdG8gbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xOS4wLmJiCmluZGV4
IDI0Y2RlMzcxMWMuLjRmNzI2ZmYwZTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTcuMy5iYgorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE5LjAuYmIKQEAgLTQsNyArNCw3
IEBAIExJQ0VOU0UgPSAiTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORztt
ZDU9N2E2MGE4MWMxNDZlYzI1NTk5YTNlMWRhYmI4NjEwYTggXAogICAgICAgICAgICAgICAgICAg
ICBmaWxlOi8vanNvbi9MSUNFTlNFO21kNT05ZDRkZTQzMTExZDMzNTcwYzhmZTQ5YjRjYjBlMDFh
ZiIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjBmODY0NDM3YWI4YjYwNzZiYTY3MDc0NTNlZjhm
OThhNmEwZDUxMmE4MGU5M2Y4YWJkYjY3NmY3MzdlY2I2MGQiCitTUkNfVVJJW3NoYTI1NnN1bV0g
PSAiNmUxZTc1NjlhYzEzYmU4MTM5YjJkZDJjMjFhNTVkMzUwMDY2ZWUzZjgwZGYwNmM2MDhiMzk4
Y2RjNmYzMGU4ZiIKIAogaW5oZXJpdCBweXBpIHB5dGhvbl9oYXRjaGxpbmcKIAotLSAKMi4zOS4y
Cgo=

--===============6693178536712185820==--

