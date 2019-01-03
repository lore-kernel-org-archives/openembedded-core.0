Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 31635 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Jan 2019 17:12:21 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780052.outbound.protection.outlook.com [40.107.78.52])
	by mail.openembedded.org (Postfix) with ESMTP id 61F60745BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 17:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LdVJFVFmArOUVM7i/M8+JvdLWL2wpTWno3K1z7Vf1+Y=;
	b=mtNVGduxjFvqfQjcm0hV64lTaX0AEMNfQZvo19Y4KBehMB2sbC7k0X8XcBrbqdRW9qWcQeM5Ojb2HhwEUVoSgeHFAspE+Kaqguhcwb3RBArLmYiVQEGJwatSm9JUpiVOqPOnY+hMkZp3TrI0UnG+YXgQVTSJvPE0vDpCJbCvbk0=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB4471.namprd02.prod.outlook.com (52.135.239.142) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1495.6; Thu, 3 Jan 2019 16:40:02 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::b921:e815:abd4:d3e8]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::b921:e815:abd4:d3e8%5]) with mapi id 15.20.1495.005;
	Thu, 3 Jan 2019 16:40:02 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: =?iso-8859-1?Q?Andr=E9_Draszik?= <git@andred.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: Fix incorrect deploying of
	fitimage.initramfs
