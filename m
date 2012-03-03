Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S3moA-0002n1-E3
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 12:07:26 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q23AwsAc008111
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Mar 2012 02:58:54 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 3 Mar 2012 02:58:53 -0800
Message-ID: <b0099a1b242e3c0b5a6229ddd6fa889581ef5ea7.1330772078.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1330772078.git.xiaofeng.yan@windriver.com>
References: <cover.1330772078.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 2 Mar 2012 15:54:15 +0800
Date: Sat, 3 Mar 2012 18:59:50 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] libx11-trim: Add error information from LSB Test Suite to makekeys_crosscompile.patch
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 03 Mar 2012 11:07:26 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Append error information from LSB Test Suite to this patch for an illustrative purpose \
why this patches should be needed.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../libx11-trim-1.4.4/makekeys_crosscompile.patch  |   33 +++++++++++++++++++-
 1 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
index e5eacf0..daf3696 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
+++ b/meta/recipes-graphics/xorg-lib/libx11-trim-1.4.4/makekeys_crosscompile.patch
@@ -1,6 +1,37 @@
 Because the size of "unsigned long" is different between 32-bit
 and 64-bit, judge whether target is 32-bit or 64-bit and tell
-"makekey". 
+"makekey".
+
+The error information from LSB Test suite is as follow:
+VSW5TESTSUITE PURPOSE 7
+Assertion XStringToKeysym-7.(A)
+When the string argument is the name of a KeySym in the 
+table with the prefix XK_ removed, then a call to
+XStringToKeysym returns that KeySym.
+METH: For each KeySym name in table with code G:
+METH: Call XStringToKeysym to obtain the KeySym defined for that string.
+METH: Verify that XStringToKeysym did not return NoSymbol.
+METH: Verify that the returned string is correct.
+CHECK: XStringToKeysym-7 1, line 130 
+CHECK: XStringToKeysym-7 2, line 140 
+CHECK: XStringToKeysym-7 3, line 150 
+CHECK: XStringToKeysym-7 4, line 160 
+CHECK: XStringToKeysym-7 5, line 170 
+CHECK: XStringToKeysym-7 6, line 180 
+CHECK: XStringToKeysym-7 7, line 190 
+CHECK: XStringToKeysym-7 8, line 200 
+CHECK: XStringToKeysym-7 9, line 210 
+CHECK: XStringToKeysym-7 10, line 220 
+CHECK: XStringToKeysym-7 11, line 230 
+CHECK: XStringToKeysym-7 12, line 240 
+CHECK: XStringToKeysym-7 13, line 250 
+CHECK: XStringToKeysym-7 14, line 260 
+CHECK: XStringToKeysym-7 15, line 270 
+CHECK: XStringToKeysym-7 16, line 280 
+CHECK: XStringToKeysym-7 17, line 290 
+CHECK: XStringToKeysym-7 18, line 300 
+CHECK: XStringToKeysym-7 19, line 310 
+CHECK: XStringToKeysym-7 20, line 320
 
 Upstream-Status: Pending
 
-- 
1.7.0.4



