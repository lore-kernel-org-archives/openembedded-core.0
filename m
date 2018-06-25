Return-Path: <TOl@hms.se>
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0074.outbound.protection.outlook.com [104.47.2.74])
	by mail.openembedded.org (Postfix) with ESMTP id 57EA66FF7F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 14:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hms.se; s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=B/hy47nhsGTycJirDq//DK0DK7DQP3+dkOnNCVlyLqY=;
	b=PJboEYdy8uxNnKCXlCVWG37ypn4VJos3aLTcOVXgEhlV1NxfSeijEgOcRZHQSsXogel/kYlmZtXgFC/6JXSfP/quP9HUYCLoEMRlSGkZpvjGkiZBxSmJvHvE/beGtKdV4xgT6VGjsf9l2HFreW2pTXNT15bhcNs6T9mV1LQJDR8=
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com (10.168.57.16) by
	DB6PR0601MB2582.eurprd06.prod.outlook.com (10.168.81.139) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.884.23; Mon, 25 Jun 2018 08:51:37 +0000
Received: from DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::d0de:96:388f:ff51]) by
	DB6PR0601MB2133.eurprd06.prod.outlook.com
	([fe80::d0de:96:388f:ff51%2]) with mapi id 15.20.0884.024;
	Mon, 25 Jun 2018 08:51:37 +0000
From: Tobias Olausson <TOl@hms.se>
To: Andre McCurdy <armccurdy@gmail.com>
Thread-Topic: [OE-core] [oe-core][PATCHv4] image_types.bbclass: add optional
	size to ubi vols
Thread-Index: AQHUB99xVjrN9KN5CUagy9txV8XV+aRn6DgAgAFaM8SAAEHRAIAHLvKe
Date: Mon, 25 Jun 2018 08:51:37 +0000
Message-ID: <DB6PR0601MB21336F7A8CB14036C06506FCC34A0@DB6PR0601MB2133.eurprd06.prod.outlook.com>
References: <DB6PR0601MB2133CEC1B8D8FAB2DFC46118C3700@DB6PR0601MB2133.eurprd06.prod.outlook.com>
	<CAJ86T=UUz7_m+P1cWAk8tNT6Y=Cmme-2Jy3b4q8ZUkHzJwi1Gg@mail.gmail.com>
	<DB6PR0601MB2133389C83155E102AA5E6C1C3770@DB6PR0601MB2133.eurprd06.prod.outlook.com>,
	<CAJ86T=VVumy=u-OT9voyVJ-SBcO+tW=Pf-M8S5FXxHXzgVycsg@mail.gmail.com>
In-Reply-To: <CAJ86T=VVumy=u-OT9voyVJ-SBcO+tW=Pf-M8S5FXxHXzgVycsg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=TOl@hms.se; 
x-originating-ip: [88.131.56.168]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DB6PR0601MB2582;
	7:MB82dXuEEiLYk4wQierT5HjGDyJvTz/p3YbuxE+NwXQlk7AXnj2/cg3Qe42MwV+IY9fH1MlzhPb/t/Ujjb2DcAtP3VVeFdUluRr++n3vdA9Kad0dELIYMG4tMXBTSgIf9R8+X6NqzloPzaDhhu2oCMRr/0Y6qdumbQumQL2XgeS0nGvPoYdseTk5FgjP8RF5OaSquRzOgvo59vc1umSJaOEot+JnUk7iTIqrZ1aNkB92eb24EaH3PoNDQT1wKXqk
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 985afb79-066a-4b1a-d317-08d5da78dca9
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(7020095)(4652020)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600026)(711020)(2017052603328)(7153060)(7193020);
	SRVR:DB6PR0601MB2582; 
x-ms-traffictypediagnostic: DB6PR0601MB2582:
x-microsoft-antispam-prvs: <DB6PR0601MB2582D3ABDE104EDCE61F6FFEC34A0@DB6PR0601MB2582.eurprd06.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(264703809997249);
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3002001)(3231254)(944501410)(52105095)(149027)(150027)(6041310)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123562045)(20161123560045)(20161123564045)(20161123558120)(6072148)(201708071742011)(7699016);
	SRVR:DB6PR0601MB2582; BCL:0; PCL:0; RULEID:;
	SRVR:DB6PR0601MB2582; 
