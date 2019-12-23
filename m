Return-Path: <Alexandre.Bard@netmodule.com>
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
	(mail-eopbgr30136.outbound.protection.outlook.com [40.107.3.136])
	by mail.openembedded.org (Postfix) with ESMTP id 93F2B7F823
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Dec 2019 21:13:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=V3jZoHiczSdlpD+7DMZ8aHeiV2v3CSyQtMPCAOqus3IEyet/VCTnAAZOsWVTrlBSRxRk6OlcRxmse9t9SodnY4a1HjPCyCj2QCxtJx41lrWzBzqm60sahGeGDliLZ1T2FLWNll/wRBUVu4GlcO6e3Eunv+vJw3nFTmIDDY9nGvmtp5e8laAjGgOF00JT58QimMX1+t8C8jqoD6PV4eWzdKsb6Va6tSraZdKoS3g77kxy9aP+Im3psYuyxS+pvfoUUEfwonVThZkkf74fZuUwiizhlbTvMAxmoN+8aUdG8KX2FhwPSR3Saqz7NJkhUZ6+FxrrxIL4WXKxza2lD4bqqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yWbm6iGPqg2ghrDmFzvIjOZu3da/+UQfCW9UWhYjPKo=;
	b=VaZO3qByMH6pH+x1OVCA4DAMYtvm3J4WCZpR8p/veURZKrKj+deRMnhEelL1uaNek0cWAMCowptaWgXlhK8dFhmw1vDn2OjGz0Qfzrs4wrfRqxeUAkR9SoN6sH1HHtOroXtzVfVFdZ0OkOHWY7vRCv1c7LwyvLgHi3b0IuK1gpyzGE6Nfe7oOLrIy8OCKo2S7LiWZMibELU92ZP47oVshT1V5ShFUZT/WXu1Gl3qnC9VOU3mmv3Bwv51r54cIJ7ULFpZPdGiEL1gePBVjM0elsXtX5rlnWuXk+5j5R6yoqS2oGiU79BiAcWVOU5vT2PBzcoNtfV6CjOtNwOSvFHLZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=netmodule.com; dmarc=pass action=none
	header.from=netmodule.com; dkim=pass header.d=netmodule.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=netmodule.onmicrosoft.com; s=selector2-netmodule-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=yWbm6iGPqg2ghrDmFzvIjOZu3da/+UQfCW9UWhYjPKo=;
	b=d9lmgRTcaNZiRI9hYkiTL3XHLIhEO98WuKfQBuOTBpdNtP6pjWCymp/fGi2aREpzwa9w9GEhilW/0HfBWsB4KshO4tVN6Lx16AkG5tGLhYMTibjUfn1PNxhKEhpTuloRQsctX2gdXCtdqJ11kmnaP7JRp8hHB6g4xICpcNcjj0o=
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com (20.178.81.25) by
	VI1PR06MB5328.eurprd06.prod.outlook.com (20.178.80.11) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.14; Mon, 23 Dec 2019 21:13:50 +0000
Received: from VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::8cc0:9682:e150:1792]) by
	VI1PR06MB5261.eurprd06.prod.outlook.com
	([fe80::8cc0:9682:e150:1792%6]) with mapi id 15.20.2559.017;
	Mon, 23 Dec 2019 21:13:50 +0000
From: Alexandre Bard <Alexandre.Bard@netmodule.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [meta-networking][PATCH] networkmanager: Add missing RDEPENDS to
	dnsmasq
