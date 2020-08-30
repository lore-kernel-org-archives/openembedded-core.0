Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.69])
 by mx.groups.io with SMTP id smtpd.web12.34411.1598804840160851915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Aug 2020 09:27:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=U70NE5FS;
 spf=pass (domain: outlook.com, ip: 40.92.65.69, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b2eMa93GjN+l+MdIF71zLydhdUeYkgOVb3weEE67mrY+IiLDTc4lzYSki3wD1TpOuaUERxXmk7KHCUsTow/BrTJvSnbHwQ6xS/Dvzv9XOsfHxf9AhpFJGVJP7NGJ/buYi14Mxx92K6WJj1WEBf7aKMLEYEqfdmH4xYD3eTNHhT4DfpxnSFUWSH/HbZ65BXdPpJIwu/YK39W9lVM+/fP+57XdfoQFmTgz3NDYNED2F6Nn4ebQZtUBydPOMOeU+ubWbMhVhYWK1DtnYksox8XiDIkIOcNx14VtcYZNXjx4FYwMlE8aNf5qrX0uPoNuNqdNTE+Lz51Km6WtQGg96nZiVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oUAoIa4Hpf92EY/FlUK9BMKA1vDPFOlqTLyYY41S6M=;
 b=B35MozH8JHSC5AM1gf4H95h4PZqBkd5ZgYT9lS6qITX8aYWYspXFJCijVspZieiSQiulJpTiNiE5zDsMV7+ce+L4aEtAFZjkK244ea2PBfbE+stcKaUg0ayWXuEGUw/bR/SvpRuIRjcMVvg1FtVu6kZE93cikIoMdtD4AN0EBO09zWnjewr9ElWBz7novX30mQQTQc7VsfCXlOxJRck22aLpnP9rT5ciu69g0Ydgloc5IvJfEQah3lQLkOcpBkJZAc/qJPPCy1DqA1RJJqEaWk3Ag78W/hJCfqzbpwHLUvaew7bkgurBbhKaq7EBgESFylQVjWNYvkJ4675ygfcwyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7oUAoIa4Hpf92EY/FlUK9BMKA1vDPFOlqTLyYY41S6M=;
 b=U70NE5FSiqM8qxMJaZM8TdvBdTUBTRxDnA3o5xsXPKudxQaImuDtnXhFMkb/1eUyE8kCEfHdHy2ABd90bOghSPGllc5y4UQ3wYEpMOON1xyAg2zx4h16ONktaHlx+FUsSOwQ24kjjArvqWf+hkP03YtxiOlZqcbbErfeHfj68b6s8VBz4fLTUCsbGnJIQl2DKa/MB+11k+6iTaywQPN5MHb0YWVGAvaIbcXrU2mj1PMvsXLevv2YQNw6aoqkSuqBptNtcWcjnAukpCtZ2bwzQp919iU0Gpdwd7lHAcsWYpckqPzh+uDrHXAxbJQ13FYmxvX79HTDnKE5tjzGksSQiw==
Received: from VE1EUR01FT062.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e19::50) by
 VE1EUR01HT131.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e19::369)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.21; Sun, 30 Aug
 2020 16:27:17 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e19::52) by VE1EUR01FT062.mail.protection.outlook.com
 (2a01:111:e400:7e19::324) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend
 Transport; Sun, 30 Aug 2020 16:27:17 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:271A16C7B30E2471159583329C7F6AF5A5C1228C032650A0141950C970BAE1A8;UpperCasedChecksum:CF5F52278846E6788C548B09D6609A7410AE4DB44678D6A58E2D90E2B828A195;SizeAsReceived:9012;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::6c2d:49b3:994:890e]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::6c2d:49b3:994:890e%8]) with mapi id 15.20.3326.025; Sun, 30 Aug 2020
 16:27:16 +0000
Subject: Re: [OE-core] [PATCH v2] cve-update: handle baseMetricV2 as optional
To: Ryan Harkin <ryan.harkin@linaro.org>
CC: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, akuster808@gmail.com
References: <162552C22941F232.11956@lists.openembedded.org>
 <AM7PR05MB68819E7C05243F00A918121DA8720@AM7PR05MB6881.eurprd05.prod.outlook.com>
 <CAD0U-hJ00kreMdgpj0s_geoFkWZcnukdCxHCTxpVpXp_a5G7+w@mail.gmail.com>
