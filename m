Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web12.72524.1629390924483667201
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Aug 2021 09:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=Oaz34Lqz;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3865bc9a77=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 17JEjXIM014523
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 16:35:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=VMJlYk5npgkFW8K49VTbtUTieHvnR2xw3q7cqC6+DLc=;
 b=Oaz34Lqz9XIPmqF1phezu5CWiNOD/uGhQjB5fwCaVMML7h/wQd/IEGP7YePWLpkQ7vio
 dOqpFnDQQOqqqEsHY7tkQIGPrzEOHrf/a06Tg4MRxEJcxigAJ12UzI5JGzgElx/tRO9g
 AATytbjN273n6o/7b6jf0KK0F2COYD7SenZy3u0s4viPOHeeCyl8CESSHwX7JoNMH1Iu
 zzkkRWuUHVbK+9mY1oURLzF3UNWi0YMMppICSST5EoclOGx2pYWvXnli92QJdYDm30+w
 Ezsjd6WXiNXk2Fp193yS8gsR+HlFFvMcycthvuA943kPlOepF5hVPE97vP7Ffb0G6qMf OA== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
	by mx0a-0064b401.pphosted.com with ESMTP id 3ahfs9getb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Aug 2021 16:35:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oC+i8Qvm1iAgu7C1p1xWUtTXuKRiJ3LPZEAZcXFWZlx45Sy4dTwZFg2lqpoFI3mhf8uY8BjwGcQ2wkm2oYNKn1thyOoPJmFLeANIL3L9izB4xlJZhm/zYkkaUfw6dR7TTe37H/iONoPSL/9JmXOwQw0A+70Lwt9cldzXPjom1Ewqvdnbbi2V3DwLAmcwC6D0S4cESk2MLfsKJBCMsr33YPUgyjJg/WFq+4u7rLa8p9qPhb8cdoGA30wUF+tTdPXOR8+BB9knRQWDebNMmp+apQ2XvDrIjC3/euxHZ2V8+Le6d5ayOwHt46loz8liy7I036VnBVf2nfma9jJFarLD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VMJlYk5npgkFW8K49VTbtUTieHvnR2xw3q7cqC6+DLc=;
 b=R0FNMdmfvB+3WRH62wq5Wy07Kyf1YG25KajgTYlrCHf0+wURqE24zBhIvIZR3UR/9Wm7ge/UANYf9Yzy3saWf9JkNLbHuqBWFUrA2z3lgXsc8epyfGTEFOdrA23wQW/f4W8mYqL6q7g1UX1MRoW4LwJCAmhZI/opD/TuCwMIjnZY9WEaL0N6g3M524RvPsxw17/I2/PKsTSWrvbkyOgU06UqmYZMFYiTQZtQmeDNj1t4vJdRo18Y2AYihUgy4DL9fum80TImnkORmE8I8ZG5iKdLJDJzRNRz8kMrUaz4/xC4ZEk2ko6kKqCrTd85fBnMIrxC0h6HDQMs96uNycabhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM5PR1101MB2266.namprd11.prod.outlook.com (2603:10b6:4:57::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19; Thu, 19 Aug 2021 16:35:21 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::d44b:60e8:b607:73f7%7]) with mapi id 15.20.4415.024; Thu, 19 Aug 2021
 16:35:21 +0000
Subject: Re: [OE-core] [PATCH] glibc: update to HEAD of release/2.34/master branch
To: Randy MacLeod <randy.macleod@windriver.com>,
        openembedded-core@lists.openembedded.org
References: <20210818230509.38342-1-sakib.sajal@windriver.com>
 <430edb20-c307-e391-673a-1477f39c0fb8@windriver.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <4f2bcf69-5418-22b2-1d63-1a6a77fbf844@windriver.com>
