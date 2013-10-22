Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 336636D134
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 09:40:25 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9M9eQwK013867
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2013 02:40:26 -0700 (PDT)
Received: from PKE-CLU1-D1.wrs.com (128.224.162.203) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 22 Oct 2013 02:40:26 -0700
From: <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Oct 2013 17:40:22 +0800
Message-ID: <1382434823-12648-1-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] dbus: no messages of status command print
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
X-List-Received-Date: Tue, 22 Oct 2013 09:40:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Lu Chong <Chong.Lu@windriver.com>

/etc/init.d/dbus-1 use "set -e" to let the script exit when any command failes.
This will cause "/etc/init.d/dbus-1 status" command can't display messages when dbus is stopped.

Signed-off-by: Lu Chong <Chong.Lu@windriver.com>
---
 meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init b/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
index 04025e6..42c8629 100644
--- a/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
+++ b/meta/recipes-core/dbus/dbus-1.6.10/dbus-1.init
@@ -14,7 +14,7 @@
 # Debian init.d script for D-BUS
 # Copyright © 2003 Colin Walters <walters@debian.org>
 
-set -e
+# set -e
 
 # Source function library.
 . /etc/init.d/functions
-- 
1.7.9.5


