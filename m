Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AB1DC3064D
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 06:59:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2231.1719471583357581547
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jun 2024 23:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=69087085fa=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45R61EIo007528
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:59:42 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ywnk5vpch-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:59:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEXdnGUEd3vV/2HJzUNMiAsEjyJmM6sdiJuohnXjUx6VSFQenV+ko2R2R2AU6XVpGG5KHlyMKT4M513zNS6grQMNECmWFsVSvs2FoyRk26L+PI3MWVYDanGQz9NrMYeZQ5RUwR6jsglFGIm5JeWTToTj3sw3m5Urk8Ea+8VYdowkTYyrG45r3qL5aa3yg8efC8hzHEatdqF/SoOcBSWiZJa6heH1/xdWTJqCVT1DC4ev/o1K6+U/Ps5cKdw/dsJ7S4lz7nS8ngMLEuITpKq739yZxvaP4W3weMe7S0qTUirXnMb+7tSPTz5vrSx8lcoBbPxYCfp0qvwpVCV98Qo/5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rRmgZrBLEKZG1OSHN7VVcJBslMDkJXCTBk+lvbv7PfY=;
 b=B37SuUEQX23Y+rEyn+zds4DDdJFmenZQdOF6K4TXU3tP3JuLNosFYLWA3YWdQGe2UNYLGLVeirRiOmbSzz8AXuA/zaUt+AWWfI254ydo5uk6qrj5+dfG0glJL2BLD7IxageSQLD+9tdfpTvC9q9m88oVH/NCstDFdci2zbr7qeJb7RSjVHOySnUI359UuKgTwUmYKNTaN2A9dlQOiylGQa+FKIZMJHiSONgAZPxX/ePTiYt7iEL0H3tzLR9Xdoj5zotT2fI1TrJgBVCPm4EgZvWSW8DU5KdyyXoWEe8SD3ZpzuReJrNKyfPlUhyGoRsNvrDQaLPusL/z4Yi23Lg+Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by SA3PR11MB7528.namprd11.prod.outlook.com (2603:10b6:806:317::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Thu, 27 Jun
 2024 06:59:38 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::b03a:b02:c24e:b976%6]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:59:38 +0000
Message-ID: <99a168a3-b060-41d9-b387-4285fb39b390@windriver.com>
Date: Thu, 27 Jun 2024 14:59:33 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] acl: Add attr to RDEPENDS:${PN}-ptest
Content-Language: en-US
To: "Chen, Qi" <Qi.Chen@windriver.com>,
        "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <20240626230938fc033ae6@mail.local>
 <20240627061735.1942404-1-mingli.yu@windriver.com>
 <CO6PR11MB5602FF6013A4A17963273427EDD72@CO6PR11MB5602.namprd11.prod.outlook.com>
