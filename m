Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RitGB-00086v-09
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 20:45:59 +0100
Received: by mail-yx0-f175.google.com with SMTP id m12so373860yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jan 2012 11:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3Pj/841k4071Ymwpq5uCOygsorKyICwXTywgRj6alxA=;
	b=IqxfbHCtsvKlYqmLw8Tb65HMz13pxBmfAIiHbDfkqO9suFOfaWG9gKxabgzjF+cL/u
	s87oUzyTOCrSl+1PfLGr4VUCGU3SNhvQhUxMXxEiimQTMnF8TttX/8WXUfIWafb23Lqa
	AxNLUUqgJn3xNcJsGg/B5drGFxRB8hdeFdl+I=
Received: by 10.236.184.8 with SMTP id r8mr3720024yhm.110.1325792318007;
	Thu, 05 Jan 2012 11:38:38 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id n5sm83398402yhk.1.2012.01.05.11.38.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 05 Jan 2012 11:38:36 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 19:37:57 +0000
Message-Id: <00db3b0d3f0036287ded09aa0a329cf444faacda.1325792209.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1325792209.git.otavio@ossystems.com.br>
References: <cover.1325792209.git.otavio@ossystems.com.br>
Subject: [PATCH 07/10] busybox: disable syslogd configuration file support
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
X-List-Received-Date: Thu, 05 Jan 2012 19:45:59 -0000

Most people and distro uses /etc/syslogd.conf as a set of environment
variables to configure the init script behavior however syslogd
configuration file support try to parse this file as a regular
syslogd.conf format making impossible to use the service.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-core/busybox/busybox-1.19.3/defconfig |    2 +-
 meta/recipes-core/busybox/busybox_1.19.3.bb        |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/busybox/busybox-1.19.3/defconfig b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
index 1990f28..4d04c54 100644
--- a/meta/recipes-core/busybox/busybox-1.19.3/defconfig
+++ b/meta/recipes-core/busybox/busybox-1.19.3/defconfig
@@ -998,7 +998,7 @@ CONFIG_SYSLOGD=y
 CONFIG_FEATURE_ROTATE_LOGFILE=y
 CONFIG_FEATURE_REMOTE_LOG=y
 # CONFIG_FEATURE_SYSLOGD_DUP is not set
-CONFIG_FEATURE_SYSLOGD_CFG=y
+# CONFIG_FEATURE_SYSLOGD_CFG is not set
 CONFIG_FEATURE_SYSLOGD_READ_BUFFER_SIZE=256
 CONFIG_FEATURE_IPC_SYSLOG=y
 CONFIG_FEATURE_IPC_SYSLOG_BUFFER_SIZE=16
diff --git a/meta/recipes-core/busybox/busybox_1.19.3.bb b/meta/recipes-core/busybox/busybox_1.19.3.bb
index f591856..a075407 100644
--- a/meta/recipes-core/busybox/busybox_1.19.3.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.3.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
-- 
1.7.2.5



