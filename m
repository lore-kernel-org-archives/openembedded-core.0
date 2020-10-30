Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.42])
 by mx.groups.io with SMTP id smtpd.web08.9229.1604036263122784306
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2020 22:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=INIXnCVU;
 spf=pass (domain: kpit.com, ip: 40.107.138.42, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTSoL7W8dTq3H4iael/j8oJxODmZorH2cRryHlJrBme69+HuCQNeF5U8G0Cq5br5q8A5J1FZQ8yphD38A1GV1d4lbbf+2jdtMvcLYFfHrh71ytt7oVTl5C/CYUXVCZ6QIP9dFLIc7Jf1ykNBbZR7byrN7Nr4wLHmGE1QJ+gs3Xsawpv6V7OKTcSd3MpQm09HRNeJhz6d2SLgLw8j5PuR6vt92vvpP69QX1Pym9IaXmvdny6iMwCw9MtoJfI594d+QBtzn44TjxozbPsSXabCgDJPVWg+eyk5APpi4ypaDGAPIyVGQ257bvU18BrrVYEDUyxLIBzmFSBrRBdVccX7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ayv5o2iIMV6Am/l+GVn1trJbUSpucCbEjwHXYFTTlQY=;
 b=RGypCjbLprDtF78i8Xm/uJ0baTL6Cx0LiHOHSsHZiY4tcg2Pc6GIMBtPVNtqRpWIQf4SQSVl1FGOII41GCSis0uCXuHboEKOwbBjKIJvY1J4Y8fb0foZql19sIMXjhOQWZ618j9tn3TrDVHh9PDHQzijXgCg8b4byEMuEpSSqV7PcGmBxLlX143u4hYFbBld4jGxA9qf04bx1SZJSNXih3ZBChw2HyVaO87CRzFEdzMOx7+LzWf49NV+byHtS8pyRo8AEkRps/dyGYA7y+9wNs7T2FSp//6qNSCIEzCpn/CKeBpJ2umtwkx65EtNjpxUVFtCfFddT6lbwv0XM4wRwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ayv5o2iIMV6Am/l+GVn1trJbUSpucCbEjwHXYFTTlQY=;
 b=INIXnCVUu9UJDk1gBnb6Sclvt12U0D5BTxd6fjJiolXCHy4MAov2QPH4y15G3VJfo3Zy0ctWHWeq0cdbeD2fXSHSNDN4M9/SZpS9KRSU8K3ieB6uuawugvWlcD4IfDZb9s3VkdsJ2JGJWV+fYCEaDkvKOQA72CiKr3ONk9HbxFM=
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BM1PR0101MB1986.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:27::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Fri, 30 Oct
 2020 05:37:34 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Fri, 30 Oct 2020
 05:37:33 +0000
From: "saloni" <saloni.jain@kpit.com>
To: Ross Burton <ross@burtonini.com>
CC: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>, Nisha Parrakat <Nisha.Parrakat@kpit.com>, Anuj Chougule
	<Anuj.Chougule@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] gnutls: Whitelisted CVE patches
Thread-Topic: [OE-core] [poky][master][PATCH] gnutls: Whitelisted CVE patches
Thread-Index: AQHWrU4zCGyFePm4l0S+Vf/Nw1Jx46munVaAgAEEqPY=
Date: Fri, 30 Oct 2020 05:37:33 +0000
Message-ID: 
 <BM1PR01MB401957465B5F861601F9C40D87150@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1603905435-21094-1-git-send-email-Saloni.Jain@kpit.com>,<CAAnfSTv=q44jBC3W9GRYLhoRZrh1NUJSnQk+5mAbbky5Dn8Ztw@mail.gmail.com>
In-Reply-To: 
 <CAAnfSTv=q44jBC3W9GRYLhoRZrh1NUJSnQk+5mAbbky5Dn8Ztw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: burtonini.com; dkim=none (message not signed)
 header.d=none;burtonini.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2409:4064:99e:6236:d806:3d95:4d13:ba9a]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8b88b2ba-6261-4dcf-0bc9-08d87c95e6d9