x-forefront-prvs: 0714841678
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(39850400004)(396003)(39380400002)(376002)(346002)(199004)(189003)(52314003)(52024003)(53546011)(7736002)(6506007)(102836004)(575784001)(6916009)(1720100001)(99286004)(76176011)(7696005)(5250100002)(5660300001)(97736004)(106356001)(3660700001)(9686003)(81166006)(6306002)(8676002)(81156014)(3280700002)(11346002)(476003)(6436002)(305945005)(74316002)(2906002)(86362001)(446003)(55016002)(66066001)(8936002)(486006)(316002)(105586002)(68736007)(229853002)(3846002)(53936002)(1411001)(93886005)(966005)(186003)(72206003)(26005)(6116002)(14454004)(25786009)(2900100001)(39060400002)(4326008)(33656002)(74482002)(6246003)(478600001)(42262002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DB6PR0601MB2582;
	H:DB6PR0601MB2133.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: hms.se does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: 8Hefx6UD/QMlqXo68A3srZOBj3jmTBySTF6E9HmfEGnHQgHdxWqudMnHYO/xYJu4QiZnJX4Y7FEqcA/aM+0VJE8XGVg7XjA+kz5OlPoFI8OWAhPNNhllaNC6AsWK5GWRWUWUGXF387vAf/BOn/oyW54UHPD1hwyWxZaLhhd7mDajwk61FWlM4lBmvnDxxN/FYM3/F8QNTG5ABadd4Eq1PriBaQUHM9Y9kWlHGhgaAtCIX8aEq9yx84ulHtCrEpdsXHZGh46OxcHYE0Hlm+gR4dZJWdZwsx3D2Oc0533Wd+eK8FfLtclxpAKHilfHFZb5nUYRmS3m2Thp7agwsOm8EGJZi7Km0cB/7oeHp1IeHps=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: hms.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 985afb79-066a-4b1a-d317-08d5da78dca9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2018 08:51:37.4591 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5c7c1590-4488-4e42-bc9c-15218f8ac994
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0601MB2582
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
X-List-Received-Date: Mon, 25 Jun 2018 14:25:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Just wanted to bump this, since I still see that v3 of this patch and not v=
4 (this one) is in master-next.

Cheers,
=20
Tobias Olausson
Development Engineer
HMS Industrial Networks AB


From: Andre McCurdy <armccurdy@gmail.com>
Sent: Wednesday, June 20, 2018 9:07 PM
To: Tobias Olausson
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [oe-core][PATCHv4] image_types.bbclass: add optional=
 size to ubi vols
=A0=20

On Wed, Jun 20, 2018 at 8:29 AM, Tobias Olausson <TOl@hms.se> wrote:
> Hey,
>
> Sorry for top posting. I have done some testing of this during the day, a=
nd it seems that this only works if you run "export MKUBIFS_ARGS_foo" and s=
imilar in whichever config file contains those settings (such as a machine =
conf).
>
> I would have preferred a combined shell/python solution, but that seems t=
o be trickier than I thought, since there is code in place that looks for I=
MAGE_CMD_multiubi specifically (in image.bbclass), and I have not been able=
 to override that. Any ideas of  making this work without the export hack a=
re welcome.

The general approach would probably be to use a single bitbake
variable with delimiters and then have the shell script split it. It's
not trivial though (especially since MKUBIFS_ARGS would need to
continue to be defined without delimiters in the non-multiubi case).

But anyway, the original multiubi code was merged without questioning
this so questioning it now is really just nitpicking. Either multiubi
doesn't actually have any users or they are all smart enough to
realise that these variables need to be exported to make them work.

(RP, note that you currently have the buggy v3 version of this patch
in master-next rather than the v4).

>
> Cheers,
>
>=A0 Tobias Olausson
>=A0 Development Engineer
>=A0 HMS Industrial Networks AB
>
>
> From: Andre McCurdy <armccurdy@gmail.com>
> Sent: Tuesday, June 19, 2018 8:33 PM
> To: Tobias Olausson
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core][PATCHv4] image_types.bbclass: add option=
al size to ubi vols
>
>
> On Tue, Jun 19, 2018 at 8:09 AM, Tobias Olausson <TOl@hms.se> wrote:
>> From 1d15f0d3c516351e6540a912367bcb22f9c25bbf Mon Sep 17 00:00:00 2001
>> From: Tobias Olausson <tol@hms.se>
>> Date: Mon, 18 Jun 2018 15:01:53 +0200
>> Subject: [oe-core][PATCHv4] image_types.bbclass: add optional size to ub=
i vols
>>
>> Instead of hard coding the ubi volume to be just large enough to fit the
>> root file system, one can use a variable to set a preferred size.
>>
>> Signed-off-by: Tobias Olausson <tol@hms.se>
>> ---
>>=A0 meta/classes/image_types.bbclass | 12 ++++++++++++
>>=A0 1 file changed, 12 insertions(+)
>>
>> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types=
.bbclass
>> index 00a00d318f..2a0a7994c9 100644
>> --- a/meta/classes/image_types.bbclass
>> +++ b/meta/classes/image_types.bbclass
>> @@ -164,10 +164,22 @@ multiubi_mkfs() {
>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 local vname=3D"_$3"
>>=A0=A0=A0=A0=A0=A0=A0=A0 fi
>>
>> +=A0=A0=A0=A0=A0=A0 # Set UBI_VOL_SIZE (for regular ubi) or UBI_VOL_SIZE=
_vname for multiubi
>> +=A0=A0=A0=A0=A0=A0 if [ -z "${vname}" ]; then
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 local ubi_vol_size=3D${UBI_V=
OL_SIZE}
>> +=A0=A0=A0=A0=A0=A0 else
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 eval local ubi_vol_size=3D\"=
\$UBI_VOL_SIZE${vname}\"
>
> This looks odd. Presumably it (and the multiubi code from which it's
> derived) relies on the _<VOLUMENAME> suffix variables
> (MKUBIFS_ARGS_foo, UBI_VOL_SIZE_foo, etc) being exported from bitbake
> to the shell?
>
> I didn't find any discussion about that from when the original
> multiubi code was merged though. Are there any multiubi users who can
> clarify?
>
>> +=A0=A0=A0=A0=A0=A0 fi
>> +
>>=A0=A0=A0=A0=A0=A0=A0=A0 echo \[ubifs\] > ubinize${vname}-${IMAGE_NAME}.c=
fg
>>=A0=A0=A0=A0=A0=A0=A0=A0 echo mode=3Dubi >> ubinize${vname}-${IMAGE_NAME}=
.cfg
>>=A0=A0=A0=A0=A0=A0=A0=A0 echo image=3D${IMGDEPLOYDIR}/${IMAGE_NAME}${vnam=
e}${IMAGE_NAME_SUFFIX}.ubifs >> ubinize${vname}-${IMAGE_NAME}.cfg
>>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_id=3D0 >> ubinize${vname}-${IMAGE_NAME}=
.cfg
>> +
>> +=A0=A0=A0=A0=A0=A0 if [ -n "${ubi_vol_size}" ]; then
>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 echo "vol_size=3D${ubi_vol_s=
ize}" >> ubinize${vname}-${IMAGE_NAME}.cfg
>> +=A0=A0=A0=A0=A0=A0 fi
>> +
>>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_type=3Ddynamic >> ubinize${vname}-${IMA=
GE_NAME}.cfg
>>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_name=3D${UBI_VOLNAME} >> ubinize${vname=
}-${IMAGE_NAME}.cfg
>>=A0=A0=A0=A0=A0=A0=A0=A0 echo vol_flags=3Dautoresize >> ubinize${vname}-$=
{IMAGE_NAME}.cfg
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
    =

