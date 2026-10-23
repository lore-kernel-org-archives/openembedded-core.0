Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15411.1792785612041297340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 13:00:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qiB2QoVT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4756619ca5=saisireesha.t@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIdBco2214926
	for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 20:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=ltsyPot8gmQ2XjVC6jZ2X7
	Jr0FAGAi9NpBfYWfQNCr4=; b=qiB2QoVTak0FBBUcGA3CF2xSjLZCI8Ly5hcyMM
	8g+95Qoy7RJXCeJYLTJDdE8ThHLTt18toT4/wAWY61yliYcfxU8grHgRPpywYgJt
	AIUFmbN0g+/s353P/4vGJrcGwfiDShNC87BipkwUDqjQFsZv+5phg19ArO6AUqQo
	uj/yJ4yUx9oelShUCAGep7Xpp+ozR18n+PeUIS/eKgVtyQ25aZigiRKo/AuD4j+N
	voHf0Tbr4OmsY0wMG9NU3NDQPcMMjf3MLfCKyLuSfbXbBAqwjSxkZPR3KXX7kuLd
	BtR3m3TffszHnkWj6KzdL18cSdvMgbU02QbTcOSBEYCf1nLA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021092.outbound.protection.outlook.com [52.101.52.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h0bf6j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 20:00:10 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gkxxDzkzSQU3CGs/Hc4P0QQCAG/nzI5Q23iXDyQrxPyJ4cX9SbxaOgUe0sevaKbBL3/et/BRmRx8PMsqTVUTnCa1xYKnzGpM55frdPvsqSfl39QsCXeLzctGxZUAuukE1zOq3CRteC7wPV7Oe4VGBQP0+dMoO+oYv4aJuZhyAGCQxrS06NgmRKvhARmEk1KFB+vlQhwuFjDfkLR0ELIwMP3u1RlMUwd+jGj8J0KJZhbXxX0rklBd3WH18i5KzpPrFL2Rf5WJ1f84ap7WhaLSGxigl5SK3rAkAgGSa5aEK+pmQNiYZ13RCSSrpgZIKTeAZowdHYKVq+g/ofbPVBCG6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ltsyPot8gmQ2XjVC6jZ2X7Jr0FAGAi9NpBfYWfQNCr4=;
 b=bcQ/QgyR9JawaOs4UK5xg4Ss6yFlP+xd5qcWurUoGZ4HfpimgA1mUijfdWI4oHFar808PbljABD+r6kYaH33Ou7Q83Napy00rE1LX1k8adqhfzsXcV98ItQR06RJb7RWstC+hGh98zF3lxjjlvnCfrXrDpOvLsyrJ6KwA54yiHBGgUOhAOjLtg71TBEfqZFYZpw6p8iawOTmHXg9BC441rzu8a/ck7yaKVnlsENwWOVTQt0372Xa6Lwxpsqxmgd299JKtN9MkSNqKek96PkcMN/SullBxEXeCrudibU+Sgx4JNGfD7xk7klbkeZ/DjU5EkD/guPKhyMGonqVEpKHMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SA7PR11MB9594.namprd11.prod.outlook.com (2603:10b6:806:4cf::24)
 by SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.19; Fri, 23 Oct
 2026 20:00:05 +0000
Received: from SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102]) by SA7PR11MB9594.namprd11.prod.outlook.com
 ([fe80::8471:23b1:c4ab:7102%3]) with mapi id 15.21.0546.012; Fri, 23 Oct 2026
 20:00:04 +0000
