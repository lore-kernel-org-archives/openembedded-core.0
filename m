Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B89E5C18E5B
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 14:25:15 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.8644.1698848703198982738
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Nov 2023 07:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=gfkG70nr;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=iQa256ae;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.31, mailfrom: 0101018b8b46043f-311a5842-9b0d-4b84-a033-c901e59db172-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0j4hnWWACb3+DR1/i7Khz1JW+oNTAicCHb01AdiGK1I=;
	b=gfkG70nrrgO9YNyhUjcJiERx1pz3aJL+OR0XJ5wRBx4WriWdXpYpg5zgDiR8kUx0
	akbql2WLu8V3V+PfHj4J2xDm8S9ZzPd6yJPr3TiSCSjtZ5LTpykrKE3WyBaF7EEkZZ4
	9lB1GeRk4eOMwIox8SbZvTTWnHrNp8g9quyn8VUk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1698848703;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0j4hnWWACb3+DR1/i7Khz1JW+oNTAicCHb01AdiGK1I=;
	b=iQa256aeD3sp4eIKbQMmilgmXRsBfgkDSBez55DRZF+ORY3JdiiTVqt7HneQHU6N
	mY6jgZpaD7CQWz0Dgw3Pbuhcam4UxK6BNQvZtdgoRbCr5cf3UojZlJcrA4j18t50oDJ
	+rbTm9RJNX2btAa84YcUzpx/v5t9K0LrwR/JYK24=
Content-Type: multipart/mixed; boundary="===============8491066412955733845=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-jsonschema: upgrading to 4.19.2 SUCCEEDED
Message-ID: <0101018b8b46043f-311a5842-9b0d-4b84-a033-c901e59db172-000000@us-west-2.amazonses.com>
Date: Wed, 1 Nov 2023 14:25:03 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Nov 2023 14:25:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189951

--===============8491066412955733845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-jsonschema* to *4.19.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-jsonschema-upgrade-4.17.3-4.19.2.patch
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
From a4a2fb7522a427dc0d791759c199c63cb53a73f7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Nov 2023 08:52:51 +0000
Subject: [PATCH] python3-jsonschema: upgrade 4.17.3 -> 4.19.2

---
 ...ython3-jsonschema_4.17.3.bb => python3-jsonschema_4.19.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-jsonschema_4.17.3.bb => python3-jsonschema_4.19.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb b/meta/recipes-devtools/python/python3-jsonschema_4.19.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
rename to meta/recipes-devtools/python/python3-jsonschema_4.19.2.bb
index 77f94924f9..b770dc2fa4 100644
--- a/meta/recipes-devtools/python/python3-jsonschema_4.17.3.bb
+++ b/meta/recipes-devtools/python/python3-jsonschema_4.19.2.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=7a60a81c146ec25599a3e1dabb8610a8 \
                     file://json/LICENSE;md5=9d4de43111d33570c8fe49b4cb0e01af"
 
-SRC_URI[sha256sum] = "0f864437ab8b6076ba6707453ef8f98a6a0d512a80e93f8abdb676f737ecb60d"
+SRC_URI[sha256sum] = "c9ff4d7447eed9592c23a12ccee508baf0dd0d59650615e847feb6cdca74f392"
 
 inherit pypi python_hatchling
 
-- 
2.39.2


