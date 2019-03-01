Return-Path: <prvs=95684d004=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2219A7CD23
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551468761; x=1583004761;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=qNZhO7dpaL3DMzpBv8UauN///SuqP4USzSbq5VVycmE=;
	b=qPpbYWg+pfZAy8s/1/kAeywTJmtx4rhTrYwJCtDhXGX50nshUaBIYJMo
	UgGTRv7T6L6nC03LUu9GJ2O0F+S3NUXXKvlbWqqZk/G4ArI/L1YxogP+3
	JcF9+/QfbIS9CgxX8BNIWDW6+BT3re0/OfXSubUNOEt5f4vHKJGf2KgJJ
	uwEW/+PkrYJCSHGlvh0OzgbrB8Sn5ZuL8SC9BZkvuaFTE0Bpbclp8fO67
	1Vct8ZE2Wrdep2YC3WDEaWZtGzVvp1qstnFDFH014JgroAensE5h0WF/9
	0jMN8Az4FmjhdgRMSh0DW4yqAsJqwtCzj6vbaBRrNqWGK6BQ+fkBLjDd7 w==;
X-IronPort-AV: E=Sophos;i="5.58,428,1544457600"; d="scan'208";a="104238457"
Received: from mail-bn3nam01lp2059.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.59])
	by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2019 03:32:38 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qNZhO7dpaL3DMzpBv8UauN///SuqP4USzSbq5VVycmE=;
	b=VmUF6zpNMoyGef04Yh234p32PEoaANo/st7Gapq61pJlSa27ACmEj9fk1CgZYbWlCNliU8lLNHhlemhBlt56dJ3dgIPtSq8kbKvLPIn5qAMHzQrUM44v3RFs8IVW48Q3G4TrT1EJrxItXXZ7ZFaWYK0OA7A4tcz7mpaA2zlI0Hw=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0352.namprd04.prod.outlook.com (10.169.202.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.18; Fri, 1 Mar 2019 19:32:35 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Fri, 1 Mar 2019 19:32:35 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 1/3] license: Add the CMU-Tex license
Thread-Index: AQHU0GWFSmy8IuHbEEibboYfIzY3EA==
Date: Fri, 1 Mar 2019 19:32:35 +0000
Message-ID: <20190301193156.25878-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR01CA0044.prod.exchangelabs.com (2603:10b6:a03:94::21)
	To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fbab68c8-0071-4405-f05b-08d69e7ca82a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0352; 
