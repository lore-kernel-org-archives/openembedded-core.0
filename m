Return-Path: <yaoxp@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 208AE6B0CE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 06:28:57 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.89,926,1367942400"; 
   d="scan'208";a="8258327"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 21 Aug 2013 14:25:53 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r7L6Sv4K021930
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Aug 2013 14:28:57 +0800
Received: from G08FNSTD100620 ([10.167.226.76])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013082114271277-819450 ;
	Wed, 21 Aug 2013 14:27:12 +0800 
From: "yaoxp" <yaoxp@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Aug 2013 14:28:59 +0800
Message-ID: <020301ce9e37$b92b36d0$2b81a470$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Ac6eN7gKTpFqR6rnQmK9O6IUNLxvHQ==
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/08/21 14:27:12,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/08/21 14:27:13,
	Serialize complete at 2013/08/21 14:27:13
Subject: [PATCH] insane.bbclass:WARNING: QA Issue: xxx doesn't match the [a-z0-9.+-]+ regex
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
X-List-Received-Date: Wed, 21 Aug 2013 06:28:59 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="UTF-8"
Content-Language: zh-cn

Will offer the following warning when there are upper case letters in =
the BB file name:
WARNING: QA Issue: xxx doesn't match the [a-z0-9.+-]+ regex

Is there such a regulation in yocto that there can't be upper case =
letters in the BB file name ?

Signed-off-by: Yao Xinpan <yaoxp@cn.fujitsu.com>
---
 meta/classes/insane.bbclass |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass =
index 336beaa..4042e1e 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -776,8 +776,8 @@ python do_package_qa () {
=20
     testmatrix =3D d.getVarFlags("QAPATHTEST")
     import re
-    # The package name matches the [a-z0-9.+-]+ regular expression
-    pkgname_pattern =3D re.compile("^[a-z0-9.+-]+$")
+    # The package name matches the [A-Za-z0-9.+-]+ regular expression
+    pkgname_pattern =3D re.compile("^[A-Za-z0-9.+-]+$")
=20
     g =3D globals()
     walk_sane =3D True
@@ -804,7 +804,7 @@ python do_package_qa () {
         # Check package name
         if not pkgname_pattern.match(package):
             package_qa_handle_error("pkgname",
-                    "%s doesn't match the [a-z0-9.+-]+ regex\n" % =
package, d)
+                    "%s doesn't match the [A-Za-z0-9.+-]+ regex\n" %=20
+ package, d)
=20
         path =3D "%s/%s" % (pkgdest, package)
         if not package_qa_walk(path, warnchecks, errorchecks, skip, =
package, d):
--
1.7.1




