Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.20668.1628501766116594887
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Aug 2021 02:36:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriver.com header.s=pps06212021 header.b=m44aS2Z0;
 spf=permerror, err=parse error for token &{10 18 testsso.windriver.com}: permanent DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3855c1cbbb=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1799J4VM006683
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Aug 2021 02:36:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=subject : to : cc
 : references : from : message-id : date : in-reply-to : content-type :
 mime-version; s=PPS06212021;
 bh=avrI5g4O9qTGIbSAKcicTsmiFmTHipRiBJGPAmM1jUo=;
 b=m44aS2Z0OsKqM4kJgLBYjIyIEsAQbrmoiim8AqkOoFV1XzEkgmH2wZdRyj/f/CjSs8tn
 cuo1SO1wJyEeMre8DA3a1gnDzgiQ0Qs1Zu9Cz62hFangXGGqnFFtWfNnSTVswn3m8RX2
 U2gBIVIqrjpN/mtd5ifSdZ2sMCCVYGkYkoVECl8d3nZNB0fAfGBmsSMy2wTboq/OGe2k
 kXoI5IVyREbA86Vs6vu/JqVS2EYl4mALUzYmQvjVOEDECDPE+PEMDAB26lvZgnI6FTtB
 k9nfoP/VYuVDAY7hpqVC8tnan3qoXMLNl6Eo9n5Rye2PyQ3Z5tRLgtYZNYZQZx8yONeU 3A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aaj0j8d5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 09 Aug 2021 02:36:04 -0700
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1799a3vA005972
	for <openembedded-core@lists.openembedded.org>; Mon, 9 Aug 2021 02:36:04 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
	by mx0a-0064b401.pphosted.com with ESMTP id 3aaj0j8d5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Aug 2021 02:36:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i7SqCa9eoNGWMIm0UswP7UeoCYTPw0BpHKAEDbDj0Ns4oJnlQ1Gjc91jSxVfAOYxyoT0ap0dJi5Fsu2AIKmH/TD4+0YYvfzt9FlgxaRaWbfEe55DVUCyjLCJfpM0akPpuf/oxx1rDIIBl0w2qtvHUuzrBeulhdozRp7HENlOYk2M3MycRi6jr00rzGINug9g2ZJVNOgVCdkrNg5L9mSWzY2cOKfl4BFCXJ896edFPF1fYBgCu9EQ/3PzADaSePilUFrIpUPpACGB+dvW0+D9ELpJTrdyAZauOxo1q1V10XVwalhXKSX8DD6GisS5husd6y24ck4OXvEEJ3w3ZPMbyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=avrI5g4O9qTGIbSAKcicTsmiFmTHipRiBJGPAmM1jUo=;
 b=KTX8Lvfr3Bfuvomk9FVY7TWzi9bGVyJdJWcsryY0qrdDMq9QNbxTQvhO8ORQSYMMIjiGXhuoqZOwZkG7SCEzE+/7tGM8SAihgKdLSBDaurqoE9tc06F8QugPKK9v9kuw1xmy0FpCRmfc3d+RKB34sBO19s4VW1M5VPq2Kkg9Ej7gpK/Bl+aW3sOATHh5SwPpFKnRxZrpHCJVrbZJzHaUcFWbvpckb0a1f+saxKTR8JhnlfQf/8AzlhijyBgjh/SKNqn10uPgRezz1yb9hst6q1joDHEIs1Lla+yl2XUJ8D5rM68L1Hger4PrgKzShOw1TUF5RKhJOr970NNwKRj24A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2557.namprd11.prod.outlook.com (2603:10b6:805:56::33)
 by SA0PR11MB4574.namprd11.prod.outlook.com (2603:10b6:806:71::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Mon, 9 Aug
 2021 09:35:52 +0000
Received: from SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::911:37d1:9b4a:7693]) by SN6PR11MB2557.namprd11.prod.outlook.com
 ([fe80::911:37d1:9b4a:7693%4]) with mapi id 15.20.4394.023; Mon, 9 Aug 2021
 09:35:52 +0000
