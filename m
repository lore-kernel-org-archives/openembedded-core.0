Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 941D5D5E12E
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:39 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17390.1765872134595423694
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=vE8gXtLM;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DAkjk1Oo;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ea291-1b8b2005-32be-4bf4-bdb9-2bfed1a05ab4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IJxG+pByiUrV5oHsg4ZTPFlBfnHE7GVq8iU7tCGEeI0=;
	b=vE8gXtLMScLNqVZyUJySsIRtiUVpJ2LGM2p28FqnINAYXLbxTLCSuP4yHoBgB88B
	VJjIdU7VI7NNRtpRwlB+rHg4XmFZHYn+ArX1V1FDg9UaSFD5LU3kwS0IpdKcbKDTQNH
	xeUyO+JZWa3LNksSHyMA0cGPya20Um/g2FGvpzyg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872149;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IJxG+pByiUrV5oHsg4ZTPFlBfnHE7GVq8iU7tCGEeI0=;
	b=DAkjk1Oo7sr8KVryAx/khS9VxZ5J5qizfqhfDe22AmOuQKTPzYqddLDxG+Gjvp7h
	Okpd2rRCI23jaUhtoNc+1tMN2BZJSHoDpZRP/5wfeqEO0KnEqWiadvjwHaI7+mFvNIr
	wPjzi94PpzqURT9kAbjGYVVWWIuqpsjBAda1f8Qk=
Content-Type: multipart/mixed; boundary="===============5457331173018923937=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 9.0.4 SUCCEEDED
Message-ID: <0101019b262ea291-1b8b2005-32be-4bf4-bdb9-2bfed1a05ab4-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:29 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227829

--===============5457331173018923937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *9.0.4* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-8.2.1-9.0.4.patch
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
From 6902e5f8c94d1fff1491d0fcb79c9bf6bf495b80 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 01:27:45 +0000
Subject: [PATCH] python3-sphinx: upgrade 8.2.1 -> 9.0.4

