Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QXHhH-0003Af-Um
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Jun 2011 20:53:44 +0200
Received: from localhost.localdomain (c-76-115-40-57.hsd1.or.comcast.net
	[76.115.40.57])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id CB09730528;
	Thu, 16 Jun 2011 14:50:07 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jun 2011 11:50:00 -0700
Message-Id: <3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1308249837.git.scott.a.garman@intel.com>
References: <cover.1308249837.git.scott.a.garman@intel.com>
In-Reply-To: <cover.1308249837.git.scott.a.garman@intel.com>
References: <cover.1308249837.git.scott.a.garman@intel.com>
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: CB09730528.08F9B
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 1/1] base-passwd: disable problematic login.defs options
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
X-List-Received-Date: Thu, 16 Jun 2011 18:53:44 -0000

This resolves the following runtime errors when various shadow-utils
binaries are run:

configuration error - unknown item 'FAILLOG_ENAB' (notify administrator)
configuration error - unknown item 'LASTLOG_ENAB' (notify administrator)
configuration error - unknown item 'OBSCURE_CHECKS_ENAB' (notify administrator)
configuration error - unknown item 'PORTTIME_CHECKS_ENAB' (notify administrator)
configuration error - unknown item 'QUOTAS_ENAB' (notify administrator)
configuration error - unknown item 'MOTD_FILE' (notify administrator)
configuration error - unknown item 'FTMP_FILE' (notify administrator)
configuration error - unknown item 'NOLOGINS_FILE' (notify administrator)
configuration error - unknown item 'ENV_HZ' (notify administrator)
configuration error - unknown item 'PASS_MIN_LEN' (notify administrator)
configuration error - unknown item 'SU_WHEEL_ONLY' (notify administrator)
configuration error - unknown item 'CRACKLIB_DICTPATH' (notify administrator)
configuration error - unknown item 'PASS_CHANGE_TRIES' (notify administrator)
configuration error - unknown item 'PASS_ALWAYS_WARN' (notify administrator)
configuration error - unknown item 'CHFN_AUTH' (notify administrator)
configuration error - unknown item 'ENVIRON_FILE' (notify administrator)

This fixes bug [YOCTO #1170]

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../base-passwd/base-passwd-3.5.22/login.defs      |   32 ++++++++++----------
 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |    2 +-
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
index 1d392ac..2708eb6 100644
--- a/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
+++ b/meta/recipes-core/base-passwd/base-passwd-3.5.22/login.defs
@@ -14,7 +14,7 @@ FAIL_DELAY		3
 #
 # Enable logging and display of /var/log/faillog login failure info.
 #
-FAILLOG_ENAB		yes
+#FAILLOG_ENAB		yes
 
 #
 # Enable display of unknown usernames when login failures are recorded.
@@ -29,7 +29,7 @@ LOG_OK_LOGINS		no
 #
 # Enable logging and display of /var/log/lastlog login time info.
 #
-LASTLOG_ENAB		yes
+#LASTLOG_ENAB		yes
 
 #
 # Enable checking and display of mailbox status upon login.
@@ -42,17 +42,17 @@ LASTLOG_ENAB		yes
 #
 # Enable additional checks upon password changes.
 #
-OBSCURE_CHECKS_ENAB	yes
+#OBSCURE_CHECKS_ENAB	yes
 
 #
 # Enable checking of time restrictions specified in /etc/porttime.
 #
-PORTTIME_CHECKS_ENAB	yes
+#PORTTIME_CHECKS_ENAB	yes
 
 #
 # Enable setting of ulimit, umask, and niceness from passwd gecos field.
 #
-QUOTAS_ENAB		yes
+#QUOTAS_ENAB		yes
 
 #
 # Enable "syslog" logging of su activity - in addition to sulog file logging.
@@ -78,7 +78,7 @@ CONSOLE		/etc/securetty
 # If defined, ":" delimited list of "message of the day" files to
 # be displayed upon login.
 #
-MOTD_FILE	/etc/motd
+#MOTD_FILE	/etc/motd
 #MOTD_FILE	/etc/motd:/usr/lib/news/news-motd
 
 #
@@ -96,14 +96,14 @@ MOTD_FILE	/etc/motd
 # If defined, login failures will be logged here in a utmp format.
 # last, when invoked as lastb, will read /var/log/btmp, so...
 #
-FTMP_FILE	/var/log/btmp
+#FTMP_FILE	/var/log/btmp
 
 #
 # If defined, name of file whose presence which will inhibit non-root
 # logins.  The contents of this file should be a message indicating
 # why logins are inhibited.
 #
-NOLOGINS_FILE	/etc/nologin
+#NOLOGINS_FILE	/etc/nologin
 
 #
 # If defined, the command name to display when running "su -".  For
@@ -141,7 +141,7 @@ HUSHLOGIN_FILE	.hushlogin
 # If defined, an HZ environment parameter spec.
 #
 # for Linux/x86
-ENV_HZ		HZ=100
+#ENV_HZ		HZ=100
 # For Linux/Alpha...
 #ENV_HZ		HZ=1024
 
@@ -201,7 +201,7 @@ UMASK		022
 #
 PASS_MAX_DAYS	99999
 PASS_MIN_DAYS	0
-PASS_MIN_LEN	5
+#PASS_MIN_LEN	5
 PASS_WARN_AGE	7
 
 #
@@ -210,12 +210,12 @@ PASS_WARN_AGE	7
 # to uid 0 accounts.  If the group doesn't exist or is empty, no one
 # will be able to "su" to uid 0.
 #
-SU_WHEEL_ONLY	no
+#SU_WHEEL_ONLY	no
 
 #
 # If compiled with cracklib support, where are the dictionaries
 #
-CRACKLIB_DICTPATH	/var/cache/cracklib/cracklib_dict
+#CRACKLIB_DICTPATH	/var/cache/cracklib/cracklib_dict
 
 #
 # Min/max values for automatic uid selection in useradd
@@ -248,12 +248,12 @@ LOGIN_TIMEOUT		60
 #
 # Maximum number of attempts to change password if rejected (too easy)
 #
-PASS_CHANGE_TRIES	5
+#PASS_CHANGE_TRIES	5
 
 #
 # Warn about weak passwords (but still allow them) if you are root.
 #
-PASS_ALWAYS_WARN	yes
+#PASS_ALWAYS_WARN	yes
 
 #
 # Number of significant characters in the password for crypt().
@@ -265,7 +265,7 @@ PASS_ALWAYS_WARN	yes
 #
 # Require password before chfn/chsh can make any changes.
 #
-CHFN_AUTH		yes
+#CHFN_AUTH		yes
 
 #
 # Which fields may be changed by regular users using chfn - use
@@ -347,7 +347,7 @@ DEFAULT_HOME	yes
 # If this file exists and is readable, login environment will be
 # read from it.  Every line should be in the form name=value.
 #
-ENVIRON_FILE	/etc/environment
+#ENVIRON_FILE	/etc/environment
 
 #
 # If defined, this command is run when removing a user.
diff --git a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
index 3315c68..614c431 100644
--- a/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
+++ b/meta/recipes-core/base-passwd/base-passwd_3.5.22.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Base system master password/group files."
 DESCRIPTION = "The master copies of the user database files (/etc/passwd and /etc/group).  The update-passwd tool is also provided to keep the system databases synchronized with these master files."
 SECTION = "base"
-PR = "r2"
+PR = "r3"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a"
 
-- 
1.7.1



