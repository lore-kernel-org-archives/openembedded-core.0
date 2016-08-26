Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE8DD770B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 19:56:05 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id v123so6419681qkh.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=lYdwF1dATiziyG9jMP4NutBy7swfM/qTHw5clXYGgHE=;
	b=JmFyky8ndP80qlD/nmQJlMP92bS84qaHoWWxzIVagFuEBRTwM3NTikruRSSqFkfCDm
	DFueWy+5tEB6jLvE6LnI+5WI1WYSXEmJA7n8pyyoczyE7q0LQmqNnvEg0cexe2avEc7X
	/yKU/jh5E2TeVBBHe8GTYdh02b16Xcd0qJzGrFfxiqzwLaiWF3gUD4duLb3dXOmvvDk7
	OnoNCPNg8HKf/5ifMBSEupw5ns38Ih2JfNrUx1x2F5Ng2iiz5YN8SaFvwbASdP+9+Ji/
	RSC8wsAaZJeXi5L0wqfQSaslxGSO5JtRxQGyYsPXNE+QzaamTtvE2QsRh1DC6BDAmiVQ
	COVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=lYdwF1dATiziyG9jMP4NutBy7swfM/qTHw5clXYGgHE=;
	b=IwJyA+J6P9mzbmjggr9qAW2EOKnfU1XwbBIndLc6D+yQCEE6OL48zQpJ/U4wGklsAt
	cQpDVp82V/XbODJRBf8zoNq7TslRXV7EyclpZqwo+JbrzyNVYr6BzHsqxc93qVEDB2kB
	dzfENgPS96GN7yY6YKyqlVBdlyuYBfzmx4vN9c9F1lfbQfIdrodKDXms1d7W6KfeKy2a
	XCRrf+pVPU3YxXJtmMjPxzcQ0yzUeGNIXzbiJ+v7c1XcvdFIj+QgU1H0Jdk7/N8MvkK4
	74fctKv6YSLvmlxIjE3Rv9IhXAUpLDuk6Y2feN3NAsYnL87TDEh/8Suwu953g0cVgSTv
	LyTw==
X-Gm-Message-State: AE9vXwPh+e6j1HzOdjJbUYYh43IEYAILyTkxumoS1GYWA6AhstnfNYaTPxOgLVNTpwpWDg==
X-Received: by 10.55.179.197 with SMTP id c188mr5398440qkf.7.1472241366504;
	Fri, 26 Aug 2016 12:56:06 -0700 (PDT)
Received: from monster.lab.ossystems.com.br ([177.127.4.56])
	by smtp.gmail.com with ESMTPSA id
	e33sm11237486qta.47.2016.08.26.12.56.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Aug 2016 12:56:05 -0700 (PDT)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 16:55:02 -0300
Message-Id: <1472241302-7437-2-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1472241302-7437-1-git-send-email-fabio.berton@ossystems.com.br>
References: <1472241302-7437-1-git-send-email-fabio.berton@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/2] watchdog-config: Add recipe
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
X-List-Received-Date: Fri, 26 Aug 2016 19:56:06 -0000

Provides configuration files for watchdog.
Add watchdog-config as a runtime dependence of watchdog and remove
watchdog.conf file from watchdog installation.

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/recipes-extended/watchdog/watchdog-config.bb  | 20 +++++++++++
 .../watchdog/watchdog-config/watchdog.conf         | 42 ++++++++++++++++++++++
 .../watchdog/watchdog-config/watchdog.default      |  2 ++
 meta/recipes-extended/watchdog/watchdog_5.15.bb    |  6 +++-
 4 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/watchdog/watchdog-config.bb
 create mode 100644 meta/recipes-extended/watchdog/watchdog-config/watchdog.conf
 create mode 100644 meta/recipes-extended/watchdog/watchdog-config/watchdog.default

diff --git a/meta/recipes-extended/watchdog/watchdog-config.bb b/meta/recipes-extended/watchdog/watchdog-config.bb
new file mode 100644
index 0000000..8bf40f0
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog-config.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Software watchdog"
+DESCRIPTION = "Watchdog is a daemon that checks if your system is still \
+working. If programs in user space are not longer executed it will reboot \
+the system."
+HOMEPAGE = "http://watchdog.sourceforge.net/"
+BUGTRACKER = "http://sourceforge.net/tracker/?group_id=172030&atid=860194"
+
+LICENSE = "MIT-X"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+
+SRC_URI = " \
+    file://watchdog.default \
+    file://watchdog.conf \
+"
+
+do_install() {
+    install -Dm 0644 ${WORKDIR}/watchdog.default ${D}${sysconfdir}/default/watchdog
+    install -Dm 0644 ${WORKDIR}/watchdog.conf ${D}${sysconfdir}/watchdog.conf
+}
+
diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.conf b/meta/recipes-extended/watchdog/watchdog-config/watchdog.conf
new file mode 100644
index 0000000..c493d12
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.conf
@@ -0,0 +1,42 @@
+#ping			= 172.31.14.1
+#ping			= 172.26.1.255
+#interface		= eth0
+#file			= /var/log/messages
+#change			= 1407
+
+# Uncomment to enable test. Setting one of these values to '0' disables it.
+# These values will hopefully never reboot your machine during normal use
+# (if your machine is really hung, the loadavg will go much higher than 25)
+#max-load-1		= 24
+#max-load-5		= 18
+#max-load-15		= 12
+
+# Note that this is the number of pages!
+# To get the real size, check how large the pagesize is on your machine.
+#min-memory		= 1
+
+#repair-binary		= /usr/sbin/repair
+#repair-timeout		= 
+#test-binary		= 
+#test-timeout		= 
+
+watchdog-device	= /dev/watchdog
+
+# Defaults compiled into the binary
+#temperature-device	=
+#max-temperature	= 120
+
+# Defaults compiled into the binary
+#admin			= root
+#interval		= 1
+#logtick                = 1
+#log-dir		= /var/log/watchdog
+
+# This greatly decreases the chance that watchdog won't be scheduled before
+# your machine is really loaded
+realtime		= yes
+priority		= 1
+
+# Check if rsyslogd is still running by enabling the following line
+#pidfile		= /var/run/rsyslogd.pid   
+
diff --git a/meta/recipes-extended/watchdog/watchdog-config/watchdog.default b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
new file mode 100644
index 0000000..647d5ab
--- /dev/null
+++ b/meta/recipes-extended/watchdog/watchdog-config/watchdog.default
@@ -0,0 +1,2 @@
+# Start watchdog at boot time? 0 or 1
+run_watchdog=1
diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 1c0049c..cedfc04 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -40,6 +40,9 @@ INITSCRIPT_PARAMS_${PN}-keepalive = "start 15 1 2 3 4 5 . stop 85 0 6 ."
 do_install_append() {
 	install -D ${S}/redhat/watchdog.init ${D}/${sysconfdir}/init.d/watchdog.sh
     install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
+
+    # watchdog.conf is provided by the watchdog-config recipe
+    rm ${D}${sysconfdir}/watchdog.conf
 }
 
 PACKAGES =+ "${PN}-keepalive"
@@ -49,7 +52,8 @@ FILES_${PN}-keepalive = " \
     ${sbindir}/wd_keepalive \
 "
 
-RDEPENDS_${PN} += "${PN}-keepalive"
+RDEPENDS_${PN} += "${PN}-config ${PN}-keepalive"
+RDEPENDS_${PN}-keepalive += "${PN}-config"
 
 RRECOMMENDS_${PN} = "kernel-module-softdog"
 
-- 
2.1.4


