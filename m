Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.43])
 by mx.groups.io with SMTP id smtpd.web12.6746.1617961208481720684
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Apr 2021 02:40:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=Qg97lw9M;
 spf=pass (domain: kpit.com, ip: 40.107.139.43, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EHUqHj2uENiw2kHuu9YaDjQk0yScFs7KZ37ptnrtsvbhzGxiPjvWtd4XwMsxithKdoTD2/2fgYrlvWvfPt50bBilhsOTJJo6HI2DDYAbFl+8mVXOfkK8UFotW2z31rg2CmQV/LuBVIjyO5GVwvHBsB19hEYVM9TewljWyObxhxM11b2ErXqoxM5Ow7xJCD+QfLMt8kSQw5eSubyzrmxwzNCuMUJuQhJa+AO+xr/OYyibHblVR6hAFEIiUMBLA7UducIn7dxyZD5sbN2xyDnv/K+JcBEebWhhuHFQKFywm9Zoe4yDvjGZjgR8Yl2DXfu3Zy1ecCmrIyVaIxPF5Bipmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPpdbMA4lM5ILdwZ4IU4Xcnul2dtR4bBk/jw6d/UDZQ=;
 b=CMS5VZWrFu+nYvK8rviwA6QGWa9o5JKdFT+Et8ZamWfTYnqLqRsqviMn7i6Yvk9/U4obmaG0N8KcKzr30HAxB5m35N/FXpFBg+M/1GJUlMPlkKtkBj5f4cAMmdHFdW6g1Z1dA9EwnCWldbBVDFaadiyKg++5mjZVMF8/UJDV8Rc3pCh1PasLS015nTCz6NnyK6CSVAD50/7/jOGbk4ZtOqaxhzgDpYKOnGtiqejAADXsDRunG3lBBRCHnWq+a/3zCpfitkFH8LzSvPFuoJnTjzSZnz5yQSXivtP9+vFVyAlGhUsrXk7YszjdlSH2dQwR/Y2V2fqzM2rk7M8CICvrGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPpdbMA4lM5ILdwZ4IU4Xcnul2dtR4bBk/jw6d/UDZQ=;
 b=Qg97lw9M+jkGl4GHafNrUiGmUcYNlLnAMxRSou/akZPOgt7f4TctbOlRKxE5jSA9RARgDuJ6ObrU/qjpNm2jmti10kcqZmWm37GUu+YZxf4ZVBRFrTSKnhzf/HVdir1pM9aQO7pKyqph1hjSMA9kxfP0wCfSQc9Z3UfBSuyTLvY=
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MA1PR01MB0748.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Fri, 9 Apr
 2021 09:39:57 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765%3]) with mapi id 15.20.4020.018; Fri, 9 Apr 2021
 09:39:57 +0000
From: "saloni" <saloni.jain@kpit.com>
To: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] fuse: Whitelisted CVE-2019-14860
Thread-Topic: [OE-core] [meta-oe][dunfell][PATCH] fuse: Whitelisted
 CVE-2019-14860
Thread-Index: AQHXLQqMpuxcx/PKHkardfZotFLwFKqrv5EAgAAqb8w=
Date: Fri, 9 Apr 2021 09:39:57 +0000
Message-ID: 
 <MA1PR01MB325765682C453F8ACCDCD8EF87739@MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <20210409063450.10269-1-Saloni.Jain@kpit.com>,<cebbde52208c872da797b2dea6574d7f8589d388.camel@intel.com>
