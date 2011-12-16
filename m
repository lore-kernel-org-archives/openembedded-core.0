Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RbU6N-0008Tt-Nm
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 10:29:16 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBG9MGj6021613
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Dec 2011 01:22:16 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 16 Dec 2011 01:22:16 -0800
Message-ID: <e9b09040a8b888e263e1975675cfd0386953a916.1324025415.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1324025415.git.xiaofeng.yan@windriver.com>
References: <cover.1324025415.git.xiaofeng.yan@windriver.com>
Old-Date: Fri, 16 Dec 2011 16:22:49 +0800
Date: Fri, 16 Dec 2011 17:15:50 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] udev: add a link between /dev/input/event* with keyboard
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
X-List-Received-Date: Fri, 16 Dec 2011 09:29:16 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

keyboard device could be one of event*.
For getting keyboard device to user easier, I make a link between the event of keyboard \
with keyboard0.

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-core/udev/udev-164/local.rules |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/udev/udev-164/local.rules b/meta/recipes-core/udev/udev-164/local.rules
index 625e49a..d96f840 100644
--- a/meta/recipes-core/udev/udev-164/local.rules
+++ b/meta/recipes-core/udev/udev-164/local.rules
@@ -32,4 +32,5 @@ ACTION=="add", DEVPATH=="/devices/*", ENV{MODALIAS}=="?*", RUN+="/sbin/modprobe
 
 # Create a symlink to any touchscreen input device
 SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{modalias}=="input:*-e0*,3,*a0,1,*18,*", SYMLINK+="input/touchscreen0"
-
+# Create a symlink to any keyboard input device
+SUBSYSTEM=="input", KERNEL=="event[0-9]*", ATTRS{name}=="*keyboard", SYMLINK+="input/keyboard0"
-- 
1.7.0.4