x-ms-traffictypediagnostic: BM1PR0101MB1986:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BM1PR0101MB1986CE24F9BD20DAD24A916287150@BM1PR0101MB1986.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 eTHZYvcQEQbs+ZV4MC4CalIuYXkRRPSsDNv7zHKchzEZ6xce9DvpQQz8a/w1YV7UGKnQVGyL4csR6D6pXhYo8M+9yGPQpcUill/cOgGoiyF7PBzr0yCfk1HTohMvUajj9Jg989ZKEUrHdWEAp3D2ZR0J0TnpUudFW70RUdxS13lUwFm71krD2+Tq+h+NushuvS7xTfTJ3Nj8BVGuVI4mGG7svfyxbKR+dSV/DiVif/+SYf+hYpXBIauJ9xrVV4GM24pH9pZ3vkZWeIEwTTIOGSPFtJ6loHG0J3RzxFEio3OICoEQaZkrgOu0Xl73RmdZ+mtixVuH8yP8hyk07g/LqzHzmkmKDGS6F+A1d27BItg+4ng1KpHt2s6YiaLz+FPcn55JALOseB/Txj5zFLpmxvtGqTkquk94j3XQ13SBMorao7e16OFEJeMZJxN7z04YoUfF1u4xq7uGQdCmMCWL1w==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(66446008)(66946007)(66556008)(76116006)(64756008)(66476007)(53546011)(5660300002)(33656002)(966005)(6916009)(45080400002)(478600001)(166002)(71200400001)(7696005)(55016002)(83380400001)(8936002)(107886003)(6506007)(18265965003)(2906002)(316002)(54906003)(8676002)(86362001)(19627405001)(66574015)(186003)(52536014)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 FY0pVDJNrqzKcY3YNDWGNNHgc7iqIGgv+Uq2mH4qpCWc0EDC9ye8D/8jlvMmOgjg2PR4HgNA1BAp3dFT1qE43NkZvq0Y/KWUu8kY1lJVrhP/8Lv881IurB4BUOpgC2JcLlgYSHi63aC/nWcmh/FUswCqa7faaQBvQRVd03H9XgsReaAfTatlQmZFQ8rJmx2QfwXtS/45buP7K1Z1QAP/+au6beHjvKvSuUN62Ij8MMByEjtjTH8AUY8MmoK8nlMoCfy4d7i8aFFNtBpfQ/FLuabd9Hx4XNSz+ipR6kuk6gNHNZNRBtDIrtK9I4nSDvKQY6NTIfq8QagSm9RDJIb6C8IBXIOO+9Q1K//GRwm9hJ+Tnxxhq/T13sWsjYFpVjWwV/SjbU4I8L0k53Gw+ehwudOYZBHDafzk4vLJSPADliw67exLo12bsl6b6l/MZdo7pOs0hARnO4lsYi1x64jor24/jINbTa1epShqcMX/g2EyOS/KgGXdR1kxDqih7ZVxAPkOjoJ2gtyuO/YFYOZb4EoAhWasI86PI1/EakkfMP8y4JSKuaBVJI+ultkZADQ0KBPVEkNH4Xi/NVk84wu24BovRTcwPAPg1l1J7BfnWPNYCfoHHCHZza/cpUttW01KZp03af8GpAAVgCza3G83vAkdd8fOtPtQCgkSUVu9wqweFJSWZjPw0SZiCfQtsnUxlGKRdRJYqPcA22oFWZm4dw==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b88b2ba-6261-4dcf-0bc9-08d87c95e6d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2020 05:37:33.2653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ffYu0yfgd+n+plDrOm6ZfAYtVHwowGJa+pvmJbu2Fof8x/d3CnRH1CVIY7mxuHNogBvZ6ZR5HWXCWN/msIbQ9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BM1PR0101MB1986
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB401957465B5F861601F9C40D87150BM1PR01MB4019INDP_"

--_000_BM1PR01MB401957465B5F861601F9C40D87150BM1PR01MB4019INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Ross,

Understood, I also had a discussion with Steve and doing a complete check =
for all the reported CVEs, and after gathering all the relevant information=
, will send request for Database Update.

Thanks & Regards,
Saloni
________________________________
From: Ross Burton <ross@burtonini.com>
Sent: Thursday, October 29, 2020 7:31 PM
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>; Khem Raj <raj.khem=
@gmail.com>; Nisha Parrakat <Nisha.Parrakat@kpit.com>; Anuj Chougule <Anuj.=
Chougule@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCH] gnutls: Whitelisted CVE patch=
es

