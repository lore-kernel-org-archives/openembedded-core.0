Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BF81C3F2D4
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 15:57:54 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com
 (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web12.983.1657900668145343549
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 08:57:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=A40+DRoz;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31,
 mailfrom: 010101820294908b-82206f52-c2b2-430e-bf0b-53d333d225fd-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=x04DRVhw42JGjAm9bFuaObdlTaUoqz/Dhc6sIX4yhLA=;
	b=A40+DRozU1Z8B8ywR3n5giMzvmnOy0cKJdmeBH3DDwY5SAcJgDsw0+5My6ILC8YZ
	hLV4h4v29IPuvSk5sfQ9it/1qrCMNdyq7SQ6wxT24RPMjrsdVKFm/NLq5ZWQ2w3YwWY
	RA09Xwnkmx9Q4xgRBc87I3jgbHbZWgzqU6/o3sjM=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1657900667;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=x04DRVhw42JGjAm9bFuaObdlTaUoqz/Dhc6sIX4yhLA=;
	b=Q2NkpR2iKDDTiZirQzPEB4fgyTkKAs1L+47JPXSk8p7lFY4ErOheXhwfscp0C2Kv
	bTNwd6AVsFP6ImRd3f4DJpF1PEfo16j9akps+QuBlvVSYZhKonM/JblGesEO9lZFA1W
	qkrRU/N8Z9wNSo3N04XRJdJg+UUysPw6annZivQw=
Content-Type: multipart/mixed; boundary="===============7540525466634266275=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-docutils: upgrading to 0.19 SUCCEEDED
Message-ID: 
 <010101820294908b-82206f52-c2b2-430e-bf0b-53d333d225fd-000000@us-west-2.amazonses.com>
Date: Fri, 15 Jul 2022 15:57:47 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 15:57:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168076

--===============7540525466634266275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-docutils* to *0.19* has Succeeded.

Next steps:
    - apply the patch: git am 0001-python3-docutils-upgrade-0.18.1-0.19.patch
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
--===============7540525466634266275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/python3-docutils: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils: SRC_URI changed from "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.18.1.tar.gz" to "https://files.pythonhosted.org/packages/source/d/docutils/docutils-0.19.tar.gz"
packages/core2-32-poky-linux/python3-docutils: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dbg: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dbg: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dev: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-dev: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-doc: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-doc: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-locale: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-locale: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-src: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-src: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils-staticdev: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils/python3-docutils-staticdev: PKGV changed from 0.18.1 [default] to 0.19 [default]
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PV changed from "0.18.1" to "0.19"
packages/core2-32-poky-linux/python3-docutils/python3-docutils: FILELIST: removed "/usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/METADATA /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/RECORD /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/dependency_links.html /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.txt /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/COPYING.txt /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/SOURCES.html /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.html /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/WHEEL", added "/usr/bin/docutils /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/WHEEL /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/top_level.html /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/dependency_links.html /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/top_level.txt /usr/lib/python3.10/s
 ite-packages/docutils/parsers/__pycache__/commonmark_wrapper.cpython-310.pyc /usr/lib/python3.10/site-packages/docutils/__pycache__/__main__.cpython-310.pyc /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/SOURCES.html /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/RECORD /usr/lib/python3.10/site-packages/docutils/parsers/commonmark_wrapper.py /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/COPYING.txt /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/METADATA /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/entry_points.txt /usr/lib/python3.10/site-packages/docutils/__main__.py"
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PKGSIZE changed from 3218679 to 3222813 (+0%)
packages/core2-32-poky-linux/python3-docutils/python3-docutils: PKGV changed from 0.18.1 [default] to 0.19 [default]
Changes to packages/core2-32-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/COPYING.txt was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/dependency_links.html was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/SOURCES.html was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/top_level.html was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/docutils/__main__.py was added
  /usr/lib/python3.10/site-packages/docutils/parsers/commonmark_wrapper.py was added
  /usr/lib/python3.10/site-packages/docutils/parsers/__pycache__/commonmark_wrapper.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/docutils/__pycache__/__main__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/COPYING.txt was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/dependency_links.html was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/SOURCES.html was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.html was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/WHEEL was removed

--===============7540525466634266275==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/python3-docutils/python3-docutils: FILELIST: removed "/usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.html /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/COPYING.txt /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/dependency_links.html /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/RECORD /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/WHEEL /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.txt /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/METADATA /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/SOURCES.html", added "/usr/lib/python3.10/site-packages/docutils/parsers/__pycache__/commonmark_wrapper.cpython-310.pyc /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/top_level.txt /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/RECORD /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/WHEEL /usr/lib/python3.10/site-pack
 ages/docutils-0.19.dist-info/top_level.html /usr/bin/docutils /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/METADATA /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/SOURCES.html /usr/lib/python3.10/site-packages/docutils/parsers/commonmark_wrapper.py /usr/lib/python3.10/site-packages/docutils/__pycache__/__main__.cpython-310.pyc /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/COPYING.txt /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/dependency_links.html /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/entry_points.txt /usr/lib/python3.10/site-packages/docutils/__main__.py"
Changes to packages/core2-32-poky-linux/python3-docutils (sysroot):
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/COPYING.txt was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/dependency_links.html was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/entry_points.txt was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/METADATA was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/RECORD was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/SOURCES.html was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/top_level.html was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/top_level.txt was added
  /usr/lib/python3.10/site-packages/docutils-0.19.dist-info/WHEEL was added
  /usr/lib/python3.10/site-packages/docutils/__main__.py was added
  /usr/lib/python3.10/site-packages/docutils/parsers/commonmark_wrapper.py was added
  /usr/lib/python3.10/site-packages/docutils/parsers/__pycache__/commonmark_wrapper.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/docutils/__pycache__/__main__.cpython-310.pyc was added
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/COPYING.txt was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/dependency_links.html was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/METADATA was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/RECORD was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/SOURCES.html was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.html was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/top_level.txt was removed
  /usr/lib/python3.10/site-packages/docutils-0.18.1.dist-info/WHEEL was removed

--===============7540525466634266275==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-python3-docutils-upgrade-0.18.1-0.19.patch"

From 2c2411d30f36e216e5923bece41958762589b66d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Jul 2022 07:47:06 +0000
Subject: [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19

---
 .../python/python3-docutils_0.18.1.bb         | 11 ---
 .../python/python3-docutils_0.19.bb           | 88 +++++++++++++++++++
 2 files changed, 88 insertions(+), 11 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-docutils_0.18.1.bb
 create mode 100644 meta/recipes-devtools/python/python3-docutils_0.19.bb

diff --git a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb b/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
deleted file mode 100644
index e4ddd01978..0000000000
--- a/meta/recipes-devtools/python/python3-docutils_0.18.1.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
-HOMEPAGE = "http://docutils.sourceforge.net"
-SECTION = "devel/python"
-LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=fecee07ad8df9116e1f739e2ed2ea513"
-
-SRC_URI[sha256sum] = "679987caf361a7539d76e584cbeddc311e3aee937877c87346f31debc63e9d06"
-
-inherit pypi setuptools3
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-devtools/python/python3-docutils_0.19.bb b/meta/recipes-devtools/python/python3-docutils_0.19.bb
new file mode 100644
index 0000000000..8f54bc35a9
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-docutils_0.19.bb
@@ -0,0 +1,88 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING.txt
+# +++ COPYING.txt
+# @@ -4,8 +4,8 @@
+#  
+#  :Author: David Goodger
+#  :Contact: goodger@python.org
+# -:Date: $Date: 2021-11-19 13:46:38 +0100 (Fr, 19. Nov 2021) $
+# -:Web site: http://docutils.sourceforge.net/
+# +:Date: $Date: 2022-05-30 18:54:46 +0200 (Mo, 30. Mai 2022) $
+# +:Web site: https://docutils.sourceforge.io/
+#  :Copyright: This document has been placed in the public domain.
+#  
+#  Most of the files included in this project have been placed in the
+# @@ -26,11 +26,11 @@
+#  below (the "Work") to the public domain.
+#  
+#  The primary repository for the Work is the Internet World Wide Web
+# -site <http://docutils.sourceforge.net/>.  The Work consists of the
+# +site <https://docutils.sourceforge.io/>.  The Work consists of the
+#  files within the "docutils" module of the Docutils project Subversion
+# -repository (Internet host docutils.svn.sourceforge.net, filesystem path
+# -/svnroot/docutils), whose Internet web interface is located at
+# -<http://docutils.svn.sourceforge.net/viewvc/docutils/>.  Files dedicated to the
+# +repository (http://svn.code.sf.net/p/docutils/code/),
+# +whose Internet web interface is located at
+# +<https://sourceforge.net/p/docutils/code>.  Files dedicated to the
+#  public domain may be identified by the inclusion, near the beginning
+#  of each file, of a declaration of the form::
+#  
+# @@ -99,13 +99,18 @@
+#  
+#    .. _eLyXer: https://github.com/alexfernandez/elyxer
+#  
+# -* docutils/parsers/recommonmark_wrapper.py,
+# +* docutils/__main__.py,
+# +  docutils/parsers/commonmark_wrapper.py,
+# +  docutils/parsers/recommonmark_wrapper.py,
+#    docutils/utils/error_reporting.py,
+#    docutils/utils/math/__init__.py,
+#    docutils/utils/math/latex2mathml.py,
+#    docutils/utils/math/tex2mathml_extern.py,
+#    docutils/utils/punctuation_chars.py,
+# +  docutils/utils/smartquotes.py,
+#    docutils/writers/html5_polyglot/__init__.py,
+# +  docutils/writers/html5_polyglot/*.css,
+# +  docutils/writers/latex2e/docutils.sty,
+#    docutils/writers/xetex/__init__.py,
+#    test/test_parsers/test_recommonmark/\*.py,
+#    test/test_parsers/test_rst/test_directives/test__init__.py,
+# @@ -141,12 +146,12 @@
+#  Plaintext versions of all the linked-to licenses are provided in the
+#  licenses_ directory.
+#  
+# -.. _sandbox: http://docutils.sourceforge.net/sandbox/README.html
+# +.. _sandbox: https://docutils.sourceforge.io/sandbox/README.html
+#  .. _licenses: licenses/
+# -.. _Python 2.1.1 license: http://www.python.org/2.1.1/license.html
+# -.. _GNU General Public License: http://www.gnu.org/copyleft/gpl.html
+# +.. _Python 2.1.1 license: https://docs.python.org/3/license.html
+# +.. _GNU General Public License: https://www.gnu.org/copyleft/gpl.html
+#  .. _BSD 2-Clause License: http://opensource.org/licenses/BSD-2-Clause
+#  .. _BSD 3-Clause License: https://opensource.org/licenses/BSD-3-Clause
+#  .. _OSI-approved: http://opensource.org/licenses/
+#  .. _license-list:
+# -.. _GPL-compatible: http://www.gnu.org/licenses/license-list.html
+# +.. _GPL-compatible: https://www.gnu.org/licenses/license-list.html
+# 
+#
+
+SUMMARY = "Docutils is a modular system for processing documentation into useful formats"
+HOMEPAGE = "http://docutils.sourceforge.net"
+SECTION = "devel/python"
+LICENSE = "PSF-2.0 & BSD-2-Clause & GPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=41001b296a89bb2780bbe306e947ecee"
+
+SRC_URI[sha256sum] = "33995a6753c30b7f577febfc2c50411fec6aac7f7ffeb7c4cfe5991072dcf9e6"
+
+inherit pypi setuptools3
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.31.1


--===============7540525466634266275==--

