Return-Path: <prvs=95684d004=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 685ED7CDB7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Mar 2019 19:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551468761; x=1583004761;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=TpNTUn69yIZ692JVdVd5Goj07fnLpzcrmQJNWpHHBEw=;
	b=BCGlmJ1YrALGBvy5V8pxVkf5F+JeMmIoJll5Cttsr989cPo4iDDvjS22
	7zcxGZ2pueKLU6fbBXR2wLkLwtWvb11X1cB0o0wadBlCsaIY27uYIGvbk
	RDyff5IwYgPgfFc5Q7XPH6EEJDfrK/pPc6ycRG5ocMsz5wxQkmUMEAhgo
	xkTi7edHVMxFJM3/q9zd2Lmw8Vhz0BLqDa6QXNMr326o1/uFxpDbmVW/O
	WIOrSIv2y8URfgcbNa88+7rLhQ4izkoY22AY4A0Xi0XkTMVfKDySdVRMe
	UxVjtBHy7VnrwP2wNOesCUYdUFI8dS/4rG/7ptYJEi4CoRj7YQ/yeaeAX A==;
X-IronPort-AV: E=Sophos;i="5.58,428,1544457600"; d="scan'208";a="104238464"
Received: from mail-bn3nam01lp2051.outbound.protection.outlook.com (HELO
	NAM01-BN3-obe.outbound.protection.outlook.com) ([104.47.33.51])
	by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2019 03:32:40 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=0yH+ZqXRYFqeLJHNGTK0LgMTg6fMH0alp+tKaAU0yck=;
	b=CjVC/u8j8grTY7LWDe9RRA/xP2HwpoAFgaXK3Ch4fEzfY9J8WVX3WbtcyKsJffNd40JiaZ7j/ymoW97yT6fSvNbg1ZwhW4BjKyPC3ia2qm/dMLRwgsRH3tu53fvkPbre3eNHiTMSh+IjZ/7agdnFugk98ojTy8vJMOT2aJ/K9dQ=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB0352.namprd04.prod.outlook.com (10.169.202.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.18; Fri, 1 Mar 2019 19:32:38 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Fri, 1 Mar 2019 19:32:38 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 3/3] license: Add the BellBird license
Thread-Index: AQHU0GWHBvpkl6G3IkqkD7ifKw8pjg==
Date: Fri, 1 Mar 2019 19:32:38 +0000
Message-ID: <20190301193156.25878-3-alistair.francis@wdc.com>
References: <20190301193156.25878-1-alistair.francis@wdc.com>
In-Reply-To: <20190301193156.25878-1-alistair.francis@wdc.com>
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
x-ms-office365-filtering-correlation-id: 99866039-a69a-4391-1ac0-08d69e7ca9c9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB0352; 
x-ms-traffictypediagnostic: MWHPR04MB0352:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?iso-8859-1?Q?1; MWHPR04MB0352;
	23:0X5xvcIIpkkWbpl1WVtFAsYqBbhfj+iQ7Qs9EGR?=
	=?iso-8859-1?Q?y6aLDGctJh5JKk1W2o9evVa+HhGPi0bzI8HleXJOh/2GGmLiEUzNnqMO+X?=
	=?iso-8859-1?Q?or/FpBmxPp11YHwDtXYddaYijrg49NrgPnEpVO+qsIlVv5fP+zOsUmZaeL?=
	=?iso-8859-1?Q?OPFpZlUNc7kRrYb3hEn/shNS8Y9P2yb/tqsYZqGgOp2N0tw2w4xJFdt3Y3?=
	=?iso-8859-1?Q?K5Mp39GwntUpB1a4EJPCDLFroTAkmsdDjKrPxeYTShy5bwLzL/WA8JErxc?=
	=?iso-8859-1?Q?9+MLshVa1hjs3TOoEbwV/34pNKDNo7MzQwsxVRLT9p498h41qxRfGNi/iR?=
	=?iso-8859-1?Q?pAGWVGCm2YPxFOkW8X353HfZYlDA4XbiD/pPlhp20YvYvuDQv0IesQzFL4?=
	=?iso-8859-1?Q?urGsAm7g+Wz/1A1cIcf2jLPAQBEXYXrZypN2WsDM5q9QyvX8YJA5QtgDbF?=
	=?iso-8859-1?Q?oHqeXE6A2j435qFuY1OyUZIvm+NUk/oYjAEoXr5zuTO2NEjTuZ2Y7V+RTx?=
	=?iso-8859-1?Q?HJIJ5al1uPrCvV8GO3h8FB5XXLrleQd2o5umdSy+HAxYeBGkZ4GrXEtleL?=
	=?iso-8859-1?Q?HbtJYXfPTuSlCTBWdU3MFZuC62tmE91nnyNOAtNYLhjOzSQUVcQQCTkXLu?=
	=?iso-8859-1?Q?vZB/15fp9zyI+zCKqwKyX5M2ZVlIvqzDN4GWDlDuSEBlZ4YgG6gpQqavz+?=
	=?iso-8859-1?Q?truaTgm2Hi/w2rpT/olcQzxDk6ym+6RraJP/T31yQ0NxDF9Savti09GG/K?=
	=?iso-8859-1?Q?R5dBfOIPui9IjxakXC8LxjqcGBh4I8Y5BeGwVb92WXLsCetcfnsPdET29L?=
	=?iso-8859-1?Q?eQmcrsvqPOUl3fk/HXZKbSAAS416qZmb+2A5JAC6FNNyiEXiFdkUgtaUmw?=
	=?iso-8859-1?Q?flrgRkb8Hru5cECSH9UhOWOS8O/QZACFC21utdo+0RhYzCV4uwZmFD/cVJ?=
	=?iso-8859-1?Q?bDiRa9cdCKNdSP6TNyDS4k2ZsF2Wmna3LgoWurTklHqzJZtZf32XV+wLgd?=
	=?iso-8859-1?Q?CS6AW66O+qt9wrcG0ew8kvGwzavmteAnsR4U02XhqNjqEZAnllLmwj2bT0?=
	=?iso-8859-1?Q?+LkehBoBYTe3pjS4Ah5FGvsnuX+BN+G1Gy2zu4AmdSxiKR/Im04UmLfsAt?=
	=?iso-8859-1?Q?bkUxEEwb0j2go7UOztcFqe9bQMCav3s6CZUBrZy6Wbs+XsgcnLq4mMp4wY?=
	=?iso-8859-1?Q?nNM62UaGeLBK09z0K3UH4qC8xkL+lohjP8sW42jQ16WKruXvnT2WHw2poy?=
	=?iso-8859-1?Q?smq9imKgpBk1zjOtrn/L8Zv7GMCNLqXQna7vM02ByRRtwylROcJrHnuFqi?=
	=?iso-8859-1?Q?1OH1RYdVMk43NbfVWhQ2Y6HoSJLVPK037Wqb/UemzAAQzP49dGj83/T7F7?=
	=?iso-8859-1?Q?uLfsKVhPlCD273D9RAkHYS7OHNj0GmodDLBJg+f4WdWO/v5nFRA=3D=3D?=
