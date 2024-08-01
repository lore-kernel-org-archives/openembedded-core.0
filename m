Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C370DC52D70
	for <webhook@archiver.kernel.org>; Thu,  1 Aug 2024 18:27:09 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.75748.1722536827204193488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Aug 2024 11:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=iYSgS7cW;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=rOxD1Qyc;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101910f321e00-2038e910-e31c-4019-a988-0a086c6757ec-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1722536828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=NHodzidW2JkxtYEd3CsbDlaRNBa39sm6unmjXtpeV7s=;
	b=iYSgS7cWcYzOUYxbNanN3jE2TIQ3lmdmPdvX4gQkbPBCo0/z7TYS/qfGJFl3MBWp
	ivi/0hM46VEc4Hb0639eXFbbxrchsU4YH+0CGPtRoN9oJjAQJL7FfyXoQhllDnN3KVH
	f59PnVIFC25Amb6Rin5jubdkwqIVK3wEMNNEh7N4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1722536828;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=NHodzidW2JkxtYEd3CsbDlaRNBa39sm6unmjXtpeV7s=;
	b=rOxD1QycIgB68e0RGpz+sEzrHXGr4K6wiYRCCSAFRyhQ6j82Xk7BE1oU4nGXG4iJ
	utGflHuOc9Ojmp1sKBi+7Lgd4o2u2wFj3PfW4OgEGV/D50PQ1qEQRkElvQy+nz6yIZU
	mbHPcqvE60/r/1IwqDh6elqUOg4LJlJHfN5Y4YDk=
Content-Type: multipart/mixed; boundary="===============8449133419980745968=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-sphinx: upgrading to 8.0.2 SUCCEEDED
Message-ID: <010101910f321e00-2038e910-e31c-4019-a988-0a086c6757ec-000000@us-west-2.amazonses.com>
Date: Thu, 1 Aug 2024 18:27:08 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.08.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Aug 2024 18:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202815

--===============8449133419980745968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *python3-sphinx* to *8.0.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-sphinx-upgrade-7.3.7-8.0.2.patch
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
From ba1d50cdc63b32eac71bc7ccedd7cb167fdc9019 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 Aug 2024 11:08:41 +0000
Subject: [PATCH] python3-sphinx: upgrade 7.3.7 -> 8.0.2