Subject: Re: [OE-core] [PATCH] libconvert-asn1-perl: 0.27 -> 0.31
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <169759E55CFA4CD7.25031@lists.openembedded.org>
 <494f8563-fcfd-aa3b-319e-d35b5db44c60@windriver.com>
 <CANNYZj9hr143i7m6AS=moW+AV+q0JaNKdQNd4ZZ6sCqX6yx5+Q@mail.gmail.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <4cc8d282-45de-f9e0-9d7d-d69f485585c3@windriver.com>
Date: Mon, 9 Aug 2021 17:35:45 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CANNYZj9hr143i7m6AS=moW+AV+q0JaNKdQNd4ZZ6sCqX6yx5+Q@mail.gmail.com>
X-ClientProxiedBy: HKAPR03CA0005.apcprd03.prod.outlook.com
 (2603:1096:203:c8::10) To SN6PR11MB2557.namprd11.prod.outlook.com
 (2603:10b6:805:56::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by HKAPR03CA0005.apcprd03.prod.outlook.com (2603:1096:203:c8::10) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.4 via Frontend Transport; Mon, 9 Aug 2021 09:35:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7043cd75-41be-411a-d477-08d95b191417
X-MS-TrafficTypeDiagnostic: SA0PR11MB4574:
X-Microsoft-Antispam-PRVS: 
	<SA0PR11MB45744677210BA27BA3B9076482F69@SA0PR11MB4574.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wf6HOUoPU9rPUjlqcVlqbOE4Rt9T9QADAzEwhOZaTQJQM10PF1ciYana8cGSGd/kePXxzYs7JP98k0nzTp19YjmEhwbhEZlJiZ64fiL22uAZcG3m9UCCfqQQzdB/TeDp/CoRlZa2LvKNMusqk+v24zKPvnDdOqAITqX4mf+rqyAVQgwP6E+wjNyDhczZdSWXMOu+Otr+aauKY692ZIQzb66yowj/oHQJoMKImI25ZiPVd0WyYkYfiQjXnKpooiFMiVjpwnmGvx1lf8S5A6/R0S42j59Uww2FISlmBKSNxfzGz3TOYI2afidEBHWBw5azl5XP5HaGklbvRwpCjwNRvOgQr3xsvk4qd9/whWr5lUKBSMOp23UHrOT8i3atHBeMUUsL6NlL00nH7uXUhBAgBiLQwvVkXMzWU0k/z4tXJI0u2hLG5K3JOruajTUJtcnH2Zqlp+dfmkXJ4meCvAPCfj+CDyXEUe61jCiDGVgVzQfvs/rW+iWsUXK8yyOyk5ig8SxcQ+/jpP3zYuws3Ai63ijW3Kb+6p170n1dWf2fBZ7pjnBx1eT9VGUCTR1XctXErdH4QS2xu5PVcPDV06gPl5yPt+Nk0rDYVdxiay5uDQh3IFiBNyjo9LNNIdf1DWcRjqIPDwNJ6tFrwHG/Tumrp3okDXzYN4Mn5cL9IhuT5C1Pf1QRBTnMt/LomtEimfrb8k2+o2pa1TWuPBgDScjGeXTXjwH7yl7Lp9eJek1EG2FwDBWAK05Nt1Quj+y6QWfxDVyCBKQi1x8Bn8KNmFnwBPL5meXw1hX4gN/HyzoR1MJNS914McWSOaoOUx66f3e0fBwwG21n+UtEh70Hvk/J7RCHs6P3Ms3LPjvgAfoyYGa+qSiB12be18hVpVs7j8ZOSuIsjHq/2foSCRvrZKLa4g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2557.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39840400004)(31696002)(44832011)(6486002)(6666004)(6706004)(5660300002)(36756003)(52116002)(33964004)(38350700002)(6916009)(4326008)(38100700002)(956004)(86362001)(2616005)(66556008)(66476007)(316002)(31686004)(66946007)(26005)(16576012)(2906002)(53546011)(166002)(8676002)(8936002)(83380400001)(478600001)(966005)(186003)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?eFVMTTBGUzNIYTg3ckRMb3hEeFZsa0ZYWmtHdUtsWFUzTWFrSUZlWDhQd0hv?=
 =?utf-8?B?K2YyMmpDVlZ4NEVOa3lqNFJ5MVpZMllqc1NWTkdTVmRLWTRkWlltdUNnNFhu?=
 =?utf-8?B?OGpSam9peEw4aExYazMzVUhVdzBVc3l6bGFNZFZqeWVnRE5PaC94VXAxVVJS?=
 =?utf-8?B?cDdLTENtSFY4bU9Lbk9GbDd5aGwyS21ocndHdThpN0pFanhwL1FnRU5WWGpI?=
 =?utf-8?B?SjdUUGpYK1V5U2tOUmtHZml3VkFrUzdQanY2MjlwTlZJaml4dE45cjNwWWll?=
 =?utf-8?B?Q2l3ZUNqeEozY3Z1bVh0YU5jK0FiQXozaWlibTRiRkJhd1FTQXFiUzUyd3JQ?=
 =?utf-8?B?clF4V21kdkk1eVBzWjR0bDBZai9WbkxJUUQzNVU0c2Rtbk1XL0pkNmJLRUxm?=
 =?utf-8?B?RWN0RXl2NG9kZStlNzVxcnBMdGN3VEJ0aE9TS0c5OXMxUEFtQUV1NXdqcC9K?=
 =?utf-8?B?b2J2cjViUWR1Qkh3cGVZUXB2WUxueVg0Yy8vQ3ZjSzZhNE1GN1ZrK1NNNStE?=
 =?utf-8?B?Y1puaGU1LzZsd0p4dVAzRzAxQVVmZEJ3V0dvRHlDaG1lUXVSeU5yVWFFWVJZ?=
 =?utf-8?B?dmRXb1E2YjM4OGhuWmxvaXpNaXBuR3VDVy9SOVMxMnBzSGRtNlNEcEpBN1Jt?=
 =?utf-8?B?czJneWJsRExLbXBxYnE4ai9kYUZZVldjMno4a3E3ZHZBbkZlelhCUGRIN2Jq?=
 =?utf-8?B?aC9vYnpXdEpyN3h0YThPcnRDYStWZ2FCN0JwNEZLbkRIUkhnTHZodUNVT0Y1?=
 =?utf-8?B?TFF1LzVReEY3WGw1WGVHeTJpaXpveWZMeUVuSmhlUGQreFJDMGE2U0YvL3ZT?=
 =?utf-8?B?WFdLRjNjU3Z4RFhRTnhCYkNiUGZxVlFTTGNXTHFnZDhmaGZVdUN3TG1zUFps?=
 =?utf-8?B?WENsZFJtM1lvOU1TQm00Mi8yZFFxTytEMEM1YzlXL1A5WFVGZXAzWXU3Uk03?=
 =?utf-8?B?RWZJaFBqRGx4cGdEOTE1ZzB0V3ZCUE1yOG9pdjZVRTdPQTZxbGx4YVJpRTBw?=
 =?utf-8?B?ZHNseEhsN0V5M0xaQ0tkY3N4cUtvTHRoSnhGNFZHUGNaUm9KdENjTVJaN3Nq?=
 =?utf-8?B?U1BmSXNUdlovSVJQZkJTbm1MTGtyczRYanQwVWpjelVDZ0NUSUk5V3dST05x?=
 =?utf-8?B?eWlyeUFrMENDRWpSSkxIOFNPWHg5Q0cveFRnWEhydXRnbGJkWEM3WmhCUEVS?=
 =?utf-8?B?N29SWjZndHAzNmV2TG1NT1oxTzlXWW5DY2dLK21KRWI4SWxhd0NyN3VkUisw?=
 =?utf-8?B?bnJDK3dSMDdtN3ZnM081dzdUZ0ZqR1FsWnJ4Um1hc05DS0VMd3NzR2h2dTlC?=
 =?utf-8?B?MEdKRkM4ZnI1b3diT0ozZjNFWWlNWU9BZHArSitMOTZJcGxOOVovUEFIVjVG?=
 =?utf-8?B?WWF4Y1J2c2V5Wi9iL0xyVGR0cU9EUHFEU0t1bHE4M2pkclhueldWb3labTZR?=
 =?utf-8?B?VHEyeFVld3RDK3ZsSjFYN0ZqUHlVaVRTNHN0TVhNVlEvR1ZqZ2RWL01OVjR5?=
 =?utf-8?B?cjJ4MFdCME55Njc3d1hJQlFDclhCQ2lMeTEvNFdxOUI0RE55WDZYUHdZWU1j?=
 =?utf-8?B?Mk93M2V3OGJzNEVHV3ZNSTBjYXh6eS9wRlV5RC9PUnRkT2k2ZVNSd2xjaFh0?=
 =?utf-8?B?N3RlM2tQRGhqc2RzaDQvUnlBZTBQbzEzK09aZFAwQ3JyNDBpOXo0U1JiZnJx?=
 =?utf-8?B?bFI3aDEyMjg3NnNpYmZubnZ0KzRnbElDV09Bb3lGV0JZdWx5SlhhWVdRdVB3?=
 =?utf-8?Q?uvAXblCe+SS/I/HzK0/ih3izFJ8hS1hofR8vKEg?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7043cd75-41be-411a-d477-08d95b191417
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2557.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2021 09:35:52.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RN4GkHzqKz3oceTXNpz9CSDLIOqUr70M1br0kSC9r1CR8V0uSr37Td33aqh+3sc8O2IDZTJt3i4yYLRF0q/E6ASVahK1M9+HAgfAVoKffLQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4574
X-Proofpoint-GUID: wbGgZZTQN-7WCS6aHqEkeDXitV6aT4Rx
X-Proofpoint-ORIG-GUID: vcoMh3UOht5vLoIDGPfCpQS3bFo9DY2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-08-09_01,2021-08-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxscore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108090076
Content-Type: multipart/alternative;
 boundary="------------C4AA4E1A53A456F4B5DB253C"
