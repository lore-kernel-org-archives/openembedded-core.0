Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5A83A7EF54
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 12:49:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id f17so8847508wme.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 05:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=abnj1/l0mkwI9h/Qb5LLNIcTu0mtOkl1kyDQPvvCgMU=;
	b=JPikUfjkHH+1fFHn0gMKMpbRwkiZSrsOQdlx93nAUs67HGErdy7pGJYVqAA7uB6XVb
	KEftNRUTX+ij60lK8RxGvd5SwVCIZu3QKJRRU1shchlto4t/edAjPb5n0E8+lsPyi4T4
	NGrmTQUd2VYYMQ1GEJGNnQB20zHAhpEu3BhdAihTWSvZS+sTe/OqBRB6Ep1N1iy0Ljyg
	9K8edA0HIRVsSpxrBYo3ugx2wZlRyqqjR4fo6udPzm2iOnVkL3g62g9CM8ehiQp30wZX
	qqaPRHsMAL1KaDNiSotetGY+tz1H9yvbinE1bfwWoCEFHiWNVztFckIfrE3h84bagFru
	FpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=abnj1/l0mkwI9h/Qb5LLNIcTu0mtOkl1kyDQPvvCgMU=;
	b=FuPOhRGh2pHT0xpnZQFjcX9Uegf6nqEAgKEgOPyD7m01yF9zloEmQLCZ7dhWX32yIZ
	jQ/78VQ395N0xk0Q5m4fITU+pe/IUyBXuStQVik9CbuJTFyfDzb7JkTRuQc7goSAF8W4
	nH/PbZqaT3WP4pQ4Wxa2DljYvbzNPO/uTAYEnX7CReo6PzWgNtrHe2jeJ4nL09tSS5Zu
	ZOJ2lna++sx+w38yBd5ph4h4cjaLz8y7FsbbKQ3mR6PwBQ1tfhVgXEF9HO2vKVwv3t0k
	77HqZBJwK6BcuDGzg01GTsi6vdfXVXIXtW/alLysdVtQgtY66r6ThUBl56A/65NuyTHC
	Q9cQ==
X-Gm-Message-State: APjAAAUTCpleKAOzgh5TJpwiLBpLT7fyFoR7j7xJaI7pWHmQ2vDUBg7X
	EGk2f6QQLn0MPsDQU9dOTWwPTuTulL4=
X-Google-Smtp-Source: APXvYqx2l4VLYx/3ehx7i5N26yGrcIw2E9eg/xMi4RaN1nUsR1HG/xiMU9GLMxYdicGGyjG87lZDgQ==
X-Received: by 2002:a05:600c:218d:: with SMTP id
	e13mr9893399wme.29.1562935770550; 
	Fri, 12 Jul 2019 05:49:30 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l8sm14806256wrg.40.2019.07.12.05.49.28
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 12 Jul 2019 05:49:29 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Jul 2019 13:49:25 +0100
Message-Id: <20190712124926.32150-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] Revert "sysstat: use service file from source codes"
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
X-List-Received-Date: Fri, 12 Jul 2019 12:49:30 -0000
Content-Transfer-Encoding: 8bit

This doesn't actually work as the unit file is only installed if cron support is
enabled.

This reverts commit 721f09d4897425c7131470bd756eee1b90937feb.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/sysstat/sysstat.inc            |  8 ++++++--
 .../recipes-extended/sysstat/sysstat/sysstat.service | 12 ++++++++++++
 2 files changed, 18 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/sysstat.service

diff --git a/meta/recipes-extended/sysstat/sysstat.inc b/meta/recipes-extended/sysstat/sysstat.inc
index 9085fcfe744..4e297216660 100644
--- a/meta/recipes-extended/sysstat/sysstat.inc
+++ b/meta/recipes-extended/sysstat/sysstat.inc
@@ -6,6 +6,7 @@ SECTION = "console/utils"
 
 SRC_URI = "http://pagesperso-orange.fr/sebastien.godard/sysstat-${PV}.tar.xz \
            file://99_sysstat \
+           file://sysstat.service \
           "
 
 UPSTREAM_CHECK_URI = "http://sebastien.godard.pagesperso-orange.fr/download.html"
@@ -16,10 +17,9 @@ DEPENDS += "base-passwd"
 # autotools-brokensep as this package doesn't use automake
 inherit autotools-brokensep gettext systemd upstream-version-is-even
 
-PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)}"
+PACKAGECONFIG ??= ""
 PACKAGECONFIG[lm-sensors] = "--enable-sensors,--disable-sensors,lmsensors,lmsensors-libsensors"
 PACKAGECONFIG[cron] = "--enable-install-cron --enable-copy-only,--disable-install-cron --disable-copy-only"
-PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_system_unitdir}"
 
 EXTRA_OECONF += "--disable-stripping"
 
@@ -45,6 +45,10 @@ do_install() {
 	        echo "d ${localstatedir}/log/sa - - - -" \
 		     > ${D}${sysconfdir}/tmpfiles.d/sysstat.conf
 	fi
+
+	install -d ${D}${systemd_unitdir}/system
+	install -m 0644 ${WORKDIR}/sysstat.service ${D}${systemd_unitdir}/system
+	sed -i -e 's#@LIBDIR@#${libdir}#g' ${D}${systemd_unitdir}/system/sysstat.service
 }
 
 pkg_postinst_${PN} () {
diff --git a/meta/recipes-extended/sysstat/sysstat/sysstat.service b/meta/recipes-extended/sysstat/sysstat/sysstat.service
new file mode 100644
index 00000000000..aff07109f54
--- /dev/null
+++ b/meta/recipes-extended/sysstat/sysstat/sysstat.service
@@ -0,0 +1,12 @@
+[Unit]
+Description=Resets System Activity Logs
+
+[Service]
+Type=oneshot
+RemainAfterExit=yes
+User=root
+ExecStart=@LIBDIR@/sa/sa1 --boot
+
+[Install]
+WantedBy=multi-user.target
+
-- 
2.20.1


