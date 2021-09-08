Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web08.8942.1631091348255568056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 01:55:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Gihprvpy;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=48858bea65=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1887xSTh029433
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 08:55:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=YmhG3QI5+Sq/Cta2Q87YlcP/OkPwI+gRgJTdMrYqDls=;
 b=GihprvpyjVBz7D/20A9iH0YGBM8aej2LhFVhmBVOwC+PdVh8Tx/YIcWkCXJORPCBEddN
 NbYPZ4K3PhFgcjFEZffoVF97kvsJW9OEG5rY8SYg/uuepPls7D+WWw6UDAxASOEZwmn0
 CoG2Z8+Pxi2jro0P0lZT32ZNoBHr4428lWE+gn39CQhdd/WoLEl8oczAS3fqiTPdB7nb
 rKhk+MZm6H1ptTaNaeWwz1X4DW0NzswnKAMmjvGrXxMzZN3nDaHrjEodAfuf7Q/FOzAr
 coyWg4HAxOidqq23pxXsceaajGYoeup4qQz9kSzFLViFC5akO0njboPFm53IxMKAyyi2 zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmtgeng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 08 Sep 2021 08:55:47 +0000
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1888tkXW010326
	for <openembedded-core@lists.openembedded.org>; Wed, 8 Sep 2021 08:55:46 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by mx0a-0064b401.pphosted.com with ESMTP id 3axcmtgene-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Sep 2021 08:55:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hFxr7TRmHNSWI3Y0CuY/mpau3fnBaBG8XjhM1ojVFUZjPEcH4zockpoJhwAPwngo5tcfwEweR/w2xkz5Hq8Yzv+Pg29FlZnBDk8aXWyH81RD+R9w+IS/TBuhFJUyYmN4aQLhaHb0lfTZalv/R381D+Ayjnu4+jcvAvWvcbZbQRgtUClQZ2yGOV24ZqCS14hYchBYtQMpp9l2nnrTpO4hhxDZ5TJYYpHkbHFi6vjs7KQvhme3iUg+Op6A9KVR1Xq4xguFYX5GO5DibhgbawhQqUVDiwzYHeDMI4hL4FAQEiViyR5JLiZqVDPnc70QvW8WAkPBWL01EE2hUnPJ4ArbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmhG3QI5+Sq/Cta2Q87YlcP/OkPwI+gRgJTdMrYqDls=;
 b=IuKJ0UTmXYmfwTTiQupW37utUrtm3UB0oPvGRzqDzWD070jHwRh+Er5dZ9V+rdbHZnNR6JKhtooc1rN5KzonXEeHpyWWYvskCSD0R8PRnlVIBbTtxYeJFCGlhKGSMjGWi9rR/n2bgL+G6LHbqzu8P07Nn2WJD2V7J/gXfRakhDjpbFjQBGlYmWx07ipaTFZnIlwZpn9i9VzdO0tx7KueRGdA7Nj0VTUo4kFQT0+bnOWpuHBqhJ8LuYTjaGHixpgxV1qVtAqe3V6zOpMFpTMCAG7OhFrEgvmWfFoIfHl9/JS/IZNMObs7DkXYjaSi1GOLXO0qr+8p9/1POw/v9zwe5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM4PR11MB5469.namprd11.prod.outlook.com (2603:10b6:5:399::13)
 by DM6PR11MB2923.namprd11.prod.outlook.com (2603:10b6:5:71::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 8 Sep
 2021 08:55:44 +0000
Received: from DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432]) by DM4PR11MB5469.namprd11.prod.outlook.com
 ([fe80::c13d:a0c3:e1bb:9432%5]) with mapi id 15.20.4478.025; Wed, 8 Sep 2021
 08:55:44 +0000
Subject: Re: [OE-core] [PATCH 1/1] assimp: Remove it
To: Ross Burton <ross@burtonini.com>,
        Randy MacLeod <randy.macleod@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <ed036834262a67e88a58001d20c719bed37d50f5.1631006167.git.liezhi.yang@windriver.com>
 <945b8038-97c7-1264-594f-e3b424695c22@windriver.com>
 <CAAnfSTsq2BtJb+PbEj=Yf0E8V=hs6DzDiv5YwRLaWkmd_w3dag@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <e13fb902-2edf-24f4-57c7-5c594d4a227e@windriver.com>
Date: Wed, 8 Sep 2021 16:55:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <CAAnfSTsq2BtJb+PbEj=Yf0E8V=hs6DzDiv5YwRLaWkmd_w3dag@mail.gmail.com>
X-ClientProxiedBy: HK0PR01CA0059.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::23) To DM4PR11MB5469.namprd11.prod.outlook.com
 (2603:10b6:5:399::13)