From: "Tirumala Pudi, Sai Sireesha" <SaiSireesha.T@windriver.com>
To: Tan Siewert <tan.siewert@9elements.com>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Patrick Williams <patrick@stwcx.xyz>
Subject: Re: [PATCH 0/4] systemd: add packageconfigs for storage optimisation
Thread-Topic: [PATCH 0/4] systemd: add packageconfigs for storage optimisation
Thread-Index: AQHdYtyPcfeWrRlr3kmiDW7fB/5cvbcLi9oJ
Date: Fri, 23 Oct 2026 20:00:04 +0000
Message-ID: <SA7PR11MB9594AC924FFC3242C77F7B8DE8642@SA7PR11MB9594.namprd11.prod.outlook.com>
References: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
In-Reply-To: <20261023-systemd-optimisations-v1-0-0cce103e54df@9elements.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-10-23T20:00:02.860Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA7PR11MB9594:EE_|SA1PR11MB6757:EE_
x-ms-office365-filtering-correlation-id: 50b8dc29-59a8-4545-67ef-08df31403ad2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|6049299003|38070700021|261022105027099003|11063799006|56012099006|261021123027099003|261009223027099003|261022115727099003|261021121427099003|261022075727099003|10067099003|18002099003|6133799003|22082099003|4013099003|4053099003|8096899003;
x-microsoft-antispam-message-info: YdlDyqsFgsw3gwF71iKJnehx1qefX1DvxpYl4263Dop5o/EVdO6m7J1aXhI0GmB9237FPxo7HX6Ogj4ak65OCelD0pORmyLBPPzRncqTo9PooLVmvlsksE0yNRjRGRrMTm6W9fOUp+cT+ja4CquWBX5LStJmcg5qnytYP/MT/1ZD27b7PvVPw3PieqSRqS0Kn8o27Xg/X03pdgqAW9SiItD0eamnagGl5EfwppZOJILo/iAvsDhlCy0HN6sttov7xh5N3D5t6MURMwSZy8cQZ3+WJdm+024T6+kLDck1u1+un5w7+FSSGKHSOjbEnopJKD2kSlfAK6nDC+8kdtDV8MRO90fVdVRZn3lThn7SgG9HGEllyahhOZrs/PxPAAPvtz7XuHckVMcM/R99SRHeEfCF3x6MsahkKW1Wa1XX5/AOWdPc+rTgJrYkAaWEpxsD2B9iplP65NeOljq2qXc/MtPFa6j2kP69TGBoD2DNfFfr7pyRkbGAyJM1PUv1gaIZTRyC75U5IOuWMKHouUZpeKGl/CT2YZhcDcj78yP5Idp8n4xttsjO47RBFdKUsAOMfSU/nBpZa4Htw6gfEcgXOmJFSBT5lPWvRlqCc3kHfv0IWgqSuTkTVu5lDLscGP9QG2R/yxXD+v82tAekcCjJbozyRE6yi/n1ZTkq7k1X5SWy5JGbiK76b1jAQZAYwzX0AiETFY6vGPrgYMVeC1P5P92bcl8WNSarj29NHjTSfHw=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA7PR11MB9594.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6049299003)(38070700021)(261022105027099003)(11063799006)(56012099006)(261021123027099003)(261009223027099003)(261022115727099003)(261021121427099003)(261022075727099003)(10067099003)(18002099003)(6133799003)(22082099003)(4013099003)(4053099003)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DD1b3Njth4wTdyFtjX2rGj6rK2+918E1BATtm7ryZLcedkcAQfsGu44uCxtQ?=
 =?us-ascii?Q?pAM+3522lSpTC9ImV0Q9fQM39Q9VfROcBOnSACI79RYkcSZf8ruLaH4UNtFt?=
 =?us-ascii?Q?fyFqAq7cIRtNwlJFy7Xr1LpIiht2nM1sSQszKL4USnHgT3W8UnDDDVD1bmP1?=
 =?us-ascii?Q?vsGZJCVbBHi28chhN+BcUMsApcALIYCQA+KUXH8NChpRSSJPxM0yUlgnUDk1?=
 =?us-ascii?Q?/SJ3MRHPL1kXWZ0suLmmgK1wFiiZ+mF7FtC+3avt/7jHiV98Ku387s/UutkQ?=
 =?us-ascii?Q?IMhAED9iz6bgXeuiy6vBqLelTeZ6lsFipYkIYjE+37uG/gAWCQXm0Grm0/J0?=
 =?us-ascii?Q?db+dn9jQXC4n5r3Gs85PpinOYCzZ2Mb0voM3TJFid8MJVpACCUOAmFT7riVw?=
 =?us-ascii?Q?EWMfQ0Rh47KPxHAd6nB8NItAICW4nxFbAUGr0jfAxHU/aO7ctTu+pIYedjWX?=
 =?us-ascii?Q?j7lOOTmE+643EdMdGoQzMgB2ziEiFWLHcwDKfZtwT6As9iujWwk0mBT21q2m?=
 =?us-ascii?Q?UVl5h/TObbyB47NV/RU3900lnTnvwY5IJAK5btPzrIuQMDKc2AAXUMmNBh8J?=
 =?us-ascii?Q?Ex863O7HdJIcU0esGBRQz3kSs1+5E4UE8E/u1q47otriUzvQMcBHJPZ+W+1/?=
 =?us-ascii?Q?hnmfaiL0PR12EJ7RjWPtx0odbnKtMRTDYgkHDuB3lVkxBD7aqNi/gs/TFCoD?=
 =?us-ascii?Q?w8FeBOlrMKjolKu+kAEH1uVew1y3ORM47mvtID6bIJ4sO+AiRgJSnlV12taS?=
 =?us-ascii?Q?ozdGwVTPMUuC9Cccjm/QbmX56JR9Tzgh6VTDlUUb/2YRtUpciYyr0xW1HS6U?=
 =?us-ascii?Q?4sYF8Fi0BX93MRqxxZmxQPG1m3RG6JuW2Tt90zs0JaO5r3QWkF04vWVConAE?=
 =?us-ascii?Q?rFsRTJ4c6Ukr/D+GE/qVyX0EqpZ+fw5U0po/UwbjjlPAzW/zA9YJG3X5MIlA?=
 =?us-ascii?Q?BKPOtLey2kktFy87VM2xycP03MSQsrbbu8MPQTSdR7BgcO62PHpZFDqitDMM?=
 =?us-ascii?Q?vtHkEBPvY/J8eINdmX9E6edA8KAaNQgEQfiQFl5VVKP95kgayGc3hGTQeV0W?=
 =?us-ascii?Q?Yt0W60++9N7dw9KvneZKc8ruQaNR42BJcz3K/vhBJjT+MJTGl3GwsRIRNVN8?=
 =?us-ascii?Q?79OXqAcxBmqAEYtcFttkt/eJCRzoTr0L9TrtVSYTuQefqZBj6b12eybBgTs9?=
 =?us-ascii?Q?ZaVrFQ+2ODMtB7ZBmptOf6+hhH6VkNMPwCk10+drDXAkC9y8g6ECKU0r9Yaw?=
 =?us-ascii?Q?1k2sEit5fKebphrZ1DNAyOPJ66s973lFEDrv5wTytV2V0RzQrSNahGurQ8eG?=
 =?us-ascii?Q?r4zlF1voDWd0Ju/IkHRA0PbxnkIi8PsDo0JBdVbV8SmhiXjTTXbP03uNqT7X?=
 =?us-ascii?Q?TnSg2qLWs+kZbhZqTbtsEel4POHAJg3ijNnugE0q9ZG/Lpr/7eYyQbJZHVT7?=
 =?us-ascii?Q?mc1BRNo7u3URTghv4OM81+8h7vrNLA7ZHsL+Bd5eJ9cUDVYJjGw7GGWPIgRb?=
 =?us-ascii?Q?APkV7GdzruPekfmfgvpLJ1m4AXUL/5VFVL6xg8cJK7iZsEdHwVL77ftpe13/?=
 =?us-ascii?Q?b9ZzmbmBrDFs6oQ1q07ehDZZh0ypdGIjSmoL5eAet7/t0zh146ANu7WzvJNt?=
 =?us-ascii?Q?yG+THgON9zJZsQQ5i+EKrOjmGMasPP9URHdgSAx4PRb5CMa0xDd+earhTtDp?=
 =?us-ascii?Q?Y1yUlGv76JZkxdCjmMj166A7RiBjKlGhvdoJrJcNZe3Nr3Yh1kMVkZ757yGC?=
 =?us-ascii?Q?cS/FSE9CZA=3D=3D?=