Thread-Index: AQHUo35q3LrjB8rF50KiyuUrtz0IzaWdvtjg
Date: Thu, 3 Jan 2019 16:40:02 +0000
Message-ID: <BYAPR02MB6005E35F68D1A58A3313874EB98D0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <1546491100-4909-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<033c3d0a620da4834ae4fc4d02a9ebb87a637f45.camel@andred.net>
In-Reply-To: <033c3d0a620da4834ae4fc4d02a9ebb87a637f45.camel@andred.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
x-originating-ip: [149.199.62.133]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR02MB4471;
	6:YWH40SliPSV29oAhwWYlBQpiXj6HGaSaOoryjP5/RPiAYYt0R7y6FTSnYNx9qW446BZ4hS/Onxq0zOROOQ/WJueBKXkFSnUHQ9tUt7EOxG/5D4pcr3cy78UCeaOXFsAH/ftRoZGY4n1KxKWB3cGo8YZS2izqr6xL9Vyl3oXNlfoSsX3ivGyQiUf8U6PNwQmFLaID195RPtmQBGmSn04SyvlwAVXSec7rWfxPPEhQd2p+GtQwz98B1UYGzwcgxyckP6TbV/HbIskXquW6uJnpI3GmKidIEZaiamlyKo+MySlO9Nawl18xlFOuGPb5vs5xyfeCM5qq0zy9PKbzJ/gHWIo8OyqgVBOR1wnzqd39syB2OWKwLL3kIbDz1vGQXoLQEiCAd73dve5jvp4kndb3hHtiI5p3NO/XT1CKVIKBLVyNJ5u1o5RnWFssTKVUtlBVNumIiKp1lynDAulKxTKjkw==;
	5:yMFLoZEWoryc2bh3t2h9VDxxF7xtKaBOQC9VG9HDFtKT/ckQsd/7ZGsETXtbyy3HhAsULjpDe3oiKMEHzwxV0xX3DtZWaguRUNMIfscBiyfcy6CvDrtwoz0Y0sPnAOX+ROSO/ELQZk8SYglUCMQwRuCPzcHaHhcTRC5IoZkD9r6tlWpoSjIzYV+7DQz13BOBIPNO12UXK7LXhpOjMcIw8A==;
	7:ScRoTbxV4017KnNRDyEVyrzRc9RCNiWyzfNOSXBRKREpXJnoaXBOvtGxtiuKxC06iTNQP3TOcKUSRH9vBspXR1b+sYYuuHf+bxFdmPf57ky8T1FZL4wgHGsrjmErAk3y8Of0oZCzr905Wl71iqsjWg==
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b9f79ee9-4a28-4545-8139-08d6719a1bf5
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB4471; 
x-ms-traffictypediagnostic: BYAPR02MB4471:
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-microsoft-antispam-prvs: <BYAPR02MB44711D85D1750281A47DC1DCB98D0@BYAPR02MB4471.namprd02.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(3230021)(908002)(999002)(5005026)(6040522)(8220060)(2401047)(8121501046)(3002001)(3231475)(944501520)(4982022)(52105112)(93006095)(93001095)(10201501046)(6055026)(6041310)(20161123560045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(20161123562045)(201708071742011)(7699051)(76991095);
	SRVR:BYAPR02MB4471; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4471; 
x-forefront-prvs: 0906E83A25
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(376002)(136003)(396003)(366004)(13464003)(189003)(199004)(33656002)(76176011)(6306002)(7696005)(9686003)(256004)(68736007)(81166006)(2906002)(8676002)(446003)(8936002)(25786009)(86362001)(11346002)(5660300001)(110136005)(316002)(102836004)(486006)(476003)(6246003)(81156014)(6116002)(3846002)(74316002)(71200400001)(97736004)(6506007)(53546011)(53936002)(186003)(72206003)(71190400001)(966005)(478600001)(106356001)(14454004)(2501003)(55016002)(305945005)(99286004)(105586002)(26005)(229853002)(66066001)(6436002)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4471;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2LRFiRDqzWSQveC/nmCX/srvlemTUCBuHf/7gBxGZgMnsodSu0PaFm5bwRK58hY5EilIjd8quMuqJ/aXaqhD1TM+2/qm8XD1CtVBP7vxicaeZOr0rI9RSj8CsuI50SHP4whTHx5mhUzw7mgtSU8BZkMXDhmH/6JZ2JC8cvxg8PzPaHSjyYJkM2FyiaFU8GU6iLsZ9kycpfjKynJ6lsTCOcjKkvSH2lnkWr4aVIutpMQ9y3ZoE4YOI9k9ObkVnAuqxkEJYgKqnCBdMgjhH8bCAAW8qfo+LDLQxS1pMDlcAs7CWjrcv/9QliicN1TzrZgQ
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f79ee9-4a28-4545-8139-08d6719a1bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2019 16:40:02.6449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4471
Subject: Re: [PATCH] kernel.bbclass: Fix incorrect deploying of fitimage.initramfs
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
X-List-Received-Date: Thu, 03 Jan 2019 17:12:21 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Andr=E9 Draszik
> Sent: Thursday, January 03, 2019 8:07 AM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] kernel.bbclass: Fix incorrect deploying of
> fitimage.initramfs
>=20
> On Wed, 2019-01-02 at 20:51 -0800, Manjukumar Matha wrote:
> > When kernel-fitimage and initramfs is enabled using
> > INITRAMFS_IMAGE_BUNDLE =3D "1", kernel do_deploy tries to deploy
> > fitImage.initramfs with following error
> >
> > > install: cannot stat 'arch/arm64/boot/fitImage.initramfs': No such
> > file or directory
> >
> > Skip deploying fitimage.initramfs, since fitimage does not create
> > fitimage.initramfs
> >
> > Signed-off-by: Manjukumar Matha
> > <manjukumar.harthikote-matha@xilinx.com>
> > ---
> >  meta/classes/kernel.bbclass | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> > index e04d2fe..60382bf 100644
> > --- a/meta/classes/kernel.bbclass
> > +++ b/meta/classes/kernel.bbclass
> > @@ -682,6 +682,9 @@ kernel_do_deploy() {
> >
> >  	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" =3D x1
> > ]; then
> >  		for imageType in ${KERNEL_IMAGETYPES} ; do
> > +			if [ "$imageType" =3D=3D "fitImage" ] ; then
>                                           ^^
>=20
> =3D=3D is a bashism and should simply be =3D instead.
>=20

Right, v2 on its way

Thanks,
Manju

> Cheers,
> Andre'
>=20
> > +				continue
> > +			fi
> >  			initramfs_base_name=3D${imageType}-${INITRAMFS_NAME}
> >  			initramfs_symlink_name=3D${imageType}-
> > ${INITRAMFS_LINK_NAME}
> >  			install -m 0644
> > ${KERNEL_OUTPUT_DIR}/${imageType}.initramfs
> > $deployDir/${initramfs_base_name}.bin
> > --
> > 2.7.4
> >
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

