Received: from IND01-BO1-obe.outbound.protection.outlook.com (IND01-BO1-obe.outbound.protection.outlook.com [40.107.139.81])
 by mx.groups.io with SMTP id smtpd.web11.5602.1623736472503409479
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Jun 2021 22:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=R0qpuYI0;
 spf=pass (domain: kpit.com, ip: 40.107.139.81, mailfrom: rahul.taya@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VJPeg1M6dbLboM1Y9OPVGhU6Dw2K56VP3bqiaRk8gYO297oVNUYE/89b6D4acX8bQ+2Wfd1kmTGpx/a+1Rq/+1xK0M3v1y5SfrShbmbGvE2LIdT/gB8LcA24akuZwPMBEh2L95RvgxeRgFNg4AegMlujAogy/jqMpUUIf7rgtNxvTf49X+eGlGu5KFe12MCW8dkoJNpsInUDRP+j/PQ0EjUUcqs5aZfU1ytY7S+texrMzi7SZ0Rq0SPEUFmlHbHM7lYA5CiQ1vkQXen7p4y9nfZbvGqnXIxXLCcJOeiAb3j7ZAnFMcxSA5J7lmxs991txLvNPBptMGokMpJJJN7GmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SODyqhHXnv+oN0SyphCa0V7/L89TGfMCipd/LlvxOs=;
 b=GWVtTVm6RYsj+Zbq64N3dqoblK+HZi/Lo4qStKGWVHVHhvnGN0INm44wMdRbOr/97t6Tbd9WYGwzgh4aQXlSLB0IoTt4oSWEUyeDmkXFAPCWl3nnZnIqUv1pwQV3p8YKWoj/MHfWQa2IessRP3svtxSwheLpq3D/UBloBs9UG0QUoU9nQ1OCo3IDadijzezwDIyUB7kDgpzsIcxakqL3JkJaR49sJ+U4XphbsmSrsGjKL0jgkrrctXWtYbKjX4qNQX5ktOySQJ7qsdJ5DZpj5zILqgr9NbdztdqM4MGwifJrfzTcJtz6Esebllz7e0KOzBcCi8lkCd0rzVkEUicXVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+SODyqhHXnv+oN0SyphCa0V7/L89TGfMCipd/LlvxOs=;
 b=R0qpuYI0dhStdB4yWOjWoqjrZywHyf1DNfvLPe5fpQDL6HHtDAmrktyDOpFmN2qTrAIBVt5BzHntfLIXuSguXFOnd2baDyNxqiPT5lYLpaKZBh59OL6XvPVc6IzuDtU5JSQO/P9vjuQwI2Nc99VnXaiTaF/pNLXQLNsQvt2o0Ps=
Received: from PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:9::8) by
 PN1PR0101MB1246.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c00:1b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Tue, 15 Jun
 2021 05:54:26 +0000
Received: from PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8cbd:3dc3:4a21:b81]) by PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8cbd:3dc3:4a21:b81%4]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 05:54:26 +0000
From: "Rahul Taya" <Rahul.Taya@kpit.com>
To: "sakoman@gmail.com" <sakoman@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>,
	Nisha Parrakat <Nisha.Parrakat@kpit.com>, Purushottam Choudhary
	<Purushottam.Choudhary@kpit.com>, Armin Kuster <akuster808@gmail.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-2015-5237
Thread-Topic: [OE-core] [meta-oe][dunfell][PATCH] protobuf: Whitelist
 CVE-2015-5237
Thread-Index: AQHXYQrTgxWilakCMEu9sNGCapK24KsTpouAgAAyIICAALk+Og==
Date: Tue, 15 Jun 2021 05:54:25 +0000
Message-ID: 
 <PN2PR01MB45080AC29C30B5313916F001F2309@PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM>
References: <20210614104631.3190-1-Rahultaya96@gmail.com>
 <2f2de529-721b-b561-ef3d-ac93a7da3178@gmail.com>,<CAGDS+nnPm_5HLyf7DzwXt+CLdGqm0yL338_fv6z_pfyxzT1gbw@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nnPm_5HLyf7DzwXt+CLdGqm0yL338_fv6z_pfyxzT1gbw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=kpit.com;
