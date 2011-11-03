Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RLtL5-0006Eq-F1
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Nov 2011 10:11:59 +0100
Received: by wyh5 with SMTP id 5so1048371wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Nov 2011 02:05:48 -0700 (PDT)
Received: by 10.227.197.71 with SMTP id ej7mr10456519wbb.15.1320311148198;
	Thu, 03 Nov 2011 02:05:48 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id em4sm91004wbb.20.2011.11.03.02.05.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 02:05:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Nov 2011 10:05:43 +0100
Message-Id: <1320311143-5693-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH] connman 0.75: bump PR for iptables library change
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
X-List-Received-Date: Thu, 03 Nov 2011 09:11:59 -0000

connmand[180]: /usr/sbin/connmand: error while loading shared libraries: libxtables.so.5: cannot open shared object file: No such file or directory

$ dpkg-deb -c ipk/armv7a/iptables_1.4.12.1-r0_armv7a.ipk  | grep libxtables
-rwxr-xr-x root/root     35252 2011-11-01 20:16 ./usr/lib/libxtables.so.7.0.0
lrwxrwxrwx root/root         0 2011-11-01 20:16 ./usr/lib/libxtables.so.7 -> libxtables.so.7.0.0

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta/recipes-connectivity/connman/connman_0.75.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman_0.75.bb b/meta/recipes-connectivity/connman/connman_0.75.bb
index 78f2199..c6e911b 100644
--- a/meta/recipes-connectivity/connman/connman_0.75.bb
+++ b/meta/recipes-connectivity/connman/connman_0.75.bb
@@ -1,5 +1,5 @@
 require connman.inc
-PR = "r3"
+PR = "r4"
 
 EXTRA_OECONF += "\
   ac_cv_path_WPASUPPLICANT=/usr/sbin/wpa_supplicant \
-- 
1.7.2.5



