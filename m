Return-Path: <prvs=9057d3638=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 82CB57C069
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 00:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1546993158; x=1578529158;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=XhGhvz0KE8fxj+obk4boTZOxqNRSuGt1IXHgZSvvMvU=;
	b=ZeT6ZRvCjc1IsIq6csz1KT+pH0kqqN3NNQ01ijkf8l/hYHB0E8KsDFay
	nzxZ54jFzm+PY4WxQbwYHl5YoNwKp1xsxrpU3Z0dCrHCLBXH2FCbPAvmR
	FDtUaov00fnKRE5ZD+QyLQDX2Pr93Ct1K4qrdDTUaUJxBYZaF/u5okHXD
	hL0nN3EPrQDGim/RTgAuWe+JkIqWapxJYFDkEC/jZHZP1A8+PTeQ2FcDG
	+UlTYxLPGPVG86w3Jo5Jx3XiTXhqUpgot7S1hKNRDMdfW+Ji12yoqg3hd
	lHG+WMNXJwSgnWX1oqp+e3NVfj/iMuKeHEQPVUd5pGFqNX7jsPDgGIRq1 g==;
X-IronPort-AV: E=Sophos;i="5.56,455,1539619200"; d="scan'208";a="100059097"
Received: from mail-sn1nam01lp2059.outbound.protection.outlook.com (HELO
	NAM01-SN1-obe.outbound.protection.outlook.com) ([104.47.32.59])
	by ob1.hgst.iphmx.com with ESMTP; 09 Jan 2019 08:09:48 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=XhGhvz0KE8fxj+obk4boTZOxqNRSuGt1IXHgZSvvMvU=;
	b=R0B5ay3G/ZB7XvvbXphWBM8lUVtrvEJcHzQ3FqJDnpAanQbHnsMVZnqtTQLvJLq4CJ7RYw53WgU/+ffLm3GLEwcjYpMqyjYENOotTy0h5Kw/jUEDbeedjk/UnRtpPNj4NRK3NFCUU4lYDsA4pdKwiWRHGrO1RZQK5E9VYkn8H0g=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0465.namprd04.prod.outlook.com (10.173.48.146) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.7; Wed, 9 Jan 2019 00:09:46 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::10e5:e75d:3272:2d33%6]) with mapi id 15.20.1495.011;
	Wed, 9 Jan 2019 00:09:46 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] libinput: Enable gui PACKAGECONFIG by default
Thread-Index: AQHUp6+gIWUwlM73X0qixgVNduiI1w==
Date: Wed, 9 Jan 2019 00:09:46 +0000
Message-ID: <20190109000938.7899-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.19.1
x-clientproxiedby: BYAPR05CA0101.namprd05.prod.outlook.com
	(2603:10b6:a03:e0::42) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; MWHPR04MB0465;
	6:i3bpP6WFHWNIeAgoIaMy70joxuhCWW/0wTFbev+GCm1XIUb4iIp5ayEknYHyORnjYvi9y2gEfSlbwTBvLxGdPyIwhSlhBMwqDwiS4nR/toIK0ZGk02oYFi42ux8ptAbAs01tiw+wfs4wP+iq/jemHv9gX3yX578W+JI/LFqyJS2MdKDlpQBAHFanBUz1UV/RYJi4tHzb0P4W64EJdOvwzRPmlLuELeT3n24WsIHrRvfuu+BD9IhD+ghBHtyDBRGwK1PlvsoCkFKLOdQsUauX4+TzVXBJCa9p6UU993xdOve1PXrc6Uz729CwXTjbz0ax3Yw9/ztadXKnO6KhKaNLMw1EZqcjbeIFtN523p+cfLPHnJ/SNbFKJ8KOEjyL6dvxzeWFnnKli2QlzXOEczVfc5PUnE3mhLG49c30dn0Y8pYuVufdhgxBDdHRF/+URBq8m+hERBvmeX7YwejuQxjezA==;
	5:gamRv5uttZqRC8UAskStgWUmg4rVticqs72PBNAeLh22KKqeOz+z5eb6pTl4BGUJN+eMAfvCqreqw4/u2c2cjqTfWTkzUG4eoDt67wdZUq3WdyKR3a9JT/zYK+aKdgy17aU1f4OEyLATZixmLJO5mG1ZDgcjtQitq2QxHDLxy0SVOglYRPQS0VgMf+F/2hqZcDxWIclnsgUrUKyGs2lrqg==;
	7:ym1eHCBIrFSMr+cZbky0EY1W6bNIc1DjYJxRtdCXYJiw53f/kaUezA6vNSGRMnxacUg8meYTarSjAgyxmMtrfD797KrAC5zHNQIeljh5qZ/RdtY37bCdnFNE0Nh5yr7b5KZQr5yshmdkkyoo9JHGyA==