x-originating-ip: [103.93.114.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81e16227-183d-4ccf-dab0-08d92fc20873
x-ms-traffictypediagnostic: PN1PR0101MB1246:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <PN1PR0101MB1246E31180BC602842D31123F2309@PN1PR0101MB1246.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 KEL7BSHc5XgEigObjAuBWgoAz6EthjibP9AzwpALNW4LqmUgyY89Rhapy47FDv/idY0oF/50EyADyR5Ag6XSFUuuimqF/exxR0YexuFHXHQjDItE9AtzanAKldxBYIq8KuROwvO/bKxGoIJqovIerAFT92lS0iAL+VDbMHhA8kqCAGBsbnFnCdcuyv9kbiJ41EQrDpgtqa3a3P7Xff/s1beFnWZ66gFB6S8aa4tz3oKfUzxtlkBVzRiAzv8S54+ghfHCHnlrSekE2RL1qV6lwdh+UsjQwIavFK6q+eRYoz8Y501h9u5zDoxE+RQrQ0Ugq2GEoarHrwUxn1XferyB9MI9kw9H7k7Iyw1AML6XAVYQoZWj+spdIcw8gWXqckO6M+mLptjFgAbkmQowKYYk56scT8LcFIYescBmrw0Hj3qKcUxH1kwWAux7YnnZXiGUjBY1A8CbTGnIodSOscmtuZjOuNlrHZgbsd8H6I8Lm+LVVudaDEZFIm8xReAtBojDiX6xrGl1bICzxAJK1fR8Oe93AewiXmHVOiAreotvsvE7BaUOdgEfWB3fHqsz6j63nCZ88lXAWuO9bEXS47cYdzGfXaahRpmAnBgx/b/IHH7vj3exXNH0/VB3+LeWEwujJaTWB/KlHLhke4dRrhNgsekcuwuxZTnPKe9hlVvUWiC+f7NQoBCURg18P5DwKbxTA8WOfQ1PGW2fjk5IDWSWD0POcGb4b7ZQRSg/Fg34j6I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(39850400004)(396003)(376002)(346002)(136003)(7696005)(45080400002)(83380400001)(478600001)(38100700002)(71200400001)(26005)(6916009)(966005)(122000001)(8936002)(66574015)(186003)(4326008)(53546011)(6506007)(55016002)(8676002)(316002)(33656002)(9686003)(86362001)(54906003)(166002)(5660300002)(52536014)(66946007)(2906002)(76116006)(66476007)(64756008)(19627405001)(66556008)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?SDbCqqDftiqAEKNoA8krM1Zo6ISg4LQB4UvtEIv4NfIgiWDlxSf2P03R4a9/?=
 =?us-ascii?Q?zr4MTDdJnNUDdOPY01yMBhOzmpf78KzEyrc4E4Cqz+50s4grTAg8qm9tJvVF?=
 =?us-ascii?Q?HgLuj5F4gdcC9dEZ/GVf7eMAH/NkeRiF2bF+DXCHLAce2qHup/I9swcZAptR?=
 =?us-ascii?Q?+nbJ0+CeDBvKOHxjzDnAtIQIdzvbQMJ1Q0sBsRQSQUDXwuBf8hAAiT5yqJpd?=
 =?us-ascii?Q?87jh3jpPQ/ekFOxoj67sHl+7D3bABR0wzERctif3AYn0Qr3+YQ61E6okWnBK?=
 =?us-ascii?Q?58mXwEMY7W1dESqDjrRqmKLrtJU2oVbpkwVdXdoghQw770neTvgGQpQleY96?=
 =?us-ascii?Q?qlZcck/mWMFA8RQ+s3s9jTlDVT/uRbaA/UzxoPG3+ek+y6W5WYIrWWZnZ050?=
 =?us-ascii?Q?cxZkbgMyVy2+j18EJhUM7/l6jjXbiSqEOWvZzwxCwqLVrEXjTnUgtAvAcFAk?=
 =?us-ascii?Q?FrZnVOrDyHWvdAT3wmWhCv4BJvGVhiZntyXACYrpxmukB6X7R0zgcEmraHQ/?=
 =?us-ascii?Q?FE31Q4k7p12Ov4U+PhXLF4jmXyVKCKHP9B3vSHXA12GVldy8kfkdf808CDWB?=
 =?us-ascii?Q?1Gx4s+7+sDEuAKfRpcnhNg45LnCrsgDDWAa1UD7ZNRtcF7ckbT6LkeuVf/Se?=
 =?us-ascii?Q?Qj0Ka4oriKluEZlOeWkdlkRPDsIpiCAI151xtruh6Lqw39xeZ+Xt788aE0oD?=
 =?us-ascii?Q?tbh5QDgatSX9bSaEwSvnf0CxT1m/KSZmrbWdX6axoYS6rnl2/tQqKmdvx0Kf?=
 =?us-ascii?Q?avd+75lrFAAGF1VxwbW5z/okOhd2A+piwYumtK+VZfPvmk38YHMxAHxbo58v?=
 =?us-ascii?Q?oTHXlsu+TNHUjPZHjSpPlvJz4OQ7QSH9eUC+HsQr9yujybfA17SCcuaXSI9H?=
 =?us-ascii?Q?hFrXbPxNuo4rvhyB42UgqAhOC8GP87EaEKpj3RdmNR9x5lDquzeggnF2EkLT?=
 =?us-ascii?Q?CCu/KV+N3FrA8+K+L1X11muhSKterEn65D0kDq0Xae38GnoEECGUdND+Snzu?=
 =?us-ascii?Q?sGqr0FhM0Jpfg1mlHhnLMsHKWcRQUluQUsyn7BtCbVbXflFo7BYD7WHXwKm4?=
 =?us-ascii?Q?CoBJr0Ajig067H+iyQARDeHhKCv06Adlg10qOOtA/vemP9kZh2BnY1Wlt2Ko?=
 =?us-ascii?Q?uCkip4n1CnvHKLPk993fIG0L0oUXgB2WPo5jW1k4kxNJBlKePA7oQlp9TF2O?=
 =?us-ascii?Q?FrS+V2ePMA5HszozD7Bv1n9IodYRbnZZuQVdiUTDudH3X5i0kHmWMXhOccXu?=
 =?us-ascii?Q?jnE0TuYQZvA9YiPhQm+PhtjkNFpf+UW9vw0AWMZBHYsdl1vQ9YHeP0RtPIpy?=
 =?us-ascii?Q?pc3viIPrtrHxdcdDVc39AjQI?=
MIME-Version: 1.0
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB4508.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 81e16227-183d-4ccf-dab0-08d92fc20873
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2021 05:54:25.2562
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zc3bCwvEa35lDQCkpAAUAO2DQ6ftEy2DZQqsV7IUKvq4cBokj1Qc/9NclnngrJxvDXIeRDpfmwezAZogW0ACyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PR0101MB1246
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_PN2PR01MB45080AC29C30B5313916F001F2309PN2PR01MB4508INDP_"

--_000_PN2PR01MB45080AC29C30B5313916F001F2309PN2PR01MB4508INDP_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Steve/Akuster,

I think as i have sent this patch to: openembedded-core@lists.openembedded.=
org
that's why this tag [OE-core] is automatically added as i have not added it=
 .

Please do not consider this patch i will send a new one to:

openembedded-devel@lists.openembedded.org


And as per NVD it affects version upto 3.1 (including)
https://nvd.nist.gov/vuln/detail/CVE-2015-5237#range-6634983


Thanks and Regards,
Rahul Taya
________________________________
From: openembedded-core@lists.openembedded.org <openembedded-core@lists.ope=
nembedded.org> on behalf of Steve Sakoman via lists.openembedded.org <sakom=
an=3Dgmail.com@lists.openembedded.org>
Sent: Tuesday, June 15, 2021 12:14 AM
To: RAHUL taya <rahultaya96@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@list=
s.openembedded.org>; Khem Raj <raj.khem@gmail.com>; Nisha Parrakat <Nisha.P=
arrakat@kpit.com>; Purushottam Choudhary <Purushottam.Choudhary@kpit.com>; =
Armin Kuster <akuster808@gmail.com>
Subject: Re: [OE-core] [meta-oe][dunfell][PATCH] protobuf: Whitelist CVE-20=
15-5237

On Mon, Jun 14, 2021 at 5:45 AM Armin Kuster <akuster808@gmail.com> wrote:
>
>
>
> On 6/14/21 3:46 AM, RAHUL taya wrote:
> > As per below reference links this CVE issue seems to be minor and
> > harmless and as per upstream this is not a real issue in practice.
> >
> > And as per red hat this issue is marked as low severity.
> >
> > 1. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
bugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;data=3D04%7C01%7C=
Rahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DJshJaYWDGbjS%2BKDl9edlfrVB%2BSK3bv1l1TA%2BoVj4V4k%3D&amp;reserved=3D0
> > 2. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;data=3D04%7C01%7C=
Rahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DyUE0n3WsdYOfAyF3yOsDdJxpjWiOdevwJTvlddmmWG8%3D&amp;reserved=3D0
> > 3. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
ubuntu.com%2Fsecurity%2FCVE-2015-5237&amp;data=3D04%7C01%7CRahul.Taya%40kpi=
t.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DiFCm4U0STA=
4Y%2F1v%2FJUP%2FMNUf%2F6hh%2FbtIdwMdMa53tl8%3D&amp;reserved=3D0
> > 4. https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;data=3D04%7C01%7=
CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3Dz8SsawnKwk224oMuShYIsQwG9fGrfzRgR1Nzj%2FnJ8Yg%3D&amp;reserved=3D0
> Thanks,
>
> Please use the openembedded-devel@lists.openembedded.org
>  for meta-oe patches.

Also only tag for the intended repo, in this case [meta-oe].  I can't
imagine a case where you would need to tag a patch with both [OE-core]
and [meta-oe]!

This maintainer gets confused easily, so if you tag a patch for
[OE-core] and it is for a recipe in [meta-oe] I will waste time in a
state of confusion ;-)

