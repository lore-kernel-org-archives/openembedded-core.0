Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04625758DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 05:57:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t5B5vP9K009105
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 22:57:25 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Wed, 10 Jun 2015 22:57:25 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 11 Jun 2015 13:50:38 +0800
Message-ID: <1434001838-30392-1-git-send-email-kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH] Add license file XFree86-1.0
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
X-List-Received-Date: Thu, 11 Jun 2015 05:57:26 -0000
Content-Type: text/plain

Add license file XFree86-1.0 which is needed by packages such as hwdata.
It is from:

http://www.x.org/archive/X11R7.5/doc/LICENSE.html#AEN28

And add 'XFree86-1.0' to SRC_DISTRIBUTE_LICENSES.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/conf/licenses.conf                |  2 +-
 meta/files/common-licenses/XFree86-1.0 | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta/files/common-licenses/XFree86-1.0

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 629916b..9917c40 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -36,7 +36,7 @@ SRC_DISTRIBUTE_LICENSES += "OSL-3.0 PD PHP-3.0 PostgreSQL Proprietary"
 SRC_DISTRIBUTE_LICENSES += "Python-2.0 QPL-1.0 RHeCos-1 RHeCos-1.1 RPL-1.5"
 SRC_DISTRIBUTE_LICENSES += "RPSL-1.0 RSCPL Ruby SAX-PD SGI-1 Simple-2.0 Sleepycat"
 SRC_DISTRIBUTE_LICENSES += "SPL-1.0 SugarCRM-1 SugarCRM-1.1.3 UCB VSL-1.0 W3C"
-SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.1 Xnet XSL YPL-1.1"
+SRC_DISTRIBUTE_LICENSES += "Watcom-1.0 WXwindows XFree86-1.0 XFree86-1.1 Xnet XSL YPL-1.1"
 SRC_DISTRIBUTE_LICENSES += "Zimbra-1.3 Zlib ZPL-1.1 ZPL-2.0 ZPL-2.1"
 
 # Standards are great! Everyone has their own. In an effort to standardize licensing
diff --git a/meta/files/common-licenses/XFree86-1.0 b/meta/files/common-licenses/XFree86-1.0
new file mode 100644
index 0000000..b1f3bf4
--- /dev/null
+++ b/meta/files/common-licenses/XFree86-1.0
@@ -0,0 +1,22 @@
+Copyright (C) 1994-2003 The XFree86 Project, Inc. All Rights Reserved.
+
+Permission is hereby granted, free of charge, to any person obtaining a copy of
+this software and associated documentation files (the "Software"), to deal in
+the Software without restriction, including without limitation the rights to
+use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
+of the Software, and to permit persons to whom the Software is furnished to do
+so, subject to the following conditions:
+
+The above copyright notice and this permission notice shall be included in all
+copies or substantial portions of the Software.
+
+THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
+XFREE86 PROJECT BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
+AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+
+Except as contained in this notice, the name of the XFree86 Project shall not
+be used in advertising or otherwise to promote the sale, use or other dealings
+in this Software without prior written authorization from the XFree86 Project.
-- 
1.9.1


