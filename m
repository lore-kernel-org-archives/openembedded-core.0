Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27971.1793857770032191018
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Pg/tZzc3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576940a4f8=abinivesh.ga@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50pYG8237974
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 05:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PPS06212021; bh=l3/jCTKsis9nhmxzgnVNYK
	BwMK2xg0GVOzPwuofZgwk=; b=Pg/tZzc31RehgMSDJ8pVVK4vNi8SnjvSbiWcVL
	D0EqPO/FRJBl35u57JmEV4jmODdIl8aEHauFtauX1uw0e/VhzX5MdQx0RrDPeluA
	8zqQQGBl5yIvQmDCUWNJOq8q7QyzgYmIK4EDoDEeHD0pWm7OxZTDWZfziTT/1xGV
	wte1bR/6hJvMidBG8OJp96V2WPaWMkyVZfii5GE8RhWRxSn1CfSi85PQq92IWSRH
	WLAHhdtpOWXqd1kne8z88U+moy7y1JTdnfz4xywrh9vY+q2vq/3oI+mcvYsSaA2a
	ZXFvwd9F9W6t7pg+xuobZzHhVy9LkCDQUWcuMRtBbX+gm7NQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020099.outbound.protection.outlook.com [52.101.201.99])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4h3uq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 05:38:56 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oRqHr+Y699j4ym1+iaZCQSiQ3b6YGGuMqXi8ACpW+8N2ztUyviKmYLM5Z3hpr5IJF3GgYbt6WBDG4Y43dQQvKrd2IaVBBQ4q3KxJzgsIJzEjK+VhHdsTgAS09QqfTKwlNfi/4+5m8n1lhYxqHZKViO2m+i/RK7nFxTp1rkd7xbHXGqDzqm4Bn3TEk/Nq0grjA7aDVzbuL8are/74dg9NFX13jB1tXyp7ZWMvfmMGlT6ZBx2WYlIUVMiVnie8EC/uGOhjFpazke/m9VuKhEaAMf9irHmRRvJyvihHAniYuHf5L3T8ZljXD8in2+aALhPHPPfKk7PFX9qVrK+xOWDj9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3/jCTKsis9nhmxzgnVNYKBwMK2xg0GVOzPwuofZgwk=;
 b=jLfMcfHbTsSsrRu6dZbeABuK+LV1gx8dkbZSTNF5IUBddjy2vCuP0OuQTpWjh5QxjJf4jDhsFJipbBp5Pw+E/ECnbzo/0ghwvBm3/1ETBr9yuhCoHxHuB19xYnOPIaYfqdLdfn9XgRJwi1opsYhXY+6NSR0EdHb1LbgAgKHNeMe32gpCk3xWSWtwxnwdhxUmBqgofuJ4gkNtozWd72/X8ZLKNbQrJe/jNOkoo22Etxvc4cRFE41dW435WEwcVe2VvggbP1FeKrarvVZU82WxUjSE1PGFhh6ySqx44vXfuGOqWaHeVfr9EOWtm9D2qH041IstcfL/8hoR5zeK+Z0fcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 by SA2PR11MB5036.namprd11.prod.outlook.com (2603:10b6:806:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 05:38:53 +0000
Received: from BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b]) by BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:38:52 +0000
From: "G A, Abinivesh" <Abinivesh.GA@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Topic: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Index: AQHdbEJcLyaVF8RJfke0fuL+cdGSxbceBtyAgADvzoQ=
Date: Thu, 5 Nov 2026 05:38:52 +0000
Message-ID: <BY1PR11MB80310D98D483C127A07A0F0396772@BY1PR11MB8031.namprd11.prod.outlook.com>
References: <20261104095328.2295613-1-Abinivesh.GA@windriver.com>
 <DMMIZ3O9KTWK.2CL9GKA6APZ73@smile.fr>