Date: Thu, 19 Aug 2021 12:35:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <430edb20-c307-e391-673a-1477f39c0fb8@windriver.com>
X-ClientProxiedBy: YT3PR01CA0103.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::18) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.20] (70.24.102.154) by YT3PR01CA0103.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:85::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.18 via Frontend Transport; Thu, 19 Aug 2021 16:35:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 737707aa-dd41-4c96-689b-08d9632f5612
X-MS-TrafficTypeDiagnostic: DM5PR1101MB2266:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<DM5PR1101MB22661F6C9990AB8891B28A61F2C09@DM5PR1101MB2266.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:403;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Z66Vztv6lKqOAjQL+R8MPy9WE8nzmvvl4f8p7f0CmG5j2E+u6FjOKSsR/6pgVGtZAITwjYUxVcAObwqS60V7Cuirhr1Zl5cqFFDXEg/9qbPeFeZc/OvBkF8kYWLa8+o5TYtsQ7VNiE9DqoYwxAfPGOteOONECM5+AJE1DIqM+S+NMGCTkzFvvyq38+q+tOQsAQqAffcon+0vnw9SuE39l2EoCucQx7aW/gDYFme9/CUlZJIDRemwkirkCkS9N7LcIo3iNwOioIc143RV4U7ykKqjRcqaOTjyltDKZFudp1OBpNA/SfzFusDHx9T7rM+OVE+E40wZEQ6YflDN3DXtJ9UHDHk1+Cdze/xpSmfkbnan7LKgGfHYezUrF5c7JISNHo/TGofhf6yucHuqwykZV28SANnnIE4N5r7lxooyrnEayPXqtiM8Y0nNDL6lmi7BuSAwgppFDEiTJfa3eK7QE1uAannF4yLWDi6RK3/uhvDZzjKmLbHiAaEB0fKeVj2cqV0JdPCtxDdOByi2p7gm2jg+yKb/UfXBd3R0zli50agcvU/S82jxWZ3A065A2k/oI17amiBHKXTYQ29UvmEkQGHL1ZOnmZHSb2VEtoYq8hgV+oBHk83/c1OZlYqCtaJ9tWPlLzoZzXKzBN2fzLsWi8XvftCLK1VLe909Spp3cVnAmdgAKi7/KkD6um9yDO6xSywyiA0g2Xx34SP8Jow7eM3NcA7lDm4BGT7a3AhB3jAWrUhZWGn9sDvzFsg+XbsOtKisXEvstHKlW/JP14XvTS7Y2mBaTous0fSKVqlXmSVXuuM+pYMHLzThf4lCzf7xgMzkDmb/JKWNDDEwf3F8mBhoYgKHBAbtR4vn4+Bns7ZyEXsQ2HKwL8m2dOzH9vRp
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(376002)(136003)(396003)(366004)(346002)(8676002)(8936002)(316002)(2906002)(16576012)(26005)(31696002)(86362001)(956004)(2616005)(38100700002)(38350700002)(44832011)(83380400001)(5660300002)(966005)(31686004)(53546011)(15650500001)(478600001)(6486002)(66946007)(6666004)(36756003)(66476007)(66556008)(186003)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SFFGZG5udUhnSUxrVVliY1c1RlhXcisyTng4c3FtYkw3dUNhQU56aHlFRmFM?=
 =?utf-8?B?L1FoUmY4ZTkrcGo3ZEpRdnl1emxiMmVSOGsza1kybS9kU0hmWHU5VnFXL0hY?=
 =?utf-8?B?N1JCcjVmRnpPWERiNEhHb1NISTgzWG5zZ1JlS2oza0FweXhKMDYxWVNhOUpt?=
 =?utf-8?B?c1locDJFM3dGd3lGdnFwWm9Qci9ZRjhwa00yc09PRTFOdlJva2grRE1SYVNR?=
 =?utf-8?B?TGEwVzdBWnNxVjhpRXY0clpnR2tpTlpPL2tpbm1ZQWY2aUtkS3lIOWRWc0lW?=
 =?utf-8?B?bC8xRU9xNElSMkFRQklySVNUaFpJUGJ2Sk5SaXNCNWNCSnJOSyt1WUptYTNN?=
 =?utf-8?B?TVU1WGpiY2VzVmxUek8rWlQrTkNSWlhzckViNW9SR0xUTDgzc2hGVnh3SGZv?=
 =?utf-8?B?eTM4OElralVJd0EvbU02bGpVc1VXR0UzaDAyYUd2TXFScFBGU3IxMCtDK0Zr?=
 =?utf-8?B?bVFCRSthMnNDeWFreitNWEEzc3pyZ1pXS2k1SzBDSTRLN1YvRVpDcjNIbUgv?=
 =?utf-8?B?UEgxSjR5Sy9IRXdGUGRGZ0NvV0xQSHlqSmlUMlhrZTF3a1gzbytPTGlFdGtF?=
 =?utf-8?B?QzJ3b2ZGSHlDNGJCZTFxOU1CbzRFZjl3VXp4TGZieFRJZmtYNEpaSTlnaXc0?=
 =?utf-8?B?S2F1LzdnYlBLYW0yOE0yUGcrS1h5bFJYTC9VWTJXSDkxS2hpekZLTmNEbTNr?=
 =?utf-8?B?RG5nY3hPclUwdVliMEpOUE5UMG9uVWRNVkNHWWlpKzQrT1NQSnoyTStRc08r?=
 =?utf-8?B?Wm1CejBxYXppQkFOSlYyTjhGb3ZZeURTWUo3TVNYRVBJMEpYZjd2VHNRSUZ6?=
 =?utf-8?B?RW9KeGw2NXpnTitpeXNGZ1Y3dDhSUFRYU0VyMGM3aUMrWmFNWllPNTBQQ2dJ?=
 =?utf-8?B?YnZ4Z2wrMWdVL1VURUZ4QUZvZ0c4dHRTZGJ3ckZZMCtldTVqc29OVHRpZm1i?=
 =?utf-8?B?enlaYmFDSEpOUVlIQ3ZNU3kwTS9qeEtjcTlkc3ArQ3dUK1RzcDhhYk5RRHpu?=
 =?utf-8?B?RDZwd1I1UlV4M0hnR3RUdXo3V0U5cmxjMHM3MTZLd05wNU5Kc3F5dzQzTzhx?=
 =?utf-8?B?bWlEK0J0Y2d0QUlNYWUrZHhMUnp1K2NtYWxGOVRnTVpxZTR4aTFjb1FpK2Na?=
 =?utf-8?B?MmJWQnNkRXVsWkdCelQ3Z25WN0N1NkRIdC9yaWJRUHFVYjBrNHBOY2MwcDN1?=
 =?utf-8?B?TFAzMG1ZenN3WElwc1VFWHIxSDh3d3dhaXMyN2JpOERoc0dvWFNIVGJMblYr?=
 =?utf-8?B?RnhIdTNHT0V4b2dyTUFoUWpRN25WM2pIamNKRHk2MjZubk9OQUdLZ2UydmNa?=
 =?utf-8?B?NTVRcjIyOW0xWkNZc3lsaTA5cEU3aDBCd0pUNEEycmN4bHJCa1F1bkpMYUhO?=
 =?utf-8?B?ekRrZUZkb21aUFc0dWUrQVNLSEtRblZJckRnVlFsMGpLS0lDTkdNS2l4dmR4?=
 =?utf-8?B?cURkMGowRHhVSWJtVnRoSmhibUZlYStIRVpMZzlrMXcydFdVeFZtVDU4eWJx?=
 =?utf-8?B?Y0M2eWFJc2hESE9XaTg1Qk1JU3d2RHVTOFJ3dk43SkVwbzV6ZG1nY1RqNzRw?=
 =?utf-8?B?aFdZaW44eGR0U2VhUW1tYUZ6Uy8vNjE4ZnFjd3VCS2NMbmpZT2MzSFl1S2NL?=
 =?utf-8?B?eGlaQVBPYmRCK2llbTcxVlVpcjk4ZXhObmtlQVcxMm5rL25xWmdFajVpMEZk?=
 =?utf-8?B?RTZQTVZWeHo2RjdpYjJlTzhIUHlidjE4cngxMmFkemcrQVF3YnpNUElnV2FQ?=
 =?utf-8?Q?jINGl/3yhC8fK1dUJvcQgpS4B/aAtU5N8XLmfU6?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 737707aa-dd41-4c96-689b-08d9632f5612
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 16:35:21.0014
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ud8kus6tKy/mrVUe6LlrteVNyOk2+70zxrwONc61teg37Bz22kvDpnJv4+kLPZ4QNh21vySd09B0pri0nfAiN2naruC7bMoft3bhXMUGe5A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2266
X-Proofpoint-GUID: mkBjeu5TqLoSzxosMHdopDgW6xA780z8
X-Proofpoint-ORIG-GUID: mkBjeu5TqLoSzxosMHdopDgW6xA780z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-19_08,2021-08-17_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108190097
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 17JEjXIM014523
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable


On 2021-08-18 7:51 p.m., Randy MacLeod wrote:
> On 2021-08-18 7:05 p.m., Sakib Sajal wrote:
>> Update glibc to head of release/2.34/master branch to
>> to include fixes, includes fix for CVE-2021-38604:
>>
>> Changelog:
>> glibc.git$ git log --oneline ae37d06c7d127817ba43850f0f898b793d42aea7...
>> 7c987a5ccb (HEAD, origin/release/2.34/master) librt: add test (bug=20
>> 28213)
>> 7947430322 librt: fix NULL pointer dereference (bug 28213)
>> 31902ae639 Linux: Fix fcntl, ioctl, prctl redirects for _TIME_BITS=3D64=
=20
>> (bug 28182)
>> 9995d0588f iconv_charmap: Close output file when done
>> 7ff4da3dc2 copy_and_spawn_sgid: Avoid double calls to close()
>> a5bd2e10e0 gaiconf_init: Avoid double-free in label and precedence lists
>> 3a48da47a9 gconv_parseconfdir: Fix memory leak
>> 0b03996304 ldconfig: avoid leak on empty paths in config file
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>> =C2=A0 meta/recipes-core/glibc/glibc-version.inc | 2 +-
>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/glibc/glibc-version.inc=20
>> b/meta/recipes-core/glibc/glibc-version.inc
>> index 281df7ecda..c53b53f114 100644
>> --- a/meta/recipes-core/glibc/glibc-version.inc
>> +++ b/meta/recipes-core/glibc/glibc-version.inc
>> @@ -1,6 +1,6 @@
>> =C2=A0 SRCBRANCH ?=3D "release/2.34/master"
>> =C2=A0 PV =3D "2.34"
>> -SRCREV_glibc ?=3D "ae37d06c7d127817ba43850f0f898b793d42aea7"
>> +SRCREV_glibc ?=3D "7c987a5ccb31df80456d53a094e47f81310f549b"
>> =C2=A0 SRCREV_localedef ?=3D "95c0221703ad970a52445e9eaf91c4aff35eebef"
>> =C2=A0 =C2=A0 GLIBC_GIT_URI ?=3D "git://sourceware.org/git/glibc.git"
>>
>>
>>
>>=20
>>
>
> What build and runtime testing did you do Sakib?
>
World build and core-image-full-cmdline testimage
