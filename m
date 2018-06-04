Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0086.outbound.protection.outlook.com [104.47.32.86])
	by mail.openembedded.org (Postfix) with ESMTP id 93B8574D7C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=FjlGeETX8KDUd9w/sIMTOPqQxxizKZTPOIFLcfdmZYo=;
	b=eazgQirP0LiROTTcwFuBie461KcfO6w1YyLAmJO3YYCzpgB3lOVE4B7ieg1P+qW48Wjoy85EbhAtP8F9XDjnUvpM0chVAcryT1ssUClEUGt+OTUaKm5SenZ1S70XG9jVSKqgHvKDdNS6hgcqndSbrI+Cvc0Dm4pPvcmxc9n5P50=
Received: from DM5PR02MB3863.namprd02.prod.outlook.com (52.132.139.146) by
	DM5PR02MB2537.namprd02.prod.outlook.com (10.168.195.19) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.820.11; Mon, 4 Jun 2018 10:48:10 +0000
Received: from DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294]) by DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::a980:cb7c:becd:294%5]) with mapi id 15.20.0820.015;
	Mon, 4 Jun 2018 10:48:09 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Vineeth Karumanchi <VINEETHC@xilinx.com>
Thread-Topic: [OE-core] [RFC] u-boot.inc: Support menuconfig for u-boot
Thread-Index: AQHT++UJ+c4evmsya0OdFsK6+Sh+/qRP6seA
Date: Mon, 4 Jun 2018 10:48:09 +0000
Message-ID: <DM5PR02MB386361C4D985F6B04F0B621AB9670@DM5PR02MB3863.namprd02.prod.outlook.com>
References: <1527572697-22019-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<20180604091528.GC5485@xhdvineethc40.xilinx.com>
In-Reply-To: <20180604091528.GC5485@xhdvineethc40.xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [49.207.58.107]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR02MB2537;
	7:xJGg93T4vo5pLo0FiKvnqYuFwQgzAfMwTRN7VU3dBLI2iTRlDdzSjdkqs9I3d36bvHSdmyg6CY+S25sbEh+W1GFSJB7ELTwIcj/tuta56TnvmG5yJboCS99Q32mpF6kh2QKbuE50mKEWYsv5+Yfp3IyHups9ddDSNtbDsOQTsUHnXbzg/1eq4NNf54SIfHevGTrOBAhm4ujYpfQgcZDZtDgKQotVE+tXwVgdviWzSAkVagYMD6O+Trqe18VvPrQl
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(346002)(376002)(366004)(396003)(39860400002)(39380400002)(189003)(199004)(13464003)(6862004)(316002)(68736007)(6436002)(8676002)(486006)(476003)(81166006)(81156014)(11346002)(446003)(305945005)(7736002)(2906002)(53546011)(86362001)(8936002)(97736004)(6506007)(229853002)(2900100001)(55016002)(7696005)(3280700002)(76176011)(102836004)(26005)(478600001)(14454004)(5660300001)(5250100002)(105586002)(74316002)(33656002)(6116002)(3846002)(72206003)(106356001)(4326008)(9686003)(6246003)(25786009)(53936002)(99286004)(66066001)(6636002)(3660700001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB2537;
	H:DM5PR02MB3863.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR02MB2537; 
x-ms-traffictypediagnostic: DM5PR02MB2537:
x-microsoft-antispam-prvs: <DM5PR02MB25379121E99D8CC84EFDD1DEB9670@DM5PR02MB2537.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(131327999870524)(264703809997249)(192813158149592); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(10201501046)(3002001)(93006095)(93001095)(3231254)(944501410)(52105095)(6055026)(149027)(150027)(6041310)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR02MB2537; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB2537; 
x-forefront-prvs: 069373DFB6
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: qBE16zAGqr6SfnMLbxfryLTEmS2FtxAJarLgeNQ9b3XqaUrh8dfldruchgUYLgOtGseYd92EfdA6CZozIIoDQCKvndWSp43HHlL0uzJG6EVcAg0SzxAeKBie6vRODcuh9YdnN2qzQ7Go4PT3colikLM0ArcnekqyWknzK1K7WtL66E/ru/MabJTy2Fv0r4Bj
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 26b238a2-3b58-4582-5391-08d5ca08a9a4
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b238a2-3b58-4582-5391-08d5ca08a9a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2018 10:48:09.6836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2537
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] u-boot.inc: Support menuconfig for u-boot
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
X-List-Received-Date: Mon, 04 Jun 2018 10:48:11 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Vineeth Chowdary [mailto:vineeth.chowdary@xilinx.com]
> Sent: Monday, June 04, 2018 2:15 AM
> To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [RFC] u-boot.inc: Support menuconfig for u-boot
>=20
> Hi Manju,
>=20
> On Mon, May 28, 2018 at 10:44:57PM -0700, Manjukumar Matha wrote:
> > u-boot mainline supports menuconfig and is slowing moving drivers to
> > be enabled using menuconfig. This patch enables menuconfig for u-boot u=
sing
> cml1.
> >
> > However using menuconfig in conjuntion with UBOOT_CONFIG cannot happen.
> > When you run menuconfig it is against a particular defconfig, while
> > using UBOOT_CONFIG, you can have different defconfig.
> >
> > Tested with beaglebone-yocto machine and zcu102-zynqmp machine in
> > meta-xilinx layer.
> >
> > Signed-off-by: Manjukumar Matha
> > <manjukumar.harthikote-matha@xilinx.com>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot.inc | 28 ++++++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/u-boot/u-boot.inc
> > b/meta/recipes-bsp/u-boot/u-boot.inc
> > index c2bcf99..cd8b8d3 100644
> > --- a/meta/recipes-bsp/u-boot/u-boot.inc
> > +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> > @@ -5,7 +5,9 @@ B =3D "${WORKDIR}/build"
> >
> >  PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> >
> > -inherit uboot-config uboot-extlinux-config uboot-sign deploy
> > +DEPENDS +=3D "kern-tools-native"
> > +
> > +inherit uboot-config uboot-extlinux-config uboot-sign deploy cml1
> >
> >  EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX}
> CC=3D"${TARGET_PREFIX}gcc ${TOOLCHAIN_OPTIONS}" V=3D1'
> >  EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}"'
> > @@ -63,6 +65,29 @@ UBOOT_EXTLINUX_INSTALL_DIR ?=3D "/boot/extlinux"
> >  UBOOT_EXTLINUX_CONF_NAME ?=3D "extlinux.conf"
> >  UBOOT_EXTLINUX_SYMLINK ?=3D "${UBOOT_EXTLINUX_CONF_NAME}-
> ${MACHINE}-${PR}"
> >
> > +# returns all the elements from the src uri that are .cfg files def
> > +find_cfgs(d):
> > +    sources=3Dsrc_patches(d, True)
> > +    sources_list=3D[]
> > +    for s in sources:
> > +        if s.endswith('.cfg'):
> > +            sources_list.append(s)
> > +
> > +    return sources_list
> > +
> > +do_configure () {
> > +    if [ -z "${UBOOT_CONFIG}" ]
> > +    then
> > +        if [ -n "${UBOOT_MACHINE}" ]; then
> > +            oe_runmake -C ${S} O=3D${B} ${UBOOT_MACHINE}
> > +        else
> > +            oe_runmake -C ${S} O=3D${B} oldconfig
> > +        fi
> > +        merge_config.sh -m .config ${@" ".join(find_cfgs(d))}
>=20
> I think dependencies will not be resolved if we append at the end and rep=
arse ?
>=20

Can you provide more details or test-case which resulted in the breakage?
I have followed busybox implementation of menuconfig here

Thanks,
Manju

<...>

