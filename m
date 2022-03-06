Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FCFC433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 13:41:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.15154.1646574073712044942
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 05:41:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17,
 mailfrom: f_l_k@t-online.de)
Received: from fwd76.dcpf.telekom.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id 2A45B7533
	for <openembedded-core@lists.openembedded.org>;
 Sun,  6 Mar 2022 14:41:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.165.147]) by fwd76.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nQr8J-0rHdZZ0; Sun, 6 Mar 2022 14:41:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-core@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] libxslt: update to v1.1.35
Date: Sun,  6 Mar 2022 14:40:59 +0100
Message-Id: <20220306134059.580203-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1646574071-0001619A-85D01B1D/0/0 CLEAN NORMAL
X-TOI-MSGID: eca73f18-9e70-46d0-90c1-b18341ce33ab
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 13:41:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162784

Security

[CVE-2021-30560] Fix use-after-free in xsltApplyTemplates
Fix memory leak in xsltDocumentElem (David King)
Fix memory leak in xsltCompileIdKeyPattern (David King)
Fix double-free with stylesheets containing entity nodes

Fixed regressions

Fix performance regression with predicates in patterns
Fix regression in xsltComputeSortResult

Bug fixes

Fix conflict resolution for templates with same priority
Fix xsl:number generating invalid UTF-8
Support attribute value templates in xsl:sort lang attributes
Don't pass first xsl:sort in xsl:apply-templates twice
Fix quadratic runtime with text and xsl:message

Don't allow empty EXSLT durations

Improvements

Add xsltproc --huge Argument via libxml XML_PARSE_HUGE (William N. Braswe=
ll, Jr.)

Tests, code quality, fuzzing

Remove .travis.yml
Fix some misleading indentation (David King)
Use actual types for templates in struct _xsltStylesheet
Add CI for CMake on MSVC (Markus Rickert)
Check for null pointer before calling freelocale
Add CI test for Python 3
Don't set maxDepth in XPath contexts
Transfer XPath limits to XPtr context
Stop using maxParserDepth XPath limit
Make long-to-double cast explicit in date.c
Disable LeakSanitizer
Run clang CI tests with -Wimplicit-int-conversion
Fix implicit-int-conversion warning in exslt/crypto.c
Fix clang -Wimplicit-int-conversion warning (David Kilzer)
Fix clang -Wconditional-uninitialized warning in libxslt/numbers.c (David=
 Kilzer)
Fix -Wshadow warnings in libexslt/dynamic.c (David Kilzer)
Also search parent dir for source XML when fuzzing

Build system, portability

Add CMake build files (Markus Rickert)
Initial support for Python 3 (Suleyman Poyraz)
Call ANSI versions of WinAPI functions explicitly
Remove redundant flags from pkg-config files
Suppress automake warning in tests/XSLTMark
Fix linking libexslt dynamic library when using MinGW (Vadim Zeitlin)
Added platform specific path separators (Dmitriy Korovkin)
win32: allow passing *FLAGS on command line
Fix export of xsltExtMarker on Windows (David Kilzer)
Fix redundant includes already in libexslt.h (David Kilzer)
Minor fixes to configure.js
Fix variable syntax in Python configuration
Add new EXSLT string tests to EXTRA_DIST
Fix xml2-config check in configure script
win32: Add configuration for profiler (Chun-wei Fan)
Check whether 'xml2-config --dynamic' is supported

Documentation

Add Makefile rule to regenerate xsltproc.html
Update links
Remove MAINTAINERS
Upload documentation to GitLab Pages
Add documentation in devhelp format
Add --enable-rebuild-docs configure option
Fix libexslt header summaries
Fix validity of tutorial XML (David King)
Use DocBook URL for tutorial DTD (David King)
Update libxslt.doap
Add missing options to xsltproc man page

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libxslt/{libxslt_1.1.34.bb =3D> libxslt_1.1.35.bb}        | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta/recipes-support/libxslt/{libxslt_1.1.34.bb =3D> libxslt_1.1.=
35.bb} (89%)

diff --git a/meta/recipes-support/libxslt/libxslt_1.1.34.bb b/meta/recipe=
s-support/libxslt/libxslt_1.1.35.bb
similarity index 89%
rename from meta/recipes-support/libxslt/libxslt_1.1.34.bb
rename to meta/recipes-support/libxslt/libxslt_1.1.35.bb
index c888f3d7e1..51cfb2e281 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.34.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.35.bb
@@ -13,11 +13,9 @@ LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D0cd9a07af=
beb24026c9b03aecfeba458"
 SECTION =3D "libs"
 DEPENDS =3D "libxml2"
=20
-SRC_URI =3D "http://xmlsoft.org/sources/libxslt-${PV}.tar.gz \
-          "
+SRC_URI =3D "https://download.gnome.org/sources/libxslt/1.1/libxslt-${PV=
}.tar.xz"
=20
-SRC_URI[md5sum] =3D "db8765c8d076f1b6caafd9f2542a304a"
-SRC_URI[sha256sum] =3D "98b1bd46d6792925ad2dfe9a87452ea2adebf69dcb9919ff=
d55bf926a7f93f7f"
+SRC_URI[sha256sum] =3D "8247f33e9a872c6ac859aa45018bc4c4d00b97e2feac9eeb=
c10c93ce1f34dd79"
=20
 UPSTREAM_CHECK_REGEX =3D "libxslt-(?P<pver>\d+(\.\d+)+)\.tar"
=20
--=20
2.25.1


