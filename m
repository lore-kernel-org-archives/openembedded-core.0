Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sn73Z-0007iM-Hi
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Jul 2012 13:50:41 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 06 Jul 2012 04:39:34 -0700
Received: by werf11 with SMTP id f11so4244173wer.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2012 04:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=AE6ldLkmJ85cjpNK7Z4hKCJRwJUo7aCj/1lQQST7wAo=;
	b=Nf6UuvwE9D4MlNE3WAwv6QEhRIb2KITSEeQRySJe6nBNhoFSwLLmD7VpfgYhat1rb8
	sed+7G6CCvXc8NIG6Cqk1rGUQrSoxCWYkK48YwgT6E9zOMidyJrMACCyBnTqYH36ggLK
	n50aK0zZ6TMJITswTRJn+d4k5avNWOK2xy5Np5gyNElzf/8SImtdSxeLInZPwgxcihlZ
	YPU6mDdULERcjRU0uzQYXs5Zw45MkPlHWULs5JXwbwL21iVO25du1JIttyIttq/emtJH
	+rrjsArXyVC63QYQi9um5vkwqvoTABcnUH90g92DK/esOP7rLDEWeEbtMI0KZ5hFvZhi
	EPDw==
Received: by 10.216.131.22 with SMTP id l22mr8653055wei.96.1341574772511;
	Fri, 06 Jul 2012 04:39:32 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id df4sm5300627wib.4.2012.07.06.04.39.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 06 Jul 2012 04:39:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2012 12:39:17 +0100
Message-Id: <b4b9bc707fa17d75e69994dae59ec748e64d14a9.1341574354.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1341574354.git.ross.burton@intel.com>
References: <cover.1341574354.git.ross.burton@intel.com>
In-Reply-To: <cover.1341574354.git.ross.burton@intel.com>
References: <cover.1341574354.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnKiWBQwQmNAzJC1gxYA5tN6B/byVeylUaktYHD8bQxI8cLGOVnTQ5ErgCU6QqJfV9z8/mx
Subject: [PATCH 1/2] connman: remove some obviously wrong (circa early-GNOME 2?) directories from FILES
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
X-List-Received-Date: Fri, 06 Jul 2012 11:50:41 -0000

---
 meta/recipes-connectivity/connman/connman.inc |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index ae26689..73e7818 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r9"
+INC_PR = "r10"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -118,9 +118,6 @@ RDEPENDS_${PN}-tests = "python-dbus"
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*.so.* \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
             ${base_bindir}/* ${base_sbindir}/* ${base_libdir}/*.so* ${datadir}/${PN} \
-            ${datadir}/pixmaps ${datadir}/applications \
-            ${datadir}/idl ${datadir}/omf ${datadir}/sounds \
-            ${libdir}/bonobo/servers \
             ${datadir}/dbus-1/system-services/*"
 
 FILES_${PN}-dbg += "${libdir}/connman/*/.debug"
-- 
1.7.10



