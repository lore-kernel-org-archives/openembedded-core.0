Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id EDF9177AB5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 18:07:14 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 11:07:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,398,1498546800"; d="scan'208";a="139546298"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga005.jf.intel.com with ESMTP; 19 Aug 2017 11:07:15 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 19 Aug 2017 11:06:56 -0700
Message-Id: <1503166017-3945-5-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
References: <1503166017-3945-1-git-send-email-juro.bystricky@intel.com>
Cc: jurobystricky@hotmail.com
Subject: [PATCH v4 4/5] poky-reproducible.conf: Initial version
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
X-List-Received-Date: Sat, 19 Aug 2017 18:07:15 -0000

Simplify building reproducible images by using

DISTRO="poky-reproducible"

Sets some variables to reasonable values so users do not
have to set them in local.conf.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta-poky/conf/distro/include/reproducible-group  | 50 +++++++++++++++++++++++
 meta-poky/conf/distro/include/reproducible-passwd | 25 ++++++++++++
 meta-poky/conf/distro/poky-reproducible.conf      | 38 +++++++++++++++++
 3 files changed, 113 insertions(+)
 create mode 100644 meta-poky/conf/distro/include/reproducible-group
 create mode 100644 meta-poky/conf/distro/include/reproducible-passwd
 create mode 100644 meta-poky/conf/distro/poky-reproducible.conf

diff --git a/meta-poky/conf/distro/include/reproducible-group b/meta-poky/conf/distro/include/reproducible-group
new file mode 100644
index 0000000..4213d4e
--- /dev/null
+++ b/meta-poky/conf/distro/include/reproducible-group
@@ -0,0 +1,50 @@
+root:x:0:
+daemon:x:1:
+bin:x:2:
+sys:x:3:
+adm:x:4:
+tty:x:5:
+disk:x:6:
+lp:x:7:
+mail:x:8:
+news:x:9:
+uucp:x:10:
+man:x:12:
+proxy:x:13:
+kmem:x:15:
+input:x:19:
+dialout:x:20:
+fax:x:21:
+voice:x:22:
+cdrom:x:24:
+floppy:x:25:
+tape:x:26:
+sudo:x:27:
+audio:x:29:pulse
+dip:x:30:
+www-data:x:33:
+backup:x:34:
+operator:x:37:
+list:x:38:
+irc:x:39:
+src:x:40:
+gnats:x:41:
+shadow:x:42:
+utmp:x:43:
+video:x:44:
+sasl:x:45:
+plugdev:x:46:
+staff:x:50:
+games:x:60:
+shutdown:x:70:
+users:x:100:
+crontab:x:993:
+sshd:x:994:
+avahi:x:995:
+rpcuser:x:996:
+rpc:x:997:
+messagebus:x:998:
+netdev:x:999:
+tracing:x:1000:
+pulse:x:1001:pulse
+nogroup:x:65534:
diff --git a/meta-poky/conf/distro/include/reproducible-passwd b/meta-poky/conf/distro/include/reproducible-passwd
new file mode 100644
index 0000000..876195e
--- /dev/null
+++ b/meta-poky/conf/distro/include/reproducible-passwd
@@ -0,0 +1,25 @@
+root:x:0:0:root:/home/root:/bin/sh
+daemon:x:1:1:daemon:/usr/sbin:/bin/sh
+bin:x:2:2:bin:/bin:/bin/sh
+sys:x:3:3:sys:/dev:/bin/sh
+sync:x:4:65534:sync:/bin:/bin/sync
+games:x:5:60:games:/usr/games:/bin/sh
+man:x:6:12:man:/var/cache/man:/bin/sh
+lp:x:7:7:lp:/var/spool/lpd:/bin/sh
+mail:x:8:8:mail:/var/mail:/bin/sh
+news:x:9:9:news:/var/spool/news:/bin/sh
+uucp:x:10:10:uucp:/var/spool/uucp:/bin/sh
+proxy:x:13:13:proxy:/bin:/bin/sh
+www-data:x:33:33:www-data:/var/www:/bin/sh
+backup:x:34:34:backup:/var/backups:/bin/sh
+list:x:38:38:Mailing List Manager:/var/list:/bin/sh
+irc:x:39:39:ircd:/var/run/ircd:/bin/sh
+gnats:x:41:41:Gnats Bug-Reporting System (admin):/var/lib/gnats:/bin/sh
+pulse:x:993:1001::/var/run/pulse:/bin/false
+distcc:x:994:65534::/dev/null:/bin/sh
+sshd:x:995:994::/var/run/sshd:/bin/false
+avahi:x:996:995::/var/run/avahi-daemon:/bin/false
+rpcuser:x:997:996::/var/lib/nfs:/bin/false
+rpc:x:998:997::/:/bin/false
+messagebus:x:999:998::/var/lib/dbus:/bin/false
+nobody:x:65534:65534:nobody:/nonexistent:/bin/sh
diff --git a/meta-poky/conf/distro/poky-reproducible.conf b/meta-poky/conf/distro/poky-reproducible.conf
new file mode 100644
index 0000000..c94f673
--- /dev/null
+++ b/meta-poky/conf/distro/poky-reproducible.conf
@@ -0,0 +1,38 @@
+require conf/distro/poky.conf
+DISTRO = "poky-reproducible"
+
+BUILD_REPRODUCIBLE_BINARIES = "1"
+REPRODUCIBLE_TIMESTAMP_ROOTFS ?= "1483228802"
+LDCONFIGDEPEND = ""
+do_image_cpio[depends] += "cpio-replacement-native:do_populate_sysroot"
+EXTRANATIVEPATH += "cpio-native"
+IMAGE_CMD_CPIO = "cpio --ignore-devno --reproducible "
+
+IMAGE_CMD_TAR = "tar -v --sort=name "
+
+PACKAGE_CLASSES ="package_deb"
+
+# For reproducibility, we need to consistently assign the UID/GID values.
+# Use the static uid and gid mechanism from OE-core for that:
+# http://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#ref-classes-useradd
+#
+# Dynamically assigned IDs are detected and lead to an error during
+# the build.
+#
+# Developers who need to add new entries should add their own mapping
+# file to USERADD_UID_TABLES and/or USERADD_GID_TABLES, either in a
+# derived distro config or in their local.conf.
+#
+# It is also possible to disable the mechanism by modifying USERADD_ERROR_DYNAMIC:
+# "warn" merely prints a warning, empty value silently allows dynamic
+# ID allocation.
+#
+# The actual files for UID/GID values come from core-image-minimal-sdk
+# /etc/group
+# /etc/passwd
+
+USERADDEXTENSION = "useradd-staticids"
+USERADD_ERROR_DYNAMIC ??= "error"
+USERADD_UID_TABLES += "conf/distro/include/reproducible-passwd"
+USERADD_GID_TABLES += "conf/distro/include/reproducible-group"
+
-- 
2.7.4


