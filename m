Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web09.17614.1621821452380526618
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 18:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=aHWkuD2Z;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=077818ef51=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14O1qhQ3015106
	for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 01:57:31 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2176.outbound.protection.outlook.com [104.47.56.176])
	by mx0a-0064b401.pphosted.com with ESMTP id 38qk95rctv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 24 May 2021 01:57:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZwlbMMoID4vEGJx0QhtYPEoeU5b1t+Xi35PSqaqWesTWao+yUTCaRYs5rPKXJmUYu/SBdD3JDL7lGcVkwL/nFw2qEwPd2JvP01dIjdfQMAP74ACwH4NoqMZRgU1evu0m6gS2qLUoEEyMW1yz3M8I+YQYU7qeyoXoI5SxAQGDuyS3yjK8H6B0fjbX+AY4u3k5JAS9qVUusD4KqNUlYjRB49EC7A9l+ILF8V73w5OskQM7pHdcMkipI6CrG8KMaPHnyPEsjpSg8of7xp8IsdpwkqslGKqdMe1112m05otqSXdtqEZ/EgZpT7uG9O9teW5zJ7N9FLUFZ1HiYh2WtBvtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn9u/cTSZe1F8TShQ0FeBR2NTrFAnRETq1aT2Ni1vcM=;
 b=gOr3zkTr7vnCBm7AP/8zbOkvsQn7MEsxeBHiTSz97LP8+Ob/caGW3C67UHcPq/CSG77vTTGvc9zwDqh9IaCiCu+HxNArwCkRBDSW6Ql6NiN+hh+Di62dS8X3TDj9p+dlNVvQPqp7o8lwB1cBvxHl+UhM4JDU3PT3KDL7mxJBGEpMEhAhSzMuntvsXnU0BsyloVR7FimffaOhgYuh9Tkg9BjV1OKa0LtaAOoKnzGW87ahU1EGxWqOHewG3Xb4rE963TIukdM1abEon1xesW4EmOSsCMqyBk1iG2WxK2zhgQADKbMxesbdJT/bBXZ2puk16hRFSG7G25CXoL9oqeBAAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nn9u/cTSZe1F8TShQ0FeBR2NTrFAnRETq1aT2Ni1vcM=;
 b=aHWkuD2ZO0ZUSsukknykQUWYXyvw71oLVEuqxS1dUfCcYH51d3JPPIzFHvFbUkCw9xdWLrRo1YyDx6Q76daquUVAUy5F3bit5KfbQdHAaJ8jUWYxS63gJXE0A5orwh7RoZVeiIj8GJd/vArANlgz8oVBLpGd17ez/Y1u2n7nJ9Q=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Mon, 24 May
 2021 01:57:27 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 01:57:27 +0000
