Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ABB5C54744
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 19:19:19 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.1372.1721071147173099074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 12:19:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iIkkaC8B;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=SdyoiL8Z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010190b7d5966c-3926e04f-b541-4fff-afa9-1b6a729abfaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=IrWeIGS4kOSEcSC/vItestmhDll8kGz+XhJC5nGsFjc=;
	b=iIkkaC8BKxsCYJjCTFLk2ajGloUCUaCSMgXOOICnXcAJJVWOULi2tBCFJ54DkKzz
	+D6tl0ebXaqQg5GRVYM5v0+uketrWciKrsFqbvwG+bHzNfbWLp/6yPrH65aKUfP4Hns
	MtAvyI7Z9e7SuCSq6UrZhp3Kwv+H9cZnnPtuIEoM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1721071146;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=IrWeIGS4kOSEcSC/vItestmhDll8kGz+XhJC5nGsFjc=;
	b=SdyoiL8ZPycDyrk9Si7csACb2i4HZmQMK45IASu+6ljpM+7ojxAIrt4Q9kNgmhWh
	3S3RwXWCn2sjha1Xpz3iNsfw+J98eROdn80D/AtPzZrnZsxRBAFsvR5D85Qf9/Oth0/
	yG1wjVjbcSgwIDsTh8q7zF8x8ueZ49lcy1z/JIY0=
Content-Type: multipart/mixed; boundary="===============6973963275460321133=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 7.4.0 SUCCEEDED
Message-ID: <01010190b7d5966c-3926e04f-b541-4fff-afa9-1b6a729abfaf-000000@us-west-2.amazonses.com>
Date: Mon, 15 Jul 2024 19:19:06 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.07.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 19:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201991

--===============6973963275460321133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-sphinx* to *7.4.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-7.3.7-7.4.0.patch
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
From 99cc7af9e04e4ad7b5530995dc956b12f031ab39 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Jul 2024 11:25:51 +0000
Subject: [PATCH] python3-sphinx: upgrade 7.3.7 -> 7.4.0

