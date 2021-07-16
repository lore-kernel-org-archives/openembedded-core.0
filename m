Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.6286.1626442363350762002
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Jul 2021 06:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZHjosMZ7;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28316a5228=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GDWgfF027710
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 13:32:42 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw218gkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 13:32:42 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16GDWglE027701
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Jul 2021 13:32:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 39tw218gkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jul 2021 13:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXT8UJhAWCh+c4R6JGecoaI1Yp2ZPgnqil+3ietCTcgx5iQ4GJgcsjx3csWzM4mjDTTf/LqMlFS3UhrK+aX1HLk7K0Qip12vQqXci6QW35eDufZWqtO5EeTuTNHUjcc4Vd4VF4Q13PX76/zM5B23/qeVqhgKWubSXJqM5hoRWaO4O8Op5b/Sg7vGJH+IgbCW02K59gvu5JHDbq+K6NIUepe5sJvZpDVaY/wigY25rd2sARGrT6uTD5iW2SxrPPLAghIcAfhI4H0FBW5wQgXd5V7k5OPKmAdN8WUxe0GKlXxYXt4edgBNSBqI0g6oLxhylEaliYymYTuyIla64NzmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMTrtKeYHZle8Jco/bfoT31JaxN1zpn6Fr93i4MOHco=;
 b=I92pggCIKtaf88dfyIfkcXDX8VtKLDMQUgHPndqRqjf5+N4vKeQna2W/STzI2AIj0trZKRKzZy4Il6GbnnBHy7oe3L/5nRGG1MySUV4ATgpixwI1n5Naw5eX/OFPLUMw4XXkyFBwLPZL5yd8mWYCt/1SBT+XzTKwy2E+A+acW2bw9CFfQAMrnvI6gTnIwuIHaPWQOre6LwxuT52XC+jlN7k5SRvnXjiZSFdZyMHxvf25YVGYGf/V1TrHpG1Shw+nQDPt8W9LGLWEt0qNTagQ0rPjoi1/0c+QtBR0js20FEUsRnbJftMm72SH3b6RoGV8Q/faxdCHzgo0Yi1whoc57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iMTrtKeYHZle8Jco/bfoT31JaxN1zpn6Fr93i4MOHco=;
 b=ZHjosMZ76qSsWn2y4MC9MrAFYXyenaODjeibsrttL78VHjsvW1GghAEIEMbUteReLsf13I7PYuzCwaB/CFZjy5lbIemDGR0Q4KZ1eYxbIZ4UZj/UeXlvQ21TLvYVtfa3FJ7KhMZgeHQMTRU06jski8MOr2uuqzdQxSEMFhoqbm8=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB3909.namprd11.prod.outlook.com (2603:10b6:a03:191::13)
 by SJ0PR11MB5165.namprd11.prod.outlook.com (2603:10b6:a03:2ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 13:32:38 +0000
Received: from BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e]) by BY5PR11MB3909.namprd11.prod.outlook.com
 ([fe80::8d6:5e1b:3029:341e%4]) with mapi id 15.20.4331.027; Fri, 16 Jul 2021
 13:32:38 +0000