In-Reply-To: <DMMIZ3O9KTWK.2CL9GKA6APZ73@smile.fr>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-11-05T05:38:52.102Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8031:EE_|SA2PR11MB5036:EE_
x-ms-office365-filtering-correlation-id: ca5ab3bc-9dfc-44e9-9201-08df3aff1378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|38070700021|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261021121427099003|261009223027099003|261026121527099003|261026140227099003|261102123227099003|261028144727099003|18002099003|22082099003|6133799003|10067099003|13003099007|8096899003|3023799007;
x-microsoft-antispam-message-info: qYbFc5zNDjVrG6j1V3QPMcTZRciFUNX5YJX9KaZz3ZMLtRGqt3Fdss6ZywmC+KrhDTkbZ7GYqgUVGOHS7rtnIZFX8pIPn3AxZ/JMer0YOD72OJhIL5yHLSsR5mSolAr3RiQULsDyr0jqL/289RwtZyM3MOmW5gmiztDG3TnvyEbY9uT8/9NRTI5KAq6gWtKURIiP0cviD4LkdtJYiGL4pukBCWkKw0SALKSDmSkX0l9Nbw3YeED8DwFBe7Q0+zcZAXclVXQl29LB9p6flFJX/v+XD++d2UGShlImnazTFc2DV7tBtQ+wFRqtS/l6//W4XBcZAQVhTLoT7Jha0HlbeiGRVwi36eW4GZ5bJb3jsM+HQxbvqmTZ2SUOexEFemvSg6A+Wg63H62PJM8kHdKxhvTDS+p7jVzic99EHwacVKYECed+D4TH2dg8BEuBygvjcKoiK2LM6LNa1j3YWQlD7AosV4ncDGp7JE2PYfTWIR1nyzQMO+0NksKS2gEqKIp/bXYXLcZ22vpS8FBmXsNOIkf9RsjnWEkjvOR1DnAP2boIIKFW/W/UCtufqaCETMNG82qmVFo/wSi9Z3tHEfUNzG1VsWSnNNRE6lBKt7f1FfQPyzj0s1W8LvrB4IAE5JEzeSXmTPkA+4nt3lEEMaYrGutcooY5Wre3N+Z6BX7tTmM=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(38070700021)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261009223027099003)(261026121527099003)(261026140227099003)(261102123227099003)(261028144727099003)(18002099003)(22082099003)(6133799003)(10067099003)(13003099007)(8096899003)(3023799007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?bTsThb2YXZy2pxrYp7pJijQv8AJQq3cvJMcpGQJeYGzsIsyfJbH/5RRk?=
 =?Windows-1252?Q?r2ctORctMxqAbxdnPkNh3v/rr+ygzugJFYfMKv8YpaC2P5HaUiOsAKEF?=
 =?Windows-1252?Q?klK+V2x27NA/VKpiO+LhRiUxQtk6ozI87JwdH9WC8tVSEWF0kMhfeNdK?=
 =?Windows-1252?Q?V/k4SMvpzdxL2TqSN3Gk9Pogqv06ddi77XTlx0qYSvdYU2pEMMYMh26z?=
 =?Windows-1252?Q?z8D7DneoGg/9KNI6cwHOz7jiByt6iuC7yE4pNm8L8WxU9LLANduoDH6D?=
 =?Windows-1252?Q?xP6R4ClWvyqqkOW9YeVGfZeFh9z9oYh6nTWRQPXwuqlHGbs8Le2fJTA5?=
 =?Windows-1252?Q?eEAdj8BxmnJ4fD3l2j+NxmovAoH84SsXH6BonLndtfJhacQAkzzlut6W?=
 =?Windows-1252?Q?fEQX3RAwRZq1HqQyjzEvZQTDkkt7oOoq7JXRkTlFIFCQDhwV0Yry0j6+?=
 =?Windows-1252?Q?IaYpjblmVAtNVrE4W41NJ4Uxnu5n6YHXNCtySSnnUdd3/hC/D8+0aKTs?=
 =?Windows-1252?Q?pKnratqSCUZ032mJuHcjHHrdhCmM9OsWjgIw5MESv84uvwY7CchSrRo/?=
 =?Windows-1252?Q?Vo0dYnPU+Ep8yiScMHJD3eLw9oaoN4QWnc3O6uXqd59v504d40l0K6Po?=
 =?Windows-1252?Q?rQcbWc/tOuLN3XuJIDnZfyqm/SgKN2Tdf25dIT/2xD8WDCsYoXOHbrRM?=
 =?Windows-1252?Q?q1SuJIy+537oegL/5lH5PHfsDB98GewR12xDCOIFDY2BgNBBsxeyZEZb?=
 =?Windows-1252?Q?Wa9PjaJ2B22pAopz8XUm71HhAfs4SPVolicFgZqrysJBWKg6XgIo9GTf?=
 =?Windows-1252?Q?sOI9kUoM2sK/JsUEHrzod0LycMbEL/6MYIJsvEG078nsJXqy+vo7/lEf?=
 =?Windows-1252?Q?YeCxG9OlI/dvFpve9ZpYP4dZ6uJeyyBwmeDfsxmdRg4+PbsM4IdjLvm6?=
 =?Windows-1252?Q?cg/Sqq279Olva2UwD950C4UJsRpJMh4wcGucDoBD0MRsVAr6SDC+6H7B?=
 =?Windows-1252?Q?Mopz4dHLXzaTHWG6psI8dqRxSfOHOQQXcKv4cBS9uea5lnX5VqVkvIyB?=
 =?Windows-1252?Q?6cL+GZ/ltoqhuMMZUvtrZRnpXL7qTsZQ1mQcwq6Qm1zVJBxgnkS0Xpo7?=
 =?Windows-1252?Q?ThSgLUHwjnzbnMx0JwAmFWWrj8TCHD51FKjggoIOrqVVcrxwXMS/Y/Cc?=
 =?Windows-1252?Q?MFqLz9hUkkMQoKNKa6z0RNfcgN/9w6deLiASrQ//Jl0JswSNiWhUBLc3?=
 =?Windows-1252?Q?im/eUxfEEq5hyq95oVlV+XA1AUhTQ7Vj2U72jIetVNLhm5Dm6wtwFOwQ?=
 =?Windows-1252?Q?NwoRbiBCiT0ikvcvd1eOl+4jKBbUmrfCQs80sK8DhHcXNOvCDG6Hq2vP?=
 =?Windows-1252?Q?Vqw3FbVV6A3jAE0GAwFVvforT0nSzUw6euiXHb6sjhcK9mlMUUbbsQq8?=
 =?Windows-1252?Q?dyBqLoG/Zz/cYcSFl8xLMntUykh5FXymqLMDvIQsALLZtKj6A0HiAS37?=
 =?Windows-1252?Q?CacVWNYYEKdAvoz11Zz8E2inBq4wILhnQeVYfEWQiTsbGpPEENyyPp6s?=
 =?Windows-1252?Q?cx+YgcdnW+cAl340Epcc/7Q86vmWkc2kDaOXcsRgHJTaheFJV45iuj9V?=
 =?Windows-1252?Q?CtdgTJN2oxdMZ/urMZE+jI6eyA0r6wRwZ6ntvDVBg+thA4waFMxoATIL?=
 =?Windows-1252?Q?3/9mdFiUrSwPETxXL13Iynj0MDjkJp3457xGLYDF7z3QnmOB/xU2LyCL?=
 =?Windows-1252?Q?cyt/O9ItOGKx8AITcHHTSxfjtXAqqwDlmSqCZAgF/KtiCs87e2QXvv04?=
 =?Windows-1252?Q?LdYmdWEbDh19n9JmJIFTVi0h9/WgFN++IZV0JxqV9rJhBxyzrqqtNZUA?=
 =?Windows-1252?Q?F+q3Ro4MDjX8Kw=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: yKiikiW3YqY8cTwZ7YStD0HLEzEgh0DengaUyjHJd+ulK2VhbIHicVSzeE6M90VibOjr3a/Ka5xpQFfaBCm+YcyyymM2MshF7/clr0UPS9VR7+tlYaQqic2A8BqmSSCwReRo+4cjWooUnKQ5r9BX/ZWq5JI16HMaSYiPVfkP2m1tiEzPgVYW3bv6d+oQJCU9Rmz5TjOF6HIFCGpKOdxmXtVhSFglCsvSxBXbq+/xX9D7je7aOaUisYoXWh2dy9g/SwBrLAHSMsMau2/AjRosfCuwATg372UEoago95iGVMBz3XCIGS1DsBMFk8WYs+w01iGtw0izgL8mMkVvYM7u/g==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca5ab3bc-9dfc-44e9-9201-08df3aff1378
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 05:38:52.7434
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Nw10fmwkL8mICCshsifJ8LQhGthJzBf4zOZOPFct3hZycCo9ftoVJUMV9Cp8pluGFyk45nb8hoUk+2Ty3/SAVTdO0U7jWZV52xpdcxTbUuc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5036
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aec1670 cx=c_pps
 a=kJh41/vVy0mmRivLipeQDA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9
 a=pILNOxqGKmIA:10 a=O8hF6Hzn-FEA:10 a=CtyR39T_ufpS4ccm:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: NAH1YBF7QHSPfJGeAnXpHVb6p8JIThYX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMiBTYWx0ZWRfX4ehFdm4vrwT6
 QOFRmIQQMpe/VZp5M86255yYvxTTw21OJF5Vk3TfUtTMRFCt9iBBLbXq0S8jc9E+FmIXa495Fer
 EMAcgOdvZVoX7TxeWRJwxF0IFxd0ioyqyhuZJVkSQIriRGkmeVsK
