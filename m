Return-Path: <pespin.shar@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id A4123731DD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 19:15:20 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id l68so11566868wml.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 13 Mar 2016 12:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=kjnxqcPktre6mGJSYgEbL1bgQIs/fvpVy+plkBps3y4=;
	b=MzhBqe9rEwGOX4EVqIMQW0CDlvD6uTwXVGteMnffv4kh55XSb/vHge6ziPmNxBgQIp
	7fFTBda9oz7DRZBjqkl6cfZ9KAry0fdlloJuqDo9pa3pDMowxO5HqtmDn0wKYtoCSBEU
	AvM8vGba5xIrehBloW4Fj0g7NPc9Ut9e+xdxb+mzKpT2480+ZzJCHer6VGkcmY4AknbQ
	E/B2UbnBP5foyw33Zh0Hh+c/yFldnqEc+urSyIjYTPg+RtrANzAh+pMlVX4tdl1L6993
	Q7q+ZhpHMJyx7ZREtPxi1pCIHU1UMCywd5W5EXz0V9MwA1C+cIzr0y2n6bdGRXBwb97/
	Yfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=kjnxqcPktre6mGJSYgEbL1bgQIs/fvpVy+plkBps3y4=;
	b=bZhAfTASCXeGpKekVAPQ8CXgV5uiNzISqk9FJFVSr3LNAJIPvbcW7E9ZBGOFpbTaR9
	086B+8Y4oHfHOfYYqmUuv1fQ2i7k2Bq4hSb+vEnL5comBFE/xgKxYDEDfHKqUywW8Wtf
	U0gJ6tO13UZkdiNAZQbi0ImJggpo1M9cmmkcUXIrz34nP8Oyl/ei51SPTOxyN+JPFsSW
	kegh/w6yRbc2i+uOdEWKItYJ+pXujTGjrXx8bZa+SnMtRaEQcxeROGVWutV1hdJI4MIo
	VUMpIloC3KJ+xgosXrhRLvJ7Vs8OodwnhhO4ZxdK+d4APOBPPKLk9rv14IY3QN7EK/Ru
	qkGw==
X-Gm-Message-State: AD7BkJL/hCcdd6QwUjI7g6xvAZDuSm3CKk1GcxYXRs/f4bqeK6cYMZTUYzbVhIcjr7UhuA==
X-Received: by 10.194.92.68 with SMTP id ck4mr20133700wjb.144.1457896521269;
	Sun, 13 Mar 2016 12:15:21 -0700 (PDT)
Received: from localhost.localdomain ([2a02:1811:c1f:3300:9248:9aff:fe94:7ff1])
	by smtp.gmail.com with ESMTPSA id
	n66sm12851410wmg.20.2016.03.13.12.15.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 13 Mar 2016 12:15:20 -0700 (PDT)
From: Pau Espin Pedrol <pespin.shar@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 13 Mar 2016 20:13:34 +0100
Message-Id: <d213a5299c588fa5cb9b5229c385d1b60eb166b1.1457896224.git.pespin.shar@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
In-Reply-To: <cover.1457896224.git.pespin.shar@gmail.com>
References: <cover.1457896224.git.pespin.shar@gmail.com>
Subject: [PATCH 36/42] bluez5: Fix usage of systemd unitdir vars
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
X-List-Received-Date: Sun, 13 Mar 2016 19:15:20 -0000

Signed-off-by: Pau Espin Pedrol <pespin.shar@gmail.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index ff2bdcb..504c320 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -69,14 +69,14 @@ ALLOW_EMPTY_libasound-module-bluez = "1"
 PACKAGES =+ "libasound-module-bluez ${PN}-testtools ${PN}-obex ${PN}-noinst-tools"
 
 FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
-FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_unitdir}/ ${datadir}/dbus-1"
+FILES_${PN} += "${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${nonarch_base_libdir}/udev/ ${systemd_system_unitdir}/ ${datadir}/dbus-1"
 FILES_${PN}-dev += "\
   ${libdir}/bluetooth/plugins/*.la \
   ${libdir}/alsa-lib/*.la \
 "
 
 FILES_${PN}-obex = "${libexecdir}/bluetooth/obexd \
-                    ${exec_prefix}/lib/systemd/user/obex.service \
+                    ${systemd_user_unitdir}/obex.service \
                     ${datadir}/dbus-1/services/org.bluez.obex.service \
                    "
 SYSTEMD_SERVICE_${PN}-obex = "obex.service"
-- 
2.7.1


