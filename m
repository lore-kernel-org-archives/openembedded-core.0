Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sh0Qk-0001Bs-J3
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 17:33:22 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 19 Jun 2012 08:22:37 -0700
Received: by weyt11 with SMTP id t11so4230697wey.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jun 2012 08:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=HQj1pgNy1PDKgek1QfZkRxpWvech+Tb8OjA9W460nl8=;
	b=kogk74XSShkDqQ+nHWNtptTyjRqpPEYvX6f3oQgS7A6C0AF/gvfkgeeTCcuzt6QMQj
	2QljrL18nlmvdkS+pN9fcw9FzdApdZmp45ryy0/iDNOIIFBmbJKmhq/Ylj9cKD+TfZOL
	JWj6Bg9xYOBjdjtDUUqie7SGWH38TjrctTvUI0ujPTUghXtDEpyxfC9xdTkfcyq5IB9Y
	/oPULf6GR59F7/eYWFiq0nhMDN/Ls5nrXS3ztUEMVSaIAVO5k3rNIGOtEKgC5ozDXY/4
	a1Kn/gF3SxGRzVMRotMd5+yHZHY2NDAU6/Ip21Ok1d38GLh5fnYXsl5xJxry6YuJYFzN
	PMbQ==
Received: by 10.216.225.230 with SMTP id z80mr2205864wep.182.1340119355489;
	Tue, 19 Jun 2012 08:22:35 -0700 (PDT)
Received: from localhost.localdomain (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q6sm33612651wiy.0.2012.06.19.08.22.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jun 2012 08:22:34 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 16:22:25 +0100
Message-Id: <b434d2456d62bc5ffcd1cc513b977d8eb0f0bdb2.1340119197.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340119197.git.ross.burton@intel.com>
References: <cover.1340119197.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn9FHzjBVghwIA1YAbSYn0qopDmVl26VdWUorUsOPzo37ugS1VkBZp/6/MqRfnua0ktmTNj
Subject: [PATCH 1/6] connman: rationalise configure options
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
X-List-Received-Date: Tue, 19 Jun 2012 15:33:22 -0000

dnsproxy and ntpd don't exist anymore, and the client is almost entirely useless.
---
 meta/recipes-connectivity/connman/connman.inc |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 3412323..7a10615 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -35,14 +35,12 @@ EXTRA_OECONF += "\
     --enable-ethernet \
     ${@base_contains('DISTRO_FEATURES', 'wifi','--enable-wifi ${TIST}', '--disable-wifi', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth','--enable-bluetooth ${TIST}', '--disable-bluetooth', d)} \
-    --enable-dnsproxy \
     ${@base_contains('DISTRO_FEATURES', '3g', '', '--disable-ofono', d)} \
     --enable-tools \
     --enable-test \
     --disable-polkit \
-    --enable-client \
+    --disable-client \
     --enable-fake \
-    --disable-ntpd \
 "
 
 INITSCRIPT_NAME = "connman"
-- 
1.7.7.6