X-Proofpoint-ORIG-GUID: gYXdK-cRj6nuYQgCE1Bh2SboNaquEx0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMiBTYWx0ZWRfXzeS2XdDHKZDD
 gQBXbKJFJ4hUD8cqiBKdyGfaZbJ+BR12yM3nyPgsEo4W5rdLxt43KP50K/FqP2AKyZlcj40GHfn
 7P1VoWkg+EBS5SQZpEL9en5HDSRFKHcUdypo4+3WgEGqkBZPkYdDY4RoA7wSesd4P4wjECPgNfP
 anowMeqHpj2JF9HP+wenFft7Z8+atHMA4X4gLw6qvkBMY+GGsYr7NYPcSpofkj7yOAJZWJPbWkP
 /IAJK2QGGgYZd6C/LylrY9I9TMJKc5XiQ7WdcX6j5VZWf9LZQd/MsgQtHhd53+Sk1xFoGHP7qZ0
 1/kY96F7crrOeQmFZLo18Es1CdlXOBtLo32d56YXZafYVboUVTh3bkGg5tJw4e0E3GeMvZlM4zC
 VgOTOwNV3tu4L7K7Xp6KJ0DMbZSFy3NS96si86zCMkJ/XusW/X63fY+OmCG0Hs2Zphbm4j8Z1ke
 UT50q2/QHHMpL+60YJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050022
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB80310D98D483C127A07A0F0396772BY1PR11MB8031namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 06:22:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249447