From: "Yu, Mingli" <mingli.yu@windriver.com>
In-Reply-To: <CO6PR11MB5602FF6013A4A17963273427EDD72@CO6PR11MB5602.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0065.jpnprd01.prod.outlook.com
 (2603:1096:405:2::29) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5009:EE_|SA3PR11MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d23112d-c3c6-41b1-43f2-08dc9676b610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?S2xQMG0wbnowMHF2bDFHaC9IYTREVGJPd3ZpUStzby85M1hKT0VjYlE1dG1T?=
 =?utf-8?B?bUt0aFdRbzdKYmhyRCtSUmM2SmNQc21KdkJFRzRJbHcwdVpSdENPZTM1dHk1?=
 =?utf-8?B?YzJ1QnB1OER3KzdMY2NITTlUK2RsUit3UnVOVTdDSVd4RlluY3VHekI0L3lZ?=
 =?utf-8?B?My82Szh0VGlrYmg2MTJRYXdWL2R4ZEU0cENBd1QzQ3hscEJ2ZXpwSTh6OGZT?=
 =?utf-8?B?aW92ejczVExHQ1VwNGgybS83TWZEZGFIcFNtbS9QelVIWDBuRTlxQW5ET0Vs?=
 =?utf-8?B?aU1BWUhZOVlURmQzTlY0SDNNMUY1aU14ejRYTzUyMHMxc1N2REJSV2Q5Z1lz?=
 =?utf-8?B?eG5PVktOWE52OUNydkxoSmh4dklOQkZma09HbnZ1V0tmM1R3QzlxNjdsZGY3?=
 =?utf-8?B?NVVDN0FtUEdqLzRyU0hLcG56TFltNVY2cFFlWW9zcmRzTTJVbzZQTUhqeWlH?=
 =?utf-8?B?VitTSlVjQlhKdDVDK2FRNWdGekJkcE44RW1mSk1PWkhQT1Y1N3FwNEkrVTBk?=
 =?utf-8?B?a2lqMzErdHNRajJjcHpoS2t4eFpqTlYxWmY0WWUxckFYYW0vd2QrZ2krSXds?=
 =?utf-8?B?US94QlI3MXk1ZjR0a1IzZ2V6VytoSjIvNE5iTm85Z0lUanl6dFIwZ2ZjQmFH?=
 =?utf-8?B?RS9ldFN2N0ZEU0toT0NrbjlmVUs3dCtURzA3cVB4SjQvL3ZnWXp1T0VCaS9B?=
 =?utf-8?B?dEp0UVdKVThEbHpSa0N5VjdjYWQzNHYwMmVocEkydzNuZVRMdWpoNEpRVGc5?=
 =?utf-8?B?MWVrMW9KdHIxVzQrTXFyVGdoMVJTeHlLbVk5aHJmN0pTNFFtNDBYUVVZdTNt?=
 =?utf-8?B?ci9rVDluNjFLM1pSSHNFekkxUnlkMTJpZUI3UEk1aEY3RFJGR2t6NlRlOEdC?=
 =?utf-8?B?L0g2cXk5V09sYThFZytqN3JybkVNL1dMbWRUMnZsdlMyanJvTmpPVVAwYTUw?=
 =?utf-8?B?am5jWEZjZjdtbGZqcVBPWHcvcVBObk1sMEdPZ3picWhkK2RvV0lDVTNjVlMw?=
 =?utf-8?B?RXZLa1lxeHNNTStSNldETVJERUU3M1ZqbDhoMmxEYThoYitqdENnUENxSTJj?=
 =?utf-8?B?YU9pdHpubXpUa3hZaGxyb0FKZTZPYkNzSFB5b3YySndvcUdrTk5rSEFqbVVk?=
 =?utf-8?B?czdPaFBwaFVPMlVvMUt5RW45Z2Y2ZHpweG0vRG9KZzBnOGdkcXVacUlWSHUy?=
 =?utf-8?B?TWsyenM3WTZLbTF0UUJzSUxaZ1pWQXlGMjFSUG1qcGpTYUhFK0RlOE1zMk9w?=
 =?utf-8?B?RlU3UjFKaEROOGhNaXZOOEFBOFpBTlE2K3czSGxndjVZS2VEdEY5NE84SzRl?=
 =?utf-8?B?V1NPVEZFYU9xVm02aFRXa3hpZnJNeWltTzdkTHEvMzJ3empTZUF0SnFlaWpm?=
 =?utf-8?B?Qm0xeE1mb000TWh2a3FTSXEzb3diZWdqUk1sMlhTSm9jL29yZ2FJbjJmelR2?=
 =?utf-8?B?SXF2TEEzbUZhdW42RnR4U0IyV1NmWXZCNjV6aVQzbEF2cS96aHhTN0h1WVpG?=
 =?utf-8?B?ZFFVOEVNZGllTnZGSGN5WElxaytsVUtFajM4RUNJNTNVK21rYldPUm0wWmFn?=
 =?utf-8?B?dDR2WVgxeVBxWHJ3a3V2eVFlZk1aSlh0SEZreEV0MFpDcGpZNjRUazhZYkxq?=
 =?utf-8?B?RlcyNUNycWt1V1o0QTVRZFZaek9oV2RZc1RMRzlpREpjdTZObVJSK2lVeXIz?=
 =?utf-8?B?M1RQUWZUSHlJRDJORlZTbUQ2NVp3T0QwaDAxZU1XMWwwTXQvamNqQ3pDTFVT?=
 =?utf-8?B?RXNub3MrcGxPZEo2ZjFEbTA3aW1FQWU4eDVNRUdIQVFoRSs5VjBsUDFxZXlx?=
 =?utf-8?B?RWlRK0NseEZaQmVtUjNUdz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZExmWHFyd0RBN0RNeGp3Mm9Id20zT0VIdkY4SjI1TGZWSVVENDhkNHhkbVpj?=
 =?utf-8?B?N0lJTkhWa0crTmZHSEE4Qzl2b2NWUUtFK205RCtUdG96T0ZtZHpDQ3gzTmR5?=
 =?utf-8?B?TUR6N2dVb1RJN2RqbDVnMWpRSXNFS3U1M1h0SVdTNmpzTHZTU21EdXZqZ2kw?=
 =?utf-8?B?NjQ4MnR0cVR5WEV2ZUEzYk5EY3hla0MwdUVUTVlaSzVwaTh4TjZUSUN0NHFM?=
 =?utf-8?B?bWtwWGJpK24vMFBPY1lNYnIyekNJckN2NEVIK1pMTENwODRrdUllN1dqMGVB?=
 =?utf-8?B?VW40dzM0eGVDN2ZacGhXd2hHQjRRc2M0aUpEK2VDUUEybzFoZEc3NmRhMWFR?=
 =?utf-8?B?eTYvYkhhRlM3djdJb3dyTDk3MWlRY3I2aUR1aTZOL1lsaU1SbGIzWkZaQzNJ?=
 =?utf-8?B?TktVWDRhc2VEZmkzMGZZMEtXSmxTc1FkdndWSk1ZQzBKWmtscWEzVFpCbExy?=
 =?utf-8?B?Yk53TUswWTZocTNyN00rVWVPWUp2VFhPU1JvNnZrY0Z1VUdNd3VDSjh6cFNk?=
 =?utf-8?B?SS9zZlhRY1hNTHJzNnd1ektNTmFseGZjQUYyUUVoMUdGdVF2NWE0NzFQUVdm?=
 =?utf-8?B?dTBhbDdSU3lUSnR4Q2o2TS84aFRCQ0Juc2hGYlUvY1o5QWd4ellqY0IybGtr?=
 =?utf-8?B?NTJabCtTb24yWHpRdVdNbklBSlNDYkNMdmJxdjMzVnRUcTIxcGhDb2lDUmNr?=
 =?utf-8?B?dkplNEFDMW1LcHdaZ0dmMnFRY0ZXcTcwdkJqV0NnVHFEZlZkMUdic0p5ckha?=
 =?utf-8?B?RWZXWkZGWEs2U0RmdTlHSW5Pc25sYWNhN1pKRHpVQmtGaXQrbUE2TDBBdjN3?=
 =?utf-8?B?QnEybEdQbEcyRCs5ZXZaR1ZaQW5DMzBvd2NMc2tRUUI4TmZjUFMrYUo3K2Fm?=
 =?utf-8?B?T0FOb3FMTVdGOC9OdCtCVzQrVklpRDhzYlYzZGhuNWRSM2RHRUVESVZYVUlZ?=
 =?utf-8?B?TFRONmtGWFlWTU50UkhLUDhibXJzMGY0SmVpTnloTEM4NkVLeXBxakgwb01G?=
 =?utf-8?B?NEI5MVVBUk41NFdQa0ExYm1UbWt4RHpmNndjclBUYzVQNk1oQ0Z4TGdLQ0NV?=
 =?utf-8?B?REdNcCtvSko3bGxLQzhreXZhaGR3VlB5L3ZwUTlpdWNLOXk5ZU5pK1d1NXhl?=
 =?utf-8?B?Rmh1SG92aWtTVFI5bDBLeHoxWUdxN0pRQ2RjUmpGbVFUZVFKK3RCZ2ZvZ0dl?=
 =?utf-8?B?NTFHR3gyc3hiaXVnRGFNN2FXenZqd1htZ2lCT0YyNVJjZ2ticzRXVW9ZdTMz?=
 =?utf-8?B?d2RjcmRpTUsyV2NtMk5FdGJYYmNWTjNDWGVSc3A5NGFORStHZWlxMW5rMnE2?=
 =?utf-8?B?Y21OcDZic1RGOWJhOVZCdHd0czdlVWpsNERnYzhQTGIrV0lCajdrN1FKcjFw?=
 =?utf-8?B?VloxdmV6UU02T05UeTk1d2Q4T2dRRGk0dEt4M2hLbkVHb3Z6Z1QzZkRmZlcw?=
 =?utf-8?B?OW5WM0RaRUFzeXk3aXhVcGllMjd3RGRaK21ITGpWNUNqTml1Zy9vSXMrQUYz?=
 =?utf-8?B?VzVoZlRmS0t3ZDRraytSNkR2T201cGpLOTVmdHpWT20rbjltaUcwQXBXb3hu?=
 =?utf-8?B?QWRKM3ltdTFnSnE1MTM1c2JPVlNYcGdRUEtRODdRNmVocWJYV0VZd2JMcy9s?=
 =?utf-8?B?YXdaMUJEWlJ0UWNPUys3bjlybEdNdnF2OGM3dkV4RG5oQ0lDZUNTbm5HQnMz?=
 =?utf-8?B?QnBaQk9XVFV1cmZsODU0NjczRDJuZjU1SXJSdG9DeXhtTHJUZ2FaYWJ3ODZi?=
 =?utf-8?B?cENWNlhLMFJmeVRld1kzQ0Z5RGNzT1V0N3ZJeU5JUTE4WVVmWWpkNVNOTlpu?=
 =?utf-8?B?VXVwSnRhQ2lMdlM1a3hPMnZIRUQzWHZkMzRWYjVNR1I0S3R3SFJaSlJqY2gy?=
 =?utf-8?B?aGsrK2l6Rnk3RGpqNitWZE82dE9rVndHMTBiVGRRSmRnVmJYa2xlRVIySk5M?=
 =?utf-8?B?dTgvS0diTk5pOHJLQzNvdUpmbW13Z3NQaHd1OTE5QnVSeXdOZTBJbmNlZ3Fs?=
 =?utf-8?B?RGRUbWFVNkdIOGNHK290ZkFBL2U1T3JyWmt3QXhuRnZQaTd6V2R3djRDY2ZL?=
 =?utf-8?B?U0kzTklyUHdKQWEvcy9sVUxJQWFsS0FadHRMZnliNU4rdHY3VXBaTGxkRzJz?=
 =?utf-8?Q?4/e2bmhufQSRQO8XFh/0KgeDx?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d23112d-c3c6-41b1-43f2-08dc9676b610
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:59:38.6380
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBxeY4lTNZ4tbn5xZyiP4bOEi1KVmD7ULRjXhd4vtvCg9rDowyxBwhfnI2q+qeMQAgm3yIPktOT308aWkSZeKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7528
X-Proofpoint-ORIG-GUID: zPM4wVkpz1KThYNONcarPTC0NEyYEdmC
X-Proofpoint-GUID: zPM4wVkpz1KThYNONcarPTC0NEyYEdmC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-27_03,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=983
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.21.0-2406140001
 definitions=main-2406270052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jun 2024 06:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201186



