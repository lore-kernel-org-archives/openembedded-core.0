Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SaO32-0004E1-Ea
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 11:21:32 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q519BBht012010
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 02:11:11 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 1 Jun 2012 02:11:10 -0700
From: <xiaofeng.yan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 1 Jun 2012 17:13:48 +0800
Message-ID: <64ceba487ad4551aaa26371fde22b7d102668dda.1338541462.git.xiaofeng.yan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1338541462.git.xiaofeng.yan@windriver.com>
References: <cover.1338541462.git.xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 2/3 V2] lsbinitscripts: Patch file functions for confirming to an lsb image
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
X-List-Received-Date: Fri, 01 Jun 2012 09:21:32 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add the condition judgment to functions for avoiding to print error
information when system start up at first.

[YOCTO #2133]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 .../lsb/lsbinitscripts/functions.patch             |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/lsb/lsbinitscripts/functions.patch

diff --git a/meta/recipes-extended/lsb/lsbinitscripts/functions.patch b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
new file mode 100644
index 0000000..aa63cec
--- /dev/null
+++ b/meta/recipes-extended/lsb/lsbinitscripts/functions.patch
@@ -0,0 +1,11 @@
+--- a/rc.d/init.d/functions	2009-12-10 05:24:11.000000000 +0800
++++ b/rc.d/init.d/functions.new	2012-06-01 16:57:12.651229387 +0800
+@@ -16,7 +16,7 @@
+ # Get a sane screen width
+ [ -z "${COLUMNS:-}" ] && COLUMNS=80
+ 
+-[ -z "${CONSOLETYPE:-}" ] && CONSOLETYPE="$(/sbin/consoletype)"
++[ -z "${CONSOLETYPE:-}" ] && [ -e /sbin/consoletype ] && CONSOLETYPE="$(/sbin/consoletype)"
+ 
+ if [ -f /etc/sysconfig/i18n -a -z "${NOLOCALE:-}" -a -z "${LANGSH_SOURCED:-}" ] ; then
+   . /etc/profile.d/lang.sh 2>/dev/null
-- 
1.7.0.4



