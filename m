Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C2BC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 11:33:13 +0000 (UTC)
Received: from mx08-0040c702.pphosted.com (mx08-0040c702.pphosted.com [185.183.31.154])
 by mx.groups.io with SMTP id smtpd.web10.10374.1753183988603490613
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 04:33:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=lDMl4aV1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 185.183.31.154, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267678.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M9X2kE003531
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 11:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=tuuZ2E936kxnm1AQn1QX+kCJJeQXMletXtIaGUYbHZE=; b=
	lDMl4aV1QLLLCV06C+9ZW2R8Ykk2C/5eeAA3AA7XpXPXD3PhwMG67ql4yZ0lx2q9
	RPeqFA8fcEYatleLy2Gv8491l59vGcmbU7Jsy+qp3DscWK3UTI1rEg2gIi4/iiLI
	8I1nzk765MXr4ZbyhhrKlBV0Ma4ylqHI8YXTiT5DoifawQSd9mQs08KtG+rlB8Zz
	L4o8uU2z0os+qec6PgDDr+Z8hla3jiHD1Swje00pgTc7XOxQAgzLNTjLWCqXzWsZ
	dFgSV4x5Te4F1Q/Qd+fEc0pjPcrVzIzkCnDkmtxyMuOS1Q8G9NIYOBYnLbqCaNxa
	pO9FRFuC0Dy+InvZTvG79g==
Received: from tut-ex23-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232])
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 48049gg3tw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 11:33:06 +0000 (GMT)
Received: from TUT-EX22-PV.KSTG.corp (10.0.10.226) by TUT-EX23-PV.KSTG.corp
 (10.0.10.227) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Tue, 22 Jul
 2025 13:33:05 +0200
Received: from tutn-bpfb5m3.kstg.corp (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.226) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Tue, 22 Jul 2025 13:33:05 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH v2 1/1] dbus: add traditional-activation PACKAGECONFIG
Date: Tue, 22 Jul 2025 13:32:50 +0200
Message-ID: <20250722113250.255487-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722113250.255487-1-pascal.weisser.ext@karlstorz.com>
References: <20250722113250.255487-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA5NCBTYWx0ZWRfXwGBjAslwYi6I
 7zxdgNknJ2u54YTq2sucJATz9ThnUwA3m+2Lwg/03/XrG2z3X5duy7PncGx7srlk+EX01nNBkBp
 cG1th6z5vZ/QiwoWRlWPvxV7r/gHiIbqwQSeHLO9EWhjptQcWbUQtfwwbrSXT+gqNObsvnR/hEy
 N783eDAL63FvopQXlcdQfRKJ1aD/u5iGXWjJAx4S8FO2KCoDaE1dKYhENzpI7XYCGFI0lqHiEXH
 tNwRFELwiDEuH9yLA8aaFF0zh8ZDT1OrX5EUJslb71/nuBIAxDf7Z3upbDW60agWIIjFd5V10lS
 6HPYipK8QqZDr0GGV/3zyNvYb8BAESCfqIu5HB8DGl5zhmgAvAGToAe1U9veokf4ge/rPgCjXdd
 +SpKpo0o2c3GEkaMhwGOctqnI1GAfH0S0hjv26Q7dv6OjkOLbHJvKhIJ7ARCSTyDVxjCZuFj
X-Proofpoint-GUID: VkL-bKpZbaUsdj5BYDyUFS5Qnfb9SwRG
X-Proofpoint-ORIG-GUID: VkL-bKpZbaUsdj5BYDyUFS5Qnfb9SwRG
X-Authority-Analysis: v=2.4 cv=Xe2JzJ55 c=1 sm=1 tr=0 ts=687f76f2 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=n9SCklZpAAAA:8 a=u3Q4C_SeWTV_V2crkXoA:9
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 11:33:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220735

Add traditional-activation PACKAGECONFIG to DBus recipe in order to allow
users to enable or disable traditional DBus service activation.

DBus service activation refers to automatically starting an application
when a DBus message is sent to a service provided by that application.
Traditionally, this is done by the DBus-daemon, thus, the term traditional
here. On systems using systemd, systemd can do this, instead.

On some systems it might be of interest to disable the traditional service
activation in order to ensure that services are always started via systemd.

Per default, traditional service activation is enabled for DBus. Thus, the
traditional-activation PACKAGECONFIG is added to the default PACKAGECONFIG.
Otherwise, we might introduce a breaking change here.

The binary dbus-daemon-launch-helper isn't created in case DBus is built
with traditional service activation disabled, so we change its attributes
only when traditional service activation is turned on.

Signed-off-by: Weisser, Pascal <pascal.weisser.ext@karlstorz.com>
---
 meta/recipes-core/dbus/dbus_1.16.2.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/dbus/dbus_1.16.2.bb b/meta/recipes-core/dbus/dbus_1.16.2.bb
index 65f7028b4f..aabc4c3efb 100644
--- a/meta/recipes-core/dbus/dbus_1.16.2.bb
+++ b/meta/recipes-core/dbus/dbus_1.16.2.bb
@@ -28,7 +28,7 @@ EXTRA_OEMESON = "-Dxml_docs=disabled \
                 "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11', d)} \
-                   user-session \
+                   traditional-activation user-session \
                   ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                   "
 PACKAGECONFIG:class-native = ""
@@ -36,6 +36,7 @@ PACKAGECONFIG:class-nativesdk = ""
 
 PACKAGECONFIG[systemd] = "-Dsystemd=enabled -Dsystemd_system_unitdir=${systemd_system_unitdir},-Dsystemd=disabled,systemd"
 PACKAGECONFIG[x11] = "-Dx11_autolaunch=enabled,-Dx11_autolaunch=disabled, virtual/libx11 libsm"
+PACKAGECONFIG[traditional-activation] = "-Dtraditional_activation=true,-Dtraditional_activation=false"
 PACKAGECONFIG[user-session] = "-Duser_session=true -Dsystemd_user_unitdir=${systemd_user_unitdir},-Duser_session=false"
 PACKAGECONFIG[verbose-mode] = "-Dverbose_mode=true,-Dverbose_mode=false,,"
 PACKAGECONFIG[audit] = "-Dlibaudit=enabled,-Dlibaudit=disabled,audit"
@@ -152,8 +153,11 @@ do_install:append:class-target() {
 
 	chown messagebus:messagebus ${D}${localstatedir}/lib/dbus
 
-	chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
-	chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
+	if [ "${@bb.utils.contains('PACKAGECONFIG', 'traditional-activation', '1', '0', d)}" = "1" ]
+	then
+		chown root:messagebus ${D}${libexecdir}/dbus-daemon-launch-helper
+		chmod 4755 ${D}${libexecdir}/dbus-daemon-launch-helper
+	fi
 
 	# Remove Red Hat initscript
 	rm -rf ${D}${sysconfdir}/rc.d
-- 
2.50.1