Content-Type: multipart/related;
	boundary="_004_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_";
	type="multipart/alternative"
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: AcnpRm5XNOORRXq1XfJu1jlfOD9uyvXN+0USkWQhHBB0jc4TodaAgOxJOE44trGiqnqI1iE7IMoO4kSrHzJZX+NO+DFhI/8Y0G7/dun5JZVh0Zh5K2JfL4iVpWTC9BIICs7WwyWoy8Jyxf0YQspd8RTIJrqNtXtLhsDBJyyjj9Zf69aZ1Avf9r7iHtUepOYYDJtszi2aRI1lhtwzyWcs6vp79K4v4L51RcHNViSFR8OvCpKxr0hQ+E7YnkPNhBRQ6hYXwekCHtcPZNOrW/vg3juPasNNfdjLCMxRjTarFp+3V6qTtnxFFvClcPzk5mpsvNgZoMYsaLcr/yi9Dpr/qA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA7PR11MB9594.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50b8dc29-59a8-4545-67ef-08df31403ad2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2026 20:00:04.3997
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwiyarDuuUexPKgAIzTQkRJgcCxjEvw9oguwVq/Q/R/ZpnZ3fy3NSqc7u8l8b2jrrYZiiQzY0Ve3RNjBn9srbomPQJAppLrdM2oOmZPifkc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3OCBTYWx0ZWRfX607D4PAu7RA8
 i/5gTB+V1nd3F3X0Mir2mOyA4q6MvHHPe37Ezs2BOJyJoscJ5ZvQ1L/G83HrbvbmXSEAokR7Plz
 S5q5nivELZYIlzQgTq8yrrLRbsZpGYpRGwaCEruf6ji6AG+chCHG
X-Proofpoint-GUID: bQQ00soJ8CQdiBkTs9IOoJ60JrUNRqWD
X-Authority-Analysis: v=2.4 cv=fPesTpae c=1 sm=1 tr=0 ts=6adbbcca cx=c_pps
 a=LITHeb8NCZqLQJh3dVn19Q==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=PzGKxP3WAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=2VGnaFk_AAAA:8
 a=MFKMRnq0FczLixvFH-gA:9 a=CjuIK1q_8ugA:10 a=3p-jlq80htvJ8jvK:21
 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=HXjIzolwW10A:10
 a=T6a71-JsGAwA:10 a=zCCnohV0i-_k6euCn0hJ:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=xuWaqJMTYXf3QM4Ho2sr:22
X-Proofpoint-ORIG-GUID: MXahjlq4P6lX55GKazb8xFnIsI9Yg7ZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3OCBTYWx0ZWRfXx2nNKR8+pywV
 fDykNcH0KGW2JjV/DxSJxAr1K4Q7XBA8s590m8cMwBUgpgwlJId0arxADP/ZUh0qK4W2SVagWhR
 IVYb+tskVrRHF4QpDIuoClBaAGi6xKTQ2H4QkLugbMV9QSmhXrJpK8Ajfe3GTktrXyheGS7juoS
 S+xVQgeM35pyTkbM47iuuU3A9OrP6n1F3D38YTQaDc73em+AM2UIuPKLA2aYZBpYufcaemElU6Q
 gbauddW6yXK6QgmYIhKxz8th0w05l5SSef2vX9EesU16CQ65BBiRqMu9ie7OysdXlq1qpmkHU6j
 /kdz7QfZAWJfLXVPfGH/59KUBEkAF3mev1osOJ/wL8wUaaOWBF60vC0pTUf92eDwttoa8oP3lVn
 m9FGEzORJR89us8Nkcs8D47bM6Olr5mYF5rBTKTKhdNgw6VB69BwUy/GSFoF6JYiOaJi6IhCUy2
 E0zSDYHv29xZT6bnvQA==
X-Proofpoint-Virus-Version: 
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 20:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248565

--_004_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_
Content-Type: multipart/alternative;
	boundary="_000_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_"

--_000_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Tan,

Thanks for sharing the patch series.

Just wanted to mention that I've submitted a patch upgrading the systemd-re=
lated recipes from 262 to 262.1 to the OE-Core mailing list.

I noticed that your series also modifies systemd_262.bb, so there may be so=
me overlap depending on the order in which the patches merge.

Just wanted to flag this for coordination.

Best,
Sai Sireesha T
Linux Engineer - Sys
OSS Platform Group
[cid:ac596a5b-203e-457d-afd1-523c98823918]



________________________________
From: Tan Siewert <tan.siewert@9elements.com>
Sent: Friday, October 23, 2026 5:51 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Cc: Tirumala Pudi, Sai Sireesha <SaiSireesha.T@windriver.com>; Patrick Will=
iams <patrick@stwcx.xyz>; Tan Siewert <tan.siewert@9elements.com>
Subject: [PATCH 0/4] systemd: add packageconfigs for storage optimisation

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

While investigating the storage usage in OpenBMC I noticed that several
features are enabled by default because their meson options default to
true or because they use .allowed() instead of .enabled() for the
validation. This pollutes the storage which is expensive on some
platforms (there are platforms that only have ~20 MiB for rofs).

This series adds packageconfigs for the features ukify, sysinstall, hwdb
and fdisk.

ukify was enabled by default but only works on EFI systems. On non-EFI
builds it will be disabled by default, but enabled by default when the
efi DISTRO_FEATURE is set.

sysinstall is a neat feature that makes installation guidance easier,
but for a lot of embedded systems it is just a waste of storage. It's
not enabled by default as it has runtime dependencies on systemd-repart
which weren't checked before. Enabling it by default would mean we'd
have to enable OpenSSL and repart which does not seem viable to me.

For hwdb, it might be useful for systems that see PCI/USB/HID devices or
for some laptops, but who needs ThinkPad keymaps on an ARM1176 SoC?

