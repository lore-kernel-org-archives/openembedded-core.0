Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19315.1792664074355675891
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 03:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=G+n8XHkv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4755d889d0=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA2TTW3031465
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 03:14:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=8DA0rkg/t
	ESHU5pD6ObGJQj/V6AZkiVZ33k1QmuEfy4=; b=G+n8XHkvRcvFHYuQTyGUGKs8z
	DgXjT/dj49ImhUColwo9DdT7MbM1hy7C6XNx0/LXwcQQHxHqO7nY9JEmXeExjQ6f
	MeOMk0Gms4YEGImJ7xUND2gybt7YSYHPrcaPqSm++QXMJrxjcyRSNlUazhBPyvAN
	aZoL26luo4rMWgiQkr4j0TF9XMDB+pnYfzk9eJylgehwFtmdwIcSNXyRDmWdDz07
	eUc0bkqr7M1uApUFzbypLYFtIbKLTaFTFn74TV/e+IIOFFRErHA/ElHydQtkHTL7
	vphF+IcGUFjGYULifUk8a8rZvLd070rJiqOQyBelk4Y+JB0qHWwBThaN1Ngqw==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020112.outbound.protection.outlook.com [52.101.201.112])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hf9h10ffx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 03:14:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wTGBY6gRdDAfhV5uzPd8xz9ElIinR9zX97Usf0wnoHcD7DpYbsckA+hugK9GVm0n5GSqCxeGbD7t7dH0FKVme4Tl1/HhgdhqWaynrc+WFKpE5r0flbcjP5eeAae/C7QqLUbQBjSNn39a5Z5hJudSEltzdxpVWMvEXBa+4N6bIrIp7EpoKUo9dzSvi3ZhlX9FiNVXSA9JVMmnQijg7KC1UmVWI1/roTaCT57yVtFIxCshGLx/2hKb5SSNXn/3cNwVvFVFHVdEt1qacDEZ8J3BWy38i6CrXY5C4PzY7FHhNZszSDbhvfuLbWM4LBTXHibWiTHAgpV4nir5qvue0wdy8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8DA0rkg/tESHU5pD6ObGJQj/V6AZkiVZ33k1QmuEfy4=;
 b=Xuf7tp30IWXGY2Fceanh02H8dTccHlERHxNFcXnhoKLCD7+fOUFtNIG2MZFXpvnlCQTiTgoDtMrkFASX/uBT/71SW+/0SKp1FRX+AYo/UaCsW8SgHi+8DAA4jdQZJ3qAMXseVOpcp6MQHU+8IoXvrzDNWMnmA25I4oRBJuZYX3eUzF2CP+hwaFxHy0hRCev5Y9ALcZ2twoo/LJLuii7ougOqr7L7iysYEYyIpsMbfd2uhyaHzy1jjulZBu7nn59DQLz18Xc5EEO81Jsk+h06lmYFdjYNwakQQOOC80lGvOL94RVhetWJgp9Yx60BUPw1viKvAQsq2XZbnvWsZxHMHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 DS0PR11MB8762.namprd11.prod.outlook.com (2603:10b6:8:1a9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.14; Thu, 22 Oct 2026 10:14:27 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%4]) with mapi id 15.21.0546.016; Thu, 22 Oct 2026
 10:14:27 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.kokkonda@Windriver.com
