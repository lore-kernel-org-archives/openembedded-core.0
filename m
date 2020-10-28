Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.51])
 by mx.groups.io with SMTP id smtpd.web08.11390.1603901506064644827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 09:11:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=gcRs/pG1;
 spf=pass (domain: kpit.com, ip: 40.107.138.51, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L5q/vwdIVg9i/GvzvizEJCeeEZzcZgWHFOh2wNqxKanaHirvhw/R3gGQjwOGXFdad5O+vWK9eKL8f5JipcKfxfj9bnrSLOx/9micwlv8WfUx8HEGvlDVO1RHKaU2UYctsyHVnRx5nE/+I7t5wTmZ+S4k8gK6xJF1B/e7KlwOz8kf7jAc9+gpmaJsqBoPTjuA3R49l2LvjRTY8S5kTDbjpeIiN2PsSRMFkof84snysYYGTvnru+Y2p2nusDHmKkEtqz4Tmi725OsLA0MuitZuRmSj/SFR3NUXPuc1On4hAG89zM/ML5dCT0N42hfM8ReghnHBNI0597mwy4hXhR34Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfcw+sq6yQw0bIvJkFuxtFMCP43SACgcluLwlX6t/oI=;
 b=LO6VqZ8S19OmQbDTZO6uvg8WWdI21mdSKJyJeXZO7ELrJBx8cFDWL8UlYPhA/SDZPVhueuKtINEn4SzaFkhohEzYZZtQvJAGaLR85yFUxrhz7Dhx7anVGgGdos642leDjL0D5Z79nEIc7z2t6aK74OOY1R98dUOVLFbLlnwb6zQ3L4JO8RRxCcoCIoV0XzajVCs0FwMeGI2gKNH2WnmfsoGEdKykkjC0c+dQopCZFQvoTJM1MfRyOMDCw5B5VAwW2qxW6NevzOizBeqWz4SdEp2OQTHJVyT7r8+LNBip7Ay/eUdBdfHnMZLiGQhGN9VnWoUM+PR6ESFyKhaAR05YWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jfcw+sq6yQw0bIvJkFuxtFMCP43SACgcluLwlX6t/oI=;
 b=gcRs/pG1Y55mFHr5+Ho5WwU0J6Raj5qjXo4RP1jsU+LBDB+bsOUg2oI1x7ZQg1nvrI9HL41WfHpe/nqnnZF1Updw/brckSJRw7vQaSycxQ0mr69i/R131YRIk+PLqVAo/lFYllAzXU2YOVJPGvWcmvXtozmC5rrMmVnbHq3O7l8=
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:74::20)
 by BMXPR01MB2245.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:3d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24; Wed, 28 Oct
 2020 16:11:42 +0000
Received: from BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3]) by BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::200c:7e58:5a42:f5f3%7]) with mapi id 15.20.3477.028; Wed, 28 Oct 2020
 16:11:42 +0000
From: "saloni" <saloni.jain@kpit.com>
To: Khem Raj <raj.khem@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Nisha Parrakat
	<Nisha.Parrakat@kpit.com>, Anuj Chougule <Anuj.Chougule@kpit.com>
Subject: Re: [poky][master][PATCH] glibc: Added and whitelisted CVE patches
Thread-Topic: [poky][master][PATCH] glibc: Added and whitelisted CVE patches
Thread-Index: AQHWrT5tpdDl8D1G/kGccFCAXypwv6mtKpSAgAAEhT8=
Date: Wed, 28 Oct 2020 16:11:41 +0000
Message-ID: 
 <BM1PR01MB4019D5A3C0041EDFD8E28A0387170@BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <1603898660-15302-1-git-send-email-Saloni.Jain@kpit.com>,<CAMKF1sr2NZyQzTaGK4mi2nntcnPq_DNrUE2aYavrgkWUfK29LA@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sr2NZyQzTaGK4mi2nntcnPq_DNrUE2aYavrgkWUfK29LA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2409:4043:215:ea7d:104f:98c0:299:6b11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5226a54d-a69c-47ed-fe63-08d87b5c28a3
