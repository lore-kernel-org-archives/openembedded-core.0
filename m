Return-Path: <shohei.maruyama@cybertrust.co.jp>
Received: from JPN01-OS2-obe.outbound.protection.outlook.com
	(mail-eopbgr1410099.outbound.protection.outlook.com [40.107.141.99])
	by mail.openembedded.org (Postfix) with ESMTP id E56B97CE5E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 12:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=nybi3HdvCBokRPAApcCP1Rfcs5RrUhaAH8wkvm2UBmc0/QjqckHkoQp5pp+doJ2LIxf9I+/xazuAo1Tnt9cxNYoD3WgFPobGxkDOvbomO0Ulj1Idey7Tv3JmfPNVr/cUu/xIlbTiQ+hmnhEQJzZ4mtEj7Pe4YU1mkjpnioBSe5XDZStvhAQurCNvzcc0tXYFSNXqrrlFkl9p0SIE5qF8FIXKVb88+Bg+JA6SR/SquZg7pjJeWIauOI0wTF5n50JVPDay7jHA9V8w5mMjUKNmL2VD0EIFj6hGsBrF2vu/YeR2/Vbp77mfSpcqefRbpkyiMDo6sfgCDg5VJFVXO1CFTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lwtiamu8/NjzS4pnxSl2RJjC4j8vFiPSBsngcPwLbhg=;
	b=ROjReG5UZ9ji0aVWNGXMqZjg9gIdDb9dVzgRHn4qB7fbP7mWYa2H4Z85kw0yfI060iRTpbNwYo/LKjS2mGLZrBOX/j3fToJOIfj+pxTEPPo/eMDUjBOLU+gG1cwLPQSi73a5BUzUwaY9jag3xq7iS605ffu86buNO0oKsL6O1NYGsOdJ4Cxhwkcqf0R+G+gnl4ALX9CK2eWZPqFP3Xh39dD4oFdKwUAM9WFfPioyXHB+EE8QrNP0+s3WyMFc3aEjUaBR6MsELVwH/1fIhdL2ITrtCzjc5KrWdqAh1DDR3+wksZXjR3MYuxPR+ybS49Xh+mU7Ll7uaQsknlk93+yq/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=cybertrust.co.jp; dmarc=pass action=none
	header.from=cybertrust.co.jp; dkim=pass header.d=cybertrust.co.jp;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intra01.onmicrosoft.com; s=selector1-intra01-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lwtiamu8/NjzS4pnxSl2RJjC4j8vFiPSBsngcPwLbhg=;
	b=mPV4dHg4QsXhb5QenUp2uf12FGpkLbn8ZlITEYG1RqLaZoZNV7qcZuNLPH6NsZ/hjnaghflFh0/+4SUFCZOpjggQtf0bzIqgvhK0QbF7TRtS/hD1WfmmsEzbJ4/jKLHCj9N1VA7/F4UPMT2QvVxQE4idNV0bCSCvohUXWiGxHCI=
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com (52.134.253.73) by
	OSBPR01MB2262.jpnprd01.prod.outlook.com (52.134.240.15) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2538.18; Thu, 19 Dec 2019 12:26:27 +0000
Received: from OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d]) by
	OSBPR01MB2616.jpnprd01.prod.outlook.com
	([fe80::908d:9cce:8d6d:628d%7]) with mapi id 15.20.2559.015;
	Thu, 19 Dec 2019 12:26:27 +0000
From: <shohei.maruyama@cybertrust.co.jp>
To: <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH][warrior] qemu: Add PACKAGECONFIG for glusterfs
Thread-Index: AQHVtmeJzDrf1eSom0SSd5WaJq9mrw==
Date: Thu, 19 Dec 2019 12:26:27 +0000
Message-ID: <20191219122627.85103-1-shohei.maruyama@cybertrust.co.jp>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: TY2PR02CA0045.apcprd02.prod.outlook.com
	(2603:1096:404:a6::33) To OSBPR01MB2616.jpnprd01.prod.outlook.com
	(2603:1096:604:17::9)
