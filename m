Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4BAA07F896
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 15:20:46 +0000 (UTC)
Received: by mail-pg1-f171.google.com with SMTP id k3so10049894pgc.3
	for <openembedded-core@openembedded.org>;
	Thu, 16 Jan 2020 07:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=SFn3D7P08y8SBnwEx8Mz/wElUkCCfs1muFTgRkSCDp4=;
	b=kqmPjp423DarH8EHV6Qc+CPMLRif0oNqU2uMysANdtfFAKyLU8Xm9f+qPm/yrbqMNB
	FlZkXDonBUCQ8z5gM4LrSyeBeCaQ5ql+xlh3Fr1JEx1K5Korch/IkjXE1cHFG5z/LpL7
	qgAr9oJVO0Ia7CPySoDzS+k9XuuL40EcZqWt70UPnt2FhM18qXcJZmtOiHhERlgXtKHp
	dF4lXAe5JlrnzVXKpkjyNrc5l6xYr1DNJZeZU6enfdHC15xZ3BeCuEMyGKC6CUrW+EZ3
	jgVc82lyIU4AkAsRj8+FKsOyIJZpfLozqr//bYZ0PvDRzseRpnZGN2Bvw2+svdd7ah7D
	+/+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=SFn3D7P08y8SBnwEx8Mz/wElUkCCfs1muFTgRkSCDp4=;
	b=MgMcoPaDf0IObjn03yKMKZ9CH8JctapvZUzHp5BqpyyoPABrKUJ06OcF8gHAazmA1d
	2gh/NkAKS2VSCco4k0+2CR4A0bw3ocLBI0hzYnDuh2laQAlLPoJYijHuHV3XR/Q63LsU
	n5aas5vz/XZOk2d4JjFHMHWoKR/BcTBDvyVoL0oVLqlT0K0GeEm4LXDFR9odefAhdP2C
	9U/kl++TpetQnJ6QwF7XdpS+Mv2LSP6zU6aCdiphtxXImJrf9OMqrRJ5eoJFykQ3T+pr
	kL8sZu2x5InASJttlDNegbvxkUmCVlFNLtWhs7yL3yTTK2rZQagka37L0y5xqwYdC/W+
	PQfw==
X-Gm-Message-State: APjAAAXME1l46ofhZRHySXRO6jVut0hHtfA3mAT02G2dOdzfx1OGOBnq
	Eoqu/lS6FkMfPNnJxDZD22fC5kE5
X-Google-Smtp-Source: APXvYqxx15B90c1e7hpv8zYKtcCFck6QbP4F4c8It8xVJHqaKMZ4hoQHiZLBIzAdG3+1zri9TXnhPw==
X-Received: by 2002:a63:6e0e:: with SMTP id j14mr39016561pgc.361.1579188046814;
	Thu, 16 Jan 2020 07:20:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:e8a7:159f:54e9:3f07])
	by smtp.gmail.com with ESMTPSA id
	n26sm26282377pgd.46.2020.01.16.07.20.45
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 16 Jan 2020 07:20:46 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Thu, 16 Jan 2020 07:20:11 -0800
Message-Id: <27fea8ea1da28bb3163b5d503e6d16948c50f2ae.1579187957.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579187957.git.akuster808@gmail.com>
References: <cover.1579187957.git.akuster808@gmail.com>
Subject: [warrior 02/32] python: fix CVE-2019-16935
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
X-List-Received-Date: Thu, 16 Jan 2020 15:20:46 -0000

From: Chen Qi <Qi.Chen@windriver.com>

(From OE-Core rev: 1a7593bcdaf8a8cf15259aee8a0e2686247f2987)

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...cape-the-server-title-of-DocXMLRPCSe.patch | 101 ++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.16.bb |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch

diff --git a/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch b/meta/recipes-devtools/python/python/0001-2.7-bpo-38243-Escape-the-server-title-of-DocXMLRPCSe.patch
new file mode 100644
index 0000000000..3025cf7bc8
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
index 1c7c58199f..8cae22a1e2 100644
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
2.17.1


