Received: from IND01-MA1-obe.outbound.protection.outlook.com (IND01-MA1-obe.outbound.protection.outlook.com [40.107.138.41])
 by mx.groups.io with SMTP id smtpd.web08.1372.1616436288333815276
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Mar 2021 11:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=ILgfHTnE;
 spf=pass (domain: kpit.com, ip: 40.107.138.41, mailfrom: saloni.jain@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mD1up6Xf9ryGs3Vj9a/7jjyNAY0+umGLcfxnF72jjw8Z5RBFqxRIVHTCDO+3oIfKMC+ejFWPTQsshKLp3P93jd5JIr4cEvCVfpJcThjcnNmTMhDPQd4NYnGVSNNzEdhZuD0ad/Pqi5po6v34HHuV2G7KUijRte9GScc7B6kxfYg4BrAq3mNOzPtQNoTgYqC7d3iDt/obn0d2dAfZcfwq4M2MnCt3eOAajhwuEn0v8TnVOcfqfG4XyQ9KOnkyzxTMOjTpwv3fnc2teVF99W+JPyDECHqhK+wNOxX50gORSwbUHp2EgQek8p0GvkbhLF54icM88PPsOFfqNajTINk4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcC4fICvW9ioFouM1k9VkXTwNDfbGujMpyQl06CHwWk=;
 b=cfVzvCZemG9dZPnuHfA4dSVT4q3jb2O+nyaEqVlXsm6ZZqWIu1YdHLV5oEs+2+9KxYwa0Eb0ym1MYTGIr5GCbxrji3GeI9Syc3gZwqwlqLJle/3OHlGbil8l/e36l+bz5jBgfBC5spVsNe3npJWKDALlOxi5ca2yiMgIwi3XSyfXt6HFpBP6MkHYXv3sFbMo55HsTCzCfbW0OKCO9I7csZsewxvbBOJ23EjdGLoLPLxz6kRA1TTrzD8zgrdzPjTXQdG1sd+t/KlcJcJ7Geb13n5cBcZqTKCVZrrPX2bfYLPuVky/iENjaj8G53QUrkSoQqHJg1JnjV0NuWu5Y/Unwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vcC4fICvW9ioFouM1k9VkXTwNDfbGujMpyQl06CHwWk=;
 b=ILgfHTnE52BNIsRyHGDhbzVXXRtvLpsv8YzH7/08WzrzifW3cOkj2ADO61/QOuDKVZmAtLPV+aMRPHl2sA3fR40eurj4FOHvc4yA+SUxoQRidVVt9rxC4e+lajdHOwUI98DhOUHHQ6RtKMl6mFNgeqS0jyC+2lrWPkXOeBFjtCY=
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:72::14)
 by MA1PR01MB4338.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 18:04:38 +0000
Received: from MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765]) by MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::2d7a:e21b:b924:4765%3]) with mapi id 15.20.3955.027; Mon, 22 Mar 2021
 18:04:38 +0000
From: "saloni" <saloni.jain@kpit.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [poky][dunfell][PATCH] glibc: Add and modify CVEs
Thread-Topic: [poky][dunfell][PATCH] glibc: Add and modify CVEs
Thread-Index: AQHXHwYISPJPZbbyr0uK1Vy/+qFK5aqQMqaAgAAWZWw=
Date: Mon, 22 Mar 2021 18:04:37 +0000
Message-ID: 
 <MA1PR01MB3257204AD1DE47E30A709C1087659@MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM>
References: 
 <20210322102745.19513-1-Saloni.Jain@kpit.com>,<e5a383e4-c8b1-7fbe-abbe-d087d24d5e43@gmail.com>
In-Reply-To: <e5a383e4-c8b1-7fbe-abbe-d087d24d5e43@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [157.34.147.94]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8afd7490-ba97-44f7-8274-08d8ed5cf55e
x-ms-traffictypediagnostic: MA1PR01MB4338:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <MA1PR01MB43383EE9329B57ACD3D694E887659@MA1PR01MB4338.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 T8zXJH3Z+stRw9Y/Rr5amNWHZsAP8qkUxus/DdnaN8e0Qn+bFfGF2Wu0hj8QyiNYNK8Y6ZAadwSCHrAqdrBsPPjfBEPUyayVb7kjzGLC9Upp/MfVqGGAFE99SduPJydxVzmJP/hwEbZZpVDoLDtbKu3eFkxbnWPklJGKPOaMMNB5cz3QuWqeWSGKGUrOYoi+Mpcv5y4l8QXSgkpruSENqEiH4P7FHn8vhmOzqaKSfxFUp/i2h3HNL2RAukPkM5oKoDWBvoUogzw70qqNIIyxqpydwd8VZkyNwTrYK+cerxH5n+Z++oLTYU5DjOV05E21M43iOtS+hmAqOZ/WTayAMY//g8Hc8QbWcogYk+udFsIBGxXj3t1+Kd7GeMNLKuIAFWbPMtl/8AoIj2rj31Afa9wqo+hbBHDITqjb5PP5ahCuz+Wq7ZE6J0VBGS5TwP7YPc+4nKU9j2IVK6BY94Ms9D6VtcE0EYURLqoUtTvEbp4dApmo3hRJ+s+LnVb7JDVoBsgZn2H0HOJMNjJ0n2WoVjIlm1tV39lfh+y9rBVpvVfghISVZFMAm93zFQgunzFhcAiDGdJiCp0n9ji4To6iQlc1GxDmkc4WpnRMngjPelbaKQaw1zGheq27rLXAAGdNfFl+kL7EZ6oA+qvWwvn4ru+rcOLiNyC0VHgH7i6OgJeKj9CV+GsrVxgCXFGEfSCP8VyjwGw5j+vyjrYnTrwHnhTNBRiwD9RSZdULLK3nNdv1BkyzbSJ0KevfvKUgBIvt
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39850400004)(376002)(396003)(186003)(53546011)(52536014)(26005)(33656002)(110136005)(5660300002)(966005)(86362001)(478600001)(45080400002)(8676002)(71200400001)(6506007)(30864003)(7696005)(2906002)(166002)(8936002)(107886003)(83380400001)(19627405001)(316002)(66446008)(66476007)(66574015)(9686003)(66556008)(64756008)(55016002)(66946007)(4326008)(38100700001)(76116006)(2004002)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?X6jZCOc4fn2OtoRVS5K8PScpj1S54IZo4ZH+DdyqX6ONt4ra4cMjS64xXmXQ?=
 =?us-ascii?Q?NGGVfAktTD4ZXklz3sTTyP+CXDcUngyMlT18Q2l/kw+K/XggRCV3Xo4UJ8Qd?=
 =?us-ascii?Q?jgAx3zQVFXwcZq6J57TPHNJyq2QH91Lev07EajSYwCg/UI36Ko91K6GuTAZF?=
 =?us-ascii?Q?/9+F6KHtdQUQ4FP8zva0O1y72I/HU/sKU053QiXTv+2D1URnMHe88ROSMWZ8?=
 =?us-ascii?Q?9jHHaLsPbOo4qJZiPA97b/nOyRm36pdGxNT/v0CAlyxZbIIEigDB09dApWii?=
 =?us-ascii?Q?FdHUu6YJhx9YbddAaxGafXaG/nRpUFJN73BbkEqdPa0kZVbURcdO4cctXD0b?=
 =?us-ascii?Q?olE7AXP4V6IxMACgyt7S0MrSNsBwnZVy8skMSWOA49qnW4tAUoZ2FYF8S+h6?=
 =?us-ascii?Q?rWhbyS78ANwXXOxgJ9qqsPOnjm0yeEaahWOl3fHz8BAptVyRFib+Vlr3XQ9J?=
 =?us-ascii?Q?FfOGr/L7fqj+KWswsHYycq9dHkD+O2B+jw4ArvH8aTmy+apHR6OifvaqUgKH?=
 =?us-ascii?Q?BDGAoFK0Np3ccp9CbByP+y8TCG8d56tWQLQonFMhysi8wF/TVKMuf5ahjplR?=
 =?us-ascii?Q?DSseSUatEdgsCvYE5TvmwUbK2ANtzdCwspogmCUIqW/e15pm4YeDRh1AMd3U?=
 =?us-ascii?Q?+bRVw15NyCbaxd+eTV9yxSlRov/hzG2g0+/JnMAhKu0vjQJg5mCYkGlxcMEj?=
 =?us-ascii?Q?uketQnGC91Mea1aDgJEb/TRAPoGPNiij4lek1YDA7RCGJGxHbcsVpLl/1Yfn?=
 =?us-ascii?Q?O1bI9O8Lk14zHbPpeYyW60PVIOJNnRX89yn8d90t2pvgLQrbK0/XgLzvu7XF?=
 =?us-ascii?Q?jG939nM5QqZUAN4PSXxsVFOs6NTcZA04go5hm0/WqI1r6lJHsuzSA1et6PGD?=
 =?us-ascii?Q?EyF3CX9XosbUo5kFlFNhxcE+7tbH2kjoSWGo/eyTwwQlHnqCQZHBZ+H6ukNZ?=
 =?us-ascii?Q?7SWHdPkBlOe6kO7drAJz5lHKZgA4VCzuQKEaU+v6g7tLiMMfaeNOxtbF7DEO?=
 =?us-ascii?Q?Zekt9512LxY1CRNfIR03wSAHI9j8EKWPNOh7CRiuN9Ji9NihPqkFI7rnS8Q5?=
 =?us-ascii?Q?5m6jBOWjKqv4NJcRFGqLEVTDSx3YxBEjxzFAaOQC/aERvCTndlwAXFfhJ0Ju?=
 =?us-ascii?Q?lWiXaxz5QA3XfqJ8Fv3+KJvlCM6P26v2URYyNQmYpnBcjfTFXHWbL16AcuyF?=
 =?us-ascii?Q?nCGgdQQpPc3j2Lci+kJrhtEFmwFVfKGGkZ1DEBRX7mDUym0jcdMPunEaV6PN?=
 =?us-ascii?Q?XdU4wErHnw+EmAKzT0n+Rig4jD8FQ7/+ZVXwjaykxAZCgWXA02SGZSfmluV7?=
 =?us-ascii?Q?3oU=3D?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MA1PR01MB3257.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afd7490-ba97-44f7-8274-08d8ed5cf55e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2021 18:04:38.0062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V9j3GCCRPqdDn0TxABrV67EQ5hpnj8/LqdXhCEwc7q54WlXi9NblaIZJQPbgzkwy3Yh9A2zir9gFh2hrhTC2YQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4338
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MA1PR01MB3257204AD1DE47E30A709C1087659MA1PR01MB3257INDP_"

