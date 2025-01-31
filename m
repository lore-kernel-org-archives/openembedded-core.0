Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78FCCC02197
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 23:02:05 +0000 (UTC)
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by mx.groups.io with SMTP id smtpd.web10.27660.1738351534867910523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 11:25:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@debian.org header.s=smtpauto.stravinsky header.b=gQ8vJIfU;
 spf=none, err=SPF record not found (domain: debian.org, ip: 82.195.75.108, mailfrom: bage@debian.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=398xqlLkbOI5WpRL+RatGcIXsW4Qo2Uxamwf0/b0vi0=; b=gQ8vJIfUOZbOKs70ogL7Ek8chC
	nIt/eWpI4e9EDt3NAShuVBkVx8gq4vH/iXMt/SUdxCIlG4Asw9dpy//5+xuQrhQybS/yQvTRf0Ln/
	PQx8LIigWl4FMvS9bWVo2YrZdNgNURFKLK3uXH5xbqqHWE1DMdBICatZzvVKAc7gbHRMx70IWbwVY
	990Jdf5q2bWDNPyabK97WPWNrH6HB/WREwFIIjEiuBz2glkOSjGE2d/cyt3Hlf6+HFe7peCTfnGVH
	yOvjulbc3QLJj0gPON3Oazox7UQVTgtXB5S3VyveLeB+sQiZo3IuFwUjV+A3k4lxuthbW0w4NqW+C
	is6BoXdQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <bage@debian.org>)
	id 1tdwdv-00FVbH-Dx; Fri, 31 Jan 2025 19:25:31 +0000
From: Bastian Germann <bage@debian.org>
To: openembedded-core@lists.openembedded.org
Cc: Bastian Germann <bage@debian.org>
Subject: [PATCH] docbook-xsl-stylesheets: Use SPDX identifier
Date: Fri, 31 Jan 2025 20:25:18 +0100
Message-ID: <20250131192527.7449-1-bage@debian.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Debian-User: bage
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 23:02:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210499

The XSL license was standardized by SPDX as DocBook-XML.
Copy the license file to the new name and use it in
docbook-xsl-stylesheets.

License-Update: use new DocBook-XML SPDX ID, copy text from existing XSL

Signed-off-by: Bastian Germann <bage@debian.org>
---
 meta/files/common-licenses/DocBook-XML        | 48 +++++++++++++++++++
 .../docbook-xsl-stylesheets_1.79.1.bb         |  2 +-
 2 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/DocBook-XML

diff --git a/meta/files/common-licenses/DocBook-XML b/meta/files/common-licenses/DocBook-XML
new file mode 100644
index 0000000000..0a82d60c1c
--- /dev/null
+++ b/meta/files/common-licenses/DocBook-XML
@@ -0,0 +1,48 @@
+Copyright
+---------
+Copyright (C) 1999-2007 Norman Walsh
+Copyright (C) 2003 Jiří Kosek
+Copyright (C) 2004-2007 Steve Ball
+Copyright (C) 2005-2008 The DocBook Project
+Copyright (C) 2011-2012 O'Reilly Media
+
+Permission is hereby granted, free of charge, to any person
+obtaining a copy of this software and associated documentation
+files (the ``Software''), to deal in the Software without
+restriction, including without limitation the rights to use,
+copy, modify, merge, publish, distribute, sublicense, and/or
+sell copies of the Software, and to permit persons to whom the
+Software is furnished to do so, subject to the following
+conditions:
+
+The above copyright notice and this permission notice shall be
+included in all copies or substantial portions of the Software.
+
+Except as contained in this notice, the names of individuals
+credited with contribution to this software shall not be used in
+advertising or otherwise to promote the sale, use or other
+dealings in this Software without prior written authorization
+from the individuals in question.
+
+Any stylesheet derived from this Software that is publically
+distributed will be identified with a different name and the
+version strings in any derived Software will be changed so that
+no possibility of confusion between the derived package and this
+Software will exist.
+
+Warranty
+--------
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
+EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
+OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
+NONINFRINGEMENT.  IN NO EVENT SHALL NORMAN WALSH OR ANY OTHER
+CONTRIBUTOR BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
+WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
+FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
+OTHER DEALINGS IN THE SOFTWARE.
+
+Contacting the Author
+---------------------
+The DocBook XSL stylesheets are maintained by Norman Walsh,
+<ndw@nwalsh.com>, and members of the DocBook Project,
+<docbook-developers@sf.net>
diff --git a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
index beda0abe95..e628f62984 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
+++ b/meta/recipes-devtools/docbook-xml/docbook-xsl-stylesheets_1.79.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "XSL stylesheets for processing DocBook XML to various output formats"
 HOMEPAGE = "http://docbook.sourceforge.net"
-LICENSE = "XSL"
+LICENSE = "DocBook-XML"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6beadd98f9c54ab0c387e14211ee4d0e"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/docbook/docbook-xsl-${PV}.tar.bz2 \

