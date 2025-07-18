Return-Path: <Pascal.Weisser.ext@karlstorz.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFA66C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 09:15:51 +0000 (UTC)
Received: from mx07-0040c702.pphosted.com (mx07-0040c702.pphosted.com [205.220.184.135])
 by mx.groups.io with SMTP id smtpd.web11.16787.1752830149537294568
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jul 2025 02:15:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@karlstorz.com header.s=S-DKIM-20210427 header.b=emfG9G5i;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: karlstorz.com, ip: 205.220.184.135, mailfrom: pascal.weisser.ext@karlstorz.com)
Received: from pps.filterd (m0267679.ppops.net [127.0.0.1])
	by mx07-0040c702.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I3eXSr004898
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=karlstorz.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	S-DKIM-20210427; bh=kE60qug6X7f0xHFZ/Mo+AJUuPvlRQgGyuTypo5V8vVE=; b=
	emfG9G5iRNs4E/oIRvZNIwMgLzt3xm1pSQkC4JEZtQ3lyi71gipfpuTZhxpzRbIl
	yA3R9NVu4qqp3z/Lak5g1+fkTvq5rBkNkn6Om2x083goYWl+T1O4qi+qmyjfy+PV
	4hXODMyEF2QiEEBxHrdk+KdXAiewTBK4OMTSduAdcWcjuj9XrDv0Il5yAOd1KbVp
	lZTB/4H5YImnS2q3hiNui5lhtj9iydtiDl/k7jS/yyN5u4aeIbpZ0ZIH+zqf99uZ
	DoJPsdfjyVjNPRDm9qDYUobu4Hiz8GvXoKLN2/Dm0mks4P72w5oEU/6dEuyEgDoO
	vepuqUlxeX1j/xITaLCn6g==
Received: from tut-ex22-pv.kstg.corp (62-134-76-232.business.static.de.bt.net [62.134.76.232] (may be forged))
	by mx07-0040c702.pphosted.com (PPS) with ESMTPS id 47xjve679x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:15:47 +0000 (GMT)
Received: from TUT-EX23-PV.KSTG.corp (10.0.10.227) by TUT-EX22-PV.KSTG.corp
 (10.0.10.226) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.27; Fri, 18 Jul
 2025 11:15:47 +0200
Received: from tutn-bpfb5m3.fritz.box (10.0.10.41) by
 InternalSMTPRelay.KSTG.corp (10.0.10.227) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Fri, 18 Jul 2025 11:15:46 +0200
From: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
To: <openembedded-core@lists.openembedded.org>
CC: "Weisser, Pascal" <pascal.weisser.ext@karlstorz.com>
Subject: [PATCH 1/1] dbus: add traditional-activation PACKAGECONFIG
Date: Fri, 18 Jul 2025 11:15:18 +0200
Message-ID: <20250718091518.1608493-2-pascal.weisser.ext@karlstorz.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718091518.1608493-1-pascal.weisser.ext@karlstorz.com>
References: <20250718091518.1608493-1-pascal.weisser.ext@karlstorz.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX1ExHAN2pvB5N
 JrijthM/64nYXHDxRLGmzNOXFFAcMjRPrZMaiBWITP9u89+m2QzqTchjZZmsXsnFz9jpGWYYRAB
 bW7T//tnbKcc1LyIckfq0tsAdr5Cslt/KuuLlKsIn0FKdlcpHBYTzN0D5a/7vWnW7vKuSE0gHTZ
 AefYKkWKBXr5a9gsVjkky+TkEzimKLshckQDVJ1d4yk3iLH9Znpp3rTy/nHm9j/5juAuDVvWtf9
 4VDg8yPyaeUlUHLJ57tct0kUyu6Em4UK6DY4pwd0F7wvjl67HdrOLXVvlgMwGMdxp+TvF18qmpp
 enz212H+WWs1GbDzL1FD4Esy26Cu4NYep9zCxabZQbSs0OA6wFh2H1hruM+HQOIyuShM4Mi5a2i
 Kwmo7IO6ThyIPLgt5z6J5AntQelCYr3ifKdUASV6JiWFikE0ZGb15ddot4rSPyeQbVT0hp+m
X-Authority-Analysis: v=2.4 cv=NNTV+16g c=1 sm=1 tr=0 ts=687a10c3 cx=c_pps
 a=OToaj9FDvIz41JSycRbD4A==:117 a=OToaj9FDvIz41JSycRbD4A==:17
 a=Wb1JkmetP80A:10 a=n9SCklZpAAAA:8 a=lDFqSETRp1EwuGCTXPQA:9
 a=MDYma9B3dblYkEs0OMj2:22
X-Proofpoint-GUID: H7SC5gARB_lEhIpCDuAGfrd6l8gBZ2YW
X-Proofpoint-ORIG-GUID: H7SC5gARB_lEhIpCDuAGfrd6l8gBZ2YW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 09:15:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220591

Add traditional-activation PACKAGECONFIG to DBus recipe in order to allow
users to enable or disable that DBus feature.

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