--_000_MA1PR01MB3257204AD1DE47E30A709C1087659MA1PR01MB3257INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Raj,

Yes, checked the discussion and patch on the mailing list in the evening.
https://lists.openembedded.org/g/openembedded-core/topic/dunfell_patch_glib=
c_pull/81482348?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,20,2,40,81482348

Updating to latest 2.31 version will make the below patches obsolete and wi=
ll be whitelisted, hence below changes can be ignored.

Thanks & Regards,
Saloni Jain
________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: Monday, March 22, 2021 9:58 PM
To: Saloni Jain <Saloni.Jain@kpit.com>; openembedded-core@lists.openembedde=
d.org <openembedded-core@lists.openembedded.org>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [poky][dunfell][PATCH] glibc: Add and modify CVEs

There is another patch on mailing lists to update to latest 2.31 which
should perhaps address these ?

On 3/22/21 3:27 AM, Saloni Jain wrote:
> Below patch is modified:
> 1. CVE-2019-25013
> The previous patch was modified for dunfell
> context and causing conflict for CVE-2021-3326.
> Hence, the original patch is backported.
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-27618&amp;data=3D04%7C01%=
7CSaloni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4=
a26a242ff61502855c7%7C0%7C0%7C637520273080304204%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D6CnKJfxFf4NpxDANqbuB4wcc3tiRRNF5D%2FKBm18Dq%2FA%3D&amp;reserved=3D=
0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D9a99c682144bdbd4=
0792ebf822fe9264e0376fb5&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4=
f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dis4p3gAjo7AJjCtWRldupy=
sJakNlQWLhkxaxNcIPvMI%3D&amp;reserved=3D0
>
> Below patch is added:
> 1. CVE-2021-3326
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1932589&amp;data=3D04%7C01%7CSal=
oni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3DQIfO6Z9aDldMkDe4nTGwPJO0bF%2F0ovXj%2FEk3nio62sU%3D&amp;reserved=3D0
> Link: https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3Ddca565886b5e8bd7=
966e15f0ca42ee5cff686673&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4=
f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C6=
37520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luM=
zIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DxNOEDHc6hkgt4hYNZ5pHan=
GB9bLrpoUSqda33FAoldI%3D&amp;reserved=3D0
>
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>   .../glibc/glibc/CVE-2019-25013.patch          |  52 +--
>   .../glibc/glibc/CVE-2021-3326.patch           | 297 ++++++++++++++++++
>   meta/recipes-core/glibc/glibc_2.31.bb         |   3 +-
>   3 files changed, 328 insertions(+), 24 deletions(-)
>   create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-3326.patch
>
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta/re=
cipes-core/glibc/glibc/CVE-2019-25013.patch
> index 73df1da868..3e446f2818 100644
> --- a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
> +++ b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch
> @@ -8,12 +8,14 @@ area and is not allowed.  The from_euc_kr function used=
 to skip two bytes