Content-Language: en-US

--------------C4AA4E1A53A456F4B5DB253C
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 1799J4VM006683


On 8/9/21 4:38 PM, Alexander Kanavin wrote:
>
> **[Please note: This e-mail is from an EXTERNAL e-mail address]
>
> Can you please explain the SRC_URI change in the commit message? Does=20
> upstream version check work and report the latest version properly?

Hi,

I have send a V2,=C2=A0 and update the commit message. Now, RRS cannot repo=
rt=20
latest version since old SRC_URI not used any more.

with this patch, It will work again.

>
> Alex
>
> On Mon, 9 Aug 2021 at 08:01, Changqing Li <changqing.li@windriver.com=20
> <mailto:changqing.li@windriver.com>> wrote:
>
>     ping
>
>     On 8/2/21 9:41 AM, Changqing Li wrote:
>>     From: Changqing Li<changqing.li@windriver.com>  <mailto:changqing.li=
@windriver.com>
>>
>>     Signed-off-by: Changqing Li<changqing.li@windriver.com>  <mailto:cha=
ngqing.li@windriver.com>
>>     ---
>>       ...ert-asn1-perl_0.27.bb  <https://urldefense.com/v3/__http://ert-=
asn1-perl_0.27.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX4=
8Y-Ob64XsIlLznYc1dC5zaWdoSVkg$>  =3D>libconvert-asn1-perl_0.31.bb  <https:/=
/urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd=
_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$>} | 8=
 ++++----
