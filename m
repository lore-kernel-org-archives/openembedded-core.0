Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 708277742C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QHrRnW009167 for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:54:20 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id md_MvE8M4IFB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:54:20 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u1QHsFL2009187
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Feb 2016 17:54:16 GMT
Message-ID: <1456509255.11498.104.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Feb 2016 17:54:15 +0000
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: mirrors/own-mirrors/sanity: Updates after npm fetcher addition
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
X-List-Received-Date: Fri, 26 Feb 2016 17:54:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Update the classes after the addition of the npm fetcher to
match the other fetcher additions.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 488b86d..9e6d483 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -54,6 +54,7 @@ p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
 osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 https?$://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
 ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+npm://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 cvs://.*/.*     http://sources.openembedded.org/ \n \
 svn://.*/.*     http://sources.openembedded.org/ \n \
 git://.*/.*     http://sources.openembedded.org/ \n \
@@ -63,6 +64,7 @@ p4://.*/.*      http://sources.openembedded.org/ \n \
 osc://.*/.*     http://sources.openembedded.org/ \n \
 https?$://.*/.* http://sources.openembedded.org/ \n \
 ftp://.*/.*     http://sources.openembedded.org/ \n \
+npm://.*/.*     http://sources.openembedded.org/ \n \
 ${CPAN_MIRROR}  http://cpan.metacpan.org/ \n \
 ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 "
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index e235227..12b4267 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -9,4 +9,5 @@ p4://.*/.*      ${SOURCE_MIRROR_URL}
 osc://.*/.*     ${SOURCE_MIRROR_URL}
 https?$://.*/.* ${SOURCE_MIRROR_URL}
 ftp://.*/.*     ${SOURCE_MIRROR_URL}
+npm://.*/.*     ${SOURCE_MIRROR_URL}
 }
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 31f01ca..a0553ee 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -841,7 +841,7 @@ def check_sanity_everybuild(status, d):
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
                  'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
-                 'bzr', 'cvs']
+                 'bzr', 'cvs', 'npm']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var, True) or '').replace('\\n', '\n').split('\n')
         for mirror_entry in mirrors:



