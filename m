Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.41])
 by mx.groups.io with SMTP id smtpd.web11.7884.1617685659458383585
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 22:07:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=eKRZgBE1;
 spf=pass (domain: kpit.com, ip: 40.107.138.41, mailfrom: sana.kazi@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U33DxWK8mwgc+Hs3Dx8+6DaFbj7CBfNyHqwhyWL/Yv37E8yLnHjcEiqq+HpEmOQoX7x4cTP7KqYBQbbvdhWU3i/pCvcnyqQB5m6Ymo182KnebvYN1pMVCUOq418Mk0hGEGO+bHEawpd/pzzuHsudIRH2O7zB9PCNVOEwFapspXV3kgeDoKC/4D3iUs47fCsyXWOcmGthr/rMZg4T0qfgZKI3EPbGuIWmurLbT4rGKbx+ZMfYLR0zGIVAoxoTDiz0g21QWRANJqYPslJhGF0UwM6uW6Iih93PBpT1viC6RV9Zm7dox+m0e1zjWylulLpo0Ohy6S8EOqCT9I+Wj2z8Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xr5UUYdkBqkRuPdc+wSSIp/ZJ9Fd1prE1e0PUnYtfVE=;
 b=E62Pu9Q3WT+tqhfHVvQwbwssLTy8+lcSrEb5d1lkeVX1nbQ0PXAubJjXpp/jrhE3F3wXSUzNgR/IBxMwvCIdlo0pBO2gnZbdrXb3DcXjpuMdvD0BfTnEsOwtlHlXaDBsmJaDos8wlszftJ8W8LZhvukRvffWJ8utVOT93UUTnkS398tOXjuP2WiXVz2Slf7Bc7P77yeb0p9uPZYcCA3j2QrlKRjQPn8BQ0jWCnPW02qTAR+H9phN25cPL3EJeMxXECCf72f8UfzDomV3+Kh3insqwHiiPkC4kE2AHJhJl97i+9mq27WdHnxHBisMMnBSSiR6znoY/yEQjT8kRflZIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xr5UUYdkBqkRuPdc+wSSIp/ZJ9Fd1prE1e0PUnYtfVE=;
 b=eKRZgBE1Lpk+gpqySXK/6ktFV0C3IJVC8dVHG3Q42vCh4KxK3+jeADVb+97+aSve41up5H+xg1zlI6xl/mC6Z8na6ncVvP3QHxrAHCp4uz4y0oU/Ipjatkt4u/X4EfcmJD7xXOPs2h0619mfyX9eHKoSdZoITEWJYB00a2j3LgY=
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:58::17)
 by BMXPR01MB0821.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Tue, 6 Apr
 2021 05:07:34 +0000
Received: from BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da]) by BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::6922:7ba0:39e9:85da%7]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 05:07:34 +0000
From: "Sana Kazi" <Sana.Kazi@kpit.com>
To: Steve Sakoman <sakoman@gmail.com>
CC: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, Purushottam Choudhary
	<Purushottam.Choudhary@kpit.com>, Harpritkaur Bhandari
	<Harpritkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Whitelist CVE-2008-3844 and CVE-2020-15778
Thread-Topic: [OE-core] [poky][dunfell][PATCH] openssh: Whitelist
 CVE-2008-3844 and CVE-2020-15778
Thread-Index: AQHXKh/LvdOR0G2gj0m57NC9XF7Kdaqmg7GAgABtTb8=
Date: Tue, 6 Apr 2021 05:07:33 +0000
Message-ID: 
 <BMXPR01MB32219E974A7341B0BD7ECE7E99769@BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <20210405132946.22548-1-Sana.Kazi@kpit.com>,<CAGDS+nkyKZpj-Q8ux-bS+Cy3Hjm_sggNRFCLvboeV=dZZtfg8w@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nkyKZpj-Q8ux-bS+Cy3Hjm_sggNRFCLvboeV=dZZtfg8w@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2401:4900:5039:900f:75d5:b37f:f0b:e573]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7a665b21-c95b-4030-4828-08d8f8b9e39c
