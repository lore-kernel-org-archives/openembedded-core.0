Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web12.5324.1631183206514132488
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 03:26:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=AkMjdX6+;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4886da6ac5=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 189AMpwn030507
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 03:26:45 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=Zrr7mta7G4jMQ1CXRhgQjpramEIqXxshEQm/5MNXVr4=;
 b=AkMjdX6+C5oATb3FgKnGmI9NcqMjElFsxBmZt52AL90JeMro5XhYvozIv4NYlh/ibo+7
 OU92ZQQqLL+wGugCMhwDLlHmG0aGOLx/mRDsPkknZWReAMPCB9IeWx4RSdxplLI9Mdb3
 sbySiwNYrdsEOduwV07y3xSqK8LyepE5KA5/X8jQVZETlMfxASMhOmUVWZyZkK+Xt0b9
 XHbnFILv+wO+Mc83xYnksIierb+4bCQSpfNWdX/p/s9KFXBiyEvao8gSWCXOQOX6JKxq
 9eLQd2lVATA8f7FjdkugDWM+Z+0ZYNntmS3Pyu12GnZLVui+xTOufxmsW0dKF42N5C+J WA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ay7ga0b4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 03:26:45 -0700
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 189AQik0006940
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 03:26:44 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ay7ga0b4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Sep 2021 03:26:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QpHiTR1Vp5aGP87toT58sd5V/lQlVoJmQ6PPXSl9gLO4saiMySFb/Jb6SVKj7Lsb+kKkwMcqFHPM1rgOxiOvhBlizVFCxXH1DhEXrSQwHZgqTMiIw10vbiZEt8YjoOcM0bTFGPgN7eOPkP0Jmefs987RV7S98Y0VT9LG2KNP1kjohYL8qBwVaApORDUq4c+i4QloFoW7uRwIOa6Adq+gF/bZ+rV5MqYrpQ5xsX3Q5pmj/+ywNaEom2z5EEtbPs1ZUEM5taKR6uEelfcbzBCS6n0L7/W3Ihu6814s29+9XwY6zfib/x3P3vELuXml/8Jd2snJNevqGUAeeAhHk5SL3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Zrr7mta7G4jMQ1CXRhgQjpramEIqXxshEQm/5MNXVr4=;
 b=cvktyLNG/gdtvwq7MgvbPdCgoUHAPYNMkEJMghMfY8g+JbA9LLaSJIZYnme+VdAkN/jhwX7dTmMB06DlOb58gjaV0Df+C1a7Hnxh64VXe44ef1yGCXTebCj+u34kKIDOcH+oA4rRBVBchMt0pLEcE1C/dIzpJfO1Oqlt9uycdr/+nJQUr+RbwSoYT9A00cUWzCrWUd5ASqXGXqNe/pwetY0P8xULF+9aXQPaNJbjm0MYBln4rmmMiiWL7IJ8Vedu0ZsWXV6EAiODK36CaPRNgFuuOKQ040MdM+HHHyRfT01oLzDtxC2WB83nHE3U+BkrSmIvg8+EsbQh5J6fos5wwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Thu, 9 Sep
 2021 10:26:43 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%4]) with mapi id 15.20.4500.016; Thu, 9 Sep 2021
 10:26:43 +0000
