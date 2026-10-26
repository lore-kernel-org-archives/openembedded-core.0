Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40391.1793013542516139046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 04:19:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Nd9etV6l;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=47592be453=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAuPV2478302
	for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 04:19:02 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=H6vAXzUFyuyPUK2DFLAm63yqcBu5Vm/Kaf0CJ1eyJ9A=; b=
	Nd9etV6ll+BvqCNsH49IZKNIK7hblMYNtpf0/9xUOmvbPj63dINg00ItVo0olKUf
	bhtjaIsisntpgVqaWrNLlFO4Vt0Pu18LhggBx2JRDptyHoSoP0JJc+a56ff2ePwg
	WC1f5t5cyuYWebo1GUH7UrkaNm0QCmvLAvZlIbvtSv1de1qoXtgqG30x2y7lkkh7
	9bi04exqWMMhKnljGunHEEk08S70cfthSzKHqy/SmI4Yl7p4foZ3V7eBtmljPLIl
	LEMQ2mtG+8tgDEVgrtzI/Trr4x19w+kMtPEowuJb4cgonWHZlV+79fWU/huTTnAE
	XtVl9r9Qgb7ZDKdHeD/UCA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11021075.outbound.protection.outlook.com [40.107.208.75])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hgv6h1u74-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 26 Oct 2026 04:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlH6L4nw2pOgSx1mzsies3+1E3IzY1QRqmmv7za5xsl19r3wxx7Q6XL80InPhibTqFe8SPza9ml34n2Su0RSnYzs+nVIhGMI4OJhOAGahDDpGm6kCY4vsbro9w2xiopev8guKqQ0f/fbe1LKLj6u8Yz2FR1T+9zB3mIMOUpcWpL4bGIOiHStuZWtHmqj3u+a+dXdULjOdj1z3HqUkodE1l7/+j1vu9uYdncs7qWLTvzcA5TuQRvWTodeLWNVPqzjSSOt0zZELkwr1W8oevp0g07XCQ7KPxG88OwGjGbuaDQNkBLWEptcHWUVxzCjhUDTEjnUouTGyRHo435wTvPosg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H6vAXzUFyuyPUK2DFLAm63yqcBu5Vm/Kaf0CJ1eyJ9A=;
 b=EtPT+aSQYS3K3krYInislr0jXP8pHR3qH587bIK2phnfLftQ3VnjNfamMCfMS1g52CH7c77j0stjge/Yvt2CK+JmxqZkrz9Dt223NlppELK3kAsVqfVG044evfvwlDGYZuJV0nsYnkdjIPhb7foLiQWfr0NrCQROUMzF0KlzkzN4hSXmFYYwkaOgwjdxIcb4TU/aGbv0+Tuqiyw6VMHKT3nM2yZNwA8BYs67wg3czYj0XQvF+cFodlfqspAbeoITTNWSkRBcpS7G0HOXQMn/QPh7awM1JY+XWW2FrYqxM8jYBJaEjbDKFe3prJWNqEVryTeObqeJZfMthnkpW1Ikjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from CH3SPRMB0031.namprd11.prod.outlook.com (2603:10b6:610:14d::10)
 by IA3PR11MB9352.namprd11.prod.outlook.com (2603:10b6:208:575::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 11:19:00 +0000
Received: from CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df]) by CH3SPRMB0031.namprd11.prod.outlook.com
 ([fe80::edd3:84b0:a509:60df%6]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 11:18:59 +0000
Message-ID: <bccfc3ac-8073-416f-9f78-18854c0c6aea@windriver.com>
Date: Mon, 26 Oct 2026 16:48:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] rust: Squash rust-cross-canadian.inc into the
 recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
References: <20261012101812.1485365-1-Deepesh.Varatharajan@windriver.com>
 <4232634fb1f980a47b824214413690f1e98b3295.camel@linuxfoundation.org>