---
 .../python/{python3-sphinx_7.3.7.bb => python3-sphinx_7.4.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.3.7.bb => python3-sphinx_7.4.0.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb b/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
rename to meta/recipes-devtools/python/python3-sphinx_7.4.0.bb
index a1cae2abc0..5a5fe01276 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b6c681698874edd2eb9eaff7cc9de642"
 
-SRC_URI[sha256sum] = "a4a7db75ed37531c05002d56ed6948d4c42f473a36f46e1382b0bd76ca9627bc"
+SRC_URI[sha256sum] = "8385520a28dc129ebf8b5fccfa1beb71215fd4455c6d10fa418e08c3c7a2ff9c"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.44.0


--===============6973963275460321133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info -> /usr/lib/python3.12/site-packages/sphinx-7.4.0.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex_t /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty_t /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css_t /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py_t /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat_t /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.c
 ss_t /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js_t /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst_t /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/sta
 tic/language_data.js_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf_t /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js_t /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css_t /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css_t /usr/lib/python3.12/site-packages/sphinx/ext/__pycache__/intersphinx.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/M
 akefile.new_t /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new_t /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css_t /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx.py /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile_t", added "/usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/colour.py /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/colour.cpython-312.pyc /usr/l
 ib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_shared.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js.jinja /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_cli.py /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/errors.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_load.py /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx.jinja /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/pack
 age.rst.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_shared.py /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js.jinja /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__init__.py /usr/lib/python3.12/site-packages/sphinx/_cli/__init__.py /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_cli.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_resolve.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_resol
 ve.py /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.jinja /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css.jinja /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc.jinja /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css.jinja /usr/lib/python3.12/site-packages/sphinx/util/parsing.py /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/errors.py /usr/lib/python3.12/
 site-packages/sphinx/themes/nature/static/nature.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst.jinja /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf.jinja /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__init__.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__main__.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_load.cp
 ython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/parsing.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot.jinja /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat.jinja /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile.jinja"
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info moved to /usr/lib/python3.12/site-packages/sphinx-7.4.0.dist-info
  /usr/lib/python3.12/site-packages/sphinx/_cli was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/__init__.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/__pycache__ was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/colour.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/errors.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__init__.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__ was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/colour.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/errors.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_cli.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__init__.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_load.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__main__.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__ was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_cli.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_load.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_resolve.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_shared.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_resolve.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_shared.py was added
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/util/parsing.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/parsing.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx.py was removed
  /usr/lib/python3.12/site-packages/sphinx/ext/__pycache__/intersphinx.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css_t was removed

--===============6973963275460321133==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-7.3.7-7.4.0.patch"

RnJvbSA5OWNjN2FmOWUwNGU0YWQ3YjU1MzA5OTVkYzk1NmIxMmYwMzFhYjM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgSnVsIDIwMjQgMTE6MjU6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBw
eXRob24zLXNwaGlueDogdXBncmFkZSA3LjMuNyAtPiA3LjQuMAoKLS0tCiAuLi4vcHl0aG9uL3tw
eXRob24zLXNwaGlueF83LjMuNy5iYiA9PiBweXRob24zLXNwaGlueF83LjQuMC5iYn0gfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3tweXRob24zLXNwaGlueF83LjMuNy5iYiA9PiBw
eXRob24zLXNwaGlueF83LjQuMC5iYn0gKDkxJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzcuMy43LmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjQuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDkx
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54
XzcuMy43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMt
c3BoaW54XzcuNC4wLmJiCmluZGV4IGExY2FlMmFiYzAuLjVhNWZlMDEyNzYgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNy4zLjcuYmIKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjQuMC5iYgpA
QCAtNCw3ICs0LDcgQEAgU0VDVElPTiA9ICJkZXZlbC9weXRob24iCiBMSUNFTlNFID0gIkJTRC0y
LUNsYXVzZSAmIE1JVCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0UucnN0O21k
NT1iNmM2ODE2OTg4NzRlZGQyZWI5ZWFmZjdjYzlkZTY0MiIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImE0YTdkYjc1ZWQzNzUzMWMwNTAwMmQ1NmVkNjk0OGQ0YzQyZjQ3M2EzNmY0NmUxMzgyYjBi
ZDc2Y2E5NjI3YmMiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiODM4NTUyMGEyOGRjMTI5ZWJmOGI1
ZmNjZmExYmViNzEyMTVmZDQ0NTVjNmQxMGZhNDE4ZTA4YzNjN2EyZmY5YyIKIAogaW5oZXJpdCBw
eXRob25fZmxpdF9jb3JlIHB5cGkKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gIi9TcGhpbngvKD9Q
PHB2ZXI+KFxkK1tcLlwtX10qKSspLyIKLS0gCjIuNDQuMAoK

--===============6973963275460321133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 918 .bb files complete (0 cached, 918 parsed). 1879 targets, 46 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-64 sysroot...done.
Removing 96 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-88684f42c315b7a68370cd6b0782a161a644d52b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:88684f42c315b7a68370cd6b0782a161a644d52b"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 609 Local 594 Mirrors 0 Missed 15 Current 275 (97% match, 98% complete)
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 279 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 280 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 281 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 283 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 284 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 285 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 286 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 287 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 288 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 289 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 290 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 291 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 292 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 293 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 294 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 295 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 296 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 297 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 298 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 299 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 300 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 301 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 302 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 303 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 304 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 305 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 307 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 308 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 309 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 310 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 311 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 313 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 314 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 315 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 316 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 317 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 319 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 320 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 322 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_69.5.1.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 323 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 329 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2024.6.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 330 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_packagedata_setscene)
NOTE: recipe python3-pytz-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-69.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 331 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_packagedata_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 332 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 333 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 337 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 338 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_packagedata_setscene)
NOTE: recipe python3-babel-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pytz-2024.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-certifi/2024.6.2/temp/log.do_packagedata_setscene.1525095
NOTE: Running setscene task 348 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_create_spdx_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 349 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb:do_package_setscene)
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-69.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 374 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 387 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 389 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 390 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 391 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 392 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 393 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 394 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 395 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 396 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 397 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 398 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 399 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 400 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 401 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 402 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 403 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 404 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 405 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 406 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 407 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 408 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 409 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 410 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 414 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 415 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 416 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 417 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-toml_0.10.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 421 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 422 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 424 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 425 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 426 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 427 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 429 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 444 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-toml-0.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2024.6.2-r0: task do_package_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-certifi-2024.6.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 558 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 559 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running task 915 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_recipe_qa)
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 560 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 563 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 564 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 567 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 572 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe python3-certifi-2024.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2024.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 578 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 586 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 587 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1266 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 612 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 617 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1308 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_unpack)
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_unpack: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 632 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 636 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 640 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 642 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 644 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 645 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 652 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 656 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 658 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 664 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 668 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 669 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 671 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 673 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 675 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 678 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 679 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 684 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 685 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 701 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1383 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1387 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 718 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 721 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 723 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 725 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 729 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.10.3.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_patch: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1448 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1449 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 735 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1450 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1451 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_populate_lic)
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 753 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_populate_lic: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 760 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1482 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 765 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_populate_lic: Succeeded
NOTE: Running setscene task 771 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_populate_lic unihash changed to caf5cc944ce286cccf5f982a1bf28974104aa53c64f95627499c0c86cbbd054a
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 788 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1509 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 795 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 797 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 804 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 805 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1530 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 812 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 815 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1556 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.3.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1577 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 844 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 845 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 847 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 850 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 852 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 853 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 855 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 857 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 858 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 859 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 861 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1604 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 873 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 877 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 879 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 880 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 882 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 884 of 884 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2058 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2324 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.6.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2336 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-certifi-2024.6.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-certifi-2024.6.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2415 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_configure)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_configure: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_compile)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_compile: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2417 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_install)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_install: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_install: Succeeded
NOTE: Running task 2418 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_package)
NOTE: Running task 2419 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package: Succeeded
NOTE: Running task 2420 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_packagedata)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2421 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_create_spdx)
NOTE: Running task 2422 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_package_write_ipk)
NOTE: Running task 2423 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_package_write_deb)
NOTE: Running task 2424 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_package_write_rpm)
NOTE: Running task 2425 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_package_qa)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2426 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_create_runtime_spdx)
NOTE: recipe python3-sphinx-7.4.0-r0: task do_create_runtime_spdx: Started
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinx-7.4.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2427 of 2427 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_7.4.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2427 tasks of which 2396 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-src went backwards which would break package feeds (from 0:2024.7.4-r0 to 0:2024.6.2-r0) [version-going-backwards]
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dbg went backwards which would break package feeds (from 0:2024.7.4-r0 to 0:2024.6.2-r0) [version-going-backwards]
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-staticdev went backwards which would break package feeds (from 0:2024.7.4-r0 to 0:2024.6.2-r0) [version-going-backwards]
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-dev went backwards which would break package feeds (from 0:2024.7.4-r0 to 0:2024.6.2-r0) [version-going-backwards]
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-doc went backwards which would break package feeds (from 0:2024.7.4-r0 to 0:2024.6.2-r0) [version-going-backwards]
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi-locale went backwards which would break package feeds (from 0:2024.7.4-r0 to 0:2024.6.2-r0) [version-going-backwards]
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-certifi went backwards which would break package feeds (from 0:2024.7.4-r0 to 0:2024.6.2-r0) [version-going-backwards]
ERROR: python3-certifi-2024.6.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============6973963275460321133==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-7.3.7.tar.gz;downloadfilename=sphinx-7.3.7.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-7.4.0.tar.gz;downloadfilename=sphinx-7.4.0.tar.gz"
packages/core2-64-poky-linux/python3-sphinx: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PV changed from "7.3.7" to "7.4.0"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 15968358 to 16618653 (+4%)
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info -> /usr/lib/python3.12/site-packages/sphinx-7.4.0.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst_t /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot_t /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css_t /usr/lib/python3.12/site-packages/sphinx/ext/__pycache__/intersphinx.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex_t /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx.py /usr/lib/python3.12/site-packages/sphinx/te
 mplates/quickstart/root_doc.rst_t /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css_t /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js_t /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js_t /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js_t /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst_t /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css_t /us
 r/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx_t /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml_t /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css_t /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty_t /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizs
 tyle.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css_t /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc_t /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat_t /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex_t", added "/usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/errors.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst.jinja /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.jinja /usr/lib/python3.12/site-packages/sphinx/ext/inters
 phinx/__pycache__/_cli.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css.jinja /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml.jinja /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js.jinja /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_shared.py /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/colour.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css.jinja /usr/lib/python3.12/site-pack
 ages/sphinx/themes/bizstyle/static/bizstyle.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx.jinja /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot.jinja /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_shared.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/_cli/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__init__.py /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc.jinja /usr/lib/python3.12/site-package
 s/sphinx/ext/intersphinx/_load.py /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css.jinja /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/parsing.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc.jinja /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js.jinja /usr/lib/pytho
 n3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_load.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__init__.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__main__.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_resolve.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_cli.py /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/_cli/util/errors.py /usr/lib/python3.12/site-packages/sphinx/_cli/util/colour.py /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/__init__.py /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.c
 ss.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_resolve.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex.jinja /usr/lib/python3.12/site-packages/sphinx/util/parsing.py /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst.jinja"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 7.3.7 [default] to 7.4.0 [default]
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info moved to /usr/lib/python3.12/site-packages/sphinx-7.4.0.dist-info
  /usr/lib/python3.12/site-packages/sphinx/_cli was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/__init__.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/__pycache__ was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/colour.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/errors.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__init__.py was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__ was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/colour.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/errors.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_cli.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__init__.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_load.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__main__.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__ was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_cli.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__init__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_load.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__main__.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_resolve.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_shared.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_resolve.py was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_shared.py was added
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css.jinja was added
  /usr/lib/python3.12/site-packages/sphinx/util/parsing.py was added
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/parsing.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx.py was removed
  /usr/lib/python3.12/site-packages/sphinx/ext/__pycache__/intersphinx.cpython-312.pyc was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile_t was removed
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile_t was removed
  /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css_t was removed
  /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css_t was removed

--===============6973963275460321133==--