Subject: [PATCH] rust: Upgrade 1.99.0 -> 1.99.1
Date: Thu, 22 Oct 2026 03:13:26 -0700
Message-ID: <20261022101356.2767453-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SJ0PR05CA0057.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::32) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|DS0PR11MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cc5ed89-e25d-450d-86bb-08df302540b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|6133799003|18002099003|29003799003|12006099003|10067099003|25016099003|261021121427099003|13003099007|261021135927099003|261021123027099003|11063799006|260925021311599003|260925021911599003|260925022911599003|261009223027099003|261009221227099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info: 8RC0Crxq4kiFD9AIPKJXPEjti3penosBo8B5sfQ7aWuHdrIBZc2E7PLUP3ZrcZS6YAL0esESTZSeEsbmMvY9uzFJCAyKgO+pB0fnfAqBW/VuOLLCJEFYt14WOpu47Jqsgn7WOhjx44mtpIS07cYYxkA2rGUAwouBMtX8ZFunzeCu2B825WQwFqn05RPUd3CFAAvEMXjIIj3FqsZY/yLzJyC0MT5XajYoKuU8Jj1LQoHPoEdd3f/x8ni6LWeQIEtm4K5s4kiAz4is+A5EZCMQFbWfJ6pvk+R3HIj9IeXac1lcdxX2jS9VmSD/YbSLsPGusIwgga5c6s8bidxGBJR1Li192by+oomEpJk4nCfqQ1N1lThpXOdNUiEmbx81PED4wxqE6vrVUQKk8j0AiSOEUIrdVjRcfiN43Cg3P/kLqRMJLKZVNi3EhpkC7Ok4iSv8FFbxoXKkyJqWj2xReg2nKZdQRM4YDrouf12ziJLItH7+esAOZ9L3vRDBqP7saJfK79RxffeXHsgZuKiYCbm91ePx0GLFoEoY60iqsWb05L0tn2PW93X8pDR/bAIbO2ZFsgQNF+janaeU2JMY9nYnwdLtJ1kkRqdiIw7zDLHvahV267Q0xzX1s9IkOZZJlF8ZqptU52Z0dX2xUV69iuyGHQlvLwjbYeyJunTM/VmwoeA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(6133799003)(18002099003)(29003799003)(12006099003)(10067099003)(25016099003)(261021121427099003)(13003099007)(261021135927099003)(261021123027099003)(11063799006)(260925021311599003)(260925021911599003)(260925022911599003)(261009223027099003)(261009221227099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTN5eGk0N2ZmUVhaU3FqRFZCWUNwcGpVd1RDT3BpNzFKQjU2ZklieFRjdDlM?=
 =?utf-8?B?STM2eFNtMzloL0wzQjJTUjhlMEpUdzFpbkdmdVdVQU9IbS9VZ1JIR04wS2pV?=
 =?utf-8?B?WTM2bjZIOHlUQnlCZHcwTURjWEQ5eDVib0JNOGZBcGg0NzhoNTZZYmxNN1k0?=
 =?utf-8?B?cEt6RnZMeWJ5TFNqQ3JCMks2RHlLOENFNWpOU1RzZGVTUi9jOVdlcHpzSHpT?=
 =?utf-8?B?SnJrQzZpUEUySmlvaDBHeEVqQklhd3lPUW1seUpZeWlFbFdGR3NPWFBOekpY?=
 =?utf-8?B?djN3K2NHczRoVWJZa28ySDBMa3QwTGlGSVh2QW1QZG1wZC8rTklaYld2V01o?=
 =?utf-8?B?ZU5rMVk0S0ZpRENvZGdxRFhiMllzVVlaVnhUODBIZWRGeXhPano5UkxLUTNG?=
 =?utf-8?B?bnhZaHZxYksxaWFKUlVYWmNWTlBSOVNHRG42Mk1EUURnRnJ1eHEzMUl0MkFv?=
 =?utf-8?B?TWFySFZyN0FXYzBxTHJreGxFUkhNRWV1S0ZsUjRyRGozY3VTUkpqcVpnakhn?=
 =?utf-8?B?b2dTeWk4K1RNdndvcC95WXJ6ZzM2N3R3aUhkU1M3d3JBL1phcWtESG5OV2xL?=
 =?utf-8?B?a2ZKWG4rSU82amxSemFPS0JlVHk0d2lCZVFSclVBRFpmeTJmWW1pVVZ0SERp?=
 =?utf-8?B?UFJHNE1ERHJtSkRSYVRZSHUzMUpwWGJBMHJidWEzcHVIUi95OG9SKzBXTGY1?=
 =?utf-8?B?TmMzajJ4Y3MyQzVGTmsrbDZlZU4vbXRaSnNQd01KNEpJZFV5bms1Q0hid0ZH?=
 =?utf-8?B?dUZyQTIyd2kxTlFFblJuN3loZ0VtS1h2aTdGWXNrclA5MG1JWjE2ZFRlaloy?=
 =?utf-8?B?U0duTWIvZUYrTmVzc0J0QkFrdTd1eE02c3RIVjFtQXFKeklvZUY1VUVPZmRm?=
 =?utf-8?B?T2tXV0FWY0xCTkIzU2ZWU2FGd3lpQ000ZEtoNUhWbnFSR0F5YUJFQkpWaTU3?=
 =?utf-8?B?dWFZNk0ySnJiMW1SY0ZMZnBOSmpwVTNSdk16WVdMazZmL1JVNXpEN21ocDB5?=
 =?utf-8?B?STVqRC8wK1NZMFpVRWNOQys1UjlFYnYyUlVzaksyeDlKZTJoQ0V6cW5CTXFw?=
 =?utf-8?B?UnppLzhqTHkwMHljYjJvcnVWTEdSaTg1dXYzMlRYVGdnci9UY2ZYUXozb0c4?=
 =?utf-8?B?TW5yU0ZPVlB3dzBZWkZ4blplL3Y4SXNoV3lkUnoxSnpkeGFSeE5tUFRNbWEr?=
 =?utf-8?B?YU82N1JRVDVpN2J2Y3RFVDBUQ3E5UTVJVFB0SG14eXJweW9WSmI1YmZrRUF2?=
 =?utf-8?B?QmpzTXFCd2luS29Zb0x2N0g4dG9iWlZWUURnamxEZ0RQZThLeExZYTM2dmtZ?=
 =?utf-8?B?MitIMnFmd2VoQ240ZWNFeHJJNnRKTmNNa1BmcnNLZTUycmZCNXExaW85Sm1w?=
 =?utf-8?B?R0FMWFNBblM4bDBYTTU5VFVQZHZ0RFI3RTFJeDRNK2QzcnpCV2dRUlVNNVBR?=
 =?utf-8?B?dDBGdW1hK2haZTUwVHZzV3MwekJBcnBENE8xR2tCWjBlcWg2N1JVRnQwUWda?=
 =?utf-8?B?dFBVb0YzeWJLQ2U4aWoxcGs5ZmV1b0d5SEZRcHFhcUNieFhGVjkwZUZkQmlo?=
 =?utf-8?B?ZTl5VVlwOXd3aDliV01xd3dSMUEwNDNmbUd6SDJ4MHZET1A5bHhjVzdWL3BZ?=
 =?utf-8?B?ZHBNc3laY0ZFSTZXS0ZvTFBndmVUaFkvRlRiblJObjBKTDk4NTRKOVdzTEth?=
 =?utf-8?B?OHFMUjBVUytIUFpzSWtRUHdyVmVEQ2NyLzQ2VjNIQlJjdzFLZE1ROE5DZjVW?=
 =?utf-8?B?Smt1V3hTL3REMGZWM1EvTk1nSkZzeVRNOUZ5SCtMYWtCNSt6R2RQY2VXM3ph?=
 =?utf-8?B?RnBXNVl2UW83R0lKM0FKS3NEb3pPWEJxTGt3V0Z5UE5XVnJ3OXJEb0d2blVO?=
 =?utf-8?B?Qkt2L1p2dUZKRWVQYXBWd2plbzhmQ1BYdFFMQmRGTUl6MStwRUlqK3dGM1p3?=
 =?utf-8?B?Y2E0ZWUrTWZ4bjlJRWdvVEtaMXJVejAyYkxPVUxOS0FuSzREbHNMTW1LV0lC?=
 =?utf-8?B?UE54U3RoVVlKS2hjeEZSdktPSnA1M3JxSW5VZTFEdWtZaVRmRHRYM3N2cVFl?=
 =?utf-8?B?VHN6Zm1BcU9rQjYvdTRGbmVyRUg0OHhGTGtYWTRQVE1uREZvamdISTg1SXQ4?=
 =?utf-8?B?WFF5UFo2NEh2cS9vUUZCS2pHdnNvMUExQWJsbktnWmR3c3V1QWJFc09XRWpn?=
 =?utf-8?B?RVZVNy9kN0NmOTY0aDBKWW5NZllYRXVnNlhLYXVQczIvV0ZoMGlCbEpVS1pQ?=
 =?utf-8?B?bzZDajg4OTFDWHVRazYrU0dvWmc2b2lhd281bjhrRSsveWlsS0RhcXlJQk8w?=
 =?utf-8?B?eDdCS2pBVDlwZW5QOFN5R25USldOSGZxS1RJUU54aXdQVUJGNW45ZHBRczFN?=
 =?utf-8?Q?sL9cdmec8SeFlVZs=3D?=
X-Exchange-RoutingPolicyChecked: IZU6TW9ITpj4S5KZD/+MmjrdpJ6Z42gVJ5cLbJFbPUn0dsczKmeproDgm6ShouVN+Y29rohrmJgMN4kXtgUyg41n5385ewldi3xDnztL1d5swK/vgtUz7FiG9VXVvw17xHLTdPqgSBgN1ZiS9jGgmhsJYDw2g0FoXam+UD0CpDBRMiCZZvgecLRXcBz1NRsSKPm5vnwzdmFLN7sQ/Rli7xlOK4JS1FSJ9ZzmRzp51Yij2j3lBz4eJhTU8T+2CRlwkAEPISysVV36BLmYfflkCqgG4+VIjYg/5jWtwPlQD7otzmh3/wLCR2ZNptibmGd6iS+Kaw81wgUEBLCNRKioQg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cc5ed89-e25d-450d-86bb-08df302540b7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 10:14:26.8722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMrFIT6MDOl/2M4iagHo3bsY8R5iPRgE8/5UUY+ltzafq0lse3PUq4bbwJW/Je3MgUaZc0UjMtf4MctCHCtKpzxrNHQxVIHNRZqQXqqOypA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8762
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX9HX2X/8RgKGo
 mpYeDr+Pb3+N4Cw+6bRi0xwn10bb5xFmH/7TwJFG7cQj2iKXNRaW1SFg2mw9GDk4QKdqT3UlQKp
 EeVEuHb5d2pqISL6yvtu9Gs29e/h783QtnIHaEu6H4cQa5y+CQnupiWf4UU0qUY6LII3BpsmiRL
 rrXis4+ogwmrOmmQO30/waD+1O/rTgPLX5Ii3T52WwZARBDTiVWPWWhf000PWKITRpx7m2m5ZZq
 NHVSI4xT15MT6LKbzeOVu+I71FwkpJcGxEWoEsFVzkpoNmjc6hpxAtyAnKkhEj+9s8GKAyWC4GT
 irsR6SbwfGIewZYLWcr3PeIPsEXXPnm4UBBIlENxMSPhi67tJWRjQ5WFGMkdB+0d/Oc0YchXexs
 KpL2dEN2+CegJPbnMDi4v/X+ujiBNYl0jVfUsa/JTqsHfDnLTiEGI5t3fp4tMPGryn7YQD1SEVH
 4owBcU3eT7lS9WTkCYg==
X-Authority-Analysis: v=2.4 cv=Eu9HPicA c=1 sm=1 tr=0 ts=6ad9e209 cx=c_pps
 a=cE3fiHRxMl4nLvvI2vbFbA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=j57RdskLAAAA:20 a=NEAV23lmAAAA:8 a=ei4SEBeUAAAA:8 a=pGLkceISAAAA:8
 a=t7CeM3EgAAAA:8 a=7CQSdrXTAAAA:8 a=iGHA9ds3AAAA:8 a=8wEic9LhAAAA:8
 a=ag1SF4gXAAAA:8 a=8plyqBuu9IHIfQZjyxQA:9 a=SA8_6jbxZzkJETxq:21
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=M9VCcFR7d36vLOFuqMn8:22 a=Yupwre4RP9_Eg_Bd0iYG:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: zOx79XdFXVyR4z23rTu02CgKoeTle5Ys
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MCBTYWx0ZWRfX60TDNX+tOnge
 HlXrHLiclzTL8tfqXwqMxGVT7xniALCkWtxgT0sNw02AKpqEvuDjBEjB0qQvtPHlSsQd67Q9k3H
 3uyFnHkQuhXG4cCdXH+tQDmA5W8ic4qnlARgUT4Ojd4YxlZJ7MZm
X-Proofpoint-ORIG-GUID: zOx79XdFXVyR4z23rTu02CgKoeTle5Ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220040
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 69MA2TTW3031465
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 10:14:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248436

From: Sowmya Sathram <sowmyasathram12@gmail.com>

https://github.com/rust-lang/rust/releases/tag/1.99.1

Rust 1.99.1 fixes the following issues:
- Fixes missing wcslen symbol on UEFI and embedded targets.
- Fixes miscompilation of FFI bool return values on x86_64.
- Fixes rust-lld library loading on macOS by adding an rpath for libLLVM.

Drop merged patches:
0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch

Test results:

rust v1.99.1
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  23691  |  1022   |
| qemux86     |  23428  |  1285   |
| qemuarm     |  23408  |  1305   |
| qemuarm64   |  23522  |  1191   |
| qemuriscv64 |  23464  |  1249   |
+-------------+---------+---------+

Test results difference (1.99.1 - 1.99.0):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |   +1   |    0    |
| qemux86     |   +1   |    0    |
| qemuarm64   |   +1   |    0    |
| qemuarm     |   +1   |    0    |
| qemuriscv64 |   +1   |    0    |
+-------------+--------+---------+

Signed-off-by: Sowmya Sathram <sowmyasathram12@gmail.com>
Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 +-
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.99.0.bb =3D> cargo_1.99.1.bb} |  0
 ...host-triple-from-unit-metadata-hash.patch} |  0
 ...ygiene-encoding-order-deterministic.patch} |  0
 ...llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch | 38 -------------------
 ...ibstd-rs_1.99.0.bb =3D> libstd-rs_1.99.1.bb} |  0
 ....99.0.bb =3D> rust-cross-canadian_1.99.1.bb} |  0
 meta/recipes-devtools/rust/rust-source.inc    |  7 ++--
 ...source_1.99.0.bb =3D> rust-source_1.99.1.bb} |  0
 .../rust/{rust_1.99.0.bb =3D> rust_1.99.1.bb}   |  0
 11 files changed, 5 insertions(+), 44 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.99.0.bb =3D> cargo_1.99.1.bb}=
 (100%)
 rename meta/recipes-devtools/rust/files/{0007-cargo-omit-host-triple-fro=
m-unit-metadata-hash.patch =3D> 0004-cargo-omit-host-triple-from-unit-met=
adata-hash.patch} (100%)
 rename meta/recipes-devtools/rust/files/{0009-rustc-span-make-hygiene-en=
coding-order-deterministic.patch =3D> 0005-rustc-span-make-hygiene-encodi=
ng-order-deterministic.patch} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0005-rustc_codegen_l=
lvm-Do-not-pass-amx-tf32-to-LLVM-23.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.99.0.bb =3D> libstd-rs_1.=
99.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.99.0.bb =3D> ru=
st-cross-canadian_1.99.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-source_1.99.0.bb =3D> rust-sourc=
e_1.99.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.99.0.bb =3D> rust_1.99.1.bb} (=
100%)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/=
include/maintainers.inc
index 4446732e9f..5fe4c2b97f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -784,7 +784,7 @@ RECIPE_MAINTAINER:pn-ruby =3D "Ross Burton <ross.burt=
on@arm.com>"
 RECIPE_MAINTAINER:pn-run-postinsts =3D "Ross Burton <ross.burton@arm.com=