Steve

> -armin
> >
> > Upstream-Status: Pending
> >
> > Signed-off-by: Rahul Taya <Rahultaya96@gmail.com>
> > ---
> >  meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/met=
a-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> > index 4d6c5b255..f845a72a0 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> > @@ -88,3 +88,11 @@ LDFLAGS_append_arm =3D " -latomic"
> >  LDFLAGS_append_mips =3D " -latomic"
> >  LDFLAGS_append_powerpc =3D " -latomic"
> >  LDFLAGS_append_mipsel =3D " -latomic"
> > +
> > +# As per below links this issue is minor and harmless and
> > +# as per upstream this is not a real issue in practice.
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
bugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;data=3D04%7C01%7C=
Rahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3D4SctlXfyhEg32X7RbVLb0NJiXRHVzh4QiQANVDNWMRQ%3D&amp;reserved=3D0
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
security-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;data=3D04%7C01%7C=
Rahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26=
a242ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJWI=
joiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sd=
ata=3DoOWCXMpoie6c4G01wy%2B6HV4npUDN8DKGeUkr1v%2BnjF0%3D&amp;reserved=3D0
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
ubuntu.com%2Fsecurity%2FCVE-2015-5237&amp;data=3D04%7C01%7CRahul.Taya%40kpi=
t.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a242ff61502855c7=
%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL=
CJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DL%2BYvWUGb=
eOxZ0XLHd1FmFJ2DxpASrpz%2Bs727%2B2%2B3XFA%3D&amp;reserved=3D0
> > +# https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2F=
github.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;data=3D04%7C01%7=
CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a2=
6a242ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJW=
IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;s=
data=3DL%2Bb26sD4AhZslzqBrM4Fijme1vaLgU0z94mn0Toukf4%3D&amp;reserved=3D0
> > +CVE_CHECK_WHITELIST +=3D "CVE-2015-5237"
> >
> >
> >
>
>
>
>
This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