x-mailer: git-send-email 2.24.1
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=shohei.maruyama@cybertrust.co.jp; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [219.123.27.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5d0d1445-1def-49e2-f8ff-08d7847eab6b
x-ms-traffictypediagnostic: OSBPR01MB2262:|OSBPR01MB2262:
x-ld-processed: 72cc4624-32b4-4dab-b80a-8563e559bd82,ExtFwd
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <OSBPR01MB226274C0381FA94AEE4B6094D6520@OSBPR01MB2262.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:304;
x-forefront-prvs: 0256C18696
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39840400004)(396003)(366004)(346002)(136003)(376002)(189003)(199004)(107886003)(5660300002)(316002)(86362001)(6486002)(26005)(1076003)(4326008)(52116002)(2616005)(66946007)(6916009)(64756008)(66476007)(4744005)(66556008)(186003)(2906002)(81156014)(478600001)(8676002)(6512007)(66446008)(36756003)(6506007)(81166006)(8936002)(71200400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:OSBPR01MB2262;
	H:OSBPR01MB2616.jpnprd01.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: cybertrust.co.jp does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JRwZY7uxJU7vHyAU/6owmEmXgdLyuuZappXajoH/sFvaP+axVwP7yDloVt6N+sM6dkX+Eha37LZgjBgmiMhKhfHJe7tlX6ChygzKzl1OJ5EZaF5aHauaPt0geJS4b+DHTDMi+u5f5Ty7H3yqtUwOlU741aZ30O6TfysMSlV4p0ozBvdopFeJLWWYAblWqFryFgMjW+1O57aD1N1gZ2BCjDWs48U70tkGdbr5ynlmR9DIeZoBM8MZcrACs9e1Zh6L6FmfCuWg6E4RKZRbySPsXx/ZF3C0ChqPZb5G2Vc+ylzhp/VirlvOPbd7gYo7egTaB/NaZKvLAzSy6DJ4Crqm+kQaoajCsNwQ+QqO1r8ErRDw4JzX1cW4a3jd+fNyZc0lyXxx7gL6kEHv624AOoe8xFEBFBcFu7hGxVw7eMHcLCyhd1u/pETJ5yqEvWHiTDCZ
MIME-Version: 1.0
X-OriginatorOrg: cybertrust.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0d1445-1def-49e2-f8ff-08d7847eab6b
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Dec 2019 12:26:27.4719 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 72cc4624-32b4-4dab-b80a-8563e559bd82
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XGRVl/p9eda9Wrv4XOQOK3vTORr8b4jZQHTo3u00fQ2rEgwtTTeh49PQCSmM86iWwf3z/d3aLSiWk0DaKcrzstG/dri8SuMdVkY2YEUAbmT+N1ApTdd0b1CYQgJpA7xd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2262
Subject: [PATCH][warrior] qemu: Add PACKAGECONFIG for glusterfs
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
X-List-Received-Date: Thu, 19 Dec 2019 12:26:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

This commit adds PACKAGECONFIG for glusterfs. glusterfs is not required f-
or runqemu, so it should be optional to reduce build time.

Signed-off-by: Shohei Maruyama <shohei.maruyama@cybertrust.co.jp>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc
index 202134b3d8..e917a96241 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -160,5 +160,6 @@ PACKAGECONFIG[virglrenderer] =3D "--enable-virglrendere=
r,--disable-virglrenderer,v
 PACKAGECONFIG[spice] =3D "--enable-spice,--disable-spice,spice"
 # usbredir will be in meta-networking layer
 PACKAGECONFIG[usb-redir] =3D "--enable-usb-redir,--disable-usb-redir,usbre=
dir"
+PACKAGECONFIG[glusterfs] =3D "--enable-glusterfs,--disable-glusterfs"
=20
 INSANE_SKIP_${PN} =3D "arch"
--=20
2.24.1