---
 .../python/{python3-sphinx_8.2.1.bb => python3-sphinx_9.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_8.2.1.bb => python3-sphinx_9.0.4.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb b/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
rename to meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
index 614566b8f4..00384b40e9 100644
--- a/meta/recipes-devtools/python/python3-sphinx_8.2.1.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=e30c37a2b7fb0afa3adc0d72b85e8b04"
 
-SRC_URI[sha256sum] = "e4b932951b9c18b039f73b72e4e63afe967d90408700ec222b981ac24647c01e"
+SRC_URI[sha256sum] = "594ef59d042972abbc581d8baa577404abe4e6c3b04ef61bd7fc2acbd51f3fa3"
 
 inherit python_flit_core pypi
 
-- 
2.47.1


--===============5457331173018923937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info -> /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info, directory renamed /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/sphinx/testing/__pycache__/path.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/testing/path.py", added "/usr/lib/python3.13/site-packages/sphinx/search/minified-js/lithuanian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_preserve_defaults.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.txt /usr/lib/python3.13/site-packages/sphinx/search/_s
 topwords/es.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/it.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.txt /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_sentinels.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_names.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_annotations.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/basque-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/minified-js/tamil-stemmer.js /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.po /usr/lib/python3.13/site-packages/sphinx/ext/a
 utodoc/_dynamic/__pycache__/_importer.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/armenian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_event_listeners.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/minified-js/catalan-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/english-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_directive_options.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/serbian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_signatures.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/yiddish-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_generate.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_renderer.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_comments.py /usr/lib/python3.13/site-packages/sp
 hinx/search/non-minified-js/serbian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_generate.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_loader.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/yiddish-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_comments.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/dutch_porter-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.txt /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_property_types.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/ru.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/sv.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/es.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/__init__.cpytho
 n-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_property_types.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__init__.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/da.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.py /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_docstrings.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_annotations.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_docstrings.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/no.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/greek-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/nepali-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/hindi-stemmer
 .js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/sv.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/hindi-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/irish-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_member_finder.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_signatures.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.mo /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fi.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_sentinels.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_names.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/basq
 ue-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_shared.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/estonian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/it.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_documenters.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/minified-js/esperanto-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/it.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/pt.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/es.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/README.rst /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_documenters.py /usr/lib/python3.13/site-packages/sphi
 nx/search/_stopwords/ru.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/arabic-stemmer.js /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.po /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_member_finder.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/irish-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_mock.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/tamil-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/dutch_porter-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/greek-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_renderer.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/catalan-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_importer.py /usr/lib/python3.13/site-packag
 es/sphinx/search/_stopwords/__pycache__/hu.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/ru.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/arabic-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/esperanto-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/de.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__init__.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_preserve_defaults.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_shared.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_directive_options.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fr.cpython-313.pyc /usr/lib/python3
 .13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__init__.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_mock.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_event_listeners.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/armenian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/estonian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_sentinels.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_loader.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive_options.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/
 en.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/lithuanian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_sentinels.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/nl.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/english-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/nepali-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive_options.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/indonesian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/sv.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.mo /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/indonesian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.py"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 16966169 to 18700945 (+10%)
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive_options.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_docstrings.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_importer.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__init__.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_loader.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_member_finder.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_mock.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_preserve_defaults.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__ was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_docstrings.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_importer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_loader.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_member_finder.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_mock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_preserve_defaults.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_signatures.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_annotations.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_comments.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_signatures.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_annotations.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_comments.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_event_listeners.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_generate.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_directive_options.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_documenters.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__init__.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__ was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_directive_options.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_documenters.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_sentinels.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_sentinels.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_names.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_property_types.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive_options.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_event_listeners.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_generate.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_names.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_property_types.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_renderer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_sentinels.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_shared.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_renderer.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_sentinels.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_shared.py was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/arabic-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/armenian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/basque-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/catalan-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/dutch_porter-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/english-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/esperanto-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/estonian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/greek-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/hindi-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/indonesian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/irish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/lithuanian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/nepali-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/README.rst was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/serbian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/tamil-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/yiddish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/arabic-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/armenian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/basque-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/catalan-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/dutch_porter-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/english-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/esperanto-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/estonian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/greek-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/hindi-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/indonesian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/irish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/lithuanian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/nepali-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/serbian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/tamil-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/yiddish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/es.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/es.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__init__.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/it.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/it.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__ was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/da.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/de.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/en.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/es.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fi.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/hu.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/it.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/nl.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/no.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/pt.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/ru.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/sv.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/ru.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/ru.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/sv.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/sv.txt was added
  /usr/lib/python3.13/site-packages/sphinx/testing/path.py was removed
  /usr/lib/python3.13/site-packages/sphinx/testing/__pycache__/path.cpython-313.pyc was removed

--===============5457331173018923937==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-8.2.1-9.0.4.patch"

RnJvbSA2OTAyZTVmOGM5NGQxZmZmMTQ5MWQwZmNiNzljOWJmNmJmNDk1YjgwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDE6Mjc6NDUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA4LjIuMSAtPiA5LjAuNAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBweXRob24zLXNwaGlueF85LjAuNC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF84LjIuMS5iYiA9PiBw
eXRob24zLXNwaGlueF85LjAuNC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF85LjAuNC5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
XzguMi4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54XzkuMC40LmJiCmluZGV4IDYxNDU2NmI4ZjQuLjAwMzg0YjQwZTkgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfOC4yLjEuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF85LjAuNC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0y
LUNsYXVzZSAmIE1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21k
NT1lMzBjMzdhMmI3ZmIwYWZhM2FkYzBkNzJiODVlOGIwNCIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU0YjkzMjk1MWI5YzE4YjAzOWY3M2I3MmU0ZTYzYWZlOTY3ZDkwNDA4NzAwZWMyMjJiOTgx
YWMyNDY0N2MwMWUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNTk0ZWY1OWQwNDI5NzJhYmJjNTgx
ZDhiYWE1Nzc0MDRhYmU0ZTZjM2IwNGVmNjFiZDdmYzJhY2JkNTFmM2ZhMyIKIAogaW5oZXJpdCBw
eXRob25fZmxpdF9jb3JlIHB5cGkKIAotLSAKMi40Ny4xCgo=

--===============5457331173018923937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/python3-sphinx: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.2.1.tar.gz;downloadfilename=sphinx-8.2.1.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-9.0.4.tar.gz;downloadfilename=sphinx-9.0.4.tar.gz"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 8.2.1 [default] to 9.0.4 [default]
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PV changed from "8.2.1" to "9.0.4"
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 16966169 to 18700945 (+10%)
packages/x86-64-v3-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info -> /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info, directory renamed /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info/licenses -> /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info/licenses, removed "/usr/lib/python3.13/site-packages/sphinx/testing/path.py /usr/lib/python3.13/site-packages/sphinx/testing/__pycache__/path.cpython-313.pyc", added "/usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_member_finder.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__init__.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_docstrings.py /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/ru.py /usr/lib/python3.13/site
 -packages/sphinx/search/_stopwords/it.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/estonian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/nl.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.mo /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_renderer.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/nepali-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_property_types.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_shared.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/hindi-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/indonesian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/dutch_porter-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_sentinels.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_names.py /usr/lib/python3.13/sit
 e-packages/sphinx/ext/autodoc/__pycache__/_generate.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/greek-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/esperanto-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/english-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_importer.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/yiddish-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_names.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_preserve_defaults.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.po /usr/lib/python3.13/site-package
 s/sphinx/search/_stopwords/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_annotations.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/serbian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/indonesian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_renderer.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.txt /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_documenters.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/es.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.txt /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_commen
 ts.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.txt /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive_options.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/basque-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__init__.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_signatures.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_importer.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_property_types.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_signatures.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/armenian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/estonian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/tamil-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/irish-stemmer.js /usr/lib/python3
 .13/site-packages/sphinx/search/non-minified-js/tamil-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_shared.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_member_finder.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/arabic-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/arabic-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/da.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_loader.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/no.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/dutch_porter-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/__init__.cpy
 thon-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/es.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/ru.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/sv.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/it.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.txt /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.txt /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.mo /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.txt /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_docstrings.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_directive_options.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/de.cpython-313.pyc /usr/lib/python3.13/site-packag
 es/sphinx/search/_stopwords/sv.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_mock.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_loader.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/lithuanian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_generate.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/en.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/minified-js/hindi-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/it.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/pt.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_sentinels.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_documenters.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/hu.cpython-313.pyc /us
 r/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/ru.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/lithuanian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/sv.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_preserve_defaults.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_sentinels.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/nepali-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_sentinels.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/basque-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/catalan-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/english-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/yiddish-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/mi
 nified-js/serbian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/armenian-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/README.rst /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_comments.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fi.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.py /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/catalan-stemmer.js /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.po /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive_options.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__init__.py /usr/lib/python3.13/site-packages/sphinx
 /ext/autodoc/__pycache__/_event_listeners.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/minified-js/irish-stemmer.js /usr/lib/python3.13/site-packages/sphinx/search/minified-js/esperanto-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_directive_options.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_annotations.py /usr/lib/python3.13/site-packages/sphinx/search/minified-js/greek-stemmer.js /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_event_listeners.py /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_mock.py /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/es.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/__init__.cpython-313.pyc /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fr.cpython-313.pyc"
Changes to packages/x86-64-v3-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.13/site-packages/sphinx-8.2.1.dist-info moved to /usr/lib/python3.13/site-packages/sphinx-9.0.4.dist-info
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive_options.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_directive.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_docstrings.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_importer.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__init__.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_loader.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_member_finder.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_mock.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_preserve_defaults.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__ was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_docstrings.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_importer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_loader.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_member_finder.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_mock.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_preserve_defaults.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_signatures.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_annotations.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/__pycache__/_type_comments.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_signatures.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_annotations.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_dynamic/_type_comments.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_event_listeners.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_generate.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_directive_options.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_documenters.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__init__.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__ was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_directive_options.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_documenters.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/__pycache__/_sentinels.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_legacy_class_based/_sentinels.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_names.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_property_types.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_directive_options.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_event_listeners.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_generate.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_names.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_property_types.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_renderer.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_sentinels.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/__pycache__/_shared.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_renderer.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_sentinels.py was added
  /usr/lib/python3.13/site-packages/sphinx/ext/autodoc/_shared.py was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.13/site-packages/sphinx/locale/nb/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.js was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.mo was added
  /usr/lib/python3.13/site-packages/sphinx/locale/no/LC_MESSAGES/sphinx.po was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/arabic-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/armenian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/basque-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/catalan-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/dutch_porter-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/english-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/esperanto-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/estonian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/greek-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/hindi-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/indonesian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/irish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/lithuanian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/nepali-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/README.rst was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/serbian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/tamil-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/minified-js/yiddish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/arabic-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/armenian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/basque-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/catalan-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/dutch_porter-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/english-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/esperanto-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/estonian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/greek-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/hindi-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/indonesian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/irish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/lithuanian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/nepali-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/serbian-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/tamil-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/non-minified-js/yiddish-stemmer.js was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/da.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/de.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/en.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/es.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/es.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fi.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/fr.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/hu.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__init__.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/it.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/it.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/nl.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/no.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/pt.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__ was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/da.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/de.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/en.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/es.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fi.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/fr.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/hu.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/__init__.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/it.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/nl.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/no.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/pt.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/ru.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/__pycache__/sv.cpython-313.pyc was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/ru.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/ru.txt was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/sv.py was added
  /usr/lib/python3.13/site-packages/sphinx/search/_stopwords/sv.txt was added
  /usr/lib/python3.13/site-packages/sphinx/testing/path.py was removed
  /usr/lib/python3.13/site-packages/sphinx/testing/__pycache__/path.cpython-313.pyc was removed

--===============5457331173018923937==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-617d164dbfec90f0b179ab6ca26ec7c4ed6adc2a"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:617d164dbfec90f0b179ab6ca26ec7c4ed6adc2a"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 607 Local 473 Mirrors 0 Missed 134 Current 272 (77% match, 84% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 276 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 277 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 280 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 283 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 292 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 294 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 335 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_qa_setscene)
NOTE: Running setscene task 365 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_populate_lic_setscene)
NOTE: Running setscene task 375 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 389 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 398 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 406 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 418 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 434 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_qa_setscene)
NOTE: Running setscene task 441 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 446 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 454 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 462 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-idna_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 469 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 475 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytz_2025.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 489 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 497 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 498 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 500 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 503 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 504 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 505 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 508 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 509 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-unittest-automake-output_0.3.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 510 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 512 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 515 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 517 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 518 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 519 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 520 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 521 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 522 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 523 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 524 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-idna-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pytz-2025.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 527 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 528 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 530 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.22.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 531 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pytest_8.4.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 532 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 533 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 534 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 536 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 537 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 538 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 539 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 541 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe python3-unittest-automake-output-0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 543 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 544 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 545 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 548 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 549 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 550 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 551 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 552 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 555 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 557 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 558 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pytest-8.4.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 567 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 592 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygments_2.19.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 593 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 599 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 600 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 601 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 610 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 611 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 613 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygments-2.19.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-packaging-25.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 620 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 626 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 631 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 636 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 864 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_fetch)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 647 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: Running task 884 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 911 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 927 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_fetch)
NOTE: Running setscene task 651 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 652 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 654 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 655 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: Running task 928 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_fetch)
NOTE: Running task 929 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_fetch)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 945 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_fetch)
NOTE: Running setscene task 656 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 659 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 660 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_fetch: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_fetch: Started
NOTE: Running setscene task 663 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 665 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_fetch: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 666 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 668 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 669 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 672 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 673 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 677 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 684 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 695 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 696 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 699 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 951 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_unpack)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 969 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_unpack)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 706 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 707 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 998 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_fetch)
NOTE: Running task 999 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_fetch)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 713 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 715 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_unpack: Succeeded
NOTE: Running setscene task 730 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 734 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1034 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_patch)
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1065 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_patch)
NOTE: Running task 1066 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_fetch)
NOTE: Running task 1067 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_fetch)
NOTE: Running task 1068 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_fetch)
NOTE: Running task 1069 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_fetch)
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1075 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_fetch)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1076 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_fetch)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running task 1084 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_fetch)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_fetch: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_fetch: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 742 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running task 1090 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_fetch)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_fetch: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1091 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_unpack)
NOTE: Running task 1092 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_unpack)
NOTE: Running task 1093 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_unpack)
NOTE: Running task 1094 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_fetch: Started
NOTE: Running task 1101 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_unpack)
NOTE: recipe python3-docutils-0.22.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Started
NOTE: Running task 1121 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_unpack)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_patch: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1122 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_unpack)
NOTE: Running setscene task 745 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 747 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Started
NOTE: Running setscene task 751 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_patch: Succeeded
NOTE: Running setscene task 752 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Started
NOTE: Running setscene task 756 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 757 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Started
NOTE: Running setscene task 761 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_unpack: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 762 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 763 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 772 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running setscene task 773 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 775 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 780 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1164 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_patch)
NOTE: Running task 1165 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_patch)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_unpack: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1172 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1173 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_patch)
NOTE: Running setscene task 796 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1184 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_unpack)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1195 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_unpack)
NOTE: Running setscene task 817 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_patch: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 819 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 820 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 823 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1201 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_unpack)
NOTE: recipe python3-requests-2.32.5-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_patch: Succeeded
NOTE: Running task 1207 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_unpack)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_patch: Succeeded
NOTE: Running task 1208 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_unpack)
NOTE: Running task 1209 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1211 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_unpack)
NOTE: recipe python3-babel-2.17.0-r0: task do_patch: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_unpack: Succeeded
NOTE: Running task 1217 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_unpack)
NOTE: Running task 1220 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_patch)
NOTE: Running task 1221 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_patch)
NOTE: Running task 1222 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_patch)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 827 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_unpack: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1228 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1234 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_patch)
NOTE: Running task 1235 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_patch)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_patch)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1265 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_patch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 836 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1284 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_patch)
NOTE: Running task 1312 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-docutils-0.22.3-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_fetch)
NOTE: Running task 1342 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_check_backend)
NOTE: Running task 1343 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_patch)
NOTE: recipe python3-requests-2.32.5-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Started
NOTE: Running task 1345 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_check_backend)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1348 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_check_backend)
NOTE: Running task 1362 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_fetch)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Started
NOTE: Running task 1373 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_fetch)
NOTE: recipe python3-babel-2.17.0-r0: task do_check_backend: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_patch: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_check_backend: Succeeded
NOTE: Running task 1374 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 1375 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_fetch)
NOTE: Running task 1381 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_unpack)
NOTE: recipe python3-requests-2.32.5-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_check_backend: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_check_backend: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_fetch: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1482 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_unpack)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_patch: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_fetch: Succeeded
NOTE: recipe python3-urllib3-2.5.0-r0: task do_fetch: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Started
NOTE: Running task 1485 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_unpack)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 1486 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_unpack)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 1487 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_unpack: Started
NOTE: Running task 1488 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe python3-certifi-2025.8.3-r0: task do_unpack: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_unpack: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 844 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1495 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_patch)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-urllib3-2.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 1496 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_patch)
NOTE: Running task 1497 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1498 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe python3-certifi-2025.8.3-r0: task do_patch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_patch: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_patch: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_patch: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_patch: Succeeded
NOTE: recipe python3-urllib3-2.5.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 851 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1500 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_check_backend)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_check_backend: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 855 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 857 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 859 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 860 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 861 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1509 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 865 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 877 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1839 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1899 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1960 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1961 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1962 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1963 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1964 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1965 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1966 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1967 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1968 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1969 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1971 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1972 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1973 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1974 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1975 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1976 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1977 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-babel-2.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1978 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_configure)
NOTE: Running task 1979 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Started
NOTE: Running task 1980 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1981 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_configure)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1982 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1983 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_configure)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Started
NOTE: Running task 1984 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_configure)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_configure: Started
NOTE: Running task 1985 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1986 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Started
NOTE: Running task 1988 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_configure)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_configure: Started
NOTE: Running task 1989 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_configure)
NOTE: recipe python3-babel-2.17.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_configure: Started
NOTE: Running task 1990 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_configure_ptest_base)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_configure: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Started
NOTE: Running task 1991 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_compile)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1992 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_configure_ptest_base)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_configure: Succeeded
NOTE: Running task 1993 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_configure)
NOTE: recipe python3-babel-2.17.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_configure: Succeeded
NOTE: Running task 1994 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_configure: Succeeded
NOTE: Running task 1995 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1996 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_compile)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 1997 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_compile)
NOTE: recipe python3-docutils-0.22.3-r0: task do_configure: Succeeded
NOTE: Running task 1998 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_compile)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_compile: Started
NOTE: Running task 1999 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_configure: Succeeded
NOTE: Running task 2000 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_compile)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2001 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2002 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_compile)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 2004 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_compile: Started
NOTE: Running task 2005 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile)
NOTE: recipe python3-babel-2.17.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Started
NOTE: Running task 2006 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_configure: Succeeded
NOTE: Running task 2007 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_compile)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Started
NOTE: Running task 2008 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_configure)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_configure: Succeeded
NOTE: Running task 2009 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2010 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_compile)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2011 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2013 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_install)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_compile: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile: Succeeded
NOTE: Running task 2014 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_install)
NOTE: Running task 2015 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_compile_ptest_base)
NOTE: Running task 2016 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_install)
NOTE: Running task 2017 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_compile: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_compile: Succeeded
NOTE: Running task 2019 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_install)
NOTE: Running task 2020 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_compile: Succeeded
NOTE: Running task 2021 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2022 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install)
NOTE: recipe python3-docutils-0.22.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_compile: Succeeded
NOTE: Running task 2023 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_install)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_compile: Succeeded
NOTE: Running task 2024 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_compile: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_compile: Succeeded
NOTE: Running task 2025 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_install)
NOTE: Running task 2026 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_install)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_install: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_install: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_compile: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2027 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_install: Succeeded
NOTE: Running task 2028 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package)
NOTE: Running task 2030 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package)
NOTE: Running task 2032 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2033 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_install: Succeeded
NOTE: Running task 2034 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_install: Succeeded
NOTE: Running task 2035 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Started
NOTE: Running task 2036 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Started
NOTE: Running task 2041 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_install_ptest_base)
NOTE: Running task 2054 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_install: Succeeded
NOTE: Running task 2055 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_install: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2056 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package)
NOTE: Running task 2057 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_install: Succeeded
NOTE: Running task 2058 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package)
NOTE: recipe python3-docutils-0.22.3-r0: task do_install: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_package: Started
NOTE: Running task 2059 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_install: Succeeded
NOTE: Running task 2081 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_compile_ptest_base)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Started
NOTE: Running task 2082 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_package: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2089 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package: Succeeded
NOTE: Running task 2131 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_prepare_recipe_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package unihash changed to 2a6f5fc62c292a9605f7bab7802e695167e0056800affd88118064cc1a954437
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_ipk became valid
NOTE: Running setscene task 873 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package unihash changed to 942b088eab52db6a5b2eb67f6c67111c0054014a4a7a8f4505817fe35b3f9701
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm became valid
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package unihash changed to cd69c4be4254f0ecc59a8098fe6e85031804e3e32133d7c03026c748fb0be411
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb became valid
NOTE: recipe python3-babel-2.17.0-r0: task do_compile: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 860 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 861 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 864 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 866 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_install: Succeeded
NOTE: Running setscene task 868 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 870 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 871 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 873 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 875 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.5-r0: task do_package: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2132 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_install)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package unihash changed to 4f077c08a71d6a6cc25756d2455af614b46400a3705c20be3f6818968bcec488
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_packagedata became valid
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_install: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package unihash changed to c1cf25f43d0f86270b3142c4dc932d2c63b3a066d166a746cb769f77e65a576d
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package unihash changed to 0aac879034bf945e3ce42c968ba14cb5c0648035cdc7bcb0d019202b5d85bb7c
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package unihash changed to 5341a1e5b6c75b52ca5ff3df16e4b288237fabdeb30d56b4d7d313fb2fab2d96
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package unihash changed to 94c18f2d7d87f8a5a2f98ced70cae9a4147a1a5f0cbd23e4852c2fb291309543
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package unihash changed to 2af1634727ffe774d6ccac44a3fca0d1437b1fbf3df51e801b05cdf74efafda7
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package unihash changed to 20030afcaf4bc877ec9b52039b53ca26888129ec4f7e24501b4eabc55afe2f04
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package unihash changed to ea63b638e4241342e586262645e8902e083782629084f56d9035e4f359758d63
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm became valid
NOTE: Running setscene task 826 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 827 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 828 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 829 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 830 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 831 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 832 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 836 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 838 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 846 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 847 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 849 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 856 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package unihash changed to e02c7bfbae600dbb68945a3b150f0a427ef61acb450d3dd442431341b9893141
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_deb became valid
NOTE: Running setscene task 848 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 852 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 853 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 856 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 857 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 861 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 862 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 863 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 868 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 869 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_packagedata_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 871 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 872 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 873 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 874 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2133 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 875 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 876 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_packagedata_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 878 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package: Started
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_packagedata_setscene)
NOTE: Running task 2135 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2136 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-requests-2.32.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2141 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2155 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 2173 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_install_ptest_base)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2205 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_populate_sysroot)
NOTE: recipe python3-certifi-2025.8.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2206 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_collect_spdx_deps)
NOTE: Running task 2207 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2209 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_package: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Started
NOTE: Running task 2216 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_populate_sysroot: Started
NOTE: Running task 2217 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package unihash changed to 9118abf0472071ddb60dc0ba252d73477a1336ca86632d0fde80e36e5ffaef43
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_write_deb became valid
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: Running setscene task 871 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-chardet-5.2.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 872 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 876 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_write_rpm_setscene)
NOTE: Running task 2218 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_compile)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2219 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2220 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_collect_spdx_deps)
NOTE: Running task 2221 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_compile: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2222 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 2223 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_collect_spdx_deps)
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running task 2224 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_populate_sysroot)
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_packagedata_setscene)
NOTE: Running task 2225 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_configure)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2226 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_configure)
NOTE: recipe python3-babel-2.17.0-r0: task do_install: Succeeded
NOTE: Running task 2227 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_collect_spdx_deps)
NOTE: Running task 2228 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_populate_sysroot)
NOTE: Running task 2229 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package)
NOTE: recipe python3-requests-2.32.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_populate_sysroot: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_configure: Started
NOTE: Running task 2230 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_configure)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_populate_sysroot unihash changed to 016b12818ba86f3f5968e5bc451181db82a7a9d32991e18125e1665c3ef16ea3
NOTE: recipe python3-requests-2.32.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_populate_sysroot unihash changed to 7305bf44bd9047902c7bf9f1e5de9c413ae02ae947a7a929ceeac2451572eac9
NOTE: recipe python3-sphinx-9.0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.5.0-r0: task do_configure: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_configure: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_populate_sysroot unihash changed to b911f608308c28b971adf6b8243df632c8ba11a856ab8e94751e1e9b3870a4fc
NOTE: Setscene tasks completed
NOTE: Running task 2232 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_compile)
NOTE: Running task 2233 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_compile)
NOTE: Running task 2234 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_populate_sysroot)
NOTE: Running task 2235 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_collect_spdx_deps)
NOTE: Running task 2236 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_populate_sysroot)
NOTE: Running task 2237 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_configure: Succeeded
NOTE: Running task 2238 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_compile)
NOTE: Running task 2239 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot)
NOTE: Running task 2240 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_populate_sysroot unihash changed to 5f6b125a3c24ea740b4cf3670ffb3f695a24e6b7a4c9a28888228946c6aa841d
NOTE: recipe python3-certifi-2025.8.3-r0: task do_compile: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_populate_sysroot unihash changed to 797a8a76450e0533b559ae5786a2a203d44d27ba8aafa8af90a7684540cc0964
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2241 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2242 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_collect_spdx_deps)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_compile: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2243 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_populate_sysroot)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_populate_sysroot unihash changed to 7ad1790f3be065bdc4707aa075435df4d00b1060bb9a014ec57d9e406c4b9e56
NOTE: recipe python3-jinja2-3.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_collect_spdx_deps: Started
NOTE: Setscene tasks completed
NOTE: Running task 2246 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_collect_spdx_deps)
NOTE: Running task 2247 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2248 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-docutils-0.22.3-r0: task do_populate_sysroot: Started
NOTE: recipe python3-docutils-0.22.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2249 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-alabaster-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_populate_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_populate_sysroot unihash changed to 6dc06227c201d851b86e1e9df6b7aa990c2c659b14133ff2b57297dbe393d93c
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2250 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_collect_spdx_deps)
NOTE: Running task 2251 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_populate_sysroot)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2252 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_populate_sysroot unihash changed to e613595cbadd4029aed38e211234f9f8f8e8ea7ab8a49d8dca6b7268e406c667
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_populate_sysroot unihash changed to cdf0afb9f4e98961af2a7b1aa011c07ba837c403b3f8aca2b0db0b4d3d48f52c
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_populate_sysroot unihash changed to e5cca44cdce28a10e636d9e66a1027de40fd408f7e3130528e363d12c452e564
NOTE: Running task 2253 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_populate_sysroot)
NOTE: Running task 2254 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_create_spdx)
NOTE: Running task 2256 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2257 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_populate_sysroot unihash changed to f6466568d55f2c8305fa0e6c07c7f3ce061cfc894a0b0bfcdf11142540b04ad5
NOTE: recipe python3-docutils-0.22.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_populate_sysroot unihash changed to 77f2c364e5dc73ef8ecf6b717491235f8dd249eb20b112cac423a9774d0c6618
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_populate_sysroot unihash changed to 370a6ffcf1e02e2267a900fef1012c22b4e2106a30b099afdf6c13899f35c8d8
NOTE: recipe python3-imagesize-1.4.1-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx: Started
NOTE: Running task 2258 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_create_spdx)
NOTE: recipe python3-chardet-5.2.0-r0: task do_compile: Succeeded
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx: Started
NOTE: Running task 2259 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_install)
NOTE: Running task 2260 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_create_spdx)
NOTE: Running task 2261 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_create_spdx)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx: Started
NOTE: Running task 2262 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_create_spdx)
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_package: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_package unihash changed to 5df4253288eec58df7e7d0290a0bddc4871a45989aa987264800c6ce972cd854
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk became valid
NOTE: Running setscene task 875 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_install: Started
NOTE: Running setscene task 877 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 878 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2263 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_install)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_populate_sysroot unihash changed to bb0dac02e5393a1230747f9dd4cc4a41c700f4db53ef4b38357e9ae4d152469e
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Started
NOTE: Running task 2264 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_create_spdx)
NOTE: Running task 2265 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_create_spdx)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_populate_sysroot unihash changed to 88035449ea689748c88fa404dcdc3cb81e69a1992d24e915c32f89d2bc3b8ad4
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running task 2267 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Started
NOTE: Running task 2268 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_create_spdx)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_compile: Succeeded
NOTE: Running task 2269 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_create_spdx)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx: Started
NOTE: Running task 2270 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_install)
NOTE: Running task 2271 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx)
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_create_spdx: Started
NOTE: recipe python3-jinja2-3.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-markupsafe_3.0.3.bb:do_packagedata_setscene)
NOTE: Running task 2275 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa)
NOTE: Running task 2283 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_qa)
NOTE: recipe python3-certifi-2025.8.3-r0: task do_compile: Succeeded
NOTE: Running task 2286 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_install)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx: Started
NOTE: Running task 2288 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_qa)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_install: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_install: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa: Started
NOTE: recipe python3-markupsafe-3.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2293 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa)
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_install: Succeeded
NOTE: Running task 2297 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_qa)
NOTE: Running task 2298 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_package)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa: Started
NOTE: Running task 2302 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_install: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 2303 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package)
NOTE: recipe python3-docutils-0.22.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 2307 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_qa)
NOTE: Running task 2311 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_qa)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa: Started
NOTE: Running task 2319 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_qa)
NOTE: recipe python3-chardet-5.2.0-r0: task do_package: Started
NOTE: Running task 2323 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa)
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-snowballstemmer-3.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_qa: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-snowballstemmer_3.0.1.bb:do_package_qa unihash changed to 2cc4dccf4f589301c516a46c5ec42417f958cf09723023a2d1885a3a280625c6
NOTE: Running task 2327 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_qa)
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_install: Succeeded
NOTE: Running task 2328 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_package)
NOTE: recipe python3-sphinxcontrib-devhelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.1.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_2.0.0.bb:do_package_qa unihash changed to 53ba7de8dc1e34e524674e1581f35ed18baed61f7e35c5ed925887eb5087d45b
NOTE: recipe python3-urllib3-2.5.0-r0: task do_install: Succeeded
NOTE: Running task 2332 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_qa)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.1.0.bb:do_package_qa unihash changed to badf58bc3509d8db96b66884ae58ce1a40c7d261ca673b8210279e258659d6f4
NOTE: Running task 2333 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_package)
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_package: Started
NOTE: recipe python3-sphinxcontrib-qthelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_2.0.0.bb:do_package_qa unihash changed to e7ffc051e0c4860132ab7893be7e25cec067ba107234efc2f8eb7a7f9d393b6b
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_package: Started
NOTE: recipe python3-roman-numerals-py-3.1.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-roman-numerals-py_3.1.0.bb:do_package_qa unihash changed to 93a1f8ffa26470a8779d6888a689a0598341968560fc982108062d80eea66a13
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_qa: Succeeded
NOTE: recipe python3-alabaster-1.0.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_qa unihash changed to 6747db463c7d89b0d1eec66f45ab1ee1460cc16f4abae03d556e267bc66fb43f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-alabaster_1.0.0.bb:do_package_qa unihash changed to dd9d44b54a82e0043641238bc15c4f55c14d066cc3eee50c314a48dcf6b99866
NOTE: recipe python3-jinja2-3.1.6-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-jinja2_3.1.6.bb:do_package_qa unihash changed to f2be06b77bffd3605dbbe959f06f00a631769011e23a63de271016edad547168
NOTE: recipe python3-sphinxcontrib-serializinghtml-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_2.0.0.bb:do_package_qa unihash changed to 4c965611ff7362475e019a783f94e20dcf48425320780c715923bfb11d0a27b5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_qa unihash changed to ef83e581ce1e5e6546d2cca011acd455618d119283abeb8e11c257db9b74eb81
NOTE: recipe python3-sphinxcontrib-applehelp-2.0.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-docutils-0.22.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_2.0.0.bb:do_package_qa unihash changed to adc45746fd0e55cae81ccd7c006b0ace8645dc07aa29304929616cf8045cafe5
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-docutils_0.22.3.bb:do_package_qa unihash changed to 53691491e92313cd5a9191adbfdfa32ec55914817da2d0c36a85ce56da2d4480
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package unihash changed to b465146b1e554411aecace825c07754623975cbd3fad12b55f59803f61ed8a12
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_packagedata became valid
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_package unihash changed to 5576770c2b42f03f3002c18c173738e916005d41bfb783a3d2a08ca6d7c39967
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata became valid
NOTE: recipe python3-babel-2.17.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: Running task 2339 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package unihash changed to c8a79c15399985836fe948e897c452156890a7af084b618073c7a64f79c1b093
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_write_rpm became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_write_deb became valid
NOTE: Running setscene task 869 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 870 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 872 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 874 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 875 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 878 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_package: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_package unihash changed to 4f35c31285dc672cd8a30c8125afa324c0d45c9af363210a2f0b2b7c2364ce6d
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata became valid
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 878 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_package unihash changed to 22bab51b66638872589238cb9e9b19ca107103c09b02eba5d13ad2e4fb28bf5e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata became valid
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_package unihash changed to c76bfd4d74621fbf48b0cc78e932696867373184444319d46fc77bfda2192665
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_packagedata became valid
NOTE: recipe python3-babel-2.17.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-certifi/2025.8.3/temp/log.do_packagedata_setscene.726607
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 879 of 879 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-urllib3_2.5.0.bb:do_packagedata_setscene)
NOTE: Running task 2342 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-certifi_2025.8.3.bb:do_packagedata)
NOTE: Running task 2343 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_create_spdx)
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 2348 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_qa)
NOTE: Running task 2352 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_qa)
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_qa: Started
NOTE: recipe python3-urllib3-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe python3-sphinx-9.0.4-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-certifi-2025.8.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2354 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_ipk)
NOTE: Running task 2355 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_deb)
NOTE: Running task 2356 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_write_rpm)
NOTE: Running task 2357 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-requests_2.32.5.bb:do_package_qa)
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa: Started
NOTE: recipe python3-babel-2.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2358 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_create_package_spdx)
NOTE: recipe python3-sphinx-9.0.4-r0: task do_create_package_spdx: Started
NOTE: recipe python3-requests-2.32.5-r0: task do_package_qa: Succeeded
NOTE: recipe python3-babel-2.17.0-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-babel_2.17.0.bb:do_package_qa unihash changed to c0a4746b9f130242fd03e764a680f7a280ffd8bdb3116c057201124144b6bd49
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_package_qa: Succeeded
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_package_qa unihash changed to f3c8d70ea9a43f017b6e54911c5ff1fc281e05b8879ebe8ab9bfa489336187da
NOTE: recipe python3-requests-2.32.5-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinx-9.0.4-r0: task do_create_package_spdx: Succeeded
NOTE: Running noexec task 2359 of 2359 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-sphinx_9.0.4.bb:do_build)
NOTE: Tasks Summary: Attempted 2359 tasks of which 2114 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2025.11.12-r0 to 0:2025.8.3-r0) [version-going-backwards]
ERROR: python3-certifi-2025.8.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============5457331173018923937==--

