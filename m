Return-Path: <TOl@hms.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0088.outbound.protection.outlook.com [104.47.2.88])
	by mail.openembedded.org (Postfix) with ESMTP id 56F6F77103
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2018 16:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hms.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=m/awm/ssnKCtVUXqqAvh9ofbDaoEI2q7kd2XSheMStI=;
	b=r9y5AfhwO1IzszcD7MMKB/sL+SduSaa982GMy3mizkhSV/V6m6PQUpwXi/DUjLLnLmnd5eVRSWOa+mmCV99beTMOoYfHpbKyC51rVVqQ8FdRZkJlg0XyDjpM4ANzf4MrHYJyusuM3UCGW71iyUftYYdW+wHXEYHsOVQdYpus430=
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com (10.168.57.16) by
	DB6PR0601MB2661.eurprd06.prod.outlook.com (10.168.82.14) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.863.19; Wed, 20 Jun 2018 15:29:00 +0000
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d]) by
	DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::41fb:ec8e:a48:574d%2]) with mapi id 15.20.0863.016;
	Wed, 20 Jun 2018 15:29:00 +0000
From: Tobias Olausson <TOl@hms.se>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCHv4] image_types.bbclass: add optional
	size to ubi vols
Thread-Index: AQHUB99xVjrN9KN5CUagy9txV8XV+aRn6DgAgAFaM8Q=
Date: Wed, 20 Jun 2018 15:29:00 +0000
Message-ID: <DB6PR0601MB2133389C83155E102AA5E6C1C3770@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>,
	<CAJ86T=UUz7_m+P1cWAk8tNT6Y=Cmme-2Jy3b4q8ZUkHzJwi1Gg@mail.gmail.com>
In-Reply-To: <CAJ86T=UUz7_m+P1cWAk8tNT6Y=Cmme-2Jy3b4q8ZUkHzJwi1Gg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=TOl@hms.se; 
x-originating-ip: [88.131.56.168]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2661;
	7:uVWFLEwnL9D+mVqV1Ej/u7lNIBUN69ku4G41N998TcpPhv78Rgg4gkAPNfPa+5qYiZ3cO70O+9nrcHU+4tOEeQ066nSHnx7Yb+yBPI8EJto70It3waSWHiWrI3vmQ1GlCjHq0YrbbxJBtVE+uftupczeFki9ro6od8kmJFl/2gva4K7nFSilMhHJWxORXV6zWApkG3U+9cFf630Cpp9z6Xv+hGmJEHBwGllgBJyL1dYFC0BELEtx3UgoW84OLSNS
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 9b3767e5-f8e0-4961-f5e7-08d5d6c28c33
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(4534165)(4627221)(201703031133081)(201702281549075)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2661; 
x-ms-traffictypediagnostic: DB6PR0601MB2661:
x-microsoft-antispam-prvs: <DB6PR0601MB2661939CF7B21B6D90F925F0C3770@DB6PR0601MB2661.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(8121501046)(5005006)(10201501046)(3231254)(944501410)(52105095)(3002001)(93006095)(93001095)(149027)(150027)(6041310)(20161123560045)(20161123562045)(20161123558120)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2661; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2661; 
x-forefront-prvs: 070912876F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(346002)(396003)(39850400004)(39380400002)(52024003)(199004)(189003)(102836004)(446003)(186003)(66066001)(72206003)(476003)(486006)(53546011)(6506007)(316002)(5660300001)(11346002)(478600001)(8676002)(2900100001)(25786009)(74316002)(9686003)(305945005)(76176011)(74482002)(6916009)(26005)(106356001)(105586002)(6306002)(8936002)(4326008)(97736004)(3280700002)(1720100001)(39060400002)(3660700001)(1411001)(229853002)(81166006)(68736007)(575784001)(99286004)(2906002)(81156014)(6116002)(6246003)(53936002)(14454004)(3846002)(5250100002)(55016002)(86362001)(33656002)(6436002)(966005)(7736002)(7696005)(42262002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2661;
	H:DB6PR0601MB2133.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hms.se does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: w/OXIK/SjXM/zarR1eLpIyuqPYCMjnJuOqeS5lR+JQSPRCeuSV8Ro+O9SjeQtPhbch+ka24fTxfH39lZu3XdpYqASL33/johdo40/qOb5GmVSxK/jEhfqknov9SsObdJ5Z0dkF3vztBauvQ6dGY1e/tTRtU9jBvXibQ6N+ptf37tf8DVA4CGt6eXoMQw6YqdE0Xw4UAtlB4s9QMLMMIzSEgN2Joe/Zl/FModdI6zbDPOceR+6dHir+AJZbCaJ1TCzxMb7q2gHqbZHXWY6vu/bk+8GzoUXLBVu9oC6TN/EqvjAof7wxzGV+3TvSoV7yJJNgee694U3xcTAN3PLs5DJg==
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hms.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b3767e5-f8e0-4961-f5e7-08d5d6c28c33
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2018 15:29:00.6383 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7c1590-4488-4e42-bc9c-15218f8ac994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2661
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] image_types.bbclass: add optional size to ubi vols
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
X-List-Received-Date: Wed, 20 Jun 2018 16:02:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hey,