--===============8491066412955733845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-jsonschema: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema: SRC_URI changed from "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.17.3.tar.gz;downloadfilename=jsonschema-4.17.3.tar.gz" to "https://files.pythonhosted.org/packages/source/j/jsonschema/jsonschema-4.19.2.tar.gz;downloadfilename=jsonschema-4.19.2.tar.gz"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dbg: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-dev: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-doc: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-locale: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-src: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-staticdev: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGSIZE changed from 466649 to 483579 (+4%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: removed "/usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py /usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PV changed from "4.17.3" to "4.19.2"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGSIZE changed from 468705 to 462261 (-1%)
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: PKGV changed from 4.17.3 [default] to 4.19.2 [default]
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.19.2.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.19.2.dist-info, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_validators.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annotation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabulari
 es/draft2019-09/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2020-12.json /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_validators.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft3.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json /usr/lib/python3.11/site-packages/jsonschema/_validators.py /usr/lib/python3.11/site-packages/jsonschema/schemas/draft7.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabulari
 es/draft2020-12/meta-data /usr/lib/python3.11/site-packages/jsonschema/_legacy_validators.py /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data", added "/usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_keywords.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc /usr/lib/python3.11/
 site-packages/jsonschema/benchmarks/nested_schemas.py /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_keywords.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/_typing.py /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/_keywords.py /usr/lib/python3.11/site-packages/jsonschema/_legacy_keywords.py"
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.19.2.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/nested_schemas.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py was added
  /usr/lib/python3.11/site-packages/jsonschema/_keywords.py was added
  /usr/lib/python3.11/site-packages/jsonschema/_legacy_keywords.py was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_keywords.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_keywords.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/_typing.py was added
  /usr/lib/python3.11/site-packages/jsonschema/_legacy_validators.py was removed
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_validators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_validators.cpython-311.pyc was removed
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
  /usr/lib/python3.11/site-packages/jsonschema/_validators.py was removed

--===============8491066412955733845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema-tests: FILELIST: removed "/usr/lib/python3.11/site-packages/jsonschema/tests/__pycache__/_helpers.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/tests/_helpers.py"
packages/core2-64-poky-linux/python3-jsonschema/python3-jsonschema: FILELIST: directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info/licenses -> /usr/lib/python3.11/site-packages/jsonschema-4.19.2.dist-info/licenses, directory renamed /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info -> /usr/lib/python3.11/site-packages/jsonschema-4.19.2.dist-info, removed "/usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/content /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/content /usr/lib/python3.11/site-packages/jsonschema/schemas/draft7.json /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_validators.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/meta-data /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-annota
 tion /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/applicator /usr/lib/python3.11/site-packages/jsonschema/_validators.py /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/core /usr/lib/python3.11/site-packages/jsonschema/_legacy_validators.py /usr/lib/python3.11/site-packages/jsonschema/schemas/draft4.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/core /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2019-09/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/validation /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/unevaluated /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2020-12.json /usr/lib/python3.11/site-packages/jsonschema/schemas/draft2019-09.json /usr/lib/python3.11/site-packages/jsonschem
 a/schemas/draft3.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/format-assertion /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_validators.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/schemas/draft6.json /usr/lib/python3.11/site-packages/jsonschema/schemas/vocabularies/draft2020-12/applicator", added "/usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/nested_schemas.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/_legacy_keywords.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache_
 _/validator_creation.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/_keywords.py /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_keywords.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_keywords.cpython-311.pyc /usr/lib/python3.11/site-packages/jsonschema/_typing.py /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc"
Changes to packages/core2-64-poky-linux/python3-jsonschema (sysroot):
  /usr/lib/python3.11/site-packages/jsonschema-4.17.3.dist-info moved to /usr/lib/python3.11/site-packages/jsonschema-4.19.2.dist-info
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/nested_schemas.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/nested_schemas.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/subcomponents.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/unused_registry.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/__pycache__/validator_creation.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/subcomponents.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/unused_registry.py was added
  /usr/lib/python3.11/site-packages/jsonschema/benchmarks/validator_creation.py was added
  /usr/lib/python3.11/site-packages/jsonschema/_keywords.py was added
  /usr/lib/python3.11/site-packages/jsonschema/_legacy_keywords.py was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_keywords.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_keywords.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_typing.cpython-311.pyc was added
  /usr/lib/python3.11/site-packages/jsonschema/_typing.py was added
  /usr/lib/python3.11/site-packages/jsonschema/_legacy_validators.py was removed
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_legacy_validators.cpython-311.pyc was removed
  /usr/lib/python3.11/site-packages/jsonschema/__pycache__/_validators.cpython-311.pyc was removed
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
  /usr/lib/python3.11/site-packages/jsonschema/_validators.py was removed

--===============8491066412955733845==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-jsonschema-upgrade-4.17.3-4.19.2.patch"

RnJvbSBhNGEyZmI3NTIyYTQyN2RjMGQ3OTE3NTljMTk5YzYzY2I1M2E3M2Y3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBOb3YgMjAyMyAwODo1Mjo1MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtanNvbnNjaGVtYTogdXBncmFkZSA0LjE3LjMgLT4gNC4xOS4yCgotLS0KIC4uLnl0aG9u
My1qc29uc2NoZW1hXzQuMTcuMy5iYiA9PiBweXRob24zLWpzb25zY2hlbWFfNC4xOS4yLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtanNvbnNjaGVtYV80LjE3
LjMuYmIgPT4gcHl0aG9uMy1qc29uc2NoZW1hXzQuMTkuMi5iYn0gKDkzJSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE3LjMu
YmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE5
LjIuYmIKc2ltaWxhcml0eSBpbmRleCA5MyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNy4zLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtanNvbnNjaGVtYV80LjE5LjIuYmIKaW5kZXgg
NzdmOTQ5MjRmOS4uYjc3MGRjMmZhNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3B5dGhvbi9weXRob24zLWpzb25zY2hlbWFfNC4xNy4zLmJiCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1qc29uc2NoZW1hXzQuMTkuMi5iYgpAQCAtNCw3ICs0LDcg
QEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21k
NT03YTYwYTgxYzE0NmVjMjU1OTlhM2UxZGFiYjg2MTBhOCBcCiAgICAgICAgICAgICAgICAgICAg
IGZpbGU6Ly9qc29uL0xJQ0VOU0U7bWQ1PTlkNGRlNDMxMTFkMzM1NzBjOGZlNDliNGNiMGUwMWFm
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMGY4NjQ0MzdhYjhiNjA3NmJhNjcwNzQ1M2VmOGY5
OGE2YTBkNTEyYTgwZTkzZjhhYmRiNjc2ZjczN2VjYjYwZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICJjOWZmNGQ3NDQ3ZWVkOTU5MmMyM2ExMmNjZWU1MDhiYWYwZGQwZDU5NjUwNjE1ZTg0N2ZlYjZj
ZGNhNzRmMzkyIgogCiBpbmhlcml0IHB5cGkgcHl0aG9uX2hhdGNobGluZwogCi0tIAoyLjM5LjIK
Cg==

--===============8491066412955733845==--