x-ms-traffictypediagnostic: BMXPR01MB0821:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BMXPR01MB0821093501197589384DEF3899769@BMXPR01MB0821.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZYr4aIJbofASdfIWObuW0HW99vLcFHcCz5fqgifUmy+3HcNGPdPOMQ50dV8TM5Smw16zuoNXzkxciRABElmCeJpEg0RyXEg/6lfZdPl9wNpIJn2741/gfDW5IEpF4c6QnY+xxox2u+J4dm0t0mXvaQ4oHTovaUGo4rQ4aftR5wTz00am0/n0O/bNfCofIwjt3U0qQ4o3yB6ephM4WLoPcEmonryOuy1EMyKSfYh6KeE3OoBH8qqNGLCcblWpdG1qZ/iRAYo2/D5OneJpKTl1vAgx1L6EXtY2ttTbYqAiXEKiLrvp5Mww2OYR77nOSmQQ/E0/IDWfKg8AVpiZgV7eph/M3jPiQepElmbZ8hKOXdt4JLApxk0PEFzwBKTo+Uzjql9P+uZ6kfJ5TSrUYCbBxosIk5wpharFAwKAwj9DLGIXmnzTtvZm76TuKfo7rJaksUt2NVb0AVdNUKv03S4DuymNvPytVuIrbzAfahtVTKKFJUxpeMQSqEzXlk+PJy6VN7zQ2F2ZsrkjZZy+09eRUIPpFgU1QZN9nZuKR+mUuwIFn7NNeXm1j6EmQZ0eh/95dtlJlEjqpvNvefKkbZqSv3tX4w7en2litubjHYHtM1k0cuLO1ZWPcFK3Kg5y2nY/Pe1ZbKGkFBrxEUQ+28D7uHADkmVZMeKUr64abZuC7Ezhy6w2eWRmpa1DsEdUObfhXRZKNWB9OQTLv/dB8+kStTgAYHBbBLaSDHrmpHp9a8s=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(39850400004)(366004)(346002)(53546011)(76116006)(6506007)(66476007)(66556008)(64756008)(66446008)(8936002)(45080400002)(107886003)(86362001)(19627405001)(33656002)(4326008)(38100700001)(83380400001)(52536014)(966005)(66574015)(55016002)(478600001)(5660300002)(316002)(2906002)(54906003)(6916009)(186003)(8676002)(7696005)(71200400001)(166002)(66946007)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?OxGywzze2Up9w4kvuLNBaki2qWr6BN0SGiYPG24AQsJNFSokhpUCvmWH5GPn?=
 =?us-ascii?Q?rZgSqVRLNI99B2fhXjX4TdW+iXe+K6yqupViNbKV3Zg/QyFMlcbE0KCMCsEf?=
 =?us-ascii?Q?9XOq/4jdPxeZTzfs4CFU1X28mMt7UWTf79UwfDEPspUKMsHAeX5Xw6UheFeC?=
 =?us-ascii?Q?8/WAlvAEbSmppcq/TSK5dM0MVsaUA0mWdnqC4B99G3rTCMIcDZd8MV8Msf/M?=
 =?us-ascii?Q?xh8HoPsAAGzGpBgYb8l/LFLy1Y15RwUgEZDbm0XaXIbXa+Uec2+INOgniwqx?=
 =?us-ascii?Q?KuJHGz3CZtf50OiS0FbQZzenzesoXHehrMhIPAruZSLvs8DFmpH1HqZJARSt?=
 =?us-ascii?Q?7ec/rw8akTXZ3B229zV6D8tH6vbE5ZpA4l9sebVTKLCXf3rJfhAcwz8p2s67?=
 =?us-ascii?Q?e2tF7ZKvMm7HM5vYfJe1mBe5kmcQ3J3ST8u3acWX5iVoDPPrEGS66Kcz3mmF?=
 =?us-ascii?Q?BXbJaqoFupTLGECe8uh45Jg1/kwX6zKsWjtf54yD7rrtfLnys3xOOvT6q8kA?=
 =?us-ascii?Q?Oq1KEFmy4aqQIv466tQSLIJKTEMUX5jdgY0WYuaoHnzBrk6FGPWmgRjMXRoo?=
 =?us-ascii?Q?mJLHcYpUrzXF7YbP+L6qEIPWfkYMwnV+YYKGKD/DVt4a6c6VUzt1+wCcMFkk?=
 =?us-ascii?Q?KZZTciTEp5mHnfZwO6Axjz/YIUASHoL7/aMHxper5Jl6kyg2ELzVHdLGMgzL?=
 =?us-ascii?Q?Iu9WCVvdjbGWV1zAIM6Fa9WCXqS+xYv9Cy7N1Y4N3zjYHT0BOyjTolR1RCsT?=
 =?us-ascii?Q?NsYgrgKUNKl4koKME5wtekKabOmY4XNGhwgZNrJ35bPgraZSvMdRA/MKfAPp?=
 =?us-ascii?Q?YOzi3q84Z4KdzM1tC6XM7fglOysMdB1iyq+0jpdDerb5tu0U5GH8WI0GzrJL?=
 =?us-ascii?Q?O/MH7nIRMxVom0Zu+kRvSyfNV8HxjYvrbHWu8S3jPsKLIX5qV4B4Tos/XAxm?=
 =?us-ascii?Q?KzgQDZmjCJ/NL1//6ll7c1NseuN78jRtgDj3WL/hCtYd7myY+3RbG0ALDmUC?=
 =?us-ascii?Q?LyOTVRxyMb6pPyvOy/oW7xLYmL1ynFGc4mLwqeIwtmrFcgI9kFIw2ITv8w8z?=
 =?us-ascii?Q?icUKCcuTvCrYep/vKegLvBJGAv9mQcMiqZxGB1EWHAUJAcK90a07r2SiKAXw?=
 =?us-ascii?Q?940D0viEzc1E/u25NAkgd16fkdnuI4CC9Nj7ajFdCz7LW0asfDfoTqzg3jzu?=
 =?us-ascii?Q?X+ydx/cu3C77EhOH7KlhIbT78YWeUBLtUuGq8JwjuQPd3DuBjjqFYgKkZGrP?=
 =?us-ascii?Q?3pPr8c1iOpd8QhbgyGuTuMJtdMr8BZ5K921RB8d3lvqLZglkgilBQdJ+869Y?=
 =?us-ascii?Q?wyH3mgz7527h26xL187gIYsWCxPdzNrUrTq0ueKjsIUtQn6yqgSxfDZPt6jb?=
 =?us-ascii?Q?Baiz2no=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB3221.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a665b21-c95b-4030-4828-08d8f8b9e39c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Apr 2021 05:07:33.1690
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OP5zXv9zpD3wMlQalNyZ+c9ECwvQaz3QREJoIF7+jO6tatIVzQXhBT4D+Zujf7sO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB0821
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB32219E974A7341B0BD7ECE7E99769BMXPR01MB3221INDP_"

