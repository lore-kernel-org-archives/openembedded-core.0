Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id B961E7EC4B
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 16:54:57 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id p24so6072195pfn.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 08:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RLBL10ny68X2j2TuaZUUjGSQS5R2WJrh0j6hHvF1u2w=;
	b=dDIa5YePO62RUV17zuIvgaMTrxsXf4zjqpQg+EnNycZkdAaeg98ani4d9N3LqFM2ge
	75Ogdd/xz/dgTs4DgCMNOWKDdPLYpIRAjzID+sv/Ie+mvYio4hMecXtTm6VCcUE8W9QJ
	wWbmYwzXuwH6c7kOpOpp2TQBE7UwDUb6Wqovg2OWXrUxThEPNImRkuMLuA+rwsil5l0+
	jeQcqaFl30poQR+yIv7tbDMicp7fnqtfbh1gpcst5z7kfGv9FjuqF1MrZen6oHxQINT8
	J/EisNt4MpWn52z/abLMz7M1RBTAIvK0Rc6bNhqptwIfQH9UtmZT95AF6Yyf1tslN40J
	Gn8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RLBL10ny68X2j2TuaZUUjGSQS5R2WJrh0j6hHvF1u2w=;
	b=uZ1ZY/eAsoiY9U0YxLIb6D0zNhNgl3kZtnlWucMQMW/cUtBe3k6Gccc27bvwFPNjlL
	WijBe22/sQl0LozPpPM+g+E3UXMb31dTXFiQYPHeN4FXmdJU7eUL0KzBtVc+nJ/Oce1r
	WJigPd9NJ6Wq0aOfWnUFphaCGSpA1bwcDEB+4ynUalAi6Q1O57fbBrmY6cHK9MNO6Nkr
	KWhXozI6y5B6mUcD76j6bhRULCHdI4obZy897PUbaGWDBgI4LExlYfGIbSHzPyipdJSV
	InLQRAzN4b1m+qm7Bck9GA6tgyyK0Lxz9gujvRuhP8AcBgLkxF9mhFyKhVgPpX5j98kC
	uTUA==
X-Gm-Message-State: APjAAAVaB8kVID0yx1jPHzHsGq+kMECPSCf+KCsAXm+zZz3C8m+ecKSs
	yu690/9WWhzZ+pnNsaCTlJO2xMgU
X-Google-Smtp-Source: APXvYqw0aIAfub2vqv+JuKX2VOfH5QUbfJ7yKgITMge4GW4jaO80kRi3nYG0d2b/Yu3gWbUgmkChGw==
X-Received: by 2002:a62:aa0d:: with SMTP id e13mr30235233pff.214.1574614498697;
	Sun, 24 Nov 2019 08:54:58 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id o14sm5331101pfp.5.2019.11.24.08.54.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 08:54:58 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 08:54:53 -0800
Message-Id: <1574614495-32677-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574614495-32677-1-git-send-email-akuster808@gmail.com>
References: <1574614495-32677-1-git-send-email-akuster808@gmail.com>
Subject: [warrior][PATCH 2/4] python: fix CVE-2019-16935
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 24 Nov 2019 16:54:58 -0000

From: Chen Qi <Qi.Chen@windriver.com>

(From OE-Core rev: 1a7593bcdaf8a8cf15259aee8a0e2686247f2987)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...43-Escape-the-server-title-of-DocXMLRPCSe.patch | 101 +++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb      |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch

diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
new file mode 100644
index 0000000..3025cf7
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
@@ -0,0 +1,101 @@
+From b161c89c8bd66fe928192e21364678c8e9b8fcc0 Mon Sep 17 00:00:00 2001
+From: Dong-hee Na <donghee.na92@gmail.com>
+Date: Tue, 1 Oct 2019 19:58:01 +0900
+Subject: [PATCH] [2.7] bpo-38243: Escape the server title of DocXMLRPCServer
+ (GH-16447)
+
+Escape the server title of DocXMLRPCServer.DocXMLRPCServer
+when rendering the document page as HTML.
+
+CVE: CVE-2019-16935
+
+Upstream-Status: Backport [https://github.com/python/cpython/pull/16447/commits/b41cde823d026f2adc21ef14b1c2e92b1006de06]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ Lib/DocXMLRPCServer.py                        | 13 +++++++++++-
+ Lib/test/test_docxmlrpc.py                    | 20 +++++++++++++++++++
+ .../2019-09-25-13-21-09.bpo-38243.1pfz24.rst  |  3 +++
+ 3 files changed, 35 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+
+diff --git a/Lib/DocXMLRPCServer.py b/Lib/DocXMLRPCServer.py
+index 4064ec2e48..90b037dd35 100644
+--- a/Lib/DocXMLRPCServer.py
++++ b/Lib/DocXMLRPCServer.py
+@@ -20,6 +20,16 @@ from SimpleXMLRPCServer import (SimpleXMLRPCServer,
+             CGIXMLRPCRequestHandler,
+             resolve_dotted_attribute)
+ 
++
++def _html_escape_quote(s):
++    s = s.replace("&", "&amp;") # Must be done first!
++    s = s.replace("<", "&lt;")
++    s = s.replace(">", "&gt;")
++    s = s.replace('"', "&quot;")
++    s = s.replace('\'', "&#x27;")
++    return s
++
++
+ class ServerHTMLDoc(pydoc.HTMLDoc):
+     """Class used to generate pydoc HTML document for a server"""
+ 
+@@ -210,7 +220,8 @@ class XMLRPCDocGenerator:
+                                 methods
+                             )
+ 
+-        return documenter.page(self.server_title, documentation)
++        title = _html_escape_quote(self.server_title)
++        return documenter.page(title, documentation)
+ 
+ class DocXMLRPCRequestHandler(SimpleXMLRPCRequestHandler):
+     """XML-RPC and documentation request handler class.
+diff --git a/Lib/test/test_docxmlrpc.py b/Lib/test/test_docxmlrpc.py
+index 4dff4159e2..c45b892b8b 100644
+--- a/Lib/test/test_docxmlrpc.py
++++ b/Lib/test/test_docxmlrpc.py
+@@ -1,5 +1,6 @@
+ from DocXMLRPCServer import DocXMLRPCServer
+ import httplib
++import re
+ import sys
+ from test import test_support
+ threading = test_support.import_module('threading')
+@@ -176,6 +177,25 @@ class DocXMLRPCHTTPGETServer(unittest.TestCase):
+         self.assertIn("""Try&nbsp;self.<strong>add</strong>,&nbsp;too.""",
+                       response.read())
+ 
++    def test_server_title_escape(self):
++        """Test that the server title and documentation
++        are escaped for HTML.
++        """
++        self.serv.set_server_title('test_title<script>')
++        self.serv.set_server_documentation('test_documentation<script>')
++        self.assertEqual('test_title<script>', self.serv.server_title)
++        self.assertEqual('test_documentation<script>',
++                self.serv.server_documentation)
++
++        generated = self.serv.generate_html_documentation()
++        title = re.search(r'<title>(.+?)</title>', generated).group()
++        documentation = re.search(r'<p><tt>(.+?)</tt></p>', generated).group()
++        self.assertEqual('<title>Python: test_title&lt;script&gt;</title>',
++                title)
++        self.assertEqual('<p><tt>test_documentation&lt;script&gt;</tt></p>',
++                documentation)
++
++
+ def test_main():
+     test_support.run_unittest(DocXMLRPCHTTPGETServer)
+ 
+diff --git a/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+new file mode 100644
+index 0000000000..8f02baed9e
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2019-09-25-13-21-09.bpo-38243.1pfz24.rst
+@@ -0,0 +1,3 @@
++Escape the server title of :class:`DocXMLRPCServer.DocXMLRPCServer`
++when rendering the document page as HTML.
++(Contributed by Dong-hee Na in :issue:`38243`.)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python_2.7.16.bb b/meta/recipes-devtools/python/python_2.7.16.bb
index 1c7c581..8cae22a 100644
--- a/meta/recipes-devtools/python/python_2.7.16.bb
+++ b/meta/recipes-devtools/python/python_2.7.16.bb
@@ -32,6 +32,7 @@ SRC_URI += " \
            file://0001-python2-use-cc_basename-to-replace-CC-for-checking-c.patch \
            file://0001-2.7-bpo-34155-Dont-parse-domains-containing-GH-13079.patch \
            file://bpo-36742-cve-2019-10160.patch \
+           file://0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch \
 "
 
 S = "${WORKDIR}/Python-${PV}"
-- 
2.7.4


