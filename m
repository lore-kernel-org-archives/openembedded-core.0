Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28183.1793857950220268074
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 21:52:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GaMCKzNZ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=576940a4f8=abinivesh.ga@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A55LlKD3849510
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Nov 2026 05:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-type:date:from:message-id:mime-version:subject:to; s=
	PPS06212021; bh=jaL/23dh7TrW7OxmCwSy7ZPLJVc8qVoSgpCNncNdAls=; b=
	GaMCKzNZOR8QxNUZkWYxRBrXgnQjaPDVZogNkQibRgS7DIDC2AYhpU/h6Hu2VeXQ
	1i2XsdaTjQY5Zis6mal5nN9HiHzxkOpXkJezgDdXoQ58oSRyqfwKT+NBEKAS4xK7
	7yVuRipBqiBgdg7KRSXtCd4F5vwknrHck7W0J7pWT+3TkHHQfxS4MEs61owqw2kp
	kd2kXogT3ShWKNKjSHrf4sxUwxmswGcYVjKLZeQFO4DEKQd9C+PUVDB6i3taSkDG
	kNh7fRgBaCOsYl0LeI+TMSodAnAKID1MWbXjZ2KDDEP10i3nLgHO9+QVD22cFfKy
	BO0ZOh3LZJWZ0Ijagt3zgQ==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021082.outbound.protection.outlook.com [52.101.57.82])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hrafhs577-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 05 Nov 2026 05:52:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky2iLT65zWn/7Zoqdw/mSXrdbtOvpXG5W1NEjEJgwIKKa9vA+1+DQvzLHs19vwbxwZw92YQQowRXVHVJ+Cbe5sSjyfv3V0P0byK3Kz3WfSxSKGo5HObbSei4ZgBSa/8dGWYuQUTfEAdGHT+imJ8uuZxLuj7AzjP9bOz/WRqf51jmyZO3LgxY/aW1vjNNfEWyIRPeQG+1gnApqpMBaPhlTHGvv/so3j6pYl6SUxSP4vjExHC6wvBgDLXMqvws/lOrHCtkVvXIv1qmsJwGnpob7BGrhf7AI0H4Hh8Nl+/K3v+6MtxEiOT0AUrP3vQpasxFQ2UcMJEOb4We+vBVZSYrKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jaL/23dh7TrW7OxmCwSy7ZPLJVc8qVoSgpCNncNdAls=;
 b=B2Q3GT8KjZBoZRF5bZ7aQ60mdbufBBBa/M0U4jx1SxqpZF5hpaP9JseiOZqlt0a+Vj/XTWGHrhzkacsvcxOlU2LMqRsHuBq1fN8ss1ats/4f39EVCzzWf8LXkyg+8l5pgDe4n6H854dQEk+LXex0MfFxCK4b/u3uGzWdURha8S8fp/dSWuAdiL5jwzzM91X5qnkN6MWIBC8ObGtd12GHUtHMeRIC4+tZ3TpeAg/TZiuzUq39WvlvSEGXjh9mUzH+BHfLZemBNBBN3rKWP384IfBJCszHZXmkzcjWk/9PxsFuLk/h8RC8WNq1sXjYH7PoiBEh+zjzgfe71FR9xz5FsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY1PR11MB8031.namprd11.prod.outlook.com (2603:10b6:a03:529::21)
 by DS0PR11MB7311.namprd11.prod.outlook.com (2603:10b6:8:11e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 05:52:26 +0000
Received: from BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b]) by BY1PR11MB8031.namprd11.prod.outlook.com
 ([fe80::a757:a627:ec17:3a6b%4]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 05:52:26 +0000
From: "G A, Abinivesh" <Abinivesh.GA@windriver.com>
To: Yoann Congal <yoann.congal@smile.fr>,
        "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Topic: [scarthgap][PATCH] ffmpeg: fix CVE-2026-75143
Thread-Index: AQHdbOnV2o6pXO+Fn069o5F62SRNdQ==
Date: Thu, 5 Nov 2026 05:52:26 +0000
Message-ID: <BY1PR11MB8031E1AADA730E95EDEB30FF96772@BY1PR11MB8031.namprd11.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Enabled=True;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SiteId=8ddb2873-a1ad-4a18-ae4e-4644631433be;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_SetDate=2026-11-05T05:52:25.404Z;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Name=INTERNAL;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_ContentBits=1;MSIP_Label_3ea094ce-8c76-406f-84c8-0af1663f74b7_Method=Standard;
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY1PR11MB8031:EE_|DS0PR11MB7311:EE_
x-ms-office365-filtering-correlation-id: 1f5b3ee4-c97d-49a1-e25e-08df3b00f893
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|6133799003|10067099003|18002099003|8096899003|3023799007|13003099007|38070700021|11063799006|261102123227099003|261028144727099003|261022075727099003|261022105027099003|261026140227099003|261026121527099003|261021121427099003|261009223027099003|56012099006;
x-microsoft-antispam-message-info: /TrjYHYBxyhl4mS2A7gLCUYamHupXZq72PVLsQI9Q5h0BUxbsssZVpS1xidTJHySQdVKIABCcMKXrZ19fjTncFnCwXTv0rFcaAB5eLZkl53VehU7/54syPYCaTfDBH00IDPLw65acaw0F911IObQ/vTYNHMQ/p9K1jvRNFjnguGFIRhvc3/kW0Xrh6OKbaqzAV9hvbJNwg4c9gCYcJtJlvAZZTD3422MsX6dehylm1l1dMq462MIwXmwTSlbbK13Rw0lSgpr8II8fnFz/anvI3Os1SkmdlTXkQRlY427UkH+kmIgpQ6sqahoJWBEG0aosiKr/5fRs5+2NxMJCZ6tfL6pXMW741HZt0qmqa+Yzt111Ydgs9JrMoBoqji3L8JLg/Oq2DWipuu7mMtymLTTd91SJrUWpK/YK2+aEYDUPNQdkSyjDJnkDzSwAYsAY5amdNa399dDRnAq2+f+d1YWTsO4C1r9o44Ru/Zn7Hip2CZld9E80bojT+inuykBnQkp6WYkIC2HerVzOh5dcaHwk8aRw31W2oVIdwPsZx/4q/yz/yAg1gxZoDEXTwf68CXfDbXPVT0uw9uj9pjqoigXXgulBKOyD0IjCK/esjcboqD/Gs8j1FhtWd8TDTpxvGOJr5Nk0SGQo6lstg9WtubBTkN5LTZ8WLiKQEg+G6bLv0Q=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR11MB8031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(6133799003)(10067099003)(18002099003)(8096899003)(3023799007)(13003099007)(38070700021)(11063799006)(261102123227099003)(261028144727099003)(261022075727099003)(261022105027099003)(261026140227099003)(261026121527099003)(261021121427099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?Windows-1252?Q?KBMe5SB4BTE2HaB2L7tfvsKvX7GC9modncRBRG7raKwRy5K7RSIQc+me?=
 =?Windows-1252?Q?61DQZm4ATgff5X/7phCRu3aUoRykReqKgttOInRrcmQ+kZqqy8IOEdK1?=
 =?Windows-1252?Q?2txeTMwYMAHPinDO0/K1NcOoM3J+sE59+qq4lssxpCtpr3M4ZD7RBEO5?=
 =?Windows-1252?Q?gRxbwbgvD3JRP0CmI9+A8Wz6Jad7bVUdUpkWdDX21mcCkQvPX2M+Ugtk?=
 =?Windows-1252?Q?Oo9KkNnwdgyzjWhVO+p52UUewrwtOu4ZL6NjO3FUBXCkmS/iA33Kbt6A?=
 =?Windows-1252?Q?m2mwcPAix1yxC8yn3cLEbyoaPMTb6R0heZMVt3GBllYgg9VaW8rOmVqU?=
 =?Windows-1252?Q?OvMCOEohqfVEPMbq+ncknWNDdwux8kY2jxwn0l32lKqOkB0a5/mj6sNa?=
 =?Windows-1252?Q?7YZYwKY09JrvtbNoOPxwzA8O5W/WlKFmlzO3AQeBsRwq/T5u2tPZqNyg?=
 =?Windows-1252?Q?DheQJO9PPcq+gLX7sJh+XeHi9DEd1oXLEDfoEACK/7X18hcrZVU1olIh?=
 =?Windows-1252?Q?eIT1YrhqyLL3ELGTw4szc+r2VF33dMCSqOPmffJpnpYNaxAKXV+DuhTs?=
 =?Windows-1252?Q?sHcwXbsi199ftLP3PGXWg26WeS4/PFlGGQHIEdGac5zsgb125DmvfwoB?=
 =?Windows-1252?Q?OfuBfQFt7aSkjFAANGe7ymO8SEI3g5khBVxuwvpWZEAM+LUlg9SgG30I?=
 =?Windows-1252?Q?SkvwrWzvdWiBGgM+r78lYrKV7pT3pbMusItsgnKrU2x9eWzK8c6mvyB9?=
 =?Windows-1252?Q?t6HK7lb1EMFQWPnTdaYDQfR84oEHFvrjWEdPLcuMyK+9t6PVtaPkjv8W?=
 =?Windows-1252?Q?JnTcSpR51V+kEDCKoF4niDh3xccSDav/BhDAynR24qNu/OMcBL3L/BPb?=
 =?Windows-1252?Q?I5BJ32jGE0VfOE1g007G7QDHegcYCW3I/vqIi8Dq3JdGHzzCMDNqPmte?=
 =?Windows-1252?Q?R8K3EHOA/0LhZRckLUd8GYXCmtCiTDGyiN+tWnentf8KKSQJoPtBINSs?=
 =?Windows-1252?Q?qCl42eiGeUCncJ7MYAkJjKrWOC1wbbuzrbUMgcDUt88Gzm57C50WZLiu?=
 =?Windows-1252?Q?JuHSh0qyJ/AMMUmgKZhxRZ9BWo0Ew7JSBR9NJZ97/JmKSIskMll9LJZE?=
 =?Windows-1252?Q?JOb4kgd0DR8CCD6P6fR6Tf46RIxDomghbH8clLfuNiKihN1jNl0/PUbk?=
 =?Windows-1252?Q?ApfRwSlk1IsVfj4npFHw65LX2VS6IbSe+6K27Z62jA1bwIdwQ0ezMsoN?=
 =?Windows-1252?Q?KOqXCq0dJStEkuvgxp+ftq0nVdA1wysJro1P3Z94HifeAqcsoWZz8Krz?=
 =?Windows-1252?Q?UW+CX9NVnmGx/Un7pqCBV4rg3lg9+Du3Ss/WYOA1RG8mTzfAOrVWtO78?=
 =?Windows-1252?Q?EfkITM3VPQqJVGJf5CRgKk/oU9x2++UFywdizKfntnHW1y6M/WwTQxYa?=
 =?Windows-1252?Q?LHlmmDARkGe3pCbw71giHlu+MGuQLwJBVDRg2qk6c0Nuojx5X5gmV9eL?=
 =?Windows-1252?Q?bwT/i3BTHtnFobqCjxHEG6vddXxPhWm3AlD11U87qDmVEeMF3V5CyTjd?=
 =?Windows-1252?Q?kEFSAmoN17410sOj+YLzb4+dntQ2+odVy15X51diXSuP66ydDQB+kZUv?=
 =?Windows-1252?Q?WP8DyooKJ5vnn9swLq4moSwt67XMN4l6rAkv1997OEuolH2q/0z4JDno?=
 =?Windows-1252?Q?mSiCdCyNvAQ5jsOShLA1eaf0MYwS6zcCrOnK7kuXv9K2mA5WIeDtB8Ea?=
 =?Windows-1252?Q?LsreI/iJGU4VM4PDKdTeNH9QuF4L+2GkcCNnwKpqLRMalSEniyRYQ/nr?=
 =?Windows-1252?Q?X6UE3jXMB5euICvbueP9BV4e7MIMEwkO8h3Cq/HeEuxXucyzQM7dQ2Ev?=
 =?Windows-1252?Q?gmvYSf3ru8WFJw=3D=3D?=
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: u/iruA+yiTUCZO+0Q+0ALO+Y2n13Q18ouLcrMMNfhcNDNN0zATvJ163g1rHJ2o6RRLcC7BG/fnEama+BEoaZqZB5V8AI6f4yHoGbHEVafC8H7CdmVNIwoBNjDox+EY7RESV7TZ9QuKqF6SpqXndKVtOmT3pWOx78/TnRNKtoByjbPIlcZOv3UkJXL1iwRccFUcVFZSh4JwfkfzNz0shbU4LZ1SUQihhMnfFM2rOjraxzWbfTg4OvzRVs0gcf0riaTKdmvHxkxVMfp6zncDwqEIbOvqeMPEYqP0bQ4kA1MOdPLA/fxjGHEiad86exPs1FXfYyvEVkrwAI462VuRli4A==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY1PR11MB8031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f5b3ee4-c97d-49a1-e25e-08df3b00f893
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2026 05:52:26.2389
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p+8KmZm2HqW5WtEdEwdR+0brfotzpKvocAwxcrAJ5g/rbkt5u7xYsSshRX2s3++LjhWoWjY9JiBAuprdu+DKFMXOCjWySMZUMAD3UHo0JdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7311
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMyBTYWx0ZWRfX51GmnQ5wHKZW
 8w3/U/sV68bxN6bVpmKs5PRnKO9OBRJ5aJzBAJKw08WOo5Zz7pibrG8/1G2qwkSUhURWf+ZD9qt
 j8M4EQ32ahCfisgwUbNQKyfwm0eUf+4+HRruuZCIxoexD13UdrEb/ipUEC/3qmpizjzmDxmQOG4
 dLNU5o+iy/wdi0Sw3NDoE2Rt4zNfJs9/Sd0gIzc+m2i9EVwlQJEDoCmlJH9mCjfwWSVz4yDPqf3
 i/ZfTrRPPo9TcoFGaMy7p9tM1hbudXNI5Od8ZSM6KrLcc8lqK/IXyXFtwfrZ8/H0nJpzwj8bvTj
 nH4vlgwO6F02gm7GR17aoMuzV2GfgvkQRJbdIOwNTwJJXCV48BQjSXw0fZMdcfzwMGnz+a4nX8j
 o69qSNnmaxfC0+3P2uwS8E9xgUvCDoxvjt192sSP3yywqgj/YbU385+NYdh2bisu+qzUGT/0NpP
 wazXPaWbSRNlLL8kf/g==
X-Proofpoint-GUID: E_rtZjr5nMzHioW_3MhVbNqacIEVHd3a
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMyBTYWx0ZWRfX4Gcjp2triqwE
 Iw2CZEaLV3yA47NJF5hUXCABH1Txz3XWzypP4Xi5VYmVzbyWNGgN+BBnuGTXoylbkI2YTqzTIXe
 VRk/PB38jsQekX34PSOsce5IGHOa7BOHBGjY53oDJb+0FpP6Dqai
X-Authority-Analysis: v=2.4 cv=ZIJCCn7b c=1 sm=1 tr=0 ts=6aec199c cx=c_pps
 a=ub9VQ7IHc6Y/4yCKmbqoEA==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22
 a=emhf11hzAAAA:8 a=t7CeM3EgAAAA:8 a=Q4-j1AaZAAAA:8 a=LVVdaqqDU9W9cF4QaU8A:9
 a=pILNOxqGKmIA:10 a=O8hF6Hzn-FEA:10 a=smb-oxieMVdZ4uYW:21 a=frz4AuCg-hUA:10
 a=_W_S_7VecoQA:10 a=HLUCug_QN4oeKp6PugZw:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: T4-POFEswOalxbKzhEAWisdoN30IJ5q1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050023
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY1PR11MB8031E1AADA730E95EDEB30FF96772BY1PR11MB8031namp_"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 05 Nov 2026 06:22:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249448

--_000_BY1PR11MB8031E1AADA730E95EDEB30FF96772BY1PR11MB8031namp_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Yoann,

Thanks for the review.

Commit message =97 agreed, I'll drop the upstream-code description and rewo=
rd as
integration/provenance (revised version below, if you'd like a v2). The .pa=
tch file keeps
the upstream author's message plus Upstream-Status: Backport [1c10bcc2e172]=
 / CVE: trailers,
matching our recent ffmpeg CVE patches.

Provenance/correctness: NVD/Red Hat/SentinelOne all identify librist_read()=
 in
libavformat/librist.c as the vulnerable function (ignores the caller size, =
copies full
payload_len, reachable via async:rist://). Upstream 1c10bcc2e172 changes ex=
actly that line;
it applies cleanly to 6.1.4.

Other maintained branches =97 the vulnerable librist_read() is identical fr=
om 6.1.4 through
8.0.x, and I confirmed none of the oe-core branches carry the fix yet: scar=
thgap 6.1.4,
styhead 7.0.2, walnascar 7.1.2, whinlatter 8.0, wrynose 8.0.3 =97 all affec=
ted by the same
one-liner (master is already on 9.0.2, post-fix). So merging scarthgap does=
n't leave a newer
branch exposed on our side =97 the newer streams are tracked separately and=
 will get the same
backport; happy to send those too if you'd prefer one series.

Testing =97 note the oe-core ffmpeg recipe has no librist PACKAGECONFIG, so=
 a default build
compiles ffmpeg without the RIST protocol and the vulnerable path isn't in =
the shipped
binary (same situation Red Hat describes). Verification is therefore build =
+ boot + runtime
sanity rather than a RIST repro =97 which is how the equivalent LTS backpor=
t was validated on
our side (clean build, target boots with no calltrace/coredump, runtime san=
ity pass).

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


--_000_BY1PR11MB8031E1AADA730E95EDEB30FF96772BY1PR11MB8031namp_
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
<div class=3D"elementToProof" style=3D"direction: ltr; font-family: Aptos, =
Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; fo=
nt-size: 12pt; color: rgb(0, 0, 0);">
Hi Yoann,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Thanks for the review.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Commit message =97 agreed, I'll drop the upstream-code description and rewo=
rd as</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
integration/provenance (revised version below, if you'd like a v2). The .pa=
tch file keeps</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
the upstream author's message plus Upstream-Status: Backport [1c10bcc2e172]=
 / CVE: trailers,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
matching our recent ffmpeg CVE patches.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Provenance/correctness: NVD/Red Hat/SentinelOne all identify librist_read()=
 in</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
libavformat/librist.c as the vulnerable function (ignores the caller size, =
copies full</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
payload_len, reachable via async:rist://). Upstream 1c10bcc2e172 changes ex=
actly that line;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
it applies cleanly to 6.1.4.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Other maintained branches =97 the vulnerable librist_read() is identical fr=
om 6.1.4 through</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
8.0.x, and I confirmed none of the oe-core branches carry the fix yet: scar=
thgap 6.1.4,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
styhead 7.0.2, walnascar 7.1.2, whinlatter 8.0, wrynose 8.0.3 =97 all affec=
ted by the same</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
one-liner (master is already on 9.0.2, post-fix). So merging scarthgap does=
n't leave a newer</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
branch exposed on our side =97 the newer streams are tracked separately and=
 will get the same</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
backport; happy to send those too if you'd prefer one series.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Testing =97 note the oe-core ffmpeg recipe has no librist PACKAGECONFIG, so=
 a default build</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
compiles ffmpeg without the RIST protocol and the vulnerable path isn't in =
the shipped</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
binary (same situation Red Hat describes). Verification is therefore build =
+ boot + runtime</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
sanity rather than a RIST repro =97 which is how the equivalent LTS backpor=
t was validated on</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
our side (clean build, target boots with no calltrace/coredump, runtime san=
ity pass).</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Abinivesh</div>
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
dacb717a25ab3db142ce390602" target=3D"_blank" id=3D"OWA3853a2ab-12c6-3e66-5=
12d-59fa86f83c08" class=3D"OWAAutoLink" rel=3D"noopener noreferrer" data-au=
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

--_000_BY1PR11MB8031E1AADA730E95EDEB30FF96772BY1PR11MB8031namp_--