MIME-Version: 1.0
Received: from [128.224.162.198] (60.247.85.82) by HK0PR01CA0059.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::23) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 08:55:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 523c4efb-531c-4b1a-cab8-08d972a67172
X-MS-TrafficTypeDiagnostic: DM6PR11MB2923:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB292392474FAC08B3B48E18ABFFD49@DM6PR11MB2923.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	BN1/chUdGrlSSM9auKymxT7qnIEdRNzAOrulCY0yX8Di0ktevD7xY3nlrStZkpOKqdya3ACiYnFMv0El0I3P3mDmvL/T6HaOz5Z0KBWw8/3ZJ5SMB3ZuX9sle5BV69cX7sfOQo1lIcXWvEWhNeEH+Avs+npj4rMIbjNIWpM05uikHJXusWxjXSOXdnvVaJ1xcqIgR9sN89v1cfZ/s/Eqz3zqmguOBbLi+VDOICeAgaPINdMDC8RGhq/gyD5wh9ze6mHCgcyjH+O0x+VRwpEoO9LQfzRQXzzG5GvfrzokTcVnWSkWkRH3sY1RacxhrhMVIurLAB7LVUt1CNRPluoTyeCMftvJNAgqppKcWuNf+Jqen6E4t8c2Ve6I1VPuedci5lpsVS3MDhBHznP/BPv47l27VsttLn0yI3k93ES9BGWRVDHT19NxLlGLNTj1PbVC53d/0X3M8W7g3BoUMCSkrSXtBlNqIwJf9N6hIn6a/zrvCJlp6ZeHtSaep4fHBNfvwnQI1kW9yA4Ix77w8vBN6M7gLuw72E30M7/vN8Bb8IIuFth41Gsl/eClUaCSx547w2RZrr2kRWCKUgZZeEQqBV6aX2FY13fWX6IU7Ajv6EzWCZmufEkhgHXyLBVJ2jkkneMPXUGrOzQbqKivCpp3OqrqyMi6ikw5kgpPgwQ/hAHyv1WZcH8Y/sXf4UOWW+gUTwFtYHgdn1hbsP8UJghp2R3wlPns828iEkpX4QK+V8+ZxRlF//IXwJog19DLDTDUZls5hYbDpqOhMyYzLi1+B+Ox2X5Z5PYL10Y9CCOAJ50bFq6LVIL533iVqXefwFCJPjPZCMkJl9GzdAuVAIQwbD2+vhlCQ0hdsqAXRadaUs2zAwXH+cXlTYOyqqS2CTAH
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5469.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(396003)(346002)(366004)(316002)(66946007)(52116002)(31686004)(8936002)(8676002)(16576012)(4744005)(38350700002)(83380400001)(66476007)(66556008)(38100700002)(53546011)(6706004)(186003)(26005)(6666004)(110136005)(5660300002)(6636002)(956004)(2906002)(2616005)(36756003)(6486002)(478600001)(4326008)(966005)(86362001)(31696002)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WXRILzVac3dTN3ZIVWw5eUljdmVOdWtYWGNyMGtvUFhFZFBueEs1VnFLQ3Yv?=
 =?utf-8?B?UjdpdVA3ZVdpUDZreEsxQ25hWlN3c09ZS1c0U3BHQ00rTVd2amxYRzc5U0hw?=
 =?utf-8?B?V1dhS0lLUitCMk5BOWF3Q3FMOVFPVHc3T1hSSXozMDF2QW90NjBqS25DbHhU?=
 =?utf-8?B?SjlhUXRjdVg4SUNTWUw2Si9QQWx5TE5rS1BMVjdXSDZSWTUwRXI4bWxNU3VF?=
 =?utf-8?B?cWxjbkNLVzdYYnNiWjlwZDlITjJRLzhMTlY0QVN0N1VrVGx0U2YwYVNEWFdi?=
 =?utf-8?B?RlR1VVpBanhqaVQyYk9rNUpXOS83WVZzaU1RRnpJSlN2WDJJKzBCdXF1Sldq?=
 =?utf-8?B?aGZSczdPVFRZMGd2anFDTzloZUFFOWRwMm1WRy9IMnlZZGRQY2d6aU5yWktR?=
 =?utf-8?B?OTVhTjRXdkM0R2NUTEQ5eTJPODRUekk1Wi9mQnJDaFdBZjV0djV0OWxlaFNj?=
 =?utf-8?B?K2xMQjhBVVVzZ2xjUUFqejhCR09VWVNwTTcyRlVYM2MxSG16dFlibWY2Nm4w?=
 =?utf-8?B?eWgrdHBVVFhTcm04WS9mbXg5VHA4MFg3NXY4Uk5QMXdpZTc2OS9mdUFkQVpv?=
 =?utf-8?B?U2tzc2VmcHNjWVE4NXpwQWtScENuaFg4VzZjTkJLWlhSNTE2dG00OHVSNjUx?=
 =?utf-8?B?Y3h1YXF2bnFkT0thRnFwczNKNGwzYTBFOEhCMHpXNDlmNzZBZDc3UjBuWHhH?=
 =?utf-8?B?bVhnK1BSSnh1REN6NUlFY2FScTI4bnB1MFhvWmVSTHlJVEExRVY4eitIR1cw?=
 =?utf-8?B?L0ZtdHV3OUdheXhpZTNFNTArZEdNK2NoWjhEQ2RnMzNmSGp2dDNjYTZqUlk4?=
 =?utf-8?B?V2JpTWMwUGM2aXhMT3lyZ3E1bllOODlJZU82cnBESndHWkZMeEZ3SjN1TWFl?=
 =?utf-8?B?TkJVbTg3YmJjS0pkUVh5dHNHQVRJUlE5ais5UXNnK04zWkRwNFpza0VlakFG?=
 =?utf-8?B?SHM1NzZwL0FOQ0ZYUWJOWWhway9GMU1rMUNRbWRKb0pFNjNsc1Q5UU9mQUs2?=
 =?utf-8?B?SVZQRHVwL3VMT1A1N1hsS2VqTi9ab2ZXbW5xc1ZxUnRGblVyZXdGZm5FelVt?=
 =?utf-8?B?N2tVNEVSY2dHKzlRSFJGZm81OEYwUjdZbkswRG1UWEhEZzg0VFM5MWdXR3NN?=
 =?utf-8?B?YXNacURZaFB3Z1JMR3c1dXpjR0cwckN1cDBPMGU5U1pFckxQQVE5Z1VuRUU2?=
 =?utf-8?B?OGd2dStsd1VUZmdLYllDS1RHRSt6UTlpVlZLZSs3b1BIZTNRWkVvb1hMZldM?=
 =?utf-8?B?SUNoS0RuLzk0ZWJlRWw0a0JzU3JBZGY1bUJLQTAxdDhpMlQwcHpWQ2V5cC9C?=
 =?utf-8?B?cmxtMzM1QUQ4azJQMk9RVFRabFJpbDFPK1RxMkphOW1vamRDWnZMY1NIQm5I?=
 =?utf-8?B?ZDZCUWFmSktSZVJsTHpxc1Z6Z3lZMlBEK3FaWHQvREE0ZHMxRVVyc2ZldGxm?=
 =?utf-8?B?Nzc1bk0yK0hhMTBBN1RRak5yaTVtR1B0dFRGZGgrT2NTNU5VdWgwc080SmFo?=
 =?utf-8?B?c295NnpJaXBIWEZuTlc0VElWQVhlc0xFb3hxNVZSOFpNUG5kOGh6NndKNUVJ?=
 =?utf-8?B?Mko0Vy9UUFBNZnlNTVVvbndKRGJQemRtNTJCQ0pwbVluMjZNd2VpYkVIdWE4?=
 =?utf-8?B?eUpON1B6Z0JUUkJodlJRWkZpaC9odmFGejRzZWlXVHlEbDVoNU5uaU5MUlU4?=
 =?utf-8?B?Vk14c1Ircm9QczlZWHJUd0lpMkpiODVNb1F2bE8xMkt6VkZNMDVhTkU1YVJX?=
 =?utf-8?Q?HwTYUnpDrUYz42yuvvgQZcib96alho0HjolEK/q?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 523c4efb-531c-4b1a-cab8-08d972a67172
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5469.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 08:55:44.4227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gqZmUSR2b8os+PoldFwuTu7TKiSfVAJarEg6CqK+a7bgRPwL0DhVoQpEGxUAcLsxgnUFp2ny4/J57h6pnZwfdQH+vGh3RMv7y80aVkdcO4g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB2923
X-Proofpoint-ORIG-GUID: lqJW0q3cPEdfgDhCPv3Kd2kzYOpNoK0d
X-Proofpoint-GUID: HX5DjCJvoGykYRL4FNT0hcudRrYZJsFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-08_03,2021-09-07_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109030001 definitions=main-2109080056
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ross,

On 9/7/21 8:10 PM, Ross Burton wrote:
> On Tue, 7 Sept 2021 at 13:04, Randy MacLeod <randy.macleod@windriver.com> wrote:
>> I'll look at the sections that you have pointed out later today.
> 
> Debian is always worth looking at when there's license issues.
> 
> https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source
> 
> Specifically:
> 
> https://salsa.debian.org/debian/assimp/-/blob/master/debian/README.source#L81
> 
> They strip non-free components from the tarball before importing into
> their git repository.  We can delete the same files during the build
> so they don't get redistributed.

According to the license, those non-free files can't be saved anywhere such
as the mirrors, I think that we need a special do_fetch command for assimp to
make those files won't be saved to DL_DIR or the mirror?

// Robert

> 
> Ross
> 