---
 .../python/{python3-sphinx_7.3.7.bb => python3-sphinx_8.0.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-sphinx_7.3.7.bb => python3-sphinx_8.0.2.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb b/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
rename to meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
index a1cae2abc0..94ea56c4fd 100644
--- a/meta/recipes-devtools/python/python3-sphinx_7.3.7.bb
+++ b/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause & MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=b6c681698874edd2eb9eaff7cc9de642"
 
-SRC_URI[sha256sum] = "a4a7db75ed37531c05002d56ed6948d4c42f473a36f46e1382b0bd76ca9627bc"
+SRC_URI[sha256sum] = "0cce1ddcc4fd3532cf1dd283bc7d886758362c5c1de6598696579ce96d8ffa5b"
 
 inherit python_flit_core pypi
 UPSTREAM_CHECK_REGEX = "/Sphinx/(?P<pver>(\d+[\.\-_]*)+)/"
-- 
2.44.0


--===============8449133419980745968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 15968358 to 18532169 (+16%)
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info -> /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml_t /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css_t /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst_t /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx.py /usr/lib/python3.12/site-packages/sphinx/templates/gettext
 /message.pot_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst_t /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc_t /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx_t /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css_t /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css_t /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc_t /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css_t /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex_t /usr/lib/python3.12/site-packages/sphinx/ext/__pycache__/intersphinx.cpython-312.pyc /usr/lib/python3.12/site-packages
 /sphinx/themes/pyramid/static/pyramid.css_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat_t /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css_t /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new_t /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty_t /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js_t /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile_t /u
 sr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst_t /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat_t", added "/usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/errors.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__init__.
 py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__main__.py /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex.jinja /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot.jinja /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_resolve.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/colour.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_load.py /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc.jinja /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/util/__pycache_
 _/parsing.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py.jinja /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_shared.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js.jinja /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_resolve.py /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/__init__.py /usr/lib
 /python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_cli.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_shared.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_cli.py /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_timestamps.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc.jinja /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat.jinja /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js.jinja /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js.jinja /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc
 .rst.jinja /usr/lib/python3.12/site-packages/sphinx/util/_timestamps.py /usr/lib/python3.12/site-packages/sphinx/_cli/util/errors.py /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/colour.py /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css.jinja /usr/lib/python3.12/site-packages/sphinx/util/parsing.py /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_load.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css.jinja /usr/lib/python3.12/site-packages/sphinx
 /_cli/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__init__.py"
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info moved to /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info
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
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja was added
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
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_timestamps.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/_timestamps.py was added
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

--===============8449133419980745968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 920 .bb files complete (0 cached, 920 parsed). 1884 targets, 48 skipped, 0 masked, 0 errors.
Removing 41 recipes from the core2-64 sysroot...done.
Removing 81 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-7fdb7463d8b26530b3055a95ae3a1c99eacbb9f0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7fdb7463d8b26530b3055a95ae3a1c99eacbb9f0"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 623 Local 608 Mirrors 0 Missed 15 Current 248 (97% match, 98% complete)
Removing 5 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 251 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 252 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 253 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 255 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 256 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 258 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 259 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 261 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 262 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 264 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 265 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 267 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 268 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 269 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 270 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 271 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 272 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_deb_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 273 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 274 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 275 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-docutils-0.21.2-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 276 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 277 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 279 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_create_spdx_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 280 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 281 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 282 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_ipk_setscene: Started
NOTE: Running setscene task 283 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-alabaster-0.7.16-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 284 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-markupsafe_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 285 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 286 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pretend_1.0.9.bb:do_packagedata_setscene)
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 287 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 288 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 289 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytz_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 290 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_create_spdx_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 292 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 293 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-certifi_2024.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 294 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-chardet_5.2.0.bb:do_packagedata_setscene)
NOTE: recipe python3-docutils-0.21.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 296 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-idna_3.7.bb:do_packagedata_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 298 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 299 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_create_spdx_setscene)
NOTE: recipe python3-babel-2.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 306 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_packagedata_setscene)
NOTE: recipe python3-jinja2-3.1.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 307 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-babel_2.15.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 308 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-docutils_0.21.2.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-certifi-2024.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-markupsafe-2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 309 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-imagesize_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pretend-1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-jinja2_3.1.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 315 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-packaging_24.1.bb:do_packagedata_setscene)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-babel-2.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-requests-2.32.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 321 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-requests_2.32.3.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-pytest/8.2.2/temp/log.do_packagedata_setscene.3880428
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 322 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_package_setscene)
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytz-2024.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-setuptools/70.3.0/temp/log.do_packagedata_setscene.3880457
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-idna-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-certifi-2024.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-chardet-5.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pygments-2.18.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pysocks-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux-musl/python3-alabaster/0.7.16/temp/log.do_packagedata_setscene.3880528
NOTE: recipe python3-babel-2.15.0-r0: task do_packagedata_setscene: Succeeded
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe python3-docutils-0.21.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-imagesize-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-jinja2-3.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-packaging-24.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-requests-2.32.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 324 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_package_setscene)
NOTE: Running setscene task 348 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pygments_2.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 359 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_package_setscene)
NOTE: Running setscene task 360 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-snowballstemmer_2.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 368 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 369 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 370 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 371 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 373 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 374 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 375 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 376 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 377 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 378 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 379 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 381 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 382 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 384 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_ipk_setscene)
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 385 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 386 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-applehelp_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 387 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-devhelp_1.0.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 388 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 389 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_package_write_deb_setscene)
NOTE: recipe python3-pygments-2.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 394 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 395 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 396 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_create_spdx_setscene)
NOTE: recipe python3-snowballstemmer-2.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 400 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 401 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 402 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-htmlhelp_2.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 403 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 405 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-unittest-automake-output_0.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 406 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-urllib3_2.2.2.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_deb_setscene)
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 408 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-jsmath_1.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 411 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 413 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-qthelp_1.0.7.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 414 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_package_write_rpm_setscene)
NOTE: recipe python3-sphinxcontrib-devhelp-1.0.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-applehelp-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-urllib3-2.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.2.2-r0: task do_package_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_setscene: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_package_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 498 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinxcontrib-serializinghtml_1.1.10.bb:do_packagedata_setscene)
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-sphinxcontrib-htmlhelp-2.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-unittest-automake-output-0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-urllib3-2.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-qthelp-1.0.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-jsmath-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_packagedata_setscene: Started
NOTE: Running task 436 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_recipe_qa)
NOTE: recipe python3-3.12.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 529 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_recipe_qa: Started
NOTE: recipe python3-sphinxcontrib-serializinghtml-1.1.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe python3-alabaster-0.7.16-r0: task do_package_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 540 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 541 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 542 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 543 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 544 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc_14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 545 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.2.21.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 548 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 549 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ca-certificates/ca-certificates_20240203.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.4.bb:do_packagedata_setscene)
NOTE: recipe python3-pytest-8.2.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 552 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-alabaster-0.7.16-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 554 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pytest-8.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 539 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_fetch)
NOTE: recipe python3-pytest-8.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ca-certificates-20240203-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tzdata-2024a-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 569 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.15.1.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_create_spdx_setscene)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_fetch: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_package_setscene: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 584 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 585 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 567 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 593 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 598 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.191.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 600 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.21-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_unpack: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1048 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1064 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_patch)
NOTE: recipe elfutils-0.191-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 629 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 631 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 637 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.1.bb:do_packagedata_setscene)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_patch: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running task 1253 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1254 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.12.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 645 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 646 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 647 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 648 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 649 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 650 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 652 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 653 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 665 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.7.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 677 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 679 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.8.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 691 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.40.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 693 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.6.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 694 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 696 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20240517-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 698 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.12.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 699 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 702 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 706 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 710 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 711 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.24-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 712 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.14.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_packagedata_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.40.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 715 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libnsl2-2.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20240517-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 716 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.6.bb:do_packagedata_setscene)
NOTE: recipe expat-2.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_packagedata_setscene)
NOTE: recipe libtirpc-1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 725 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 731 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.24.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 733 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.70.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 737 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.49.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 740 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 743 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 745 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb:do_recipe_qa_setscene)
NOTE: recipe lzlib-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 754 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 760 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 762 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.5.5.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.24-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.70-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.6.1.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1415 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1416 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1423 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_populate_lic)
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 782 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.45.3.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.49-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 793 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_populate_lic: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 797 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1450 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe xz-5.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 804 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.45.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_populate_lic unihash changed to 568d1e5a08973776100d122e0ac64a1985f4b63dbc0bfa81480d12e4607540be
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 808 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1471 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1482 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libpam-1.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 816 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1493 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 821 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 831 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 832 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 834 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 836 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 837 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 840 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_14.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 844 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 846 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 849 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 852 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 861 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 1537 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 70b51aade0868d2e9665cb098e7343a206fad5376f133e2526ffd66fdb682fa5
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 864 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 866 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-x86_64-14.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 867 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.9.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 871 of 871 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.42.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1988 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2097 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-alabaster_0.7.16.bb:do_packagedata)
NOTE: Running task 2147 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-pytest_8.2.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2244 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_70.3.0.bb:do_packagedata)
NOTE: Running task 2258 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_collect_spdx_deps)
NOTE: recipe python3-alabaster-0.7.16-r0: task do_packagedata: Started
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata: Started
NOTE: recipe python3-setuptools-70.3.0-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-alabaster-0.7.16-r0: task do_packagedata: Succeeded
NOTE: recipe python3-pytest-8.2.2-r0: task do_packagedata: Succeeded
NOTE: recipe python3-setuptools-70.3.0-r0: task do_packagedata: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_configure)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_configure: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_compile)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_compile: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_compile: Succeeded
NOTE: Running task 2354 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_install)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_install: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_install: Succeeded
NOTE: Running task 2355 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_package)
NOTE: Running task 2356 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_populate_sysroot)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package: Succeeded
NOTE: Running task 2357 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_packagedata)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_packagedata: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 2358 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_create_spdx)
NOTE: Running task 2359 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_package_write_ipk)
NOTE: Running task 2360 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_package_write_deb)
NOTE: Running task 2361 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_package_write_rpm)
NOTE: Running task 2362 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_package_qa)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_create_spdx: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_write_ipk: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_write_deb: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_write_rpm: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_qa: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_write_ipk: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 2363 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_create_package_spdx)
NOTE: recipe python3-sphinx-8.0.2-r0: task do_create_package_spdx: Started
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_qa: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_create_package_spdx: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_write_deb: Succeeded
NOTE: recipe python3-sphinx-8.0.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2364 of 2364 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-sphinx_8.0.2.bb:do_build)
NOTE: Tasks Summary: Attempted 2364 tasks of which 2331 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 25 ERROR messages, returning a non-zero exit code.
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-src went backwards which would break package feeds (from 0:8.3.2-r0 to 0:8.2.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dbg went backwards which would break package feeds (from 0:8.3.2-r0 to 0:8.2.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-staticdev went backwards which would break package feeds (from 0:8.3.2-r0 to 0:8.2.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-dev went backwards which would break package feeds (from 0:8.3.2-r0 to 0:8.2.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-doc went backwards which would break package feeds (from 0:8.3.2-r0 to 0:8.2.2-r0) [version-going-backwards]
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest-locale went backwards which would break package feeds (from 0:8.3.2-r0 to 0:8.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-src went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pytest went backwards which would break package feeds (from 0:8.3.2-r0 to 0:8.2.2-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dbg went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-pytest-8.2.2-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pkg-resources went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-staticdev went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-dev went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-doc went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools-locale went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-setuptools went backwards which would break package feeds (from 0:72.1.0-r0 to 0:70.3.0-r0) [version-going-backwards]
ERROR: python3-setuptools-70.3.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: QA Issue: Package version for package python3-alabaster-src went backwards which would break package feeds (from 0:1.0.0-r0 to 0:0.7.16-r0) [version-going-backwards]
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: QA Issue: Package version for package python3-alabaster-dbg went backwards which would break package feeds (from 0:1.0.0-r0 to 0:0.7.16-r0) [version-going-backwards]
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: QA Issue: Package version for package python3-alabaster-staticdev went backwards which would break package feeds (from 0:1.0.0-r0 to 0:0.7.16-r0) [version-going-backwards]
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: QA Issue: Package version for package python3-alabaster-dev went backwards which would break package feeds (from 0:1.0.0-r0 to 0:0.7.16-r0) [version-going-backwards]
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: QA Issue: Package version for package python3-alabaster-doc went backwards which would break package feeds (from 0:1.0.0-r0 to 0:0.7.16-r0) [version-going-backwards]
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: QA Issue: Package version for package python3-alabaster-locale went backwards which would break package feeds (from 0:1.0.0-r0 to 0:0.7.16-r0) [version-going-backwards]
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: QA Issue: Package version for package python3-alabaster went backwards which would break package feeds (from 0:1.0.0-r0 to 0:0.7.16-r0) [version-going-backwards]
ERROR: python3-alabaster-0.7.16-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8449133419980745968==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-python3-sphinx-upgrade-7.3.7-8.0.2.patch"

RnJvbSBiYTFkNTBjZGM2M2IzMmVhYzcxYmM3Y2NlZGQ3Y2IxNjdmZGM5MDE5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBBdWcgMjAyNCAxMTowODo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHB5
dGhvbjMtc3BoaW54OiB1cGdyYWRlIDcuMy43IC0+IDguMC4yCgotLS0KIC4uLi9weXRob24ve3B5
dGhvbjMtc3BoaW54XzcuMy43LmJiID0+IHB5dGhvbjMtc3BoaW54XzguMC4yLmJifSB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24ve3B5dGhvbjMtc3BoaW54XzcuMy43LmJiID0+IHB5
dGhvbjMtc3BoaW54XzguMC4yLmJifSAoOTElKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhfNy4zLjcuYmIgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMC4yLmJiCnNpbWlsYXJpdHkgaW5kZXggOTEl
CnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1zcGhpbnhf
Ny4zLjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1z
cGhpbnhfOC4wLjIuYmIKaW5kZXggYTFjYWUyYWJjMC4uOTRlYTU2YzRmZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXNwaGlueF83LjMuNy5iYgorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtc3BoaW54XzguMC4yLmJiCkBA
IC00LDcgKzQsNyBAQCBTRUNUSU9OID0gImRldmVsL3B5dGhvbiIKIExJQ0VOU0UgPSAiQlNELTIt
Q2xhdXNlICYgTUlUIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5yc3Q7bWQ1
PWI2YzY4MTY5ODg3NGVkZDJlYjllYWZmN2NjOWRlNjQyIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0g
PSAiYTRhN2RiNzVlZDM3NTMxYzA1MDAyZDU2ZWQ2OTQ4ZDRjNDJmNDczYTM2ZjQ2ZTEzODJiMGJk
NzZjYTk2MjdiYyIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICIwY2NlMWRkY2M0ZmQzNTMyY2YxZGQy
ODNiYzdkODg2NzU4MzYyYzVjMWRlNjU5ODY5NjU3OWNlOTZkOGZmYTViIgogCiBpbmhlcml0IHB5
dGhvbl9mbGl0X2NvcmUgcHlwaQogVVBTVFJFQU1fQ0hFQ0tfUkVHRVggPSAiL1NwaGlueC8oP1A8
cHZlcj4oXGQrW1wuXC1fXSopKykvIgotLSAKMi40NC4wCgo=

--===============8449133419980745968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-64-poky-linux/python3-sphinx: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx: SRC_URI changed from "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-7.3.7.tar.gz;downloadfilename=sphinx-7.3.7.tar.gz" to "https://files.pythonhosted.org/packages/source/s/sphinx/sphinx-8.0.2.tar.gz;downloadfilename=sphinx-8.0.2.tar.gz"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dbg: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-dev: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-doc: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-locale: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-src: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx-staticdev: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PV changed from "7.3.7" to "8.0.2"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: FILELIST: directory renamed /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info -> /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info, removed "/usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst_t /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx.py /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex_t /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex_t /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat_t /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js_t /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc_t /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css_t /usr/lib/py
 thon3.12/site-packages/sphinx/themes/classic/static/sidebar.js_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py_t /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css_t /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst_t /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js_t /usr/lib/python3.12/site-packages/sphinx/templates
 /latex/sphinxmessages.sty_t /usr/lib/python3.12/site-packages/sphinx/ext/__pycache__/intersphinx.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css_t /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst_t /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new_t /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css_t /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js_t /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile_t /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css_t /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex_t /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nat
 ure.css_t /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat_t /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot_t /usr/lib/python3.12/site-packages/sphinx/themes/epub/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css_t /usr/lib/python3.12/site-packages/sphinx/templates/epub3/content.opf_t /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex_t", added "/usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_shared.py /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/conf.py.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/language_data.js.jinja /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/module.rst.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_load.py /usr/lib/python3.12/site-packages/sphinx/themes/nature/static/nature.css.jinja /usr/lib/python3
 .12/site-packages/sphinx/themes/epub/static/epub.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__main__.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__init__.py /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_shared.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_cli.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/package.rst.jinja /usr/lib/python3.12/site-packages/sphinx/texinputs/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/themes/agogo/static/agogo.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/sidebar.js.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_resolve.py /usr/lib/python3.12/site-packages/sphinx/texinputs_win/Makefile.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/__init__.py /usr/lib/python3.12/site-packages/sphinx/texinputs/make.bat.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/erro
 rs.py /usr/lib/python3.12/site-packages/sphinx/util/_timestamps.py /usr/lib/python3.12/site-packages/sphinx/templates/gettext/message.pot.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/toc.ncx.jinja /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkjarc.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__init__.py /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/colour.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/latex/latex.tex.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/_cli.py /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/parsing.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/themes/traditional/static/traditional.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabulary.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/documentation_options.js.jinja
  /usr/lib/python3.12/site-packages/sphinx/templates/apidoc/toc.rst.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/root_doc.rst.jinja /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/template.tex.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/util/parsing.py /usr/lib/python3.12/site-packages/sphinx/templates/latex/longtable.tex.jinja /usr/lib/python3.12/site-packages/sphinx/themes/scrolls/static/scrolls.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/pyramid/static/pyramid.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/haiku/static/haiku.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_resolve.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/latex/sphinxmessages.sty.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/__pycache__/__init__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphin
 x/templates/epub3/content.opf.jinja /usr/lib/python3.12/site-packages/sphinx/templates/latex/tabular.tex.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/Makefile.new.jinja /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja /usr/lib/python3.12/site-packages/sphinx/themes/nonav/static/nonav.css.jinja /usr/lib/python3.12/site-packages/sphinx/templates/epub3/nav.xhtml.jinja /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_timestamps.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/templates/imgmath/preview.tex.jinja /usr/lib/python3.12/site-packages/sphinx/_cli/util/__pycache__/errors.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/texinputs/latexmkrc.jinja /usr/lib/python3.12/site-packages/sphinx/themes/sphinxdoc/static/sphinxdoc.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/classic/static/classic.css.jinja /usr/lib/python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.css.jinja /usr/lib/
 python3.12/site-packages/sphinx/themes/bizstyle/static/bizstyle.js.jinja /usr/lib/python3.12/site-packages/sphinx/themes/basic/static/basic.css.jinja /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/__main__.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/ext/intersphinx/__pycache__/_load.cpython-312.pyc /usr/lib/python3.12/site-packages/sphinx/_cli/util/colour.py"
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGV changed from 7.3.7 [default] to 8.0.2 [default]
packages/core2-64-poky-linux/python3-sphinx/python3-sphinx: PKGSIZE changed from 15968358 to 18532169 (+16%)
Changes to packages/core2-64-poky-linux/python3-sphinx (sysroot):
  /usr/lib/python3.12/site-packages/sphinx-7.3.7.dist-info moved to /usr/lib/python3.12/site-packages/sphinx-8.0.2.dist-info
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
  /usr/lib/python3.12/site-packages/sphinx/templates/quickstart/make.bat.new.jinja was added
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
  /usr/lib/python3.12/site-packages/sphinx/util/__pycache__/_timestamps.cpython-312.pyc was added
  /usr/lib/python3.12/site-packages/sphinx/util/_timestamps.py was added
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

--===============8449133419980745968==--