x-ms-traffictypediagnostic: MWHPR04MB0352:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MWHPR04MB0352;
	23:kzQ47IKVi2VE9Au9T5mWcfIdN+RrgX8M9Aa1nN2?=
	=?iso-8859-1?Q?VY+jOsAkMOwAvRQ8n1/Ns4nqJ+PIGm8St4l5L7famq+D0NinsWoombu3yZ?=
	=?iso-8859-1?Q?PjAoVA15mGgpEIUUywWVj/J0CGJjCrgHUT7a70hjuQsWk1eim9K51MNOg7?=
	=?iso-8859-1?Q?sdbXO4MOyq7QaThJzIGKBSZmslZHg3TlWw4Kxh8ZEG8WggXo6ZexgT+cu9?=
	=?iso-8859-1?Q?X+VTuUv7hmuGtVm/FIPNKEQ1R9bg4buDoUV2IiwjRDlEIXK/XB6jmxxUfX?=
	=?iso-8859-1?Q?hDwuBufCWYBQDGnttN1aNKZqe3DGrsydNoZIBkxKEmjkdiSmMip7Cjgdyr?=
	=?iso-8859-1?Q?U1oL1xbemKjbYo1/uEI3rM5qMjgwfYvfGg5oJujKSWwjfPqHsuNofJfCC6?=
	=?iso-8859-1?Q?xMwmZe0L2YnUyPhlWlw0p6UN2ob2za3WjcLRF95HLUDxX+KCNGhiSBY2qr?=
	=?iso-8859-1?Q?0uTv6n6jlYw8+mJGAb3GH17Y2099uA2c19OTcE7AiW+DmXBy5QGCUamoRZ?=
	=?iso-8859-1?Q?wlk64ysd0J0gA4Vd7MLxBUxB7hsE1gYTtC0zHwE6X3Q/v60w4KBIZ4v4Zq?=
	=?iso-8859-1?Q?R5o8+xmpfvRTs35JuOD2EVwXBXJiiYuBeGsIapvm9MauiFbOxcAJj85koi?=
	=?iso-8859-1?Q?WRfY3eG1O/8Nsk6MBJ72xFHfI2Nt1rPv5Ru1hJ2bSwxtXqOZCHyClSQH+X?=
	=?iso-8859-1?Q?loJuoRygWlgCNRqeDXC0N0Uo6C4qJnil8+tJ98dcT+TlqxbHfFfYljYGzO?=
	=?iso-8859-1?Q?bcIgHsXdyfqLaUdpzCjFjkd+Y55Z2ueVm5pD27XGzfgofPTQQ/ptsQ0sEJ?=
	=?iso-8859-1?Q?QZD8brxUkWu4TnmdmJC15TmahUrbU2oUVIXb90hoxaQpCOvbwVmmboUdzg?=
	=?iso-8859-1?Q?DGqqgEslXOOwn8pwbJwQTeBCmP9v1Tk5Lgd0kI5WpC7gh/ferXSh9y4fDm?=
	=?iso-8859-1?Q?5Iz/K0IaKXxlotb1sHJgRU3OBgRarBVHcwSybr1hgwi8aIxw6l9YRO8Xft?=
	=?iso-8859-1?Q?jUpCifgF5+bUBUP6s4XNm3tAiMuyE/D4tnA7Xesj+C66m1/dCoFBUi+TJV?=
	=?iso-8859-1?Q?O0bXlXfyKnZlbnQxxhgdeqzeVX0QR4ydjS3mXELgPqf8qIPv4Gr089rnJ8?=
	=?iso-8859-1?Q?f37+92Gxiul+HORH1AkZMBA2P+2DCsBJ04n/RMSxAA4ENmL9gsarBLgpY3?=
	=?iso-8859-1?Q?Ov4bTqG5S8qyYadujE2GgxVV4g2NuiIZovlOHb6Nyi84mGBXFrFJGXR/9K?=
	=?iso-8859-1?Q?vYXLDfau02CvvYbk5WkNdiw4ePRPcSIcuijKBZCbIwcPTDKK9oTUeddx9V?=
	=?iso-8859-1?Q?H8q/4FBmAeDrkas5YTY3BbfvdnTkgy/O9hHB8ueTmOY/z9Ewf1Pnx5aLZt?=
	=?iso-8859-1?Q?JmCII3Qs=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB035210BB3BFD909BD5CC98F190760@MWHPR04MB0352.namprd04.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(105586002)(97736004)(66066001)(26005)(7736002)(3846002)(6916009)(186003)(6116002)(2906002)(316002)(486006)(478600001)(44832011)(14454004)(71200400001)(476003)(71190400001)(2616005)(53936002)(6306002)(6512007)(81166006)(5660300002)(8936002)(6436002)(6486002)(2501003)(52116002)(2351001)(5640700003)(36756003)(386003)(6506007)(305945005)(99286004)(102836004)(81156014)(8676002)(106356001)(1076003)(50226002)(256004)(14444005)(4326008)(25786009)(54906003)(68736007)(86362001)(72206003)(966005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0352;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: X5NrY3XrvjurVd6dgy42cE6AbFPKmSt5hZ5fzHQISRcZEeFeruP3FxlJekS3jO24+/pkTyJ9WBqGR3xTXgcBcSwSsIZrxLR5trnNBhlkuK9MaZ5+CP185lo8K6ZyD+bU5VjGLX14p0I0hR+LVhqs/k6EA6GMe1Hkit6qqphpJOv2msPZEzMsgxzfMxq/E42COIprhnLkDq95WmPeZWGLqfGdDDkvVBNETfh08y5HYyo7omyqgHOJfOhEjegXgOSoJypcX4pDq7pRu7J2RXaTl7d94S/5fNYvLKoZrqK/X5z67sSSyO/YXDL3RDNoI9+84olIQJaCyFztswR8OWb7TYYuICHfTdA/4aVH/l532CgQn/fRKYMBlrY1KVIk14EX4DhkbNCcmTXhUe539i8hz+ywYt6I1aYM+H61C00dWhw=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbab68c8-0071-4405-f05b-08d69e7ca82a
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 19:32:35.2692 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0352
Subject: [PATCH 1/3] license: Add the CMU-Tex license
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
X-List-Received-Date: Fri, 01 Mar 2019 19:32:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

This is based on the license here:
https://github.com/MycroftAI/mimic/blob/development/COPYING#L840

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/files/common-licenses/CMU-Tex | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/files/common-licenses/CMU-Tex

diff --git a/meta/files/common-licenses/CMU-Tex b/meta/files/common-license=
s/CMU-Tex
new file mode 100644
index 0000000000..f512228523
--- /dev/null
+++ b/meta/files/common-licenses/CMU-Tex
@@ -0,0 +1,20 @@
+Copyright (C) 2001-2014 Carnegie Mellon University
+
+Permission is granted to make and distribute verbatim copies of
+this manual provided the copyright notice and this permission notice
+are preserved on all copies.
+
+Permission is granted to process this file through TeX, or otherwise and
+print the results, provided the printed document carries copying
+permission notice identical to this one except for the removal of this
+paragraph (this paragraph not being relevant to the printed manual).
+
+Permission is granted to copy and distribute modified versions of this
+manual under the conditions for verbatim copying, provided that the entire
+resulting derived work is distributed under the terms of a permission
+notice identical to this one.
+
+Permission is granted to copy and distribute translations of this manual
+into another language, under the above conditions for modified versions,
+except that this permission notice may be stated in a translation approved
+by the authors.
--=20
2.20.1


