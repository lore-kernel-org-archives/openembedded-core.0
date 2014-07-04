Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 859666ACD4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 10:50:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s64Ao008002344; Fri, 4 Jul 2014 11:50:00 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n0tj_ql8Yqie; Fri,  4 Jul 2014 11:50:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s64AnuWP002340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 4 Jul 2014 11:49:57 +0100
Message-ID: <1404470990.4852.1.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maxin B. John" <maxin.john@enea.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 04 Jul 2014 11:49:50 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] sanity.bbclass: Update minimum git version to 1.7.8
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
X-List-Received-Date: Fri, 04 Jul 2014 10:50:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

To quote "Maxin B. John" <maxin.john@enea.com>:

git version 1.7.8 added the --list option to git-branch. Since we depend on this
option in git.py, the minimum requiremnt for git should be updated to Git
1.7.8+

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 4b42b17..ed65814 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -386,15 +386,15 @@ def check_tar_version(sanity_data):
         return "Your version of tar is older than 1.24 and has bugs which will break builds. Please install a newer version of tar.\n"
     return None
 
-# We use git parameters and functionality only found in 1.7.5 or later
+# We use git parameters and functionality only found in 1.7.8 or later
 def check_git_version(sanity_data):
     from distutils.version import LooseVersion
     status, result = oe.utils.getstatusoutput("git --version 2> /dev/null")
     if status != 0:
         return "Unable to execute git --version, exit code %s\n" % status
     version = result.split()[2]
-    if LooseVersion(version) < LooseVersion("1.7.5"):
-        return "Your version of git is older than 1.7.5 and has bugs which will break builds. Please install a newer version of git.\n"
+    if LooseVersion(version) < LooseVersion("1.7.8"):
+        return "Your version of git is older than 1.7.8 and has bugs which will break builds. Please install a newer version of git.\n"
     return None
 
 # Check the required perl modules which may not be installed by default



