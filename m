Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 7222 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 17 Jul 2019 17:35:40 UTC
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800044.outbound.protection.outlook.com [40.107.80.44])
	by mail.openembedded.org (Postfix) with ESMTP id 71B907C136
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 17:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MXxFISzI7FaxNEZFE91pfZLQMdNlipnoIx2I40dISEgaAOPJsbR5sjOYFXnhMT/M7gBN1x5X3j5D+n3N8vjUAsA3MldN8KttOiKKHp9itwCwE0gZCVEl53dpNYFIl53ucQG/w3Ch2v//HYN8DrqvNcGZboKAza+BMb9V4QZ+VPlFpkAgPG05lkXFM81lT/tnaWlUUupuOVEa8MB0wcr6V48rjq72240bP2B8rnd4QCb5gnkBgthVAoFUZ9aDf1ctrsh+v/W8POhzWm+Uob948IfPqfxoTRhi5Ia1jWRu3D2zuUKqqr2Eg09mKf3NrLStY6b76T1e1G047gq1jI8THQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9GVqNTuKlVbdQKLlbIpoW/kVBzhnOa70HN1ocdWqQPA=;
	b=gija0iXSsl2Vl0wYh1kP2wh5t95ohFLko8R2ya8VRrIp5Muq7/C5DOmavOgg/0lyrEXnau+ybpiCFHGpLSG8nxk6d8f63TK08DNRuyIbQFOyxTubcEmW1napuXn+DguFk0WUUXgJ8WE3EQambrRMuVTAh85sUyWvpkGUy5IavfLzJsJ275iT7QAq3rmkWO4x5LbpNDkNClhlssoWcicg3jP+XlXfki+E/lNQpW/CU1ur3SFqig90YyiB8KUiWUgSIVrYTqAmzivisRzYYwGk75LKpk1dGO0oNxpIyog7mfbx5YHo4RWDxrxMnAy4t7N0Bk9px+G0coXXVCrNXPs3oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
	smtp.mailfrom=xilinx.com;dmarc=pass action=none
	header.from=xilinx.com;dkim=pass header.d=xilinx.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=9GVqNTuKlVbdQKLlbIpoW/kVBzhnOa70HN1ocdWqQPA=;
	b=BiTwY7nA2rdOIIkt8ojf1gXgam9DFIE/HKck8jh2CRt3UIVvpjXob4y08k9RjhWMxj/rfnl5zKGXv62u+JEKgJ0kphItDrJ2U4+shKgiSLkhK2dPwkt5kyavhQ0TwM6ud6r6PasARdaRg61vlWdsXd7W/yPuAGWFcXkPNBRxlsc=
Received: from BYAPR02MB6005.namprd02.prod.outlook.com (20.179.89.140) by
	BYAPR02MB4887.namprd02.prod.outlook.com (52.135.234.161) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2073.10; Tue, 16 Jul 2019 20:40:19 +0000
Received: from BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::41b2:9de0:b783:b865]) by
	BYAPR02MB6005.namprd02.prod.outlook.com
	([fe80::41b2:9de0:b783:b865%7]) with mapi id 15.20.2073.012;
	Tue, 16 Jul 2019 20:40:19 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Ricardo Salveti <ricardo@foundries.io>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH] kernel-fitimage: include overlays with external dtb
Thread-Index: AQHVPBIG40VPOliyZUaG8CSKnSRN2KbNtKKA
Date: Tue, 16 Jul 2019 20:40:19 +0000
Message-ID: <BYAPR02MB6005B773FEACFC04FCE862D7B9CE0@BYAPR02MB6005.namprd02.prod.outlook.com>
References: <20190716200640.18414-1-ricardo@foundries.io>
In-Reply-To: <20190716200640.18414-1-ricardo@foundries.io>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e908f6c-b656-4e80-95ea-08d70a2dd126
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR02MB4887; 
X-MS-TrafficTypeDiagnostic: BYAPR02MB4887:|BYAPR02MB4887:|BYAPR02MB4887:|BYAPR02MB4887:
x-microsoft-antispam-prvs: <BYAPR02MB48871B453189D22ED215BD2CB9CE0@BYAPR02MB4887.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0100732B76
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(51914003)(199004)(189003)(13464003)(110136005)(476003)(11346002)(446003)(305945005)(81166006)(8676002)(81156014)(486006)(8936002)(86362001)(25786009)(52536014)(66066001)(229853002)(2906002)(2501003)(102836004)(76116006)(66946007)(3846002)(66556008)(66476007)(53936002)(71190400001)(66446008)(71200400001)(68736007)(7736002)(478600001)(64756008)(316002)(74316002)(99286004)(5660300002)(76176011)(6436002)(55016002)(256004)(9686003)(14454004)(186003)(26005)(6116002)(7696005)(33656002)(6246003)(53546011)(14444005)(6506007);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4887;
	H:BYAPR02MB6005.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5seZTKRPm5dYqQyNjE9W0s28RTd1IfDZebaSIPxWzJaVXHN/gGTjFTbi6ShSLsLfvlYJoOz9v6W6/QpYEQ8YVLnxFZJS1yluL/yPo6xCf1Ut2VxFHHzIM4TlADyItCvOLZ67dIjVxXg/aAtaQdMy2Bd18skrI+pYHGwlEOTcLoP6x+e4nMJx+OXfU3l5x+w7ihHLbgQYecR+l9bGah/O19x3HombzPnWv9O7tXNeRr6WBKGg0No+znwSgMRAZzMWEGTSlmzClXPMFAy5l9ZMkF3Eq0YwuWpboqR4MYgiKemNnG7h9+xxqOiGcRyeMPoM0LflxrNAUA8xDcGy2cUGJGdG00ML3QcqEcwTA2hiL6V8YvVoNUXKI8wTpAdqjRBzNkqiXm9TdzhUHI8x6SSuCcY9TjLuZ+3I57UxmSgv6e0=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e908f6c-b656-4e80-95ea-08d70a2dd126
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2019 20:40:19.4147 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: manjukum@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4887
X-OriginatorOrg: xilinx.com
Subject: Re: [PATCH] kernel-fitimage: include overlays with external dtb
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
X-List-Received-Date: Wed, 17 Jul 2019 17:35:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

> -----Original Message-----
> From: Ricardo Salveti <ricardo@foundries.io>
> Sent: Tuesday, July 16, 2019 1:07 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> Subject: [PATCH] kernel-fitimage: include overlays with external dtb
>=20
> As done with the default dtb provider, create fit image sections for norm=
al
> device-tree files and device-tree overlays (.dtbo).
>=20
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>

Thanks for the patch.

Acked-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>

> ---
>  meta/classes/kernel-fitimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index b51882dce4..17d4d85658 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -406,7 +406,7 @@ fitimage_assemble() {
>=20
>  	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
>  		dtbcount=3D1
> -		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb; do
> +		for DTBFILE in ${EXTERNAL_KERNEL_DEVICETREE}/*.dtb*; do
>  			DTB=3D`basename ${DTBFILE}`
>  			DTB=3D$(echo "${DTB}" | tr '/' '_')
>  			DTBS=3D"${DTBS} ${DTB}"
> --
> 2.22.0