x-ms-traffictypediagnostic: BMXPR01MB2245:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BMXPR01MB2245995AFE7F8143723BB54F87170@BMXPR01MB2245.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 kIh3jhOWQwu4/S66/biERe5tlEiOQyZ0/2bPF3/9MQby37ryMOxRv+3lLrJ3RnQj8vNDZMACdGkpxmkjWr/9pG+TwRu04jOk8r4zmBZJp3HoGfqMJZn6hlHuOxHCzfB5fcJltWjDYYS97igmGZ3GXxAoi4JNHwHxdQvVW40dPEIJLAvi66UEvKNUxmQujJ9okPntXXRvXhG5BcbaoVlxSmmR2RmbKlBRF3v5d1E0M7c6ojDTXhgp6ZjLATrsNtD6/9FjCQH5cnEmTx5VAUgO6wqTHWv5CO3oSCTF21P6AJ+k5Fg4cwqhi0EePAtknb4CmyJA/SrDlr4eOEROaeAGhNxsU6LRw8DO8qza362FCyDVFlT0T/8tO5DBpr8Y8ZWS9qiNvFENMd2X28tZWI+KAQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(346002)(39850400004)(366004)(136003)(396003)(376002)(66476007)(86362001)(7696005)(76116006)(45080400002)(30864003)(66556008)(19627405001)(478600001)(66446008)(66946007)(54906003)(52536014)(316002)(5660300002)(64756008)(83380400001)(186003)(66574015)(166002)(8936002)(4326008)(966005)(53546011)(6916009)(107886003)(55016002)(9686003)(33656002)(71200400001)(8676002)(6506007)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 5t2IznPN5/rCdbi/vQ6tddbJ4pAg0BSaKlIdRZ/f02TFsXhgJYckZh4JUKMTN4AyzcOHnr9PbU8pZ9o8wNmyi3HZTGBz/GX5e20Ovh3BrGsY7LWinJGpdhaR+Zu+rppTfXsRKELJtbmlTMWPY2+IbaKcRBEjXtntgZRhin8Kofqf5GNCUddtcJ3wU+wEUGRlnvE1arb2MWWcuxNKRq33XnMfyzGP20fX/z1hprZICwcOvtdoqj0vt2XWKUrdF6Eik/10HCFkHOJNTQLPoNQHmyKot6mLe7WYUyX3qzKAcgXz4ibuuJVRMwSEFz/sIVMRZZE6wmHRUb/E42ILg7ay9CmM61CpLagdf6K4UQOY9u8i057bN97MeVvTBXrWuVQsMzfv+tJmpijBMsJ9HevcstNeLjMsnSMfuI2dEj/NCU8Jvcp+pGLkDO3x0NnvDQXLPO0puMHaplc66Zot0fIuOfRprdAcEuZotRkMCvLzkbgb+7DeAkjz6ffUBA+AgNGzHVghUguKQ6mNxi6rp7PYugVPHobJdrxO8V/X+ocxdFl65D1ezqVYKIbXgauapSKeAW3l0/AqVXHWEa8ViGzg/sf0fMkuKeVk/LoSQ8oiNbUHAVz/Yqcqhra8Y26KGAEgviMAIsXiYLrfCSG+ZBVUYiHQK3N2eAOlRBuheE8P3bhVoIBcMnCOnN59WtSvPBvXUvbjaYEfXaEBM9cw4c283A==
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BM1PR01MB4019.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 5226a54d-a69c-47ed-fe63-08d87b5c28a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2020 16:11:41.9560
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: a02fh79anlj3TWIzA6GhwZP5WFrWum3mFRftBKY9PKUa1BxY/PX8wFoKg2joSbwaYYK2wjU4fvxrO8lc+OA1fA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB2245
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BM1PR01MB4019D5A3C0041EDFD8E28A0387170BM1PR01MB4019INDP_"

--_000_BM1PR01MB4019D5A3C0041EDFD8E28A0387170BM1PR01MB4019INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Khem Raj,

Thankyou for the feedback! I have removed the line and resent the patch aga=
in.

Thanks & Regards,
Saloni
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Wednesday, October 28, 2020 9:23 PM
To: Saloni Jain <Saloni.Jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@list=
s.openembedded.org>; Nisha Parrakat <Nisha.Parrakat@kpit.com>; Anuj Chougul=
e <Anuj.Chougule@kpit.com>
Subject: Re: [poky][master][PATCH] glibc: Added and whitelisted CVE patches