>   when told to skip over the unknown designation, potentially running ove=
r
>   the buffer end.
>
> -Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%=
3Bh%3Dee7a3144c9922808181009b7b3e50e852fb4999b&amp;data=3D04%7C01%7CSaloni.=
Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
R5euqxZd1HbzdIQR%2FVPoxa7NIHxIVEy1O%2FBQosTcZPo%3D&amp;reserved=3D0]
>   CVE: CVE-2019-25013
> -Signed-off-by: Scott Murray <scott.murray@konsulko.com>
> -[Refreshed for Dundell context; Makefile changes]
> -Signed-off-by: Armin Kuster <akuster@mvista.com>
> +Upstream Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%=
3Bh%3Dee7a3144c9922808181009b7b3e50e852fb4999b&amp;data=3D04%7C01%7CSaloni.=
Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
R5euqxZd1HbzdIQR%2FVPoxa7NIHxIVEy1O%2FBQosTcZPo%3D&amp;reserved=3D0]
> +Comment: No change in any hunk
>
> +The previous change was modified for dunfell context, causing conflict
> +for CVE-2021-3326. Hence, the original patch is backported.
> +
> +Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
>   ---
>    iconvdata/Makefile      |  3 ++-
>    iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++++++++++++++++++++
> @@ -22,23 +24,25 @@ Signed-off-by: Armin Kuster <akuster@mvista.com>
>    4 files changed, 59 insertions(+), 9 deletions(-)
>    create mode 100644 iconvdata/bug-iconv13.c
>
> -Index: git/iconvdata/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/iconvdata/Makefile
> -+++ git/iconvdata/Makefile
> -@@ -73,7 +73,7 @@ modules.so :=3D $(addsuffix .so, $(modules
> +diff --git a/iconvdata/Makefile b/iconvdata/Makefile
> +index 4ec2741cdc..85009f3390 100644
> +--- a/iconvdata/Makefile
> ++++ b/iconvdata/Makefile
> +@@ -73,7 +73,8 @@
>    ifeq (yes,$(build-shared))
>    tests =3D bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-i=
conv4 \
>          tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv=
9 \
>   -      bug-iconv10 bug-iconv11 bug-iconv12
> -+      bug-iconv10 bug-iconv11 bug-iconv12 bug-iconv13
> ++      bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4=
 \
> ++       bug-iconv13
>    ifeq ($(have-thread-library),yes)
>    tests +=3D bug-iconv3
>    endif
> -Index: git/iconvdata/bug-iconv13.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +diff --git a/iconvdata/bug-iconv13.c b/iconvdata/bug-iconv13.c
> +new file mode 100644
> +index 0000000000..87aaff398e
>   --- /dev/null
> -+++ git/iconvdata/bug-iconv13.c
> ++++ b/iconvdata/bug-iconv13.c
>   @@ -0,0 +1,53 @@
>   +/* bug 24973: Test EUC-KR module
>   +   Copyright (C) 2020 Free Software Foundation, Inc.
> @@ -93,11 +97,11 @@ Index: git/iconvdata/bug-iconv13.c
>   +}
>   +
>   +#include <support/test-driver.c>
> -Index: git/iconvdata/euc-kr.c
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/iconvdata/euc-kr.c
> -+++ git/iconvdata/euc-kr.c
> -@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned c
> +diff --git a/iconvdata/euc-kr.c b/iconvdata/euc-kr.c
> +index b0d56cf3ee..1045bae926 100644
> +--- a/iconvdata/euc-kr.c
> ++++ b/iconvdata/euc-kr.c
> +@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned char *cp)
>                                                                          =
      \
>        if (ch <=3D 0x9f)                                                 =
        \
>          ++inptr;                                                        =
              \
> @@ -110,11 +114,11 @@ Index: git/iconvdata/euc-kr.c
>          {                                                               =
              \
>          /* This is illegal.  */                                         =
      \
>          STANDARD_FROM_LOOP_ERR_HANDLER (1);                             =
      \
> -Index: git/iconvdata/ksc5601.h
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- git.orig/iconvdata/ksc5601.h
> -+++ git/iconvdata/ksc5601.h
> -@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s
> +diff --git a/iconvdata/ksc5601.h b/iconvdata/ksc5601.h
> +index d3eb3a4ff8..f5cdc72797 100644
> +--- a/iconvdata/ksc5601.h
> ++++ b/iconvdata/ksc5601.h
> +@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s, size_t ava=
il, unsigned char offset)
>      unsigned char ch2;
>      int idx;
>
> @@ -133,3 +137,5 @@ Index: git/iconvdata/ksc5601.h
>      ch2 =3D (*s)[1];
>      if (ch2 < offset || (ch2 - offset) <=3D 0x20 || (ch2 - offset) >=3D =
0x7f)
>        return __UNKNOWN_10646_CHAR;
> +--
> +2.27.0
> diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch b/meta/rec=
ipes-core/glibc/glibc/CVE-2021-3326.patch
> new file mode 100644
> index 0000000000..5f4270a6c8
> --- /dev/null
> +++ b/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch
> @@ -0,0 +1,297 @@
> +From 7d88c6142c6efc160c0ee5e4f85cde382c072888 Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Wed, 27 Jan 2021 13:36:12 +0100
> +Subject: [PATCH] gconv: Fix assertion failure in ISO-2022-JP-3 module (b=
ug
> + 27256)
> +
> +The conversion loop to the internal encoding does not follow
> +the interface contract that __GCONV_FULL_OUTPUT is only returned
> +after the internal wchar_t buffer has been filled completely.  This
> +is enforced by the first of the two asserts in iconv/skeleton.c:
> +
> +             /* We must run out of output buffer space in this
> +                rerun.  */
> +             assert (outbuf =3D=3D outerr);
> +             assert (nstatus =3D=3D __GCONV_FULL_OUTPUT);
> +
> +This commit solves this issue by queuing a second wide character
> +which cannot be written immediately in the state variable, like
> +other converters already do (e.g., BIG5-HKSCS or TSCII).
> +
> +Reported-by: Tavis Ormandy <taviso@gmail.com>
> +
> +CVE: CVE-2021-3326
> +Upstream-Status: Backport [https://apc01.safelinks.protection.outlook.co=
m/?url=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%=
3Bh%3D7d88c6142c6efc160c0ee5e4f85cde382c072888&amp;data=3D04%7C01%7CSaloni.=
Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D=
pA1%2BGkOYj%2B%2BYxP2MoiI31NKk5a%2FAwYdivLPnDViRpKE%3D&amp;reserved=3D0]
> +Comment: Refreshed only one hunk in Makefile
> +
> +Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> +---
> + iconvdata/Makefile        |   4 +-
> + iconvdata/bug-iconv14.c   | 127 ++++++++++++++++++++++++++++++++++++++
> + iconvdata/iso-2022-jp-3.c |  67 ++++++++++++++------
> + 3 files changed, 178 insertions(+), 20 deletions(-)
> + create mode 100644 iconvdata/bug-iconv14.c
> +
> +diff --git a/iconvdata/Makefile b/iconvdata/Makefile
> +index c8c532a3e4..55c527a5f7 100644
> +--- a/iconvdata/Makefile
> ++++ b/iconvdata/Makefile
> +@@ -74,7 +74,7 @@
> + tests =3D bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug-ic=
onv4 \
> +       tst-iconv6 bug-iconv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9=
 \
> +       bug-iconv10 bug-iconv11 bug-iconv12 tst-iconv-big5-hkscs-to-2ucs4=
 \
> +-       bug-iconv13
> ++       bug-iconv13 bug-iconv14
> + ifeq ($(have-thread-library),yes)
> + tests +=3D bug-iconv3
> + endif
> +@ -322,6 +322,8 @@ $(objpfx)bug-iconv10.out: $(objpfx)gconv-modules \
> +                         $(addprefix $(objpfx),$(modules.so))
> + $(objpfx)bug-iconv12.out: $(objpfx)gconv-modules \
> +                         $(addprefix $(objpfx),$(modules.so))
> ++$(objpfx)bug-iconv14.out: $(objpfx)gconv-modules \
> ++                        $(addprefix $(objpfx),$(modules.so))
> +
> + $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \
> +                        $(addprefix $(objpfx),$(modules.so)) \
> +diff --git a/iconvdata/bug-iconv14.c b/iconvdata/bug-iconv14.c
> +new file mode 100644
> +index 0000000000..902f140fa9
> +--- /dev/null
> ++++ b/iconvdata/bug-iconv14.c
> +@@ -0,0 +1,127 @@
> ++/* Assertion in ISO-2022-JP-3 due to two-character sequence (bug 27256)=
.
> ++   Copyright (C) 2021 Free Software Foundation, Inc.
> ++   This file is part of the GNU C Library.
> ++
> ++   The GNU C Library is free software; you can redistribute it and/or
> ++   modify it under the terms of the GNU Lesser General Public
> ++   License as published by the Free Software Foundation; either
> ++   version 2.1 of the License, or (at your option) any later version.
> ++
> ++   The GNU C Library is distributed in the hope that it will be useful,
> ++   but WITHOUT ANY WARRANTY; without even the implied warranty of
> ++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++   Lesser General Public License for more details.
> ++
> ++   You should have received a copy of the GNU Lesser General Public
> ++   License along with the GNU C Library; if not, see
> ++   <https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2=
Fwww.gnu.org%2Flicenses%2F&amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35=
f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7=
C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l=
uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DATC4wLlR055Je1BzlOKc=
5TPiEaO2FzX2q0dgiv%2F%2BAck%3D&amp;reserved=3D0>.  */
> ++
> ++#include <iconv.h>
> ++#include <string.h>
> ++#include <errno.h>
> ++#include <support/check.h>
> ++
> ++/* Use an escape sequence to return to the initial state.  */
> ++static void
> ++with_escape_sequence (void)
> ++{
> ++  iconv_t c =3D iconv_open ("UTF-8", "ISO-2022-JP-3");
> ++  TEST_VERIFY_EXIT (c !=3D (iconv_t) -1);
> ++
> ++  char in[] =3D "\e$(O+D\e(B";
> ++  char *inbuf =3D in;
> ++  size_t inleft =3D strlen (in);
> ++  char out[3];                  /* Space for one output character.  */
> ++  char *outbuf;
> ++  size_t outleft;
> ++
> ++  outbuf =3D out;
> ++  outleft =3D sizeof (out);
> ++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), (size_t)=
 -1);
> ++  TEST_COMPARE (errno, E2BIG);
> ++  TEST_COMPARE (inleft, 3);
> ++  TEST_COMPARE (inbuf - in, strlen (in) - 3);
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xc3);
> ++  TEST_COMPARE (out[1] & 0xff, 0xa6);
> ++
> ++  /* Return to the initial shift state, producing the pending
> ++     character.  */
> ++  outbuf =3D out;
> ++  outleft =3D sizeof (out);
> ++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (inleft, 0);
> ++  TEST_COMPARE (inbuf - in, strlen (in));
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  /* Nothing should be flushed the second time.  */
> ++  outbuf =3D out;
> ++  outleft =3D sizeof (out);
> ++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (outleft, sizeof (out));
> ++  TEST_COMPARE (outbuf - out, 0);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  TEST_COMPARE (iconv_close (c), 0);
> ++}
> ++
> ++/* Use an explicit flush to return to the initial state.  */
> ++static void
> ++with_flush (void)
> ++{
> ++  iconv_t c =3D iconv_open ("UTF-8", "ISO-2022-JP-3");
> ++  TEST_VERIFY_EXIT (c !=3D (iconv_t) -1);
> ++
> ++  char in[] =3D "\e$(O+D";
> ++  char *inbuf =3D in;
> ++  size_t inleft =3D strlen (in);
> ++  char out[3];                  /* Space for one output character.  */
> ++  char *outbuf;
> ++  size_t outleft;
> ++
> ++  outbuf =3D out;
> ++  outleft =3D sizeof (out);
> ++  TEST_COMPARE (iconv (c, &inbuf, &inleft, &outbuf, &outleft), (size_t)=
 -1);
> ++  TEST_COMPARE (errno, E2BIG);
> ++  TEST_COMPARE (inleft, 0);
> ++  TEST_COMPARE (inbuf - in, strlen (in));
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xc3);
> ++  TEST_COMPARE (out[1] & 0xff, 0xa6);
> ++
> ++  /* Flush the pending character.  */
> ++  outbuf =3D out;
> ++  outleft =3D sizeof (out);
> ++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (outleft, sizeof (out) - 2);
> ++  TEST_COMPARE (outbuf - out, 2);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  /* Nothing should be flushed the second time.  */
> ++  outbuf =3D out;
> ++  outleft =3D sizeof (out);
> ++  TEST_COMPARE (iconv (c, NULL, 0, &outbuf, &outleft), 0);
> ++  TEST_COMPARE (outleft, sizeof (out));
> ++  TEST_COMPARE (outbuf - out, 0);
> ++  TEST_COMPARE (out[0] & 0xff, 0xcc);
> ++  TEST_COMPARE (out[1] & 0xff, 0x80);
> ++
> ++  TEST_COMPARE (iconv_close (c), 0);
> ++}
> ++
> ++static int
> ++do_test (void)
> ++{
> ++  with_escape_sequence ();
> ++  with_flush ();
> ++  return 0;
> ++}
> ++
> ++#include <support/test-driver.c>
> +diff --git a/iconvdata/iso-2022-jp-3.c b/iconvdata/iso-2022-jp-3.c
> +index 3eaa847ad9..c8ba88cdc9 100644
> +--- a/iconvdata/iso-2022-jp-3.c
> ++++ b/iconvdata/iso-2022-jp-3.c
> +@@ -67,23 +67,34 @@ enum
> +   CURRENT_SEL_MASK =3D 7 << 3
> + };
> +
> +-/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of the s=
tate
> +-   also contains the last two bytes to be output, shifted by 6 bits, an=
d a
> +-   one-bit indicator whether they must be preceded by the shift sequenc=
e,
> +-   in bit 22.  */
> ++/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of the
> ++   state also contains the last two bytes to be output, shifted by 6
> ++   bits, and a one-bit indicator whether they must be preceded by the
> ++   shift sequence, in bit 22.  During ISO-2022-JP-3 to UCS-4
> ++   conversion, COUNT may also contain a non-zero pending wide
> ++   character, shifted by six bits.  This happens for certain inputs in
> ++   JISX0213_1_2004_set and JISX0213_2_set if the second wide character
> ++   in a combining sequence cannot be written because the buffer is
> ++   full.  */
> +
> + /* Since this is a stateful encoding we have to provide code which rese=
ts
> +    the output state to the initial state.  This has to be done during t=
he
> +    flushing.  */
> + #define EMIT_SHIFT_TO_INIT \
> +-  if ((data->__statep->__count & ~7) !=3D ASCII_set)                   =
       \
