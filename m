Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 42E3C7827A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 13:37:14 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id 7so127988814wmo.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 06:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=5dabaFz0ygt1TRmRpI7uEWNeCXa6mX/t+JheIr19EW0=;
	b=gVUJkcq3DoNN0Zesn3VzAsFXy5r45eARCN6GyarlYD8ca/iBkTJcOnxZl/2NTYiL+u
	I0HEyYnV6UpqSHuthDHVBD1ZZmdfCnNIS5sigu0yhFTSnTMADvsC8kzU0SMjvoepa6Xs
	Yl2GF2rFkq41XY/wFIzKmANS8ki5fm/ctdd05eW2qDuE+c708M3LCFp16TX6MCTYuxuw
	SCGJkvIrMOX4sms1RShFgq58dlkdjzheEVuwYgXYuwypc5/THivFyTlOwGHlyLeNoIkl
	RNRbOktOsQ3t8rkaDjBlARmWA8y7LQNsLWINv2dGFFlt7wz/oM2eBX/KY5j4M3FrYvhh
	Vxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=5dabaFz0ygt1TRmRpI7uEWNeCXa6mX/t+JheIr19EW0=;
	b=QKzcqecF7dn6PYsMZwSMNDRQL0yBFjzS1ei2hLDUjlpmBO8+xckDauKcY3udnnGxri
	BksfXkEUFyyFuzbXIOyjgre+QD4tXeUke1rj7AZn2rLMc6TpINUemJmSCHZXnHFrX2C9
	1v58O0s6EJk++bJTHTCl4NyDPoy/Bqu4FdqTOLA4N2qsE+ThekTDJSkpSlVZ82Wz+7Xx
	Or7KBTlgQpjWTBg5ZaxsZNsNCDEHnjUpfc6C5U/df43d+AE/hbVecqolFCOAU9PLRrFm
	aXCtnpykhmgD6Fq1i/P+ajcjhAXARqpspF0zqzTIH+cCS1th3iI7/bMyd9kgFRYNchVO
	PUeQ==
X-Gm-Message-State: AODbwcCEdicHw+ygLkdRlbFiGJ4TxRspcGCqF0JwfcTWZU02Uu0Xa8XF
	D0kBuMes0MC9OxL3WzM=
X-Received: by 10.28.224.135 with SMTP id x129mr2048354wmg.45.1495805835556;
	Fri, 26 May 2017 06:37:15 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id 4sm1078185wry.31.2017.05.26.06.37.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 May 2017 06:37:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 14:37:13 +0100
Message-Id: <1495805833-413-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] gstreamer1.0-omx: delete broken m4 files
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
X-List-Received-Date: Fri, 26 May 2017 13:37:15 -0000

These m4 files need to be deleted so that the versions in the sysroot that we've
patched are used.  Specifically, building documentation fails as the gtk-doc
checks fail.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 05562b1..5d92351 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -29,10 +29,17 @@ python __anonymous () {
         d.setVar("PACKAGE_ARCH", d.getVar("MACHINE_ARCH"))
 }
 
+delete_pkg_m4_file() {
+    # Delete m4 files which we provide patched versions of but will be ignored
+    # if these exist
+	rm -f "${S}/common/m4/pkg.m4"
+	rm -f "${S}/common/m4/gtk-doc.m4"
+}
+do_configure[prefuncs] += "delete_pkg_m4_file"
+
 set_omx_core_name() {
 	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}${sysconfdir}/xdg/gstomx.conf"
 }
-
 do_install[postfuncs] += " set_omx_core_name "
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
-- 
2.8.1


