Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UPbD5-0005Qb-6n
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:15:52 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Apr 2013 08:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="319771574"
Received: from adamian-desktop.rb.intel.com ([10.237.105.58])
	by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2013 08:58:28 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 8262F560EBE; Tue,  9 Apr 2013 18:58:40 +0300 (EEST)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: sgw@linux.intel.com, richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 18:58:39 +0300
Message-Id: <1365523119-27605-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] udev: changed location of udevd to /sbin/udev/udevd
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Apr 2013 16:15:53 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This ammends the init script after changing the location from
/lib to /sbin.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-core/udev/udev/init |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 95d2672..ea87d64 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -15,7 +15,7 @@ export TZ=/etc/localtime
 
 [ -d /sys/class ] || exit 1
 [ -r /proc/mounts ] || exit 1
-[ -x /lib/udev/udevd ] || exit 1
+[ -x /sbin/udev/udevd ] || exit 1
 [ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
 [ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
 
@@ -71,7 +71,7 @@ case "$1" in
 
     # trigger the sorted events
     echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
-    /lib/udev/udevd -d
+    /sbin/udev/udevd -d
 
     /usr/bin/udevadm control --env=STARTUP=1
     if [ "$not_first_boot" != "" ];then
-- 
1.7.10.4



