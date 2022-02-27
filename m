Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC18C433EF
	for <webhook@archiver.kernel.org>; Sun, 27 Feb 2022 18:21:50 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.11594.1645986106122988617
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 10:21:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com
 header.s=axis-central1 header.b=gmWNn8CQ;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1645986108;
  x=1677522108;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Pc6sMV0RsbKzhevE7omKzSgH5ZzEaUKVYC5wnm1l/Zg=;
  b=gmWNn8CQ8RGssrJ/SGmyJI3bwiengPVkvpQSHtoG69I6QO1EbJ/rPzlu
   PwI9ibbWL2p+U7n+/OcI+qbx/WBb5Gpoj1rag3R6ktbFMytDTCIrIBNYt
   Y2/U4vbhTEWbt2W7hexkGMiKWVk13wRmGypa6hHaf+M/f74E8u6EANajF
   t5pX9hm8/XA2A/u6vvgZvONszYmzhGlrfZQn3sNTBAyGDsjMvRkQlACqw
   xvyNZy9w5Bg5zfDct1WlX9ycKji63UUWLJMMWPJbybMLbyUx2i1Ycp8Cp
   yb8BDexJDlnR8YaFOo6wwCVIPJMpMViseMcuHXJrhIX+4clMvpACwFQnb
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 3/6] recipetool/create_buildsys_python: Add support for more
 known licenses
Date: Sun, 27 Feb 2022 19:21:34 +0100
Message-ID: <20220227182138.5364-3-peter.kjellerstedt@axis.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
References: <20220227182138.5364-1-peter.kjellerstedt@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Feb 2022 18:21:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162441

Add all OSI approved licenses from https://pypi.org/classifiers/. Also
add support for Other/Proprietary (Proprietary) and Public Domain (PD).

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 .../lib/recipetool/create_buildsys_python.py   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 1a15011687..2a2c6ab6b6 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -102,10 +102,16 @@ class PythonRecipeHandler(RecipeHandler):
         'License :: OSI Approved :: Artistic License': 'Artistic',
         'License :: OSI Approved :: Attribution Assurance License': 'AAL',
         'License :: OSI Approved :: BSD License': 'BSD-3-Clause',
+        'License :: OSI Approved :: Boost Software License 1.0 (BSL-1.0)': 'BSL-1.0',
+        'License :: OSI Approved :: CEA CNRS Inria Logiciel Libre License, version 2.1 (CeCILL-2.1)': 'CECILL-2.1',
+        'License :: OSI Approved :: Common Development and Distribution License 1.0 (CDDL-1.0)': 'CDDL-1.0',
         'License :: OSI Approved :: Common Public License': 'CPL',
+        'License :: OSI Approved :: Eclipse Public License 1.0 (EPL-1.0)': 'EPL-1.0',
+        'License :: OSI Approved :: Eclipse Public License 2.0 (EPL-2.0)': 'EPL-2.0',
         'License :: OSI Approved :: Eiffel Forum License': 'EFL',
         'License :: OSI Approved :: European Union Public Licence 1.0 (EUPL 1.0)': 'EUPL-1.0',
         'License :: OSI Approved :: European Union Public Licence 1.1 (EUPL 1.1)': 'EUPL-1.1',
+        'License :: OSI Approved :: European Union Public Licence 1.2 (EUPL 1.2)': 'EUPL-1.2',
         'License :: OSI Approved :: GNU Affero General Public License v3 or later (AGPLv3+)': 'AGPL-3.0+',
         'License :: OSI Approved :: GNU Affero General Public License v3': 'AGPL-3.0',
         'License :: OSI Approved :: GNU Free Documentation License (FDL)': 'GFDL',
@@ -119,12 +125,15 @@ class PythonRecipeHandler(RecipeHandler):
         'License :: OSI Approved :: GNU Lesser General Public License v3 (LGPLv3)': 'LGPL-3.0',
         'License :: OSI Approved :: GNU Lesser General Public License v3 or later (LGPLv3+)': 'LGPL-3.0+',
         'License :: OSI Approved :: GNU Library or Lesser General Public License (LGPL)': 'LGPL',
+        'License :: OSI Approved :: Historical Permission Notice and Disclaimer (HPND)': 'HPND',
         'License :: OSI Approved :: IBM Public License': 'IPL',
         'License :: OSI Approved :: ISC License (ISCL)': 'ISC',
         'License :: OSI Approved :: Intel Open Source License': 'Intel',
         'License :: OSI Approved :: Jabber Open Source License': 'Jabber',
         'License :: OSI Approved :: MIT License': 'MIT',
+        'License :: OSI Approved :: MIT No Attribution License (MIT-0)': 'MIT-0',
         'License :: OSI Approved :: MITRE Collaborative Virtual Workspace License (CVW)': 'CVWL',
+        'License :: OSI Approved :: MirOS License (MirOS)': 'MirOS',
         'License :: OSI Approved :: Motosoto License': 'Motosoto',
         'License :: OSI Approved :: Mozilla Public License 1.0 (MPL)': 'MPL-1.0',
         'License :: OSI Approved :: Mozilla Public License 1.1 (MPL 1.1)': 'MPL-1.1',
@@ -132,19 +141,26 @@ class PythonRecipeHandler(RecipeHandler):
         'License :: OSI Approved :: Nethack General Public License': 'NGPL',
         'License :: OSI Approved :: Nokia Open Source License': 'Nokia',
         'License :: OSI Approved :: Open Group Test Suite License': 'OGTSL',
+        'License :: OSI Approved :: Open Software License 3.0 (OSL-3.0)': 'OSL-3.0',
+        'License :: OSI Approved :: PostgreSQL License': 'PostgreSQL',
         'License :: OSI Approved :: Python License (CNRI Python License)': 'CNRI-Python',
         'License :: OSI Approved :: Python Software Foundation License': 'PSF',
         'License :: OSI Approved :: Qt Public License (QPL)': 'QPL',
         'License :: OSI Approved :: Ricoh Source Code Public License': 'RSCPL',
+        'License :: OSI Approved :: SIL Open Font License 1.1 (OFL-1.1)': 'OFL-1.1',
         'License :: OSI Approved :: Sleepycat License': 'Sleepycat',
-        'License :: OSI Approved :: Sun Industry Standards Source License (SISSL)': '--  Sun Industry Standards Source License (SISSL)',
+        'License :: OSI Approved :: Sun Industry Standards Source License (SISSL)': 'SISSL',
         'License :: OSI Approved :: Sun Public License': 'SPL',
+        'License :: OSI Approved :: The Unlicense (Unlicense)': 'Unlicense',
+        'License :: OSI Approved :: Universal Permissive License (UPL)': 'UPL-1.0',
         'License :: OSI Approved :: University of Illinois/NCSA Open Source License': 'NCSA',
         'License :: OSI Approved :: Vovida Software License 1.0': 'VSL-1.0',
         'License :: OSI Approved :: W3C License': 'W3C',
         'License :: OSI Approved :: X.Net License': 'Xnet',
         'License :: OSI Approved :: Zope Public License': 'ZPL',
         'License :: OSI Approved :: zlib/libpng License': 'Zlib',
+        'License :: Other/Proprietary License': 'Proprietary',
+        'License :: Public Domain': 'PD',
     }
 
     def __init__(self):

