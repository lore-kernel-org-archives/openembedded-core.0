Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.57])
 by mx.groups.io with SMTP id smtpd.web09.28501.1623669517875358971
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 04:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=t4dmO01T;
 spf=pass (domain: kpit.com, ip: 40.107.139.57, mailfrom: purushottam.choudhary@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7h7LP/79KQ7evwIOdR/R0/J10hvhI2wFrS4OtNv1Xdc27jNsJddTP6nI6VCw/yshCtkLaJB/64LGe40m8g/OKJ6za0ScCPm0AlQb+9/2jBt4SWKM2XsfWKmtkmjeAH4kFFIccb+8PFAJxL2w2KuRwwppT0LQepy6jy9bqnrhQHd+CxOlC9H2izZsngzxmfG4grktrtKA2AVLpmqmmcejZKnpW6UnPMnBKz5mKKCLPwoUoZUGRjcRbl6aJMAmHW5yjGtjJWbdUDf5q7xlboyIX4HZ8V7HNDQQAHyZZSqzu/PxDS0WfmjdFaW1H/sPMfqDsMKcttCPT84CbFZtMrQzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCzEFju9lmdyQ//I7e5RJLy8oFHXLFkQl3RgUargoB4=;
 b=Srfr0n8cUQLDKm8uZPv7ftMbiUxALX01ywspEwsHxHj+QXpcBYJZgfATaoDUok9Lf7LVYZkRYIHIkO6WKFDcO4nmy/oWFh+9/M24T7IQcEGPg7bprmrqs4F0m0qpR4okFkwtanwNltciitZP4BvagxcNaPP/2sWjXjGCcpcTTR//LGe2sNITecpJ0sfrGRYNuPyVpwJRR5zzJyA6JJUDIP6o5dXVlV+p13kqiSCt/xGvWi0kYkgQwQw9mnPNZxwk6Bfa8xooMMZ83IrUt6omaETtOk1qLLie4Z4gmZ16BFDHxheWVZmdsrJnwFIZmaYi7S3CgvCtPR2EZ4GaZ8kdXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gCzEFju9lmdyQ//I7e5RJLy8oFHXLFkQl3RgUargoB4=;
 b=t4dmO01Tcj7Lbxe7RSxH8F33NfWER/x9N0GEozOGFfDLrmov0bq1h3HtKv0l9N0cFWmrCW1cBLailg8cz/7dUOSF7tm/psdT3zzQu1mQDC8R0ZV/8WXxGI3zk1axONPSxl/QhGvf7nX0cMsU5pcrQ4ac4JwEaJaSPpXn7sWYOtg=
Received: from BMXPR01MB0853.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:13::23)
 by BMXPR01MB1062.INDPRD01.PROD.OUTLOOK.COM (2603:1096:b00:14::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Mon, 14 Jun
 2021 11:18:29 +0000
Received: from BMXPR01MB0853.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ac49:a697:296d:a1de]) by BMXPR01MB0853.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::ac49:a697:296d:a1de%4]) with mapi id 15.20.4219.022; Mon, 14 Jun 2021
 11:18:29 +0000
