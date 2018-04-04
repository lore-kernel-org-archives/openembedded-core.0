Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0086.outbound.protection.outlook.com [104.47.33.86])
	by mail.openembedded.org (Postfix) with ESMTP id 6DA2974D1B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 18:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=IZ39yJ0OhRMqx8new1uusXdDS4UGuzs9FZF5qjtXVtk=;
	b=RzKYbmXVqQ1Kz7cO4CbP95Y1UxAXlY1ZlzV/9AVLkiKcWvU1nM4Uxw3FkScpmEj8kaFJuLkfwGcDL+i5K60fMM5vLOATxRHwms0IzROSsAAnwxbsgpq4AJBk2iGdptur8Q83l790advEbNY0Oj4eu+HK4Iy7bKLs9/+hdSgkl84=
Received: from BY2PR02MB347.namprd02.prod.outlook.com (10.141.140.149) by
	BY2PR02MB1347.namprd02.prod.outlook.com (10.162.80.12) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.631.10; Wed, 4 Apr 2018 18:27:59 +0000
Received: from BY2PR02MB347.namprd02.prod.outlook.com
	([fe80::fd3f:ad38:375:17af]) by BY2PR02MB347.namprd02.prod.outlook.com
	([fe80::fd3f:ad38:375:17af%13]) with mapi id 15.20.0631.013;
	Wed, 4 Apr 2018 18:27:53 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core][PATCH] package_manager.py: Skip gpgcheck while using
	dnf on target
Thread-Index: AQHTy4tKW1w/2Hu1yUeSSi6ILl744aPw7fTg
Date: Wed, 4 Apr 2018 18:27:52 +0000
Message-ID: <BY2PR02MB347EFB6CB0A95ABACA6EE59B9A40@BY2PR02MB347.namprd02.prod.outlook.com>
References: <1522787704-31367-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
In-Reply-To: <1522787704-31367-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BY2PR02MB1347;
	7:dcEiqWsvB4cFSVpHNzHSHg2SQo2Qt5MqRD4F+dkOOf6pmb19Vfp3KfxMf+YrcvT0BXZc4rLLVyZmrJ1MC6BT8IH8JGE79HwZ6kJ3mFXNX+nZRTI2FYL5N2X1msiBz4C5jnOO+dSwth7v8gF0x/nDmETmj3HuRhMsUwESdba67vAbPVoIZfh0M72NQoogscEJJ+eN1hI1l6scchFAucS5EPz36KEMEKamvd7PlPXSi9KITlmTEw502WAgpXhL/uen
x-ms-exchange-antispam-srfa-diagnostics: SOS;SOR;
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10009020)(346002)(396003)(366004)(39380400002)(39830400003)(376002)(53754006)(13464003)(199004)(189003)(25786009)(6436002)(2900100001)(316002)(476003)(59450400001)(478600001)(76176011)(5660300001)(11346002)(110136005)(446003)(14454004)(74316002)(53546011)(229853002)(99286004)(72206003)(7696005)(68736007)(6506007)(305945005)(33656002)(7736002)(26005)(5250100002)(3280700002)(81156014)(9686003)(3660700001)(6246003)(66066001)(102836004)(81166006)(105586002)(3846002)(53936002)(97736004)(55016002)(86362001)(2501003)(2906002)(8936002)(8676002)(106356001)(486006)(6116002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BY2PR02MB1347;
	H:BY2PR02MB347.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8230ca02-98be-4a0c-a40a-08d59a59c775
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(48565401081)(5600026)(4604075)(3008032)(2017052603328)(7153060)(7193020);
	SRVR:BY2PR02MB1347; 
x-ms-traffictypediagnostic: BY2PR02MB1347:
x-microsoft-antispam-prvs: <BY2PR02MB13479C6F2235041A9049CF82B9A40@BY2PR02MB1347.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(3231221)(944501327)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011);
	SRVR:BY2PR02MB1347; BCL:0; PCL:0; RULEID:; SRVR:BY2PR02MB1347; 
x-forefront-prvs: 0632519F33
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: VAypfUcpZgfE6LrSFEVDTxdHXPEs4yyrKEo1N+qZelzQ4uIEwalc41Lay/J8iwHCTKScY3TQkOTBFoowRhcyfhhwqToV9GfqrzPiLiYeNRZnOfxMFUW0AmDbUEG3Y67SBHUOG8w+SfdWW5rfmUS/CfGn6uhksKPq9IzXspAz/nD1CDz2sKE7kLv3dAO4IJg2iz0nQX+CkOeYba/EEy+BhgU+vTrNF+ceq99GWjvwSr7J2Is8uM7iJ4NCMz6kt29qwoDBq+Pe9bmQHY4lVdmMq6xnMA6RwPzJoEYGFFQktC7EFsDk6YwnOB1sYmCahOozQRgb0eqlKASXoan5vwDkWWihIL+K9jlOtaXR625Ie8n1btkk3s+OuyXUU6hp0DA6XXIscNO+X1t1ckAggBsKMFOlUe4xVgDLmJ7+eDv1pC8=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8230ca02-98be-4a0c-a40a-08d59a59c775
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2018 18:27:52.9123 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY2PR02MB1347
Subject: Re: [PATCH] package_manager.py: Skip gpgcheck while using dnf on target
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
X-List-Received-Date: Wed, 04 Apr 2018 18:28:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

> -----Original Message-----
> From: Manjukumar Matha [mailto:manjukumar.harthikote-matha@xilinx.com]
> Sent: Tuesday, April 03, 2018 1:35 PM
> To: openembedded-core@lists.openembedded.org
> Cc: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
> Subject: [OE-core][PATCH] package_manager.py: Skip gpgcheck while using d=
nf on
> target
>=20
> By default, RPM_SIGN_PACKAGES is not defined. Add gpgcheck=3D0 to oe-remo=
te-
> repo.repo file, otherwise dnf will complain during install operation on t=
arget
>=20
> Note, RPM_SIGN_PACKAGES is set only when you inherit sign_rpm explicitly
>=20
> Signed-off-by: Manjukumar Matha <manjukumar.harthikote-matha@xilinx.com>
> ---
>  meta/lib/oe/package_manager.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager=
.py
> index e006dc6..9f22fb0 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -674,7 +674,7 @@ class RpmPM(PackageManager):
>              gpg_opts +=3D 'repo_gpgcheck=3D1\n'
>              gpg_opts +=3D 'gpgkey=3Dfile://%s/pki/packagefeed-gpg/PACKAG=
EFEED-GPG-
> KEY-%s-%s\n' % (self.d.getVar('sysconfdir'), self.d.getVar('DISTRO'),
> self.d.getVar('DISTRO_CODENAME'))
>=20
> -        if self.d.getVar('RPM_SIGN_PACKAGES') =3D=3D '0':
> +        if self.d.getVar('RPM_SIGN_PACKAGES') !=3D '1':
>              gpg_opts +=3D 'gpgcheck=3D0\n'
>=20
>          bb.utils.mkdirhier(oe.path.join(self.target_rootfs, "etc", "yum.=
repos.d"))
> --

Any feedback/concerns on this patch?=20

Thanks,
Manju

