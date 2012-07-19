Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Srpf5-0003iI-N7
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 14:16:55 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 19 Jul 2012 05:05:31 -0700
Received: by mail-we0-f180.google.com with SMTP id t11so1520407wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2012 05:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=x4jJVImaVu8v0vRRJa6TwiAi6JB69q02H+aCPxV4COE=;
	b=kSUqAboptSEsOOfRIQ0OrVzPIzN7/bZISJ2TqJDdr0WNdBbOIBPlx8Oob4UXQK7tJm
	drC+CPPsmWC1YhYHTJjQIlArINNnJBJak5TlEk6rodRXNlf7kWgSt3v0CQBrQW4pKAvs
	Tnkvs/xCzVqLxlsWGrqpbEwaSg+5OPaSIW1DVfJzNG9ChY/TyRlqEgca8GzogLX9KdFv
	dGZvv1fKEmmcoH0sT30g2zaFekI4NiB+Z5ScsDyFgaPjNsgMeI4chnoZ7jML/2MW23uY
	NhDYrLJfFGqFbxEBHNRCV6G7rIQiBTzfNMcHjT1bH8U8twB5KT3JVy4UD1TUpKZOxp8s
	Y3lA==
Received: by 10.180.99.232 with SMTP id et8mr4173986wib.11.1342699531785;
	Thu, 19 Jul 2012 05:05:31 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id t8sm38149972wiy.3.2012.07.19.05.05.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 05:05:31 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 13:05:08 +0100
Message-Id: <837112fce0a98e18f39ef992dca191fd0b6ecd17.1342699470.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1342699470.git.ross.burton@intel.com>
References: <cover.1342699470.git.ross.burton@intel.com>
In-Reply-To: <cover.1342699470.git.ross.burton@intel.com>
References: <cover.1342699470.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmN2N+4pbvyeeOGdhhzfsmg19gz830t3bRb4iO1EGMIxa+WYaFTlGI92nwtVIrZB+/x5IZX
Subject: [PATCH 2/3] polkit: remove dbus-glib and eggdbus dependencies, polkit uses gio for DBus
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
X-List-Received-Date: Thu, 19 Jul 2012 12:16:56 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 6a8fdd6..2462741 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -6,12 +6,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
                     file://src/polkit/polkit.h;beginline=1;endline=20;md5=0a8630b0133176d0504c87a0ded39db4 \
                     file://docs/polkit/html/license.html;md5=d85a36709a446c10f4ee123f9dda0e38"
 
-DEPENDS = "expat dbus-glib eggdbus intltool-native"
+DEPENDS = "expat glib-2.0 intltool-native"
 
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 
-PR = "r5"
+PR = "r6"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
-- 
1.7.10