In-Reply-To: <cebbde52208c872da797b2dea6574d7f8589d388.camel@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2409:4043:2c13:338c:1d97:ed82:39d:e405]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d023f99-d86e-494f-9ada-08d8fb3b7026
x-ms-traffictypediagnostic: MA1PR01MB0748:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MA1PR01MB0748034CEEEDFB3404E9A1C987739@MA1PR01MB0748.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eCYSYdxxkySZbTSxzQKkRs6HvSWpWgktaYnd/52qLuz5ugSkcbyOUzuPLlV1ooMqc85mNoGvcPOtZ7GtvivUIQcEi7FJPW3sglqGucInZDbGazo4NT5Xgou3soBqvTSun47C/yAbmW5iS43E2NCLDTYqTLvCGfjoQ7XGyw8kOXG/ONt7qtmZ//raiD9uezpEMncUQWnp89RNe6oQ4IVyXjmtPM03O0e8gyKyf3OlE3Ry3CmytjRgdzfte+VrQtZ2a11/AFC0xlAPKsokUbywx2Jl6s27IIo1pjdIJIMyGKq5+G1yjze2LZdsRb5TQx6UKYZa7U8eCPyYTGk+B4P0meoWcONbBfntdY9g+UJMspjcmlijSUeBn6sOAfLSVPfTKIV4E26jpwJ6hsIwsRoUf1tT49n/L9SU3aB7XIztp9KkXUJ0j88QTpBCucvkWOBponBhhapCVhWfm1nUIUyTbbo3Cu9jrCKMUNgp1PzXzBAa3fzYRGyOq1yMvm0211+COCQDdR9Iozmay5VMBN+K0mJouY4dSQvcL0sjLqEhbdRe0B9FpbPweTh68suFBtazR/rjXl/WfDxbTaxP5QAFQuUV2as0m1Bffa+L3Rmqo0+UwMEUPIa+8ghfjTn3uE82vsY8iflBDQ3M9UNM2Dtg5Gsn0nJrhAjnjoeRr88RJ7YRJWUvWALERmV/iLTJOi7q1qWSk2LnTMB2yo50afc4FDcvH4xRx1ksfaFjrV2gozxGYW05JRKanEo8ujCkSaYYkKr8YcguCeuEyifFOlMN4w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(366004)(346002)(136003)(66946007)(53546011)(2906002)(6506007)(7696005)(66574015)(166002)(4326008)(45080400002)(110136005)(52536014)(19627405001)(5660300002)(33656002)(8676002)(316002)(478600001)(83380400001)(86362001)(64756008)(966005)(66476007)(91956017)(66556008)(66446008)(76116006)(8936002)(55016002)(186003)(18265965003)(9686003)(107886003)(38100700001)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?JJNEjh4yfIQh9OzXAsDrFBACN8NPdQl0e14b+s+5kaiZKIWYSjnQH/R4ZXQy?=
 =?us-ascii?Q?vN3tCtsANL8MmjeEcjZ2WDt67M5CGMTxhvL645rVkjSiLfKPqFBmiaT+8UQJ?=
 =?us-ascii?Q?Rwq1BMMhBKIKPCfOIat0VQFC2qLxBElwPWxn//20c1TRvLwVVikih+sMnuEE?=
 =?us-ascii?Q?urV1QHKY5UgV0OkhoJokYOkmh+pRpNfT5kms+lmqr960UONEZ67c6HYvH4wU?=
 =?us-ascii?Q?71d9fzYNneWta/ZazZwDNklJ1CyXcq63lqItakcpgavavmMvZNh5EM5qcIh/?=
 =?us-ascii?Q?hEyGvLU+RAcwCf0/glZug9C9OAiUcHkCF88oyQbhqF1erUAmmo7zR1Ex7cYj?=
 =?us-ascii?Q?UaMBlw0P7/zUEuxhvwpEsUJKa/iIUKrRziI0qn6C27pbcUnPlyYw8F7PUPlT?=
 =?us-ascii?Q?yXJKfbT26ViAWtuLsrfjvAPIV6YA4QQxKWr+DwpJiEgWmWzYVCEYbaUOCK1a?=
 =?us-ascii?Q?Dce7Ptzx0h9aGuHCxxDwdh0iddDVuR+g/qVFp4iCITUwDDdMEj5g0wTLf43v?=
 =?us-ascii?Q?mljijAn594Dk6buNWHPF/JvnnI0Qia62SSiAuf2wPahEJNMqZLX2aPnnx8ph?=
 =?us-ascii?Q?TVQAnXFBLEXHLK1HATdQoyquFAOaB9OmKwF4Xh62hSJpkcj78D2YFooKXk2D?=
 =?us-ascii?Q?0yCE3FdxE8VuhLfvX8+npaTF9LKwPQghe+rhRkLOSPuCMVBj4qsR32pDwkiG?=
 =?us-ascii?Q?WpkC4+mz4WOoFAM785ZVVjAJ9GFlparkOSFs7gRjc/4q/TdFKn7GTRwHiaTV?=
 =?us-ascii?Q?flHm+j9hPhUxAVdjAM3Z96SznC7BhlKHQOJg22u8p/yl04ukzGUFcAaaqgPP?=
 =?us-ascii?Q?k9XFB/CSPMQOLb+52Ge74Hec2nLg1yuA7nmcVoW/yufUNdQKzReIw7UXaHrS?=
 =?us-ascii?Q?BlSjNyJC107jzCwFtVPzQEWDPsvpZfsiiWRZZZ0PzlIiUzHJQZo5nwkttr+W?=
 =?us-ascii?Q?0QwVbM2HuJf40cSClLUmW3waXsX3qG+z0K7QsHg8WnJJlQRVHbixDmGOG2qa?=
 =?us-ascii?Q?W8d/E9UlxtekuSX1K6aCztdBgXHENg6C1GjDoHTfCPU56a2QtI0rTRv9LdOZ?=
 =?us-ascii?Q?gVBjGq64Vx6DZFYGaQV9y08h2nbtanISEJNbRZAWDL4sb8ARp0y3FR6CoEAW?=
 =?us-ascii?Q?7EIQDEl0beX4Mx7CDAvXSsfEFBJovOrATEUKM8QExG0Xc5XOBnrg6ZBiZSX+?=
 =?us-ascii?Q?KE55uYOeNh9+iSwX44rBATDg+fzWoRsunmKvGff/Ss8Sd0W7FqRDfAlvlSim?=
 =?us-ascii?Q?pDC/g0C71kv6X+1Rk31jz8MvGJed4G8kXMrVSKdJFXV3VcGx8nT9NAPWdibB?=
 =?us-ascii?Q?pK6TT2rM1K47a2s/5CDnHzyYLPx62Q/CDYivYax7LeKTwaDRa5dPSM6nMVmx?=
 =?us-ascii?Q?xYf40uA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d023f99-d86e-494f-9ada-08d8fb3b7026
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2021 09:39:57.4296
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KdIW7MWhCyt4bKrDnwFKfped5HbeiGYuZNKOl36xoCmEHF1U5drwfL8IAqtqvjwrxhzGLXilZTMyXAAtdAU/Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB0748
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB325765682C453F8ACCDCD8EF87739MA1PR01MB3257INDP_"