Sorry for top posting. I have done some testing of this during the day, and=
 it seems that this only works if you run "export MKUBIFS_ARGS_foo" and sim=
ilar in whichever config file contains those settings (such as a machine co=
nf).

I would have preferred a combined shell/python solution, but that seems to =
be trickier than I thought, since there is code in place that looks for IMA=
GE_CMD_multiubi specifically (in image.bbclass), and I have not been able t=
o override that. Any ideas of making this work without the export hack are =
welcome.

Cheers,
=20
 Tobias Olausson
 Development Engineer
 HMS Industrial Networks AB


From: Andre McCurdy <armccurdy@gmail.com>
Sent: Tuesday, June 19, 2018 8:33 PM
To: Tobias Olausson
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [oe-core][PATCHv4] image_types.bbclass: add optional=
 size to ubi vols
=A0=20

On Tue, Jun 19, 2018 at 8:09 AM, Tobias Olausson <TOl@hms.se> wrote:
> From 1d15f0d3c516351e6540a912367bcb22f9c25bbf Mon Sep 17 00:00:00 2001
> From: Tobias Olausson <tol@hms.se>
> Date: Mon, 18 Jun 2018 15:01:53 +0200
> Subject: [oe-core][PATCHv4] image_types.bbclass: add optional size to ubi=
 vols
>
> Instead of hard coding the ubi volume to be just large enough to fit the
> root file system, one can use a variable to set a preferred size.
>
> Signed-off-by: Tobias Olausson <tol@hms.se>
> ---
>=A0 meta/classes/image_types.bbclass | 12 ++++++++++++
>=A0 1 file changed, 12 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.=
bbclass
> index 00a00d318f..2a0a7994c9 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -164,10 +164,22 @@ multiubi_mkfs() {
>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 local vname=3D"_$3"
>=A0=A0=A0=A0=A0=A0=A0=A0 fi
>
> +=A0=A0=A0=A0=A0=A0 # Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE_=
vname for multiubi
> +=A0=A0=A0=A0=A0=A0 if [ -z "${vname}" ]; then
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 local ubi_vol_size=3D${UBI_VO=
L_SIZE}
> +=A0=A0=A0=A0=A0=A0 else
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 eval local ubi_vol_size=3D\"\=
$UBI_VOL_SIZE${vname}\"

This looks odd. Presumably it (and the multiubi code from which it's
derived) relies on the _<VOLUMENAME> suffix variables
(MKUBIFS_ARGS_foo, UBI_VOL_SIZE_foo, etc) being exported from bitbake
to the shell?

I didn't find any discussion about that from when the original
multiubi code was merged though. Are there any multiubi users who can
clarify?

> +=A0=A0=A0=A0=A0=A0 fi
> +
>=A0=A0=A0=A0=A0=A0=A0=A0 echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.cf=
g
>=A0=A0=A0=A0=A0=A0=A0=A0 echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}.=
cfg
>=A0=A0=A0=A0=A0=A0=A0=A0 echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vname=
}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}.=
cfg
> +
> +=A0=A0=A0=A0=A0=A0 if [ -n "${ubi_vol_size}" ]; then
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "vol_size=3D${ubi_vol_si=
ze}" >> ubinize${vname}-${IMAGE_NAME}.cfg
> +=A0=A0=A0=A0=A0=A0 fi
> +
>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_type=3Ddynamic >> ubinize${vname}-${IMAG=
E_NAME}.cfg
>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname}=
-${IMAGE_NAME}.cfg
>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_flags=3Dautoresize >> ubinize${vname}-${=
IMAGE_NAME}.cfg
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
    =