x-ms-office365-filtering-correlation-id: 61de0e6a-66dd-4e63-d16b-08d675c6c333
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0465; 
x-ms-traffictypediagnostic: MWHPR04MB0465:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <MWHPR04MB0465E5B3429D9BE58D4E9313908B0@MWHPR04MB0465.namprd04.prod.outlook.com>
x-forefront-prvs: 0912297777
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(396003)(346002)(366004)(376002)(136003)(189003)(199004)(81166006)(81156014)(8936002)(8676002)(3846002)(72206003)(6116002)(5660300001)(478600001)(50226002)(186003)(86362001)(6916009)(486006)(305945005)(71200400001)(71190400001)(66066001)(7736002)(14444005)(44832011)(256004)(14454004)(25786009)(68736007)(6486002)(54906003)(6506007)(386003)(1076003)(2906002)(476003)(6512007)(2616005)(316002)(102836004)(2501003)(6436002)(53936002)(36756003)(2351001)(4326008)(105586002)(106356001)(26005)(97736004)(39060400002)(5640700003)(52116002)(99286004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0465;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +UQ+Eu8BoDWKhRg11odjtmKaBeY2EmFig/HfWl5nWqWWQmI7awYqUxSouQZ3Rzmp5v7RwwYgnMchAglGbiMIv66FvEXKrzTZoyiev7zIPZkMsupl7o0DW68+YlrzM7fOqf0d0umQSfywvtEzOHdGwF+qhtFJtG6+XfkYvyFuBZOnRXNq0tOyhW9VpmbsS6s0JWtrGKbb4u09hS5Lzk7i3xGhIWksPMwU7ZH3A3qNr8l2TCX5M7T76PB4tZlsaHe2Z9ybScKhvrCSkR+WTvQ2wXCQdo4XAJF3Vr+WW0kjyzr/m3z8v3R0Z6YY8LC1mdzC
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61de0e6a-66dd-4e63-d16b-08d675c6c333
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2019 00:09:46.1556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0465
Subject: [PATCH] libinput: Enable gui PACKAGECONFIG by default
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
X-List-Received-Date: Wed, 09 Jan 2019 00:19:16 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-graphics/wayland/libinput_1.12.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/libinput_1.12.3.bb b/meta/recipe=
s-graphics/wayland/libinput_1.12.3.bb
index 3d1ab59309..d3f34c5040 100644
--- a/meta/recipes-graphics/wayland/libinput_1.12.3.bb
+++ b/meta/recipes-graphics/wayland/libinput_1.12.3.bb
@@ -15,7 +15,7 @@ SRC_URI[sha256sum] =3D "f266ff861a2e7a97e1402c4345e3547b9=
00efde68adbd40e56403e2617
 UPSTREAM_CHECK_REGEX =3D "libinput-(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
 inherit meson pkgconfig lib_package
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "gui"
 PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue,-Dlibwacom=3Dfalse,libwacom=
"
 PACKAGECONFIG[gui] =3D "-Ddebug-gui=3Dtrue,-Ddebug-gui=3Dfalse,cairo gtk+3=
"
=20
--=20
2.19.1