>"
 RECIPE_MAINTAINER:pn-rust =3D "Randy MacLeod <Randy.MacLeod@windriver.co=
m>"
 RECIPE_MAINTAINER:pn-rust-cross-canadian-${TRANSLATED_TARGET_ARCH} =3D "=
Randy MacLeod <Randy.MacLeod@windriver.com>"
-RECIPE_MAINTAINER:pn-rust-source-1.99.0 =3D "Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>"
+RECIPE_MAINTAINER:pn-rust-source-1.99.1 =3D "Deepesh Varatharajan <Deepe=
sh.Varatharajan@windriver.com>"
 RECIPE_MAINTAINER:pn-rxvt-unicode =3D "Unassigned <unassigned@yoctoproje=
ct.org>"
 RECIPE_MAINTAINER:pn-sassc =3D "Simone Wei=C3=9F <simone.p.weiss@posteo.=
com>"
 RECIPE_MAINTAINER:pn-sato-icon-theme =3D "Richard Purdie <richard.purdie=
@linuxfoundation.org>"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
index a52d5f19d8..6632f8ff97 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??=3D "gettext"
 GCCVERSION ?=3D "16.%"
 SDKGCCVERSION ?=3D "${GCCVERSION}"
 GLIBCVERSION ?=3D "2.44%"