--_000_MA1PR01MB325765682C453F8ACCDCD8EF87739MA1PR01MB3257INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Anuj,

Thankyou for the inputs. Will send another patch with version 2 in devel l=
ist.

Thanks & Regards,
Saloni
________________________________
From: Mittal, Anuj <anuj.mittal@intel.com>
Sent: Friday, April 9, 2021 12:21 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.open=
embedded.org>; Saloni Jain <Saloni.Jain@kpit.com>; raj.khem@gmail.com <raj.=
khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] fuse: Whitelisted CVE-201=
9-14860

This patch should go to openembedded-devel@lists.openembedded.org.

I think the correct solution here would be to add CVE_PRODUCT =3D
"fuse_project:fuse" in the recipe to differentiate it from
"redhat:fuse".

Thanks,

Anuj

On Fri, 2021-04-09 at 12:04 +0530, saloni wrote:
> CVE-2019-14860 is a REDHAT specific issue and
> was addressed for REDHAT Fuse products on
> Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
> REDHAT has also released the fix and updated their
> security advisories after significant releases.
> Hence, whitelited the CVE-2019-14860.
>
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Faccess.redhat.com%2Fsecurity%2Fcve%2Fcve-2019-14860&amp;data=3D04%7C01%7C=
saloni.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DtV7hFBfC9GEyCMZc97AEA%2FNG2VFBXAjh5WdRCiwvJCw%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Faccess.redhat.com%2Ferrata%2FRHSA-2019%3A3244&amp;data=3D04%7C01%7Csaloni=
.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DLnP1BW%2FvzhT1vFcTwB9nBwqy%2BmsiNN2aX6hSstd1YCA%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Faccess.redhat.com%2Ferrata%2FRHSA-2019%3A3892&amp;data=3D04%7C01%7Csaloni=
.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=
=3DVlLAdm2H%2Fu%2F9rLKV3Wj7hdHeMHJnR7sSovAIRflroqo%3D&amp;reserved=3D0
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> index 2c272d452..601232c6b 100644
> --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
> @@ -19,6 +19,10 @@ SRC_URI =3D
> "https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2Flibfuse%2Flibfuse%2Freleases%2Fdownload%2F%24&amp;data=3D04%7C01%=
7Csaloni.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DniPqtkGW3h%2BbJQXXMrM%2Fqm%2F2YB4Fty1oiXniQUyrjI8%3D&amp;reserved=
=3D0{BP}/${BP}.tar
> .
>  SRC_URI[md5sum] =3D "8000410aadc9231fd48495f7642f3312"
>  SRC_URI[sha256sum] =3D
> "d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b5"
>
> +# CVE-2019-14860 is a REDHAT specific issue and was addressed for
> REDHAT Fuse products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.
> +# REDHAT has also released the fix and updated their security
> advisories after significant releases.
> +CVE_CHECK_WHITELIST +=3D "CVE-2019-14860"
> +
>  UPSTREAM_CHECK_URI =3D "https://apc01.safelinks.protection.outlook.com/=
?url=3Dhttps%3A%2F%2Fgithub.com%2Flibfuse%2Flibfuse%2Freleases&amp;data=3D0=
4%7C01%7Csaloni.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C353945=
1eb46e4a26a242ff61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZ=
sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1=
000&amp;sdata=3DgjZBj5RhqtOdvvvH0uDpKtHvmpOaNV1%2F1s9RYmgx%2F3c%3D&amp;rese=
rved=3D0"
>  UPSTREAM_CHECK_REGEX =3D "fuse\-(?P<pver>2(\.\d+)+).tar.gz"
>
> --
> 2.17.1
>
> This message contains information that may be privileged or
> confidential and is the property of the KPIT Technologies Ltd. It is
> intended only for the person to whom it is addressed. If you are not
> the intended recipient, you are not authorized to read, print, retain
> copy, disseminate, distribute, or use this message or any part
> thereof. If you receive this message in error, please notify the
> sender immediately and delete all copies of this message. KPIT
> Technologies Ltd. does not accept any liability for virus infected
> mails.
>
>=20
>

