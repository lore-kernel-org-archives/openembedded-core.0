Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5B4676ED56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Feb 2014 07:16:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s1B7GJv2003682
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Feb 2014 23:16:20 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Mon, 10 Feb 2014 23:16:19 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 11 Feb 2014 15:16:18 +0800
Message-ID: <a0b049ae9fa7a0ad728ef2bebdb263dd287d0392.1392102889.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392102889.git.Qi.Chen@windriver.com>
References: <cover.1392102889.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] busybox-syslog: add more comments to systemd configuration file
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
X-List-Received-Date: Tue, 11 Feb 2014 07:16:19 -0000
Content-Type: text/plain

Add more comments to the systemd configuration file for busybox's
syslogd utility. The purpose is to easy the life of system administrators.

These comments are mostly derived from the comments in syslogd.c in
busybox.

[YOCTO #5722]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../busybox/files/busybox-syslog.default           |   24 ++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/meta/recipes-core/busybox/files/busybox-syslog.default b/meta/recipes-core/busybox/files/busybox-syslog.default
index a3d51ca..e516caf 100644
--- a/meta/recipes-core/busybox/files/busybox-syslog.default
+++ b/meta/recipes-core/busybox/files/busybox-syslog.default
@@ -1 +1,25 @@
 OPTIONS="-C"
+# The above option means syslogd will log to 16K shm circular buffer.
+# You could use `logread' to read it.
+
+# All available options are:
+# -O FILE       :      Log to FILE (default:/var/log/messages)
+# -l N          :      Log only messages more urgent than prio N (1-8)
+# -S            :      Smaller output
+# -s SIZE       :      Max size (KB) before rotation (default:200KB, 0=off)
+# -b N          :      N rotated logs to keep (default:1, max=99, 0=purge)
+# -R HOST[:PORT]:      Log to HOST:PORT (default PORT:514)
+# -L            :      Log locally and via network
+# -D            :      Drop duplicates
+# -C[size_kb]   :      Log to shared mem buffer (use logread to read it)
+# -f FILE       :      Use FILE as config (default:/etc/syslog.conf)
+# -m MIN        :      Minutes between mark lines (default:20, 0=off)
+# -K            :      Log to kernel printk buffer (use dmesg to read it)
+
+# Example 1:
+# Log to local file /var/log/mylog
+# OPTIONS="-O /var/log/mylog"
+#
+# Example 2:
+# Log to remote host
+# OPTIONS="-R 192.168.1.1:601"
-- 
1.7.9.5