> ++  if (data->__statep->__count !=3D ASCII_set)                         \
> +     {                                                                  =
     \
> +       if (FROM_DIRECTION)                                              =
     \
> +       {                                                                =
     \
> +-        /* It's easy, we don't have to emit anything, we just reset the=
     \
> +-           state for the input.  */                                    =
     \
> +-        data->__statep->__count &=3D 7;                                =
       \
> +-        data->__statep->__count |=3D ASCII_set;                        =
       \
> ++        if (__glibc_likely (outbuf + 4 <=3D outend))                   =
       \
> ++          {                                                            =
     \
> ++            /* Write out the last character.  */                       =
     \
> ++            *((uint32_t *) outbuf) =3D data->__statep->__count >> 6;   =
       \
> ++            outbuf +=3D sizeof (uint32_t);                             =
       \
> ++            data->__statep->__count =3D ASCII_set;                     =
 \
> ++          }                                                            =
     \
> ++        else                                                           =
     \
> ++          /* We don't have enough room in the output buffer.  */       =
     \
> ++          status =3D __GCONV_FULL_OUTPUT;                              =
       \
> +       }                                                                =
     \
> +       else                                                             =
     \
> +       {                                                                =
     \
> +@@ -151,7 +162,21 @@ enum
> + #define LOOPFCT                       FROM_LOOP
> + #define BODY \
> +   {                                                                    =
     \
> +-    uint32_t ch =3D *inptr;                                            =
       \
> ++    uint32_t ch;                                                       =
     \
> ++                                                                       =
     \
> ++    /* Output any pending character.  */                               =
     \
> ++    ch =3D set >> 6;                                                   =
       \
> ++    if (__glibc_unlikely (ch !=3D 0))                                  =
       \
> ++      {                                                                =
             \
> ++      put32 (outptr, ch);                                              =
     \
> ++      outptr +=3D 4;                                                   =
       \
> ++      /* Remove the pending character, but preserve state bits.  */    =
     \
> ++      set &=3D (1 << 6) - 1;                                           =
       \
> ++      continue;                                                        =
     \
> ++      }                                                                =
             \
> ++                                                                       =
     \
> ++    /* Otherwise read the next input byte.  */                         =
             \
> ++    ch =3D *inptr;                                                     =
       \
> +                                                                        =
     \
> +     /* Recognize escape sequences.  */                                 =
             \
> +     if (__glibc_unlikely (ch =3D=3D ESC))                              =
         \
> +@@ -297,21 +322,25 @@ enum
> +           uint32_t u1 =3D __jisx0213_to_ucs_combining[ch - 1][0];      =
       \
> +           uint32_t u2 =3D __jisx0213_to_ucs_combining[ch - 1][1];      =
       \
> +                                                                        =
     \
> ++          inptr +=3D 2;                                                =
       \
> ++                                                                       =
     \
> ++          put32 (outptr, u1);                                          =
     \
> ++          outptr +=3D 4;                                               =
       \
> ++                                                                       =
     \
> +           /* See whether we have room for two characters.  */          =
     \
> +-          if (outptr + 8 <=3D outend)                                  =
       \
> ++          if (outptr + 4 <=3D outend)                                  =
       \
> +             {                                                          =
     \
> +-              inptr +=3D 2;                                            =
       \
> +-              put32 (outptr, u1);                                      =
     \
> +-              outptr +=3D 4;                                           =
       \
> +               put32 (outptr, u2);                                      =
     \
> +               outptr +=3D 4;                                           =
       \
> +               continue;                                                =
     \
> +             }                                                          =
     \
> +-          else                                                         =
     \
> +-            {                                                          =
     \
> +-              result =3D __GCONV_FULL_OUTPUT;                          =
       \
> +-              break;                                                   =
     \
> +-            }                                                          =
     \
> ++                                                                       =
     \
> ++          /* Otherwise store only the first character now, and         =
     \
> ++             put the second one into the queue.  */                    =
     \
> ++          set |=3D u2 << 6;                                            =
       \
> ++          /* Tell the caller why we terminate the loop.  */            =
     \
> ++          result =3D __GCONV_FULL_OUTPUT;                              =
       \
> ++          break;                                                       =
     \
> +         }                                                              =
     \
> +                                                                        =
     \
> +       inptr +=3D 2;                                                    =
       \
> +--
> +2.27.0
> diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core/gl=
ibc/glibc_2.31.bb
> index b75bbb4196..77eb5b481b 100644
> --- a/meta/recipes-core/glibc/glibc_2.31.bb
> +++ b/meta/recipes-core/glibc/glibc_2.31.bb
> @@ -41,9 +41,10 @@ SRC_URI =3D  "${GLIBC_GIT_URI};branch=3D${SRCBRANCH};n=
ame=3Dglibc \
>              file://0027-intl-Emit-no-lines-in-bison-generated-files.patc=
h \
>              file://0028-inject-file-assembly-directives.patch \
>              file://0029-locale-prevent-maybe-uninitialized-errors-with-O=
s-BZ.patch \
> +           file://CVE-2019-25013.patch \
>              file://CVE-2020-29562.patch \
>              file://CVE-2020-29573.patch \
> -           file://CVE-2019-25013.patch \
> +           file://CVE-2021-3326.patch \
>              "
>   S =3D "${WORKDIR}/git"
>   B =3D "${WORKDIR}/build-${TARGET_SYS}"
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential =
and is the property of the KPIT Technologies Ltd. It is intended only for t=
he person to whom it is addressed. If you are not the intended recipient, y=
ou are not authorized to read, print, retain copy, disseminate, distribute,=
 or use this message or any part thereof. If you receive this message in er=
ror, please notify the sender immediately and delete all copies of this mes=
sage. KPIT Technologies Ltd. does not accept any liability for virus infect=
ed mails.
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_MA1PR01MB3257204AD1DE47E30A709C1087659MA1PR01MB3257INDP_
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
<div>Hello Raj,</div>
<div><br>
</div>
<div>Yes, checked the discussion and patch on the mailing list in the eveni=
ng.</div>
<div><a href=3D"https://lists.openembedded.org/g/openembedded-core/topic/du=
nfell_patch_glibc_pull/81482348?p=3D,,,20,0,0,0::recentpostdate%2Fsticky,,,=
20,2,40,81482348" target=3D"_blank" rel=3D"nofollow">https://lists.openembe=
dded.org/g/openembedded-core/topic/dunfell_patch_glibc_pull/81482348?p=3D,,=
,20,0,0,0::recentpostdate%2Fsticky,,,20,2,40,81482348</a></div>
<div><br>
</div>
<div>Updating to latest 2.31 version will make the below patches obsolete a=
nd will be whitelisted, hence below changes can be ignored.<br>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><br>
</div>
<div>Thanks &amp; Regards,</div>
<div>Saloni Jain<br>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Khem Raj &lt;raj.khem=
@gmail.com&gt;<br>
<b>Sent:</b> Monday, March 22, 2021 9:58 PM<br>
<b>To:</b> Saloni Jain &lt;Saloni.Jain@kpit.com&gt;; openembedded-core@list=
s.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt;<br>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;<br>
<b>Subject:</b> Re: [poky][dunfell][PATCH] glibc: Add and modify CVEs</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">There is another patch on mailing lists to update =
to latest 2.31 which
<br>
should perhaps address these ?<br>
<br>
On 3/22/21 3:27 AM, Saloni Jain wrote:<br>
&gt; Below patch is modified:<br>
&gt; 1. CVE-2019-25013<br>
&gt; The previous patch was modified for dunfell<br>
&gt; context and causing conflict for CVE-2021-3326.<br>
&gt; Hence, the original patch is backported.<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2020-27618&amp=
;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f=
7e7a%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637520273080304204%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;amp;sdata=3D6CnKJfxFf4NpxDANqbuB4wcc3tiRRNF5D%2FKBm18D=
q%2FA%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2020-27618&amp;amp;data=3D04%7C01%7CSa=
loni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a=
242ff61502855c7%7C0%7C0%7C637520273080304204%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp=
;sdata=3D6CnKJfxFf4NpxDANqbuB4wcc3tiRRNF5D%2FKBm18Dq%2FA%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D=
9a99c682144bdbd40792ebf822fe9264e0376fb5&amp;amp;data=3D04%7C01%7CSaloni.Ja=
in%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3Dis4p3gAjo7AJjCtWRldupysJakNlQWLhkxaxNcIPvMI%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourcew=
are.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D9a99c682144bdbd40792ebf8=
22fe9264e0376fb5&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4f714=
238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752=
0273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3Dis4p3gAjo7AJjCtWRldupy=
sJakNlQWLhkxaxNcIPvMI%3D&amp;amp;reserved=3D0</a><br>
&gt; <br>
&gt; Below patch is added:<br>
&gt; 1. CVE-2021-3326<br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fbugzilla.redhat.com%2Fshow_bug.cgi%3Fid%3D1932589&amp;amp;=
data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%=
7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7=
CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%7C1000&amp;amp;sdata=3DQIfO6Z9aDldMkDe4nTGwPJO0bF%2F0ovXj%2FEk3nio62sU=
%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.redhat.com%2Fshow_bug.cgi%3Fid%3D1932589&amp;amp;data=3D04%7C01%7CSaloni.=
Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3DQIfO6Z9aDldMkDe4nTGwPJO0bF%2F0ovXj%2FEk3nio62sU%3D&amp;amp;reserved=3D0=
</a><br>
&gt; Link: <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D=
dca565886b5e8bd7966e15f0ca42ee5cff686673&amp;amp;data=3D04%7C01%7CSaloni.Ja=
in%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DxNOEDHc6hkgt4hYNZ5pHanGB9bLrpoUSqda33FAoldI%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsourcew=
are.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3Ddca565886b5e8bd7966e15f0=
ca42ee5cff686673&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4f714=
238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C63752=
0273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DxNOEDHc6hkgt4hYNZ5pHan=
GB9bLrpoUSqda33FAoldI%3D&amp;amp;reserved=3D0</a><br>
&gt; <br>
&gt; Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; .../glibc/glibc/CVE-2019-25013.patch&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 52 +--<br>
&gt;&nbsp;&nbsp; .../glibc/glibc/CVE-2021-3326.patch&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 297 ++++++++++++++++++<br>
&gt;&nbsp;&nbsp; meta/recipes-core/glibc/glibc_2.31.bb&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 3 +-<br>
&gt;&nbsp;&nbsp; 3 files changed, 328 insertions(+), 24 deletions(-)<br>
&gt;&nbsp;&nbsp; create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-=
3326.patch<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch b/meta=
/recipes-core/glibc/glibc/CVE-2019-25013.patch<br>
&gt; index 73df1da868..3e446f2818 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/CVE-2019-25013.patch<br>
&gt; @@ -8,12 +8,14 @@ area and is not allowed.&nbsp; The from_euc_kr funct=
ion used to skip two bytes<br>
&gt;&nbsp;&nbsp; when told to skip over the unknown designation, potentiall=
y running over<br>
&gt;&nbsp;&nbsp; the buffer end.<br>
&gt; <br>
&gt; -Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.gi=
t%3Ba%3Dpatch%3Bh%3Dee7a3144c9922808181009b7b3e50e852fb4999b&amp;amp;data=
=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3DR5euqxZd1HbzdIQR%2FVPoxa7NIHxIVEy1O%2FBQosTcZPo%3D&=
amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D=
ee7a3144c9922808181009b7b3e50e852fb4999b&amp;amp;data=3D04%7C01%7CSaloni.Ja=
in%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DR5euqxZd1HbzdIQR%2FVPoxa7NIHxIVEy1O%2FBQosTcZPo%3D&amp;amp;reserved=3D0<=
/a>]<br>
&gt;&nbsp;&nbsp; CVE: CVE-2019-25013<br>
&gt; -Signed-off-by: Scott Murray &lt;scott.murray@konsulko.com&gt;<br>
&gt; -[Refreshed for Dundell context; Makefile changes]<br>
&gt; -Signed-off-by: Armin Kuster &lt;akuster@mvista.com&gt;<br>
&gt; +Upstream Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.gi=
t%3Ba%3Dpatch%3Bh%3Dee7a3144c9922808181009b7b3e50e852fb4999b&amp;amp;data=
=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3DR5euqxZd1HbzdIQR%2FVPoxa7NIHxIVEy1O%2FBQosTcZPo%3D&=
amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%3D=
ee7a3144c9922808181009b7b3e50e852fb4999b&amp;amp;data=3D04%7C01%7CSaloni.Ja=
in%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DR5euqxZd1HbzdIQR%2FVPoxa7NIHxIVEy1O%2FBQosTcZPo%3D&amp;amp;reserved=3D0<=
/a>]<br>
&gt; +Comment: No change in any hunk<br>
&gt; <br>
&gt; +The previous change was modified for dunfell context, causing conflic=
t<br>
&gt; +for CVE-2021-3326. Hence, the original patch is backported.<br>
&gt; +<br>
&gt; +Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt;&nbsp;&nbsp; ---<br>
&gt;&nbsp;&nbsp;&nbsp; iconvdata/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&n=
bsp; 3 ++-<br>
&gt;&nbsp;&nbsp;&nbsp; iconvdata/bug-iconv13.c | 53 +++++++++++++++++++++++=
++++++++++++++++++<br>
&gt; @@ -22,23 +24,25 @@ Signed-off-by: Armin Kuster &lt;akuster@mvista.com=
&gt;<br>
&gt;&nbsp;&nbsp;&nbsp; 4 files changed, 59 insertions(+), 9 deletions(-)<br=
>
&gt;&nbsp;&nbsp;&nbsp; create mode 100644 iconvdata/bug-iconv13.c<br>
&gt; <br>
&gt; -Index: git/iconvdata/Makefile<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- git.orig/iconvdata/Makefile<br>
&gt; -+++ git/iconvdata/Makefile<br>
&gt; -@@ -73,7 +73,7 @@ modules.so :=3D $(addsuffix .so, $(modules<br>
&gt; +diff --git a/iconvdata/Makefile b/iconvdata/Makefile<br>
&gt; +index 4ec2741cdc..85009f3390 100644<br>
&gt; +--- a/iconvdata/Makefile<br>
&gt; ++++ b/iconvdata/Makefile<br>
&gt; +@@ -73,7 +73,8 @@<br>
&gt;&nbsp;&nbsp;&nbsp; ifeq (yes,$(build-shared))<br>
&gt;&nbsp;&nbsp;&nbsp; tests =3D bug-iconv1 bug-iconv2 tst-loading tst-e2bi=
g tst-iconv4 bug-iconv4 \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tst-iconv6 bug-i=
conv5 bug-iconv6 tst-iconv7 bug-iconv8 bug-iconv9 \<br>
&gt;&nbsp;&nbsp; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug-iconv10 bug-iconv11 bu=
g-iconv12<br>
&gt; -+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug-iconv10 bug-iconv11 bug-iconv12 b=
ug-iconv13<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug-iconv10 bug-iconv11 bug-iconv12 t=
st-iconv-big5-hkscs-to-2ucs4 \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug-iconv13<br>
&gt;&nbsp;&nbsp;&nbsp; ifeq ($(have-thread-library),yes)<br>
&gt;&nbsp;&nbsp;&nbsp; tests +=3D bug-iconv3<br>
&gt;&nbsp;&nbsp;&nbsp; endif<br>
&gt; -Index: git/iconvdata/bug-iconv13.c<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; +diff --git a/iconvdata/bug-iconv13.c b/iconvdata/bug-iconv13.c<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..87aaff398e<br>
&gt;&nbsp;&nbsp; --- /dev/null<br>
&gt; -+++ git/iconvdata/bug-iconv13.c<br>
&gt; ++++ b/iconvdata/bug-iconv13.c<br>
&gt;&nbsp;&nbsp; @@ -0,0 +1,53 @@<br>
&gt;&nbsp;&nbsp; +/* bug 24973: Test EUC-KR module<br>
&gt;&nbsp;&nbsp; +&nbsp;&nbsp; Copyright (C) 2020 Free Software Foundation,=
 Inc.<br>
&gt; @@ -93,11 +97,11 @@ Index: git/iconvdata/bug-iconv13.c<br>
&gt;&nbsp;&nbsp; +}<br>
&gt;&nbsp;&nbsp; +<br>
&gt;&nbsp;&nbsp; +#include &lt;support/test-driver.c&gt;<br>
&gt; -Index: git/iconvdata/euc-kr.c<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- git.orig/iconvdata/euc-kr.c<br>
&gt; -+++ git/iconvdata/euc-kr.c<br>
&gt; -@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned c<br>
&gt; +diff --git a/iconvdata/euc-kr.c b/iconvdata/euc-kr.c<br>
&gt; +index b0d56cf3ee..1045bae926 100644<br>
&gt; +--- a/iconvdata/euc-kr.c<br>
&gt; ++++ b/iconvdata/euc-kr.c<br>
&gt; +@@ -80,11 +80,7 @@ euckr_from_ucs4 (uint32_t ch, unsigned char *cp)<b=
r>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ch &lt;=3D 0x9f)&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ++inptr;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; @@ -110,11 +114,11 @@ Index: git/iconvdata/euc-kr.c<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* This is illeg=
al.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; STANDARD_FROM_LO=
OP_ERR_HANDLER (1);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \=
<br>
&gt; -Index: git/iconvdata/ksc5601.h<br>
&gt; -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
&gt; ---- git.orig/iconvdata/ksc5601.h<br>
&gt; -+++ git/iconvdata/ksc5601.h<br>
&gt; -@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s<br>
&gt; +diff --git a/iconvdata/ksc5601.h b/iconvdata/ksc5601.h<br>
&gt; +index d3eb3a4ff8..f5cdc72797 100644<br>
&gt; +--- a/iconvdata/ksc5601.h<br>
&gt; ++++ b/iconvdata/ksc5601.h<br>
&gt; +@@ -50,15 +50,15 @@ ksc5601_to_ucs4 (const unsigned char **s, size_t =
avail, unsigned char offset)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned char ch2;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int idx;<br>
&gt; <br>
&gt; @@ -133,3 +137,5 @@ Index: git/iconvdata/ksc5601.h<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ch2 =3D (*s)[1];<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ch2 &lt; offset || (ch2 - offset) &l=
t;=3D 0x20 || (ch2 - offset) &gt;=3D 0x7f)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __UNKNOWN_10646_CHAR;=
<br>
&gt; +--<br>
&gt; +2.27.0<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch b/meta/=
recipes-core/glibc/glibc/CVE-2021-3326.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5f4270a6c8<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-core/glibc/glibc/CVE-2021-3326.patch<br>
&gt; @@ -0,0 +1,297 @@<br>
&gt; +From 7d88c6142c6efc160c0ee5e4f85cde382c072888 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Florian Weimer &lt;fweimer@redhat.com&gt;<br>
&gt; +Date: Wed, 27 Jan 2021 13:36:12 +0100<br>
&gt; +Subject: [PATCH] gconv: Fix assertion failure in ISO-2022-JP-3 module=
 (bug<br>
&gt; + 27256)<br>
&gt; +<br>
&gt; +The conversion loop to the internal encoding does not follow<br>
&gt; +the interface contract that __GCONV_FULL_OUTPUT is only returned<br>
&gt; +after the internal wchar_t buffer has been filled completely.&nbsp; T=
his<br>
&gt; +is enforced by the first of the two asserts in iconv/skeleton.c:<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* We must run out of output buffer space in this<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; rerun.&nbsp; */<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; assert (outbuf =3D=3D outerr);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; assert (nstatus =3D=3D __GCONV_FULL_OUTPUT);<br>
&gt; +<br>
&gt; +This commit solves this issue by queuing a second wide character<br>
&gt; +which cannot be written immediately in the state variable, like<br>
&gt; +other converters already do (e.g., BIG5-HKSCS or TSCII).<br>
&gt; +<br>
&gt; +Reported-by: Tavis Ormandy &lt;taviso@gmail.com&gt;<br>
&gt; +<br>
&gt; +CVE: CVE-2021-3326<br>
&gt; +Upstream-Status: Backport [<a href=3D"https://apc01.safelinks.protect=
ion.outlook.com/?url=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.gi=
t%3Ba%3Dpatch%3Bh%3D7d88c6142c6efc160c0ee5e4f85cde382c072888&amp;amp;data=
=3D04%7C01%7CSaloni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C35=
39451eb46e4a26a242ff61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWF=
pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D=
%7C1000&amp;amp;sdata=3DpA1%2BGkOYj%2B%2BYxP2MoiI31NKk5a%2FAwYdivLPnDViRpKE=
%3D&amp;amp;reserved=3D0">https://apc01.safelinks.protection.outlook.com/?u=
rl=3Dhttps%3A%2F%2Fsourceware.org%2Fgit%2F%3Fp%3Dglibc.git%3Ba%3Dpatch%3Bh%=
3D7d88c6142c6efc160c0ee5e4f85cde382c072888&amp;amp;data=3D04%7C01%7CSaloni.=
Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff=
61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdat=
a=3DpA1%2BGkOYj%2B%2BYxP2MoiI31NKk5a%2FAwYdivLPnDViRpKE%3D&amp;amp;reserved=
=3D0</a>]<br>
&gt; +Comment: Refreshed only one hunk in Makefile<br>
&gt; +<br>
&gt; +Signed-off-by: Saloni Jain &lt;Saloni.Jain@kpit.com&gt;<br>
&gt; +---<br>
&gt; + iconvdata/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;=
&nbsp; 4 +-<br>
&gt; + iconvdata/bug-iconv14.c&nbsp;&nbsp; | 127 ++++++++++++++++++++++++++=
++++++++++++<br>
&gt; + iconvdata/iso-2022-jp-3.c |&nbsp; 67 ++++++++++++++------<br>
&gt; + 3 files changed, 178 insertions(+), 20 deletions(-)<br>
&gt; + create mode 100644 iconvdata/bug-iconv14.c<br>
&gt; +<br>
&gt; +diff --git a/iconvdata/Makefile b/iconvdata/Makefile<br>
&gt; +index c8c532a3e4..55c527a5f7 100644<br>
&gt; +--- a/iconvdata/Makefile<br>
&gt; ++++ b/iconvdata/Makefile<br>
&gt; +@@ -74,7 +74,7 @@<br>
&gt; + tests =3D bug-iconv1 bug-iconv2 tst-loading tst-e2big tst-iconv4 bug=
-iconv4 \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tst-iconv6 bug-iconv5 bug-iconv6=
 tst-iconv7 bug-iconv8 bug-iconv9 \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug-iconv10 bug-iconv11 bug-icon=
v12 tst-iconv-big5-hkscs-to-2ucs4 \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug-iconv13<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bug-iconv13 bug-iconv14<br>
&gt; + ifeq ($(have-thread-library),yes)<br>
&gt; + tests +=3D bug-iconv3<br>
&gt; + endif<br>
&gt; +@ -322,6 +322,8 @@ $(objpfx)bug-iconv10.out: $(objpfx)gconv-modules \=
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 $(addprefix $(objpfx),$(modules.so))<br>
&gt; + $(objpfx)bug-iconv12.out: $(objpfx)gconv-modules \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 $(addprefix $(objpfx),$(modules.so))<br>
&gt; ++$(objpfx)bug-iconv14.out: $(objpfx)gconv-modules \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(ad=
dprefix $(objpfx),$(modules.so))<br>
&gt; +<br>
&gt; + $(objpfx)iconv-test.out: run-iconv-test.sh $(objpfx)gconv-modules \<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(add=
prefix $(objpfx),$(modules.so)) \<br>
&gt; +diff --git a/iconvdata/bug-iconv14.c b/iconvdata/bug-iconv14.c<br>
&gt; +new file mode 100644<br>
&gt; +index 0000000000..902f140fa9<br>
&gt; +--- /dev/null<br>
&gt; ++++ b/iconvdata/bug-iconv14.c<br>
&gt; +@@ -0,0 +1,127 @@<br>
&gt; ++/* Assertion in ISO-2022-JP-3 due to two-character sequence (bug 272=
56).<br>
&gt; ++&nbsp;&nbsp; Copyright (C) 2021 Free Software Foundation, Inc.<br>
&gt; ++&nbsp;&nbsp; This file is part of the GNU C Library.<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; The GNU C Library is free software; you can redistribut=
e it and/or<br>
&gt; ++&nbsp;&nbsp; modify it under the terms of the GNU Lesser General Pub=
lic<br>
&gt; ++&nbsp;&nbsp; License as published by the Free Software Foundation; e=
ither<br>
&gt; ++&nbsp;&nbsp; version 2.1 of the License, or (at your option) any lat=
er version.<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; The GNU C Library is distributed in the hope that it wi=
ll be useful,<br>
&gt; ++&nbsp;&nbsp; but WITHOUT ANY WARRANTY; without even the implied warr=
anty of<br>
&gt; ++&nbsp;&nbsp; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.&nb=
sp; See the GNU<br>
&gt; ++&nbsp;&nbsp; Lesser General Public License for more details.<br>
&gt; ++<br>
&gt; ++&nbsp;&nbsp; You should have received a copy of the GNU Lesser Gener=
al Public<br>
&gt; ++&nbsp;&nbsp; License along with the GNU C Library; if not, see<br>
&gt; ++&nbsp;&nbsp; &lt;<a href=3D"https://apc01.safelinks.protection.outlo=
ok.com/?url=3Dhttps%3A%2F%2Fwww.gnu.org%2Flicenses%2F&amp;amp;data=3D04%7C0=
1%7CSaloni.Jain%40kpit.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;amp;sdata=3DATC4wLlR055Je1BzlOKc5TPiEaO2FzX2q0dgiv%2F%2BAck%3D&amp;amp;r=
eserved=3D0">https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Fwww.gnu.org%2Flicenses%2F&amp;amp;data=3D04%7C01%7CSaloni.Jain%40kpit=
.com%7C35f4f714238c416aff5c08d8ed4f7e7a%7C3539451eb46e4a26a242ff61502855c7%=
7C0%7C0%7C637520273080314201%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLC=
JQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DATC4wLl=
R055Je1BzlOKc5TPiEaO2FzX2q0dgiv%2F%2BAck%3D&amp;amp;reserved=3D0</a>&gt;.&n=
bsp;
 */<br>
&gt; ++<br>
&gt; ++#include &lt;iconv.h&gt;<br>
&gt; ++#include &lt;string.h&gt;<br>
&gt; ++#include &lt;errno.h&gt;<br>
&gt; ++#include &lt;support/check.h&gt;<br>
&gt; ++<br>
&gt; ++/* Use an escape sequence to return to the initial state.&nbsp; */<b=
r>
&gt; ++static void<br>
&gt; ++with_escape_sequence (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; iconv_t c =3D iconv_open (&quot;UTF-8&quot;, &quot;ISO-2022-J=
P-3&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (c !=3D (iconv_t) -1);<br>
&gt; ++<br>
&gt; ++&nbsp; char in[] =3D &quot;\e$(O+D\e(B&quot;;<br>
&gt; ++&nbsp; char *inbuf =3D in;<br>
&gt; ++&nbsp; size_t inleft =3D strlen (in);<br>
&gt; ++&nbsp; char out[3];&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Space for one outp=
ut character.&nbsp; */<br>
&gt; ++&nbsp; char *outbuf;<br>
&gt; ++&nbsp; size_t outleft;<br>
&gt; ++<br>
&gt; ++&nbsp; outbuf =3D out;<br>
&gt; ++&nbsp; outleft =3D sizeof (out);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (c, &amp;inbuf, &amp;inleft, &amp;outbuf,=
 &amp;outleft), (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, E2BIG);<br>
&gt; ++&nbsp; TEST_COMPARE (inleft, 3);<br>
&gt; ++&nbsp; TEST_COMPARE (inbuf - in, strlen (in) - 3);<br>
&gt; ++&nbsp; TEST_COMPARE (outleft, sizeof (out) - 2);<br>
&gt; ++&nbsp; TEST_COMPARE (outbuf - out, 2);<br>
&gt; ++&nbsp; TEST_COMPARE (out[0] &amp; 0xff, 0xc3);<br>
&gt; ++&nbsp; TEST_COMPARE (out[1] &amp; 0xff, 0xa6);<br>
&gt; ++<br>
&gt; ++&nbsp; /* Return to the initial shift state, producing the pending<b=
r>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp; character.&nbsp; */<br>
&gt; ++&nbsp; outbuf =3D out;<br>
&gt; ++&nbsp; outleft =3D sizeof (out);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (c, &amp;inbuf, &amp;inleft, &amp;outbuf,=
 &amp;outleft), 0);<br>
&gt; ++&nbsp; TEST_COMPARE (inleft, 0);<br>
&gt; ++&nbsp; TEST_COMPARE (inbuf - in, strlen (in));<br>
&gt; ++&nbsp; TEST_COMPARE (outleft, sizeof (out) - 2);<br>
&gt; ++&nbsp; TEST_COMPARE (outbuf - out, 2);<br>
&gt; ++&nbsp; TEST_COMPARE (out[0] &amp; 0xff, 0xcc);<br>
&gt; ++&nbsp; TEST_COMPARE (out[1] &amp; 0xff, 0x80);<br>
&gt; ++<br>
&gt; ++&nbsp; /* Nothing should be flushed the second time.&nbsp; */<br>
&gt; ++&nbsp; outbuf =3D out;<br>
&gt; ++&nbsp; outleft =3D sizeof (out);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (c, NULL, 0, &amp;outbuf, &amp;outleft), =
0);<br>
&gt; ++&nbsp; TEST_COMPARE (outleft, sizeof (out));<br>
&gt; ++&nbsp; TEST_COMPARE (outbuf - out, 0);<br>
&gt; ++&nbsp; TEST_COMPARE (out[0] &amp; 0xff, 0xcc);<br>
&gt; ++&nbsp; TEST_COMPARE (out[1] &amp; 0xff, 0x80);<br>
&gt; ++<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (c), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++/* Use an explicit flush to return to the initial state.&nbsp; */<br=
>
&gt; ++static void<br>
&gt; ++with_flush (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; iconv_t c =3D iconv_open (&quot;UTF-8&quot;, &quot;ISO-2022-J=
P-3&quot;);<br>
&gt; ++&nbsp; TEST_VERIFY_EXIT (c !=3D (iconv_t) -1);<br>
&gt; ++<br>
&gt; ++&nbsp; char in[] =3D &quot;\e$(O+D&quot;;<br>
&gt; ++&nbsp; char *inbuf =3D in;<br>
&gt; ++&nbsp; size_t inleft =3D strlen (in);<br>
&gt; ++&nbsp; char out[3];&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Space for one outp=
ut character.&nbsp; */<br>
&gt; ++&nbsp; char *outbuf;<br>
&gt; ++&nbsp; size_t outleft;<br>
&gt; ++<br>
&gt; ++&nbsp; outbuf =3D out;<br>
&gt; ++&nbsp; outleft =3D sizeof (out);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (c, &amp;inbuf, &amp;inleft, &amp;outbuf,=
 &amp;outleft), (size_t) -1);<br>
&gt; ++&nbsp; TEST_COMPARE (errno, E2BIG);<br>
&gt; ++&nbsp; TEST_COMPARE (inleft, 0);<br>
&gt; ++&nbsp; TEST_COMPARE (inbuf - in, strlen (in));<br>
&gt; ++&nbsp; TEST_COMPARE (outleft, sizeof (out) - 2);<br>
&gt; ++&nbsp; TEST_COMPARE (outbuf - out, 2);<br>
&gt; ++&nbsp; TEST_COMPARE (out[0] &amp; 0xff, 0xc3);<br>
&gt; ++&nbsp; TEST_COMPARE (out[1] &amp; 0xff, 0xa6);<br>
&gt; ++<br>
&gt; ++&nbsp; /* Flush the pending character.&nbsp; */<br>
&gt; ++&nbsp; outbuf =3D out;<br>
&gt; ++&nbsp; outleft =3D sizeof (out);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (c, NULL, 0, &amp;outbuf, &amp;outleft), =
0);<br>
&gt; ++&nbsp; TEST_COMPARE (outleft, sizeof (out) - 2);<br>
&gt; ++&nbsp; TEST_COMPARE (outbuf - out, 2);<br>
&gt; ++&nbsp; TEST_COMPARE (out[0] &amp; 0xff, 0xcc);<br>
&gt; ++&nbsp; TEST_COMPARE (out[1] &amp; 0xff, 0x80);<br>
&gt; ++<br>
&gt; ++&nbsp; /* Nothing should be flushed the second time.&nbsp; */<br>
&gt; ++&nbsp; outbuf =3D out;<br>
&gt; ++&nbsp; outleft =3D sizeof (out);<br>
&gt; ++&nbsp; TEST_COMPARE (iconv (c, NULL, 0, &amp;outbuf, &amp;outleft), =
0);<br>
&gt; ++&nbsp; TEST_COMPARE (outleft, sizeof (out));<br>
&gt; ++&nbsp; TEST_COMPARE (outbuf - out, 0);<br>
&gt; ++&nbsp; TEST_COMPARE (out[0] &amp; 0xff, 0xcc);<br>
&gt; ++&nbsp; TEST_COMPARE (out[1] &amp; 0xff, 0x80);<br>
&gt; ++<br>
&gt; ++&nbsp; TEST_COMPARE (iconv_close (c), 0);<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++static int<br>
&gt; ++do_test (void)<br>
&gt; ++{<br>
&gt; ++&nbsp; with_escape_sequence ();<br>
&gt; ++&nbsp; with_flush ();<br>
&gt; ++&nbsp; return 0;<br>
&gt; ++}<br>
&gt; ++<br>
&gt; ++#include &lt;support/test-driver.c&gt;<br>
&gt; +diff --git a/iconvdata/iso-2022-jp-3.c b/iconvdata/iso-2022-jp-3.c<br=
>
&gt; +index 3eaa847ad9..c8ba88cdc9 100644<br>
&gt; +--- a/iconvdata/iso-2022-jp-3.c<br>
&gt; ++++ b/iconvdata/iso-2022-jp-3.c<br>
&gt; +@@ -67,23 +67,34 @@ enum<br>
&gt; +&nbsp;&nbsp; CURRENT_SEL_MASK =3D 7 &lt;&lt; 3<br>
&gt; + };<br>
&gt; +<br>
&gt; +-/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of th=
e state<br>
&gt; +-&nbsp;&nbsp; also contains the last two bytes to be output, shifted =
by 6 bits, and a<br>
&gt; +-&nbsp;&nbsp; one-bit indicator whether they must be preceded by the =
shift sequence,<br>
&gt; +-&nbsp;&nbsp; in bit 22.&nbsp; */<br>
&gt; ++/* During UCS-4 to ISO-2022-JP-3 conversion, the COUNT element of th=
e<br>
&gt; ++&nbsp;&nbsp; state also contains the last two bytes to be output, sh=
ifted by 6<br>
&gt; ++&nbsp;&nbsp; bits, and a one-bit indicator whether they must be prec=
eded by the<br>
&gt; ++&nbsp;&nbsp; shift sequence, in bit 22.&nbsp; During ISO-2022-JP-3 t=
o UCS-4<br>
&gt; ++&nbsp;&nbsp; conversion, COUNT may also contain a non-zero pending w=
ide<br>
&gt; ++&nbsp;&nbsp; character, shifted by six bits.&nbsp; This happens for =
certain inputs in<br>
&gt; ++&nbsp;&nbsp; JISX0213_1_2004_set and JISX0213_2_set if the second wi=
de character<br>
&gt; ++&nbsp;&nbsp; in a combining sequence cannot be written because the b=
uffer is<br>
&gt; ++&nbsp;&nbsp; full.&nbsp; */<br>
&gt; +<br>
&gt; + /* Since this is a stateful encoding we have to provide code which r=
esets<br>
&gt; +&nbsp;&nbsp;&nbsp; the output state to the initial state.&nbsp; This =
has to be done during the<br>
&gt; +&nbsp;&nbsp;&nbsp; flushing.&nbsp; */<br>
&gt; + #define EMIT_SHIFT_TO_INIT \<br>
&gt; +-&nbsp; if ((data-&gt;__statep-&gt;__count &amp; ~7) !=3D ASCII_set)&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
\<br>
&gt; ++&nbsp; if (data-&gt;__statep-&gt;__count !=3D ASCII_set)&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (FROM_DIRECTION)&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* It's easy, we don't ha=
ve to emit anything, we just reset the&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; state f=
or the input.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;__statep-&gt;__c=
ount &amp;=3D 7;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; data-&gt;__statep-&gt;__c=
ount |=3D ASCII_set;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (__glibc_likely (outbu=
f + 4 &lt;=3D outend))&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Write out the last character.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
((uint32_t *) outbuf) =3D data-&gt;__statep-&gt;__count &gt;&gt; 6;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; o=
utbuf +=3D sizeof (uint32_t);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d=
ata-&gt;__statep-&gt;__count =3D ASCII_set;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We don't h=
ave enough room in the output buffer.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; status =3D __=
GCONV_FULL_OUTPUT;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +@@ -151,7 +162,21 @@ enum<br>
&gt; + #define LOOPFCT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; FROM_LOOP<br>
&gt; + #define BODY \<br>
&gt; +&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +-&nbsp;&nbsp;&nbsp; uint32_t ch =3D *inptr;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp; uint32_t ch;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Output any pending character.&nbsp; */&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp; ch =3D set &gt;&gt; 6;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp; if (__glibc_unlikely (ch !=3D 0))&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
\<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; put32 (outptr, ch);&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outptr +=3D 4;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Remove the pending character, but =
preserve state bits.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set &amp;=3D (1 &lt;&lt; 6) - 1;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp; /* Otherwise read the next input byte.&nbsp; */&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br=
>
&gt; ++&nbsp;&nbsp;&nbsp; ch =3D *inptr;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Recognize escape sequences.&nbsp; */&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (__glibc_unlikely (ch =3D=3D ESC))&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<b=
r>
&gt; +@@ -297,21 +322,25 @@ enum<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t=
 u1 =3D __jisx0213_to_ucs_combining[ch - 1][0];&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t=
 u2 =3D __jisx0213_to_ucs_combining[ch - 1][1];&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inptr +=3D 2;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; put32 (outptr=
, u1);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; outptr +=3D 4=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* See w=
hether we have room for two characters.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (outptr + =
8 &lt;=3D outend)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (outptr + =
4 &lt;=3D outend)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; {&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; inptr +=3D 2;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; put32 (outptr, u1);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; outptr +=3D 4;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; put32 (outptr, u2);&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; outptr +=3D 4;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; continue;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; {=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<=
br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; result =3D __GCONV_FULL_OUTPUT;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; break;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<=
br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Otherwise =
store only the first character now, and&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; put the second one into the queue.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; set |=3D u2 &=
lt;&lt; 6;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Tell the c=
aller why we terminate the loop.&nbsp; */&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result =3D __=
GCONV_FULL_OUTPUT;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; \<br>
&gt; ++&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; inptr +=3D 2;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; +--<br>
&gt; +2.27.0<br>
&gt; diff --git a/meta/recipes-core/glibc/glibc_2.31.bb b/meta/recipes-core=
/glibc/glibc_2.31.bb<br>
&gt; index b75bbb4196..77eb5b481b 100644<br>
&gt; --- a/meta/recipes-core/glibc/glibc_2.31.bb<br>
&gt; +++ b/meta/recipes-core/glibc/glibc_2.31.bb<br>
&gt; @@ -41,9 +41,10 @@ SRC_URI =3D&nbsp; &quot;${GLIBC_GIT_URI};branch=3D$=
{SRCBRANCH};name=3Dglibc \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://0027-intl-Emit-no-lines-in-bison-generated-files.=
patch">
file://0027-intl-Emit-no-lines-in-bison-generated-files.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://0028-inject-file-assembly-directives.patch">file:=
//0028-inject-file-assembly-directives.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://0029-locale-prevent-maybe-uninitialized-errors-wi=
th-Os-BZ.patch">
file://0029-locale-prevent-maybe-uninitialized-errors-with-Os-BZ.patch</a> =
\<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2019-25013.patch">file://CVE-2019-25013.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://CVE-2020-29562.patch">file://CVE-2020-29562.patch=
</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <a href=3D"file://CVE-2020-29573.patch">file://CVE-2020-29573.patch=
</a> \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2019-25013.patch">file://CVE-2019-25013.patch</a> \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://CVE-2021-3326.patch">file://CVE-2021-3326.patch</a> \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; &quot;<br>
&gt;&nbsp;&nbsp; S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;&nbsp;&nbsp; B =3D &quot;${WORKDIR}/build-${TARGET_SYS}&quot;<br>
&gt; --<br>
&gt; 2.17.1<br>
&gt; <br>
&gt; This message contains information that may be privileged or confidenti=
al and is the property of the KPIT Technologies Ltd. It is intended only fo=
r the person to whom it is addressed. If you are not the intended recipient=
, you are not authorized to read, print,
 retain copy, disseminate, distribute, or use this message or any part ther=
eof. If you receive this message in error, please notify the sender immedia=
tely and delete all copies of this message. KPIT Technologies Ltd. does not=
 accept any liability for virus
 infected mails.<br>
&gt; <br>
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

--_000_MA1PR01MB3257204AD1DE47E30A709C1087659MA1PR01MB3257INDP_--