--_000_PN2PR01MB45080AC29C30B5313916F001F2309PN2PR01MB4508INDP_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Hi Steve/Akuster,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I think as i have sent this patch to: openembedded-core@lists.openembedded.=
org<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
that's why this tag [OE-core] is automatically added as i have not added it=
 .<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Please do not consider this patch i will send a new one to:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<b>openembedded-devel@lists.openembedded.org</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<b><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
And as per NVD it affects version upto 3.1 (including)</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<b><a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2015-5237#range-6634983"=
 id=3D"LPlnk723673">https://nvd.nist.gov/vuln/detail/CVE-2015-5237#range-66=
34983</a><br>
</b></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<b></b><br>
</div>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature">
<div>
<div></div>
<div name=3D"divtagdefaultwrapper" style=3D"font-family:Calibri,Arial,Helve=
tica,sans-serif; font-size:; margin:0">
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Thanks and Re=
gards,</span></div>
<div><span style=3D"font-family:Calibri,Helvetica,sans-serif">Rahul Taya</s=
pan><br>
</div>
</div>
</div>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-core@lis=
ts.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt; on beh=
alf of Steve Sakoman via lists.openembedded.org
 &lt;sakoman=3Dgmail.com@lists.openembedded.org&gt;<br>
<b>Sent:</b> Tuesday, June 15, 2021 12:14 AM<br>
<b>To:</b> RAHUL taya &lt;rahultaya96@gmail.com&gt;<br>
<b>Cc:</b> Patches and discussions about the oe-core layer &lt;openembedded=
-core@lists.openembedded.org&gt;; Khem Raj &lt;raj.khem@gmail.com&gt;; Nish=
a Parrakat &lt;Nisha.Parrakat@kpit.com&gt;; Purushottam Choudhary &lt;Purus=
hottam.Choudhary@kpit.com&gt;; Armin Kuster &lt;akuster808@gmail.com&gt;<br=
>
<b>Subject:</b> Re: [OE-core] [meta-oe][dunfell][PATCH] protobuf: Whitelist=
 CVE-2015-5237</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Mon, Jun 14, 2021 at 5:45 AM Armin Kuster &lt;a=