>>       1 file changed, 4 insertions(+), 4 deletions(-)
>>       rename meta/recipes-extended/perl/{libconvert-asn1-perl_0.27.bb  <=
https://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!AjveYdw=
8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-94w=
$>  =3D>libconvert-asn1-perl_0.31.bb  <https://urldefense.com/v3/__http://l=
ibconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2e=
jqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$>} (71%)
>>
>>     diff --git a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb=
  <https://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!Ajve=
Ydw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-=
94w$>  b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb  <https://=
urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd_=
YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$>
>>     similarity index 71%
>>     rename from meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb =
 <https://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!AjveY=
dw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-9=
4w$>
>>     rename to meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb  <=
https://urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw=
8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg=
$>
>>     index 409a8f3896..2548878a2e 100644
>>     --- a/meta/recipes-extended/perl/libconvert-asn1-perl_0.27.bb  <http=
s://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!AjveYdw8EvQ=
!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-94w$>
>>     +++ b/meta/recipes-extended/perl/libconvert-asn1-perl_0.31.bb  <http=
s://urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ=
!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$>
>>     @@ -1,14 +1,14 @@
>>       SUMMARY =3D "Convert::ASN1 - Perl ASN.1 Encode/Decode library"
>>       SECTION =3D "libs"
>>     -HOMEPAGE =3D"https://metacpan.org/source/GBARR/Convert-ASN1-0.27"  =
<https://urldefense.com/v3/__https://metacpan.org/source/GBARR/Convert-ASN1=
-0.27__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlL=
znYc1dC5zb9WqfUzA$>
>>     +HOMEPAGE =3D"http://search.cpan.org/dist/Convert-ASN1/"  <https://u=
rldefense.com/v3/__http://search.cpan.org/dist/Convert-ASN1/__;!!AjveYdw8Ev=
Q!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zb8uIAgkQ$>
>>       DESCRIPTION =3D "Convert::ASN1 is a perl library for encoding/deco=
ding data using ASN.1 definitions."
>>       LICENSE =3D "Artistic-1.0 | GPL-1.0+"
>>       LIC_FILES_CHKSUM =3D"file://README.md;beginline=3D91;endline=3D97;=
md5=3Dceff7fd286eb6d8e8e0d3d23e096a63f"
>>      =20
>>     -SRC_URI =3D"http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Conve=
rt-ASN1-${PV}.tar.gz"  <https://urldefense.com/v3/__http://search.cpan.org/=
CPAN/authors/id/G/GB/GBARR/Convert-ASN1-$*7BPV*7D.tar.gz__;JSU!!AjveYdw8EvQ=
!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbyEBUSzA$>
>>     +SRC_URI =3D"https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Conv=
ert-ASN1-${PV}.tar.gz"  <https://urldefense.com/v3/__https://cpan.metacpan.=
org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-$*7BPV*7D.tar.gz__;JSU!!AjveYdw8E=
vQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZbmCP2Rw$>
>>      =20
>>     -SRC_URI[md5sum] =3D "68723e96be0b258a9e20480276e8a62c"
>>     -SRC_URI[sha256sum] =3D "74a4a78ae0c5e973100ac0a8f203a110f76fb047b79=
dae4fc1fd7d6814d3d58a"
>>     +SRC_URI[md5sum] =3D "1e12b263a5042804bb1c59ddce899876"
>>     +SRC_URI[sha256sum] =3D "6fe4c1ba744c3a8212bf2c9b2703d93530acc153435=
cf2f93633540b439fbbeb"
>>      =20
>>       S =3D "${WORKDIR}/Convert-ASN1-${PV}"
>>      =20
>>
>
>    =20
>

