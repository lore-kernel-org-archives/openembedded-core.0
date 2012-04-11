Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SI01D-0007Iy-Oj
	for openembedded-core@lists.openembedded.org;
	Wed, 11 Apr 2012 18:03:39 +0200
Received: by wgbdr12 with SMTP id dr12so876663wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 08:54:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=MsFi07iP4/ASwmNAqnGcRciZ9uuEcaLKITHKUdG5Z4M=;
	b=eMlAGNff3EwoIF2XtR2mBzbPOavv4NaQlLYHfZhfQ3rPK2R2BA0yL0S/roZ78DirJ/
	HHJFWXkscb1/LL8OGn6GpYtTNO8vUsY+0Wdu1bXUrfPPaci3vV3IeTDsOfscb9CGvrfo
	WPH+7He9BsRQI6F2/MoMSCT6QB3TtpgforELNcW0gIHRRYNmfxWi4Qk9KWDHvapWnlHR
	GvZZllHocDRNKOHaVPsfL3pGNfHWV1OtOSbqWg5zPMcTda/rAp621p9IGKgq1YhHQh5X
	U6HmvTzDaGMCz882e5wTjvCmKIjxZi9lba5i0mIePPxTnB+tu+pUiItObi1raiUeabeV
	Iaww==
Received: by 10.216.52.8 with SMTP id d8mr888702wec.104.1334159660449;
	Wed, 11 Apr 2012 08:54:20 -0700 (PDT)
Received: from localhost.localdomain ([89.121.200.106])
	by mx.google.com with ESMTPS id n8sm10877794wix.10.2012.04.11.08.54.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 08:54:19 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Apr 2012 18:54:13 +0300
Message-Id: <c76e09de7b542e3860f49ed8fb7733d60b21b5bc.1334159446.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1334159446.git.andrei@gherzan.ro>
References: <cover.1334159446.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQlph1M+Ki/KCNsQXKVzg0VQoGdl56Ws2UTfTSCJGESl5NGULqplwURTH+OHgvgnDzR6B9Su
Subject: [V4 1/2] gdbm: Package compat libs in gdbm-compat
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
X-List-Received-Date: Wed, 11 Apr 2012 16:03:39 -0000

In order to avoid breaking packages which depend on old package name libgdbm4 (>= 1.10),
compat libs are packaged into a separate package named gdbm-compat.

Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/recipes-support/gdbm/gdbm_1.10.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/gdbm/gdbm_1.10.bb b/meta/recipes-support/gdbm/gdbm_1.10.bb
index 26b8009..6b68d27 100644
--- a/meta/recipes-support/gdbm/gdbm_1.10.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.10.bb
@@ -4,7 +4,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=241da1b9fe42e642cbb2c24d5e0c4d24"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "${GNU_MIRROR}/gdbm/gdbm-${PV}.tar.gz"
 
@@ -25,3 +25,8 @@ do_install_append () {
     ln -sf ../ndbm.h ${D}/${includedir}/gdbm/ndbm.h
     ln -sf ../gdbm.h ${D}/${includedir}/gdbm/gdbm.h
 }
+
+PACKAGES =+ "${PN}-compat \
+            "
+FILES_${PN}-compat = "${libdir}/libgdbm_compat${SOLIBS} \
+                     "
-- 
1.7.5.4