kuster808@gmail.com&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 6/14/21 3:46 AM, RAHUL taya wrote:<br>
&gt; &gt; As per below reference links this CVE issue seems to be minor and=
<br>
&gt; &gt; harmless and as per upstream this is not a real issue in practice=
.<br>
&gt; &gt;<br>
&gt; &gt; And as per red hat this issue is marked as low severity.<br>
&gt; &gt;<br>
&gt; &gt; 1. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;=
amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e=
7c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;amp;sdata=3DJshJaYWDGbjS%2BKDl9edlfrVB%2BSK3bv1l1TA%2BoV=
j4V4k%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;amp;data=3D04%7C01%7CRah=
ul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;s=
data=3DJshJaYWDGbjS%2BKDl9edlfrVB%2BSK3bv1l1TA%2BoVj4V4k%3D&amp;amp;reserve=
d=3D0</a><br>
&gt; &gt; 2. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;=
amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e=
7c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;amp;sdata=3DyUE0n3WsdYOfAyF3yOsDdJxpjWiOdevwJTvlddmmWG8%=
3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7CRah=
ul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;s=
data=3DyUE0n3WsdYOfAyF3yOsDdJxpjWiOdevwJTvlddmmWG8%3D&amp;amp;reserved=3D0<=
/a><br>
&gt; &gt; 3. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C=
01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;amp;sdata=3DiFCm4U0STA4Y%2F1v%2FJUP%2FMNUf%2F6hh%2FbtIdwMdMa53tl8%3D&amp=
;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu.=
com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.c=
om%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a242ff61502855c7%7C=
0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DiFCm4U0ST=
A4Y%2F1v%2FJUP%2FMNUf%2F6hh%2FbtIdwMdMa53tl8%3D&amp;amp;reserved=3D0</a><br=
>
&gt; &gt; 4. <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp=
;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648=
e7c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592931217228847%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3Dz8SsawnKwk224oMuShYIsQwG9fGrfzRgR1Nzj%2FnJ8=
Yg%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;amp;data=3D04%7C01%7CRa=
hul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637592931217228847%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3Dz8SsawnKwk224oMuShYIsQwG9fGrfzRgR1Nzj%2FnJ8Yg%3D&amp;amp;reserved=
=3D0</a><br>
&gt; Thanks,<br>
&gt;<br>
&gt; Please use the openembedded-devel@lists.openembedded.org<br>
&gt;&nbsp; for meta-oe patches.<br>
<br>
Also only tag for the intended repo, in this case [meta-oe].&nbsp; I can't<=
br>
imagine a case where you would need to tag a patch with both [OE-core]<br>
and [meta-oe]!<br>
<br>
This maintainer gets confused easily, so if you tag a patch for<br>
[OE-core] and it is for a recipe in [meta-oe] I will waste time in a<br>
state of confusion ;-)<br>
<br>
Steve<br>
<br>
&gt; -armin<br>
&gt; &gt;<br>
&gt; &gt; Upstream-Status: Pending<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Rahul Taya &lt;Rahultaya96@gmail.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb | 8 ++=
++++++<br>
&gt; &gt;&nbsp; 1 file changed, 8 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb=
 b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb<br>
