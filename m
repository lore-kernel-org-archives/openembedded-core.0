Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9124.1624633956799723630
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jun 2021 08:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=lblFCXuq;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1810590aea=trevor.gamblin@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15PF2a2Y008913
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 15:12:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com with ESMTP id 39d257rnvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 15:12:35 +0000
Received: from m0250811.ppops.net (m0250811.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15PF8B0I016436
	for <openembedded-core@lists.openembedded.org>; Fri, 25 Jun 2021 15:12:35 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
	by mx0a-0064b401.pphosted.com with ESMTP id 39d257rnvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Jun 2021 15:12:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EdFdM0KGsx0S3n6YkhmBKZtKffmyubdYT9D3WaAt77n4cooQoLQKqDmAEMwHblk9gWWtcUeU8GyPHTU525/m4PGXWUjhgbUowRwkbkS9oMhXeInGySmH9U86ETgrysqpLu1PCFC0vvzRk+F9rJCAjSREIYQFmC2He/zK0HQKVGOgKekAl8RdJp7nctRh7zZUuI/ScGlfrK9TElk+KQ2tBime4lOgTlS9d76g4+ZEg0itPCk7GVB0H3Fv2IHggEACNTHB46jLTQIW9VjhHAkVwz/KbvTkeY+AEYwbVddDhpXyV5CLPZs5unhdisWem1cd4kg65L3c3nbHEEv3cqOGSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6j4wiDgfJR7aSKefS8lA5zuwhYKXmtovBncCWMsv8k=;
 b=HHewX8ZgAO0wvwIxRz0xbwOZj54G6RcZU70A80Z/+wavcsXMMw5L/CwBajJ/Hoj84VIWr340cb56YypQUb+1MMFMNB1xwEDyiG/g5ufTYcqfmB/svzNBTWCHsTH/kflc7WW4CcfqXl1Vn11xDA8HUPZvldi9SF9mxBueDu14CC7SDdPOL33eIOKKVy1J1nHYIL3vrIc603OK6SK5iE+0sO+g0U9zmxelBlBXZlFsL3Za23Q1WdpVY5lHvIh75PadnO/g/fC46XG79QYtUuFpg6P9h7GEH4myIu82uVel41WMUDJBCSWP0xz9toNId3alpNvIWXyiusPLwBQoxAgZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A6j4wiDgfJR7aSKefS8lA5zuwhYKXmtovBncCWMsv8k=;
 b=lblFCXuqWgJyerNWv/bR1oMq0tpbQZZAOppjjTmImLzKWHKFicTw5pju3ujj1GuAWZAK2GGDltk+9cW/9VaBWaqnRZYu62uPLQ2YFCAFeDfw7fLby9FIB86vBxAKJhC3W0VRsddKtbPI3jymRRWs7b2QxQoxZjWb+IkwnnJF4DA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
Received: from DM6PR11MB3913.namprd11.prod.outlook.com (2603:10b6:5:193::33)
 by DM4PR11MB5231.namprd11.prod.outlook.com (2603:10b6:5:38a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.19; Fri, 25 Jun
 2021 15:12:32 +0000
Received: from DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::c5f7:bf05:b7c8:ebb9]) by DM6PR11MB3913.namprd11.prod.outlook.com
 ([fe80::c5f7:bf05:b7c8:ebb9%5]) with mapi id 15.20.4264.023; Fri, 25 Jun 2021
 15:12:32 +0000