--_000_BMXPR01MB32219E974A7341B0BD7ECE7E99769BMXPR01MB3221INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Whitelisted CVE-2020-15778 because it is reflected in recent CVE metrics w=
hich you mailed on Sunday.

 Thanks & Regards,

 Sana Kazi
 KPIT Technologies Limited

________________________________
From: Steve Sakoman <sakoman@gmail.com>
Sent: Tuesday, April 6, 2021 4:05 AM
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lis=
ts.openembedded.org>; Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nisha.=
Parrakat@kpit.com>; Purushottam Choudhary <Purushottam.Choudhary@kpit.com>;=
 Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Whitelist CVE-2008-=
3844 and CVE-2020-15778

On Mon, Apr 5, 2021 at 3:30 AM Sana Kazi <Sana.Kazi@kpit.com> wrote:
>
> Whitelisted below CVEs reported for openssh:
>
> CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
> and certain packages may have been compromised and has been fixed
> by Red Hat. This CVE is not applicable as our source is OpenBSD.
> Hence, this CVE  is not reported for other distros and
> can be whitelisted.
> Links:
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecu=
ritytracker.com%2Fid%3F1020730&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7C=
8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0=
%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV=
2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DAGj3kr88jZBCf2UPTY=
mok1x2orsmrY6AuLMBoTAmKSI%3D&amp;reserved=3D0
> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.=
securityfocus.com%2Fbid%2F30794&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%7=
C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%7C=
0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoi=
V2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DCNOSXhh%2BTAlkWkr=
nEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;reserved=3D0
>
> For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
> Hence, it can be whitelisted for 8.2p1