--------------C4AA4E1A53A456F4B5DB253C
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 8/9/21 4:38 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CANNYZj9hr143i7m6AS=moW+AV+q0JaNKdQNd4ZZ6sCqX6yx5+Q@mail.gmail.com">
      
      <div style="border:solid #9C6500 1.0pt;padding:2.0pt 2.0pt 2.0pt
        2.0pt">
        <p class="MsoNormal" style="line-height:12.0pt;background:#FFEB9C"><b><span style="font-size:10.0pt;color:#9C6500"></span></b><span style="font-size:10.0pt;color:red">[Please note: This e-mail
            is from an EXTERNAL e-mail address]<o:p></o:p></span></p>
      </div>
      <div>
        <div dir="ltr">
          <div>Can you please explain the SRC_URI change in the commit
            message? Does upstream version check work and report the
            latest version properly?<br>
          </div>
        </div>
      </div>
    </blockquote>
    <p>Hi, <br>
    </p>
    <p>I have send a V2,&nbsp; and update the commit message. Now, RRS cannot
      report latest version since old SRC_URI not used any more.</p>
    <p> with this patch, It will work again.<br>
    </p>
    <blockquote type="cite" cite="mid:CANNYZj9hr143i7m6AS=moW+AV+q0JaNKdQNd4ZZ6sCqX6yx5+Q@mail.gmail.com">
      <div>
        <div dir="ltr">
          <div>
          </div>
          <div><br>
          </div>
          <div>Alex<br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, 9 Aug 2021 at 08:01,
            Changqing Li &lt;<a href="mailto:changqing.li@windriver.com" moz-do-not-send="true">changqing.li@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div>
              <p>ping<br>
              </p>
              <div>On 8/2/21 9:41 AM, Changqing Li wrote:<br>
              </div>
              <blockquote type="cite">
                <pre>From: Changqing Li <a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>