--_000_BY1PR11MB80310D98D483C127A07A0F0396772BY1PR11MB8031namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


   Hi Yoann,

   Thanks for the review.

   Commit message =97 agreed, I'll drop the upstream-code description and r=
eword as integration/provenance (revised version below, if you'd like a v2)=
. The .patch file keeps the upstream
   author's message plus Upstream-Status: Backport [1c10bcc2e172] / CVE: tr=
ailers, matching our recent ffmpeg CVE patches.

   Provenance/correctness: NVD/Red Hat/SentinelOne all identify librist_rea=
d() in libavformat/librist.c as the vulnerable function (ignores the caller=
 size, copies full payload_len,
   reachable via async:rist://). Upstream 1c10bcc2e172 changes exactly that=
 line; it applies cleanly to 6.1.4.

   Other maintained branches =97 the vulnerable librist_read() is identical=
 from 6.1.4 through 8.0.x, and I confirmed none of the oe-core branches car=
ry the fix yet:
   scarthgap 6.1.4, styhead 7.0.2, walnascar 7.1.2, whinlatter 8.0, wrynose=
 8.0.3 =97 all affected by the same one-liner (master is already on 9.0.2, =
post-fix). So merging scarthgap doesn't
   leave a newer branch exposed on our side =97 the newer streams are track=
ed separately and will get the same backport; happy to send those too if yo=
u'd prefer one series.

   Testing =97 note the oe-core ffmpeg recipe has no librist PACKAGECONFIG,=
 so a default build compiles ffmpeg without the RIST protocol and the vulne=
rable path isn't in the shipped                binary    (same situation Re=
d Hat describes). Verification is therefore build + boot + runtime sanity r=
ather than a RIST repro =97 which is how the equivalent LTS backport was va=
lidated on      our side  (clean build, target boots with no calltrace/core=
dump, runtime sanity pass).

   Regards,
   Abinivesh

________________________________
From: Yoann Congal <yoann.congal@smile.fr>
Sent: Wednesday, November 4, 2026 8:48 PM
To: G A, Abinivesh <Abinivesh.GA@windriver.com>; openembedded-core@lists.op=
enembedded.org <openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hello,

On Wed Nov 4, 2026 at 10:53 AM CET, Abinivesh G A wrote:
> FFmpeg before commit 1c10bcc contains a heap buffer overflow in the RIST
> protocol reader (libavformat/librist.c). librist_read() ignored its size
> argument and copied the full payload length into the caller-provided
> buffer, overflowing it when the payload exceeds the destination size.
>
> Backport the upstream fix that clamps the copy to the caller buffer size.

We usually omit info about upstream code in our commit message.
We are more interested in integration information: patch provenance,
proof that this is indeed the right patch to fix this CVE.
Look at recent CVE patches to see what we expect.

> Upstream fix:
> https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3d=
b142ce390602
>
> CVE: CVE-2026-75143
>
> Signed-off-by: Abinivesh G A <Abinivesh.GA@windriver.com>
> ---
>  .../ffmpeg/ffmpeg/CVE-2026-75143.patch        | 32 +++++++++++++++++++
>  .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |  1 +
>  2 files changed, 33 insertions(+)
>  create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-75143.=
patch

Also, please check if this patch is needed for other maintained stable
branches. I can't merge it on scarthgap if it is needed for wrynose (for
exemple).