This explanation doesn't make sense to me!  If 8.2p1 is affected, why
are you proposing to whitelist it?

Steve

> https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.=
nist.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;data=3D04%7C01%7CSana.Kazi%40=
kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff6150285=
5c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMD=
AiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DOwC%2Fl=
t6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;reserved=3D0
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_8.2p1.bb
> index fe94f30503..f8037db986 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> @@ -32,6 +32,20 @@ SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af=
4dc36b41c12737619edff8bcebdff
>  # and when running in a Kerberos environment. As such it is not relevan=
t to OpenEmbedded
>  CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"
>
> +# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
> +# and certain packages may have been compromised and has been fixed
> +# by Red Hat. This CVE is not applicable as our source is OpenBSD.
> +# Hence, this CVE  is not reported for other distros
> +# and can be marked whitelisted.
> +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fs=
ecuritytracker.com%2Fid%3F1020730&amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DAGj3kr88jZBCf2U=
PTYmok1x2orsmrY6AuLMBoTAmKSI%3D&amp;reserved=3D0
> +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fw=
ww.securityfocus.com%2Fbid%2F30794&amp;data=3D04%7C01%7CSana.Kazi%40kpit.co=
m%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0=
%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQI=
joiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DCNOSXhh%2BTAlk=
WkrnEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;reserved=3D0
> +CVE_CHECK_WHITELIST +=3D "CVE-2008-3844"
> +
> +# For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
> +# Hence, it can be whitelisted for 8.2p1
> +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fn=
vd.nist.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;data=3D04%7C01%7CSana.Kazi=
%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DOwC%=
2Flt6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;reserved=3D0
> +CVE_CHECK_WHITELIST +=3D "CVE-2020-15778"
> +
>  PAM_SRC_URI =3D "file://sshd"
>
>  inherit manpages useradd update-rc.d update-alternatives systemd
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
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

--_000_BMXPR01MB32219E974A7341B0BD7ECE7E99769BMXPR01MB3221INDP_
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
Hi Steve,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">
Whitelisted&nbsp;<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Se=
goe UI Web (West European)&quot;, &quot;Segoe UI&quot;, -apple-system, Blin=
kMacSystemFont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14=
.6667px;background-color:rgb(255, 255, 255);display:inline !important">CVE-=
2020-15778
 because<span>&nbsp;it is reflected in recent CVE metrics which you mailed=
 on Sunday.</span></span></div>
<div>
<div id=3D"Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helv=
etica,sans-serif; font-size:; margin:0">
<div><br>
<span style=3D"color:rgb(81,167,249)"></span></div>
<div></div>
<div style=3D"text-align:start; background-color:rgb(255,255,255); font-si=
ze:11pt; font-family:Calibri,sans-serif; margin:0px">
<span lang=3D"en-IN" style=3D"margin:0px; font-size:9pt; font-family:Arial=
,sans-serif; color:rgb(81,167,249); background-color:white"></span><span st=
yle=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; background=
-color:white"><span style=3D"color:black; margin:0px; font-size:10pt; backg=
round-color:white">&nbsp;</span><span style=3D"margin:0px; font-size:10pt; =
background-color:white"><font color=3D"#003366">Thanks
 &amp; Regards,</font></span></span><span style=3D"margin:0px; font-size:1=
