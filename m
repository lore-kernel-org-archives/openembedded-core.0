Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.3227.1622169633560703922
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 May 2021 19:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=WZuLneSe;
 spf=pass (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=078235fd4e=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14S2eW3Y005132;
	Thu, 27 May 2021 19:40:32 -0700
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by mx0a-0064b401.pphosted.com with ESMTP id 38thst886u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 May 2021 19:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZwNb612vAbr0lu1KrINiUVhH2ZPMqcJ1c86fDkDVpWgZqo1jx2pqhzv6x57kyyokCJ/7EmxJ1LdBju2qDfDEmZpEIh6rbX/iDKGQzJbkSw4kwixSDoZJZdRgAYwmCh2PPq5gqfvAW/518mvfeAVeZqnrvAMWWXrZOR3ebZqj5yUEClcGXWFVjJyaDbvyMoMsBEYIfcbO0W5kpQbKQykCT7kjzDzJr0VO8CKEJjvtACDOQVFRBmEpjkvXU/BkzqyNvwKf754IVvaubZW6c0BnQsoVQceZxfICxp/RF3NShy/aSqYaNC92g97hwxIqlVqrLUByVykpFfix5wBWuoqjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8h2/JJh5Sb3WyJC5ZqNEnbl+9sopdstJ0TPqaGJU3I=;
 b=Co+YgIIktdlmsF+EUAdJTRTMbw0YWebKrG6/btH5N4QbzlMOWTE9EvP6Bp+4pavxHmiDF8r7+mGgalDb2mnSxqjvC8vp47q6o9OEPHVET9fHNegPgyieiUGESh3NW2UX2jHv8ZNnlTanJzQxkMhYf5wrYAg6jQAgA1hb6kEMW3pF9GbGnlCa4Edn4yBPZISbzd/WIiefwVDr3oS4NgnqZmOiR8sptCRF/dfSQuwy2swKcR2O5/2FN6m6bmKWbY8II+3gewvCz9Jq4NZzlCKfh910lYKIv0yLGKpeASu19DR/qqg30W0SkQPCAo/4Z4wVyd1FyRRyprEaN8J+Nqg+mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8h2/JJh5Sb3WyJC5ZqNEnbl+9sopdstJ0TPqaGJU3I=;
 b=WZuLneSe9PCADVgwed+5vS6WGqRAi6qaIknmYCg5My04rfwgTueZUXnIiUhg3COTcNoiw/bS+jYjo3Pw1414R+KfRMfXkG1I5W8Lj+iwGre2sa/KZva6CBHGMTjAunvWN5F/7p8sFNvcnEsjFhZ0fyM0IDUVQSgdMkavecI/cVM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4782.namprd11.prod.outlook.com (2603:10b6:a03:2df::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 02:40:29 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4150.027; Fri, 28 May 2021
 02:40:29 +0000
Subject: Re: [OE-core] [PATCH 18/21] libdnf: update 0.62.0 -> 0.63.0
To: Alexander Kanavin <alex.kanavin@gmail.com>,
        openembedded-core@lists.openembedded.org
References: <20210524091347.419253-1-alex.kanavin@gmail.com>
 <20210524091347.419253-18-alex.kanavin@gmail.com>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <780d86e9-e7bc-79ae-29ca-e4d17b9bc5d8@windriver.com>
Date: Fri, 28 May 2021 10:49:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <20210524091347.419253-18-alex.kanavin@gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR04CA0058.apcprd04.prod.outlook.com
 (2603:1096:202:14::26) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR04CA0058.apcprd04.prod.outlook.com (2603:1096:202:14::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4173.20 via Frontend Transport; Fri, 28 May 2021 02:40:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 61317a60-5024-4675-1c0f-08d92181f446
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4782:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB478242E2E1950CCC5CFF5858ED229@SJ0PR11MB4782.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	A2md80bow/Bhc+qPoSDqpVx6oqbTaaslbbW39P5yJxJpyj48dzYdxkdRO/7qVsBAgLBfp6Z3bafzfW17461+DIPDDuBSxqlthDgon2JN/oUyZxpuLjh76qwdWyyqtjvLxzcb5eGaYPjEW5RXWy990JYfSaNlIV152sI/r4u+crJLa6heqsGJxPvNQK4wJThhHmo+IQE1/hqV5sbzOogEe29BEjHBr+5nKbu+MLgw6DWHPCJ6sCrolLG46xK0KYrGo8tSlPmKi9Plwrag51pH8GoccrmEoZMUS7rHGg1PhQhhfsDK0aMzudCWNfdY/CM+FAG/1Oc5jejvrzaLov52m5w80QmEXxW9TDI7nV+vHRKtggfuKHHyimTqGB6cCMSsbo/9LyW7Ya5cFXOG+T1I7odrJl+4xVB7exZxprTlx6hmZ7KVjfi0GJno+MCRjEnxFlAshgztLaz5jE5cjqnI2tBc3r5ocxWiw3eLeNs/TCiMqQ+LT2xvmWB/2+unxpX7vclupZ3VVObhdED4J6Ap8qbIhQEgfoCjNbOSfzZi0JcVTLYctBiLO9nD3XMncvQYutiUanVECvHVPYZ73j9OJxLsLhHTBRb9tEOAjlzFyVlxgESjwHOVgbLV8NioBXLlRENQ86SKPeXiHaY8xiP8PMGsrQrww1dq/VGPI2IjjegtRrFDtq6F4e7pFuwo0XC9ju3beCQ/GnMqyws9Xd6IkpZC3QxoHiqzQxOjZfcvoOw1a894agccGfRajILK/gdu2rZ/YmdJZ0ORv8WfQB7DckoBOy3lel+OQN7EPfGVis2vxNROFkuOmLRZ7cgcraR7H+FFSDCWFxUoJjauOcmArWaW5Uwml6UjyjN8fmZTCdc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(366004)(376002)(39850400004)(136003)(396003)(15650500001)(6666004)(2906002)(166002)(83380400001)(8936002)(5660300002)(36756003)(966005)(478600001)(6706004)(52116002)(186003)(31696002)(16576012)(316002)(86362001)(956004)(2616005)(26005)(6486002)(8676002)(38100700002)(16526019)(38350700002)(31686004)(66946007)(33964004)(53546011)(66476007)(66556008)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?Q3hYbXJIMGVoOVFzTXdSZzF1Y2U3dW5IMjNFWlBVdXA0VDdHQ3RyeW40T0ti?=
 =?utf-8?B?TFNoOUJnOHdZTnlBQ1FtemEyS2p0Y3BrT2orVzAwckR4RDl6TGJSWmhTeHZB?=
 =?utf-8?B?YnJWai9mYW02bHlJNGdhWVU5WkxrdWRrb3NscUlRNm1uQ3FCNWtuUk1tZGdP?=
 =?utf-8?B?Y3V4NUdvaGxQVHJJcjFBZlh1dEphNFhNck9QWHFvQ2xnZ1FzcGhOMHFzaERq?=
 =?utf-8?B?WEQ5ZGJrTWJSbHhEOVFJS1BLdCtKbWhVNU0zdEVZWmRMR3FiTUttZGY3NEs3?=
 =?utf-8?B?cHMvaS9lNHMrSkhLQ2hoUTBadjlXU2NyMmUxaFp4OC9kTzBNMmJ6UEpVcldJ?=
 =?utf-8?B?M3Zzb2ZLRHZsOGJaSHM3VThnSmd1Z0p3UWhmZEVJSlJCQ1hTNXg3Mmk4b0pP?=
 =?utf-8?B?emNqOWlhOEliZTFuTnMrVlFpbC8xSFRZT2hrUk1NZnU0MXFQekhUMitZYmZo?=
 =?utf-8?B?bjUyWndzN1pLUU1ZQm9Hb0tueXMzSmF6T3didXRDME13ZkxYaTcvaUc5cWhm?=
 =?utf-8?B?ZmdUZnZNT1ZkeDNmK1ZEbHA0R0tzczg2a3huczl0VnJQNXhUY2NkTW1UYit6?=
 =?utf-8?B?SWVNRDRzdjI2K1p4eW9JUXhtTkZGVzNldmVFSldGczhPU2RIUjlnOEV2SVZn?=
 =?utf-8?B?Qy85SGVSa3NZMFFrS20yT0NuZHZLQkt6OWxQTDZQZm5hKzJDbkVCRGlHeWwz?=
 =?utf-8?B?Y3FRYUlsOWF4bVhTcTBhaU4xTUFyRk9GblgrOFU0M2MyUnQ2RndhRTJmanJs?=
 =?utf-8?B?RTlRUmhnbXVpSEd5SFF2Y1FsL0Y0UklvZkVKWjdQRlpERjRIalNtc0JBRHJs?=
 =?utf-8?B?TTlmbjdiRlRONmhpc3A2WFVSZEdtMWc1bzgySmFDekJvWUFrNHNrQUtsWXI3?=
 =?utf-8?B?QXgzVHFIa0xYR3JFVFpDa1V0UGM0VVk4YU05T2drcG95SlF5d1BMdGJIYlZh?=
 =?utf-8?B?KzFXRVp3TG4wYTU5ZkoxMkFWaHoxdUVKTy9LVXlaVVBhQXBXTEl1blhWRHlN?=
 =?utf-8?B?RXZJa0UrWXM4M1dRanpKK242UlNxc2VJZHh2RmNFVm9MUGlyeWlCM3NmNnBp?=
 =?utf-8?B?bW4xQnhkRm1XdmVoZW9yS2U1YW0zamplaUlzS3dhekxseVhzSmp5a3MwNDFo?=
 =?utf-8?B?TDB6N1dWb2ZGVk9HVk5OTDlXcmZEeldnTXpBM2hSdGdaUHVSU3lrTXRETkdF?=
 =?utf-8?B?Z1oxVjdOSlY5ZmE0TjFDamkvTTArdlduNTJ4M3VjRTl1UUR5Yk5NeDk5WW56?=
 =?utf-8?B?b1JKczVoVzhkOWNUMVBDTXBDdDU0SFBubEhFRmNqRllqRTRucWpGWFB3bUFm?=
 =?utf-8?B?anZVUEwxTEdka20rcWtLUmsvRWl3dUo4dlNTN2tRUEkxZUtDUkY1WjVHQ0s0?=
 =?utf-8?B?YjFUdjZWUHZiaWxBYllZQ3p5c1JWM0RtNWdNRFJaZ3ZORVc0L1JtcUNNVVk1?=
 =?utf-8?B?ZkNkNUZaRlhJc0tnWXhSK2xKODRZdXRmdkFKWU1lWHZoU1g5QVlFaTJMcGNy?=
 =?utf-8?B?c1lNQ1pzcE1uNVBFcmEzZHpqdEk4N0RmWHJueU1wVXR0ZWN1L0orU0VyY3Jm?=
 =?utf-8?B?djV4UzBRakQwUEE2VTV0TjREOTZvZ21qUnU2TUw5N0N0aStqeUwvSnV6S3Iz?=
 =?utf-8?B?WEZKaG1ud2F3YlZNcVduZnkrQm9jaUJmWUNTRVJ2T0ZmVWg0bTZPTXZaNm15?=
 =?utf-8?B?S3VBOE9ZaTk4SVdubW9xNGNDU1FEQmF0ZmU4R3RLUEZYTWMyODc3V1c0d0Q3?=
 =?utf-8?Q?AQ1cl2zoeCNKz7JsSz8T+2FwVuuFYXCoy+ZzLk+?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61317a60-5024-4675-1c0f-08d92181f446
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 02:40:28.7696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bG1qSf8AFmEIOIz2Vk0Iz5jLlXBcznTNP+BZa7ZNVooeT3sIISCC+3JonmwRamS379h6r4+lrSbzqG39scuYSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4782
X-Proofpoint-ORIG-GUID: 7LcGkUF3CUYLbz1CC_3LaoFU4b7tAn9v
X-Proofpoint-GUID: 7LcGkUF3CUYLbz1CC_3LaoFU4b7tAn9v
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-28_02:2021-05-27,2021-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=901
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1011 malwarescore=0 impostorscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105280013
Content-Type: multipart/alternative;
 boundary="------------61DAE712AB731359ABA241C9"

--------------61DAE712AB731359ABA241C9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexander,

This upgrade introduces a regression of building nativesdk-libdnf.
`bitbake nativesdk-libdnf' and we can see do_package failure.

Regards,
Chen Qi

On 05/24/2021 05:13 PM, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> ---
>   .../libdnf/{libdnf_0.62.0.bb => libdnf_0.63.0.bb}             | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>   rename meta/recipes-devtools/libdnf/{libdnf_0.62.0.bb => libdnf_0.63.0.bb} (94%)
>
> diff --git a/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
> similarity index 94%
> rename from meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
> rename to meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
> index e2c2c41c6a..79e8865456 100644
> --- a/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
> +++ b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
> @@ -14,8 +14,8 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
>              file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch \
>              "
>   
> -SRCREV = "9a0e17562b19586b3ffa70fa93eb961b558794c7"
> -UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+)"
> +SRCREV = "669a5c691acba91693d238d6262ac99a440aa9b3"
> +UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
>   
>   S = "${WORKDIR}/git"
>   
>
>
> 
>


--------------61DAE712AB731359ABA241C9
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Alexander,<br>
      <br>
      This upgrade introduces a regression of building nativesdk-libdnf.<br>
      `bitbake nativesdk-libdnf' and we can see do_package failure.<br>
      <br>
      Regards,<br>
      Chen Qi<br>
      <br>
      On 05/24/2021 05:13 PM, Alexander Kanavin wrote:<br>
    </div>
    <blockquote cite="mid:20210524091347.419253-18-alex.kanavin@gmail.com" type="cite">
      <pre wrap="">Signed-off-by: Alexander Kanavin <a class="moz-txt-link-rfc2396E" href="mailto:alex.kanavin@gmail.com">&lt;alex.kanavin@gmail.com&gt;</a>
---
 .../libdnf/{libdnf_0.62.0.bb =&gt; libdnf_0.63.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/libdnf/{libdnf_0.62.0.bb =&gt; libdnf_0.63.0.bb} (94%)

diff --git a/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
similarity index 94%
rename from meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
index e2c2c41c6a..79e8865456 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.62.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.63.0.bb
@@ -14,8 +14,8 @@ SRC_URI = &quot;git://github.com/rpm-software-management/libdnf;branch=dnf-4-master \
            <a class="moz-txt-link-freetext" href="file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch">file://0001-libdnf-config.h-avoid-the-use-of-non-portable-__WORD.patch</a> \
            &quot;
 
-SRCREV = &quot;9a0e17562b19586b3ffa70fa93eb961b558794c7&quot;
-UPSTREAM_CHECK_GITTAGREGEX = &quot;(?P&lt;pver&gt;\d+(\.\d+)+)&quot;
+SRCREV = &quot;669a5c691acba91693d238d6262ac99a440aa9b3&quot;
+UPSTREAM_CHECK_GITTAGREGEX = &quot;(?P&lt;pver&gt;(?!4\.90)\d+(\.\d+)+)&quot;
 
 S = &quot;${WORKDIR}/git&quot;
 
</pre>
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

--------------61DAE712AB731359ABA241C9--