Echoing what Steve says: where this is due to incorrect information in
the CVE database we should definitely fix the CVE database instead of
working around this in the recipes.  The only reason to whitelist in
the recipe is if the vulnerability is based on the build configuration
or we've decided that it's not relevant.

Ross

On Wed, 28 Oct 2020 at 17:17, saloni <saloni.jain@kpit.com> wrote:
>
> From: Saloni Jain <Saloni.Jain@kpit.com>
>
> Below CVE patches are whitelisted as changes
> are already present in source code:
> 1. CVE-2018-10844
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-10844&amp;data=3D04%7C01=
%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DIUHjGTABdWyfm21S2JYnDcBJ1JVhDBWIYOL8%2BHqOJLo%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgitlab.com%2Fgnutls%2Fgnutls%2Fcommit%2Fc32a8690f9f9b05994078fe9d2e7a41b1=
8da5b09&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e70=
8d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DbczWLVL1zm%2FnJKurrv50LqIbWhg3F%2FKIRzV=
Ef5DUKcE%3D&amp;reserved=3D0
> 2. CVE-2018-10845
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-10845&amp;data=3D04%7C01=
%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DMfb7lzixlhq2StFfp3jWUzyP6Kf6%2BmYmzE5e7iGyskQ%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgitlab.com%2Fgnutls%2Fgnutls%2Fcommit%2Fcc14ec5ece856cb083d64e6a5a8657323=
da661cb&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e70=
8d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D19eJZsU4QHOmrXYRRTHRs1SYMD3n3VBk9wIQDly=
kTI0%3D&amp;reserved=3D0
> 3. CVE-2018-10846
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-10846&amp;data=3D04%7C01=
%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e=
4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8e=
yJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&am=
p;sdata=3DeKamkR%2BOMPhaZmHERj4PbQDeAwjX2ePXPUvw%2FwxDgcE%3D&amp;reserved=
=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgitlab.com%2Fgnutls%2Fgnutls%2Fcommit%2Fce671a6db9e47006cff152d485091141b=
1569f39&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e70=
8d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DyivTKPgkmU1yzUYE4llzyiBt935ittt3uufrAOm=
H3G4%3D&amp;reserved=3D0
> 4. CVE-2018-16868
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgitlab.com%2Fgnutls%2Fgnutls%2F-%2Fmerge_requests%2F832&amp;data=3D04%7C0=
1%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DQ5RNFxjmUTFIvcIVFidJvArRKVGv271QDlNyINu7rA4%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%=
2Fgitlab.com%2Fgnutls%2Fgnutls%2F-%2Fcommit%2F4804febddc2ed958e5ae774de2a8f=
85edeeff538&amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb06=
4e708d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63739576895682=
8223%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik=
1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D39gGszLFMIbOCtI5V47gbThBh5sGSt%2FeF=
79PSpIYG9M%3D&amp;reserved=3D0
>
> Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-support/gnutls/gnutls_3.6.14.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/recipes=
-support/gnutls/gnutls_3.6.14.bb
> index 51578b4..727a12f 100644
> --- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> +++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb
> @@ -17,6 +17,9 @@ DEPENDS_append_libc-musl =3D " argp-standalone"
>
>  SHRT_VER =3D "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split(=
'.')[1]}"
>
> +#Changes are already present in source-code, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "CVE-2018-16868 CVE-2018-10844 CVE-2018-10845 =
CVE-2018-10845"
> +
>  SRC_URI =3D "https://apc01.safelinks.protection.outlook.com/?url=3Dhttp=
s%3A%2F%2Fwww.gnupg.org%2Fftp%2Fgcrypt%2Fgnutls%2Fv%24&amp;data=3D04%7C01%7=
Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637395768956838179%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3D%2BX0mUSC%2BOoWUD3TS4YNXDQrU6thiS642N1jHs3sOBQc%3D&amp;reserved=3D0=
{SHRT_VER}/gnutls-${PV}.tar.xz \
>             file://arm_eabi.patch \
>             file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICEN=
SE-f.patch \
> --
> 2.7.4
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