Regards,
--
Yoann Congal
Smile ECS


--_000_BY1PR11MB80310D98D483C127A07A0F0396772BY1PR11MB8031namp_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"Signature" class=3D"elementToProof" data-signature-name=3D"Abini=
vesh">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Thanks for the review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Commit message =97 agreed, I'll drop the upstream-code descrip=
tion and reword as integration/provenance (revised version below, if you'd =
like a v2). The .patch file keeps the upstream</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;author's message plus Upstream-Status: Backport [1c10bcc2e172]=
 / CVE: trailers, matching our recent ffmpeg CVE patches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Provenance/correctness: NVD/Red Hat/SentinelOne all identify l=
ibrist_read() in libavformat/librist.c as the vulnerable function (ignores =
the caller size, copies full payload_len,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;reachable via async:rist://). Upstream 1c10bcc2e172 changes ex=
actly that line; it applies cleanly to 6.1.4.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Other maintained branches =97 the vulnerable librist_read() is=
 identical from 6.1.4 through 8.0.x, and I confirmed none of the oe-core br=
anches carry the fix yet:</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;scarthgap 6.1.4, styhead 7.0.2, walnascar 7.1.2, whinlatter 8.=
0, wrynose 8.0.3 =97 all affected by the same one-liner (master is already =
on 9.0.2, post-fix). So merging scarthgap doesn't</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;leave a newer branch exposed on our side =97 the newer streams=
 are tracked separately and will get the same backport; happy to send those=
 too if you'd prefer one series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Testing =97 note the oe-core ffmpeg recipe has no librist PACK=
AGECONFIG, so a default build compiles ffmpeg without the RIST protocol and=
 the vulnerable path isn't in the shipped&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; binary&nbsp; &nbsp; (same situation Red Hat describes=
). Verification is
 therefore build + boot + runtime sanity rather than a RIST repro =97 which=
 is how the equivalent LTS backport was validated on&nbsp; &nbsp; &nbsp; ou=
r side&nbsp; (clean build, target boots with no calltrace/coredump, runtime=
 sanity pass).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Abinivesh</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yoann Congal &lt;yoan=
n.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, November 4, 2026 8:48 PM<br>
<b>To:</b> G A, Abinivesh &lt;Abinivesh.GA@windriver.com&gt;; openembedded-=
core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt=
;<br>
<b>Subject:</b> Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">CAUTION: This email comes from a non Wind River em=
ail account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hello,<br>
<br>
On Wed Nov 4, 2026 at 10:53 AM CET, Abinivesh G A wrote:<br>
&gt; FFmpeg before commit 1c10bcc contains a heap buffer overflow in the RI=
ST<br>
&gt; protocol reader (libavformat/librist.c). librist_read() ignored its si=
ze<br>
&gt; argument and copied the full payload length into the caller-provided<b=
r>
&gt; buffer, overflowing it when the payload exceeds the destination size.<=
br>
&gt;<br>
&gt; Backport the upstream fix that clamps the copy to the caller buffer si=
ze.<br>
<br>
We usually omit info about upstream code in our commit message.<br>
We are more interested in integration information: patch provenance,<br>
proof that this is indeed the right patch to fix this CVE.<br>
Look at recent CVE patches to see what we expect.<br>
<br>
&gt; Upstream fix:<br>
&gt; <a href=3D"https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255=
dacb717a25ab3db142ce390602">
https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/1c10bcc2e17255dacb717a25ab3db1=
42ce390602</a><br>
&gt;<br>
&gt; CVE: CVE-2026-75143<br>
&gt;<br>
&gt; Signed-off-by: Abinivesh G A &lt;Abinivesh.GA@windriver.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; .../ffmpeg/ffmpeg/CVE-2026-75143.patch&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; | 32 +++++++++++++++++++<br>
&gt;&nbsp; .../recipes-multimedia/ffmpeg/ffmpeg_6.1.4.bb |&nbsp; 1 +<br>
&gt;&nbsp; 2 files changed, 33 insertions(+)<br>
&gt;&nbsp; create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-202=
6-75143.patch<br>
<br>
Also, please check if this patch is needed for other maintained stable<br>
branches. I can't merge it on scarthgap if it is needed for wrynose (for<br=
>
exemple).<br>
<br>
Regards,<br>
--<br>
Yoann Congal<br>
Smile ECS<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BY1PR11MB80310D98D483C127A07A0F0396772BY1PR11MB8031namp_--