Signed-off-by: Changqing Li <a href="mailto:changqing.li@windriver.com" target="_blank" moz-do-not-send="true">&lt;changqing.li@windriver.com&gt;</a>
---
 ...<a href="https://urldefense.com/v3/__http://ert-asn1-perl_0.27.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zaWdoSVkg$" target="_blank" moz-do-not-send="true">ert-asn1-perl_0.27.bb</a> =&gt; <a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.31.bb</a>} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-extended/perl/{<a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-94w$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.27.bb</a> =&gt; <a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.31.bb</a>} (71%)

diff --git a/meta/recipes-extended/perl/<a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-94w$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.27.bb</a> b/meta/recipes-extended/perl/<a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.31.bb</a>
similarity index 71%
rename from meta/recipes-extended/perl/<a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-94w$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.27.bb</a>
rename to meta/recipes-extended/perl/<a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.31.bb</a>
index 409a8f3896..2548878a2e 100644
--- a/meta/recipes-extended/perl/<a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.27.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZDWs-94w$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.27.bb</a>
+++ b/meta/recipes-extended/perl/<a href="https://urldefense.com/v3/__http://libconvert-asn1-perl_0.31.bb__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbvAfPTbg$" target="_blank" moz-do-not-send="true">libconvert-asn1-perl_0.31.bb</a>
@@ -1,14 +1,14 @@
 SUMMARY = &quot;Convert::ASN1 - Perl ASN.1 Encode/Decode library&quot;
 SECTION = &quot;libs&quot;
-HOMEPAGE = <a href="https://urldefense.com/v3/__https://metacpan.org/source/GBARR/Convert-ASN1-0.27__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zb9WqfUzA$" target="_blank" moz-do-not-send="true">&quot;https://metacpan.org/source/GBARR/Convert-ASN1-0.27&quot;</a>
+HOMEPAGE = <a href="https://urldefense.com/v3/__http://search.cpan.org/dist/Convert-ASN1/__;!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zb8uIAgkQ$" target="_blank" moz-do-not-send="true">&quot;http://search.cpan.org/dist/Convert-ASN1/&quot;</a>
 DESCRIPTION = &quot;Convert::ASN1 is a perl library for encoding/decoding data using ASN.1 definitions.&quot;
 LICENSE = &quot;Artistic-1.0 | GPL-1.0+&quot;
 LIC_FILES_CHKSUM = <a moz-do-not-send="true">&quot;file://README.md;beginline=91;endline=97;md5=ceff7fd286eb6d8e8e0d3d23e096a63f&quot;</a>
 
-SRC_URI = <a href="https://urldefense.com/v3/__http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-$*7BPV*7D.tar.gz__;JSU!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zbyEBUSzA$" target="_blank" moz-do-not-send="true">&quot;http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Convert-ASN1-${PV}.tar.gz&quot;</a>
+SRC_URI = <a href="https://urldefense.com/v3/__https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-$*7BPV*7D.tar.gz__;JSU!!AjveYdw8EvQ!Jd_YAU5neJJTd04_L8mMcKzJhVrRC2ejqOCW9ZyX48Y-Ob64XsIlLznYc1dC5zZbmCP2Rw$" target="_blank" moz-do-not-send="true">&quot;https://cpan.metacpan.org/authors/id/T/TI/TIMLEGGE/Convert-ASN1-${PV}.tar.gz&quot;</a>
 
-SRC_URI[md5sum] = &quot;68723e96be0b258a9e20480276e8a62c&quot;
-SRC_URI[sha256sum] = &quot;74a4a78ae0c5e973100ac0a8f203a110f76fb047b79dae4fc1fd7d6814d3d58a&quot;
+SRC_URI[md5sum] = &quot;1e12b263a5042804bb1c59ddce899876&quot;
+SRC_URI[sha256sum] = &quot;6fe4c1ba744c3a8212bf2c9b2703d93530acc153435cf2f93633540b439fbbeb&quot;
 
 S = &quot;${WORKDIR}/Convert-ASN1-${PV}&quot;
 
</pre>
                <br>
                <fieldset></fieldset>
              </blockquote>
            </div>
            <br>
            <br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------C4AA4E1A53A456F4B5DB253C--