Thread-Index: AQHVudXf6CN1PTERgkm5M4WbH3bSvA==
Date: Mon, 23 Dec 2019 21:13:50 +0000
Message-ID: <20191223211331.30855-1-alexandre.bard@netmodule.com>
Accept-Language: fr-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: ZRAP278CA0012.CHEP278.PROD.OUTLOOK.COM
	(2603:10a6:910:10::22) To VI1PR06MB5261.eurprd06.prod.outlook.com
	(2603:10a6:803:c4::25)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alexandre.Bard@netmodule.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [185.130.140.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 62e5a12f-e79b-46f3-ef1e-08d787ed01c5
x-ms-traffictypediagnostic: VI1PR06MB5328:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR06MB53289B2E957029AE5D2E51F0872E0@VI1PR06MB5328.eurprd06.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1148;
x-forefront-prvs: 0260457E99
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(136003)(39830400003)(376002)(396003)(346002)(189003)(199004)(66946007)(36756003)(26005)(64756008)(44832011)(66446008)(66476007)(66556008)(186003)(6512007)(81156014)(81166006)(6506007)(5660300002)(316002)(6916009)(6486002)(71200400001)(4326008)(52116002)(508600001)(8936002)(2616005)(8676002)(2906002)(1076003)(107886003)(86362001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR06MB5328;
	H:VI1PR06MB5261.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: netmodule.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WMB5n0TJ1X4lU+80QPT5x7cFhy4XVnLQySb6kt7yzVDZhMfT0jUscThMt2UjWtv6a5YAScEvPLkiwK7gbn9CDXxn2NxYMmzLd86jK331jOD/eLxS4wI0iQ/kyYotufP8qsfZoiYKUC1+ysquAFxtiA9Durd066OAPiJgR5jm6bZdXPIEkoePNlQCgw+hDxHqATX2T4v0hWamNtuIlJLUEz3y7jpZiLEoqT/DWujy42Af4lKF3pWch8JdKIBSMVDKYqrbE+rmKfwbjltaNc7yeQsiX/x/7vn/3ZyPZY1VCl/oBHI156W/ymbOt4x6HNAmbJzrHhAOw4ely1SAM82S4ZSbwzJvvaLnPpxA1aZLZ8kuHo0TX05oMYcxwVOGkpRUIdSQGHizVDR1km2BvFs3lHCmBqshMjE7rbuoZhV3KQxuxtwLGP0dq9JdkkWasYfh
MIME-Version: 1.0
X-OriginatorOrg: netmodule.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62e5a12f-e79b-46f3-ef1e-08d787ed01c5
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Dec 2019 21:13:50.5451 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: dcdfa962-340b-405e-be0c-5bfcc8a0841e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: r/DisO95y0ynCsIQEblyqL2+W9Yq4Tb99UU3LmCD4Pj9Q8QV8+lVWm1HAM7Lw+7wIuGdpB8Wm9nnBXLl/9vUAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB5328
Cc: Alexandre Bard <Alexandre.Bard@netmodule.com>
Subject: [meta-networking][PATCH] networkmanager: Add missing RDEPENDS to dnsmasq
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
X-List-Received-Date: Mon, 23 Dec 2019 21:13:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

---
 .../networkmanager/networkmanager_1.18.4.bb                     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkman=
ager_1.18.4.bb b/meta-networking/recipes-connectivity/networkmanager/networ=
kmanager_1.18.4.bb
index 27508c4d9..5944337b8 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.=
18.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.=
18.4.bb
@@ -73,7 +73,7 @@ PACKAGECONFIG[modemmanager] =3D "--with-modem-manager-1=
=3Dyes,--with-modem-manager-1
 PACKAGECONFIG[ppp] =3D "--enable-ppp,--disable-ppp,ppp,ppp"
 # Use full featured dhcp client instead of internal one
 PACKAGECONFIG[dhclient] =3D "--with-dhclient=3D${base_sbindir}/dhclient,,,=
dhcp-client"
-PACKAGECONFIG[dnsmasq] =3D "--with-dnsmasq=3D${bindir}/dnsmasq"
+PACKAGECONFIG[dnsmasq] =3D "--with-dnsmasq=3D${bindir}/dnsmasq,,,dnsmasq"
 PACKAGECONFIG[nss] =3D "--with-crypto=3Dnss,,nss"
 PACKAGECONFIG[glib] =3D "--with-libnm-glib,,dbus-glib-native dbus-glib"
 PACKAGECONFIG[resolvconf] =3D "--with-resolvconf=3D${base_sbindir}/resolvc=
onf,,,resolvconf"
--=20
2.20.1