2pt; font-family:Arial,sans-serif; color:black; background-color:white"></s=
pan></div>
<div style=3D"margin:0px; font-size:15px; text-align:start; background-col=
or:rgb(255,255,255)">
<p style=3D"font-size:11pt; font-family:Calibri,sans-serif; margin:0px"><s=
pan style=3D"margin:0px; font-size:10pt; font-family:Arial,sans-serif; colo=
r:black; background-color:white">&nbsp;</span><span style=3D"margin:0px; fo=
nt-size:10pt; font-family:Arial,sans-serif; color:rgb(0,51,102); background=
-color:white">Sana
 Kazi<br>
<span style=3D"color:rgb(0,51,102); font-family:Arial,sans-serif; font-siz=
e:10pt">&nbsp;KPIT Technologies Limited</span><br>
</span></p>
</div>
<div><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" s=
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Steve Sakoman &lt;sa=
koman@gmail.com&gt;<br>
<b>Sent:</b> Tuesday, April 6, 2021 4:05 AM<br>
<b>To:</b> Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;Openembedde=
d-core@lists.openembedded.org&gt;; Khem Raj &lt;raj.khem@gmail.com&gt;; Nis=
ha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Purushottam Choudhary &lt;Puru=
shottam.Choudhary@kpit.com&gt;; Harpritkaur Bhandari &lt;Harpritkaur.Bhanda=
ri@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][dunfell][PATCH] openssh: Whitelist CV=
E-2008-3844 and CVE-2020-15778</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">On Mon, Apr 5, 2021 at 3:30 AM Sana Kazi &lt;Sana=
.Kazi@kpit.com&gt; wrote:<br>
&gt;<br>
&gt; Whitelisted below CVEs reported for openssh:<br>
&gt;<br>
&gt; CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux<br>
&gt; and certain packages may have been compromised and has been fixed<br>
&gt; by Red Hat. This CVE is not applicable as our source is OpenBSD.<br>
&gt; Hence, this CVE&nbsp; is not reported for other distros and<br>
&gt; can be whitelisted.<br>
&gt; Links:<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fsecuritytracker.com%2Fid%3F1020730&amp;amp;data=3D04%7C01%7CSana.=
Kazi%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3DAGj3kr88jZBCf2UPTYmok1x2orsmrY6AuLMBoTAmKSI%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
tytracker.com%2Fid%3F1020730&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%=
7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DAGj3kr88jZBC=
f2UPTYmok1x2orsmrY6AuLMBoTAmKSI%3D&amp;amp;reserved=3D0</a><br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fwww.securityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7CSana=
.Kazi%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242f=
f61502855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC=
4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sda=
ta=3DCNOSXhh%2BTAlkWkrnEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;amp;reserved=3D=
0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.se=
curityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DCNOSXhh%2BT=
AlkWkrnEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; For CVE-2020-15778 OpenSSH through 8.3p1 is affected.<br>
&gt; Hence, it can be whitelisted for 8.2p1<br>
<br>
This explanation doesn't make sense to me!&nbsp; If 8.2p1 is affected, why=
<br>
are you proposing to whitelist it?<br>
<br>
Steve<br>
<br>
&gt; <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;amp;data=3D04%7=
C01%7CSana.Kazi%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;amp;sdata=3DOwC%2Flt6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;amp=
;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.ni=
st.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;amp;data=3D04%7C01%7CSana.Kazi%=
40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502=
855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DO=
wC%2Flt6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;amp;reserved=3D0</a=
><br>
&gt;<br>
&gt; Signed-off-by: Sana Kazi &lt;Sana.Kazi@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 14 +++++++=
+++++++<br>
&gt;&nbsp; 1 file changed, 14 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/met=
a/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
&gt; index fe94f30503..f8037db986 100644<br>
&gt; --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
&gt; +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb<br>
&gt; @@ -32,6 +32,20 @@ SRC_URI[sha256sum] =3D &quot;43925151e6cf6cee14501=
90c0e9af4dc36b41c12737619edff8bcebdff<br>
&gt;&nbsp; # and when running in a Kerberos environment. As such it is not=
 relevant to OpenEmbedded<br>
