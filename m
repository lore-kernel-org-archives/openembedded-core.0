Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D17C8303C
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 02:19:01 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5147.1752027536940350887
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Jul 2025 19:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928519c0ff=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5690eF7i009253
	for <openembedded-core@lists.openembedded.org>; Tue, 8 Jul 2025 19:18:56 -0700
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5kj24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 08 Jul 2025 19:18:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwTGrp4+VNt5COqEPlb+F+x1j/Rr6IhKgAp0YwuYXK+N/LfRMShWO89a3pm7I+8dbpuRH73KGwp8wIbQM7zs+J3Key4L2WlrYbl28ew+VjUcvaqHgRUE/CNkjNc7mRS3JF7fp1ANZ915eEE5jOwM5jXkdzmFHKtwop7RqOPLb4Uw1bU/jQkeE7qC51n6AfMtDAizWFoixzih1dedAPyJSS1lyzzEDGXK0N3VHsjboYwJDpmK5Aoom0kpY6GdsqXUEFNfMW2HDU2KXXhID43xODLbVeH/5/rNGyQFG2DzbrsfGiypmXsWeTT/u9VelA5APorRO/60VFUSmtfaL7TCiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kv+u7Zwi4PZ4XBIon2ZoBVDDZWsKP2ZNagx2oTTP9Uc=;
 b=Ja1DF0csiZFcIS3343wM3PvMLpwt6Giz5gmddb3dA8up3u2v/05NvqRKeYcnydBt1G4TKp5TEQcei3tdD0yTRaljczgENuds+lhUsBu7avgMFcYRO2xEuptKWxuVLNIr/Rwj2om+yokPBPdOWhq4sGCnyFveo3E9fqsq+oiId2gYu3w8IQZZCyZMUwI0KqZEWKkb8QHo3OiCYCxdlzsqXihRX5MLWj4QxaRvbT6xH4ene0fwbOY8aD9m4fxCsV8leEte5cizQvbqQ+l8x/C0yz1M/qAv/sHa6zz7ZlvWz7cEaGQUdb+d2pQ/yrPmWyL0AUGYvadrpAkhahjkLBfHoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by LV8PR11MB8680.namprd11.prod.outlook.com (2603:10b6:408:208::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Wed, 9 Jul
 2025 02:18:53 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 02:18:53 +0000
From: "He, Guocai (CN)" <Guocai.He.CN@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core][walnascar][PATCH 1/1] wayland: correct the SRC_URIs
Thread-Topic: [oe-core][walnascar][PATCH 1/1] wayland: correct the SRC_URIs
Thread-Index: AQHb77OxxIMwH/RnvEOma/rFQ4kvRrQpEAjE
Date: Wed, 9 Jul 2025 02:18:52 +0000
Message-ID: 
 <CO6PR11MB5586F4E9E7CA9E6115A0391BCD49A@CO6PR11MB5586.namprd11.prod.outlook.com>
