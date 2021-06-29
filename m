Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.2653.1624933006325588914
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 19:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=oIw7PVMg;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2814054503=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15T2ABPl001275
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 19:16:45 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39fkpr8a9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 19:16:44 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15T2GiGP010102
	for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 19:16:44 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com with ESMTP id 39fkpr8a9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Jun 2021 19:16:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=azW7/6c3FW0PlkmVhNquKqlgl32vkJGJHvZ71SDEMnDS4wTjaKHu6FjZsaR9CZFypI76tmiP3DmNvEd1z5UxXCX//oytpHhSyuR11lo8rhfKedHM8mHmeP0Ftmd5WIGVk5/UI8GAPk2oYBSddpnZC1yVuJd1sluNPXjMpkRPRZc2jN2pM61WjD8HK3W5+lOoFz2QX1gn58hA4XHjJcqkW/WROpSMxfXN/rnm5O8/Fr9bI42s5LGG8erytqX22q6OhzM02UIwxyBTJ/2CodXtuX/oDKzTkmFRmVLy0N5g66be2gqKW9VvV6jT7c+ScVBORcPfEHmegkNd8soOJSBuvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFCbgueHY9umDywgydy21JyARGOfGDP4WTKExxCYT2I=;
 b=IXI1uBjf9bFKXXNsYmNHYFwlMjSTnnUp3LC+CDyW0sATM53M7PIUlkPHxgH4J1CjWjKsKOIH1Zj1v62Tx8EjaEiaf8vbODqNVGiMoWZLfZ+HtphizcmDhbEH52qDQcJybI7RvJ0ShLd0Scgp+j4IxeyGeuPjZPw8oYVhxyKPrMOV3OHXCT5bWRb4QDcn0HmfsTT4ESSWGx1aipxHztXSWe5UTnrTU/Hk4vEPTzK1ehP6CzNKPOwWKkntMu3s7F6iz3CKAhuKqq1yIgch2G2i8y1DH+Ns2D4jJgbm30mUahwTKsECX8gLLUqDi1qmeCr5wk54NAYd8MPAFElQ0H8MDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GFCbgueHY9umDywgydy21JyARGOfGDP4WTKExxCYT2I=;
 b=oIw7PVMgu3kFG4RZhjVcdSQqHETENsZ7C9Sp5DYlkZTIZZOYzJRm1Wy+RVg8+aDG8FyDLbRG5oKi2A7A/Poo+tjMrkC0fWV3KlJGvZJyKd10z9YgKNqtNCpTtkrz3PcgqoLjmS/pRI7V0bXqLtKFhA4x2wq1skH37KV1voiSfgo=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by CO6PR11MB5667.namprd11.prod.outlook.com (2603:10b6:5:35b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18; Tue, 29 Jun
 2021 02:16:40 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::85f3:7d46:9b5c:ba6c]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::85f3:7d46:9b5c:ba6c%6]) with mapi id 15.20.4264.026; Tue, 29 Jun 2021
 02:16:40 +0000
Subject: Re: [OE-core] [PATCH 1/8] PEP8 double aggressive E401
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
References: <20210628055915.1107-1-raj.khem@gmail.com>
 <CANNYZj_27HL2PMRW-2E5sf+LjBCL_gKQQbyu5ogvE4NsnTWZcQ@mail.gmail.com>
 <CAMKF1sqdn9E--goYuo3qNAT0-DMT25dSyFZvb1Sxmq_eGn=A-Q@mail.gmail.com>
 <CANNYZj9QZ5sojh=-oB_RRrbYoyxQ7JE_gHz46QYXWdRERwNMJg@mail.gmail.com>
 <1709447933.2675529.1624908347132@mail.yahoo.com>
 <CAMKF1som60jePF_rDsxL23364L55uTU5GejodiTY6amNbp1GpQ@mail.gmail.com>
 <CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com>
Cc: Persian Prince <persianpros@yahoo.com>,
        OE-core <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <1869df62-d92a-e50f-f185-63a9e436e4b8@windriver.com>
