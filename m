Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RtDBX-0007OZ-6f
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 08:03:51 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q136tnV8027879
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 2 Feb 2012 22:55:50 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 2 Feb 2012 22:55:49 -0800
Message-ID: <b564147d266b5536445ed4872c5d451780be6b98.1328250226.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1328250226.git.xiaofeng.yan@windriver.com>
References: <cover.1328250226.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 3 Feb 2012 14:18:46 +0800
Date: Fri, 3 Feb 2012 14:39:43 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] init-functions: Add two functions
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
X-List-Received-Date: Fri, 03 Feb 2012 07:03:51 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Add log_begin_msg() and log_end_msg () in init-functions because some startup scripts need them.
if there are not two functions, then error information will arise on screen.
for example,
$ /etc/init.d/avahi-daemon start
/etc/init.d/avahi-daemon: line 161: log_begin_msg: command not found
/etc/init.d/avahi-daemon: line 163: log_end_msg: command not found

[YOCTO #1907]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-extended/lsb/lsb/init-functions |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsb/init-functions b/meta/recipes-extended/lsb/lsb/init-functions
index bf424dd..e15827a 100755
--- a/meta/recipes-extended/lsb/lsb/init-functions
+++ b/meta/recipes-extended/lsb/lsb/init-functions
@@ -30,3 +30,10 @@ log_warning_msg () {
 	/etc/core-lsb/lsb_log_message warning "$@"
 }
 
+log_begin_msg () {
+	/etc/core-lsb/lsb_log_message begin "$@"
+}
+
+log_end_msg () {
+	/etc/core-lsb/lsb_log_message end "$@"
+}
-- 
1.7.0.4



