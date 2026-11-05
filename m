Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27970.1793857746755215731
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:49:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=OFQvpr0G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576940a4f8=abinivesh.ga@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50prYG238418
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 05:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	PPS06212021; bh=2iaPHJTgwKDIS4syMdOs21wD4N/jH/b540C/R3Wa9Lo=; b=
	OFQvpr0G4/iyFRwpyyiiGZv2jQDJGEaD7GHbOlg5+vPQjSoW7sqF9woodL5HSGAz
	14oi2rcr3GFtT4jhlG8BnfmZOrUbHx5JsTnnHLIC+fnMRDlf5qm91zKohfSB23TX
	rVyNa6E9zSb9Zfa5pyw2o5YG1KsHBar9I1Khmg0OTVN4DWoHq83vplHRKkRw7b5z
	mpGA0Y14GU/n3CsuewRIfBvfpPWWyn00UyadJcNe+BiMqKLCX2LiMq9uuDn4ssa9
	+2RP7FfniufcQTLn0qNOzN0zJgpndXiwW6jCQPtjDno3/80+UxyZiGlBpSu9VtVn
	cL82RvRZkBjnSiV7YyYmYw==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11020096.outbound.protection.outlook.com [52.101.61.96])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hram4h4nb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 05:49:05 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x8lSNtmEEs+qGYoT2sVGTL6TBeR/JpKAIaKvGmngsnkFXhbGdh2ktfG64qggK+3N3KwxQ0uoxS5AU5M5KWi2o8s4UTSn3W28EaKCRHgmay4s3xMtRR8KpZIPg+XoIM0Q9FbpakiIxZHz1azb6tQpF180TYxcToDCVRg7UN6gFia7aQPyYdtsMHWmmvcc1LHiK7vVaj3WcDKYtp5S6Tbqx6ELVNDzb4VssGwdb+pqwrtnLw2I6zl9/lqFAVrC6OYqPuzua9ShSkAMAsOuL9LAL7Eoa84qNZ2odt7D2zzCLuYqeXel/qHSE84ZoKH1Ja5hLftVbXz+1Zk9HJnrri/TcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iaPHJTgwKDIS4syMdOs21wD4N/jH/b540C/R3Wa9Lo=;
 b=MZmRNKAdI5E+ENRWUH3lmgQ7sQQj5knWww5Hs0CePezUN90dBK0hO3W61x5y1aFrjgL9YUKNLUqoigmeu/x6/W1zbEe/rYee1D5lkx0+OUQty7Ta4PNX11TDGGYh5MkKpLB/o8COcvDckru98UDc8JmlbuzDaOLo4To2RGClZwtWfxALZNrDvqKsCQd3qoxGucxAHGiPyPcg/ReP67SGn/ZzSVINVrgiQwQrcI8rvCytvEuKGcn2P3BO0D/oIbkrUZNhWIKW4Lr9udhSm/nDgQNQTlPybrprmA91EJkG/at0YKaL6DKtNhu18Bgno6YVSGsxJxnJZifMNU/EFyGnYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 05:48:57 +0000