Subject: Re: [OE-core][PATCH] linux-yocto/5.10: update SRCREV for NF support
From: "Trevor Gamblin" <trevor.gamblin@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com
References: <168BDBDD5F20D493.21069@lists.openembedded.org>
Message-ID: <d7698f10-c615-e115-610e-6b7e03213196@windriver.com>
Date: Fri, 25 Jun 2021 11:12:30 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <168BDBDD5F20D493.21069@lists.openembedded.org>
X-Originating-IP: [2607:fea8:c29d:d7c0::6e79]
X-ClientProxiedBy: MN2PR11CA0022.namprd11.prod.outlook.com
 (2603:10b6:208:23b::27) To DM6PR11MB3913.namprd11.prod.outlook.com
 (2603:10b6:5:193::33)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2607:fea8:c29d:d7c0::6e79] (2607:fea8:c29d:d7c0::6e79) by MN2PR11CA0022.namprd11.prod.outlook.com (2603:10b6:208:23b::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.18 via Frontend Transport; Fri, 25 Jun 2021 15:12:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8c46dac-fb38-4b5c-9c38-08d937eba7e7
X-MS-TrafficTypeDiagnostic: DM4PR11MB5231:
X-Microsoft-Antispam-PRVS: 
	<DM4PR11MB5231F6D3C7D42959F81B9DB69F069@DM4PR11MB5231.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9QRxOvGR2oXS9MeIoa4yzcbukdPi4Q8FLPQksTljEKlrtXjWUpiG8HkdQ3+zQwqcmMnFtFaN3xPRJ/X1kFg+xBS4vq5xu1IbhWqtGSlu31IZr5Ixxqf5eWZPkQOO6bSSFARxvTMWimoZnOtIxX6rRxbQQASs+UpxLzIXoXAhRe+X2ySRPAvcFFigXXlSI3+jQq18WXjXZAW2fbL+sxQDk7+s/qusep97n/RGJzNiGmjW9nHO2OZQw0biURAW/wLqi2K/hC4kPqLsECEGAL/8ztVM3wLliF1mB8XF0UDJEFOIneSBHxZAlu2YZCZBzzz7WMfiOpZydcu6xDUeWF60q0glYPtQXJAXk9GOekD+o6ysC4/6Q/160LR77pFGV11TdxfEu4a3KAGk2Ui6uhCacAFvMH9OYSr31Z5Dr6nLznkBgZfuF6Il9Ol0hNP93skVp5T0qz81PseK9uUJpAbMGE2FIkyVUQjkLkNhXCUuuYLy+70nG60O5AfUcjurkeOKF/QKsKsJJo9qHrbTn25nPpZIwdBH+uQMtpECZE9Iu3JxrXRIbungmSOfiwuyY9tHuO0sMYT3XOpW4sNxrduxVsj4pYpHz4HdTqXKFzIpu4XRacltfgPsWIyDzkkHL5BOAZEPTV+hMdP9ptZBzCYlCX0Nse0jTVE/MBpT8bNIN6dxIEo/N3lLmmwL2YTPG0CD0QfQltekHrNta8dg/oDMSo0KVoK+meM42W+HHJUKot+WIRvZfYr0v2DhVuT916eOoTbCkz7q/wv83g+ds2d/89YEnTaivyS45hRhCa4vJPkdNxfZxGLE62s14C53BKTzjvDzyKxPdDCGqiBa2QMJWWSKHkxeTW2F4crAimLjEcc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3913.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39840400004)(346002)(376002)(5660300002)(66476007)(38100700002)(66556008)(36756003)(31696002)(86362001)(15650500001)(2616005)(2906002)(66946007)(6916009)(53546011)(33964004)(478600001)(31686004)(6486002)(186003)(8936002)(16526019)(44832011)(966005)(8676002)(316002)(4326008)(166002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SVg1QzRkcmFFYkpqcUtPSEo2N0NyTFI4alpMQUdqaVVCYWFjd2wxQ2V1ZFJy?=
 =?utf-8?B?U1Jqb2kxUUZGb0RDbGxaTm9DbVQ5YWNpMTQ3eEJKaGZ0SzVmSlBCSzlXL0dZ?=
 =?utf-8?B?OU91K1RYLzhsNWgwenk3cWZsc0xKNTJqODdIbFBIdk9tNlZYZlpuTCs4aUw2?=
 =?utf-8?B?VmU1Ym9JOUtMSDRuRVFkcFkzTzFqWkI2aXkvM2lkelZXSWRnbWFVQ1hUdFdl?=
 =?utf-8?B?bnYxYjRaM0xUZXc2aWZrdUNHM1ZXMHdaRTdKMEF5MHA3SGp0WWxKWFhGbW8w?=
 =?utf-8?B?WWZZVFNTSUdpVXF6QWxLTlBaRUptSWRwNHVvTW8rcFFjdzNxUWZmNjM3Z0JZ?=
 =?utf-8?B?TzlYd2hHbW5sWDlDcVZ0SHhxRU95RytjcUlRTU11aWd1RE03YlhZbXpWOVRl?=
 =?utf-8?B?ODdkMmpjV2dTaS9iT2xPUjhORXhSUnRHY3RZazZnWGZDNVpXMzRXUWhPSG5n?=
 =?utf-8?B?L0I0SnBOWExhL2FCTnlJOURFZ2xNek9DSkJOMjFqUU9LMGlCNTRiN0FjanRZ?=
 =?utf-8?B?REhKV2h6Q1VZU3Q0UTN1OU1SR1c0UyszUllEMHBGSkR5c1Z4bkc1Z3FGMHJu?=
 =?utf-8?B?cVVEVnhVQjNTTHhNQnBxYTIzR1Bsb09NQnphazM4UE9leVVvWHpzajN5MTds?=
 =?utf-8?B?RERjdE1IeS92d1dQcVFrdmd0Z1h6K2NZbVJRL2xxcTg4bEJRL1E2Mk5kTVFF?=
 =?utf-8?B?UFh3d283aWxXR3lvR29CYWs3dWViQ2pDVzQvbjlCZUNmMnZiaHRhb0dDN1RG?=
 =?utf-8?B?b2duRjhYcVAxUkJ0eXRvRUdaRjAzOFV4N3RaNWlJb21jczRvVVpDRlYxaUZC?=
 =?utf-8?B?TTY4QmxGWng5UldCd2o4R0RoTmlpbDhvbTB0U0NEdjVoSjY3NFRpb1dDcklN?=
 =?utf-8?B?RnpKVFp0bm54OC9hWDYvSE9lYkhwNjc4eWJEb2RNYThQUW1TR0RaaEVaTTlh?=
 =?utf-8?B?Qjg2K1pJTCtuaEtSN01jR005dE5zcEx1VmwrTkZobW1pRkVhUU1ZOUM3NWhv?=
 =?utf-8?B?S2Q2VFA2cDdBZ2VVQlZVR21oUHJlaHpIU2tKanBIMUhpNUVuSExUY3FxLzk5?=
 =?utf-8?B?WjQxVmN2LzdtODlPWnBHeGZHWG5JdDJuSEdPTlBaV0FENTloSThENXl4Zzlu?=
 =?utf-8?B?a3JscDVReEg1TW16T1lEcEJIY3BJN1d0UDhZc1hhRmZPcElIZ3NsM09EVERJ?=
 =?utf-8?B?dUJ4UUY2dXJjT2NERUpkdG45NkszSklSS1RJaTFpbzZTR3ltUUkyVDVtT1Fr?=
 =?utf-8?B?cUljV2ZnQ1kwSlFBUTJHaWpXLzNRTHRtb01nbTk4bm1KOE5YNHR4QmlZZVBr?=
 =?utf-8?B?ZWpIUUtHQnJ1YnI2dC9FdTRENzRJTFVXRWJYbXhCeXJsWC9KQ01NV3ZsWkU4?=
 =?utf-8?B?ZG45R25xQnNwYlduWHMzZmlwdmZEQjNzUnlJYWtQWVFsbVcvT2p4VEpmZFNS?=
 =?utf-8?B?MWxjdnFtK3pvVHlzY2hYUHI3V1IrNWl2dDVxaG9CZnpKSmUvLzRTOExFM1I2?=
 =?utf-8?B?bVloTGkvdGMzZ3pOTkFaNWJRVmI1dUx5aVE0a28rKy9KajMramlsNVFrWmFx?=
 =?utf-8?B?YXYxRlI3OVh0ZFFzYkFmc2JjcFgySmNiMXkwR0V4RGpzMTdZa21rdm4vTDl6?=
 =?utf-8?B?cHRDb2FMT0tqbm9yWGpBU0ZIVUhEcTBQamt6ZnFnWUQ5ays1bW5FY0xoRTJa?=
 =?utf-8?B?MmZRaUR5NTh4OHlubXBPb0xBcHJPQW9RZFJaUEJEU09wdlV0Q044SHdaRmsz?=
 =?utf-8?B?YmxjYk1NS01ENUVKVkUwV1VkZU9TQWFUS3FKTG01ZDUrZUxUaVpuLzJBY3d1?=
 =?utf-8?Q?1NXocZ9LTPlbp1O5eszAzJIoTl/x9N9pW5fO4=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c46dac-fb38-4b5c-9c38-08d937eba7e7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3913.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 15:12:32.5310
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Sx9KtABjZvVmeu9SLUr3yDmN8DyqQrr6807rhFHX4dkh/LfDt6AH9oJ8MTioTLBfbk4vbRz7SgmQKrk6gKn2svvgZQ9CGdP6nYCQypbLh8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5231
X-Proofpoint-ORIG-GUID: 3AezD1BIuywULjtMhdulOuMK2-fK6LYv
X-Proofpoint-GUID: 50j9DIPOnpmsqIyh3siHBOHz5cbBBLgE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-25_05:2021-06-25,2021-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106250087
Content-Type: multipart/alternative;
 boundary="------------816BBE00BAB05C205B723657"
Content-Language: en-US

--------------816BBE00BAB05C205B723657
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2021-06-25 11:10 a.m., Trevor Gamblin wrote:
> yocto-kernel-cache/yocto-5.10 has been updated to support the latest
> kernel netfilter/nf_tables configurations, so update the SRCREV to match.
Just ignore this one, didn't understand the workflow...
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
>   meta/recipes-kernel/linux/linux-yocto_5.10.bb    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> index 877e8d2946..7d5cdaad90 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
> @@ -12,7 +12,7 @@ python () {
>   }
>   
>   SRCREV_machine ?= "6186341e981ad4fd3941c7c9af509923bbe2a2a5"
> -SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
> +SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
>   
>   SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
>              git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> index f99782c1be..1be6ba8150 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
> @@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
>   SRCREV_machine_qemux86-64 ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
>   SRCREV_machine_qemumips64 ?= "769a7118662a2256e20df60be9c9727f9c5878b0"
>   SRCREV_machine ?= "ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41"
> -SRCREV_meta ?= "67dad5ca86bd47dbbaa2194b9854c228055dfd37"
> +SRCREV_meta ?= "b969f83647833d21d8826c4667492f58895213c3"
>   
>   # remap qemuarm to qemuarma15 for the 5.8 kernel
>   # KMACHINE_qemuarm ?= "qemuarma15"
>
> 
>

--------------816BBE00BAB05C205B723657
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-06-25 11:10 a.m., Trevor
      Gamblin wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:168BDBDD5F20D493.21069@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">yocto-kernel-cache/yocto-5.10 has been updated to support the latest
kernel netfilter/nf_tables configurations, so update the SRCREV to match.</pre>
    </blockquote>
    Just ignore this one, didn't understand the workflow...<br>
    <blockquote type="cite" cite="mid:168BDBDD5F20D493.21069@lists.openembedded.org">
      <pre class="moz-quote-pre" wrap="">

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 877e8d2946..7d5cdaad90 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= &quot;6186341e981ad4fd3941c7c9af509923bbe2a2a5&quot;
-SRCREV_meta ?= &quot;67dad5ca86bd47dbbaa2194b9854c228055dfd37&quot;
+SRCREV_meta ?= &quot;b969f83647833d21d8826c4667492f58895213c3&quot;
 
 SRC_URI = &quot;git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}&quot;
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f99782c1be..1be6ba8150 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -23,7 +23,7 @@ SRCREV_machine_qemux86 ?= &quot;ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41&quot;
 SRCREV_machine_qemux86-64 ?= &quot;ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41&quot;
 SRCREV_machine_qemumips64 ?= &quot;769a7118662a2256e20df60be9c9727f9c5878b0&quot;
 SRCREV_machine ?= &quot;ab49d2db98bdee2c8c6e17fb59ded9e5292b0f41&quot;
-SRCREV_meta ?= &quot;67dad5ca86bd47dbbaa2194b9854c228055dfd37&quot;
+SRCREV_meta ?= &quot;b969f83647833d21d8826c4667492f58895213c3&quot;
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= &quot;qemuarma15&quot;
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------816BBE00BAB05C205B723657--