Date: Tue, 29 Jun 2021 10:26:53 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0045.apcprd03.prod.outlook.com
 (2603:1096:202:17::15) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR03CA0045.apcprd03.prod.outlook.com (2603:1096:202:17::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4287.8 via Frontend Transport; Tue, 29 Jun 2021 02:16:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cafb760-1c8a-4503-321f-08d93aa3ee38
X-MS-TrafficTypeDiagnostic: CO6PR11MB5667:
X-Microsoft-Antispam-PRVS: 
	<CO6PR11MB5667D8B7097F3F0C5E090FBCED029@CO6PR11MB5667.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eWtubFZ1LzZoQ3JOZGU4NVhtTUt3YmRSaWk5MFRza0I4QTJUUzZwTE8yM1hz?=
 =?utf-8?B?RG90a0NvVlVpMHBMY2JmODhSSWJ4eFdjdWl6Z1RYZGlyZHdGcTRhblExcFMz?=
 =?utf-8?B?TzEzSzVqNXlqUzVudlAzd0tjREhlS3JsdW5GMCsycTU3dzAzM3RyMHBrUUpG?=
 =?utf-8?B?emJ2aC9RZUM4WUhJaWF4Nng4anVFTEFjQ042c3lsampEWjl1aU9DL0hXRDNW?=
 =?utf-8?B?U0NwWFV4L1ZsbjJ0YVFMcFZJUE1xK2ZYQ0RHbXlIcEorSktEU1VQaXAyTTF0?=
 =?utf-8?B?WlBHL2dTSjhreVdCTi93OHFtRWhsekZkbmhlSDVJcUsvbGVjeU41dnZOOFdL?=
 =?utf-8?B?Q2w3bnRGd3FwZzZ4ZWFueGxNc3RtU3VEOGJkU2hFeUZvMWlWWE9manJHWHdq?=
 =?utf-8?B?aXZIbXprRW9hZWhaeFNPb2xYdWhJalBzT2dMRGZJdXF1dktTazl2MHNlMkVk?=
 =?utf-8?B?emNXRFBRNVRzcTI3S21LVyszZnArcjc5L2RaT0QrVDZkRFhWQVQyM2tkV2d3?=
 =?utf-8?B?TDNoWXBxK1ZaL0UzWUpSZUJCOEY3LzR2TG80cEd2VHhBczBwNzZOSk4yNGhY?=
 =?utf-8?B?UjFxU2JVUlVGS1dLQVJCb1BvMkxpUExhMzc0SmtjUzRiVzVjWWRjMVBtL282?=
 =?utf-8?B?aGtqWEdFeUh6M1BKUzVvMmhOMFdIYTRycHp3Z1VEU0J0ZndlM2lpRGVuMS9p?=
 =?utf-8?B?dDNpaFRSWjVPdDRLREVQOUx6ZDRwN1paVHg4djliQm9HbEpIaXFGNWptMGhh?=
 =?utf-8?B?WEJEM1hwL2M3RkFkWkNiVHVqN1FERHgyaFdIdldGM3I4OGVPNm5tOXo5OXRD?=
 =?utf-8?B?UTQ5K2hYOFMrNHdlZzFKWk5nVGY4NFJtNUtPZXJoY2huSTVUUGlzT1drVEFF?=
 =?utf-8?B?T0VpTU81Qm1ERkZEVmJ0VmpkRjE1WjNuUFVSQlhqZTAyL1B2Q0liS1hmM3g0?=
 =?utf-8?B?V1ZETFp5MUQwa0cvdzJUYzlkUHAycVdKUzRzK3hZQzIrR3dWNzN0SDZQTERN?=
 =?utf-8?B?TCtYOW9HQmoyUDlldzZmcVh1bkRvNTRudXppVnZPek5jNmxUaXV2K0VnMkg0?=
 =?utf-8?B?eWFLOXpXNEM5L2dwVHVsbGw5YXR6endEUEJ6Y0JYOFphQ3E5aHlVcWN2bW5T?=
 =?utf-8?B?WDAxSmswa0tQdGNwZ0EvREVINXpEbnlDU2lHTjFyck5iZC8rU3ZtU2xER1ky?=
 =?utf-8?B?NS9XcGtCNW9XU0U5L04zeWM0MFREdUo5YzF1N0hMRUprZTN0dEZPOGFiR2VB?=
 =?utf-8?B?THRuVjVndFlQbE5oS1hCeTdIZW9pM3hVUEhnK2lhajhsN29ndz09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(39850400004)(376002)(136003)(396003)(86362001)(966005)(52116002)(110136005)(54906003)(16576012)(31696002)(316002)(5660300002)(6666004)(66476007)(31686004)(478600001)(66946007)(66556008)(53546011)(4326008)(2906002)(16526019)(33964004)(8936002)(186003)(166002)(6706004)(8676002)(83380400001)(66574015)(26005)(956004)(2616005)(6486002)(30864003)(36756003)(38100700002)(38350700002)(78286007)(45980500001)(43740500002)(559001)(579004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?N2dMekNRKzlWN0grNXNDeUpFK0lFMy8raUFyNFMwVHJGaGtKcGZMSkV4czht?=
 =?utf-8?B?VnpjRTVydXFmdzFxRFovQVdSOFRSK3RJNEwzSnNCNjBCMlh6WUVOdDZrSFF5?=
 =?utf-8?B?K2xrVFBnL0dsVjgvV3JZKzVlQnNjK3hoenNQbEZOa1grOVgwakdvWWpzSXhE?=
 =?utf-8?B?L2hER1RoMVpNZjRjTEJVMnBDc21HU3VIT1M3SFNlYXJqNGlWQWVPSTVaVklx?=
 =?utf-8?B?d2FmUTk3ODd6K3BjdmRqN3BEVlp2cDM4blRMb3l3dFFtS0N6a0wxRG1odC83?=
 =?utf-8?B?S0NaM1cxTkhwQkNlSUlGSnErRzRqWFlNYXRPMzZ1SzdrVGpXenJCWHQvVE5m?=
 =?utf-8?B?Y20xeUdoVDJUSDZubk5VdWRabzhWNW00TmgvdkxjMzVpQlRyUm5WY08zOVVV?=
 =?utf-8?B?ZDBqajN5czk5Lzh6clI4SDRVWFVvV0RSZW1YaitOdkNvYnlRNllleU1STURR?=
 =?utf-8?B?MFlJTHhNMTdGZ2Z4em1iTTR3NGliVmdvdnhxdGJOR2tqNi9qSmVKUjFyMGQ3?=
 =?utf-8?B?QW4xWVFHMEM4clV5OGUrYVIrRWI4b0E5S2J5ZFJXZ0VGWmxVbDJJeXY1NlFT?=
 =?utf-8?B?ODZGdGNMcG4rMS9ieWw2RFhtWVI3UUxSb3EwNlJ5bC9kSVZlU25WNFVSdmF5?=
 =?utf-8?B?aHZHbW55clFsY1M2VW9TaHNQUDlxMjZaRFo0U1FVQlNSbGlRMFVLVzMzUmJQ?=
 =?utf-8?B?TEJiNlJxT3ZNNkloWVRiOFdVcDNuMGF3VGpjVEppdVc1V2pnOHFqUmpabmN4?=
 =?utf-8?B?RkZvQ3BoYkRYUmErVVh0Nm44MEJSaXIrdXRha1MyNkViUDc0OEJrZFlHQkpw?=
 =?utf-8?B?aFQ0ZzVlOHFrMmZRVzlheXdWQkFGZmZVQ1lCODRFQUxnQ3Z1RXRIeHU2KzVy?=
 =?utf-8?B?NE1FdWtDbFZ4VUZKeXVOaHpiQzduNHl1SXZObGI2cW03SDlWNHFXNFNma1p3?=
 =?utf-8?B?SUtUUUNybUZRaVc2Rm1jcVlHQVNOQjJ1R1pUNlJaZERxMXAzU2RYQUoxYmR5?=
 =?utf-8?B?YmtqN24vbnBpTXFidlNMYzBoOWlzdFRCT1ZPbzUzdmZldmVVcjFkUnVUUnJY?=
 =?utf-8?B?YjdocmUybWg4QjNpMEM3bkVMbFk5bkNSZ0VrWjYxMGJ4YnlzOUFPaHFNUC9I?=
 =?utf-8?B?YjNSSHlKSzdyL3Awa2d4UlNsS2c0WEE4Z3pwc0c3a1JZOEd5bVlnaXZsKzNy?=
 =?utf-8?B?bTVER0kxUHZPNnM4cXpVTS9HcEx3UU5xVlR6WDZ3d1JNNnZGVmNJb0R3UWl1?=
 =?utf-8?B?SHk1SE9mcFo4SlE5YlkvR3dPSmMrb0drQmQrZTlwUUoyakRrYlphTHBLRE9T?=
 =?utf-8?B?NTRVUWlvT0FzMU1TR0lSeERMN0t4OE1JNjB6UW54QUlQbEZ6ZnBPQWYxMm1z?=
 =?utf-8?B?VHhKYjVCWWpjRnNUaGZxU20ydGRuU3FaUS9JYWsySzVjWTN5N1pXOHhvMTBI?=
 =?utf-8?B?TkJyQzVmNGw4QkdHYlR0YmxJM2lGY2V4UnFBYmswNVZhQU1FVGhjVk13U0V4?=
 =?utf-8?B?aXMxVHIxS29ZVXIwOVpTdXhmRC9PN1FzRG5zbUNKL0VaVmdMRDJ5M3RzV01K?=
 =?utf-8?B?SzF4MDlCTFZVRnlNODEvcE5uZmRpMm1EWmUvRmRVTnIvMG1QeTkxSkcxempm?=
 =?utf-8?B?NUljRytBL29ka0FlVU1nL1E2OWk2cmJ4dFBhc05ibkQyQkRXNU1lN0cveGU4?=
 =?utf-8?B?dTY4WFBYUVhmMWsrKzQyN0NGZ0l0ZTI2bkdLY2EwelhxUzNCdTZWalFXYVQv?=
 =?utf-8?Q?wJt3f2HH5OGCMNquDHRRy0TP7ZAAPC9eeJtJtRT?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cafb760-1c8a-4503-321f-08d93aa3ee38
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2021 02:16:40.4408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jq89A+jSXoAHloIkC3b1Aw/MRtx3KH+rM9arAWkVr4k18lAvQqYctXmqn3KusZUoU+xwW2aC16Tu7tP794vCNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5667
X-Proofpoint-GUID: IKcS5cKrGPqIoOEcuXKUS-mlpzgGc96o
X-Proofpoint-ORIG-GUID: kw8EJb2dj8gERjL462ZDU8BjtX9g9uUT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-28_14:2021-06-25,2021-06-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106290014
Content-Type: multipart/alternative;
 boundary="------------FA36224A91EFF2C5ECC2FC08"

--------------FA36224A91EFF2C5ECC2FC08
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/29/2021 03:47 AM, Alexander Kanavin wrote:
> I just generally disagree with the idea that changing a = b to a=b, or 
> import a,b to import a\nimport b helps readability or reduces confusion.
>

Writing 'a =b' is acceptable, as it's not causing runtime problem. 
However, keeping a consistent 'a=b' is better. Isn't it?
Just think about writing 'a= b'? Is it acceptable?
I think patches to make codes have a consistent style are good.

> I'm reading a lot of python code all the time, and never once have 
> been confused by inconsistent whitespace.
>

No one confuses. But consistent codes give people better impression.

> Can the linter fix anything else, which has actual benefit?
>

Keeping codes in the same style is the actual benefit.

People might not have time to do the check and send out patches, but if 
someone has already done that and sent out patches, why not accept the 
patches?

Best Regards,
Chen Qi

> Alex
>
> On Mon, 28 Jun 2021 at 21:41, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
>
>     On Mon, Jun 28, 2021 at 12:25 PM Persian Prince
>     <persianpros@yahoo.com <mailto:persianpros@yahoo.com>> wrote:
>     >
>     > When we can follow PEP8 we should as it's how developers could
>     follow a common coding style and avoid creating different files.
>     >
>     > In "Safe PEP8" PRs some PEP8 codes carefully added so it won't
>     change tabs to spaces but makes the code cleaner in a safe way.
>     PEP8 also fixes some small problems (won't do huge changes like
>     futurize) which is good and sometime we miss them by mistake.
>     >
>     > We at https://github.com/OpenVisionE2
>     <https://urldefense.com/v3/__https://github.com/OpenVisionE2__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6QWMweTw$>
>     , https://github.com/oe-alliance
>     <https://urldefense.com/v3/__https://github.com/oe-alliance__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6ROP1INw$>
>     and https://github.com/OpenPLi
>     <https://urldefense.com/v3/__https://github.com/OpenPLi__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7D6O7-Kg$>
>     applied safe PEP8 changes to so many repositories and we're using
>     it via PEP8.sh
>     <https://urldefense.com/v3/__http://PEP8.sh__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy4ewWfxFw$>
>     on GitHub Actions as an online cleaner tool. (PEP8.sh
>     <https://urldefense.com/v3/__http://PEP8.sh__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy4ewWfxFw$>:
>     https://github.com/OpenVisionE2/enigma2-openvision/blob/develop/CI/PEP8.sh
>     <https://urldefense.com/v3/__https://github.com/OpenVisionE2/enigma2-openvision/blob/develop/CI/PEP8.sh__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7J7fBYZQ$>)
>     >
>     > Also applied before on
>     https://github.com/openembedded/meta-openembedded
>     <https://urldefense.com/v3/__https://github.com/openembedded/meta-openembedded__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy4qmKWVZQ$>
>     which is why that repo is clean and won't need a PR (for now),
>     keep in mind that these are common standards so even if we don't
>     like them that much still they help for having a good common style
>     and less mistakes.
>     >
>     > If you needed more assistance from me please don't hesitate to
>     ask, I'm all in.
>
>
>     can you improve the commit msgs in pull request as asked.
>
>     >
>     > Regards,
>     > Persian Prince
>     >
>     > On Monday, June 28, 2021, 10:56:40 AM GMT+4:30, Alexander
>     Kanavin <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>>
>     wrote:
>     >
>     >
>     > Right, but can you please write something more descriptive than
>     "PEP8 double aggressive W291 ~ W293 and W391" ?
>     >
>     > Also I'm not sure fiddling about with whitespace or whether
>     imports all need their own line really helps.
>     >
>     > Alex
>     >
>     > On Mon, 28 Jun 2021 at 08:16, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>     >
>     > On Sun, Jun 27, 2021 at 11:13 PM Alexander Kanavin
>     > <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
>     > >
>     > > Wait, what is this patchset all about?
>     > >
>     >
>     > its fixes for python linter (pylint) found issues.
>     >
>     > > Alex
>     > >
>     > > On Mon, 28 Jun 2021 at 07:59, Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>> wrote:
>     > >>
>     > >> From: persianpros <persianpros@yahoo.com
>     <mailto:persianpros@yahoo.com>>
>     > >>
>     > >> Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>     > >> ---
>     > >>  meta/lib/oe/package.py       |  9 +++++++--
>     > >>  meta/lib/oe/qa.py        |  4 +++-
>     > >>  meta/lib/oe/utils.py       |  6 ++++--
>     > >>  meta/lib/oeqa/oetest.py        |  4 +++-
>     > >>  meta/lib/oeqa/sdk/case.py        |  3 ++-
>     > >>  meta/lib/oeqa/sdk/cases/buildlzip.py       |  5 ++++-
>     > >>  meta/lib/oeqa/sdk/cases/python.py        |  3 ++-
>     > >>  meta/lib/oeqa/sdk/testsdk.py       |  3 ++-
>     > >>  meta/lib/oeqa/selftest/cases/oelib/path.py       |  3 ++-
>     > >>  meta/lib/oeqa/selftest/cases/package.py        |  7 +++++--
>     > >>  meta/lib/oeqa/selftest/cases/runtime_test.py       |  3 ++-
>     > >>  meta/lib/oeqa/utils/testexport.py        |  6 +++++-
>     > >> .../texinfo-dummy-native/texinfo-dummy/template.py    |  4 +++-
>     > >>  scripts/combo-layer        |  3 ++-
>     > >>  scripts/contrib/patchreview.py       | 11 ++++++++---
>     > >>  scripts/lnr        |  3 ++-
>     > >>  scripts/oe-pkgdata-browser       |  5 ++++-
>     > >>  .../pybootchartgui/tests/parser_test.py        |  7 ++++++-
>     > >>  scripts/send-error-report        |  3 ++-
>     > >>  scripts/verify-bashisms        |  9 +++++++--
>     > >>  20 files changed, 75 insertions(+), 26 deletions(-)
>     > >>
>     > >> diff --git a/meta/lib/oe/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     b/meta/lib/oe/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     > >> index dd700cbb0c..fc5408d5f8 100644
>     > >> --- a/meta/lib/oe/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     > >> +++ b/meta/lib/oe/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     > >> @@ -107,7 +107,10 @@ def strip_execs(pn, dstdir, strip_cmd,
>     libdir, base_libdir, d, qa_already_stripp
>     > >>      :param qa_already_stripped: Set to True if
>     already-stripped' in ${INSANE_SKIP}
>     > >>      This is for proper logging and messages only.
>     > >>      """
>     > >> -    import stat, errno, oe.path, oe.utils
>     > >> +    import stat
>     > >> +    import errno
>     > >> +    import oe.path
>     > >> +    import oe.utils
>     > >>
>     > >>      elffiles = {}
>     > >>      inodes = {}
>     > >> @@ -187,7 +190,9 @@ def file_translate(file):
>     > >>      return ft
>     > >>
>     > >>  def filedeprunner(arg):
>     > >> -    import re, subprocess, shlex
>     > >> +    import re
>     > >> +    import subprocess
>     > >> +    import shlex
>     > >>
>     > >>      (pkg, pkgfiles, rpmdeps, pkgdest) = arg
>     > >>      provides = {}
>     > >> diff --git a/meta/lib/oe/qa.py
>     <https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$>
>     b/meta/lib/oe/qa.py
>     <https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$>
>     > >> index e8a854a302..38c2e0cc1c 100644
>     > >> --- a/meta/lib/oe/qa.py
>     <https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$>
>     > >> +++ b/meta/lib/oe/qa.py
>     <https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$>
>     > >> @@ -2,7 +2,9 @@
>     > >>  # SPDX-License-Identifier: GPL-2.0-only
>     > >>  #
>     > >>
>     > >> -import os, struct, mmap
>     > >> +import os
>     > >> +import struct
>     > >> +import mmap
>     > >>
>     > >>  class NotELFFileError(Exception):
>     > >>      pass
>     > >> diff --git a/meta/lib/oe/utils.py
>     <https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$>
>     b/meta/lib/oe/utils.py
>     <https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$>
>     > >> index a84039f585..789bad33f6 100644
>     > >> --- a/meta/lib/oe/utils.py
>     <https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$>
>     > >> +++ b/meta/lib/oe/utils.py
>     <https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$>
>     > >> @@ -376,7 +376,8 @@ def format_pkg_list(pkg_dict,
>     ret_format=None):
>     > >>  # Helper function to get the host compiler version
>     > >>  # Do not assume the compiler is gcc
>     > >>  def get_host_compiler_version(d, taskcontextonly=False):
>     > >> -    import re, subprocess
>     > >> +    import re
>     > >> +    import subprocess
>     > >>
>     > >>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
>     > >>          return
>     > >> @@ -404,7 +405,8 @@ def get_host_compiler_version(d,
>     taskcontextonly=False):
>     > >>
>     > >>
>     > >>  def host_gcc_version(d, taskcontextonly=False):
>     > >> -    import re, subprocess
>     > >> +    import re
>     > >> +    import subprocess
>     > >>
>     > >>      if taskcontextonly and d.getVar('BB_WORKERCONTEXT') != '1':
>     > >>          return
>     > >> diff --git a/meta/lib/oeqa/oetest.py
>     <https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$>
>     b/meta/lib/oeqa/oetest.py
>     <https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$>
>     > >> index 9c84466dd0..3136ac2ce5 100644
>     > >> --- a/meta/lib/oeqa/oetest.py
>     <https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$>
>     > >> +++ b/meta/lib/oeqa/oetest.py
>     <https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$>
>     > >> @@ -9,7 +9,9 @@
>     > >>
>     > >>  # It also has some helper functions and it's responsible for
>     actually starting the tests
>     > >>
>     > >> -import os, re, sys
>     > >> +import os
>     > >> +import re
>     > >> +import sys
>     > >>  import unittest
>     > >>  import inspect
>     > >>  import subprocess
>     > >> diff --git a/meta/lib/oeqa/sdk/case.py
>     <https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$>
>     b/meta/lib/oeqa/sdk/case.py
>     <https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$>
>     > >> index c45882689c..86ac199197 100644
>     > >> --- a/meta/lib/oeqa/sdk/case.py
>     <https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$>
>     > >> +++ b/meta/lib/oeqa/sdk/case.py
>     <https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$>
>     > >> @@ -35,7 +35,8 @@ class OESDKTestCase(OETestCase):
>     > >>          OS/architecture, or if not specified the currently
>     configured MACHINE's
>     > >>          OS/architecture.
>     > >>          """
>     > >> -        import oe.qa
>     <https://urldefense.com/v3/__http://oe.qa__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7-ldEI_g$>,
>     oe.elf
>     > >> +        import oe.qa
>     <https://urldefense.com/v3/__http://oe.qa__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7-ldEI_g$>
>     > >> +        import oe.elf
>     > >>
>     > >>          if not target_os or not target_arch:
>     > >>              output = self._run("echo
>     $OECORE_TARGET_OS:$OECORE_TARGET_ARCH")
>     > >> diff --git a/meta/lib/oeqa/sdk/cases/buildlzip.py
>     <https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$>
>     b/meta/lib/oeqa/sdk/cases/buildlzip.py
>     <https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$>
>     > >> index 49ae756bf3..04c4a0ec16 100644
>     > >> --- a/meta/lib/oeqa/sdk/cases/buildlzip.py
>     <https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$>
>     > >> +++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
>     <https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$>
>     > >> @@ -2,7 +2,10 @@
>     > >>  # SPDX-License-Identifier: MIT
>     > >>  #
>     > >>
>     > >> -import os, tempfile, subprocess, unittest
>     > >> +import os
>     > >> +import tempfile
>     > >> +import subprocess
>     > >> +import unittest
>     > >>  from oeqa.sdk.case
>     <https://urldefense.com/v3/__http://oeqa.sdk.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Gb-vXpQ$>
>     import OESDKTestCase
>     > >>  from oeqa.utils.subprocesstweak import errors_have_output
>     > >>  errors_have_output()
>     > >> diff --git a/meta/lib/oeqa/sdk/cases/python.py
>     <https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$>
>     b/meta/lib/oeqa/sdk/cases/python.py
>     <https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$>
>     > >> index a334abce5f..2848481f33 100644
>     > >> --- a/meta/lib/oeqa/sdk/cases/python.py
>     <https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$>
>     > >> +++ b/meta/lib/oeqa/sdk/cases/python.py
>     <https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$>
>     > >> @@ -2,7 +2,8 @@
>     > >>  # SPDX-License-Identifier: MIT
>     > >>  #
>     > >>
>     > >> -import subprocess, unittest
>     > >> +import subprocess
>     > >> +import unittest
>     > >>  from oeqa.sdk.case
>     <https://urldefense.com/v3/__http://oeqa.sdk.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Gb-vXpQ$>
>     import OESDKTestCase
>     > >>
>     > >>  from oeqa.utils.subprocesstweak import errors_have_output
>     > >> diff --git a/meta/lib/oeqa/sdk/testsdk.py
>     <https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$>
>     b/meta/lib/oeqa/sdk/testsdk.py
>     <https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$>
>     > >> index 35e40187bc..18e03cb8ef 100644
>     > >> --- a/meta/lib/oeqa/sdk/testsdk.py
>     <https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$>
>     > >> +++ b/meta/lib/oeqa/sdk/testsdk.py
>     <https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$>
>     > >> @@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):
>     > >>          processes = d.getVar("TESTIMAGE_NUMBER_THREADS") or
>     d.getVar("BB_NUMBER_THREADS")
>     > >>          if processes:
>     > >>              try:
>     > >> -                import testtools, subunit
>     > >> +                import testtools
>     > >> +                import subunit
>     > >>              except ImportError:
>     > >>                  bb.warn("Failed to import testtools or
>     subunit, the testcases will run serially")
>     > >>                  processes = None
>     > >> diff --git a/meta/lib/oeqa/selftest/cases/oelib/path.py
>     <https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$>
>     b/meta/lib/oeqa/selftest/cases/oelib/path.py
>     <https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$>
>     > >> index a1cfa08c09..098734fa5d 100644
>     > >> --- a/meta/lib/oeqa/selftest/cases/oelib/path.py
>     <https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$>
>     > >> +++ b/meta/lib/oeqa/selftest/cases/oelib/path.py
>     <https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$>
>     > >> @@ -3,7 +3,8 @@
>     > >>  #
>     > >>
>     > >>  from unittest.case
>     <https://urldefense.com/v3/__http://unittest.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5hDRSoKA$>
>     import TestCase
>     > >> -import oe, oe.path
>     > >> +import oe
>     > >> +import oe.path
>     > >>  import tempfile
>     > >>  import os
>     > >>  import errno
>     > >> diff --git a/meta/lib/oeqa/selftest/cases/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     b/meta/lib/oeqa/selftest/cases/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     > >> index 7166c3991f..82aa1bde1c 100644
>     > >> --- a/meta/lib/oeqa/selftest/cases/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     > >> +++ b/meta/lib/oeqa/selftest/cases/package.py
>     <https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$>
>     > >> @@ -5,7 +5,8 @@
>     > >>  from oeqa.selftest.case
>     <https://urldefense.com/v3/__http://oeqa.selftest.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7DFFrF-g$>
>     import OESelftestTestCase
>     > >>  from oeqa.utils.commands import bitbake, get_bb_vars,
>     get_bb_var, runqemu
>     > >>  import stat
>     > >> -import subprocess, os
>     > >> +import subprocess
>     > >> +import os
>     > >>  import oe.path
>     > >>  import re
>     > >>
>     > >> @@ -150,7 +151,9 @@ class PackageTests(OESelftestTestCase):
>     > >>                      self.fail('GDB %s failed' % binary)
>     > >>
>     > >>      def test_preserve_ownership(self):
>     > >> -        import os, stat, oe.cachedpath
>     > >> +        import os
>     > >> +        import stat
>     > >> +        import oe.cachedpath
>     > >>          features = 'IMAGE_INSTALL_append = " selftest-chown"\n'
>     > >>          self.write_config(features)
>     > >>          bitbake("core-image-minimal")
>     > >> diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py
>     <https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$>
>     b/meta/lib/oeqa/selftest/cases/runtime_test.py
>     <https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$>
>     > >> index d0c2440722..54a80dfdc0 100644
>     > >> --- a/meta/lib/oeqa/selftest/cases/runtime_test.py
>     <https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$>
>     > >> +++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
>     <https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$>
>     > >> @@ -211,7 +211,8 @@ class TestImage(OESelftestTestCase):
>     > >>          Product: oe-core
>     > >>          Author: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>     > >>          """
>     > >> -        import subprocess, os
>     > >> +        import subprocess
>     > >> +        import os
>     > >>          try:
>     > >>              content = os.listdir("/dev/dri")
>     > >>              if len([i for i in content if
>     i.startswith('render')]) == 0:
>     > >> diff --git a/meta/lib/oeqa/utils/testexport.py
>     <https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$>
>     b/meta/lib/oeqa/utils/testexport.py
>     <https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$>
>     > >> index e89d130a9c..383e57a6b2 100644
>     > >> --- a/meta/lib/oeqa/utils/testexport.py
>     <https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$>
>     > >> +++ b/meta/lib/oeqa/utils/testexport.py
>     <https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$>
>     > >> @@ -6,7 +6,11 @@
>     > >>
>     > >>  # Provides functions to help with exporting binaries
>     obtained from built targets
>     > >>
>     > >> -import os, re, glob as g, shutil as sh,sys
>     > >> +import os
>     > >> +import re
>     > >> +import glob as g
>     > >> +import shutil as sh
>     > >> +import sys
>     > >>  from time import sleep
>     > >>  from .commands import runCmd
>     > >>  from difflib import SequenceMatcher as SM
>     > >> diff --git
>     a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
>     <https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$>
>     b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
>     <https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$>
>     > >> index 86c7c1811a..75c01b83bf 100644
>     > >> ---
>     a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
>     <https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$>
>     > >> +++
>     b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/template.py
>     <https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$>
>     > >> @@ -28,7 +28,9 @@
>     > >>  # of the executable from argv[0] and emulate the
>     corresponding program, so
>     > >>  # multiple copies of this script will exist under different
>     names.
>     > >>
>     > >> -import sys, os, argparse
>     > >> +import sys
>     > >> +import os
>     > >> +import argparse
>     > >>
>     > >>
>     > >>  this_binary = sys.argv[0].split("/")[-1]
>     > >> diff --git a/scripts/combo-layer b/scripts/combo-layer
>     > >> index 045de65642..835a6bcd09 100755
>     > >> --- a/scripts/combo-layer
>     > >> +++ b/scripts/combo-layer
>     > >> @@ -11,7 +11,8 @@
>     > >>  #
>     > >>
>     > >>  import fnmatch
>     > >> -import os, sys
>     > >> +import os
>     > >> +import sys
>     > >>  import optparse
>     > >>  import logging
>     > >>  import subprocess
>     > >> diff --git a/scripts/contrib/patchreview.py
>     <https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$>
>     b/scripts/contrib/patchreview.py
>     <https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$>
>     > >> index 62c509f51c..744dcfb49e 100755
>     > >> --- a/scripts/contrib/patchreview.py
>     <https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$>
>     > >> +++ b/scripts/contrib/patchreview.py
>     <https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$>
>     > >> @@ -40,7 +40,8 @@ def blame_patch(patch):
>     > >>                                      "--",
>     patch)).decode("utf-8").splitlines()
>     > >>
>     > >>  def patchreview(path, patches):
>     > >> -    import re, os.path
>     > >> +    import re
>     > >> +    import os.path
>     > >>
>     > >>      # General pattern: start of line, optional whitespace,
>     tag with optional
>     > >>      # hyphen or spaces, maybe a colon, some whitespace, then
>     the value, all case
>     > >> @@ -198,7 +199,9 @@ def histogram(results):
>     > >>
>     > >>
>     > >>  if __name__ == "__main__":
>     > >> -    import argparse, subprocess, os
>     > >> +    import argparse
>     > >> +    import subprocess
>     > >> +    import os
>     > >>
>     > >>      args = argparse.ArgumentParser(description="Patch Review
>     Tool")
>     > >>      args.add_argument("-b", "--blame", action="store_true",
>     help="show blame for malformed patches")
>     > >> @@ -213,7 +216,9 @@ if __name__ == "__main__":
>     > >>      analyse(results, want_blame=args.blame,
>     verbose=args.verbose)
>     > >>
>     > >>      if args.json:
>     > >> -        import json, os.path, collections
>     > >> +        import json
>     > >> +        import os.path
>     > >> +        import collections
>     > >>          if os.path.isfile(args.json):
>     > >>              data = json.load(open(args.json))
>     > >>          else:
>     > >> diff --git a/scripts/lnr b/scripts/lnr
>     > >> index a2ac4fec0f..e223b1e0e6 100755
>     > >> --- a/scripts/lnr
>     > >> +++ b/scripts/lnr
>     > >> @@ -6,7 +6,8 @@
>     > >>  # Create a *relative* symlink, just like ln --relative does
>     but without needing
>     > >>  # coreutils 8.16.
>     > >>
>     > >> -import sys, os
>     > >> +import sys
>     > >> +import os
>     > >>
>     > >>  if len(sys.argv) != 3:
>     > >>     print("$ lnr TARGET LINK_NAME")
>     > >> diff --git a/scripts/oe-pkgdata-browser
>     b/scripts/oe-pkgdata-browser
>     > >> index 8d223185a4..5834f59845 100755
>     > >> --- a/scripts/oe-pkgdata-browser
>     > >> +++ b/scripts/oe-pkgdata-browser
>     > >> @@ -1,6 +1,9 @@
>     > >>  #! /usr/bin/env python3
>     > >>
>     > >> -import os, sys, enum, ast
>     > >> +import os
>     > >> +import sys
>     > >> +import enum
>     > >> +import ast
>     > >>
>     > >>  scripts_path = os.path.dirname(os.path.realpath(__file__))
>     > >>  lib_path = scripts_path + '/lib'
>     > >> diff --git
>     a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
>     <https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$>
>     b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
>     <https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$>
>     > >> index 00fb3bf797..c005cf341f 100644
>     > >> ---
>     a/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
>     <https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$>
>     > >> +++
>     b/scripts/pybootchartgui/pybootchartgui/tests/parser_test.py
>     <https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$>
>     > >> @@ -1,4 +1,9 @@
>     > >> -import sys, os, re, struct, operator, math
>     > >> +import sys
>     > >> +import os
>     > >> +import re
>     > >> +import struct
>     > >> +import operator
>     > >> +import math
>     > >>  from collections import defaultdict
>     > >>  import unittest
>     > >>
>     > >> diff --git a/scripts/send-error-report
>     b/scripts/send-error-report
>     > >> index cfbcaa52cb..ffa0a199b1 100755
>     > >> --- a/scripts/send-error-report
>     > >> +++ b/scripts/send-error-report
>     > >> @@ -10,7 +10,8 @@
>     > >>  # SPDX-License-Identifier: GPL-2.0-only
>     > >>  #
>     > >>
>     > >> -import urllib.request, urllib.error
>     > >> +import urllib.request
>     > >> +import urllib.error
>     > >>  import sys
>     > >>  import json
>     > >>  import os
>     > >> diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
>     > >> index 14d8c298e9..a63f6c8115 100755
>     > >> --- a/scripts/verify-bashisms
>     > >> +++ b/scripts/verify-bashisms
>     > >> @@ -3,7 +3,11 @@
>     > >>  # SPDX-License-Identifier: GPL-2.0-only
>     > >>  #
>     > >>
>     > >> -import sys, os, subprocess, re, shutil
>     > >> +import sys
>     > >> +import os
>     > >> +import subprocess
>     > >> +import re
>     > >> +import shutil
>     > >>
>     > >>  whitelist = (
>     > >>      # type is supported by dash
>     > >> @@ -92,7 +96,8 @@ def get_tinfoil():
>     > >>      return tinfoil
>     > >>
>     > >>  if __name__=='__main__':
>     > >> -    import argparse, shutil
>     > >> +    import argparse
>     > >> +    import shutil
>     > >>
>     > >>      parser = argparse.ArgumentParser(description='Bashim
>     detector for shell fragments in recipes.')
>     > >>      parser.add_argument("recipes", metavar="RECIPE",
>     nargs="*", help="recipes to check (if not specified, all will be
>     checked)")
>     > >> --
>     > >> 2.32.0
>     > >>
>     > >>
>     > >>
>     > >>
>
>
>
> 
>


--------------FA36224A91EFF2C5ECC2FC08
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 06/29/2021 03:47 AM, Alexander
      Kanavin wrote:<br>
    </div>
    <blockquote cite="mid:CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com" type="cite">
      
      <div dir="ltr">
        <div>I just generally disagree with the idea that changing a = b
          to a=b, or import a,b to import a\nimport b helps readability
          or reduces confusion.<br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    Writing 'a =b' is acceptable, as it's not causing runtime problem.
    However, keeping a consistent 'a=b' is better. Isn't it?<br>
    Just think about writing
'a=&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    b'? Is it acceptable?<br>
    I think patches to make codes have a consistent style are good.<br>
    <br>
    <blockquote cite="mid:CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com" type="cite">
      <div dir="ltr">
        <div>I'm reading a lot of python code all the time, and never
          once have been confused by inconsistent whitespace. <br>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    No one confuses. But consistent codes give people better impression.<br>
    <br>
    <blockquote cite="mid:CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com" type="cite">
      <div dir="ltr">
        <div>Can the linter fix anything else, which has actual benefit?</div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <br>
    Keeping codes in the same style is the actual benefit.<br>
    <br>
    People might not have time to do the check and send out patches, but
    if someone has already done that and sent out patches, why not
    accept the patches?<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:CANNYZj9EGpuL43yGADeGXfjhhGB8EnghfzC8Zee4N=gUdBi4Dw@mail.gmail.com" type="cite">
      <div dir="ltr">
        <div>Alex<br>
        </div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Mon, 28 Jun 2021 at 21:41,
          Khem Raj &lt;<a moz-do-not-send="true" href="mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On
          Mon, Jun 28, 2021 at 12:25 PM Persian Prince &lt;<a moz-do-not-send="true" href="mailto:persianpros@yahoo.com" target="_blank">persianpros@yahoo.com</a>&gt; wrote:<br>
          &gt;<br>
          &gt; When we can follow PEP8 we should as it's how developers
          could follow a common coding style and avoid creating
          different files.<br>
          &gt;<br>
          &gt; In &quot;Safe PEP8&quot; PRs some PEP8 codes carefully added so it
          won't change tabs to spaces but makes the code cleaner in a
          safe way. PEP8 also fixes some small problems (won't do huge
          changes like futurize) which is good and sometime we miss them
          by mistake.<br>
          &gt;<br>
          &gt; We at <a moz-do-not-send="true" href="https://urldefense.com/v3/__https://github.com/OpenVisionE2__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6QWMweTw$" rel="noreferrer" target="_blank">https://github.com/OpenVisionE2</a>
          , <a moz-do-not-send="true" href="https://urldefense.com/v3/__https://github.com/oe-alliance__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6ROP1INw$" rel="noreferrer" target="_blank">https://github.com/oe-alliance</a>
          and <a moz-do-not-send="true" href="https://urldefense.com/v3/__https://github.com/OpenPLi__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7D6O7-Kg$" rel="noreferrer" target="_blank">https://github.com/OpenPLi</a>
          applied safe PEP8 changes to so many repositories and we're
          using it via <a moz-do-not-send="true" href="https://urldefense.com/v3/__http://PEP8.sh__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy4ewWfxFw$">PEP8.sh</a>
          on GitHub Actions as an online cleaner tool. (<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://PEP8.sh__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy4ewWfxFw$">PEP8.sh</a>:
          <a moz-do-not-send="true" href="https://urldefense.com/v3/__https://github.com/OpenVisionE2/enigma2-openvision/blob/develop/CI/PEP8.sh__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7J7fBYZQ$" rel="noreferrer" target="_blank">https://github.com/OpenVisionE2/enigma2-openvision/blob/develop/CI/PEP8.sh</a>)<br>
          &gt;<br>
          &gt; Also applied before on <a moz-do-not-send="true" href="https://urldefense.com/v3/__https://github.com/openembedded/meta-openembedded__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy4qmKWVZQ$" rel="noreferrer" target="_blank">https://github.com/openembedded/meta-openembedded</a>
          which is why that repo is clean and won't need a PR (for now),
          keep in mind that these are common standards so even if we
          don't like them that much still they help for having a good
          common style and less mistakes.<br>
          &gt;<br>
          &gt; If you needed more assistance from me please don't
          hesitate to ask, I'm all in.<br>
          <br>
          <br>
          can you improve the commit msgs in pull request as asked.<br>
          <br>
          &gt;<br>
          &gt; Regards,<br>
          &gt; Persian Prince<br>
          &gt;<br>
          &gt; On Monday, June 28, 2021, 10:56:40 AM GMT+4:30, Alexander
          Kanavin &lt;<a moz-do-not-send="true" href="mailto:alex.kanavin@gmail.com" target="_blank">alex.kanavin@gmail.com</a>&gt;
          wrote:<br>
          &gt;<br>
          &gt;<br>
          &gt; Right, but can you please write something more
          descriptive than &quot;PEP8 double aggressive W291 ~ W293 and W391&quot;
          ?<br>
          &gt;<br>
          &gt; Also I'm not sure fiddling about with whitespace or
          whether imports all need their own line really helps.<br>
          &gt;<br>
          &gt; Alex<br>
          &gt;<br>
          &gt; On Mon, 28 Jun 2021 at 08:16, Khem Raj &lt;<a moz-do-not-send="true" href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
          &gt;<br>
          &gt; On Sun, Jun 27, 2021 at 11:13 PM Alexander Kanavin<br>
          &gt; &lt;<a moz-do-not-send="true" href="mailto:alex.kanavin@gmail.com" target="_blank">alex.kanavin@gmail.com</a>&gt;
          wrote:<br>
          &gt; &gt;<br>
          &gt; &gt; Wait, what is this patchset all about?<br>
          &gt; &gt;<br>
          &gt;<br>
          &gt; its fixes for python linter (pylint) found issues.<br>
          &gt;<br>
          &gt; &gt; Alex<br>
          &gt; &gt;<br>
          &gt; &gt; On Mon, 28 Jun 2021 at 07:59, Khem Raj &lt;<a moz-do-not-send="true" href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; From: persianpros &lt;<a moz-do-not-send="true" href="mailto:persianpros@yahoo.com" target="_blank">persianpros@yahoo.com</a>&gt;<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; Signed-off-by: Khem Raj &lt;<a moz-do-not-send="true" href="mailto:raj.khem@gmail.com" target="_blank">raj.khem@gmail.com</a>&gt;<br>
          &gt; &gt;&gt; ---<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oe/package.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; |&nbsp; 9 +++++++--<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oe/qa.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 +++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oe/utils.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; |&nbsp; 6 ++++--<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/oetest.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 4 +++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/sdk/case.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/sdk/cases/buildlzip.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; |&nbsp; 5 ++++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/sdk/cases/python.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/sdk/testsdk.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; |&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/selftest/cases/oelib/path.py&nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; |&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/selftest/cases/package.py&nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 7 +++++--<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/selftest/cases/runtime_test.py&nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; |&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; meta/lib/oeqa/utils/testexport.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 6 +++++-<br>
          &gt; &gt;&gt;&nbsp;
          .../texinfo-dummy-native/texinfo-dummy/template.py&nbsp; &nbsp; |&nbsp; 4
          +++-<br>
          &gt; &gt;&gt;&nbsp; scripts/combo-layer&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; scripts/contrib/patchreview.py&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; | 11 ++++++++---<br>
          &gt; &gt;&gt;&nbsp; scripts/lnr&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; scripts/oe-pkgdata-browser&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; |&nbsp; 5 ++++-<br>
          &gt; &gt;&gt;&nbsp; .../pybootchartgui/tests/parser_test.py&nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 7 ++++++-<br>
          &gt; &gt;&gt;&nbsp; scripts/send-error-report&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 3 ++-<br>
          &gt; &gt;&gt;&nbsp; scripts/verify-bashisms&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
          &nbsp; &nbsp; &nbsp; &nbsp;|&nbsp; 9 +++++++--<br>
          &gt; &gt;&gt;&nbsp; 20 files changed, 75 insertions(+), 26
          deletions(-)<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a>
          b/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a><br>
          &gt; &gt;&gt; index dd700cbb0c..fc5408d5f8 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a><br>
          &gt; &gt;&gt; @@ -107,7 +107,10 @@ def strip_execs(pn, dstdir,
          strip_cmd, libdir, base_libdir, d, qa_already_stripp<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; :param qa_already_stripped: Set to True if
          already-stripped' in ${INSANE_SKIP}<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; This is for proper logging and messages
          only.<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &quot;&quot;&quot;<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; import stat, errno, oe.path, oe.utils<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import stat<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import errno<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import oe.path<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import oe.utils<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; elffiles = {}<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; inodes = {}<br>
          &gt; &gt;&gt; @@ -187,7 +190,9 @@ def file_translate(file):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; return ft<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; def filedeprunner(arg):<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; import re, subprocess, shlex<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import re<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import subprocess<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import shlex<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; (pkg, pkgfiles, rpmdeps, pkgdest) = arg<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; provides = {}<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$">qa.py</a>
          b/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$">qa.py</a><br>
          &gt; &gt;&gt; index e8a854a302..38c2e0cc1c 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$">qa.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://qa.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6YqI4STw$">qa.py</a><br>
          &gt; &gt;&gt; @@ -2,7 +2,9 @@<br>
          &gt; &gt;&gt;&nbsp; # SPDX-License-Identifier: GPL-2.0-only<br>
          &gt; &gt;&gt;&nbsp; #<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import os, struct, mmap<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import struct<br>
          &gt; &gt;&gt; +import mmap<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; class NotELFFileError(Exception):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; pass<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$">utils.py</a>
          b/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$">utils.py</a><br>
          &gt; &gt;&gt; index a84039f585..789bad33f6 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$">utils.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oe/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://utils.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6STLfBVA$">utils.py</a><br>
          &gt; &gt;&gt; @@ -376,7 +376,8 @@ def
          format_pkg_list(pkg_dict, ret_format=None):<br>
          &gt; &gt;&gt;&nbsp; # Helper function to get the host compiler
          version<br>
          &gt; &gt;&gt;&nbsp; # Do not assume the compiler is gcc<br>
          &gt; &gt;&gt;&nbsp; def get_host_compiler_version(d,
          taskcontextonly=False):<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; import re, subprocess<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import re<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import subprocess<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; if taskcontextonly and
          d.getVar('BB_WORKERCONTEXT') != '1':<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return<br>
          &gt; &gt;&gt; @@ -404,7 +405,8 @@ def
          get_host_compiler_version(d, taskcontextonly=False):<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; def host_gcc_version(d, taskcontextonly=False):<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; import re, subprocess<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import re<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import subprocess<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; if taskcontextonly and
          d.getVar('BB_WORKERCONTEXT') != '1':<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$">oetest.py</a>
          b/meta/lib/oeqa/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$">oetest.py</a><br>
          &gt; &gt;&gt; index 9c84466dd0..3136ac2ce5 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$">oetest.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oetest.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6scn-4-A$">oetest.py</a><br>
          &gt; &gt;&gt; @@ -9,7 +9,9 @@<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; # It also has some helper functions and it's
          responsible for actually starting the tests<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import os, re, sys<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import re<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt;&nbsp; import unittest<br>
          &gt; &gt;&gt;&nbsp; import inspect<br>
          &gt; &gt;&gt;&nbsp; import subprocess<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$">case.py</a>
          b/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$">case.py</a><br>
          &gt; &gt;&gt; index c45882689c..86ac199197 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$">case.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://case.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7BrLqZVA$">case.py</a><br>
          &gt; &gt;&gt; @@ -35,7 +35,8 @@ class
          OESDKTestCase(OETestCase):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OS/architecture, or if not specified
          the currently configured MACHINE's<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; OS/architecture.<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;&quot;&quot;<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; import <a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oe.qa__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7-ldEI_g$" rel="noreferrer" target="_blank">oe.qa</a>, oe.elf<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import <a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oe.qa__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7-ldEI_g$" rel="noreferrer" target="_blank">oe.qa</a><br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import oe.elf<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if not target_os or not target_arch:<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; output = self._run(&quot;echo
          $OECORE_TARGET_OS:$OECORE_TARGET_ARCH&quot;)<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$">buildlzip.py</a>
          b/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$">buildlzip.py</a><br>
          &gt; &gt;&gt; index 49ae756bf3..04c4a0ec16 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$">buildlzip.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://buildlzip.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5l5mkGMQ$">buildlzip.py</a><br>
          &gt; &gt;&gt; @@ -2,7 +2,10 @@<br>
          &gt; &gt;&gt;&nbsp; # SPDX-License-Identifier: MIT<br>
          &gt; &gt;&gt;&nbsp; #<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import os, tempfile, subprocess, unittest<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import tempfile<br>
          &gt; &gt;&gt; +import subprocess<br>
          &gt; &gt;&gt; +import unittest<br>
          &gt; &gt;&gt;&nbsp; from <a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oeqa.sdk.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Gb-vXpQ$">oeqa.sdk.case</a>
          import OESDKTestCase<br>
          &gt; &gt;&gt;&nbsp; from oeqa.utils.subprocesstweak import
          errors_have_output<br>
          &gt; &gt;&gt;&nbsp; errors_have_output()<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$">python.py</a>
          b/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$">python.py</a><br>
          &gt; &gt;&gt; index a334abce5f..2848481f33 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$">python.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://python.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy537RZTpg$">python.py</a><br>
          &gt; &gt;&gt; @@ -2,7 +2,8 @@<br>
          &gt; &gt;&gt;&nbsp; # SPDX-License-Identifier: MIT<br>
          &gt; &gt;&gt;&nbsp; #<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import subprocess, unittest<br>
          &gt; &gt;&gt; +import subprocess<br>
          &gt; &gt;&gt; +import unittest<br>
          &gt; &gt;&gt;&nbsp; from <a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oeqa.sdk.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Gb-vXpQ$">oeqa.sdk.case</a>
          import OESDKTestCase<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; from oeqa.utils.subprocesstweak import
          errors_have_output<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$">testsdk.py</a>
          b/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$">testsdk.py</a><br>
          &gt; &gt;&gt; index 35e40187bc..18e03cb8ef 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$">testsdk.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/sdk/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testsdk.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5SgZYgvA$">testsdk.py</a><br>
          &gt; &gt;&gt; @@ -95,7 +95,8 @@ class TestSDK(TestSDKBase):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; processes =
          d.getVar(&quot;TESTIMAGE_NUMBER_THREADS&quot;) or
          d.getVar(&quot;BB_NUMBER_THREADS&quot;)<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if processes:<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; try:<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; import testtools, subunit<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; import testtools<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; import subunit<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; except ImportError:<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bb.warn(&quot;Failed to import
          testtools or subunit, the testcases will run serially&quot;)<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; processes = None<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/oelib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$">path.py</a>
          b/meta/lib/oeqa/selftest/cases/oelib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$">path.py</a><br>
          &gt; &gt;&gt; index a1cfa08c09..098734fa5d 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/selftest/cases/oelib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$">path.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/oelib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://path.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5tKYWegg$">path.py</a><br>
          &gt; &gt;&gt; @@ -3,7 +3,8 @@<br>
          &gt; &gt;&gt;&nbsp; #<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; from <a moz-do-not-send="true" href="https://urldefense.com/v3/__http://unittest.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5hDRSoKA$">unittest.case</a>
          import TestCase<br>
          &gt; &gt;&gt; -import oe, oe.path<br>
          &gt; &gt;&gt; +import oe<br>
          &gt; &gt;&gt; +import oe.path<br>
          &gt; &gt;&gt;&nbsp; import tempfile<br>
          &gt; &gt;&gt;&nbsp; import os<br>
          &gt; &gt;&gt;&nbsp; import errno<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a>
          b/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a><br>
          &gt; &gt;&gt; index 7166c3991f..82aa1bde1c 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://package.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6Xt2kV5g$">package.py</a><br>
          &gt; &gt;&gt; @@ -5,7 +5,8 @@<br>
          &gt; &gt;&gt;&nbsp; from <a moz-do-not-send="true" href="https://urldefense.com/v3/__http://oeqa.selftest.case__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7DFFrF-g$">oeqa.selftest.case</a>
          import OESelftestTestCase<br>
          &gt; &gt;&gt;&nbsp; from oeqa.utils.commands import bitbake,
          get_bb_vars, get_bb_var, runqemu<br>
          &gt; &gt;&gt;&nbsp; import stat<br>
          &gt; &gt;&gt; -import subprocess, os<br>
          &gt; &gt;&gt; +import subprocess<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt;&nbsp; import oe.path<br>
          &gt; &gt;&gt;&nbsp; import re<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; @@ -150,7 +151,9 @@ class
          PackageTests(OESelftestTestCase):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.fail('GDB %s failed' %
          binary)<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; def test_preserve_ownership(self):<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; import os, stat, oe.cachedpath<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import os<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import stat<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import oe.cachedpath<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; features = 'IMAGE_INSTALL_append = &quot;
          selftest-chown&quot;\n'<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; self.write_config(features)<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bitbake(&quot;core-image-minimal&quot;)<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$">runtime_test.py</a>
          b/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$">runtime_test.py</a><br>
          &gt; &gt;&gt; index d0c2440722..54a80dfdc0 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$">runtime_test.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/selftest/cases/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://runtime_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy7K5nXSVA$">runtime_test.py</a><br>
          &gt; &gt;&gt; @@ -211,7 +211,8 @@ class
          TestImage(OESelftestTestCase):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Product: oe-core<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Author: Alexander Kanavin &lt;<a moz-do-not-send="true" href="mailto:alex.kanavin@gmail.com" target="_blank">alex.kanavin@gmail.com</a>&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;&quot;&quot;<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; import subprocess, os<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import subprocess<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import os<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; try:<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; content = os.listdir(&quot;/dev/dri&quot;)<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if len([i for i in content if
          i.startswith('render')]) == 0:<br>
          &gt; &gt;&gt; diff --git a/meta/lib/oeqa/utils/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$">testexport.py</a>
          b/meta/lib/oeqa/utils/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$">testexport.py</a><br>
          &gt; &gt;&gt; index e89d130a9c..383e57a6b2 100644<br>
          &gt; &gt;&gt; --- a/meta/lib/oeqa/utils/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$">testexport.py</a><br>
          &gt; &gt;&gt; +++ b/meta/lib/oeqa/utils/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://testexport.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy44sHiuPg$">testexport.py</a><br>
          &gt; &gt;&gt; @@ -6,7 +6,11 @@<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; # Provides functions to help with exporting
          binaries obtained from built targets<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import os, re, glob as g, shutil as sh,sys<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import re<br>
          &gt; &gt;&gt; +import glob as g<br>
          &gt; &gt;&gt; +import shutil as sh<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt;&nbsp; from time import sleep<br>
          &gt; &gt;&gt;&nbsp; from .commands import runCmd<br>
          &gt; &gt;&gt;&nbsp; from difflib import SequenceMatcher as SM<br>
          &gt; &gt;&gt; diff --git
          a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$">template.py</a>
          b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$">template.py</a><br>
          &gt; &gt;&gt; index 86c7c1811a..75c01b83bf 100644<br>
          &gt; &gt;&gt; ---
          a/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$">template.py</a><br>
          &gt; &gt;&gt; +++
          b/meta/recipes-extended/texinfo-dummy-native/texinfo-dummy/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://template.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy46Kyz-6A$">template.py</a><br>
          &gt; &gt;&gt; @@ -28,7 +28,9 @@<br>
          &gt; &gt;&gt;&nbsp; # of the executable from argv[0] and emulate
          the corresponding program, so<br>
          &gt; &gt;&gt;&nbsp; # multiple copies of this script will exist
          under different names.<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import sys, os, argparse<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import argparse<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; this_binary = sys.argv[0].split(&quot;/&quot;)[-1]<br>
          &gt; &gt;&gt; diff --git a/scripts/combo-layer
          b/scripts/combo-layer<br>
          &gt; &gt;&gt; index 045de65642..835a6bcd09 100755<br>
          &gt; &gt;&gt; --- a/scripts/combo-layer<br>
          &gt; &gt;&gt; +++ b/scripts/combo-layer<br>
          &gt; &gt;&gt; @@ -11,7 +11,8 @@<br>
          &gt; &gt;&gt;&nbsp; #<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; import fnmatch<br>
          &gt; &gt;&gt; -import os, sys<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt;&nbsp; import optparse<br>
          &gt; &gt;&gt;&nbsp; import logging<br>
          &gt; &gt;&gt;&nbsp; import subprocess<br>
          &gt; &gt;&gt; diff --git a/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$">patchreview.py</a>
          b/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$">patchreview.py</a><br>
          &gt; &gt;&gt; index 62c509f51c..744dcfb49e 100755<br>
          &gt; &gt;&gt; --- a/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$">patchreview.py</a><br>
          &gt; &gt;&gt; +++ b/scripts/contrib/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://patchreview.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy5Nhshvrg$">patchreview.py</a><br>
          &gt; &gt;&gt; @@ -40,7 +40,8 @@ def blame_patch(patch):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &quot;--&quot;,
          patch)).decode(&quot;utf-8&quot;).splitlines()<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; def patchreview(path, patches):<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; import re, os.path<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import re<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import os.path<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; # General pattern: start of line, optional
          whitespace, tag with optional<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; # hyphen or spaces, maybe a colon, some
          whitespace, then the value, all case<br>
          &gt; &gt;&gt; @@ -198,7 +199,9 @@ def histogram(results):<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; if __name__ == &quot;__main__&quot;:<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; import argparse, subprocess, os<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import argparse<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import subprocess<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import os<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; args =
          argparse.ArgumentParser(description=&quot;Patch Review Tool&quot;)<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; args.add_argument(&quot;-b&quot;, &quot;--blame&quot;,
          action=&quot;store_true&quot;, help=&quot;show blame for malformed patches&quot;)<br>
          &gt; &gt;&gt; @@ -213,7 +216,9 @@ if __name__ == &quot;__main__&quot;:<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; analyse(results, want_blame=args.blame,
          verbose=args.verbose)<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; if args.json:<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; &nbsp; &nbsp; import json, os.path, collections<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import json<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import os.path<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; import collections<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if os.path.isfile(args.json):<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data = json.load(open(args.json))<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; else:<br>
          &gt; &gt;&gt; diff --git a/scripts/lnr b/scripts/lnr<br>
          &gt; &gt;&gt; index a2ac4fec0f..e223b1e0e6 100755<br>
          &gt; &gt;&gt; --- a/scripts/lnr<br>
          &gt; &gt;&gt; +++ b/scripts/lnr<br>
          &gt; &gt;&gt; @@ -6,7 +6,8 @@<br>
          &gt; &gt;&gt;&nbsp; # Create a *relative* symlink, just like ln
          --relative does but without needing<br>
          &gt; &gt;&gt;&nbsp; # coreutils 8.16.<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import sys, os<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; if len(sys.argv) != 3:<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp;print(&quot;$ lnr TARGET LINK_NAME&quot;)<br>
          &gt; &gt;&gt; diff --git a/scripts/oe-pkgdata-browser
          b/scripts/oe-pkgdata-browser<br>
          &gt; &gt;&gt; index 8d223185a4..5834f59845 100755<br>
          &gt; &gt;&gt; --- a/scripts/oe-pkgdata-browser<br>
          &gt; &gt;&gt; +++ b/scripts/oe-pkgdata-browser<br>
          &gt; &gt;&gt; @@ -1,6 +1,9 @@<br>
          &gt; &gt;&gt;&nbsp; #! /usr/bin/env python3<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import os, sys, enum, ast<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt; +import enum<br>
          &gt; &gt;&gt; +import ast<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; scripts_path =
          os.path.dirname(os.path.realpath(__file__))<br>
          &gt; &gt;&gt;&nbsp; lib_path = scripts_path + '/lib'<br>
          &gt; &gt;&gt; diff --git
          a/scripts/pybootchartgui/pybootchartgui/tests/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$">parser_test.py</a>
          b/scripts/pybootchartgui/pybootchartgui/tests/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$">parser_test.py</a><br>
          &gt; &gt;&gt; index 00fb3bf797..c005cf341f 100644<br>
          &gt; &gt;&gt; ---
          a/scripts/pybootchartgui/pybootchartgui/tests/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$">parser_test.py</a><br>
          &gt; &gt;&gt; +++
          b/scripts/pybootchartgui/pybootchartgui/tests/<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://parser_test.py__;%21%21AjveYdw8EvQ%21PBX2J1bie151wgwFSbZUcI0qMyKeL9qCOvFK7-S2MSM0PswWdDWS-j40Sy6G5tNwpg$">parser_test.py</a><br>
          &gt; &gt;&gt; @@ -1,4 +1,9 @@<br>
          &gt; &gt;&gt; -import sys, os, re, struct, operator, math<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import re<br>
          &gt; &gt;&gt; +import struct<br>
          &gt; &gt;&gt; +import operator<br>
          &gt; &gt;&gt; +import math<br>
          &gt; &gt;&gt;&nbsp; from collections import defaultdict<br>
          &gt; &gt;&gt;&nbsp; import unittest<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; diff --git a/scripts/send-error-report
          b/scripts/send-error-report<br>
          &gt; &gt;&gt; index cfbcaa52cb..ffa0a199b1 100755<br>
          &gt; &gt;&gt; --- a/scripts/send-error-report<br>
          &gt; &gt;&gt; +++ b/scripts/send-error-report<br>
          &gt; &gt;&gt; @@ -10,7 +10,8 @@<br>
          &gt; &gt;&gt;&nbsp; # SPDX-License-Identifier: GPL-2.0-only<br>
          &gt; &gt;&gt;&nbsp; #<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import urllib.request, urllib.error<br>
          &gt; &gt;&gt; +import urllib.request<br>
          &gt; &gt;&gt; +import urllib.error<br>
          &gt; &gt;&gt;&nbsp; import sys<br>
          &gt; &gt;&gt;&nbsp; import json<br>
          &gt; &gt;&gt;&nbsp; import os<br>
          &gt; &gt;&gt; diff --git a/scripts/verify-bashisms
          b/scripts/verify-bashisms<br>
          &gt; &gt;&gt; index 14d8c298e9..a63f6c8115 100755<br>
          &gt; &gt;&gt; --- a/scripts/verify-bashisms<br>
          &gt; &gt;&gt; +++ b/scripts/verify-bashisms<br>
          &gt; &gt;&gt; @@ -3,7 +3,11 @@<br>
          &gt; &gt;&gt;&nbsp; # SPDX-License-Identifier: GPL-2.0-only<br>
          &gt; &gt;&gt;&nbsp; #<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; -import sys, os, subprocess, re, shutil<br>
          &gt; &gt;&gt; +import sys<br>
          &gt; &gt;&gt; +import os<br>
          &gt; &gt;&gt; +import subprocess<br>
          &gt; &gt;&gt; +import re<br>
          &gt; &gt;&gt; +import shutil<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; whitelist = (<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; # type is supported by dash<br>
          &gt; &gt;&gt; @@ -92,7 +96,8 @@ def get_tinfoil():<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; return tinfoil<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; if __name__=='__main__':<br>
          &gt; &gt;&gt; -&nbsp; &nbsp; import argparse, shutil<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import argparse<br>
          &gt; &gt;&gt; +&nbsp; &nbsp; import shutil<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; parser =
          argparse.ArgumentParser(description='Bashim detector for shell
          fragments in recipes.')<br>
          &gt; &gt;&gt;&nbsp; &nbsp; &nbsp; parser.add_argument(&quot;recipes&quot;,
          metavar=&quot;RECIPE&quot;, nargs=&quot;*&quot;, help=&quot;recipes to check (if not
          specified, all will be checked)&quot;)<br>
          &gt; &gt;&gt; --<br>
          &gt; &gt;&gt; 2.32.0<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt;<br>
          &gt; &gt;&gt; <br>
          &gt; &gt;&gt;<br>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------FA36224A91EFF2C5ECC2FC08--