-RUSTVERSION ?=3D "1.99.0%"
+RUSTVERSION ?=3D "1.99.1%"
=20
 PREFERRED_VERSION_gcc ?=3D "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?=3D "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.99.0.bb b/meta/recipes-de=
vtools/rust/cargo_1.99.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.99.0.bb
rename to meta/recipes-devtools/rust/cargo_1.99.1.bb
diff --git a/meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple=
-from-unit-metadata-hash.patch b/meta/recipes-devtools/rust/files/0004-ca=
rgo-omit-host-triple-from-unit-metadata-hash.patch
similarity index 100%
rename from meta/recipes-devtools/rust/files/0007-cargo-omit-host-triple-=
from-unit-metadata-hash.patch
rename to meta/recipes-devtools/rust/files/0004-cargo-omit-host-triple-fr=
om-unit-metadata-hash.patch
diff --git a/meta/recipes-devtools/rust/files/0009-rustc-span-make-hygien=
e-encoding-order-deterministic.patch b/meta/recipes-devtools/rust/files/0=
005-rustc-span-make-hygiene-encoding-order-deterministic.patch
similarity index 100%
rename from meta/recipes-devtools/rust/files/0009-rustc-span-make-hygiene=
-encoding-order-deterministic.patch
rename to meta/recipes-devtools/rust/files/0005-rustc-span-make-hygiene-e=
ncoding-order-deterministic.patch
diff --git a/meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-=
not-pass-amx-tf32-to-LLVM-23.patch b/meta/recipes-devtools/rust/files/000=
5-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-23.patch
deleted file mode 100644
index 99fcd334c7..0000000000
--- a/meta/recipes-devtools/rust/files/0005-rustc_codegen_llvm-Do-not-pas=
s-amx-tf32-to-LLVM-23.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From: Sunil Dora <sunilkumar.dora@windriver.com>
-Date: Wed, 26 Aug 2026 16:30:00 +0530
-Subject: [PATCH] rustc_codegen_llvm: do not pass amx-tf32 to LLVM 23
-
-LLVM 23 removed the x86 amx-tf32 subtarget feature
-(https://github.com/llvm/llvm-project/pull/207673). rust 1.98 still
-lists it in the x86 table in rustc_target, so a rustc built against
-LLVM 23 aborts at startup with
-
-  '+amx-tf32' is not a recognized feature for this target
-
-Skip the feature in to_llvm_features when the LLVM in use is 23 or
-newer, in the same style the surrounding code already uses for
-avx10.1/avx10.2 on older LLVM majors. amx-tf32 is the only x86
-feature LLVM 23 removed; the rest of the table still matches X86.td.
-
-rust dropped the feature outright after 1.98
-(https://github.com/rust-lang/rust/pull/159310), which requires
-LLVM 23 or newer unconditionally. This recipe builds against whatever
-LLVM major the layer provides, so the version guard is kept instead.
-
-Upstream-Status: Inappropriate [rust dropped the feature after 1.98 via =
https://github.com/rust-lang/rust/pull/159310; this guard only exists to =
build 1.98 against more than one LLVM major]
-Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
----
- compiler/rustc_codegen_llvm/src/llvm_util.rs | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/compiler/rustc_codegen_llvm/src/llvm_util.rs
-+++ b/compiler/rustc_codegen_llvm/src/llvm_util.rs
-@@ -286,6 +286,8 @@
-                     s,
-                     smallvec![TargetFeatureFoldStrength::EnableOnly("ev=
ex512")],
-                 )),
-+                // AMX-TF32 was removed from LLVM 23
-+                "amx-tf32" if major >=3D 23 =3D> None,
-                 "avx10.1" if major < 22 =3D> Some(LLVMFeature::new("avx=
10.1-512")),
-                 "avx10.2" if major < 22 =3D> Some(LLVMFeature::new("avx=
10.2-512")),
-                 "apxf" =3D> Some(LLVMFeature::with_dependencies(
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.99.0.bb b/meta/recipe=
s-devtools/rust/libstd-rs_1.99.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.99.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.99.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.99.0.bb b/m=
eta/recipes-devtools/rust/rust-cross-canadian_1.99.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.99.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.99.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-de=
vtools/rust/rust-source.inc
index d9c00e94a2..b384a0c76e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,11 +6,10 @@ SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-$=
{RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-=
rust.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.pat=
ch;patchdir=3D${RUSTSRC} \
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing=
.patch;patchdir=3D${RUSTSRC} \
-            file://0005-rustc_codegen_llvm-Do-not-pass-amx-tf32-to-LLVM-=
23.patch;patchdir=3D${RUSTSRC} \
-            file://0007-cargo-omit-host-triple-from-unit-metadata-hash.p=
atch;patchdir=3D${RUSTSRC} \
-            file://0009-rustc-span-make-hygiene-encoding-order-determini=
stic.patch;patchdir=3D${RUSTSRC} \
+            file://0004-cargo-omit-host-triple-from-unit-metadata-hash.p=
atch;patchdir=3D${RUSTSRC} \
+            file://0005-rustc-span-make-hygiene-encoding-order-determini=
stic.patch;patchdir=3D${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] =3D "cc41916a8c84f5d9ec4f55561b44e39f43b647b133f=
8a6f51be9ea13c83f7036"
+SRC_URI[rust.sha256sum] =3D "6451598a99e77f07571960f6b21d577399d3a30f33e=
80cbd2e3a4aae6535d265"
=20
 # Point UNPACKDIR into the work-shared location so rust-source.bb and al=
l
 # consumers (via S/RUSTSRC) reference a single shared source tree.
diff --git a/meta/recipes-devtools/rust/rust-source_1.99.0.bb b/meta/reci=
pes-devtools/rust/rust-source_1.99.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-source_1.99.0.bb
rename to meta/recipes-devtools/rust/rust-source_1.99.1.bb
diff --git a/meta/recipes-devtools/rust/rust_1.99.0.bb b/meta/recipes-dev=
tools/rust/rust_1.99.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.99.0.bb
rename to meta/recipes-devtools/rust/rust_1.99.1.bb
--=20
2.49.0

