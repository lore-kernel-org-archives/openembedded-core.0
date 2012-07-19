Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrtVP-0000tD-Rh
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 18:23:12 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 09:11:51 -0700
Received: by mail-wi0-f170.google.com with SMTP id hq12so5246627wib.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 09:11:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=5BLvNFievqD5ooOreCzk1zncvLfQC/1jHwW8LF37srE=;
	b=GQFSyi39WQbe/xmdRf09J5jRcNm2Nrm00LzS9Nl8Cr4QtJb3xFD/x223DOD/UIFN1h
	CDwC+2ncrt1AB29lewWF8Wy2ZamSd9d7pHwvaeMMPx2+Hzs5p+LA/UdrqnZOYNrCTUjP
	iDkXnsNYQPCN98HxBsRA4H2MnjXdsxCYBDtScuKDEKz9zflEF9lkETzRUXgqMehBNw75
	F4xQct8ayuUJN/6UBKBWOE1RuUkBpx2AFsFHdddKYrIHLIN8sklggrNwqq8dXFZPz96l
	Ve3oarTAca3/76uoieOmpdFZv0KjRShGAGtdle0AY1SERLAmvjw8mott1THk8SGhmWsz
	I0/g==
Received: by 10.216.218.95 with SMTP id j73mr1409366wep.193.1342714304963;
	Thu, 19 Jul 2012 09:11:44 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id cl8sm39193462wib.10.2012.07.19.09.11.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 09:11:44 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 17:10:56 +0100
Message-Id: <4ee4aaf7fefc26690137c2516761401faa0ca520.1342713965.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
In-Reply-To: <cover.1342713965.git.ross.burton@intel.com>
References: <cover.1342713965.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkVEjDOPNILU9yI/UUXNSndAGkpmyWcuaqM11L9jRPWvt7Va5JMSsfq1EaybHwH3FpsjemN
Subject: [PATCH 09/26] connman: cleanup thanks to new gtk-doc.bbclass
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
X-List-Received-Date: Thu, 19 Jul 2012 16:23:14 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-connectivity/connman/connman.inc |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman.inc b/meta/recipes-connectivity/connman/connman.inc
index 9966f87..11ac0e4 100644
--- a/meta/recipes-connectivity/connman/connman.inc
+++ b/meta/recipes-connectivity/connman/connman.inc
@@ -20,7 +20,7 @@ DEPENDS  = "dbus glib-2.0 ppp iptables gnutls \
             ${@base_contains('DISTRO_FEATURES', '3g','ofono', '', d)} \
             "
 
-INC_PR = "r12"
+INC_PR = "r13"
 
 TIST = "--enable-tist"
 TIST_powerpc = ""
@@ -28,7 +28,6 @@ TIST_powerpc = ""
 EXTRA_OECONF += "\
     ac_cv_path_WPASUPPLICANT=${sbindir}/wpa_supplicant \
     ac_cv_path_PPPD=${sbindir}/pppd \
-    --disable-gtk-doc \
     --enable-debug \
     --enable-threads \
     --enable-loopback \
@@ -53,7 +52,7 @@ USERADD_PARAM_${PN} = "--create-home \
                        --groups video,tty,audio \
                        --user-group xuser"
 
-inherit autotools pkgconfig update-rc.d useradd
+inherit autotools gtk-doc pkgconfig update-rc.d useradd
 
 # This allows *everyone* to access ConnMan over DBus, without any access
 # control.  Really the at_console flag should work, which would mean that
-- 
1.7.10



