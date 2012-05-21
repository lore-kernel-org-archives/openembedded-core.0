Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SWJZy-0005eM-Uz
	for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 05:46:43 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so5531122pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2012 20:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=BtzHtS3uK4P/Q9Z8TkPY6vtKSyh4RZeV+CGlbtuAjMw=;
	b=ZPeVov/0kHlK5+d2srFbTo/dtByHQKrb3oPTUN6geg2uu9xzfSEOcSXMYQiIG+aJPU
	MDvUx3W8XTCIlPP7NN4zsvRri8yArujJoxwKgCl02SDZFzaj9dEHqGHGQoOuxhrQSwPx
	P/tfqEkSkiPHyvFOrLk+cQnuue8IZWeGWC0Qw2tbxTg89NT5bBe2GmvbSD4mgfo6chjt
	3ssPogdSf8bpAQ2LXXznq0JFHgCrBn+mjTT4hqV18m+bNUsHZNDudGVHBCaBcio+cJVJ
	mObcfbdcH2XqVfxN8+55HZcCP+LFhFyaXmzTsjCqcuVdCrXLqmPrXxJO3F8kt9aNATQw
	91ww==
Received: by 10.68.225.230 with SMTP id rn6mr6889985pbc.70.1337571397903;
	Sun, 20 May 2012 20:36:37 -0700 (PDT)
Received: from localhost.localdomain (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id rv5sm21589703pbc.56.2012.05.20.20.36.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 May 2012 20:36:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2012 20:35:44 -0700
Message-Id: <1e7406e4f2f93b6b4fa75716c4e901a96206be69.1337570904.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
References: <77dc886107e1b9cdaf6803141dc97c3ebfc22910.1337570904.git.raj.khem@gmail.com>
In-Reply-To: <cover.1337570904.git.raj.khem@gmail.com>
References: <cover.1337570904.git.raj.khem@gmail.com>
Subject: [PATCH 09/14] netbase: Add interface files for qemumips64 and qemush4
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
X-List-Received-Date: Mon, 21 May 2012 03:46:43 -0000

These files are alike other qemu machines they
help in creating a working network interface when
using qemumips64 or qemush4

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../netbase/netbase-4.47/qemumips64/interfaces     |    8 ++++++++
 .../netbase/netbase-4.47/qemush4/interfaces        |    8 ++++++++
 meta/recipes-core/netbase/netbase_4.47.bb          |    4 ++--
 3 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
 create mode 100644 meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces

diff --git a/meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-4.47/qemumips64/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces b/meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces
new file mode 100644
index 0000000..f62b9a8
--- /dev/null
+++ b/meta/recipes-core/netbase/netbase-4.47/qemush4/interfaces
@@ -0,0 +1,8 @@
+# /etc/network/interfaces -- configuration file for ifup(8), ifdown(8)
+ 
+# The loopback interface
+auto lo
+iface lo inet loopback
+
+
+
diff --git a/meta/recipes-core/netbase/netbase_4.47.bb b/meta/recipes-core/netbase/netbase_4.47.bb
index a1462f8..1c85997 100644
--- a/meta/recipes-core/netbase/netbase_4.47.bb
+++ b/meta/recipes-core/netbase/netbase_4.47.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://packages.debian.org/netbase"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://debian/copyright;md5=3dd6192d306f582dee7687da3d8748ab"
-PR = "r1"
+PR = "r2"
 
 inherit update-rc.d
 
@@ -37,7 +37,7 @@ do_install () {
 
 	# Disable network manager on machines that commonly do NFS booting
 	case "${MACHINE}" in
-		"qemuarm" | "qemux86" | "qemux86-64" | "qemumips" | "qemuppc" )
+		"qemuarm*" | "qemux86" | "qemux86-64" | "qemumips*" | "qemuppc" | "qemush*")
 			touch ${D}${sysconfdir}/network/nm-disabled-eth0
 			;;
 		*)
-- 
1.7.5.4