On 6/27/24 14:23, Chen, Qi wrote:
> Just one question: the testcase's name looks like it's supposed to be run on some NFS. Does it?

Yes, It's designed for nfs root with acl support. But the cases are 
mainly some basic setting like set the file access control 
lists(setfacl) or get file access control lists(getfacl) which should 
also works with local root as my understanding.

Thanks,

> 
> Regards,
> Qi
> 
> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-core@lists.openembedded.org> On Behalf Of Yu, Mingli via lists.openembedded.org
> Sent: Thursday, June 27, 2024 2:18 PM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] acl: Add attr to RDEPENDS:${PN}-ptest
> 
> From: Mingli Yu <mingli.yu@windriver.com>
> 
> * Add attr which provides getfattr to RDEPENDS:${PN}-ptest to fix below test/nfs/nfsacl failure.
>    [19] $ getfattr -m- test/sub -- failed\n'
>          'Can\'t exec "getfattr": Nosuch file or directory at ./test/run line '
>          369, <TEST_FILE> line 24. != # file: test/sub\n'
>          'getfattr: No such file or directory   != system.posix_acl_access\n'
>          '~                                 != system.posix_acl_default\n'
>          '~
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   meta/recipes-support/attr/acl_2.3.2.bb | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta/recipes-support/attr/acl_2.3.2.bb b/meta/recipes-support/attr/acl_2.3.2.bb
> index ee86ce2cae..5ac085c322 100644
> --- a/meta/recipes-support/attr/acl_2.3.2.bb
> +++ b/meta/recipes-support/attr/acl_2.3.2.bb
> @@ -68,6 +68,7 @@ do_install_ptest:append:libc-musl() {  }
>   
>   RDEPENDS:${PN}-ptest = "acl \
> +                        attr \
>                           bash \
>                           coreutils \
>                           perl \
> --
> 2.34.1
> 