On Wed, Oct 28, 2020 at 8:24 AM Saloni.Jain <Saloni.Jain@kpit.com> wrote:
>
> From: Saloni Jain <Saloni.Jain@kpit.com>
>
> Below CVE patches are whitelisted as not considered
> as security threats by Upstream Community:
> 1. CVE-2019-1010022
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010022&amp;data=3D04%7C0=
1%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DGZrfiAc1LbOzRBhzHSF71pISmLVQMDPsVNbOKNwFU2I%3D&amp;reserved=3D0
> 2. CVE-2019-1010023
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010023&amp;data=3D04%7C0=
1%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3D%2BPOMtxzlSMSjRcWkyeUu1DDRNpbdCFVDHi2Oii9O0KE%3D&amp;reserved=3D=
0
> 3. CVE-2019-1010024
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010024&amp;data=3D04%7C0=
1%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DfxoI1KYiNprzTwp0Vxk52pj4iogBnVELj6FnwZ7%2Fk8I%3D&amp;reserved=3D=
0
> 4. CVE-2019-1010025
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010025&amp;data=3D04%7C0=
1%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;sdata=3DBIbL1ikyInBgRszvevPWGrd%2BSOBfn5F12SggpyRPli8%3D&amp;reserved=3D=
0
>
> Below CVE patches are whitelisted as the changes are
> already present in the source-code:
> 1. CVE-2020-1751
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-1751&amp;data=3D04%7C01%7=
CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DYmyZ99RzofIHU5W9tNWv2suNJbaRKApRFEFKx9Ti%2FPU%3D&amp;reserved=3D0
> 2. CVE-2020-1752
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-1752&amp;data=3D04%7C01%7=
CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DPENgTh%2BpLaH1AjJlE5egqVUJBE5USv0WUnbe2QwF0fc%3D&amp;reserved=3D0
> 3. CVE-2020-6096
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-6096&amp;data=3D04%7C01%7=
CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DeBPUmapGobfXsK%2BzzwLVXYye8BUdkNauhyjrMXEx4Xc%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1820331&amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3DPxa8ikANO59wq50c8drqvxv2lBraBpgzxPdAT3UMm7w%3D&amp;reserved=3D0
> 4. CVE-2015-8985
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-8985&amp;data=3D04%7C01%7=
CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3DqgjqafPVHgLephuiU1W6LPeFj9W6aAQIN09tmRCBZTo%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3Deb04c21373e2a288=
5f3d52ff192b0499afe3c672&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb=
760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DwlG6FyH%2FyJmFCsbXlPBn=
4t2uS3XWeTWwow83Mm4T5AU%3D&amp;reserved=3D0
> 5. CVE-2016-10739
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-10739&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DRo4S9ljtCEB36VKsEHQuSw541C%2FNhmidMiH6b%2F4qlM0%3D&amp;reserved=3D=
0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D108bc4049f8ae827=
10aec26a92ffdb4b439c83fd&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb=
760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DlvArutjOovXOBM39WQ95p0=
ACzP5c0Gg9UeVFznprzyc%3D&amp;reserved=3D0
> 6. CVE-2020-10029
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-10029&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3DZa74swln8zQMEK64ei3wq71UUBCp1B94FXxMJJlxoZw%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D9333498794cde1d5=
cca518badf79533a24114b6f&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb=
760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D5q%2Fn7v%2FX3qWC1nJ0S7=
1bw2Gup0i%2BvXc5mE137Da1h3c%3D&amp;reserved=3D0
> 7. CVE-2009-5155
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2009-5155&amp;data=3D04%7C01%7=
CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a=
26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJ=
WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;=
sdata=3Dd1P%2FaygR2vwPB6EGEL8sbS6oGgdo%2B%2FSpX8c8bg4V%2Fwk%3D&amp;reserved=
=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsourceware.org%2Fgit%2Fgitweb.cgi%3Fp%3Dglibc.git%3Bh%3Deb04c21373e2a2885f=
3d52ff192b0499afe3c672&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb76=
0c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637=
394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzI=
iLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DJtL75iWYZPIs1B%2FPK5hqM7=
RDeTNf1YI7Yg6tvK4Gv%2F0%3D&amp;reserved=3D0
>