References: <20250708025442.2097775-1-guocai.he.cn@windriver.com>
In-Reply-To: <20250708025442.2097775-1-guocai.he.cn@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2025-07-09T02:19:13.749Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=0;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CO6PR11MB5586:EE_|LV8PR11MB8680:EE_
x-ms-office365-filtering-correlation-id: e6a7eee1-8fc9-4926-acbb-08ddbe8ef325
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|366016|1800799024|7053199007|13003099007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?Windows-1252?Q?HAk59OltOVyyGtGXdgTdArpTNCEFNPhBYab1GChYeX7Tbrfktv/MT3Yh?=
 =?Windows-1252?Q?SfRVCyVkrKO0SOtT6d59UQH/w15S4flAPAnvH7EY37yVWBq3Vi3BLCqh?=
 =?Windows-1252?Q?I/aC0LoQBm+Dn/o+5Y6mbRu3ec4lL8+jI+N3MEItHedEbRcTnOIzVacl?=
 =?Windows-1252?Q?GyGk+cHktxUCmH1KU8JEet6kKjBd7nxoxacn1PDta2NrcyzkO3o+Egkz?=
 =?Windows-1252?Q?LC3VkQrfEuKWB7opAjOdh8PdhqK7/T/OwvBSNoX1vPOYtCfBxI+5kDyz?=
 =?Windows-1252?Q?T/+k+gfvtZGfoO7ZHCMjH3IPfVauiLpoFajqB3vCja73vlZxoSA/6B0H?=
 =?Windows-1252?Q?uxiTlPUdWF7RPFz10OP5utCaKZzpBRWuY7Sl/Zj8dpCFBrHdRjP47BEC?=
 =?Windows-1252?Q?C4oHztKUwgO3Q53nargFv0WoteQEs00JVK8hMcDj1caOCJjuY5MaMP5s?=
 =?Windows-1252?Q?zJqubMvpnCwCzAWdwss2h7UoAJ38gWzL4oSFlkuTcBkeLOqC4twgQtU9?=
 =?Windows-1252?Q?fD7/GuoF/yj+KfiqwBl/yQD6E0MOVIULcnED0CSgBXHEGNkPvVNnHE9G?=
 =?Windows-1252?Q?s9CET4dlS9IqQgYI3118BA7fSo1WTwILcosOsT4yzl+RfZvSr9VywZTo?=
 =?Windows-1252?Q?XaJgemw+tVMn8duHAYdAix24EAh4wMqN4issmfuYUwFJzi56KtnYedkQ?=
 =?Windows-1252?Q?7T+9IOe+vIfywqpu8Z9d+nZds0MTgdR2TfnnVwvRTtrD3oFVZZfIL3ZU?=
 =?Windows-1252?Q?hd/ptjid6xTLFJplgsInGfcPXsFbrXIbyEb0e6ORjQ594WFWNdlLfiU0?=
 =?Windows-1252?Q?Z6T1s00J1t9RWkzFokr7mDP4gR/FU+ArOIknn80hNCxw4rzihs+iVgpF?=
 =?Windows-1252?Q?K0tQBdeBLMabYL3NZWduNyu/kXiwxo3cprFD7G9v7c3bz7ynS25J7OQu?=
 =?Windows-1252?Q?01NZUR8k65qaRVMJ9ftdsHlJTVbB+H4yfeNwyQW2Z8D1gAEotRSBEEY4?=
 =?Windows-1252?Q?AHmp7scQARbnVVeNxAmYcD4IxLOerJ6Gr7SexO7XXs160HGWtT+i9OtB?=
 =?Windows-1252?Q?PZZatKjZDypFahdJyGUtTjpR0bj3b3JiEWUXNAwF3FSM70eeWyE/D3cX?=
 =?Windows-1252?Q?LH4rtY7BkzhFGhb3Tvctf0xGHcq2OEp9e2vL/ZIvtriGxWjt1OkLPUhT?=
 =?Windows-1252?Q?dO+2EQVOuZH9oWPnWqiGTqnhOAVFnXHL69/DgFH4pL+vvdJvO2apzgU0?=
 =?Windows-1252?Q?nwEj8fMZsSoH8eR/81ivVP6m5VBsdOiWYwu96UVCM+EBKDgXP1HDv3vz?=
 =?Windows-1252?Q?VIaK7GV52d9+1iBxBgaa0zSZOBfb8OZIIlAbzfKw7ms5NH6SJSqv3VKM?=
 =?Windows-1252?Q?/NtuXTU2IoSS/bCxc3G33aukbA451MtzM1jxRrDir8kitpl1bhAEBayF?=
 =?Windows-1252?Q?xhjPPsZ+6nqzFOSE8OxxA1XgGJcHUQXBN9H7iYW9B4BaKOcZ7iyoLZwz?=
 =?Windows-1252?Q?DpyJM6kv/HA/K2eFuEriNLJ75zO6XNKJABnMM0cQo29a91O3u2w=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(13003099007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?Windows-1252?Q?fRePDtDFMDa/pETf2/IDuwQP3EgdsaZiyEJI3b0jD55dqDwCWx6ARI1z?=
 =?Windows-1252?Q?Fjw2GvIgwuY5a2kAnWJqzQX3t4weB+dIK0/ctfyGOiici6sxw6jwDDRX?=
 =?Windows-1252?Q?5uIkaSf7JU3LfAfS6wdjn2sqPyuirvMWq/pOhKjhucBAkkfKHfEtjeNY?=
 =?Windows-1252?Q?7NbvNE1lfmQzsEWE/PNZGztJTmb52Omo7ULr0yWeLiz9iq1gS5GjvVas?=
 =?Windows-1252?Q?s9H/AJ728ZkzcbHS62390SSSknTUpx+Bu/9EyTVmP7YbXSzcIsBGXMiS?=
 =?Windows-1252?Q?NtUyE9Csku3W9UDT8nAFLtpLkG4SFm7fTPz49Hx5DLjhlY1d5hEhAnCL?=
 =?Windows-1252?Q?sM+4TPw7YNExpgwzxY0XuxQRAdnrr+ZcVQK6sygnbKcPBmZF8XJAPbrb?=
 =?Windows-1252?Q?yhnmoVDaeo1KQfXWin5gtf24BvbYyRq+tbnWFm6heWIja9v+OoOFpbIo?=
 =?Windows-1252?Q?zJAFedSY97dMbkgfTRWi0hi5Sj6SKwTE/OGbb62k/JKcqKI0/nA0xNuP?=
 =?Windows-1252?Q?0KZZnkkZIIGGRl56I0OIwXxfRqpbgkP+9/qTRnzduhuP39FehJihrb5z?=
 =?Windows-1252?Q?CYm/K6l/Bd7rTOa1BRcz+oSEt7YFKQj1/U1JCItyNAIq6bufO2J4w2AP?=
 =?Windows-1252?Q?Pc/Qu2S8phfM3bQhtRHBQrfsiZ5JO0UJLgUwDz8s2uC7XsXbU5cDRs75?=
 =?Windows-1252?Q?NHPOqVuIpMHqnc39UDdDQLr73AYbDGjjcuIXhM6hprlTQg2TR1Q1+wT2?=
 =?Windows-1252?Q?Pfp0jW5V7k6Hr2mG8SZ7Inh6i/TpCYmQRAd2rxqYBXO3Yp28ehRX1CA9?=
 =?Windows-1252?Q?F+uAl0SiYlRxTrOr5EjLQRPi9eiebiX8jgvWkuMqFkLJl7A61gYxhBQZ?=
 =?Windows-1252?Q?HQX/Kl4FsxGg6aKW0ukbWCauPsjVfoDFBngVyINeN84kfO3r0QkSIixO?=
 =?Windows-1252?Q?K3+74l4U3CcMFvJoIKlPo1cwmYLr7qYfcrsrIuYLqPLwguOAoWX8Q6k4?=
 =?Windows-1252?Q?QD2yBSRU3PzL4lR2kTBgTK3VOwEfYK2beHN5dvUdzkbwN7grhiSQNyVM?=
 =?Windows-1252?Q?q+HC0qaAaTjnNmgVUb/PXEEgigt+aFBABRafBinS/fa4YAqrmpVMych/?=
 =?Windows-1252?Q?Z1ld3kYIoZP0as7Q7e0U1GdhjcM55OxwJROhqTu7XeZj9EZuuY/GHeJ9?=
 =?Windows-1252?Q?BNEpPOaSjwi4P4m8Wut/7EI48L7jRn3pWiXXj2TMGWXEUaG5Mb4B5xTz?=
 =?Windows-1252?Q?qOMrB6A4I5eM2yM4NGNa1WPupvVM1c4Rc7Nxr01QcWJCVijiLMrOAwgr?=
 =?Windows-1252?Q?dyHOzTCosNXtLzXUVnZFdfcHq5wpWerhe551+JYU5S8KNj11zgpjvTwp?=
 =?Windows-1252?Q?wMEYDhV57CVW9Yk8l+Iqr0cJQnYeQLUX9skls+fHTxsOYXMddN+e7RKu?=
 =?Windows-1252?Q?CPSDR3ALEAwbzdh3QIWXhYk9TMNS2zdtt/TPCXVs+ljqkMbTLqrcqPf4?=
 =?Windows-1252?Q?7pyoOee1CAYxcTeSRs5Wq7CH8HwsdDLwFoL28m/M0Aw77Tk20qE8h+T2?=
 =?Windows-1252?Q?Zdb9mwm1d3Y6dZEqn10u4XKwF1z3Ol4QVMZVWVsaKCIzGhanomYA1Ln2?=
 =?Windows-1252?Q?f/bnsRGVwdCzxjfrDnV9r+l+XuM8K4SPcmgtKTp3U6stAztGkewTeDUH?=
 =?Windows-1252?Q?ZaMJgtp82yLzhToQ/ngBGZtt9XccQCxE?=
Content-Type: multipart/alternative;
	boundary="_000_CO6PR11MB5586F4E9E7CA9E6115A0391BCD49ACO6PR11MB5586namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a7eee1-8fc9-4926-acbb-08ddbe8ef325
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 02:18:52.9958
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TdNefFrrcs/Kb/8aNzLlIx+LW4r11WVJx34X5P/KvkTtOhmX9TqcuR4ZHBPcPDdJb3MJ+D3pYKtx+EZV/z2U2lh3zPu4zRHJhXu42TV6wvY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8680
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX74aL/U43dK7o OxeAsQMdUyProeiwloxZRoZOZ41HPOvikNQCf15PI8cIQP0sZBjt8fk/Hzn1wx5c1+i4qiCRv9j 4WlZungWshpEIBml2X/bspWFfTbuu5Dixuf6fD0Qpder6eNfRgtfg3lfACraH6exVj8+JVEiBLy
 HzFxJcuHod7uOxwsDBm4BuNxJ/OTUWW4Z4hg9M9X99sWTBaU7RvCLvEYBMnAQgbewoYwS1S/H0c WoEjhvneS945y3kK3WzzrpTPTOr3B8cJnML/IhXQhIrkWu4zVv0/DnRxyeZ1MY6nVyA+m8zCjzO LYifqo9R73c3vS73c/sL64w39INie6RGWHbiJ1r7g3oz+0EsSGDfl1cc2eKq7iBMA1XYCQCLSCt oDb7ncqk
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686dd190 cx=c_pps a=v1Stge5IH4fBwzlX9Lmszw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=e5mUnYsNAAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=PIYgZgkD6QeXhN1dD4gA:9 a=pILNOxqGKmIA:10 a=Fw-oE47YfpUy4_pEl9EA:9 a=iwLOZx28Ab5pVFwU:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=Vxmtnl_E_bksehYqCbjh:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: arK0p3Emyu3d5RIX2b7MaDtie9n3Evvl
X-Proofpoint-GUID: arK0p3Emyu3d5RIX2b7MaDtie9n3Evvl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_01,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 classifier=typeunknown authscore=0
 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 02:19:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220056

--_000_CO6PR11MB5586F4E9E7CA9E6115A0391BCD49ACO6PR11MB5586namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Sorry for the trouble. I=92ve confirmed with our IT team that the issue is =
indeed caused by our company=92s network security restrictions. When I=92m =
on a non-corporate network, the older URIs work just fine.
Please go ahead and skip it. Apologies for the inconvenience.
Thanks,
Guocai
________________________________
From: He, Guocai (CN)
Sent: Tuesday, July 8, 2025 10:54 AM
To: openembedded-core@lists.openembedded.org <openembedded-core@lists.opene=
mbedded.org>
Subject: [oe-core][walnascar][PATCH 1/1] wayland: correct the SRC_URIs

From: Guocai He <guocai.he.cn@windriver.com>

For wayland, wayland-utils and wayland-protocals, not only
the SRC_URIs are updated, but also the tar.xz are no longer
available. We have replaced them with the tar.bz2 barballs.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
The version for master is not the same, so this patch just
for [walnascar] and I have sent another patch for master.
---
 meta/recipes-graphics/wayland/wayland-protocols_1.41.bb | 4 ++--
 meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb    | 4 ++--
 meta/recipes-graphics/wayland/wayland_1.23.1.bb         | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.41.bb
index e8ab9d84fc..b8adb8ee5b 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb
@@ -9,8 +9,8 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc7b12b6702da38ca028ace54aae3d48=
4 \
                     file://stable/presentation-time/presentation-time.xml;=
endline=3D26;md5=3D4646cd7d9edc9fa55db941f2d3a7dc53"

-SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-protocols/-/re=
leases/${PV}/downloads/wayland-protocols-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "2786b6b1b79965e313f2c289c12075b9ed700d41844810c51a=
fda10ee329576b"
+SRC_URI =3D "https://gitlab.freedesktop.org/wayland/${BPN}/-/archive/${PV}=
/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] =3D "0abbb958dd5b85fb5ab537b4c59cc0a51d1678179c4ca679b1=
b925605b467cba"

 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-pro=