--_000_BM1PR01MB401957465B5F861601F9C40D87150BM1PR01MB4019INDP_
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
<div>Hello Ross,</div>
<div><br>
</div>
<div>Understood, I also had a discussion with Steve and doing a complete c=
heck for all the reported CVEs, and after gathering all the relevant inform=
ation, will send request for Database Update.<br>
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
tyle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Ross Burton &lt;ross=
@burtonini.com&gt;<br>
<b>Sent:</b> Thursday, October 29, 2020 7:31 PM<br>
<b>To:</b> Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<b>Cc:</b> OE-core &lt;openembedded-core@lists.openembedded.org&gt;; Khem =
Raj &lt;raj.khem@gmail.com&gt;; Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&=
gt;; Anuj Chougule &lt;Anuj.Chougule@kpit.com&gt;<br>
<b>Subject:</b> Re: [OE-core] [poky][master][PATCH] gnutls: Whitelisted CV=
E patches</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt=
;">
<div class=3D"PlainText">Echoing what Steve says: where this is due to inc=
orrect information in<br>
the CVE database we should definitely fix the CVE database instead of<br>
working around this in the recipes.&nbsp; The only reason to whitelist in<=
br>
the recipe is if the vulnerability is based on the build configuration<br>
or we've decided that it's not relevant.<br>
<br>
Ross<br>
<br>
On Wed, 28 Oct 2020 at 17:17, saloni &lt;saloni.jain@kpit.com&gt; wrote:<b=
r>
&gt;<br>
&gt; From: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt;<br>
&gt; Below CVE patches are whitelisted as changes<br>
&gt; are already present in source code:<br>
&gt; 1. CVE-2018-10844<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-10844&am=
p;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c1=
32472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DIUHjGTABdWyfm21S2JYnDcBJ1JVhDBWIYOL8%2BHq=
OJLo%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
ty-tracker.debian.org%2Ftracker%2FCVE-2018-10844&amp;amp;data=3D04%7C01%7Cs=
aloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am=
p;sdata=3DIUHjGTABdWyfm21S2JYnDcBJ1JVhDBWIYOL8%2BHqOJLo%3D&amp;amp;reserved=
=
=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Fgnutls%2Fgnutls%2Fcommit%2Fc32a8690f9f9b0599=
4078fe9d2e7a41b18da5b09&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C7=
8f127dc11024eb064e708d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DbczWLVL1zm%2FnJ=
Kurrv50LqIbWhg3F%2FKIRzVEf5DUKcE%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.com%2Fgnutls%2Fgnutls%2Fcommit%2Fc32a8690f9f9b05994078fe9d2e7a41b18da5b09&=
amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87=
c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DbczWLVL1zm%2FnJKurrv50LqIbWhg3F%2FKIRzV=
Ef5DUKcE%3D&amp;amp;reserved=3D0</a><br>
&gt; 2. CVE-2018-10845<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-10845&am=
p;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c1=
32472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DMfb7lzixlhq2StFfp3jWUzyP6Kf6%2BmYmzE5e7iG=
yskQ%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
ty-tracker.debian.org%2Ftracker%2FCVE-2018-10845&amp;amp;data=3D04%7C01%7Cs=
aloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am=
p;sdata=3DMfb7lzixlhq2StFfp3jWUzyP6Kf6%2BmYmzE5e7iGyskQ%3D&amp;amp;reserved=
=
=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Fgnutls%2Fgnutls%2Fcommit%2Fcc14ec5ece856cb08=
3d64e6a5a8657323da661cb&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C7=
8f127dc11024eb064e708d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D19eJZsU4QHOmrXY=
RRTHRs1SYMD3n3VBk9wIQDlykTI0%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.com%2Fgnutls%2Fgnutls%2Fcommit%2Fcc14ec5ece856cb083d64e6a5a8657323da661cb&=
amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87=
c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D19eJZsU4QHOmrXYRRTHRs1SYMD3n3VBk9wIQDly=
kTI0%3D&amp;amp;reserved=3D0</a><br>
&gt; 3. CVE-2018-10846<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2018-10846&am=
p;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c1=
32472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DeKamkR%2BOMPhaZmHERj4PbQDeAwjX2ePXPUvw%2F=
wxDgcE%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecuri=
ty-tracker.debian.org%2Ftracker%2FCVE-2018-10846&amp;amp;data=3D04%7C01%7Cs=
aloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;am=
p;sdata=3DeKamkR%2BOMPhaZmHERj4PbQDeAwjX2ePXPUvw%2FwxDgcE%3D&amp;amp;reserv=
ed=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Fgnutls%2Fgnutls%2Fcommit%2Fce671a6db9e47006c=
ff152d485091141b1569f39&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C7=
8f127dc11024eb064e708d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%=
7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2=
luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DyivTKPgkmU1yzUY=
E4llzyiBt935ittt3uufrAOmH3G4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.com%2Fgnutls%2Fgnutls%2Fcommit%2Fce671a6db9e47006cff152d485091141b1569f39&=
amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87=
c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CU=
nknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLC=
JXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DyivTKPgkmU1yzUYE4llzyiBt935ittt3uufrAOm=
H3G4%3D&amp;amp;reserved=3D0</a><br>
&gt; 4. CVE-2018-16868<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Fgnutls%2Fgnutls%2F-%2Fmerge_requests%2F832&a=
mp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c=
132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DQ5RNFxjmUTFIvcIVFidJvArRKVGv271QDlNyINu7=
rA4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.com%2Fgnutls%2Fgnutls%2F-%2Fmerge_requests%2F832&amp;amp;data=3D04%7C01%7C=
saloni.jain%40kpit.com%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3DQ5RNFxjmUTFIvcIVFidJvArRKVGv271QDlNyINu7rA4%3D&amp;amp;reserved=
=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgitlab.com%2Fgnutls%2Fgnutls%2F-%2Fcommit%2F4804febddc2ed=
958e5ae774de2a8f85edeeff538&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com=
%7C78f127dc11024eb064e708d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%=
7C0%7C637395768956828223%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIj=
oiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D39gGszLFMIb=
OCtI5V47gbThBh5sGSt%2FeF79PSpIYG9M%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitlab=
.com%2Fgnutls%2Fgnutls%2F-%2Fcommit%2F4804febddc2ed958e5ae774de2a8f85edeeff=
538&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb064e70=
8d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956828223=
%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haW=
wiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D39gGszLFMIbOCtI5V47gbThBh5sGSt%2FeF=
79PSpIYG9M%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
&gt; Signed-off-by: Saloni.Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-support/gnutls/gnutls_3.6.14.bb | 3 +++<br>
&gt;&nbsp; 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-support/gnutls/gnutls_3.6.14.bb b/meta/reci=
pes-support/gnutls/gnutls_3.6.14.bb<br>
&gt; index 51578b4..727a12f 100644<br>
&gt; --- a/meta/recipes-support/gnutls/gnutls_3.6.14.bb<br>
&gt; +++ b/meta/recipes-support/gnutls/gnutls_3.6.14.bb<br>
&gt; @@ -17,6 +17,9 @@ DEPENDS_append_libc-musl =3D &quot; argp-standalone=
&quot;<br>
&gt;<br>
&gt;&nbsp; SHRT_VER =3D &quot;${@d.getVar('PV').split('.')[0]}.${@d.getVar=
('PV').split('.')[1]}&quot;<br>
&gt;<br>
&gt; +#Changes are already present in source-code, hence whitelisted.<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2018-16868 CVE-2018-10844 CVE-201=
8-10845 CVE-2018-10845&quot;<br>
&gt; +<br>
&gt;&nbsp; SRC_URI =3D &quot;<a href=3D""></a>https://apc01.safelinks.prot=
ection.outlook.com/?url=3Dhttps%3A%2F%2Fwww.gnupg.org%2Fftp%2Fgcrypt%2Fgnut=
ls%2Fv%24&amp;amp;data=3D04%7C01%7Csaloni.jain%40kpit.com%7C78f127dc11024eb=
064e708d87c132472%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637395768956=
838179%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6=
Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D%2BX0mUSC%2BOoWUD3TS4YNXDQrU6=
thiS642N1jHs3sOBQc%3D&amp;amp;reserved=3D0{SHRT_VER}/gnutls-${PV}.tar.xz
 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://arm_eabi.patch">file://arm_eabi.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <a href=3D"file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENS=
E-f.patch">
file://0001-Modied-the-license-to-GPLv2.1-to-keep-with-LICENSE-f.patch</a>=
 \<br>
&gt; --<br>
&gt; 2.7.4<br>
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

--_000_BM1PR01MB401957465B5F861601F9C40D87150BM1PR01MB4019INDP_--