Thanks for doing this. Looks ok to me.

> Upstream-Status: Pending

we do not need upstream status to metadata patches but to actual
components which needs to be tracked for upstream submission etc.
so please remove it here.

> Signed-off-by: Saloni.Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-core/glibc/glibc_2.32.bb | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/gl=
ibc/glibc_2.32.bb
> index 2a0e464..7c56f6b 100644
> --- a/meta/recipes-core/glibc/glibc_2.32.bb
> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
> @@ -1,7 +1,24 @@
>  require glibc.inc
>  require glibc-version.inc
>
> -CVE_CHECK_WHITELIST +=3D "CVE-2020-10029"
> +#As confirmed by Upstream Community below patches are not considered sec=
urity threats, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "\
> +    CVE-2019-1010022 \
> +    CVE-2019-1010023 \
> +    CVE-2019-1010024 \
> +    CVE-2019-1010025 \
> +"
> +#Changes are already present in source-code, hence whitelisted.
> +CVE_CHECK_WHITELIST +=3D "\
> +    CVE-2009-5155 \
> +    CVE-2016-10739 \
> +    CVE-2020-10029 \
> +    CVE-2015-8985 \
> +    CVE-2020-6096 \
> +    CVE-2016-10228 \
> +    CVE-2020-1751 \
> +    CVE-2020-1752 \
> +"
>
>  DEPENDS +=3D "gperf-native bison-native make-native"
>
> --
> 2.7.4
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BM1PR01MB4019D5A3C0041EDFD8E28A0387170BM1PR01MB4019INDP_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div></div>
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div>Hello Khem Raj,</div>
<div><br>
</div>
<div>Thankyou for the feedback! I have removed the line and resent the patc=
h again.</div>
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni <br>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, October 28, 2020 9:23 PM<br>
<b>To:</b> Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;openembedded=
-core@lists.openembedded.org&gt;; Nisha Parrakat &lt;Nisha.Parrakat@kpit.co=
m&gt;; Anuj Chougule &lt;Anuj.Chougule@kpit.com&gt;<br>
<b>Subject:</b> Re: [poky][master][PATCH] glibc: Added and whitelisted CVE =
patches</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Oct 28, 2020 at 8:24 AM Saloni.Jain &lt;Sa=
loni.Jain@kpit.com&gt; wrote:<br>
&gt;<br>
&gt; From: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt;<br>
&gt; Below CVE patches are whitelisted as not considered<br>
&gt; as security threats by Upstream Community:<br>
&gt; 1. CVE-2019-1010022<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010022&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b=
59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DGZrfiAc1LbOzRBhzHSF71pISmLVQMDPsVNbOKNwF=
U2I%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2019-1010022&amp;amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3DGZrfiAc1LbOzRBhzHSF71pISmLVQMDPsVNbOKNwFU2I%3D&amp;amp;reserved=
=3D0</a><br>
&gt; 2. CVE-2019-1010023<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010023&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b=
59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3D%2BPOMtxzlSMSjRcWkyeUu1DDRNpbdCFVDHi2Oii=
9O0KE%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2019-1010023&amp;amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3D%2BPOMtxzlSMSjRcWkyeUu1DDRNpbdCFVDHi2Oii9O0KE%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; 3. CVE-2019-1010024<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010024&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b=
59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DfxoI1KYiNprzTwp0Vxk52pj4iogBnVELj6FnwZ7%=
2Fk8I%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2019-1010024&amp;amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3DfxoI1KYiNprzTwp0Vxk52pj4iogBnVELj6FnwZ7%2Fk8I%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; 4. CVE-2019-1010025<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2019-1010025&a=
mp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b=
59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUn=
known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJ=
XVCI6Mn0%3D%7C1000&amp;amp;sdata=3DBIbL1ikyInBgRszvevPWGrd%2BSOBfn5F12Sggpy=
RPli8%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2019-1010025&amp;amp;data=3D04%7C01%7C=
Saloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;a=
mp;sdata=3DBIbL1ikyInBgRszvevPWGrd%2BSOBfn5F12SggpyRPli8%3D&amp;amp;reserve=
d=3D0</a><br>
&gt;<br>
&gt; Below CVE patches are whitelisted as the changes are<br>
&gt; already present in the source-code:<br>
&gt; 1. CVE-2020-1751<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-1751&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59b=
c9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DYmyZ99RzofIHU5W9tNWv2suNJbaRKApRFEFKx9Ti%2F=
PU%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2020-1751&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DYmyZ99RzofIHU5W9tNWv2suNJbaRKApRFEFKx9Ti%2FPU%3D&amp;amp;reserved=
=3D0</a><br>
&gt; 2. CVE-2020-1752<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-1752&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59b=
c9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685069290%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DPENgTh%2BpLaH1AjJlE5egqVUJBE5USv0WUnbe2QwF0=
fc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2020-1752&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637394972685069290%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DPENgTh%2BpLaH1AjJlE5egqVUJBE5USv0WUnbe2QwF0fc%3D&amp;amp;reserved=
=3D0</a><br>
&gt; 3. CVE-2020-6096<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-6096&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59b=
c9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DeBPUmapGobfXsK%2BzzwLVXYye8BUdkNauhyjrMXEx4=
Xc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2020-6096&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DeBPUmapGobfXsK%2BzzwLVXYye8BUdkNauhyjrMXEx4Xc%3D&amp;amp;reserved=
=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1820331&amp;amp;=
data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3DPxa8ikANO59wq50c8drqvxv2lBraBpgzxPdAT3UMm7w%3D&=
amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.redhat.com%2Fshow_bug.cgi%3Fid%3D1820331&amp;amp;data=3D04%7C01%7CSaloni.=
Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3DPxa8ikANO59wq50c8drqvxv2lBraBpgzxPdAT3UMm7w%3D&amp;amp;reserved=3D0</a>=
<br>
&gt; 4. CVE-2015-8985<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-8985&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59b=
c9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DqgjqafPVHgLephuiU1W6LPeFj9W6aAQIN09tmRCBZTo=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-8985&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DqgjqafPVHgLephuiU1W6LPeFj9W6aAQIN09tmRCBZTo%3D&amp;amp;reserved=3D0=
</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D=
eb04c21373e2a2885f3d52ff192b0499afe3c672&amp;amp;data=3D04%7C01%7CSaloni.Ja=
in%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DwlG6FyH%2FyJmFCsbXlPBn4t2uS3XWeTWwow83Mm4T5AU%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourcew=
are.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3Deb04c21373e2a2885f3d52ff=
192b0499afe3c672&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c=
9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63739=
4972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DwlG6FyH%2FyJmFCsbXlPBn=
4t2uS3XWeTWwow83Mm4T5AU%3D&amp;amp;reserved=3D0</a><br>
&gt; 5. CVE-2016-10739<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2016-10739&amp=
;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59=
bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;amp;sdata=3DRo4S9ljtCEB36VKsEHQuSw541C%2FNhmidMiH6b%2F=
4qlM0%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2016-10739&amp;amp;data=3D04%7C01%7CSa=
loni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3DRo4S9ljtCEB36VKsEHQuSw541C%2FNhmidMiH6b%2F4qlM0%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D=
108bc4049f8ae82710aec26a92ffdb4b439c83fd&amp;amp;data=3D04%7C01%7CSaloni.Ja=
in%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DlvArutjOovXOBM39WQ95p0ACzP5c0Gg9UeVFznprzyc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourcew=
are.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D108bc4049f8ae82710aec26a=
92ffdb4b439c83fd&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c=
9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63739=
4972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DlvArutjOovXOBM39WQ95p0=
ACzP5c0Gg9UeVFznprzyc%3D&amp;amp;reserved=3D0</a><br>
&gt; 6. CVE-2020-10029<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-10029&amp=
;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59=
bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;amp;sdata=3DZa74swln8zQMEK64ei3wq71UUBCp1B94FXxMJJlxoZ=
w%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2020-10029&amp;amp;data=3D04%7C01%7CSa=
loni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3DZa74swln8zQMEK64ei3wq71UUBCp1B94FXxMJJlxoZw%3D&amp;amp;reserved=3D=
0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D=
9333498794cde1d5cca518badf79533a24114b6f&amp;amp;data=3D04%7C01%7CSaloni.Ja=
in%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3D5q%2Fn7v%2FX3qWC1nJ0S71bw2Gup0i%2BvXc5mE137Da1h3c%3D&amp;amp;reserved=3D=
0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourcew=
are.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D9333498794cde1d5cca518ba=
df79533a24114b6f&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c=
9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63739=
4972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D5q%2Fn7v%2FX3qWC1nJ0S7=
1bw2Gup0i%2BvXc5mE137Da1h3c%3D&amp;amp;reserved=3D0</a><br>
&gt; 7. CVE-2009-5155<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2009-5155&amp;=
amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59b=
c9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637394972685079284%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dd1P%2FaygR2vwPB6EGEL8sbS6oGgdo%2B%2FSpX8c8b=
g4V%2Fwk%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2009-5155&amp;amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dd1P%2FaygR2vwPB6EGEL8sbS6oGgdo%2B%2FSpX8c8bg4V%2Fwk%3D&amp;amp;rese=
rved=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2Fgitweb.cgi%3Fp%3Dglibc.git%3Bh%3Deb=
04c21373e2a2885f3d52ff192b0499afe3c672&amp;amp;data=3D04%7C01%7CSaloni.Jain=
%40kpit.com%7Cc0eb760c9294406e526908d87b59bc9e%7C3539451eb46e4a26a242ff6150=
2855c7%7C0%7C0%7C637394972685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjA=
wMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3D=
JtL75iWYZPIs1B%2FPK5hqM7RDeTNf1YI7Yg6tvK4Gv%2F0%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourcew=
are.org%2Fgit%2Fgitweb.cgi%3Fp%3Dglibc.git%3Bh%3Deb04c21373e2a2885f3d52ff19=
2b0499afe3c672&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7Cc0eb760c92=
94406e526908d87b59bc9e%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6373949=
72685079284%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DJtL75iWYZPIs1B%2FPK5hqM7=
RDeTNf1YI7Yg6tvK4Gv%2F0%3D&amp;amp;reserved=3D0</a><br>
&gt;<br>
<br>
Thanks for doing this. Looks ok to me.<br>
<br>
&gt; Upstream-Status: Pending<br>
<br>
we do not need upstream status to metadata patches but to actual<br>
components which needs to be tracked for upstream submission etc.<br>
so please remove it here.<br>
<br>
&gt; Signed-off-by: Saloni.Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; meta/recipes-core/glibc/glibc_2.32.bb | 19 ++++++++++++++++++-<b=
r>
&gt;&nbsp; 1 file changed, 18 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core=
/glibc/glibc_2.32.bb<br>
&gt; index 2a0e464..7c56f6b 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc_2.32.bb<br>
&gt; +++ b/meta/recipes-core/glibc/glibc_2.32.bb<br>
&gt; @@ -1,7 +1,24 @@<br>
&gt;&nbsp; require glibc.inc<br>
&gt;&nbsp; require glibc-version.inc<br>
&gt;<br>
&gt; -CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-10029&quot;<br>
&gt; +#As confirmed by Upstream Community below patches are not considered =
security threats, hence whitelisted.<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;\<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2019-1010022 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2019-1010023 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2019-1010024 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2019-1010025 \<br>
&gt; +&quot;<br>
&gt; +#Changes are already present in source-code, hence whitelisted.<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;\<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2009-5155 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2016-10739 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2020-10029 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2015-8985 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2020-6096 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2016-10228 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2020-1751 \<br>
&gt; +&nbsp;&nbsp;&nbsp; CVE-2020-1752 \<br>
&gt; +&quot;<br>
&gt;<br>
&gt;&nbsp; DEPENDS +=3D &quot;gperf-native bison-native make-native&quot;<b=
r>
&gt;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
</div>
</span></font></div>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.
</body>
</html>

--_000_BM1PR01MB4019D5A3C0041EDFD8E28A0387170BM1PR01MB4019INDP_--
