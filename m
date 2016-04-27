Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6328273204
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 11:55:22 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n129so23735419wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 04:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=8t5DcG57H5Vf5C+W8ee5pmWRj+B0elV5xyWjMeJkoKw=;
	b=jpcYfbTgUW//ktW+FXpzqbmImx0puVZZB0dsqWLcqkGpIbklRLZRqNu2xGF0qyjKut
	FhNS6c6BWfZ+1gUKgc6jEPbMmjrJZnfRYQIwS8v4VNLoaM+5BDs27TgRxdCKO8z9x0Ho
	vjYzDrTjHPZATbS9+FXVgrgph2pbdKId2YBqICBOooQDID0CFMmPJhB8kdgw7dPg7r5S
	KjRxDKlQiOT85dLK2AHquAojnb5yCd7gxRFOcJlZ7WJQQWznFPFo68Sd5+UPKkmoK0Tn
	BKhGilzdoQHqeiUa5lPhubxF/0qQIaTE7UR+AEuUNKxyc+oenu/1ZUt3Nwjh0qI1ezHD
	d3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=8t5DcG57H5Vf5C+W8ee5pmWRj+B0elV5xyWjMeJkoKw=;
	b=M8b6Y5NHla8Aq5Kej149G6ICrpT9ue+ohnJbh64k0g8DYx4zNhwsC9x2G3DAVmwf2l
	6pHZRj+dQvFhXjGagVRj4DhDHjISyks8TsC3uDR9MbF9dYyrOoRlJN5PN+vDIKINcsW8
	HRKDV/FfWTk3aEuIUmcK/yoZVoESxOVGT7yk7PbL8FEsMppy0YilBujlVTufrhI80CfD
	jP63y68mFeROQIk5dhTPPZ2J7zSFaPN93/JkAc4r4pLNsVvb7v3yxoLfDCNkgCtGrLhj
	LDSD23kXuaoPg3HxGYAhM+Uo1wflNA0aEUaBdp0qaQp7M2vJY/+pl27pbeA/8MqZkkUo
	PvUw==
X-Gm-Message-State: AOPr4FWCDSs4rtnkXCnGPKXIvTozUbTa+Kx8g+U/pNVvgUmwOx2dZWxU/ppyXKDl8Gk8ZXWg
X-Received: by 10.28.63.15 with SMTP id m15mr18503900wma.55.1461758122124;
	Wed, 27 Apr 2016 04:55:22 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	by7sm3696892wjc.18.2016.04.27.04.55.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Apr 2016 04:55:21 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Apr 2016 12:55:19 +0100
Message-Id: <1461758119-32066-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] eudev: add PACKAGECONFIG for hwdb
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
X-List-Received-Date: Wed, 27 Apr 2016 11:55:23 -0000

Some users may not want the hwdb at all, so add a PACKAGECONFIG option to
disable building it entirely.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/udev/eudev_3.1.5.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev_3.1.5.bb b/meta/recipes-core/udev/eudev_3.1.5.bb
index ea19ec4..e42630f 100644
--- a/meta/recipes-core/udev/eudev_3.1.5.bb
+++ b/meta/recipes-core/udev/eudev_3.1.5.bb
@@ -32,6 +32,9 @@ EXTRA_OECONF = " \
     --with-rootprefix= \
 "
 
+PACKAGECONFIG ??= "hwdb"
+PACKAGECONFIG[hwdb] = "--enable-hwdb,--disable-hwdb"
+
 do_install_append() {
 	install -d ${D}${sysconfdir}/init.d
 	install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/udev
@@ -104,4 +107,3 @@ pkg_postinst_eudev-hwdb () {
 pkg_prerm_eudev-hwdb () {
         rm -f $D${sysconfdir}/udev/hwdb.bin
 }
-
-- 
2.8.0.rc3


