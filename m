Return-Path: <bevenson@melinkcorp.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0120.outbound.protection.outlook.com [104.47.36.120])
	by mail.openembedded.org (Postfix) with ESMTP id 56A1E719E2
	for <Openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 22:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=Melink.onmicrosoft.com; s=selector1-melinkcorp-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=iZuSq+bMf74v6Injyz9ZQWkoTAXAUuxn6epveBHtkH8=;
	b=Zqjku1kNI9xxHM9Pq8n/MQlwHZ92HedUt7XXI+PpWKHECM8COO1I3BTLKhWHYBtxNsfTkxQTAehzAx4tWuvi9jAjgqEXSptPPzYTOR3drJ24OAjXWed8+QenG9K7d0tb+dU5HElFXbVYfAKnl/68udeHK34SqOG6hZPAA25KqO0=
Received: from DM5PR05MB2954.namprd05.prod.outlook.com (10.168.176.142) by
	DM5PR05MB2955.namprd05.prod.outlook.com (10.168.176.143) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.919.10; Wed, 15 Feb 2017 21:54:00 +0000
Received: from DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) by
	DM5PR05MB2954.namprd05.prod.outlook.com ([10.168.176.142]) with mapi id
	15.01.0919.013; Wed, 15 Feb 2017 21:54:00 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: Suggested RREPLACES/RCONFLICTS for easier kernel-image upgrades
Thread-Index: AdKH01RvH/dQvi5nROe3asA1z4v5aQ==
Date: Wed, 15 Feb 2017 21:54:00 +0000
Message-ID: <DM5PR05MB2954FBA66842C0F05C5108C6BB5B0@DM5PR05MB2954.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=bevenson@melinkcorp.com; 
x-originating-ip: [98.100.91.242]
x-ms-office365-filtering-correlation-id: 2b161fca-5a68-4650-cdfe-08d455ed269d
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:DM5PR05MB2955;
x-microsoft-exchange-diagnostics: 1; DM5PR05MB2955;
	7:uFA2QiHgH9yvKBcmHBRbGFAUYyHQTSfqCE0WH66p5zZn0esHWjRsso6D9C1tvxsXYlmt40k9IEGlJxJ78uN77hnCbxasnM8v3YQSsckbJdP0q/h5ikO9X4BoTEdidFvyYa/bQUn4e8gGhy4XHO24vrp7851R1eaI8pgX7KmuV0v5kBXoM/lFNPjy+p4Ihhf+vC7j4YR+2otQrMZoBvTpnz27lE+enJBKGbCxI1rcGRo3KBbzOXUeCL+7gqj0uUX+TL8WrJr00yUjnsAdy6MQlWTk7GV2/7dws/Jvna8ByNE6WSlsPjlYfFtdgAyK181ocXVZ8ucH9dJdaLuCQ3NBaw==
x-microsoft-antispam-prvs: <DM5PR05MB295599A37C77F324365BE4F9BB5B0@DM5PR05MB2955.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(3002001)(10201501046)(6041248)(20161123564025)(20161123560025)(20161123562025)(20161123555025)(20161123558025)(6072148);
	SRVR:DM5PR05MB2955; BCL:0; PCL:0; RULEID:; SRVR:DM5PR05MB2955; 
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39450400003)(189002)(199003)(2906002)(450100001)(38730400002)(92566002)(97736004)(122556002)(105586002)(2351001)(305945005)(7736002)(66066001)(81156014)(8936002)(81166006)(68736007)(74316002)(8676002)(53936002)(389900002)(6916009)(7696004)(2501003)(2900100001)(5660300001)(3660700001)(6306002)(5640700003)(3280700002)(86362001)(6506006)(6436002)(6116002)(99286003)(110136004)(77096006)(55016002)(3846002)(102836003)(189998001)(9686003)(106356001)(33656002)(54356999)(50986999)(25786008)(101416001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR05MB2955;
	H:DM5PR05MB2954.namprd05.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: melinkcorp.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: melinkcorp.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Feb 2017 21:54:00.7667 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR05MB2955
Subject: Suggested RREPLACES/RCONFLICTS for easier kernel-image upgrades
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
X-List-Received-Date: Wed, 15 Feb 2017 22:09:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

For one project I'm using an Atmel AT91SAM9G25 processor, and I started whe=
n support for the chip wasn't fully integrated into the mainline kernel.  A=
s a result, I was using Atmel's Linux fork.  Support has been in the mainli=
ne kernel for a while now, so in the middle of doing other updates I plan o=
n switching to using one of the mainline LTS releases.  I'm using the kerne=
l recipe in the meta-sunxi layer as an example (located here: https://githu=
b.com/linux-sunxi/meta-sunxi/blob/master/recipes-kernel/linux/linux_4.4.40.=
bb). I also plan on keeping more up to date on releases.  However, due to t=
he package naming for the kernel images, the RREPLACES/RCONFLICTS statement=
s for firmware upgrade for this recipe is getting ridiculous.  I'm currentl=
y building for kernel version 4.1.38, and here's what I have so far to hand=
le all previous cases:

RREPLACES_kernel-image =3D "kernel-image (<=3D 4.1) kernel-image-3.6.9-yoct=
o-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-at91"
RCONFLICTS_kernel-image =3D "kernel-image (<=3D 4.1) kernel-image-3.6.9-yoc=
to-standard kernel-image-3.10.0-yocto-standard kernel-image-3.10.0-at91"

If it makes a difference, I'm using opkg for a package manager.  Since the =
kernel version is in the package name, I'm assuming that if I do keep going=
 forward and relatively up to date with LTS release, I'll have to start add=
ing "kernel-image-4.1.38 kernel-image-4.1.39 kernel-image 4.1.40 ...." to t=
he RREPLACES/RCONFLICTS so opkg will upgrade the kernel.

Is there a better way to do this?  I've tried using some wildcards in the p=
ackage names without any success.

Thanks,
Bryan