This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print, retain copy, disseminate, distribute, =
or use this message or any part thereof. If you receive this message in err=
or, please notify the sender immediately and delete all copies of this mess=
age. KPIT Technologies Ltd. does not accept any liability for virus infecte=
d mails.

--_000_MA1PR01MB325765682C453F8ACCDCD8EF87739MA1PR01MB3257INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii=
">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-b=
ottom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Hi Anuj,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Thankyou for the inputs. Will send another patch with version 2 in devel l=
ist.<br>
</div>
<div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni <br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Mittal, Anuj &lt;anu=
j.mittal@intel.com&gt;<br>
<b>Sent:</b> Friday, April 9, 2021 12:21 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@=
lists.openembedded.org&gt;; Saloni Jain &lt;Saloni.Jain@kpit.com&gt;; raj.k=
hem@gmail.com &lt;raj.khem@gmail.com&gt;<br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [meta-oe][dunfell][PATCH] fuse: Whitelisted =
CVE-2019-14860</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">This patch should go to openembedded-devel@lists.=
openembedded.org.<br>
<br>
I think the correct solution here would be to add CVE_PRODUCT =3D<br>
&quot;fuse_project:fuse&quot; in the recipe to differentiate it from<br>
&quot;redhat:fuse&quot;.<br>
<br>
Thanks,<br>
<br>
Anuj<br>
<br>
On Fri, 2021-04-09 at 12:04 +0530, saloni wrote:<br>
&gt; CVE-2019-14860 is a REDHAT specific issue and<br>
&gt; was addressed for REDHAT Fuse products on<br>
&gt; Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.<br>
&gt; REDHAT has also released the fix and updated their<br>
&gt; security advisories after significant releases.<br>
&gt; Hence, whitelited the CVE-2019-14860.<br>
&gt; <br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Faccess.redhat.com%2Fsecurity%2Fcve%2Fcve-2019-14860&amp;a=
mp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f9=
91%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637535479248127831%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;amp;sdata=3DtV7hFBfC9GEyCMZc97AEA%2FNG2VFBXAjh5WdRCiwvJC=
w%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Faccess=
.redhat.com%2Fsecurity%2Fcve%2Fcve-2019-14860&amp;amp;data=3D04%7C01%7Csalo=
ni.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;s=
data=3DtV7hFBfC9GEyCMZc97AEA%2FNG2VFBXAjh5WdRCiwvJCw%3D&amp;amp;reserved=3D=
0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Faccess.redhat.com%2Ferrata%2FRHSA-2019%3A3244&amp;amp;dat=
a=3D04%7C01%7Csaloni.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3=
539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;amp;sdata=3DLnP1BW%2FvzhT1vFcTwB9nBwqy%2BmsiNN2aX6hSstd1YCA%3D=
&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Faccess=
.redhat.com%2Ferrata%2FRHSA-2019%3A3244&amp;amp;data=3D04%7C01%7Csaloni.jai=
n%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DLnP1BW%2FvzhT1vFcTwB9nBwqy%2BmsiNN2aX6hSstd1YCA%3D&amp;amp;reserved=3D0=
</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Faccess.redhat.com%2Ferrata%2FRHSA-2019%3A3892&amp;amp;dat=
a=3D04%7C01%7Csaloni.jain%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3=
539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTW=
FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3=
D%7C1000&amp;amp;sdata=3DVlLAdm2H%2Fu%2F9rLKV3Wj7hdHeMHJnR7sSovAIRflroqo%3D=
&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Faccess=
.redhat.com%2Ferrata%2FRHSA-2019%3A3892&amp;amp;data=3D04%7C01%7Csaloni.jai=
n%40kpit.com%7C6627a132de1241e7e00908d8fb23f991%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C637535479248127831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DVlLAdm2H%2Fu%2F9rLKV3Wj7hdHeMHJnR7sSovAIRflroqo%3D&amp;amp;reserved=3D0=
</a><br>
&gt; <br>
&gt; Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; ---<br>
&gt; &nbsp;meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 4 ++++<br=
>
&gt; &nbsp;1 file changed, 4 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb<br>
&gt; b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb<br>
&gt; index 2c272d452..601232c6b 100644<br>
&gt; --- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb<br>
&gt; +++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb<br>
&gt; @@ -19,6 +19,10 @@ SRC_URI =3D<br>
&gt; &quot;<a href=3D""></a>https://apc01.safelinks.protection.outlook.com=
/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibfuse%2Flibfuse%2Freleases%2Fdownload%=
2F%24&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C6627a132de1241e7e00=
908d8fb23f991%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375354792481278=
31%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DniPqtkGW3h%2BbJQXXMrM%2Fqm%2F2YB4=
Fty1oiXniQUyrjI8%3D&amp;amp;reserved=3D0{BP}/${BP}.tar<br>
&gt; .<br>
&gt; &nbsp;SRC_URI[md5sum] =3D &quot;8000410aadc9231fd48495f7642f3312&quot=
;<br>
&gt; &nbsp;SRC_URI[sha256sum] =3D<br>
&gt; &quot;d0e69d5d608cc22ff4843791ad097f554dd32540ddc9bed7638cc6fea7c1b4b=
5&quot;<br>
&gt; <br>
&gt; +# CVE-2019-14860 is a REDHAT specific issue and was addressed for<br=
>
&gt; REDHAT Fuse products on Red Hat Fuse 7.4.1 and Red Hat Fuse 7.5.0.<br=
>
&gt; +# REDHAT has also released the fix and updated their security<br>
&gt; advisories after significant releases.<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2019-14860&quot;<br>
&gt; +<br>
&gt; &nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://apc01.safelinks=
.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibfuse%2Flibfuse=
%2Freleases&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C6627a132de124=
1e7e00908d8fb23f991%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375354792=
48127831%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTi=
I6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DgjZBj5RhqtOdvvvH0uDpKtHvmpO=
aNV1%2F1s9RYmgx%2F3c%3D&amp;amp;reserved=3D0">https://apc01.safelinks.prote=
ction.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.com%2Flibfuse%2Flibfuse%2Frel=
eases&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C6627a132de1241e7e00=
908d8fb23f991%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6375354792481278=
31%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DgjZBj5RhqtOdvvvH0uDpKtHvmpOaNV1%2=
F1s9RYmgx%2F3c%3D&amp;amp;reserved=3D0</a>&quot;<br>
&gt; &nbsp;UPSTREAM_CHECK_REGEX =3D &quot;fuse\-(?P&lt;pver&gt;2(\.\d+)+).=
tar.gz&quot;<br>
&gt; <br>
&gt; --<br>
&gt; 2.17.1<br>
&gt; <br>
&gt; This message contains information that may be privileged or<br>
&gt; confidential and is the property of the KPIT Technologies Ltd. It is<=
br>
&gt; intended only for the person to whom it is addressed. If you are not<=
br>
&gt; the intended recipient, you are not authorized to read, print, retain=
<br>
&gt; copy, disseminate, distribute, or use this message or any part<br>
&gt; thereof. If you receive this message in error, please notify the<br>
&gt; sender immediately and delete all copies of this message. KPIT<br>
&gt; Technologies Ltd. does not accept any liability for virus infected<br=
>
&gt; mails.<br>
&gt; <br>
&gt; <br>
&gt; <br>
<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential a=
nd is the property of the KPIT Technologies Ltd. It is intended only for th=
e person to whom it is addressed. If you are not the intended recipient, yo=
u are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.
</body>
</html>

--_000_MA1PR01MB325765682C453F8ACCDCD8EF87739MA1PR01MB3257INDP_--