From: "Purushottam choudhary" <purushottam.choudhary@kpit.com>
To: Rahul <rahultaya96@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>
CC: Nisha Parrakat <Nisha.Parrakat@kpit.com>
Subject: Re: [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
Thread-Topic: [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
Thread-Index: AQHXYQ6XE8n0RNBwH029pUqawARsXKsTW7K2
Date: Mon, 14 Jun 2021 11:18:28 +0000
Message-ID: 
 <BMXPR01MB0853C3CEAEEF4C599C04410590319@BMXPR01MB0853.INDPRD01.PROD.OUTLOOK.COM>
References: <20210614111515.21348-1-Rahultaya96@gmail.com>
In-Reply-To: <20210614111515.21348-1-Rahultaya96@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [2405:201:a410:a032:99c5:e542:9a23:7da2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5e53ae5-f0fb-4543-dc6a-08d92f26231f
x-ms-traffictypediagnostic: BMXPR01MB1062:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BMXPR01MB1062B0E7272871CA4931433B90319@BMXPR01MB1062.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 ZredcjOOcAZI7WP+oCtcKvY/F4vke/Uoj3qy36AdvLnv/+MRdpnR98upXY7xaOke31MuJV1oUXqiHxWoxJrpf7xs+2MMUo1hhg3olGGHRaVeBZ/FiTC7EMC+VvgFevztC/tnTFhwga9Iist21I+lEsCmsnGAbqXrosJ2uKNqa5Gxo4ZJqUqOjaacxHyvaQw/dyOCwdsUgZ88dQ0k8+INmoklYncaFcPc+6C3Ad2AzCc9jYh3AC9CNEyibuQZxKU7yawKBGYba1WImpE/2T1Qw3PIR1AqwlZIYS8KlnCEzkQ+KdEa44+M5ls7brHs29+G8YChALG7n0miZJm47XTq8ZxfCjKKGMKgpZL+8WJLmPUCvabAiSYZPSW2yKCcUDElYpCUGRhjUJU6CBN5jP4ZWhY2/rpr1tG9p1kus+kcLIhqnhXObhLWPJWQ8DycZflDurr1RHGZW92QP1fuN5XFLjMX6bGjLQVhtaEVO5iIAP++lqXDfn9gS8xy9Uh7TDGMGzcHy/T2S6tQjdS0iPQDHGjfpztEqoyfEn5zkgTqm/3U3cl3IxeQE/ulZvG3SBDlk0VmaDpkguDaPj3UOtsGym1jK4Hb0Wm0lB+tJuS6fCgRJS9YJatyFzKe2YbOrfPEBPRH0bGpbrBVdeuuqFZ8lAj8088lSDUC5CM/zb/H/y4m04DOWIdQv4KMbaaKsqXG9a8d58feuHxgXFV++rl+9WWGrE8Z7kvc0BJQNujJUjc=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BMXPR01MB0853.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(396003)(376002)(186003)(478600001)(966005)(5660300002)(19627405001)(52536014)(83380400001)(166002)(7696005)(45080400002)(8936002)(8676002)(122000001)(86362001)(6506007)(53546011)(66574015)(2906002)(33656002)(38100700002)(71200400001)(110136005)(66446008)(66556008)(64756008)(9686003)(55016002)(4326008)(76116006)(91956017)(107886003)(66946007)(316002)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?zz3pYsyx3dSYAwKFzsC5o6tLfzjQwAppXIt7+zBIYLtwFXoC498A4MNmrSQ7?=
 =?us-ascii?Q?WLqT6bC5j0iJErxvs6MXjcMUlwWR3BCJO9WowKw/4Am8n+ljRGa/Wu4N2+mW?=
 =?us-ascii?Q?p21xY0h+aSwM8P0qvUiB9KUGs3h82Ve8Zqjtgux4L3zdCRtF2j5aVYcuHgHd?=
 =?us-ascii?Q?LMXNd0xw1Vi53RUaYm5jRKSfvXYHnMR9jJ8qIADumbjcnjWdsqRIh0RTBIsk?=
 =?us-ascii?Q?G37QSGsKkJ4Jq+TCD9AoKGwAE4CTymFRKBdxU7lHrSBUzmfHjG04z+yJPOgG?=
 =?us-ascii?Q?H8P4EwDhukhMViOFeScLlr7bGS9w3mFTYky1wR2sZHC5/EgQ7KmzUFVaA8rf?=
 =?us-ascii?Q?PCX9dir9hRXyIsutNHNlioeXQXhH4QkPMb8bTdDK1wsz9QxnR/GRA5ru53tM?=
 =?us-ascii?Q?UdSLIwey9VUNRwF/BS9PVUL634l3u9p+CVjlGeIISXBAt/Pg45PwbbmEDQkB?=
 =?us-ascii?Q?w9NNqffkuu2zYxn1vC+f+BR/ZG5eLpJHOmybcuuuhGTl2+XpewNX9CrKxRRZ?=
 =?us-ascii?Q?vo3ILfeFRWx6QXS+fyvg8CZx8AXPHcFeIlLI5rl4wR1tBHuV3rmeDZmchTDe?=
 =?us-ascii?Q?VjCeUO6sl66qCLUF3phmtrqM08Bq/mV7z5Fr4xNBvIAi8wWSGlk1U0aVtIy/?=
 =?us-ascii?Q?OVEF5USEGMORf0R6D5rzp4nxKWH7OPO7KevX0yFRtBwIPSYpub8zDTAtNDPb?=
 =?us-ascii?Q?d8siy0xTIKSnjCUn5Vv141fA8rcGWEvzmTjJns24r+CP1r4NZnzcKWWSz6fq?=
 =?us-ascii?Q?UVE0WpouycVhdw8a6BWmuS7R3EOr4rtyjXKc6mNsqEpALhkRUy3oucmf/vyH?=
 =?us-ascii?Q?PX39tU/mBenrQDRzvIV/Z6X1+X5U4gC+0F7spSrawftShMKCvLAmEwCBt+rX?=
 =?us-ascii?Q?vvIav+pouyFgdyo/ie/Jk7P5wkz5oMcmZEsRsd0/w5Q8Ibvy5RGdPITYbx7T?=
 =?us-ascii?Q?1aQecK53kvYis/3zV+xt13yCtt0rRNP/wAYG2C8Zb3FukWXZ06no9uOOlx9S?=
 =?us-ascii?Q?AObWxKY9eO039ZleFEPgFfuB5bHtSwybXW2VBoRQCZvoEGEUDjGddM4qHzsT?=
 =?us-ascii?Q?8D/NF/6xqXD2Ctc3Wie4LsUeNwTPW3+sShB6tI6LfLzmiPLFykv5OtM3R2LY?=
 =?us-ascii?Q?TqnxTK2OOsPLOwmajSp9hwA//OidXml03TOd8a9lYxHFRc9GbpvaKRAmkKHe?=
 =?us-ascii?Q?yS74wVmN+RRBRND9C/QYDxB/5X0Gp5J1880rUDrt8WELLWOeQefn+yfU2OON?=
 =?us-ascii?Q?PXmkUGQOkN0vS7U4wHZdPDQZng61Qm25CVY1LNCugtQx8r5akXttcJIdUdRA?=
 =?us-ascii?Q?HGeFZ+2Wo3Brj4kaVtIhZi+LXcwJ7+ZsFf534isJzXiAGfhcjKBrXQdnU1ZT?=
 =?us-ascii?Q?22rO4rdod6wTcHTzz1diL8az4UaN?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BMXPR01MB0853.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e53ae5-f0fb-4543-dc6a-08d92f26231f
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2021 11:18:28.9411
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tLLVB3Tp1Bnrw/9qLAp5gxGyjd12CL+YgJNa9bUzLBTFSphSj317R4lkRHBc/gPiBDHHYvVARS69qv1rBDGYng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BMXPR01MB1062
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BMXPR01MB0853C3CEAEEF4C599C04410590319BMXPR01MB0853INDP_"

--_000_BMXPR01MB0853C3CEAEEF4C599C04410590319BMXPR01MB0853INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Rahul,

Looks good to me.

Thanks & Regards,
Purushottam
________________________________
From: Rahul <rahultaya96@gmail.com>
Sent: Monday, June 14, 2021 4:45 PM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>; raj.khem@gmail.com <raj.khem@gmail.com>
Cc: Nisha Parrakat <Nisha.Parrakat@kpit.com>; Purushottam Choudhary <Purush=
ottam.Choudhary@kpit.com>; Rahul Taya <Rahultaya96@gmail.com>
Subject: [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237

As per below reference links this CVE issue seems to be minor and
harmless and as per upstream this is not a real issue in practice.

And as per red hat this issue is marked as low severity.

1. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz=
illa.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;data=3D04%7C01%7Cpuru=
shottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DoE1VI2w%2FlOIZ%2FmkpVL%2FZaq9aw%2FGcV4b0edHV0mmJk0o%3D&amp;res=
erved=3D0
2. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecu=
rity-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;data=3D04%7C01%7Cpuru=
shottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DWSLRqApgOA9Tu9FBP9e66uhyY3cJUOd9SyXFD0LEn1c%3D&amp;reserved=3D=
0
3. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubun=
tu.com%2Fsecurity%2FCVE-2015-5237&amp;data=3D04%7C01%7Cpurushottam.choudhar=
y%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoSi=
r0LEkiJCeUJtq6IFCwZjY%2Blux%2FuBqN49vCHai%2FR8%3D&amp;reserved=3D0
4. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;data=3D04%7C01%7Cpur=
ushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3Db8Pg5FwlWu0AutQbFJ6RvukNlC7np%2FrLgHu5wcr9Luc%3D&amp;reserved=
=3D0

Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
---
 meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe=
/recipes-devtools/protobuf/protobuf_3.11.4.bb
index 4d6c5b255..f845a72a0 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
@@ -88,3 +88,11 @@ LDFLAGS_append_arm =3D " -latomic"
 LDFLAGS_append_mips =3D " -latomic"
 LDFLAGS_append_powerpc =3D " -latomic"
 LDFLAGS_append_mipsel =3D " -latomic"
+
+# As per below links this issue is minor and harmless and
+# as per upstream this is not a real issue in practice.
+# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugz=
illa.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;data=3D04%7C01%7Cpuru=
shottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DoE1VI2w%2FlOIZ%2FmkpVL%2FZaq9aw%2FGcV4b0edHV0mmJk0o%3D&amp;res=
erved=3D0
+# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecu=
rity-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;data=3D04%7C01%7Cpuru=
shottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb=
46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb3=
d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000=
&amp;sdata=3DWSLRqApgOA9Tu9FBP9e66uhyY3cJUOd9SyXFD0LEn1c%3D&amp;reserved=3D=
0
+# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubun=
tu.com%2Fsecurity%2FCVE-2015-5237&amp;data=3D04%7C01%7Cpurushottam.choudhar=
y%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb46e4a26a242ff615=
02855c7%7C0%7C0%7C637592661322750585%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLj=
AwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D8EW=
GOaenFikIjMC6BTEwwTSyQp1kcYXMkHyRVbVPZWM%3D&amp;reserved=3D0
+# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith=
ub.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;data=3D04%7C01%7Cpur=
ushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637592661322750585%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;sdata=3D0vLwqC9ouL%2F1%2BskVdFJOeE9KCAvF25SBDpazy5ojao4%3D&amp;reserv=
ed=3D0
+CVE_CHECK_WHITELIST +=3D "CVE-2015-5237"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_BMXPR01MB0853C3CEAEEF4C599C04410590319BMXPR01MB0853INDP_
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
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Hi Rahul,<br>
<br>
Looks good to me.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div>Thanks &amp; Regards,</div>
<div>Purushottam<br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Rahul &lt;rahultaya96=
@gmail.com&gt;<br>
<b>Sent:</b> Monday, June 14, 2021 4:45 PM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;; raj.khem@gmail.com &lt;raj.khem@gmail.com&gt;<br=
>
<b>Cc:</b> Nisha Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Purushottam Chou=
dhary &lt;Purushottam.Choudhary@kpit.com&gt;; Rahul Taya &lt;Rahultaya96@gm=
ail.com&gt;<br>
<b>Subject:</b> [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">As per below reference links this CVE issue seems =
to be minor and<br>
harmless and as per upstream this is not a real issue in practice.<br>
<br>
And as per red hat this issue is marked as low severity.<br>
<br>
1. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;amp;data=
=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f2=
5b834%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DoE1VI2w%2FlOIZ%2FmkpVL%2FZaq9aw%2FGcV4b0e=
dHV0mmJk0o%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpur=
ushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DoE1VI2w%2FlOIZ%2FmkpVL%2FZaq9aw%2FGcV4b0edHV0mmJk0o%3D&am=
p;amp;reserved=3D0</a><br>
2. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;amp;data=
=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f2=
5b834%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DWSLRqApgOA9Tu9FBP9e66uhyY3cJUOd9SyXFD0LEn=
1c%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpur=
ushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DWSLRqApgOA9Tu9FBP9e66uhyY3cJUOd9SyXFD0LEn1c%3D&amp;amp;re=
served=3D0</a><br>
3. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpurus=
hottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;amp;sdata=3DoSir0LEkiJCeUJtq6IFCwZjY%2Blux%2FuBqN49vCHai%2FR8%3D&amp;am=
p;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu.=
com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpurushottam.choudha=
ry%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3DoSir0LEkiJCeUJtq6IFCwZjY%2Blux%2FuBqN49vCHai%2FR8%3D&amp;amp;reserved=3D=
0</a><br>
4. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgithub.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;amp;data=
=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f2=
5b834%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3Db8Pg5FwlWu0AutQbFJ6RvukNlC7np%2FrLgHu5wcr=
9Luc%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;amp;data=3D04%7C01%7Cpu=
rushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;amp;sdata=3Db8Pg5FwlWu0AutQbFJ6RvukNlC7np%2FrLgHu5wcr9Luc%3D&amp;amp=
;reserved=3D0</a><br>
<br>
Signed-off-by: Rahul Taya &lt;Rahultaya96@gmail.com&gt;<br>
---<br>
&nbsp;meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++<br>
&nbsp;1 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe=
/recipes-devtools/protobuf/protobuf_3.11.4.bb<br>
index 4d6c5b255..f845a72a0 100644<br>
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb<br>
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb<br>
@@ -88,3 +88,11 @@ LDFLAGS_append_arm =3D &quot; -latomic&quot;<br>
&nbsp;LDFLAGS_append_mips =3D &quot; -latomic&quot;<br>
&nbsp;LDFLAGS_append_powerpc =3D &quot; -latomic&quot;<br>
&nbsp;LDFLAGS_append_mipsel =3D &quot; -latomic&quot;<br>
+<br>
+# As per below links this issue is minor and harmless and<br>
+# as per upstream this is not a real issue in practice.<br>
+# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;amp;data=
=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f2=
5b834%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DoE1VI2w%2FlOIZ%2FmkpVL%2FZaq9aw%2FGcV4b0e=
dHV0mmJk0o%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpur=
ushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DoE1VI2w%2FlOIZ%2FmkpVL%2FZaq9aw%2FGcV4b0edHV0mmJk0o%3D&am=
p;amp;reserved=3D0</a><br>
+# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;amp;data=
=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f2=
5b834%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3DWSLRqApgOA9Tu9FBP9e66uhyY3cJUOd9SyXFD0LEn=
1c%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpur=
ushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451e=
b46e4a26a242ff61502855c7%7C0%7C0%7C637592661322740590%7CUnknown%7CTWFpbGZsb=
3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C100=
0&amp;amp;sdata=3DWSLRqApgOA9Tu9FBP9e66uhyY3cJUOd9SyXFD0LEn1c%3D&amp;amp;re=
served=3D0</a><br>
+# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpurus=
hottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb4=
6e4a26a242ff61502855c7%7C0%7C0%7C637592661322750585%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;amp;sdata=3D8EWGOaenFikIjMC6BTEwwTSyQp1kcYXMkHyRVbVPZWM%3D&amp;amp;rese=
rved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu.=
com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7Cpurushottam.choudha=
ry%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451eb46e4a26a242ff61=
502855c7%7C0%7C0%7C637592661322750585%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=
=3D8EWGOaenFikIjMC6BTEwwTSyQp1kcYXMkHyRVbVPZWM%3D&amp;amp;reserved=3D0</a><=
br>
+# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3=
A%2F%2Fgithub.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;amp;data=
=3D04%7C01%7Cpurushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f2=
5b834%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322750585%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX=
VCI6Mn0%3D%7C1000&amp;amp;sdata=3D0vLwqC9ouL%2F1%2BskVdFJOeE9KCAvF25SBDpazy=
5ojao4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;amp;data=3D04%7C01%7Cpu=
rushottam.choudhary%40kpit.com%7C8eaaa022c7434e8c8d4808d92f25b834%7C3539451=
eb46e4a26a242ff61502855c7%7C0%7C0%7C637592661322750585%7CUnknown%7CTWFpbGZs=
b3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C10=
00&amp;amp;sdata=3D0vLwqC9ouL%2F1%2BskVdFJOeE9KCAvF25SBDpazy5ojao4%3D&amp;a=
mp;reserved=3D0</a><br>
+CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-5237&quot;<br>
-- <br>
2.17.1<br>
<br>
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

--_000_BMXPR01MB0853C3CEAEEF4C599C04410590319BMXPR01MB0853INDP_--