&gt;&nbsp; CVE_CHECK_WHITELIST +=3D &quot;CVE-2014-9278&quot;<br>
&gt;<br>
&gt; +# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux<=
br>
&gt; +# and certain packages may have been compromised and has been fixed<=
br>
&gt; +# by Red Hat. This CVE is not applicable as our source is OpenBSD.<b=
r>
&gt; +# Hence, this CVE&nbsp; is not reported for other distros<br>
&gt; +# and can be marked whitelisted.<br>
&gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fsecuritytracker.com%2Fid%3F1020730&amp;amp;data=3D04%7C01%7CSa=
na.Kazi%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;s=
data=3DAGj3kr88jZBCf2UPTYmok1x2orsmrY6AuLMBoTAmKSI%3D&amp;amp;reserved=3D0"=
>
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
tytracker.com%2Fid%3F1020730&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com%=
7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%7=
C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjo=
iV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DAGj3kr88jZBC=
f2UPTYmok1x2orsmrY6AuLMBoTAmKSI%3D&amp;amp;reserved=3D0</a><br>
&gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fwww.securityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7CS=
ana.Kazi%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DCNOSXhh%2BTAlkWkrnEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;amp;reserved=
=
=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.se=
curityfocus.com%2Fbid%2F30794&amp;amp;data=3D04%7C01%7CSana.Kazi%40kpit.com=
%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DCNOSXhh%2BT=
AlkWkrnEpxS3v2p7JTwQH%2BL5idJyir1GOE%3D&amp;amp;reserved=3D0</a><br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2008-3844&quot;<br>
&gt; +<br>
&gt; +# For CVE-2020-15778 OpenSSH through 8.3p1 is affected.<br>
&gt; +# Hence, it can be whitelisted for 8.2p1<br>
&gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dh=
ttps%3A%2F%2Fnvd.nist.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;amp;data=3D0=
4%7C01%7CSana.Kazi%40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DOwC%2Flt6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;=
amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fnvd.ni=
st.gov%2Fvuln%2Fdetail%2FCVE-2020-15778&amp;amp;data=3D04%7C01%7CSana.Kazi%=
40kpit.com%7C8b8ab31f2f0142adf52e08d8f88323ea%7C3539451eb46e4a26a242ff61502=
855c7%7C0%7C0%7C637532589452091655%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw=
MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DO=
wC%2Flt6FcUUdt6aCUIk7mxk8a0QSC5%2F%2BLCX99yqZG2w%3D&amp;amp;reserved=3D0</a=
><br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-15778&quot;<br>
&gt; +<br>
&gt;&nbsp; PAM_SRC_URI =3D &quot;<a href=3D"file://sshd">file://sshd</a>&q=
uot;<br>
&gt;<br>
&gt;&nbsp; inherit manpages useradd update-rc.d update-alternatives system=
d<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt;<br>
&gt; This message contains information that may be privileged or confident=
ial and is the property of the KPIT Technologies Ltd. It is intended only f=
or the person to whom it is addressed. If you are not the intended recipien=
t, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part the=
reof. If you receive this message in error, please notify the sender immedi=
ately and delete all copies of this message. KPIT Technologies Ltd. does no=
t accept any liability for virus
 infected mails.<br>
&gt;<br>
&gt; <br>
&gt;<br>
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

--_000_BMXPR01MB32219E974A7341B0BD7ECE7E99769BMXPR01MB3221INDP_--