From: "Konrad Weihmann" <kweihmann@outlook.com>
Message-ID: <AM7PR05MB688103857C9DE2DA59A0B38BA8500@AM7PR05MB6881.eurprd05.prod.outlook.com>
Date: Sun, 30 Aug 2020 18:27:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CAD0U-hJ00kreMdgpj0s_geoFkWZcnukdCxHCTxpVpXp_a5G7+w@mail.gmail.com>
X-ClientProxiedBy: AM5PR0502CA0012.eurprd05.prod.outlook.com
 (2603:10a6:203:91::22) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <4b4908a0-b733-d4e8-f369-118803720383@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.188.23] (87.141.80.180) by AM5PR0502CA0012.eurprd05.prod.outlook.com (2603:10a6:203:91::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.19 via Frontend Transport; Sun, 30 Aug 2020 16:27:16 +0000
X-Microsoft-Original-Message-ID: <4b4908a0-b733-d4e8-f369-118803720383@outlook.com>
X-TMN: [t2FpkKPgDHI0H+/ExQD19tIGORqRhNEw]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 3dafe0a9-ba17-4c29-daa6-08d84d018efe
X-MS-TrafficTypeDiagnostic: VE1EUR01HT131:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mt/n6owQLIitccnpSEiPqH6JesHgPieEfDWy/xMgIaGk+uBC8jypJUQ5/m8+FL56i99KHmIrdiAeOEId2Ch1s02hVLb4jggxizJRSPotowJu4Q1ruT2jUEeRUGYcfTblYS+C3Nh7a/UyZCPrAbaYMI40kZ7Yryg+NtjGnHN3K35PqaVspVohofXKsTg3ibXxEl5VaNfsiEdP+Ks0vSH4ySRXiELtWuydANJl9ILs6/fFvK940w3zKR2lP5P5agfJ
X-MS-Exchange-AntiSpam-MessageData: 
	DLaFVU8xHwi7fjzrCmcbRl5WttzTI2o3yL9A7JtyXQkWUxJp9QHJjok8atpjTdGT+kFJoEavJn9ZmAIigCUMcATr22LD3QNMAUMdAXhoxvVUUDfLNpSRYOv16eDAMhdp01kwOgB4yqYWKF51q5DBoQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dafe0a9-ba17-4c29-daa6-08d84d018efe
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2020 16:27:16.7664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT062.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR01HT131
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Again this breaks builds for me - please backport the patch to warrior -=20
or ping me, then I do the backporting

Cheers
Konrad

On 28.07.20 17:02, Ryan Harkin wrote:
>=20
>=20
> On Mon, 27 Jul 2020 at 19:26, Konrad Weihmann <kweihmann@outlook.com=20
> <mailto:kweihmann@outlook.com>> wrote:
>=20
>     Hi all,
>=20
>     please consider this patch to be backported to dunfell/zeus and warr=
ior.
>=20
>=20
> I'll second that request. My Warrior and Dunfell builds broke last week=
=20
> because of this.
>=20
>     Master-rev: bbefe04a622e166d95093d5127c316de91b27d20
>=20
>=20
> Thanks for the fix, Konrad.
>=20
>=20
>     Thanks
>     Konrad
>=20
>     On 26.07.20 16:10, Konrad Weihmann wrote:
>      > Currently in NVD DB an item popped up, which hasn't set baseMetri=
cV2.
>      > Let the parser handle it as an optional item.
>      > In case use baseMetricV2 before baseMetricV3
>      >
>      > Signed-off-by: Konrad Weihmann <kweihmann@outlook.com
>     <mailto:kweihmann@outlook.com>>
>      > ---
>      >=C2=A0 =C2=A0meta/recipes-core/meta/cve-update-db-native.bb
>     <http://cve-update-db-native.bb> | 13 +++++++++----
>      >=C2=A0 =C2=A01 file changed, 9 insertions(+), 4 deletions(-)
>      >
>      > diff --git a/meta/recipes-core/meta/cve-update-db-native.bb
>     <http://cve-update-db-native.bb>
>     b/meta/recipes-core/meta/cve-update-db-native.bb
>     <http://cve-update-db-native.bb>
>      > index f27ade40db..32d6dbdffc 100644
>      > --- a/meta/recipes-core/meta/cve-update-db-native.bb
>     <http://cve-update-db-native.bb>
>      > +++ b/meta/recipes-core/meta/cve-update-db-native.bb
>     <http://cve-update-db-native.bb>
>      > @@ -176,15 +176,20 @@ def update_db(c, jsondata):
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not elt['impact']:
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue
>      >
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D None
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cveId =3D elt['cve']['CVE=
_data_meta']['ID']
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cveDesc =3D
>     elt['cve']['description']['description_data'][0]['value']
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0date =3D elt['lastModifie=
dDate']
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D
>     elt['impact']['baseMetricV2']['cvssV2']['accessVector']
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D
>     elt['impact']['baseMetricV2']['cvssV2']['baseScore']
>      > -
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D
>     elt['impact']['baseMetricV2']['cvssV2']['accessVector']
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D
>     elt['impact']['baseMetricV2']['cvssV2']['baseScore']
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cvssv2 =3D 0.0
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D acces=
sVector or
>     elt['impact']['baseMetricV3']['cvssV3']['attackVector']
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv3 =3D
>     elt['impact']['baseMetricV3']['cvssV3']['baseScore']
>      > -=C2=A0 =C2=A0 =C2=A0 =C2=A0 except:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 except KeyError:
>      > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 accessVector =3D acces=
sVector or "UNKNOWN"
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cvssv3 =3D =
0.0
>      >
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0c.execute("insert or repl=
ace into NVD values (?, ?, ?,
>     ?, ?, ?)",
>      >
>      >
>      >
>      >
>    =20
>=20