&gt; &gt; index 4d6c5b255..f845a72a0 100644<br>
&gt; &gt; --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb<br>
&gt; &gt; +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb<br>
&gt; &gt; @@ -88,3 +88,11 @@ LDFLAGS_append_arm =3D &quot; -latomic&quot;<b=
r>
&gt; &gt;&nbsp; LDFLAGS_append_mips =3D &quot; -latomic&quot;<br>
&gt; &gt;&nbsp; LDFLAGS_append_powerpc =3D &quot; -latomic&quot;<br>
&gt; &gt;&nbsp; LDFLAGS_append_mipsel =3D &quot; -latomic&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# As per below links this issue is minor and harmless and<br>
&gt; &gt; +# as per upstream this is not a real issue in practice.<br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fbugzilla.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;=
amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e=
7c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;amp;sdata=3D4SctlXfyhEg32X7RbVLb0NJiXRHVzh4QiQANVDNWMRQ%=
3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbugzill=
a.suse.com%2Fshow_bug.cgi%3Fid%3DCVE-2015-5237&amp;amp;data=3D04%7C01%7CRah=
ul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;s=
data=3D4SctlXfyhEg32X7RbVLb0NJiXRHVzh4QiQANVDNWMRQ%3D&amp;amp;reserved=3D0<=
/a><br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fsecurity-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;=
amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e=
7c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknow=
n%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI=
6Mn0%3D%7C1000&amp;amp;sdata=3DoOWCXMpoie6c4G01wy%2B6HV4npUDN8DKGeUkr1v%2Bn=
jF0%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsecurit=
y-tracker.debian.org%2Ftracker%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7CRah=
ul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a24=
2ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi=
MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;s=
data=3DoOWCXMpoie6c4G01wy%2B6HV4npUDN8DKGeUkr1v%2BnjF0%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fubuntu.com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C=
01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46=
e4a26a242ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8=
eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a=
mp;amp;sdata=3DL%2BYvWUGbeOxZ0XLHd1FmFJ2DxpASrpz%2Bs727%2B2%2B3XFA%3D&amp;a=
mp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fubuntu.=
com%2Fsecurity%2FCVE-2015-5237&amp;amp;data=3D04%7C01%7CRahul.Taya%40kpit.c=
om%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a242ff61502855c7%7C=
0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ=
IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;sdata=3DL%2BYvWUG=
beOxZ0XLHd1FmFJ2DxpASrpz%2Bs727%2B2%2B3XFA%3D&amp;amp;reserved=3D0</a><br>
&gt; &gt; +# <a href=3D"https://apc01.safelinks.protection.outlook.com/?url=
=3Dhttps%3A%2F%2Fgithub.com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp=
;amp;data=3D04%7C01%7CRahul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648=
e7c%7C3539451eb46e4a26a242ff61502855c7%7C0%7C0%7C637592931217238740%7CUnkno=
wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC=
I6Mn0%3D%7C1000&amp;amp;sdata=3DL%2Bb26sD4AhZslzqBrM4Fijme1vaLgU0z94mn0Touk=
f4%3D&amp;amp;reserved=3D0">
https://apc01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgithub.=
com%2Fprotocolbuffers%2Fprotobuf%2Fissues%2F760&amp;amp;data=3D04%7C01%7CRa=
hul.Taya%40kpit.com%7C511769123a5942dcefef08d92f648e7c%7C3539451eb46e4a26a2=
42ff61502855c7%7C0%7C0%7C637592931217238740%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;amp;=
sdata=3DL%2Bb26sD4AhZslzqBrM4Fijme1vaLgU0z94mn0Toukf4%3D&amp;amp;reserved=
=3D0</a><br>
&gt; &gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-5237&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
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

--_000_PN2PR01MB45080AC29C30B5313916F001F2309PN2PR01MB4508INDP_--
