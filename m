Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com [148.163.158.57])
 by mx.groups.io with SMTP id smtpd.web11.11234.1625600368819274074
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 12:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ni.com header.s=pps11062020 header.b=VVVnyDy3;
 spf=pass (domain: ni.com, ip: 148.163.158.57, mailfrom: prvs=2821817216=alex.stewart@ni.com)
Received: from pps.filterd (m0098778.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166JcSUg013018;
	Tue, 6 Jul 2021 14:39:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ni.com; h=subject : to : references
 : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS11062020;
 bh=7KGi+PIu89c9PzK0rUOwFIw72DBk4N34dmjCHFfNtnQ=;
 b=VVVnyDy3ogenPD5/BRmB8DjqUTUKdo2+AP7oGR5fHOUYMtOf8kW51zHL5I2ZeUDsKI7h
 Ds//586mjopdzAElxWt2u/qwt/7/PtxY7C3mkM2+WC2IPU7ilQOoPVGwXV/u/3D5kd6r
 bQGFVqVr+gKwv30CTO3q4xwVtXT6mvw1ajl0m1FVRrXcDvdCPdKxzM8/DCBGAGkisFI3
 sq7oWwvx0FfF+r4kHgbTTUGKfm9fzjfm7oOi/d9X1GEZ2vNmG/8Xm0B09fz+Ablly/He
 r+F9DShTMzY7ugluOv3BUcCRksql7tvA9WYg3rxAmECuYVKdwnYMJsQ5V4wjQjfkJ+6W BQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam08lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0b-00010702.pphosted.com with ESMTP id 39kyvyjcug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jul 2021 14:39:26 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SIG7ffMQAWH1BJcQv4zOMbzdiQs2ctLfDUKBMjW05RhassI/MU44diboaqVoRmGoCU9ngD3UwQcXyvJVvXgjz6iXMmUqY8iWPrkHFYiX7P7IPScp3S6WIYIvutqFoTKTDr1eH4AU6KkdnIFXLBD8Slku4o0QCZfegV498ZhVD5BJnEKeby4KUF8MPvozUZp0n2bgXHUYUKZhCEaNJdnot0kJuPOE2rLqCZac5APaoCbW83gr3X36tKbtSNvJxCVds8qxn0p6ZP6yrq27Ql6yMgdyr57STCDtTsjR47wJRzo4nNaN7lSQuaezDKdfdz+6lryZmyohub4kW7BEoxHHWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KGi+PIu89c9PzK0rUOwFIw72DBk4N34dmjCHFfNtnQ=;
 b=PjKZ69vJ1t8dSl56Ul099vh36l5A22SSr+6Awxfq4nqYJCW5UNzwU1Z93ykZj3JkyjgwFQIc+0TinHHOorSN9Itb36BHp1fYllgqLhxcr/5pPAC1jjubHHr3Aczis8YNR768d0ludPHZ+9iVADa/k8QGPwN7QY3J6uSh1/+7scEN/vn9OthD7MwwBpxpiBGMoTFgxampwEOZ6w57zHfE46nEpTxt5m0y02PecoPfwH15qlX3rj2zbj9WM5/LMUYQwO2xDULJyd1iVVmfPoxzRLATMwmwRfzChsGznlve/D0chLWX1CdISey5NcoMQgoVfjP2otlfGgx17Icgi9UOUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ni.com; dmarc=pass action=none header.from=ni.com; dkim=pass
 header.d=ni.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nio365.onmicrosoft.com; s=selector2-nio365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7KGi+PIu89c9PzK0rUOwFIw72DBk4N34dmjCHFfNtnQ=;
 b=tDZ6147fdQLSAS76NhVUztKDikM45ZUSHpLrwGbl4Ub6n3GVmx8HsuGZxDpZvhd5GF+Et+Sj4sQ1rJvMltr7aSdTp82+zpSISVISx2m70ra3sjRVyiTSMZnS9C66S0llHFQlb1ZGxaCIdU2ZwbwDJb7jd1n8Xuf/WTgKgzykoLc=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=ni.com;
Received: from SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
 by SA2PR04MB7708.namprd04.prod.outlook.com (2603:10b6:806:142::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23; Tue, 6 Jul
 2021 19:39:24 +0000
Received: from SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185]) by SN6PR04MB5151.namprd04.prod.outlook.com
 ([fe80::ed94:4e4c:ab8d:f185%7]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 19:39:24 +0000
Subject: Re: [OE-core] RRECOMMENDS "masking" unsatisfiable IMAGE_INSTALL
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
        Richard Purdie <richard.purdie@linuxfoundation.org>,
        OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <5d6b6934-bd33-04e5-cf55-ce09895bbd6c@prevas.dk>
 <599d48303a40d8c4db4d0d380d4cfcc5f0c7acfb.camel@linuxfoundation.org>
 <6f831e07-bfc3-8803-07a8-39050f92b3f6@prevas.dk>
 <6413b9648787dc0ba529241cb62bc5e031654d22.camel@linuxfoundation.org>
 <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
From: "Alex Stewart" <alex.stewart@ni.com>
Organization: National Instruments Corp.
Message-ID: <2d520cb4-2af1-fa63-1ea2-141f72a7bd80@ni.com>
Date: Tue, 6 Jul 2021 14:39:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <d2bb69c7-1466-d265-4f81-adbd69ebb512@prevas.dk>
X-ClientProxiedBy: YT1PR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::21)
 To SN6PR04MB5151.namprd04.prod.outlook.com (2603:10b6:805:90::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.8.1.2] (37.19.212.113) by YT1PR01CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::21) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20 via Frontend Transport; Tue, 6 Jul 2021 19:39:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5fadbb3-23f6-4e0a-c458-08d940b5c232
