Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 5599 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 23 May 2018 18:41:14 UTC
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
	(mail-by2nam01on0054.outbound.protection.outlook.com [104.47.34.54])
	by mail.openembedded.org (Postfix) with ESMTP id DB2E974744
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 May 2018 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=G36jyFQg4wDk/+W8FX+Z/vPe+wnbyAkSv+hsO6mIRNE=;
	b=rOxRhm+LeHUGHLgxCNbDrUGliSn09b2vnJKLomZgmIeYOY9pCFH/Q+7398w/WMVt9npF6JXFUJZMoxCihPJGt+L6MMLnK/B3xXaB8i3cNMUo30pYUWSHI0r8eiMQi1kbyZHCjWV2AmaN1oZouoQSUiYY7jJ91rVtmTpzweI/bnk=
Received: from DM5PR02MB3863.namprd02.prod.outlook.com (52.132.139.146) by
	DM5PR02MB3244.namprd02.prod.outlook.com (10.164.148.22) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.776.11; Wed, 23 May 2018 17:07:54 +0000
Received: from DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::89f0:1965:7ede:719]) by DM5PR02MB3863.namprd02.prod.outlook.com
	([fe80::89f0:1965:7ede:719%13]) with mapi id 15.20.0797.011;
	Wed, 23 May 2018 17:07:53 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Vineeth Karumanchi <VINEETHC@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] kernel-fitimage.bbclass: Deploy fitImage
	without rootfs
Thread-Index: AQHT8qoyW3UMhyOYVUGXYwJFoCUj06Q9i5xA
Date: Wed, 23 May 2018 17:07:53 +0000
Message-ID: <DM5PR02MB3863EBC8B2AAA73DF8D132A0B96B0@DM5PR02MB3863.namprd02.prod.outlook.com>
References: <1527088929-24317-1-git-send-email-vineeth.chowdary@xilinx.com>
In-Reply-To: <1527088929-24317-1-git-send-email-vineeth.chowdary@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [216.9.110.13]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM5PR02MB3244;
	7:wz+oauJBF/VLSWE8XfrBj3lBYwQEzGRt10fxfyXM0JZUBWdP4TI96MOIi8fhKI3T5eqrHbG8drw9DFDRL1vGdBH0voi2OxrY6nb6U1h2YtQGMu4pD4vhHfTWvb0pQBfMj70jayZUe7lbra0Sa030zMecpRRZuY9bmq8Puz6selPY6V0zS9v6HSAmhAeHhtik754x5YENHom7/5D1mHAL3qThcane/lEcnKIGR/u8sLib1kA/fRKm4Cubugxu7NPH
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(39860400002)(346002)(39380400002)(366004)(376002)(396003)(199004)(189003)(13464003)(72206003)(25786009)(53546011)(68736007)(6506007)(6436002)(110136005)(2906002)(8936002)(3660700001)(76176011)(5250100002)(305945005)(5660300001)(6246003)(478600001)(3280700002)(66066001)(102836004)(316002)(81156014)(7696005)(33656002)(107886003)(97736004)(99286004)(4326008)(9686003)(81166006)(55016002)(8676002)(74316002)(2900100001)(53936002)(86362001)(106356001)(446003)(476003)(2501003)(105586002)(14454004)(229853002)(3846002)(6116002)(11346002)(26005)(486006)(7736002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR02MB3244;
	H:DM5PR02MB3863.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(5600026)(48565401081)(2017052603328)(7153060)(7193020);
	SRVR:DM5PR02MB3244; 
x-ms-traffictypediagnostic: DM5PR02MB3244:
x-microsoft-antispam-prvs: <DM5PR02MB324410F5AA3638A7596D0FF4B96B0@DM5PR02MB3244.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231254)(944501410)(52105095)(10201501046)(93006095)(93001095)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123558120)(20161123562045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123564045)(6072148)(201708071742011)(7699016);
	SRVR:DM5PR02MB3244; BCL:0; PCL:0; RULEID:; SRVR:DM5PR02MB3244; 
x-forefront-prvs: 06818431B9
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: FcOAjXUrmGqLL1f3P7jJk1wqS9pUPdVPm5lOKoG20L6BEb28bFpGrI2WAp9P2PO+VOaZTdyb2cmh8NvxmB+0heco6lj2uX51xug0TkIqo2fb4GZG9Pag8C46vfy7bek2qk/EqqcJBCHHLixqpODUbgHIp9X5Q4tJlhgICaDY0INCUvTo2RlAXu0nmf6poNhB
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: f021e18c-6aa4-4bd8-3d97-08d5c0cfb8d3
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f021e18c-6aa4-4bd8-3d97-08d5c0cfb8d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2018 17:07:53.3314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3244
Subject: Re: [PATCH] kernel-fitimage.bbclass: Deploy fitImage without rootfs
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
X-List-Received-Date: Wed, 23 May 2018 18:41:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: Vineeth Chowdary [mailto:vineeth.chowdary@xilinx.com]
> Sent: Wednesday, May 23, 2018 8:22 AM
> To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>; openembedded-
> core@lists.openembedded.org
> Cc: Vineeth Karumanchi <VINEETHC@xilinx.com>
> Subject: [OE-core][PATCH] kernel-fitimage.bbclass: Deploy fitImage withou=
t rootfs
>=20
> This patch deploys fitimage without rootfs (linux.bin + dtb). This fitima=
ge can be
> used in case of rootfs on sperate partition.
>=20
> Signed-off-by: Vineeth Chowdary <vineeth.chowdary@xilinx.com>
> ---
>  meta/classes/kernel-fitimage.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index 50a91e1..7b93680 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -464,6 +464,9 @@ kernel_do_deploy_append() {
>  		linux_bin_base_name=3D"fitImage-linux.bin-${PV}-${PR}-
> ${MACHINE}-${DATETIME}"
>  		linux_bin_symlink_name=3DfitImage-linux.bin-${MACHINE}
>  		install -m 0644 linux.bin
> ${DEPLOYDIR}/${linux_bin_base_name}.bin
> +		fitimage_base_name=3D"fitImage-${PV}-${PR}-${MACHINE}-
> ${DATETIME}"
> +		fitimage_symlink_name=3DfitImage-${MACHINE}
> +		install -m 0644 arch/${ARCH}/boot/fitImage
> +${DEPLOYDIR}/${fitimage_base_name}.bin
>=20
>  		if [ -n "${INITRAMFS_IMAGE}" ]; then
>  			echo "Copying fit-image-${INITRAMFS_IMAGE}.its source
> file..."
> @@ -478,6 +481,7 @@ kernel_do_deploy_append() {
>  		cd ${DEPLOYDIR}
>  		ln -sf ${its_base_name}.its ${its_symlink_name}.its
>  		ln -sf ${linux_bin_base_name}.bin ${linux_bin_symlink_name}.bin
> +		ln -sf ${fitimage_base_name}.bin ${fitimage_symlink_name}.bin
>=20
>  		if [ -n "${INITRAMFS_IMAGE}" ]; then
>  			ln -sf ${its_initramfs_base_name}.its
> ${its_initramfs_symlink_name}.its
> --

Acked-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

Thanks,
Manju