Subject: Re: [OE-core][PATCH] rt-tests: update SRCREV
To: openembedded-core@lists.openembedded.org
References: <167FCF3280BD92DF.4128@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <bc9568f4-c832-6f0a-d9e9-6a8caf3189ba@windriver.com>
Date: Mon, 24 May 2021 10:06:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <167FCF3280BD92DF.4128@lists.openembedded.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:202:16::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4150.24 via Frontend Transport; Mon, 24 May 2021 01:57:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b63c8664-3762-4d27-ec37-08d91e57482a
X-MS-TrafficTypeDiagnostic: BY5PR11MB4308:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB43089541A934F9F916357FC8ED269@BY5PR11MB4308.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TpatlnIycFvxMn045Wc9VjlQI1hAG3KIiffre66sSs/WXEL++oDcwXyQbUE26nOKkDEdBB5WW/9QAvs/AOXB6nDylpcxt7en2aCbPAdUgcT/8wWAVA9K8eA2mIvLMVlPDlbUm3EcSyVlzK/oJi/P0DbJrzmaLK6y+94EaEU6jJy9U5qu6jjUWi9mvMh90wTchgiQufPSIUEchWkXtspMGCR0nVEIwUs2SoJG4JdoFg4rX93cqb39u8a3MeYWcTcZR6jVO9bO4d+FwIsyuKn7xOUP8O0Gmjsz6JWhfDREhW3b0Qkz43LPWKNbZxKyZRAGxZhig6a3lHbteI2koAnjsVbN7NJ4hQAu10mVXNev4nDCBW0QLKgbEQ0tNB+IMOjujos94h6/O2Ut5R+e+LtagDv/q3EvQ/shq0TBO37hVtcyu0WENhzGaF1XPHC4pZRskdrvN60uxr3qsGHTHt80nVnYwk6CbCaNz4NWapLbIT1NFEiwp1zybmv/dKVuXVcetnb/15yHGxuQ7Ws4vViEXrPW0SfrvFNwbT5DBjQRmxJq2IXEG341/dquWAmtVelZ6xydv5gb23Qpjgx/+Z0Suk1kK6TW15OKKBvKvA4nbuv8+Guj4SV3ln8Lk4dt1hLOAE84V8CKPOj6MKQmqmBamsRhScdmBZpIk6sfJGgBe/pCQb0recVRWOqK+QxOlvfS+onG6UAPa894buuZVcN7YBU8sVY3AVHtI4nCo+3GzXo4/8kwWjmoT2ipx1JoqLi2hqE5hF0PlQ0wAdGJEsyZ28haZS0h945e99BodZLqIGZsyeD3w4JETZndkIYHBkfIL4ILAaVG/IGSXmZtqFJE+mFvh0GiBqxrGDUXN3BuIPM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(39840400004)(396003)(346002)(376002)(136003)(8676002)(166002)(2616005)(15650500001)(26005)(52116002)(956004)(38100700002)(38350700002)(6916009)(31696002)(6666004)(53546011)(8936002)(86362001)(83380400001)(33964004)(16526019)(66476007)(36756003)(6486002)(2906002)(66946007)(66556008)(316002)(31686004)(6706004)(16576012)(186003)(5660300002)(478600001)(966005)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?b3owdWpVR2RKSnBJSDFZVGx4YkRxdytzUWcrUENSeXNnTjdLNWIrOER3THp5?=
 =?utf-8?B?UUJmb1JTTUhBR1MvaFdXVWdwTUR1M2xlOHBNZUdjM09DUFdQb1JQT2dxV1RQ?=
 =?utf-8?B?ZUhoczFQcVBDZlhKMWJobVQzWVB5L3k2c2k0dEEwTmorK2lwc1Y5U2gxa2VE?=
 =?utf-8?B?bDJYbjZPdnRxc2pEUmhUclZuWWZGWnBadVg3TGY4VUNPV2NNM2llNnpQb3RI?=
 =?utf-8?B?NzFxWHRxSkhITnRnVGVYU21IcVFHUGRFRklLRGczdEk2QWVyeWdnN0o0Z1dz?=
 =?utf-8?B?WXRkSGdod3orSU9mc2NPbDJ1RWFMYS8vYngyTXU3MldqVWI5NVJJSGpiSzdl?=
 =?utf-8?B?M2pYcG03Q3piQ25IQUp2TUlXc2Mzb2pTTE5uNVQ1V2lZUTV1b3A2aWhibHJw?=
 =?utf-8?B?UVlZYnVObzFEOU55c3FvMW92WURtNlhCZVFyeEdaSGVvUHJ0YnVhSHRZb0VX?=
 =?utf-8?B?L2NjU3B3N1RPWEhQcFRieDh6RmI0UklvOU1CTHBOQzFGeVBxY240a1ZLdXU4?=
 =?utf-8?B?SXJDa3R2aUc4QWtmajE4S3lnVDJ1OTJ6Ri9KZFRVZVdvSDZxazRmZ2JmVHZV?=
 =?utf-8?B?SjhmcGozVjF2UW1oa1ZCR1ZvNmptQWlia3dRS2xGSnc4b1ZMMURNR1hjR3Bn?=
 =?utf-8?B?MlVBRnRtbEgrazFQQjlwN0Ezb092L0d1dEZCbjk4eXNJU0ttRmd2d24zN3Jw?=
 =?utf-8?B?SE41VU9GS3E2Qm5rbVk1clRTUjFpRkIxeEVUSWhZN0ZMeFdkMkVzeTJ2Q0Mr?=
 =?utf-8?B?UEtFb3BRN3FORitGNmpGUWNXTDVMVHVaMTRKcFI1eWJrVi8xdGUvOFZUaHY2?=
 =?utf-8?B?d0xCTUVjcFpBenAxMU0xTEExZGJnRDdmYlhlVTkyR3JQbkk0U0g5SFc2aDF3?=
 =?utf-8?B?cW41aXo2U1BrTFpTQTg5MHh4Y2VJeFVad3gwRjZ6NTlZWGsvMUdQMVdsbksv?=
 =?utf-8?B?SlA3WmQ1TlF2cVVQalVSVWR5UEpWNThTblo5QjlkeW1VMXdzT0FCa01KdGN2?=
 =?utf-8?B?KzlMd1pCK2hURTVXYm5Nb0RWOURTRnZFVDYwdDI5Q3NyMjJ0VlVIWFZOVkpl?=
 =?utf-8?B?YkczQkhqUStueGo1NmhSZVpJa3M1M3lkc1l4b3lwa1c0YTl0NVoxaC9sazVV?=
 =?utf-8?B?YzRLNkEzMTRlRWx5U3RLenAwaGdlUS9reVB1YXFBZm9LUkdqYThpd1JjMzUw?=
 =?utf-8?B?ZUZWNnF2TnFPZHpKWGFZQk04SDZFd1dNV3lCSEtmb0xNbi9ROHEwNzVmYmhq?=
 =?utf-8?B?SVFzdU16VlBYd2tmS3Vxd2h4ZGU1TzduamVoMDhaaFQ5blRzQkx6Y2FIMTNN?=
 =?utf-8?B?cWw0UnBvR3NIUlprNEtUbElmSVIzZmZqRWM2bjEyb2dmQUJIS1N2dlJXbzJT?=
 =?utf-8?B?RE43M1hWekVDa1hpUWkzY1F5ejhkUFROQkZBWldTWnRlTGNQN0tOVldrNHh1?=
 =?utf-8?B?MzNNUUNPUmwvTnRVM2swVGU5NW5rSnp5cm5NaU1hbmtWMVJDa1hka0dwb0Rz?=
 =?utf-8?B?bXZEU1ZQUDVmMFduK0xJb25sRkpoU1B3dDkrSytlUkRlZG01cmttUmtoemQ2?=
 =?utf-8?B?ODJxUEozdjBPeTB0K0E1VHljSmRIR0Nyb1VjODhsUENHQzFhUDVHWW5KMU1u?=
 =?utf-8?B?OUY3bk5QMTVBRTFJVE5OU2EydzJpejg0MU9vcyt2RHM2azB3K2s3QVZpcFZF?=
 =?utf-8?B?RGFQRFhRVmtIK2xtaXJrK0lPclBNbzVPUGhSVk9ZVzJnSVRpZ211aTdzSWF4?=
 =?utf-8?Q?OOC/USJICg16OkZBQEF1D/pELvGDpbRYXWUZuPX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b63c8664-3762-4d27-ec37-08d91e57482a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 01:57:27.5134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y+jH8d7EhSn+hOZqJAJkImpBQ9g92a9gUX3zF8F6DXhm2HOn/Es11huGOzjjFO6HyW+CLOgEeE0JKCAAcfizdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