Content-Language: en-US
From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
In-Reply-To: <4232634fb1f980a47b824214413690f1e98b3295.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4P287CA0103.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::9) To CH3SPRMB0031.namprd11.prod.outlook.com
 (2603:10b6:610:14d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3SPRMB0031:EE_|IA3PR11MB9352:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ed32fe1-fdb8-4abc-497e-08df3352eeb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261022105027099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: t8HCtshasjWH4Pyra2998qTOfPRzjtQOrwhSxj9eygSiGnqzLwQ76dL1N16NVVrFYOsqeWq/Awkb7vGC4Sfbd+rgtP0i749FwP9Qrm39ZWLFfQdz4Zyvf+SIUCKMa6xIJf1h238tflxjBohD/PTHhTzFsh0tGwt9ANw8Jh5jgNXZVy9BZyxhkBsJ+08qclbh2sitrWEnW8p3bG8WHXU2NOcLrtsHoy7lD7BgtIPJK/jcKol2OThnGPzNIPB5CgaXo58nZ8KGtnkb/h99WIhDQq7eB4bcPE4teHRHDR2JpeumDKSjWiG8RtL4RWOEBoFUdT1ZDCvm34K1Gjm19NeycIuDlU4LVxh0UBeA5JPqK/nvutHpI+CZz+p64xkgjPf8e0aOyb8EH5XEL331H1T3tonJRXJc0TIvop66m0xfDG60covSNRQ/pH1uHe2nAqTaC7hb+0yT72KpV1F0mTJqjtqzLx8jpHpQMEuc24+GAJB/k99XIS39Aw2W124uFP9y3ix6uZQDcaszySHQz9fmEBbfizdZXXl3LP4y6cKpWSHGZjxeyJH8ZFZjHn/nl0iSrpNovqYACow0R1oJnzGb2Gsd034LzCpHApWylp4riyZ73dFiIJihvabKN0EMqzSECyAj3K7Lj/5CC9bYvKDjM5SQiXqyZgSVh1/0aX27X9w=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3SPRMB0031.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261022105027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXBDRFZjTGtINm5qSFhEd0E0cnFYaDA4dXRVc2tyR1ovZkFzSzA2ZVRKQS9h?=
 =?utf-8?B?Uy9TUmJWNkN0WFB3YVkrMEpJSkJGblBJeWNoWVQ2ZURqVkpWU2trdklRZVdM?=
 =?utf-8?B?M0pyR3JCRmNiUWpYb09XbUlxcUl6UHBiRWxkcktMYWp2alE1bDhpYnk4K0lZ?=
 =?utf-8?B?b1VMUjAxUWlyZjhqVUVFbzNDTVd0WExpYzZVUE5WWDAzWXcxbjZWcE1UM0Vn?=
 =?utf-8?B?WFY2Kyt2VkVERUw4blRNaTlReTVSWTE4OTNqSzFGcmYzdUNlQlRpa0dxYUh4?=
 =?utf-8?B?cVpTaEF2enl6SWJEeG83S2FSTExBTWxvc0JrdEp2NW53aVZoVkdmWFlLbzNK?=
 =?utf-8?B?dnd4MDZvQnNac3BCUHdJbVQxeTZONFV2dUpncXA2eU0xMHNycFUzeWxha3NE?=
 =?utf-8?B?aFhkTnppKytlMFZySFM1NHBJam8yQ09LZjVIazdBN3NjdkJoSnlPZFF1cDAr?=
 =?utf-8?B?Qm03d2VMdG11UG1BTk5Nb0d6ZHBVTXgrUUpRL2cwWm5NSVF2UXY2WmlONHls?=
 =?utf-8?B?clRyNUl2RndlSmNIN1hUNjNieVlYT2ZEOWZ4UWlBUDdPNStoa3F2WWh0MjFW?=
 =?utf-8?B?WjZocUJONEhiUFU1YW9lVVFBL0VXQnBLVlEvYTZpbTJoK1FzVFUzUEdoZnox?=
 =?utf-8?B?RUUreGd6d1Y4VDdZMUc3U01NRS9zYjArSys5aEoySXZBdXBvb0IwOVdoSzl5?=
 =?utf-8?B?NnI2WnNOTitEUFpBa2k2Q1JVam5sbHlPQlZIR3BDNzBYckp3aDRjWHhDTWg0?=
 =?utf-8?B?dGxMbHdBTEFROS9NTFlwdkNmNHQ3WjY0SnV6ZUVFdjdwRnoxcnRmMkpYeXNQ?=
 =?utf-8?B?VHZya2lRWGQrMGR5TzV4bHdLNWhDQnlJSjN4WXlGczBWRyt0WEYvT1NqT2Vj?=
 =?utf-8?B?cVRNRzlHTStiRC9YczJ3cVhmYlY5Y2lDc2JJRmdvNWljNjNnQytuamZGL3ZS?=
 =?utf-8?B?S3FzeHRhaFMxSXp2dVdWaUZpYXFhek4rVUx3ZHBhVkFCYjJNY0N6RXBjUjhU?=
 =?utf-8?B?TkdBM0RMZkY4OWNYM3hiMnA4L29WbWRlYkxMS3VuNnJNT1JwQlRJcDYxMUM2?=
 =?utf-8?B?aXRXZ0NlNGR3ZndzTU1NTFlJVDZXQlQwQ2xacjVhV0poWlgrNldkRUhNbnRL?=
 =?utf-8?B?SUorY0FLR3F5czdYMEM0Qmg2M2pWRFI4bWtPY3ZCMW9pU1JrY0s0UWJSL1Mw?=
 =?utf-8?B?bDJFM3crdXBLOXl0TnBpY1BUNVFKV0Rsb2lzTGVxdm1jZ0FlZ1JhS0FkSFoz?=
 =?utf-8?B?UGNvSG5iSldhTWpLaVFLV0MydXkwSHV3UU5kdDZhVWxwMXV4NzVrWjhFYmVB?=
 =?utf-8?B?QzBHUFlXN0lHM1RjUHVLeGcvZVVGKzdLMENHVXJ6dEtDQzBCOTV3VzZPK3Rr?=
 =?utf-8?B?SzY1c1ptTXZieHdQc3RHTHlxRWh1a2NVRXUxQ04xYU1DUnFQQi9nZnNURWdM?=
 =?utf-8?B?ZjZqeXl2RFVUUUV6dnh4YWUrUldSVHVXUE1ydzNuaFoxS2dHMk9UWmEvVlB0?=
 =?utf-8?B?Y2lia2wvQlNCWXM3SEt2SThJNk5oc0gxaTc2S3NSNTh4TEFBUzhjRG8zbjdt?=
 =?utf-8?B?Rk1BSS9CcHRVYmgvM0tLM28ydUw5aWNUTWNNRWJYbWkrMzNNM0laY0JHZUFx?=
 =?utf-8?B?Nzk0c2RUNENTOEdTcWtBZmJtYThwR3IxYmRwTmtKQzhIV3lBWTVhN1JxcG9Y?=
 =?utf-8?B?RUdZL3hFVmVRMzFlOXZqd2NzbUpRdzN2cTFPNWswblp6MGpzSVR6VkdseGsr?=
 =?utf-8?B?UHNUTG16cE9xZlhsT0NrRUFtUURMVWs4d1BlbDVsV2pOSlVwWUVXQURXMWlG?=
 =?utf-8?B?M3oyaFhKWTZ1Yll0SG5WeHJiMnRtS2hUckdZRUpJRUNGbnF3ZjlDT2FReXhy?=
 =?utf-8?B?Z0NOclg4bVNPU2puRFJKRzhEWHArbTIwRnZJcWZFa3BVLzhpS3draGZMaFYr?=
 =?utf-8?B?KzJpQ3FCQ1RQVDFZRUozcU5WeGdVbWZHWkU2YTFIOUJmQm5rZHU4MkVUTXpz?=
 =?utf-8?B?S25KbnpSM0hWa2tYYUh3dFhSK0JQcStqVFlQQ20zOFAzNGtPSnVXUXc5VVJC?=
 =?utf-8?B?NFlZZDYzTGpRaGoyRVZiVEhlUDlxek9IS2ZTTVhOck5qTlYrZHhoMUpZcm1r?=
 =?utf-8?B?MC9MdHhEcUpzalVqU0FsMytGSTF4YTR0T3NKRW1rZlMrV25DaE5aTGFSNXlW?=
 =?utf-8?B?ZG9RQ3hING9rQWdIWUhBdnBXblVoUmZCd1ZGQTVDcjc5SlJDOGh4ZHRMczFI?=
 =?utf-8?B?c1QwOUtwNStIWUJ1amZaenVVMStXVWxscTVyQ1ZPN2NmVWJxNHR1QXFLeVZQ?=
 =?utf-8?B?MTFVNmtDRC9RcWhnS1NRWjNyN1BUZlZjd3FPZ1JNV243ZGlLa0dVRVh5bmQ3?=
 =?utf-8?Q?tC5r456kWnWbEDAWGB61K+dyIde/ii/oUfSeR?=
X-Exchange-RoutingPolicyChecked: UkjBDU/YkTXHAmCifStXAQ2VenMvNXdZl3Mp52tJMckiCYupfd9APGm6OSWxEXq1+JjNCxCjoKQEcaV/1EGmSus+lF2tNPbEhlhWOcbtslWl88WUxU/S9uQ/5yqr1b3qD2Y5Qv9VcyqszhwAOOrG1qyGrNv5uEDVUPbVKmviUImBLGgJLOdySnCHA2GNCSGWLfxYJgBDXVheYR9PbR2DNrIoNvoz134ubH+J7OWNkcW58P7HJeFw9jnkIEFZ+z/ypTa5PuG2j1GK1k29GlbX2Lr02KOtwDVIJdv08hWxm9XfOhY7z8rcExNp4dxfyNFLFOAqk9voDvifcLFde5VTPQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed32fe1-fdb8-4abc-497e-08df3352eeb6
X-MS-Exchange-CrossTenant-AuthSource: CH3SPRMB0031.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 11:18:59.6620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q18qbi9glvByNxqSMJPKMGfqXGmdvyagECtCu/sFC66/yj6PamLRere7gaWA2ia+d5bQhCtngJLWf2lj+nNHuZM93NwW7CgiOYUwzi10If6hLXsmzBUARorq/ufUrfxf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9352
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX2nBAi+qr+2GX
 tFkIvwtf/sDRaIZEsYcQLkJ2Sn3LoretNUC8UqkJuF51eskHICH7N0kuid7K2HERkJF3MHamRPo
 93Tsc8EByZVIsSAZviqO2IFxQVzfzkEb0BRyp2RiJe198GMA2YcD
X-Authority-Analysis: v=2.4 cv=B8csQ+tM c=1 sm=1 tr=0 ts=6adf3725 cx=c_pps
 a=U1orgQYA1CaLzNz9vAc2rg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=FoG72jY6fhBoNz1k2koA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: K0L0sZMkqgxd4h9OvHBtx3bBz2GomuZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0NCBTYWx0ZWRfX1eOoMgldrHje
 MzvPnRP4oFRWPadZkGoSTUQOGrKcpokH/OhxA3UD89uuUn2YZBHoLWFYv8mKrBfAOaxd/Ady5BG
 /d1YHMCW2bdUO2XiHj0/ftRcDq5vEkAe0imLa+v6r/Z1JI1rDSGOXmdelU7JAqmb66xbBUKoWxv
 VE3muUeZ8GGCvF2Z+hy+PcMlymIbA4w2ZnFt93LEaK/hqa0GwG4uzK6/Pji7UWKI7QgKe25YTOU
 5gvUW9BiPVCEZkUGaN8fhzozYDAPRwF8aEBSv4jtkDlTC/TZ084g3w+VsGoVV49jtpoAIAvqjcp
 RqXMMzPCvf/NUL7FGTfe/4EZuR4Ce/jop+P4M9xjbJWPRoxIqdvhHaF4AxRHiSJQR096xrSEd6Q
 FfijCL84H13LQx2zJ6LT4Q18JziML8T0EPtKyFAM2PogQDwwk8t/gmYzt8lCdXo9mqbEogr6xyp
 TmmnQ3Kd6P3hi75eRsA==
X-Proofpoint-ORIG-GUID: pdKkbDbiDa0AAi3KOEgiTKTNoEQTp2Rs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260044
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 11:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248674


On 19-10-2026 20:02, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Mon, 2026-10-12 at 03:18 -0700, Varatharajan, Deepesh via lists.openembedded.org wrote:
>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>
>> It was only used by rust-cross-canadian recipe.
>>
>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>> ---
>>   .../rust/rust-cross-canadian.inc              | 72 ------------------
>>   .../rust/rust-cross-canadian_1.99.0.bb        | 73 ++++++++++++++++++-
>>   2 files changed, 72 insertions(+), 73 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/rust/rust-cross-canadian.inc
>>
> Whilst in general we have been cleaning up .inc files where there is no
> need, I think these ones (and the ones in gcc) do serve a purpose since
> they allow multiple recipe versions more easily. I therefore think
> these should stay as they are...
Sure, Richard.

Regards,
Deepesh
>
> Cheers,
>
> Richard