Received: from BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b]) by BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:48:57 +0000
From: "G A, Abinivesh" <Abinivesh.GA@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Topic: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Index: AQHdbOlZbu06aGv/A0WimssAjZUdfw==
Date: Thu, 5 Nov 2026 05:48:56 +0000
Message-ID: <BY1PR11MB8031C5D92AA0B7B1A31ED62396772@BY1PR11MB8031.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-11-05T05:48:56.286Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8031:EE_|DS0PR11MB7311:EE_
x-ms-office365-filtering-correlation-id: ab1c0420-1480-4e7d-697e-08df3b007ba1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|11063799006|261021121427099003|261009223027099003|261102123227099003|56012099006|261026140227099003|261026121527099003|261022105027099003|261022075727099003|261028144727099003|10067099003|18002099003|6133799003|13003099007|3023799007|8096899003;
x-microsoft-antispam-message-info: Iroc+J49crwm6/UzO1fOnon43L1MLe8nW8ngl28TcmZuZYHr4tgcwiHfANrsooVLH7PoUuFkE/OGu8tYJPweEknXEz5fa1cTvmUcqsW6jcllD9x9+rXHqba3mIPriDhLKEnFrnPRQMFEXq7zo4u7eLumSjF99SVrrvbGHdex9mZJj7eOiQluORZkplHyUPve30XZ/qLKGf1JSqjbIAoN1Zv1T23U3rjgi/gO3k4d2Yicpd8kUfuynSfVpfBir/ihc2LN2t6kXKnKHGrhE2kJcSOBRhwbwKYZqRzNe8+YNPTMkjFpmJAcfQx0DeJ5b06k9zq+73YQp3SDWsNhvU3nM8iFoEjzMn4dHGBpI7ws9dcl/lgMc+0j2RnhqEL1zyKfhHV2bmOznKrt05DCeitcByykjYKjeLiB585ESAYqv94XxJ+N8wYlRCHKEWOG/pTEXqR3R8JmYniS5TI5C5le2baqqgH6l41NWPV/lFcNmwMcNX2jmCiiQs9JPp0cz449qcAqRvKp0SG+mOGBNUFDfDbMzK47Mt/YHkWRvOvSuuKn5/xL6JO4BMtvrHl7ejirSFV6jWphhMyVup4CbdG1jhfZJyCc95WRv6EpogwjNxgUyKpccbn7Jr3BWvlM/w11sbhUTj1bIoeqFEYiW+hRUJXqSlqJ/XdCoNCxgPCdBTA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(11063799006)(261021121427099003)(261009223027099003)(261102123227099003)(56012099006)(261026140227099003)(261026121527099003)(261022105027099003)(261022075727099003)(261028144727099003)(10067099003)(18002099003)(6133799003)(13003099007)(3023799007)(8096899003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?V33Xx7t6rneNoqP+Uz/KtB2UFnddMJesGtD6uUwzCco3dxJgS7wVEdBH?=
 =?Windows-1252?Q?9FD82S4f6XVQBbhH2omPUNTNrJvXd3BrMPWkcJyQLl8tdmL7hACJELyn?=
 =?Windows-1252?Q?OEnjn0iB8dlZQSVEG55bsw+xFhJ7bEx/8bzLkmvO3DrUqbeLnNC5cHB/?=
 =?Windows-1252?Q?IScXaE4AYu9C++9MccPzMYKSnXeNqpIbc1t0wUIs+2zSxIypbJoffUqq?=
 =?Windows-1252?Q?4dzGKygvjZk/+vBBUA6xZNJfn9p/ZKFFPFBQjS73AZf7w7s+Ec77kgvx?=
 =?Windows-1252?Q?w3bcwX+Kxyv9EI00HRYtvB41oxloDYD2fHKpcbnbylCLzPTuYUOzxm16?=
 =?Windows-1252?Q?NAvIAZlONaxYJk/8eevoJBRB0IRXeRF7LzxQdZISfFzDSNi1bL6Sj3v7?=
 =?Windows-1252?Q?L+ZAu5vZmrHrpAMNwLOAe+lZWIQAgZHXMAKsfb6f6r4D8nmVHDmuzGVa?=
 =?Windows-1252?Q?YWRA250mFTab4cOW4JMNC2zswK0rPtMdCT85QomMm5fsn0zMzvUReQ9R?=
 =?Windows-1252?Q?LMrGnvaL78z3yKbYER+qEsjyPWT5HBLHNO3CVYQqMeK1IJbWqZeIwB9R?=
 =?Windows-1252?Q?IhRyXChEln7a23gAY3w9TyXVG2K+EvmW0gdbm6Okvuoxd30FIL+a9ZNl?=
 =?Windows-1252?Q?iSqd5KsuKrqsjtB0xH3tSllS+UJkDoT3D2rtDyiXReEOED65RbvM+i9U?=
 =?Windows-1252?Q?9+qF4sfytlOVsyoeoDFv6eRnhbRzZYVlghEmebnk/Q9J//JSV2jabh7j?=
 =?Windows-1252?Q?n1Mb73w+yvn2yPzgfQ31r5UlJyG8x9wEp233E5TDpDW3upgjlBBAuoOf?=
 =?Windows-1252?Q?dt//+WNCCGUbAy3NsY7yL+cmmQNYSVx6V1tAzo4FX1Z2IySbuv27F5ZQ?=
 =?Windows-1252?Q?stTNIPu1VE/q9hJXMz/HrtFyjHdSgwbCkKqIdyOTyw6CQBaoZTOrMM5i?=
 =?Windows-1252?Q?JvDFPSwXXeAtK0YvFiDI0xK0q9eU9ZNYHTvJIgP9DVBM85KJFJA3i3Ia?=
 =?Windows-1252?Q?ovRLy9jMtElPyrjRYH5ZWWe/6LBXtV2O85C1O0dqwTibswMqT3yUvoZJ?=
 =?Windows-1252?Q?/eXA4xKx7IuhRj9WSa3k2HNknN1Yi6GAogDjNfnFXfVVoxn9ZqjmeJis?=
 =?Windows-1252?Q?SBqFrDwSrPOBNagslHBbT/XxPxabQ45KFI0xq2ZPPt5020yljTiEnAqK?=
 =?Windows-1252?Q?46BcNJLuP6jcVHe/8356bXlZnXMuTcN+mvCX9EIcsA8Yy2Lb31gB6I12?=
 =?Windows-1252?Q?FYwVCd/8W78SliLMFg1l3+gXzWTo14OSf222+xXTFBvca54lBwe61mvG?=
 =?Windows-1252?Q?yM1ACj8+jFr7DW0B0fKmnQD0+dLTh6cKyMH228+KQN2Jtjn8gcByDIaV?=
 =?Windows-1252?Q?UDU31/7qS42JnRwgTwCR6XtbmmdzQWY+zH0gSVWx4tngR54rRPzg5yhy?=
 =?Windows-1252?Q?J4LD08AR23vRABRVYuQDPnUl9c4+6/RegZw42HnykNFc1Ijtl2cUZrdC?=
 =?Windows-1252?Q?FWa4RQ31meoecB7VAoxn7TiKK0xY3xkldAkBL2e4+/JfBIq1VwmbGWwd?=
 =?Windows-1252?Q?5s4NvC+qd40Sb0A6hMeqIw9W5U8Bm8VgSbMPK9EelymrNIR06hyc9mIv?=
 =?Windows-1252?Q?tq6SJkzoT5TeyWL3gEd0P8uSCKwL35p8ka4TGoQ066XREd9gP54zrIvU?=
 =?Windows-1252?Q?r6qnLoxm44vq0QjUBWvEKC2cXPE3Z9GD5YXC+BRD2pgGJUJNfEk4XegL?=
 =?Windows-1252?Q?5OYj8C6suK91TbottI4oKD1MP2ne2XA+t14uWgzwze+Pm2U0Bpk7LgXR?=
 =?Windows-1252?Q?rZeIGwBunJpIqMjOBrUCLMN4cr8iHRLZxkGPd3taXpnLhmY1fogYzemk?=
 =?Windows-1252?Q?7MFZm7Qpo4ZBcQ=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: Z3E6fipcqHHQcs7SZ2yCBLqWKZAtENS2CkjzxVUVJ3gCnS1DDFDmMxRhwxAwUYuWRcyXYL8+TB4e2o5QZOmvUyRsuRuXUsnjZoixs9kexo1fLNsxTz76nXB/kVVXkGHDJtsRhvnoqVmeFinRh3kgvJxw66dO7W+F2KwbhtuhBlaKARVRoKptlWKDImordlnmOS9roJESDEoO79Ge+fjT+jgw1oxNs9h+RSJ66i2xvnHvkTsfMJQPVqVxtdIUB3IBnsDDUGQHa2PIkoLplECnzjvyHt3uAflvGHy7SdNzqEwOoBbohQVQldu8p0TprAOmCZkjj4GDfS5RWCh+MIMBEQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1c0420-1480-4e7d-697e-08df3b007ba1
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 05:48:56.9605
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HFUwEsmz8KcXFLgyRhWNFLQXyMtUr+/1gEHNgnfyoRdPsvhcWnI6Wtr7C6pMN9TQaY3MFQAY837k9pDIl3/QXaC+deKCL8r9UhjNcu39UoY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=cpMOAF4i c=1 sm=1 tr=0 ts=6aec18d1 cx=c_pps
 a=TvliyZNEFSK35vtP2Nadqg==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22
 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9
 a=pILNOxqGKmIA:10 a=O8hF6Hzn-FEA:10 a=RyLSzrIHGVG2HWH3:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: meBJdonf7ynS085G1Znoq0Hy8s5q6uCm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMiBTYWx0ZWRfX7z7NwXJ1ItMP
 qZU6yWsJ4ZBIvidSzZ9e18d5UnBO+CImv09nWUZmjSSPkns6Wl9Xl/PSaJJ79VAnLxSqF5F9+eW
 6aDRJ3fZG3dbMgFuoswM2XXO35usmFruQgnQgYRfkGeRkXn5BBGh
X-Proofpoint-ORIG-GUID: 8vsqCafR2pk_hBzaQMISAS1YfrYOSZHR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMiBTYWx0ZWRfX+JVDryJiXg2o
 CexOxxYJ7BublGhORbXgnzIwuTYRKJs3x2ttD9k8UT5JnE/YXOHKjcZyc8LaPvH2TcohOqsm0N7
 eLCpVj4SlQebzQ8AZ24Bha5kw8UHSrIbkXLx1OTsCAqrWiVxm1Q3FL/R2Jy9PXA2MbPCuKKx9N9
 iEKRS606pB1431pjIFg1cPlBOPVCxMNeC9zXpPjGbBYeR7uzAFfn6JvK5EgXaBR6cBCgzZUNZPH
 QUoZ7u4b6wTxA6rYOuYg0zO+4enGumONxN8R/o+A2CXYwf/RFLArYFPqMb2PT/XjPTayI6vFtVF
 wgMkQqB8IjQf3tziFqoFKyzC8U0S9kZ5Jt5PTFJncT3RiasqFT/UDbuGOIrRQ327emXbs9bvGYX
 OjWJEL8AfKflwyt0dvcDc4AG8/urjIzuFQKmTRTXnoSLyz4Z3pLxUAE3lQmGe7liWYa6Apj3iPr
 CJJQMFCpFBnNRrpkX4A==
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
	boundary="_000_BY1PR11MB8031C5D92AA0B7B1A31ED62396772BY1PR11MB8031namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 06:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249446

--_000_BY1PR11MB8031C5D92AA0B7B1A31ED62396772BY1PR11MB8031namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

   Hi Yoann,

   Thanks for the review.

   Commit message =97 agreed, I'll drop the upstream-code description and r=
eword as integration/provenance (revised version below, if you'd like a v2)=
.
   The .patch file keeps the upstream  author's message plus Upstream-Statu=
s: Backport [1c10bcc2e172] / CVE: trailers, matching our recent ffmpeg CVE =
patches.

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
post-fix).
   So merging scarthgap      doesn't   leave a newer branch exposed on our =
side =97 the newer streams are tracked separately and will get the same bac=
kport;
   happy to send those too if you'd prefer one series.

   Testing =97 note the oe-core ffmpeg recipe has no librist PACKAGECONFIG,=
 so a default build compiles ffmpeg without the RIST protocol and the vulne=
rable path isn't in the shipped                  binary   (same situation R=
ed Hat describes).    Verification is therefore build + boot + runtime sani=
ty rather than a RIST repro =97 which is how the equivalent LTS backport wa=
s validated on      our side  (clean build,    target boots with no calltra=
ce/coredump, runtime sanity pass).

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