X-Proofpoint-GUID: XTrcoO4W-GF7R9u91Jnv6fa5X2QekpdY
X-Proofpoint-ORIG-GUID: XTrcoO4W-GF7R9u91Jnv6fa5X2QekpdY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-23_03:2021-05-20,2021-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240010
Content-Type: multipart/alternative;
 boundary="------------939E59C0021DC8689D02B1FB"

--------------939E59C0021DC8689D02B1FB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

ping

On 05/17/2021 05:03 PM, Chen Qi wrote:
> The commit '6af88067da16c6e69243b376c3b6454ec694460b' is not available
> in the repo any more. I think it's due to some mis-operation of the upstream
> repo in the past few hours.
>
> Update the SRCREV to use the latest commit on unstable/devel/latest branch.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
> index 0c89bad91f..1600f5813b 100644
> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
> @@ -1,5 +1,5 @@
>   # Version 1.8
> -SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
> +SRCREV = "c9051a36d934503b4673ca5615f631bae36dead0"
>   PE = "1"
>   
>   SRC_URI = "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest"
>
>
> 
>


--------------939E59C0021DC8689D02B1FB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">ping<br>
      <br>
      On 05/17/2021 05:03 PM, Chen Qi wrote:<br>
    </div>
    <blockquote cite="mid:167FCF3280BD92DF.4128@lists.openembedded.org" type="cite">
      <pre wrap="">The commit '6af88067da16c6e69243b376c3b6454ec694460b' is not available
in the repo any more. I think it's due to some mis-operation of the upstream
repo in the past few hours.

Update the SRCREV to use the latest commit on unstable/devel/latest branch.

Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a>
---
 meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc b/meta/recipes-rt/rt-tests/rt-tests.inc
index 0c89bad91f..1600f5813b 100644
--- a/meta/recipes-rt/rt-tests/rt-tests.inc
+++ b/meta/recipes-rt/rt-tests/rt-tests.inc
@@ -1,5 +1,5 @@
 # Version 1.8
-SRCREV = &quot;6af88067da16c6e69243b376c3b6454ec694460b&quot;
+SRCREV = &quot;c9051a36d934503b4673ca5615f631bae36dead0&quot;
 PE = &quot;1&quot;
 
 SRC_URI = &quot;git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest&quot;
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

--------------939E59C0021DC8689D02B1FB--
