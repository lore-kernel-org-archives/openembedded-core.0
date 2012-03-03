Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S3mo2-0002lM-QX
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Mar 2012 12:07:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q23Awkev018435
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 3 Mar 2012 02:58:46 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sat, 3 Mar 2012 02:58:46 -0800
Message-ID: <cover.1330772078.git.xiaofeng.yan@windriver.com>
Old-Date: Sat, 3 Mar 2012 18:54:38 +0800
Date: Sat, 3 Mar 2012 18:59:42 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/3]
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
X-List-Received-Date: Sat, 03 Mar 2012 11:07:19 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

LSB report the following information when running lsb  test.

VSW5TESTSUITE PURPOSE 7
Assertion XStringToKeysym-7.(A)
When the string argument is the name of a KeySym in the
table with the prefix XK_ removed, then a call to
XStringToKeysym returns that KeySym.
METH: For each KeySym name in table with code G:
METH: Call XStringToKeysym to obtain the KeySym defined for that string.
METH: Verify that XStringToKeysym did not return NoSymbol.
METH: Verify that the returned string is correct.
CHECK: XStringToKeysym-7 1, line 130
CHECK: XStringToKeysym-7 2, line 140
CHECK: XStringToKeysym-7 3, line 150
CHECK: XStringToKeysym-7 4, line 160
CHECK: XStringToKeysym-7 5, line 170

This is host contamination problem. libx11-1.4.4 hasn't patch
"makekeys_crosscompile.patch" in libx11-trim-1.4.4 because core-image-lsb-qt3
use libx11 instead of libx11-trim.



Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1970
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1970

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (3):
  libx11-1.4.4: Add patch makekeys_crosscompile.patch
  libx11-1.4.4: Add patch "makekeys_crosscompile.patch"
  libx11-trim: Add error information from LSB Test Suite to
    makekeys_crosscompile.patch

 .../libx11-1.4.4/makekeys_crosscompile.patch       |   76 ++++++++++++++++++++
 .../libx11-trim-1.4.4/makekeys_crosscompile.patch  |   33 ++++++++-
 meta/recipes-graphics/xorg-lib/libx11_1.4.4.bb     |    3 +-
 3 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-1.4.4/makekeys_crosscompile.patch