fdisk is recommended by libsystemd-shared, and disabling it drops
util-linux-libfdisk. This is only required for sysupdate, repart and
homed.

With all the changes I was able to free a significant amount of storage
again (the hwdb alone was ~9 MiB uncompressed).

I've tested my changes with qemux86-64 by building systemd with the
default configuration and with fdisk off, hwdb off, sysinstall on (with
and without repart), ukify on, and with the efi DISTRO_FEATURE (with and
without ukify), then checked the resulting packages, shipped binaries
and RRECOMMENDS.
Enabling repart or homed without fdisk fails at parse time as expected.

The testimage with default and hwdb-off + usbutils configuration booted
and passed the default tests.

Signed-off-by: Tan Siewert <tan.siewert@9elements.com>
---
Tan Siewert (4):
      systemd: add ukify packageconfig
      systemd: add sysinstall packageconfig
      systemd: add hwdb packageconfig
      systemd: add fdisk packageconfig

 meta/recipes-core/systemd/systemd_262.bb | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)
---
base-commit: ae5cafacec8e99c5a27fa5b3b378eefc595910ef
change-id: 20261021-systemd-optimisations-dae99d91e807

Best regards,
--
Tan Siewert <tan.siewert@9elements.com>


--_000_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_
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
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Hi Tan,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for sharing the patch series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Just wanted to mention that I've submitted a patch upgrading the systemd-re=
lated recipes from 262 to 262.1 to the OE-Core mailing list.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I noticed that your series also modifies systemd_262.bb, so there may be so=
me overlap depending on the order in which the patches merge.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Just wanted to flag this for coordination.</div>
<div id=3D"Signature" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Best,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(12, 136, 42);">
<b>Sai Sireesha T&nbsp;</b></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Linux E<span class=3D"spanWithBackgroundColor" style=3D"background-color: r=
gb(255, 255, 255);">ngineer - Sys</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span class=3D"spanWithBackgroundColor" style=3D"background-color: rgb(255,=
 255, 255);">OSS Platform Group</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<span style=3D"font-size: 13.3333px;"><img id=3D"x_x_image_0" width=3D"126"=
 height=3D"22" style=3D"width: 126px; height: 22px;" size=3D"7931" data-out=
look-trace=3D"F:1|T:1" src=3D"cid:ac596a5b-203e-457d-afd1-523c98823918"></s=
pan><span class=3D"spanWithBackgroundColor" style=3D"background-color: rgb(=
255, 255, 255);">
</span></div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 10pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Helvetica, san=
s-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tan Siewert &lt;tan.s=
iewert@9elements.com&gt;<br>
<b>Sent:</b> Friday, October 23, 2026 5:51 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Cc:</b> Tirumala Pudi, Sai Sireesha &lt;SaiSireesha.T@windriver.com&gt;;=
 Patrick Williams &lt;patrick@stwcx.xyz&gt;; Tan Siewert &lt;tan.siewert@9e=
lements.com&gt;<br>
<b>Subject:</b> [PATCH 0/4] systemd: add packageconfigs for storage optimis=
ation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
While investigating the storage usage in OpenBMC I noticed that several<br>
features are enabled by default because their meson options default to<br>
true or because they use .allowed() instead of .enabled() for the<br>
validation. This pollutes the storage which is expensive on some<br>
platforms (there are platforms that only have ~20 MiB for rofs).<br>
<br>
This series adds packageconfigs for the features ukify, sysinstall, hwdb<br=
>
and fdisk.<br>
<br>
ukify was enabled by default but only works on EFI systems. On non-EFI<br>
builds it will be disabled by default, but enabled by default when the<br>
efi DISTRO_FEATURE is set.<br>
<br>
sysinstall is a neat feature that makes installation guidance easier,<br>
but for a lot of embedded systems it is just a waste of storage. It's<br>
not enabled by default as it has runtime dependencies on systemd-repart<br>
which weren't checked before. Enabling it by default would mean we'd<br>
have to enable OpenSSL and repart which does not seem viable to me.<br>
<br>
For hwdb, it might be useful for systems that see PCI/USB/HID devices or<br=
>
for some laptops, but who needs ThinkPad keymaps on an ARM1176 SoC?<br>
<br>
fdisk is recommended by libsystemd-shared, and disabling it drops<br>
util-linux-libfdisk. This is only required for sysupdate, repart and<br>
homed.<br>
<br>
With all the changes I was able to free a significant amount of storage<br>
again (the hwdb alone was ~9 MiB uncompressed).<br>
<br>
I've tested my changes with qemux86-64 by building systemd with the<br>
default configuration and with fdisk off, hwdb off, sysinstall on (with<br>
and without repart), ukify on, and with the efi DISTRO_FEATURE (with and<br=
>
without ukify), then checked the resulting packages, shipped binaries<br>
and RRECOMMENDS.<br>
Enabling repart or homed without fdisk fails at parse time as expected.<br>
<br>
The testimage with default and hwdb-off + usbutils configuration booted<br>
and passed the default tests.<br>
<br>
Signed-off-by: Tan Siewert &lt;tan.siewert@9elements.com&gt;<br>
---<br>
Tan Siewert (4):<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemd: add ukify packageconfig<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemd: add sysinstall packageconfig<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemd: add hwdb packageconfig<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; systemd: add fdisk packageconfig<br>
<br>
&nbsp;meta/recipes-core/systemd/systemd_262.bb | 22 ++++++++++++++++------<=
br>
&nbsp;1 file changed, 16 insertions(+), 6 deletions(-)<br>
---<br>
base-commit: ae5cafacec8e99c5a27fa5b3b378eefc595910ef<br>
change-id: 20261021-systemd-optimisations-dae99d91e807<br>
<br>
Best regards,<br>
--<br>
Tan Siewert &lt;tan.siewert@9elements.com&gt;<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_--