X-MS-TrafficTypeDiagnostic: SA2PR04MB7708:
X-Microsoft-Antispam-PRVS: 
	<SA2PR04MB7708532F21C5C81B83239BD1FE1B9@SA2PR04MB7708.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	DHKLowHZgM0mJvqE1dS1wykfUB5LMgOXwQWz25iBG14epHXQr/1l3AD+iEe3SOse8RG2o++R4yWkdHxHG4oQiIPfI05UnJrYQoLKdpmEHShAlDjS5gSaB9qat5gdcJr9jbWCUzDOelB44LD468FJlMK7QqoUht35E58UMEa8T9InI+mArKDFz/chRinO705wjPtWNDFYLylP1ehuCmtqTWoPX0pLqmrbym3vp8pjBLeZptQpiaGA3AKsaXb5ucIYu4XcdYLRNz6mBKNgsNbMhyh46VUb1Ml9OG4SGVeCMY1L6+9m4yxSYHaZt8JwD+4JR6KfDpo0v05bjnQLSKaqqjc8ZB/XJBOmdS64ngpU2e0aSifv6RkGIeb0eqDlfHCEVCnNmDa+Av6ZO8M8Mv2+6u/TFys/AUYJzTJvsHWtrdFVZmq2r3WduVZB4I0StRbCbIsUGiwTmpRLG+foFzz+/mvipmffvU2mL7DuULoZl5HzD87vFxdlsChdRJYll8SPhqmyrPQ8Xu4d8/xH2ZaZnTBr06QSaqz4oxzlS56DSM/Dm60VHJ2taJQM2AtGDxEIUUbfNBo06bkr15RWd4sdTW4epK5Lr/b1K8t8RHNvH+je6wkAuTzVplTMRSd2/7h2UaSnDOFbGq0QHOhy1b1bxwW5cVaoXPGjTpVSTgOiLywVdIejygdDf/2Y2GrO8Gs/65pymgeAVvQi3zfy5a6yPN3WGaNxOqUhOUN0x/MmN+R2WvXqaB4GANDaY8iewziC5wY9YQ8n6rzFdiaU0ACsLQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR04MB5151.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(136003)(366004)(39860400002)(376002)(396003)(110136005)(31696002)(186003)(316002)(31686004)(36756003)(8676002)(2616005)(38350700002)(52116002)(66476007)(86362001)(6486002)(44832011)(36916002)(16576012)(53546011)(26005)(956004)(5660300002)(8936002)(478600001)(83380400001)(38100700002)(2906002)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?dnRHblhQK2k3Z0ZVMkVvVi9MenQyLzVHVzAxbGpJVk5xMnk2YzVMdUtGMlRP?=
 =?utf-8?B?TmNGdEpLSU14bTBTUTFhU244VGRWdGtGdUpoNE1ZOGovY2MzWnpVajFMQTRk?=
 =?utf-8?B?Uno1UmltRmdUTzVqUHNIdmxvcWZsdW9zSzZJVXFJN0xnNjhmN1MrUVpRQnlP?=
 =?utf-8?B?SDY2TEpyekRFV1JxdGtGMXJ4K1ZmcGk5TmdkWk4rSnF4Q3IyTWhUSFMwUjBp?=
 =?utf-8?B?dnkvdWRYbjFyWkNqKzhaNE5vaDRiNnlka3RvaGpzdksyZ1V3ZU00NHBEQzRa?=
 =?utf-8?B?N2pCdUw5Q2FMN1JWZ0hSNXRWN2NwTHl1clAyME9VM3ZON0VVM0tZY0VxUDRJ?=
 =?utf-8?B?RnM1a3paWXBMMkpYUng0a0JHUkhHUW1IYXNWNHRwMm5uTXRENXFKbU9TeThu?=
 =?utf-8?B?MlUyRG4wYzMwN1JkRWxRaWhpZGVJL2FvRDlWa0ZvSHE2dVZRQkhwV0ZlZk1h?=
 =?utf-8?B?WEtIMkRRa1o1UkkvNkFmZGZhUWZkd21kc29sMkZ2Z09KUXJVeldJb2pTSVV5?=
 =?utf-8?B?ZkVVMWtvTkhmSlRiOUc5anFKbzJwL1ZpM29tRXpTa0ZzenZjRDJBcmZVWjNi?=
 =?utf-8?B?aHVyaC9GbndKcHhTTld5eEF1bEVrNzduOW0zdnNmdDh0NlBiM2V0SEVFZXQ2?=
 =?utf-8?B?M05XZmVVRUgybHpzL0FWNndoWjhqU0JmT3NEUzFWNjFxVkNtYlM4S1VNUHdt?=
 =?utf-8?B?a0hnNExxQWRndXh4cDdtelQyY0xiUVhocHYxWlROTkw4ZkpqSDFyL2t4Lzlz?=
 =?utf-8?B?bHhoaTUrNkIxa2JOckdpNlE3eG5laytWa083SERKNm5LWmNQdlltSXFSaytH?=
 =?utf-8?B?M0RoeDV0ZjVibGR6azFWY3VCRE9jc2Zrcjk0NmgyM3hSWjRVdzkwVERHZkxU?=
 =?utf-8?B?dHZuVGNvVTdVQ1BhREgyY2tuc0p6ZkJ0V0p4TWRqVmZ0aDRIYXEyYytuc2d5?=
 =?utf-8?B?NTFja29CRWhQVXFjMTJId2VyQ1doc1BScDM1UGxVMzBJWTNBQXhIeER4WVZM?=
 =?utf-8?B?S0lUeHVmN3RXa1V6cUNDeFBtSnVJdVJiOHBnNHBzSkNNSnJOcUY0R29jTEpl?=
 =?utf-8?B?SjBEMlNNemhITGtpS0lPQUVrQk1MMGVKUnNPQmJ0anNGcGtOVWVJRmFtQzdh?=
 =?utf-8?B?ZW9EWTMzL2YzdkxNeU00dlFjS1Z3bmU4YkFwdndFNkxEQUpJeUlHbFRHZC9n?=
 =?utf-8?B?ZThxRFJqTWlKb3pyTG82UmJna0swaXBCcjJ2MjlOdFR0Vnl0VVBTSjhmWkxw?=
 =?utf-8?B?RkhKc0F4Z0tSTWt6Qi9RWldTdjFieG1xUmF5NU56aksxVElWOWhDL3M0YzBJ?=
 =?utf-8?B?SG5WaTZhcXFUUFhPVTNOSE41QWY5eTZkNzRwbTNvVEo1TFloS1kyNDI0aVNi?=
 =?utf-8?B?THR3TnJGOXRlaDI4NVhoWGkwMnBjOWUxMW1LZ0ZYQS8ralRUS3dkd0tudE9S?=
 =?utf-8?B?eUF4bWNuSE9GbmRZd3p0dytJOWZ4QWM1ZWVpbVRkZHRFVFpXQzVyWkZ3U1Yw?=
 =?utf-8?B?WFlBSm5uVlEyM21KekRCUFA3UEVNamwxYWhxKzJCczVTYkRlSVNmdytEekth?=
 =?utf-8?B?TXZEOERXcjdaV3crNnErRUx2MkJuSm90b29SazVWQ2dvMGIvdG5HY25PbUo3?=
 =?utf-8?B?ZGJGbWovMGwycDFhYm9ENmlDNUc1S1hQTmQrTWx3aFduTGdGNTA2R1lobHo2?=
 =?utf-8?B?YlA1bEpoTWE1bkttcWNVWDE2Qm9lait3SXNSZytkU1ZRS1BxMWx6UHoxcm9t?=
 =?utf-8?Q?HoB5YlpHmYbOdcFEPH8+pkss+7eoOOi7hDt5Weu?=
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5fadbb3-23f6-4e0a-c458-08d940b5c232
X-MS-Exchange-CrossTenant-AuthSource: SN6PR04MB5151.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 19:39:24.3276
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9/YZN5iz3dULHPVnqtMmEEU9xCgAX0vT7b2gfASp4WbDaf6Z9/5t1cxm7Lo9tPAI1dXOS3gq/HD7yuusNy+9TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR04MB7708
X-Proofpoint-GUID: RS4H_ZfByWrsclGUsgww5BVhjBU89JfO
X-Proofpoint-ORIG-GUID: RS4H_ZfByWrsclGUsgww5BVhjBU89JfO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_10:2021-07-06,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_policy_notspam policy=outbound_policy score=30 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 bulkscore=0 clxscore=1011 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=30 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107060092
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hey Rasmus,

Sorry for the delay; I was OOO for the holidays and I'm just now working 
through my inbox.

On 6/28/21 4:17 AM, Rasmus Villemoes wrote:
> On 25/06/2021 18.13, Richard Purdie wrote:
>> That is probably a bug that needs opening against opkg in bugzilla then.
>> Added Alex to Cc: (opkg maintainer).
> Indeed, thanks. Alex, do you have enough context from the above, or do I
> need to do anything explicitly to file a bug?
>
> Rasmus

Could you expand a bit on how OE is supposed to fail when the kernel 
module package is unsatisfiable? Does it propagate a opkg satisfaction 
error, or is the misconfiguration caught in the OE python modules?

I ask because it seems most likely to me that the inconsistency here is 
in the OE opkg interface modules, rather than opkg itself - which 
obviously has no concept of IMAGE_INSTALL or the kernel configuration.

Can you identify the set of packages that OE is requesting opkg to 
install, with and without the RRECOMMENDS? That would help to 
distinguish between an inconsistency in the OE PackageManager modules 
and a bug in opkg itself.

Thanks,

-- 
Alex Stewart
Software Engineer - NI Real-Time OS
NI (National Instruments)

alex.stewart@ni.com