x-microsoft-antispam-prvs: <MWHPR04MB035229E13B22F337844B3BBA90760@MWHPR04MB0352.namprd04.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(366004)(396003)(39860400002)(136003)(376002)(346002)(189003)(199004)(105586002)(97736004)(66066001)(26005)(7736002)(3846002)(6916009)(186003)(6116002)(2906002)(316002)(486006)(478600001)(44832011)(14454004)(71200400001)(476003)(71190400001)(2616005)(53936002)(11346002)(446003)(6306002)(6512007)(81166006)(5660300002)(8936002)(6436002)(6486002)(2501003)(52116002)(76176011)(2351001)(5640700003)(36756003)(386003)(6506007)(305945005)(99286004)(102836004)(81156014)(8676002)(106356001)(1076003)(50226002)(256004)(14444005)(4326008)(25786009)(54906003)(68736007)(86362001)(72206003)(966005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB0352;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Iowf9teL7njowHrki7qo5c9V6SBY/lEJzXFj3G5rqENUuuK3JjkFPftTYfEI6yo9M919TgSal2VNWg3uKcCVl3eSvG20L9NZW5bTSv+tjhc7VGM1gtg+pm/dNG3j6o2+z8x9+qyVS9T9dXtYl6XYowF+yaO2Z7TBk/lYiH31L0xX5HAn5VkffGvIxFeKnokcnYDwKf6DOR10fQwoVGtbOeRTcseZ+bTxvpjOwFQsX5VyNhgIddNb5jlJxfvsMHigHIMAUq6y41bPBcbaXcXQkh8t5vviZ/AwTebmbmJr8ghj7pwt1AMQMpv/mqz+TZjxka3JYNIO5egAoWXJn3nbFhhkAS+C/sLxIAdabJ9eP2P14F3TSobjEhwQ/emsv8afmNnyabpgQyMS7nr851/bgXe4Cw7S9yfypfSUD7dzBCY=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99866039-a69a-4391-1ac0-08d69e7ca9c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 19:32:37.9805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB0352
Subject: [PATCH 3/3] license: Add the BellBird license
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

This is based on the license from here:
https://github.com/MycroftAI/mimic/blob/development/COPYING#L959

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/files/common-licenses/BellBird | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/files/common-licenses/BellBird

diff --git a/meta/files/common-licenses/BellBird b/meta/files/common-licens=
es/BellBird
new file mode 100644
index 0000000000..bc5c03fa8e
--- /dev/null
+++ b/meta/files/common-licenses/BellBird
@@ -0,0 +1,25 @@
+(c) Copyright the authors of Bellbird. All rights reserved.
+
+Permission is hereby granted, free of charge, to use and distribute =20
+this software and its documentation without restriction, including  =20
+without limitation the rights to use, copy, modify, merge, publish, =20
+distribute, sublicense, and/or sell copies of this work, and to     =20
+permit persons to whom this work is furnished to do so, subject to  =20
+the following conditions:                                           =20
+ 1. The code must retain the above copyright notice, this list of   =20
+    conditions and the following disclaimer.                        =20
+ 2. Any modifications must be clearly marked as such.               =20
+ 3. Original authors' names are not deleted.                        =20
+ 4. The authors' names are not used to endorse or promote products  =20
+    derived from this software without specific prior written       =20
+    permission.                                                     =20
+                                                                    =20
+THE CONTRIBUTORS TO THIS WORK        =20
+DISCLAIM ALL WARRANTIES WITH REGARD TO THIS SOFTWARE, INCLUDING     =20
+ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS, IN NO EVENT  =20
+SHALL THE CONTRIBUTORS BE LIABLE     =20
+FOR ANY SPECIAL, INDIRECT OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES   =20
+WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN  =20
+AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION,         =20
+ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF      =20
+THIS SOFTWARE.=20
--=20
2.20.1