Subject: Re: [OE-core] [PATCH v4] python3-setuptools: upgrade 57.0.0 -> 57.1.0
To: Khem Raj <raj.khem@gmail.com>, Konrad Weihmann <kweihmann@outlook.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, wangmy <wangmy@fujitsu.com>,
        Leon Anavi <leon.anavi@konsulko.com>, Derek Straka <derek@asterius.io>,
        Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <1626076608-17034-1-git-send-email-wangmy@fujitsu.com>
 <CA+chaQfWtGf7gsUCLXcTuB985YYHM=FQszdX1d2y4fcjjEepOg@mail.gmail.com>
 <17064fad-db99-80e0-f9b7-ab8c4685ec7d@gmail.com>
 <AM9PR09MB46422B3F8BEFD4663D00D74DA8129@AM9PR09MB4642.eurprd09.prod.outlook.com>
 <CAMKF1sqeWORxEneNHxn7YiRAFkC=eUnb7p2U=tfeGRFDpsLeqw@mail.gmail.com>
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
Message-ID: <6a1b0c81-338e-2c4c-2880-06a11eec052e@windriver.com>
Date: Fri, 16 Jul 2021 09:32:35 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <CAMKF1sqeWORxEneNHxn7YiRAFkC=eUnb7p2U=tfeGRFDpsLeqw@mail.gmail.com>
X-ClientProxiedBy: BN9PR03CA0952.namprd03.prod.outlook.com
 (2603:10b6:408:108::27) To BY5PR11MB3909.namprd11.prod.outlook.com
 (2603:10b6:a03:191::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::f245] (2607:fea8:c29d:d7c0::f245) by BN9PR03CA0952.namprd03.prod.outlook.com (2603:10b6:408:108::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 13:32:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1d47efc9-6998-452f-231a-08d9485e2db5
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5165:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB5165F53FF53682264AC6ADB29F119@SJ0PR11MB5165.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Wr+FPjUl7Vs7J3w2aeFIpKW8Hr8jZlDLUnpOe27KX8RJC6zteHUZ0Gbt5iHFUylQROtJUrmaAhQvtNXhBOA+ZN6D06k7/JH1DZ0U+dElxlw5gbUXm2iwaAXVvlZISQbkf619RTBvzZR+6vszx6P3NVLtf4Na0SXKWyjiRl6BHgDYbKpPMbT9/B7R1jsaIBy67NjjF/ZdhPs+nVny4sbeDWEq6NJPuXxBjj9uUonPifgPUtqEiIy6XS0L4awpCuyp/KnJ5JHcdMqbVe6RrbZKUEZf8LHkcIYl6+sPhmGH4LJWRp1zwl9jFYe2PfXGkCaeHSJTooDkir+Z2ObUe1Mw5V/Tvyv6l5G3Qa+cATBATeO20/QvHOUe6g1s4xCKVO8dljLcM1adrkrFz9txbBt5Xws8xVMqeFH6yPYOA6MTVyW0Oe+FY37iBBxEX4wgoWqUc/L4KsX9rfHUNxByNNYk3jqeAiASZoYqCHW2rTxYqb4q9BjUF/VnFk2hwBPqelVRgUeSFoL8dIh4SNcjhsoU8NuZGy6jViYPe7DEmlB01YQtrD737PePJ5kKO5Yi9b552ETjlds9oAkzB6OSlfEJ+Vx4jXYXZqiCvfsIlvs1iXLLVKOYFXYdTJt0bwrWz5psDdVoO+wlABI/fnmDfaKITBkP1XRuqYffZUHggBA4uMSAlXoeeuVSpbe3mNeOW5qNyE1nDjsKsnnpE1ILY/gyP8AQN8oagZBjuwpaS+hbh1X8ym2WHk+qBy+RsmugoBwSOCPZtXYi1XKf64+4YNSu9FHwOZNwdf0hRCatJr3UYTiU5YwRkjL6i3Z9uUpHkgjrbyRtj8B6DGl3riRUR1fW3Qd9GtgppH6zHRdQK7Tcdlw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39850400004)(376002)(366004)(5660300002)(316002)(478600001)(31686004)(2906002)(36756003)(4326008)(8936002)(83380400001)(110136005)(2616005)(45080400002)(8676002)(54906003)(44832011)(66476007)(186003)(31696002)(53546011)(66556008)(66946007)(38100700002)(966005)(6486002)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WW00ZE5tQTdwMnJaazg1ZHFnWThQQktjTFBMSVI0WEprY2R1aXNKbWFkM0dt?=
 =?utf-8?B?TmgzTGs4RFphUzRqNHNJcStMblhsdHNVbzRMRTV1VU5CTC9PWVVBYm92R2pN?=
 =?utf-8?B?RXY2RWVOZTVjRTVhSGZXYldLRHJpTVcrTHQ5ZEJHcmdyMUlzTmIxRzYrTmpv?=
 =?utf-8?B?UlJrcTRBeXc5RGRMTmZiQU9MY2V4K290d3NHL3RxUENBcWZ5Vi9kQ2I1Nnpi?=
 =?utf-8?B?bzAzSDVEblpQUDhyYVBNZzdYclVtZTVLeVpzWC8rOHV1a0E3Q3ViaWx3T1Rz?=
 =?utf-8?B?bVRwRHJNbjlyTEM1eFVaWGFvOFRGL0hWR3pqYVBub0VNODA5TTkxb3J4WVZY?=
 =?utf-8?B?V2dPSmVDMHR3Q3pFSThIdk1KM2h3cDEwQnY0TGlha3RqYnJLWC9XRGR3Y1hj?=
 =?utf-8?B?cDRuU2tIMUVpVW1EdnhwNW85NHZWNW1jS2ZLSWNmekE5UWxFZDJveCt5TG9s?=
 =?utf-8?B?MEJzR0g3L0pZN2g3N25sc3NQYXB4WkJYbVhEbTJ1UXFBWXBHUWZJWXhDWHRH?=
 =?utf-8?B?UllKSmxVUnp3cnRpWnU2QkY4YmsyMXlaN0hsUy9FbFNpUEpYbDdGQ05hL0Mx?=
 =?utf-8?B?MnhWRytnUmtSUERZU2hUZ3VCNEltaDB4N2lIK1lrVCtCTE4xalZCUmUxMVp6?=
 =?utf-8?B?cUE4Y2VsYjFPUXIydGl4VENoVCs1ZDl4T1FUNERDZVdQOS9DU2h3Q01MaUhM?=
 =?utf-8?B?YXNzVTJFWmg0ekZoUkVLQ1dMMTRrT1pqcUZudGo5dlB1VVBFQ0JHZEtnY0ZX?=
 =?utf-8?B?c2NNQ2VYeE1ENTFrNlRrdUorQzd1RDJjR2xOWW1XTGg5REQ4cXY3amFwQVZi?=
 =?utf-8?B?RDdqblV1WTdKa2JpTkhKTzBpdnJBYjN1MDN3alVPU0F3VUZ5NHNwWXpSTEJh?=
 =?utf-8?B?djhiNDRzWDRhemNYMEFXYjJYWXhWbGNIV21pekdQcVRmTEs4ODVoTEozWU9j?=
 =?utf-8?B?MVBYQTFoRE1NYTZ2aFIxdkM3NzVxTktlUG9xY0p2MllsK3ZqSUdxR0xSMGRt?=
 =?utf-8?B?VzFRN3dtdTE1SWNyRzNqVWxuSnlHUE15TzVyajlpZ2FJQ2h2RzlROWRITFVB?=
 =?utf-8?B?MEMvRVVsTHU0b1I5OU1CNlRLekVOcytjdVc0eFoxNnVocmVITVErbkNLWGhz?=
 =?utf-8?B?dFp1YVFPR0pQbGV1WEptTU1VamgyYmY1UENPMlQ4TzhIbXZCdmFnbmxnTGYr?=
 =?utf-8?B?LzdtcDJWU3Nma2xQOTZOcTJZdEtXT1F4Nkw2TWtFTlpzZk4walV3YnlsS000?=
 =?utf-8?B?VkVHSWROdEMzbzRpNkhPaXdHa3g0bjRlSW5oR01BclJYZCtCNjBONU1qTit3?=
 =?utf-8?B?Z1dCejNhT1ZxWk5mSkIzUGlYRnlNRGk1QzM3Znh1YmlTamxIUlNvY3RXb01z?=
 =?utf-8?B?L1NGblUxallBVEh0UUN1RUcxaXltZHJyWG5xTnNKSksvUWpmSHYwMmtOVDFp?=
 =?utf-8?B?cVN4SGh4MHN1c29WV1g0NDNBVllVTVI5aHJVQWFkdFNhZWJZVlN1b2Q3VVhQ?=
 =?utf-8?B?bE9zQ3kyR0liOUJpeG5nUlZYM01hbFlEblRFR1VvMnE1ODU3bm0xRURPQ2Nz?=
 =?utf-8?B?MHVNS3JKMXE5Ujc0WDk5OEVna0REZkxWcjNWdnppOUFsL0ZZRGFzM29nRm4x?=
 =?utf-8?B?UTk5YUY4NWI2djJnaVNRTW1waU4xOThJWk8vc1JjVHdlb1FxTXVrTGkwQzNR?=
 =?utf-8?B?NFYvY291MFpSSjNsSFlEcXB3N0xjMzhoQTVPZndsamp2NkN2dVlVZXJjWDNu?=
 =?utf-8?B?bmNMdk9aeG50Z0VCamhtaUtYMzNTTTVzazBNRmdiTU9IZnZrMTh2S1gvMVph?=
 =?utf-8?Q?3bFl6nbrAWLek4dZG0AhGWinyk0YT2PZcUaeM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d47efc9-6998-452f-231a-08d9485e2db5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 13:32:38.2026
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hnJuIXQp2ENZp+OfDnl1Z8LGz5p4Wi4IZGhqwuzzVJPYYuDZHYPoMvT4WJJ35OzGQ6xOcadnHPDqs+Ed5aKW0n+xQs6AttyYl+s8LnjS0ak=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5165
X-Proofpoint-GUID: 0xixpB7oJRZQUa1L-szrn-FZ0Y-04boM
X-Proofpoint-ORIG-GUID: NNfs-WA3MSW3VoOdj5KrXn3Z8HZ_tl0X
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_04:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 clxscore=1011 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107160082
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 2021-07-15 2:55 p.m., Khem Raj wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> On Thu, Jul 15, 2021 at 10:57 AM Konrad Weihmann <kweihmann@outlook.com> wrote:
>> On 15.07.21 19:22, Khem Raj wrote:
>>>
>>> On 7/15/21 7:43 AM, Martin Jansa wrote:
>>>> On Mon, Jul 12, 2021 at 9:57 AM wangmy <wangmy@fujitsu.com
>>>> <mailto:wangmy@fujitsu.com>> wrote:
>>>>
>>>>      reproducibility.patch
>>>>      deleted since it's been merged upstream.
>>>>
>>>>      v57.1.0
>>>>      -------
>>>>
>>>>      Changes
>>>>      ^^^^^^^
>>>>      * #2692: Globs are now sorted in 'license_files' restoring
>>>>      reproducibility by eliminating variance from disk order.
>>>>      * #2714: Update to distutils at pypa/distutils@e2627b7.
>>>>      * #2715: Removed reliance on deprecated ssl.match_hostname by
>>>>      removing the ssl support. Now any index operations rely on the
>>>>      native SSL implementation.
>>>>
>>>>
>>>> FWIW: this change
>>>> breaks  meta-openembedded/meta-python/recipes-devtools/python/python3-cassandra-driver_3.25.0.bb:do_install:
>>>>
>>>>
>>>> + people who might be interested in python3-cassandra-driver.
>>>>
>>>> | Installed
>>>> /jenkins/mjansa/build/ros/ros2-rolling-honister/tmp-glibc/work/core2-64-oe-linux/python3-cassandra-driver/3.25.0-r0/recipe-sysroot-native/usr/lib/python3.9/site-packages/cassandra_driver-3.25.0-py3.9-linux-x86_64.egg
>>>>
>>>> | Processing dependencies for cassandra-driver==3.25.0
>>>> | Searching for geomet<0.3,>=0.1
>>>> | Reading https://pypi.org/simple/geomet/
>>>> <https://pypi.org/simple/geomet/>
>>>> | Download error on https://pypi.org/simple/geomet/
>>>> <https://pypi.org/simple/geomet/>: [SSL: CERTIFICATE_VERIFY_FAILED]
>>>> certificate verify failed: unable to get local issuer certificate
>>>> (_ssl.c:1129) -- Some packages may not be found!
>>>> | Couldn't find index page for 'geomet' (maybe misspelled?)
>>>> | Scanning index of all packages (this may take a while)
>>>> | Reading https://pypi.org/simple/ <https://pypi.org/simple/>
>>>> | Download error on https://pypi.org/simple/
>>>> <https://pypi.org/simple/>: [SSL: CERTIFICATE_VERIFY_FAILED]
>>>> certificate verify failed: unable to get local issuer certificate
>>>> (_ssl.c:1129) -- Some packages may not be found!
>>>> | No local packages or working download links found for geomet<0.3,>=0.1
>> But that not directly an issue of the setuptools upgrade, but a not well
>> written recipe here.
>> I'm more than lucky that this update revealed the issue, because
>> otherwise no one would have really noticed that the original recipe of
>> cassandra-driver is pulling sources while installing.
>> So just in case I would rather pull in this upgrade than to mind the
>> broken recipe from meta-python here (just my 2c)
>>
> i am fine with whatever the right fix is. Its normal that some base
> infra component dependency
> drives a change in another recipe if thats inline with expected design
> then change the component
> to work with new update.

I've sent a patch to the openembedded-devel mailing list that removes 
the --no-libev flags and adds python3-geomet (which I also sent a patch 
to add to the layer) to the RDEPENDS, allowing python3-cassandra-driver 
to build/import OK in an image without trying to pull stuff during 
do_install.

- Trevor

>
>>>> | error: Could not find suitable distribution for
>>>> Requirement.parse('geomet<0.3,>=0.1')
>>>>
>>>>
>>> yes its reproduced on AB as well.
>>> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1397
>>>
>>>>
>>>>
>>>>
>>>
>>> 
>>>
