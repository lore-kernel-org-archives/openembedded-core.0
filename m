Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.17847.1621821524300105294
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 18:58:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=OvH41zQM;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=077818ef51=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 14O1whq1024265;
	Mon, 24 May 2021 01:58:43 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
	by mx0a-0064b401.pphosted.com with ESMTP id 38qk95rcuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 May 2021 01:58:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXe/r4iY5EvKnboALvHGHmY9EP0uSB6mF7G+YpZp21bRTy8H/JuUS2HaGqZQFyIuVqAND4Mo+yPoOjllU/YbcHkMNmrOntUYaBWI1F/zErp+GftqI4T7f8Mnbs14MfLzSFB+2kNC98BdzOnJu5pi+n4/ns0gZKDQGTda9Qe9laojhP4sUWOA0A3OIhA4+e53dGI516D1azgTFNhoMdmSPhjOQsWOz0/PwJ9aEK7GryYCLKJpeflg28Xgwlq/1EP51w68BxBNZ4d7OLdRwNoPjg6wCUjp7nJDWO2KfGO5BMkkXD/nCrRPSTjCjFM1fKl/f1vCjV+jynHFirO+4BXGgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiblWVK8pG2d5W+pmjvlJKwc91qoGmKpKZzW/YN+FAI=;
 b=Aja6+N6gSHu1wy7EKCz5rosd6JDtwiDZ4tc8tqza0+ln9SWFrFmVPL3ocYqQ1DmsKXl5s5cypvC6h3sXhb59/wZ9U5VpoHrm+qI6J6/iq9C2r1N1Y9Q7LZAbV8eGzmtgyMTQ1DiIiV3mpqdPrPcm8bkIug2Jd0jQtZWhPfl2sHv8ZHjcOvob2EhOjpZfoweiLEOJJMyMZQiiJceEh8rgl4wpJQLaYOa0Iw7n/bVi/236jVlQnI6gGtvaJCUtjwMoesvBG4ijfIhcb90Tls8ajPDD7unpcXF2Qg01uoj8gS/ReDuqkkeCEjx1e1vv5fuAX4f5hCScgpzg/zPskSJWUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiblWVK8pG2d5W+pmjvlJKwc91qoGmKpKZzW/YN+FAI=;
 b=OvH41zQMGHz40QtIzZybEKsMws/c2lVQV79EgzZOMZq2NtDFLlN6PGeziNE0XVstWI4RRSZ1bsl6NVmzsUeaOF/RaP+IHp9qhOQkkBGsrptN4QZcdxFwCTnac8znYtJVd36iXwKGkgEaMPCaxSS1MT8vrFsBhAItR0V/3dAIfSk=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BYAPR11MB2918.namprd11.prod.outlook.com (2603:10b6:a03:92::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Mon, 24 May
 2021 01:58:38 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 01:58:38 +0000
Subject: Re: [OE-core] [PATCH] rt-tests: Update rt-tests
To: Martin Jansa <Martin.Jansa@gmail.com>,
        "Zhang, Qiang" <qiang.zhang@windriver.com>
References: <20210430065946.1475-1-qiang.zhang@windriver.com>
 <CA+chaQdUUJUWO3KR53KMhS+Z0awz3pdeGNFaOcK+VTaBQ487pQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <31d6ac76-270e-4a9a-217d-83b07a9589cd@windriver.com>
Date: Mon, 24 May 2021 10:07:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <CA+chaQdUUJUWO3KR53KMhS+Z0awz3pdeGNFaOcK+VTaBQ487pQ@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:202:16::14) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK2PR02CA0130.apcprd02.prod.outlook.com (2603:1096:202:16::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4150.24 via Frontend Transport; Mon, 24 May 2021 01:58:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32636c35-b31b-4056-9fb0-08d91e5772ae
X-MS-TrafficTypeDiagnostic: BYAPR11MB2918:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB29183230AFFDACF6828C9A60ED269@BYAPR11MB2918.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7YAOjQPA8gGc/as4tEcItK4xPoi26M2zkZB+39nBinMd3TV8tDkxJ3MEyUjEiSum5Wvq4gvZ7mcy00WKYOUMjtAb6h6xbXl6IfoqSgi1Bvlq4z++lIawuynOyEqncbhht1zt1DXmAVk8PcZ6vCo/TSe7dU8VAMcN5IVgFAaH10Fy/4i+EM78PAWDmQKUF6NKSoDGEkm5i7Lo867swIWLhUbPHooCcsdfc+pCxTBA+GQI4TSuJXBrsZcDl1nUw1G4sxLFLTPTZIvnEhjuprrlONwJsJaFo/ebUacGgsZx2bW/v/NAUR1/na7HW9EvnlcTqjBIyOPrxbw4L1EhIHx0kLlxun4SfdxiVw4+SpVmLFN6DsBSLACPkgt2OEQOzz18nnxRcxxKlNbbdRTZsGv+lj29gwJs7DrOdGgJnDkmFmtYBbgYidaPXbRIqhnn6fNscNJGt9+mYHI2gCu2MiHsGbXUobsfRs7edCqjRfwp8/gRa+Sz2i4Df9nfOZLUBnd3QSJJtWM16sOQfZp2NiUROfkWqPDgn42wLME2DOl+bmQcIjzwNlpTLRjrFcyWKd8n2z9AkUmZKfGoIriV5CW9pCeVN8ANSETaGklPyNUL+j46vFdAwp7gK8vm+WGJ59K07mb3FNlTqZhxuoIaoHDu4F4G6MBE66+7x3Y3zHCUxw5Yy9GmHzE9l2J4/msNF0ZtskKzUtztlwvr7fsYptlPKra2kqrqvzPzx8TSEk4HvRlmt2Sg3Ini6xuL+Ont0Y0wTRz7tb8esDNh7rP9VXnspnceJIJqTJ3zvWB6ruNjcWiqCoxeAejTEWUBzrK5n3TehNrPrh+E8pbEGhua2aj35ctlo5kYBaUXlON7fy7aVhM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(366004)(136003)(346002)(396003)(376002)(31686004)(5660300002)(966005)(4326008)(16526019)(83380400001)(6666004)(316002)(16576012)(8676002)(478600001)(36756003)(186003)(15650500001)(110136005)(31696002)(2906002)(166002)(6486002)(66556008)(26005)(38350700002)(6636002)(86362001)(6706004)(53546011)(66476007)(38100700002)(2616005)(33964004)(8936002)(66946007)(956004)(52116002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?OEpKL24rL3RNUmE1SC9SU3FjQ095bjBYbm44WmlMZm9RVDJWZjk0V2pNWkZu?=
 =?utf-8?B?OWMvaEFtNHVZQVRIMXRDaDk2T1Ixd0JzaTh1MlpLSDBQRndKU1RmMmh0cGxw?=
 =?utf-8?B?dk5FYU1JaGRZS0t2bXNPZGw1enJQUDVpOU40SVFhVm53QkdpOU13MWVWMVhr?=
 =?utf-8?B?dWs0WFhyQ2R0UCtIZjg5ekZLbGt6WkxPQzVKdjNRRnVaS1BOM1pOSlJ6d2dN?=
 =?utf-8?B?U2RDck40MnFmMWVLWlJ0cmRCRDNhaStuZUdSRnJTUyt6Zzk0dmpBdFdmdCsz?=
 =?utf-8?B?ZnJkTFNUSkdUeWp6VWJTQnpwcUhFZGw0R2k4TGdkR1M4czI5ZmRnb3JEa0hU?=
 =?utf-8?B?aEtOWFBWSTRZZHN2NWE4bXZqSWxpeGdMOEZ2QXJQYUNiek1hcHJxSXRVUk9X?=
 =?utf-8?B?Q3J1SWlUOFNlR1NicWZSMmpURXZuZGhidmdSM2ZKOVoxWG43TURkWVc0c0pu?=
 =?utf-8?B?S2NQTnhMVXg0YkFVTW55T2hWQm1EY1dtMDV3QXp2TE1WMnVtR1pyNzZFOWdO?=
 =?utf-8?B?eGxjZUdXMTJoc0FSU0xTcFUrNlNLNWFBMzE3cDJEMzF6d05qa2x3V1NlOUFx?=
 =?utf-8?B?dytJYkMzeVhaV0lqYkNZVHpVcWc0ZVNPSS9kdXdqcjhwemQxcnNsczZ3Qm5t?=
 =?utf-8?B?cnF3d3pxZ3RocE1zWTVmQnZ2bkl1c1V0TEgyM3NPa1lJSGI4RXJhTm1tdWE1?=
 =?utf-8?B?VlRLOVkzeXhKZEUvNzZXL2cyTkRWUmV5a2I0cW5DeXRxeDVKVi9NZGlvUWF4?=
 =?utf-8?B?SGZta1ZrQW9kdU1BU0hHN2tOWlMzc2xuSnpVRWV6dlpGYk1qR3JGREdVc3Vv?=
 =?utf-8?B?a3ZDMUdNNWFBUlYvTi9zL2JoV3pLZHlSUVMwc3F6LzBXSzZLdlM1VUZIcjd4?=
 =?utf-8?B?Z2hSZGlZOENOYVovVEpaUm92L1BnbG9LOFdyU0l4WStMNzF0OUVId01KRTFR?=
 =?utf-8?B?S2ZNQ0tiMkRJNHlLTVhWZUhteHU3VFNBMzNhaGdjUHlhd0NldHg0YUtYQmR1?=
 =?utf-8?B?cnJHTThLei8rcVFDeGJxUitaMEJUN3VOMHVKcy9uNFdPdFNxTHFjL1VlQ24z?=
 =?utf-8?B?QkVQaC9LK2hPNHNCVHQrTW5obVRQR0dzdlBDU3dxbGp0L202VXpGQkdtb01x?=
 =?utf-8?B?QjVMdlpPRkNPdDVzbWY2d1BHbk5XZmNlNkRpT0kzdDRSSDlrZGxhQ1RVenYy?=
 =?utf-8?B?SDlXSXRvMDIrWjY0UmJWL3JiVkc5SVlFeGFSdFRCN2dhVC9BSUpVdDFDcVdp?=
 =?utf-8?B?ZldTMjIzSmowNlo2ak1Gb2xmK2pSVW1NL0p4TFlTZXFhN3NzRFZUdUxHS0dv?=
 =?utf-8?B?ZFFrVGdrK1huTmVyNXpnelFLUHl5YjFPQ1ZCeUpJc1hDNXZiRmpFNGk1WkRk?=
 =?utf-8?B?V2lEczVndHMrZEZLOFRmSWg1MlFDNzkweElmSEVVU3YvZVk0VDJVdDJySURN?=
 =?utf-8?B?NGw0ZGJ0VlVlRFVyQ2s4dmcwL09RTmNQQkc5bFR6cmVmTlE3RjVTMkJRSjh1?=
 =?utf-8?B?dXdQQnRGdkNCNFBnK0x5NlNLTDBnYzZzUjRqSnVoQlE4SWJwL3V1WnZQNUVq?=
 =?utf-8?B?cCsvWDZyd3Z0aFB3MmRCYmZKM0hUU3llOEdjbHFuazVQa0JvNmQ3NlRzMEtQ?=
 =?utf-8?B?a21rSWlVbmlKMm44ZUw0OVRYS1U2ckxMOS82QnJyYXNRdGJXVUk2R1kraFZ4?=
 =?utf-8?B?Z1ZXOHU1emJKMVVJajhjRWVpdnJCUFNzNUM0U2p2RE1aWFFsK1RIM0JRQnNS?=
 =?utf-8?Q?3lJkmYKl8pyp4hpCa8aKQUCha8rfpE9ZGTnFutG?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32636c35-b31b-4056-9fb0-08d91e5772ae
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 01:58:38.8028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nzRofAYonDOVzr1LUumui5qK4OIyIDtKMxtRYbSr3102y4kjeEtE3ziPWvD1HNCEEzSV9lP947z7F7lyAeVdqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2918
X-Proofpoint-GUID: vNP2ndgOnhv2nt61OdFGRNEpf2jFFcZ2
X-Proofpoint-ORIG-GUID: vNP2ndgOnhv2nt61OdFGRNEpf2jFFcZ2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-23_03:2021-05-20,2021-05-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240011
Content-Type: multipart/alternative;
 boundary="------------42F91E84AD4A3E7BEF9C90C7"

--------------42F91E84AD4A3E7BEF9C90C7
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I talked with Qiang and sent out a patch to solve this problem last week.
The title is "[OE-core][PATCH] rt-tests: update SRCREV".

Best Regards,
Chen Qi

On 05/23/2021 02:39 PM, Martin Jansa wrote:
> Hi,
>
> this SRCREV no longer exists in rt-tests repo:
> rt-tests-1_1.10-r0 do_fetch: Fetcher failure: Unable to find revision 
> 6af88067da16c6e69243b376c3b6454ec694460b in branch 
> unstable/devel/latest even from upstream
>
> rt-tests$ git branch -a --contains 
> 6af88067da16c6e69243b376c3b6454ec694460b
> error: no such commit 6af88067da16c6e69243b376c3b6454ec694460b
>
> the old v1.10 SRCREV still exists in defined branch:
> rt-tests$ git branch -a --contains 
> 32819581cc0509c9d58c33c3061f57abe0c40c88
>   remotes/origin/unstable/devel/latest
>   remotes/origin/unstable/devel/no-numa-runtime
>
> rt-tests$ git show-ref -d v1.10
> d232f528fd131b7d840e79a3756d1dbdaa9b1b60 refs/tags/v1.10
> 32819581cc0509c9d58c33c3061f57abe0c40c88 refs/tags/v1.10^{}
>
> Can you please fix PV to indicate that it doesn't match with 1.10 
> version anymore and update the SRCREV to something which exists now?
>
> Regards,
>
> On Fri, Apr 30, 2021 at 8:59 AM Zhang, Qiang 
> <qiang.zhang@windriver.com <mailto:qiang.zhang@windriver.com>> wrote:
>
>     From: Zqiang <qiang.zhang@windriver.com
>     <mailto:qiang.zhang@windriver.com>>
>
>     When run cyclictest, the parameter enable NUMA. but in some BSP
>     which not support NUMA, will causes the test program to exit
>     directly and does not carry out subsequent operations, the
>     latest changes have fixed this problem. so update to the
>     latest branch to resolve.
>
>     Signed-off-by: Zqiang <qiang.zhang@windriver.com
>     <mailto:qiang.zhang@windriver.com>>
>     ---
>      meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
>     b/meta/recipes-rt/rt-tests/rt-tests.inc
>     index 9358f13d06..0c89bad91f 100644
>     --- a/meta/recipes-rt/rt-tests/rt-tests.inc
>     +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
>     @@ -1,5 +1,5 @@
>      # Version 1.8
>     -SRCREV = "32819581cc0509c9d58c33c3061f57abe0c40c88"
>     +SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
>      PE = "1"
>
>      SRC_URI =
>     "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
>     <https://urldefense.com/v3/__http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest__;%21%21AjveYdw8EvQ%21LmrhADE_pizwsseLouVODl2xByKZt-B7V6l43HZZ6ykhrJXHXvOYYZDsxWEZZTHh8w$>"
>     -- 
>     2.17.1
>
>
>
>
>
>
> 
>


--------------42F91E84AD4A3E7BEF9C90C7
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">I talked with Qiang and sent out a
      patch to solve this problem last week.<br>
      The title is &quot;[OE-core][PATCH] rt-tests: update SRCREV&quot;.<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 05/23/2021 02:39 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote cite="mid:CA+chaQdUUJUWO3KR53KMhS+Z0awz3pdeGNFaOcK+VTaBQ487pQ@mail.gmail.com" type="cite">
      
      <div dir="ltr">Hi,
        <div><br>
        </div>
        <div>this SRCREV no longer exists in rt-tests repo:</div>
        <div>rt-tests-1_1.10-r0 do_fetch: Fetcher failure: Unable to
          find revision 6af88067da16c6e69243b376c3b6454ec694460b in
          branch unstable/devel/latest even from upstream<br>
        </div>
        <div><br>
        </div>
        <div>rt-tests$ git branch -a --contains
          6af88067da16c6e69243b376c3b6454ec694460b<br>
          error: no such commit 6af88067da16c6e69243b376c3b6454ec694460b<br>
        </div>
        <div><br>
        </div>
        <div>the old v1.10 SRCREV still exists in defined branch:</div>
        <div>rt-tests$ git branch -a --contains
          32819581cc0509c9d58c33c3061f57abe0c40c88<br>
          &nbsp; remotes/origin/unstable/devel/latest<br>
          &nbsp; remotes/origin/unstable/devel/no-numa-runtime<br>
        </div>
        <div><br>
        </div>
        <div>rt-tests$ git show-ref -d v1.10<br>
          d232f528fd131b7d840e79a3756d1dbdaa9b1b60 refs/tags/v1.10<br>
          32819581cc0509c9d58c33c3061f57abe0c40c88 refs/tags/v1.10^{}<br>
        </div>
        <div><br>
        </div>
        <div>Can you please fix PV to indicate that it doesn't match
          with 1.10 version anymore and update the SRCREV to something
          which exists now?</div>
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Fri, Apr 30, 2021 at 8:59
          AM Zhang, Qiang &lt;<a moz-do-not-send="true" href="mailto:qiang.zhang@windriver.com">qiang.zhang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Zqiang &lt;<a moz-do-not-send="true" href="mailto:qiang.zhang@windriver.com" target="_blank">qiang.zhang@windriver.com</a>&gt;<br>
          <br>
          When run cyclictest, the parameter enable NUMA. but in some
          BSP<br>
          which not support NUMA, will causes the test program to exit<br>
          directly and does not carry out subsequent operations, the<br>
          latest changes have fixed this problem. so update to the<br>
          latest branch to resolve.<br>
          <br>
          Signed-off-by: Zqiang &lt;<a moz-do-not-send="true" href="mailto:qiang.zhang@windriver.com" target="_blank">qiang.zhang@windriver.com</a>&gt;<br>
          ---<br>
          &nbsp;meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-<br>
          &nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
          <br>
          diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
          b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
          index 9358f13d06..0c89bad91f 100644<br>
          --- a/meta/recipes-rt/rt-tests/rt-tests.inc<br>
          +++ b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
          @@ -1,5 +1,5 @@<br>
          &nbsp;# Version 1.8<br>
          -SRCREV = &quot;32819581cc0509c9d58c33c3061f57abe0c40c88&quot;<br>
          +SRCREV = &quot;6af88067da16c6e69243b376c3b6454ec694460b&quot;<br>
          &nbsp;PE = &quot;1&quot;<br>
          <br>
          &nbsp;SRC_URI = &quot;git://<a moz-do-not-send="true" href="https://urldefense.com/v3/__http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest__;%21%21AjveYdw8EvQ%21LmrhADE_pizwsseLouVODl2xByKZt-B7V6l43HZZ6ykhrJXHXvOYYZDsxWEZZTHh8w$" rel="noreferrer" target="_blank">git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest</a>&quot;<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          <br>
          <br>
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

--------------42F91E84AD4A3E7BEF9C90C7--