--_000_BY1PR11MB8031C5D92AA0B7B1A31ED62396772BY1PR11MB8031namp_
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
like a v2).&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;The .patch file keeps the upstream &nbsp;author's message plus=
 Upstream-Status: Backport [1c10bcc2e172] / CVE: trailers, matching our rec=
ent ffmpeg CVE patches.</div>
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
on 9.0.2, post-fix).&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;So merging scarthgap &nbsp; &nbsp; &nbsp;doesn't&nbsp; &nbsp;l=
eave a newer branch exposed on our side =97 the newer streams are tracked s=
eparately and will get the same backport;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;happy to send those too if you'd prefer one series.</div>
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
 &nbsp; &nbsp; &nbsp; &nbsp; binary&nbsp;&nbsp; (same situation Red Hat des=
cribes). &nbsp; &nbsp;Verification
 is therefore build + boot + runtime sanity rather than a RIST repro =97 wh=
ich is how the equivalent LTS backport was validated on&nbsp; &nbsp; &nbsp;=
 our side&nbsp; (clean build, &nbsp; &nbsp;target boots with no calltrace/c=
oredump, runtime sanity pass).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&nbsp; &nbsp;Regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
&nbsp; &nbsp;Abinivesh</div>
<hr style=3D"direction: ltr; display: inline-block; width: 98%;">
<div id=3D"x_divRplyFwdMsg" class=3D"elementToProof">
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Calibri=
, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<b>From:</b> Yoann Congal &lt;yoann.congal@smile.fr&gt;<br>
<b>Sent:</b> Wednesday, November 4, 2026 8:48 PM<br>
<b>To:</b> G A, Abinivesh &lt;Abinivesh.GA@windriver.com&gt;; openembedded-=
core@lists.openembedded.org &lt;openembedded-core@lists.openembedded.org&gt=
;<br>
<b>Subject:</b> Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143</div>
<div class=3D"elementToProof" style=3D"direction: ltr;">&nbsp;</div>
</div>
<div class=3D"elementToProof" style=3D"direction: ltr; font-size: 11pt;">CA=
UTION: This email comes from a non Wind River email account!<br>
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
dacb717a25ab3db142ce390602" target=3D"_blank" id=3D"OWA8ad994d4-951e-2dad-c=
62c-8a02665b4f37" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-au=
th=3D"NotApplicable">
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
</body>
</html>

--_000_BY1PR11MB8031C5D92AA0B7B1A31ED62396772BY1PR11MB8031namp_--