--_004_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_
Content-Type: image/png; name="image.png"
Content-Description: image.png
Content-Disposition: inline; filename="image.png"; size=7931;
	creation-date="Fri, 23 Oct 2026 19:57:53 GMT";
	modification-date="Fri, 23 Oct 2026 19:57:53 GMT"
Content-ID: <ac596a5b-203e-457d-afd1-523c98823918>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAAfgAAABWCAYAAAAjSYRVAAAACXBIWXMAAC4jAAAuIwF4pT92AAAG
YmlUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0w
TXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRh
LyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNS42LWMxNDUgNzkuMTYzNDk5LCAyMDE4LzA4LzEz
LTE2OjQwOjIyICAgICAgICAiPiA8cmRmOlJERiB4bWxuczpyZGY9Imh0dHA6Ly93d3cudzMub3Jn
LzE5OTkvMDIvMjItcmRmLXN5bnRheC1ucyMiPiA8cmRmOkRlc2NyaXB0aW9uIHJkZjphYm91dD0i
IiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtbG5zOmRjPSJodHRw
Oi8vcHVybC5vcmcvZGMvZWxlbWVudHMvMS4xLyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMu
YWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNv
bS94YXAvMS4wL21tLyIgeG1sbnM6c3RFdnQ9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9z
VHlwZS9SZXNvdXJjZUV2ZW50IyIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ0Mg
MjAxOSAoV2luZG93cykiIHhtcDpDcmVhdGVEYXRlPSIyMDIwLTEyLTAyVDE0OjU2OjM3KzAyOjAw
IiB4bXA6TW9kaWZ5RGF0ZT0iMjAyMC0xMi0wMlQxNTozMDozNSswMjowMCIgeG1wOk1ldGFkYXRh
RGF0ZT0iMjAyMC0xMi0wMlQxNTozMDozNSswMjowMCIgZGM6Zm9ybWF0PSJpbWFnZS9wbmciIHBo
b3Rvc2hvcDpDb2xvck1vZGU9IjMiIHBob3Rvc2hvcDpJQ0NQcm9maWxlPSJzUkdCIElFQzYxOTY2
LTIuMSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDoxNzk0ZTkyYi03Y2FiLTVkNDgtYWIzNC0z
ZGNjYTFmNjdiZDMiIHhtcE1NOkRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo4NjFl
OWQzYy05ZDU2LWRiNDktOTM5MC03NTBlYmY4ZWE3NTkiIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJ
RD0ieG1wLmRpZDpkNTY5MzM2ZS1lNDU3LWE0NGEtYTQ4Zi0zOWI4YjY1Y2YyMzgiPiA8eG1wTU06
SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDpp
bnN0YW5jZUlEPSJ4bXAuaWlkOmQ1NjkzMzZlLWU0NTctYTQ0YS1hNDhmLTM5YjhiNjVjZjIzOCIg
c3RFdnQ6d2hlbj0iMjAyMC0xMi0wMlQxNDo1NjozNyswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2Vu
dD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0
aW9uPSJjb252ZXJ0ZWQiIHN0RXZ0OnBhcmFtZXRlcnM9ImZyb20gYXBwbGljYXRpb24vdm5kLmFk
b2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVk
IiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjE3OTRlOTJiLTdjYWItNWQ0OC1hYjM0LTNkY2Nh
MWY2N2JkMyIgc3RFdnQ6d2hlbj0iMjAyMC0xMi0wMlQxNTozMDozNSswMjowMCIgc3RFdnQ6c29m
dHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIiBzdEV2dDpjaGFu
Z2VkPSIvIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5PiA8L3JkZjpEZXNjcmlwdGlvbj4g
PC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PlYNaPQAABg/SURBVHic
7Z1Pctw4sod/86L3zdmjY8oneOUTNHUCs0NbRXTpBLJ2b2f5BK4+gWsitFU0+gRmn8CcE7gmAvtm
n8BvQZRVpjLBfwAIsvKLcJSUIIm0CkQiE0jgH1+/foUgCIIgCOvif+ZWQBAEQRAE//xw+uGnn376
C0DWKj8YY26jajQCpVQB4HeiaCn6vwXwpi03xlx5rKMrVHNljCl91RcTpdQDgHdEkdf/k1IqB/DJ
1/NGUtrPCsB/AZTGmGouZcbSoz3OQQWgBvAngCOav+1xLmVsv/CBKHo1p15eeXr8DGDbkh5xffPK
VxVKqU8Acl/P80SFpq1VAP4DoPL5Hp8i8z+cyUoAReu6AkDyBtIYo5VSVFEeWZWx3AHYtGRVZB0+
KqVeG2PqyPUKw8hbn7BtX6MxTHo1nX98tvYzPwmUUkc0f9t/zzCQ0qANfAFgH1ORIDw9bvDSuAPN
/3vtbO1nfhLYtlaiaWulj0rOQ/R/EOWZUmpLyJNBKXXSURPFmwXov8FL4w48e2qx2AB4G7lOwR8F
GmPwRSn1SSm1m1ed1bBB8158Vkp9jvl3tQO1iij6NZYOgSkY+b9jKpEQGwA7AJ+UUl98tLVzA18y
1xRTKwlMgWYURA1QTuUpUzBy7v8TknepD4iEXuRoIjJ/KaUelFLZzPqshS2av+sXO10Tg98oPaxj
sHTuCNkR1zdVbEUSZIPntlaMfci3EL0x5qiUqvAyZPIGwMPYCiLwM5q5SM2UL0H/NvWM8+EfAbye
qW7BLxmatQl3Sql7Y8xhXnV6Uc5Ubz7g2g0aL+sA4D7wtJZG8062KbDkMP3T4xZ05FJH1KKMWNeJ
DPS0BMcGwO9KKQ3gdmhb+6H1+x9E5Vul1Cbheb0CzQKFB2aAsgT925SRdThnq5R6MMY8zKjD0niP
prPdTnjGFt8vcq3xHJ7Nz+Q/o3npNwOenaHxBu7QdBKV+/L58LmwdCg20rFF8/d+g+7vc4fmfQn2
NzXG1LZzL1pFd1iygeenGaKF5xNpa2/QtLdtxy0FgFwpdTWkrbUNvAa9GjkHcOj70FjYcHKG546x
BP2HypGm/gVTFCs8X+Nl5gTQeHyHhAdFyWFH1uWER7jufVFmO4gczx3EpkcdWzRzyffGmP0g7S6A
s++wBPBgw+B3aAx5xty2RePND+p4B/IHXhr4jVJqm/JgrYOCkF1MeL7V1k5rsd6h+btkzG0ZmrZ2
a4zRfer5Lg/eNpaauO5FClciFPZzaz+50V+q+lPheSCeB39Akw7UJgMdFhQSwRhTG2O0MebWGPMK
wBX6D2I/KKU+yty8G2PM0RhzD+AV3N5yhqbj3QZSRTPyZS6248Pzl7q47tTWbtG0tYPj0gxNyH7b
57nURjeakBV9HjYD3wy3DcNXoAcoeSR9hlIQsiqi5/w3+DTI3ObhCgvAGFPaDuKfaKYM6o5bdmiM
UhZWs+VjB1P3aNamVMxlGZqONwtRP5bVL3fBDUwOMZVIEdvWbtEM2I+OS3sNKCkD/yd14ZSVfCE4
m8M4sbGfmrg8S1D/DRJIj7OL+fZM8TsxAMvCdhAP6PYEgOfwchZWq3VgHYgr8O/oBuEiX5R3m3wa
MENByCpc3xwj65Estl/uGlB2trW+HjzAh5Pnomj9vrWf5AAF6et/Yo70OM7jyyCh+kVy5gm4OglA
jPwg7N/1Cnw/WYTIlbdzrjVRtKww/dNjAQnP98JGbq7Av79bu4snywsDbx9KPbAYoFsM2gY7s5+a
ub4IpchIkkmPs985F6ovUot+CP0xxlTGmNdwzyFvIUZ+KLfgO15qobIPNCHbBaorFNx6KB1TiaXQ
w8jfufZE4A6bobzI1MJBRev3nwHnauZNKptD2I60IIrKqIqcYT0EzRTLgqyFY+eQXdtOb0FviyoQ
2H7mF9Be9SbQjnfcbqNFgLpCURAyCc876HDAMtAbBgHgDbxm5HlPnYJylh7HkfqudjkjnyM8f84t
+FB9KK9EiITd6OY1+AV4O1lY2R+7GPY9U+z9fXGE6VPNEvqeJjyfESUSnu/Arv/g2tqOu4808I7V
6KnM9xSELD/7uWTuS+VFSDJMZUeKXCN6G3F7TiEQ9t3+xXHJh8QidUlj9xM4EkWhIp6akBUB6glB
kv3egtiDccC4iJHrPHhNyLaJhGqphnI8/WA7sSNxTZ6I/jkhq1I4yc12WCVTLKH6FWDXeXADOUAW
Vg6F2i8eCGN4qbqWEqYvCFkp4fl+WPtwYIrJReQuA8+tRi96axQAIj3uhO74/UThTZkR2FH9hiia
Ozx/Dheq30BOnFsFNpWuZIq3EqofhGbk3jN3HM5LKtFVmqfHHSQ87wPu75VTwqEePDB/ulnByNsG
MtV0uZyR64g6OLFzi5xXIifOrQdukRggeyD0xnGs6zZQlZqQFYl/XxKe94BjgLehvn/WwCecLtcr
vcyxIKXwrtEwqIZep7antPXwKqZYQrgroGPNRQaJ1gyhJGRZoLo4L64IVN80nh4z0LppXN/UUXVZ
BxUj37YFLg8eoBtSNvNiq4KQlcy1lDybywM9OyCkjY6qSH+41IzODRaEZdCx5kK8+P78TQlD9JUO
Ly6VRcRtCkae0rTkkvhP3wu7DHzJyGdpSI70OK6hcPK55qtyRs5NJ8xKR2qGc4MFYVG4Fty9jaXE
wjlGro9yvlIN00t4fiacBt4xUiwC6NIHrt5yoDyfqMdYFtfQbaj+SBRlkFD9KrDTWwemmN1EQ/iO
Y+T6Dox8F1GHbiQ8H5NNW9DlwQNp7QpHGUj29DXX4peZ9M8JWRLpcR3IiXPrh52LD7Qr29rIY1bm
6NtSW01fMHIJz/vn2Bb0MfBJ7ArnSI8rO25NRf8t0k+PI5ET59aPNRiaKU7NaCyJOuCzqTD9XM4L
BxUBqpFw1HIB/Nj3wrEePBA/3axg5F0GUjPy2PrnjFxH1GEK7yGh+rXDpUbmiRmNFPlfShg4O0Yz
8iJgnf15etyA27NEwvNT2DLyui3oNPCOw1tiL+jg0stK102ObXeLyRoNYxHpcRy2HdwzxXLi3Aqw
79KRKS6iKbJMckJWhaxwAWH6gpEnH7VMnJwSUrakjwcP8F8IWVEgqLrKnvdqShjLKC0wPY5ETpy7
CLgc67k3iEoW249kRFEVoXoq6pJKmJ4aaNS4vtGxFVkLjvUwJSXsa+DJmxEpXc7mkmZEUd+RIHdd
rHS/nJEnmR7XgZw4t24OjLyIqMPS4PqRGJ6qZuTzZj+4wvPCFLjoDNnWehn4BNLluBeo7Hk/d10+
VJGRLC49jqMjVC8nzi0cR9g3yKYtS8d6yjuiqLYRr6DY95Gqpwhddwdc/RKeH4l9/3KmWFPCvh48
MO+ucDkhY9Pj2jheglBHOrbJCdkS0uNI7LniJVMsofrlUzLyPKIOS4FbYHqIqANlNGP1bRz06nkJ
z0/hAyPXnC0cYuBnSTezI+QtUVQOfBQXDs8HPmcQjvS4pZ+iJCfOrRfuXSFXil8qdrvmnCiqwWck
hEAz8nkW2z09bkH3eTqqHitCKfUB/Op5tq1N9eCB8PPYOSMfGurRjDz0S5Az8jJwvUGxI0ZucxQ5
cW7ZlIx8G1GHpLGLnbg1J7/1jS76IMEwPdenxhz0rAbb1t4yxQdXJllvA+9Ilwu9YnNUelwb+8Id
iaJt4JAypf9xKelxLjoOKpHc+IVi3/UjUbSJqkii2A6Xa98V+E2hQkJFBDczpa9SdR5xfVNF1mPx
2J1CubZWg18PBWCYBw/Mky5HPbsc+SzNyIuRz3PiSI8rQ9Q3E1wDkxPnlk1FCS95oZ1SKrOhUleH
ezvH2hrH8dhxDwaT8LwXbFv7Hfy8O9CjrQ018CUjD9KIPKTH9b0v1EuQD9RjcciJc6uFO5Iyi6lE
Kti+6DPc60vuZ47MaUJWRNaBC88vfc1RNGyE6DPc391tnyyNQQZ+hnS5qelx32HD+jVRlI95Xg+8
6p8q9sS5iijKIKH6pVIz8m1EHWZHKbVTSn0C8AnuKYpbm10yJ5TjkEUO01N1SXi+B7atfUHTZ24c
l+77trWhHjwQd1e4nJD1To9jKAlZFij0SD2zXGp6XAdcqF5OnFsm1dwKzIENjRZKqY9Kqb/QdLa5
45YawC8JGPf5w/RPjwUkPN8bpq1tOm67NcY4593P+WGEXn+CDlP9DI9fpMf0uDZ/gB5lvvHw7G8s
+fS4MRhjSqXUHnTbeKeUOqx0YHNprCJVzvYvGzR9TIbm/3X6vS8Vmg638qfZZDRebryzU0rdR3j/
uIHERYfnz9pabkVj2toRTVsrh9Q92IN3xP2Loc/qIGfkUw2kZuTFxOe2yRl56bmelJAT59ZPNrcC
HvmEZhHTOzTv/3bAve8BXCVm3AHemBYR6qbqkPB8Y8w/oWlnY9raAcDrocYdGBeiB+LsCuclPa6N
HcVWRNHG84Kw1abHcdi/7S1TLCfOCclgp/kOI249AHhljHlIMSLlOBEwbJi+Cc9nRMnF577b7+Qw
4tYSzSBydGbGWAMfY1c46lmlp2cH3ZXvQtLjSGxj1kyxbGMrpASX/dHmiCa3/ZXtbI+hFPKEJmSh
j/dezXkbgejb1mo8e+xXUx1anx484GlXuADpcW00I/c1ys0Z+Srn3wnkxDkheTq8+BpNp/zaGPPK
GHO/AMN+Yo4wPfXsCtc3x4B1LgbbdvZMcY3nKZ9/2kFk5aPeUQY+wq5wQUeDjnS/PLD+pYdnJ09H
qF5OnBNSgvOsMjTbgFbxVPGDo38Lsy330+MOtEN20YvrCN6Dd3ycW86OZawHD4RdrJYTMt+nr5UD
6h4K9Yy1pseR2MWYmimWUP1y2cytgE86vPglR5s0IcsDbTwl4fke2P6fW5MQpK1NMfDcPPzPE57p
So/zHd4OsqvdpaXHdXAPOXFubWzmViAAnBe/W/BOjJwhKbzW8vSYMc+U8DzNHnSfGKStjTbwAdPl
ckbO1TeKGfQvJz53cciJc6uknlsB36zRi7f/p4oo8h2mLxi5hOcJYnvxUzx4gDa6U3eF49LjqgnP
5NCELJtoeC4uPc6FnDi3Oqq5FQgEF21ashdPGVnfp39KeH44e/BtLfdZ0VQDz4Xpp4S5c0KmJzzP
Bad/MeZhjvQ4PeZ5K4JbcCcnzglJMMf8aAQ0I995eTofntcSnueJ2dZCePDAeAOZg16NyRniqWhG
PnaAUjDyUPovgo5QvZw4lyb53ArMwB4r8uIjhOkLRn6J642GsgefyZX7qmSSgXeky43dFS5quMfx
AowNY5ELDPsc67d25MS5xfEjI69iKhGTlXrxVJje166jd4xce3j2qrFtjV2f5KueqR484NeLzwmZ
7/S4NiUjz0c8qyBkesRz1goXqpcT59Jjy8j/jqnEDOyxIi8e/OLBaV780+MGdBvRuL6pJz37QrAn
EB6JIm9evA8Dz4VjBqXLRUyP6/v8QWF6OyLOiKKLDs+fYxca7pnid5IbnxRbRl5F1CE6a/Pi7f9H
E0XFxEdz90t4fhhBvfjJBt7uvlMTRUP3Ps4ZuR6k0EBc+g98FHe9HvictSMnziWOY7AKrNzAW/ZY
lxdPGd2pYXouAqAnPPPiCO3F+/DgAT9h7pjpcW00JRx4+hmXHnccoc9qkRPnFkHOyOtLaM9r8+LB
G11uDt2NhOd9E8yL92XgfYS5c0KmB2syjkm78tlIxZYo0uPUWTc2arJnimUb2/nh2n0ZU4mZ2WMl
XnyAMD13n4TnRxDSi0/Cg58hPa6NZuRFz/u562T+ncd18MISvaRVYAdXBVN8Me25Y5XzEqeSKOOb
jYyYUeH5Gtc3hxHPEhqCePFeDLwj3azvPM+suyHZl7kkivrqL+lxA5ET55KlcJTpSDokgd2F8UgU
ec1VjoH1EmuiaNieH0+PW0i00juhvHhfHjzAe/FFj3tzQhY6Pa4NF17Ke9xbEDI9VpFLQU6cSxJu
8VR1CfPvBMFzlSOiCVkx8Blc+5Dw/HTuGfnotubTwI+ah58xPa5Nyci79N9C0uOmcAs5cS4J7LuY
M8UXeXhIjFzliHBh+t2AZxSErMb1jR6jkPCMdXhKomh0W/Nm4B3pZl27wuWMXE9SaCB2tf6RKMo7
PMmCketJCl0IXTs6yYlzUXF5CodYSiTIKrx4a0BqoqhfmL4Jz2+IEj1OI4HAa1vz6cED4xbbzZke
10Yz8sJxj6THTUROnJsfO4jdMcWHyNNlSbEyL14Tsr57lkh4PjDWUS6JolFtzbeBHxOmzwmZnqzJ
OAaly0l6nFe4UL2cOBeHD46yiwzPt1iFFw/+uyx63EtdI+F5/3BtzfWOkszqwSeQHvcdjlXvxUC5
zL8PxEY8uM1F5MS5gNi/7Y4pLq1XcdGsxYu33+WRKHKH6Z8ec9Dh+cM0jYQ2Di9+O3C9hF8D70iX
4/ItZ02PG1B3xrzElGdfS3rcOOTEudlw/W05b+ISWYsXrwlZ0TGI5sLzEt0Jg5e25tuDB3gvnjKG
OSGLnR7XZsg0Q0HISm+aXCZy4lxE7MA7Z4q1eO/PWC++IooW5cVjXJieKjvi+qaaqozwEocXvxni
xYcw8L0aT0LpcW1KRp6f/+JIj5tb/0VjF1e6VtVn8bRZN/Yd5Lz3Gnxe7iXjPVc5No6MIdpLf3os
QPd12o9GAsNkL967gbeNpyaK2rvC5cwjtFeFBuKYZmin+xXMI0qvCl0gNlR/JIoySKjeJ7+DPzXu
N8kEeYnvVc4zogkZl9LMTaVKeD4gPrz4EB48wBvp/OxnLr2s8q3MCEpGXpz9TOl/qbt9hUBOnAuI
UuojHGe+20GWQLOGuXhuQWvRUybh+Thw/WCvthbKwHOryM+NYkaUl941GQc3Mu06Xa70rMfFMvDE
uSqwOqvCjv53THEN4JdYuiyRNXjxjkglFabPCJn2p43AYb+nA1HUy4uP7sGfdcxHojyJ+WvHNMP5
hhBUeRL6r4j34EP130awNmuBuk5oYfcUcE1z3EoUqhdr8OIpR2bbc/dICc/HY3RbC2Lg7Sr4iiku
7Od/ibLSvzaj0Yw8t59VS17LimO/2HbELWpqnzjHhRwFNJsy2bC8q1N4Lyme/ViDFw++j2t78XXr
90rC8/GY4sWH8uAB3ps9hbmPLXmZ2HaYXelyf7fkZThVLpcBJ84dQEdVLh7rkX0CH5YHmu1oH2Lo
syIW7cU7wvRF6/f2NeK9x2dUWwtp4DUjL+znsSVPLbxdMvLcflYteWr6r4nOE+fs4PAQSZ9FYL32
DwA+g19QBzTGnVvMIzCsxIunjHU746mNDqOKwDHWiw9m4B3z2Kdd4aqWvAylyxiswSiJolPjr1ty
6lrBAx2h+vMT5yRMj2+G/QHAF3QfuSvGfRqcZ7WUdM4DIz8P0x/Pfq5wfXOEMAeDvfiQHjzAj/Te
tMLxqaTHteG88qI13y7pcYGxu4iVTPFHe80RF+xdKKUKO8/+Bc1Ln3Xcci/GfRq2HzgQRYN2HJsL
2w9romh39vP5eikJz8/EGC8+tIHn0uVy+1nZzzKwHmPRjLydA1+GVUOwuE6cO520dDFevFIqV0q9
VUr9rpT6C83GNTt0G/YjgNf2mF5hOoueiwftyGSM0dBhVRE6GNTWfgioCNA0BipUddoxqba/Jzl/
bYw5KqWOeHmK0tYu7irRDFaS1H9t2O/jPehjE98qpf40xmilVAX3nLNv/hVwznWLZ4P9o/19A/pk
rz7s0ayWr6coJTxj2+UBLxcxbpRSOxt9ShkNup/+FY3HeLS/S3h+Zs76wLZBJ9taUANvjKkdnW2B
xoPPkbYHrEHPYxb2U9LjImKM2SulfgXdpj7aAdlviDsHuoN7hXoKlJAc95C8B90G3iHxxZ+2n9Z4
uXo+V0ptzLOBl/B8GuwB3OFlpO6DUkqfD95Dh+gBd7rc30gvPa6Na1e+P5H24GStcPPGGRrDriEp
cycOAK6MMVdi3MMxdcexBOD66buznw8R9BA6sPaSmorM0HJGYxh4zcgLNCPDpMPbNg+7Jopy+5m0
/muk48S5LZoQ/sXMxRNUaLIOXhljbiXCFI3FzsXb0G5NFO3QtCeN6xuqXJiHPejv6+58G+/gBt5x
NCHQzCOWoXXwQEnIMvupo2khfMNuylIxxTs0jb+Oosz8HNF4V7dojPprY8xePPa4rMCL14QsU3f/
V0DC80nR14uP4cEDvBH/V6LpcW04L/3HxKcX1o7rvPJ3WJeBL+0/jcZTvAdwBeCfxpiTp34Qoz47
i/Xi4dq98/pGx1RE6MUejBd/+uEfX79+jaWMIAiCIAiRiOXBC4IgCIIQkf8Hz/6MJKPMEVIAAAAA
SUVORK5CYII=

--_004_SA7PR11MB9594AC924FFC3242C77F7B8DE8642SA7PR11MB9594namp_--