Subject: Re: [OE-core] [PATCH 0/1] assimp: Remove it
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <CAMKF1soGYd6t=1NaTTnD0482JOZWBx=M2HxDUnmHY8MX-j4aWw@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <5f2fa859-8638-118b-8c5a-d35a6d265a64@windriver.com>
Date: Thu, 9 Sep 2021 18:26:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAMKF1soGYd6t=1NaTTnD0482JOZWBx=M2HxDUnmHY8MX-j4aWw@mail.gmail.com>
X-ClientProxiedBy: HK2PR04CA0044.apcprd04.prod.outlook.com
 (2603:1096:202:14::12) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by HK2PR04CA0044.apcprd04.prod.outlook.com (2603:1096:202:14::12) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Thu, 9 Sep 2021 10:26:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 03d78e6f-26c0-42a2-4c34-08d9737c5174
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB55338D4B7CB30B9414720590FFD59@DM4PR11MB5533.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:254;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NyMIJWZCHdPCWTdj15yBUcMCKuV1lTMKZX8X3+GFfNTbMWVyTap3AkaGOVmGIWZQVNVJzngZ2fKzUa3zxE7kRIc0jyFHpasvJUDrKdfUaZcZqZLNYChNs0exXBk9Ww9wvIny/CpZO/YxuruXTjCMAa9k8/IyK7c4FZMmLtAIUywVCn4ThbWwfAwiuCth+jgAsw99j+6IR9f4EsMuJGIxQ8cawALjx6TBpvdRBwSQP6EQOlEzdzWoZmriqRde0t9MroNOHkUnt5DTpkrJHZdcE+en7q6cXtnI94M/giISutln/DIXGL6CLGimzVBc1DwV2453kFEfH72MTDMHZgf1/7ks5nLPBRnGUoZhonhxdT5wky4Y3p35NWWyALkV59qelogb6ta96nuECWfY77whX39soUhnAyUt6iKl8I7dmhMByehuH8+2C5ptrza4X4k9CmBayO2mUmyeYnBbj8yiEeROrPA5yt5yB7dbQh9OpiV6KG5Qvw2oYQMNeMcc8fe6AQaQRSsu7saKgEjwUDfPeg25fZK8qwXuv15TnbCvpEACXalEsFe154zvQdwBXYQNbGEQJdFvgl772qSzYcFm1cX85Se8MJJgCkA9v0iu1Y78ue8o671+Ix2LLnrnCNxBg0VIAuviTRVzBqTgafNl9mPbaJ06K7ZWu2/m/BuUsK5jImCvVWk9mYyUW/MXmK00w8NEdjVNo7iiOiJ7cvlFwsw7pQLCI9WxXWAP0BFvHkgiEAlBX1Rc9zcWOYrPI0uC2IxPRjrflc+kjwG51nhfBkACI26U8uT32mE/Dk5sOlYryKLE+SQHHSTT4uRy2ak14l106KsQ1VXkWxyiYy5O4K4zHLEKBN7yhfw/Y+tAqMzkTAcpfLH/3nrwMCsblcaEvFXs/BINodlVkfP82eURN5GoY3Rz0gmz+Uu29wXvot4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(2906002)(6916009)(38350700002)(38100700002)(31686004)(4326008)(26005)(8676002)(31696002)(6706004)(8936002)(186003)(6486002)(316002)(66476007)(66556008)(5660300002)(36756003)(83380400001)(6666004)(956004)(86362001)(508600001)(966005)(66946007)(16576012)(2616005)(53546011)(52116002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SEU2NGJLSkJRTUE5dFhmOG9FOTBYZCsrVVVyLytVR25VTzAzU0RNUHE4RTVU?=
 =?utf-8?B?SmlUM1VJZ1NSWHRyclF3dklONytVNituZmFSSEFxVURMMXhHTHNsbE43Zmlk?=
 =?utf-8?B?UlVDWUEvVU4zdGgwWldnOFVnUWgzbG90bjNGV0VNbS9PQ29GMVpjZXVKc0Rs?=
 =?utf-8?B?U1RtZW1MT3ZtWlNOTjA3RkFCZ0dsMFBJRWtEbFZqNjhzd215MWtZbnBVeGx1?=
 =?utf-8?B?ekZ0NFdmYzVwWi9nZFBrbURWWVhOVjNtWCtFT0l1QWtMUTQzbFVlRzl1VUZt?=
 =?utf-8?B?UExtMTZiWHdsSkV3RCsveUo2Mk85Q3NpejQrZE5ic0Evck12RkxmOTRtNzZ3?=
 =?utf-8?B?S0M1S3N4NUR3VU5FMmJ0M0JGUTFBenhwaXA5L2h2WFdJbVNTTW9iei9VZFJU?=
 =?utf-8?B?dUxDekpSR3ZmcVlIYStWTGR5TjBHMHZJRkJCQTY3K1RtZlJIKzY0M2JnQThs?=
 =?utf-8?B?cHFBSTBuVytMY1JXU0pidjAwb045Q3MydU56eGNwNEhMWmltb21zZ1hwQXJJ?=
 =?utf-8?B?bXROYnhjWmM1M0orR1NUNHg5NzJQb0FMVlR1ODRKZXRqTjhKUlUrcEtUTTln?=
 =?utf-8?B?THoxZG5YTHhHN25IcXdLTTlnbUhKSWlkQTZrVGZEdDdsMVhJUG1hSFlodjRu?=
 =?utf-8?B?VzkzODFNMUd4Mm9XUThTa2xaUUQ3YUppVVJFRC9sV1QvWWdJcDg4RHVUem4w?=
 =?utf-8?B?ZzlTYWM2QUU1S0djN05DREdNS211NlBPNUhNZTFyTWJDWHV4UDNQT0cyYzJn?=
 =?utf-8?B?ZFlhZjN1aTRITnNPckpKa0tBQ3pVTHRzbHduRjB6L3EvRmNFQ0FsbXBDTWl5?=
 =?utf-8?B?UGRBdFFhUEN0MVdkV1l4Y20wT2NxaGRYdW1UdkpXU0E2OUVlTTFIRi9ybW9w?=
 =?utf-8?B?VmpraStiRlhhMXUxeDlvUHhONG1ZZmdMdTNtOFZ1UWVZUC9BVmtOVU1oMEsv?=
 =?utf-8?B?VkxwT0pNOTVIVGU0K2NOUnBJam5PV2tscmd2MWlEZnY0TnRkeW8yS2lCRGlD?=
 =?utf-8?B?RjNOQXhsdUt0QlhUM1lWM1NYOThkcmJWcEd6cXF1Mmk1cnFSUzNEaG1SK05j?=
 =?utf-8?B?cmcyV3NvanFmdkM5VmczaTlHMytDRWZOb0JGMnVsai9ZZ1o2U2xTQzkxdTVn?=
 =?utf-8?B?bHF3dkZTemgyOG1Wdjk5bXl1ckYrYU56UjBmRktIT08rbGlJNVNEQ2RTVGlk?=
 =?utf-8?B?OS9YMjUrdFZvWUVMV3FUMElPd09IMHdBTDU5enYxdCsybXVsRmxzbDc1dlFX?=
 =?utf-8?B?dFllTTZMeWFLREUrdGFPZFBvYU9XV0FVZiswOHJUQitTTklRT0VQVkhDd09V?=
 =?utf-8?B?VC93RWpLc05NVFJvV0RwRnpKRTA4SFFKMlNWY1R3d0hYRngwaXkyaHVlSnB2?=
 =?utf-8?B?VWVsN3Y5MmRVVWthTHQ2MG9TOWM1cHgrWUViNURtMmlPMWdxUUdRRUR5N1hK?=
 =?utf-8?B?d1NQYlI0ZUd3WVQ2dlFpUU5ObWhMY25qQnB5aWZCZWQ3VGFNTmFqR3QyaGJl?=
 =?utf-8?B?L1AzdVRTK0krRXNyZUtqRThHQnoyVmdVTkRwQnd4NGh4aUZ1d3dpdHRVK0R5?=
 =?utf-8?B?YlRQeHEraTFIWlh1ZDV6bDE3aFNMVzhjLzdtM210dkt1ME1iUTVoeXlEMml6?=
 =?utf-8?B?QkRtT0RST1h4WlVFdElnZHh5THpidEJYREEwTVBBbmwrQnNRVkYvTDlhNzBh?=
 =?utf-8?B?WG5vMjhhK2tMRE9KNlcwQUZ1cHNVblViaEFLZHo2SFVjTUhaMG8rOGJ1WjBY?=
 =?utf-8?Q?GTM96Qnjy0tHv4jtzubZVx0B79hCuCOKugxLqaM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03d78e6f-26c0-42a2-4c34-08d9737c5174
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 10:26:43.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gWhxYnQ7eWfMqb/4E3mJd+evBh9M+fHm5jo4dSpF7tFKT6G/hozwUMWIYtaXEOpXFW0urkc4vCwgw2vd61LaE+MxUuAIHuhPHktb/+97GpE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5533
X-Proofpoint-GUID: TKvatzXn0tvHFVn0fCCD6GYXHUl5B0CM
X-Proofpoint-ORIG-GUID: a24-v1AvJwSR7mMhLiuTeAoYXKh1ACQA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-09_03,2021-09-09_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109090063
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Khem,

On 9/9/21 1:06 PM, Khem Raj wrote:
> also delete meta/lib/oeqa/sdk/cases/assimp.py

It's a test case for testing cmake, it should be OK to keep it? Or we need add a
new one to replace it.

// Robert

> 
> On Tue, Sep 7, 2021 at 1:46 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> The following changes since commit 70de1dbb660461bdf0613494f53ec4c78738ae2a:
>>
>>    vim: Add packageconfig for sound notification support (2021-09-06 09:49:13 +0100)
>>
>> are available in the Git repository at:
>>
>>    git://git.openembedded.org/openembedded-core-contrib rbt/assimp
>>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/assimp
>>
>> Robert Yang (1):
>>    assimp: Remove it
>>
>>   meta/conf/distro/include/maintainers.inc      |    1 -
>>   ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |   32 -
>>   ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
>>   .../use-GNUInstallDirs-where-possible.patch   |  257 ---
>>   meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   26 -
>>   5 files changed, 1980 deletions(-)
>>   delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
>>   delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
>>   delete mode 100644 meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
>>   delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb
>>
>> --
>> 2.17.1
>>
>>
>> 
>>