tocols/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/re=
cipes-graphics/wayland/wayland-utils_1.2.0.bb
index 59d414a0a6..b8542ea8c3 100644
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb
@@ -9,8 +9,8 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D548a66038a77415e1df51118625e832=
f \
                    "

-SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-utils/-/releas=
es/${PV}/downloads/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "d9278c22554586881802540751bcc42569262bf80cd9ac9b0f=
d12ff4bd09a9e4"
+SRC_URI =3D "https://gitlab.freedesktop.org/wayland/${BPN}/-/archive/${PV}=
/${BPN}-${PV}.tar.bz2"
+SRC_URI[sha256sum] =3D "f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb04759678b7b=
b2da7d16335d18"

 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland-uti=
ls/-/tags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>.+)"
diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recipes=
-graphics/wayland/wayland_1.23.1.bb
index 3a5d91be04..5974064968 100644
--- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb
+++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db31d8f53b6aa=
f2b4985d7dd7810a70d1 \

 DEPENDS =3D "expat libffi wayland-native"

-SRC_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/releases/${P=
V}/downloads/${BPN}-${PV}.tar.xz \
+SRC_URI =3D "https://gitlab.freedesktop.org/wayland/${BPN}/-/archive/${PV}=
/${BPN}-${PV}.tar.bz2 \
            file://run-ptest \
            file://0001-build-Fix-strndup-detection-on-MinGW.patch \
            "
-SRC_URI[sha256sum] =3D "864fb2a8399e2d0ec39d56e9d9b753c093775beadc6022ce81=
f441929a81e5ed"
+SRC_URI[sha256sum] =3D "4afcf2942a39d8276d06dcefc89dfaf029222994778fd4c49a=
a68a702ebf698f"

 UPSTREAM_CHECK_URI =3D "https://gitlab.freedesktop.org/wayland/wayland/-/t=
ags"
 UPSTREAM_CHECK_REGEX =3D "releases/(?P<pver>\d+\.\d+\.(?!9\d+)\d+)"
--
2.34.1


--_000_CO6PR11MB5586F4E9E7CA9E6115A0391BCD49ACO6PR11MB5586namp_
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
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Sorry for the trouble. I=92ve confirmed with our IT team that the issue is =
indeed caused by our company=92s network security restrictions. When I=92m =
on a non-corporate network, the older URIs work just fine.</div>
<div class=3D"elementToProof" style=3D"margin-top: 1em; margin-bottom: 1em;=
 font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helv=
etica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Please go ahead and skip it. Apologies for the inconvenience.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Guocai</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> He, Guocai (CN)<br>
<b>Sent:</b> Tuesday, July 8, 2025 10:54 AM<br>
<b>To:</b> openembedded-core@lists.openembedded.org &lt;openembedded-core@l=
ists.openembedded.org&gt;<br>
<b>Subject:</b> [oe-core][walnascar][PATCH 1/1] wayland: correct the SRC_UR=
Is</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Guocai He &lt;guocai.he.cn@windriver.com&gt;=
<br>
<br>
For wayland, wayland-utils and wayland-protocals, not only<br>
the SRC_URIs are updated, but also the tar.xz are no longer<br>
available. We have replaced them with the tar.bz2 barballs.<br>
<br>
Signed-off-by: Guocai He &lt;guocai.he.cn@windriver.com&gt;<br>
---<br>
The version for master is not the same, so this patch just<br>
for [walnascar] and I have sent another patch for master.<br>
---<br>
&nbsp;meta/recipes-graphics/wayland/wayland-protocols_1.41.bb | 4 ++--<br>
&nbsp;meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb&nbsp;&nbsp;&nbsp=
; | 4 ++--<br>
&nbsp;meta/recipes-graphics/wayland/wayland_1.23.1.bb&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; | 4 ++--<br>
&nbsp;3 files changed, 6 insertions(+), 6 deletions(-)<br>
<br>
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb b/meta=
/recipes-graphics/wayland/wayland-protocols_1.41.bb<br>
index e8ab9d84fc..b8adb8ee5b 100644<br>
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb<br>
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.41.bb<br>
@@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;md5=3Dc7b1=
2b6702da38ca028ace54aae3d484 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://stable/pres=
entation-time/presentation-time.xml;endline=3D26;md5=3D4646cd7d9edc9fa55db9=
41f2d3a7dc53&quot;">
file://stable/presentation-time/presentation-time.xml;endline=3D26;md5=3D46=
46cd7d9edc9fa55db941f2d3a7dc53&quot;</a><br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-protocols/-/releases/${PV}/downloads/wayland-protocols-${PV}.tar.xz">http=
s://gitlab.freedesktop.org/wayland/wayland-protocols/-/releases/${PV}/downl=
oads/wayland-protocols-${PV}.tar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;2786b6b1b79965e313f2c289c12075b9ed700d4184481=
0c51afda10ee329576b&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/${BPN}=
/-/archive/${PV}/${BPN}-${PV}.tar.bz2">https://gitlab.freedesktop.org/wayla=
nd/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;0abbb958dd5b85fb5ab537b4c59cc0a51d1678179c4ca=
679b1b925605b467cba&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland-protocols/-/tags">https://gitlab.freedesktop.org/wayland/=
wayland-protocols/-/tags</a>&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;releases/(?P&lt;pver&gt;.+)&quot;<br>
diff --git a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb b/meta/re=
cipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
index 59d414a0a6..b8542ea8c3 100644<br>
--- a/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
+++ b/meta/recipes-graphics/wayland/wayland-utils_1.2.0.bb<br>
@@ -9,8 +9,8 @@ LICENSE =3D &quot;MIT&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;md5=3D548a=
66038a77415e1df51118625e832f \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/waylan=
d-utils/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz">https://gitlab.free=
desktop.org/wayland/wayland-utils/-/releases/${PV}/downloads/${BPN}-${PV}.t=
ar.xz</a>&quot;<br>
-SRC_URI[sha256sum] =3D &quot;d9278c22554586881802540751bcc42569262bf80cd9a=
c9b0fd12ff4bd09a9e4&quot;<br>
+SRC_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.org/wayland/${BPN}=
/-/archive/${PV}/${BPN}-${PV}.tar.bz2">https://gitlab.freedesktop.org/wayla=
nd/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2</a>&quot;<br>
+SRC_URI[sha256sum] =3D &quot;f38c6a4ca2113cf716ca687a4cd8e24a11cbeeb047596=
78b7bb2da7d16335d18&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland-utils/-/tags">https://gitlab.freedesktop.org/wayland/wayl=
and-utils/-/tags</a>&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;releases/(?P&lt;pver&gt;.+)&quot;<br>
diff --git a/meta/recipes-graphics/wayland/wayland_1.23.1.bb b/meta/recipes=
-graphics/wayland/wayland_1.23.1.bb<br>
index 3a5d91be04..5974064968 100644<br>
--- a/meta/recipes-graphics/wayland/wayland_1.23.1.bb<br>
+++ b/meta/recipes-graphics/wayland/wayland_1.23.1.bb<br>
@@ -12,11 +12,11 @@ LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPY=
ING;md5=3Db31d8f53b6aaf2b4985d7dd7810a70d1 \<br>
&nbsp;<br>
&nbsp;DEPENDS =3D &quot;expat libffi wayland-native&quot;<br>
&nbsp;<br>
-SRC_URI =3D &quot;<a href=3D""></a>https://gitlab.freedesktop.org/wayland/=
wayland/-/releases/${PV}/downloads/${BPN}-${PV}.tar.xz \<br>
+SRC_URI =3D &quot;<a href=3D""></a>https://gitlab.freedesktop.org/wayland/=
${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2 \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://run-ptest">file://run-ptest</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=
=3D"file://0001-build-Fix-strndup-detection-on-MinGW.patch">file://0001-bui=
ld-Fix-strndup-detection-on-MinGW.patch</a> \<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<b=
r>
-SRC_URI[sha256sum] =3D &quot;864fb2a8399e2d0ec39d56e9d9b753c093775beadc602=
2ce81f441929a81e5ed&quot;<br>
+SRC_URI[sha256sum] =3D &quot;4afcf2942a39d8276d06dcefc89dfaf029222994778fd=
4c49aa68a702ebf698f&quot;<br>
&nbsp;<br>
&nbsp;UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://gitlab.freedesktop.or=
g/wayland/wayland/-/tags">https://gitlab.freedesktop.org/wayland/wayland/-/=
tags</a>&quot;<br>
&nbsp;UPSTREAM_CHECK_REGEX =3D &quot;releases/(?P&lt;pver&gt;\d+\.\d+\.(?!9=
\d+)\d+)&quot;<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CO6PR11MB5586F4E9E7CA9E6115A0391BCD49ACO6PR11MB5586namp_--

