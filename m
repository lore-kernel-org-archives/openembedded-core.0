Received: from NAM11-CO1-obe.outbound.protection.outlook.com (NAM11-CO1-obe.outbound.protection.outlook.com [40.107.220.70])
 by mx.groups.io with SMTP id smtpd.web08.16080.1616983281111489139
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Mar 2021 19:01:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ckeYoziL;
 spf=pass (domain: windriver.com, ip: 40.107.220.70, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdDcdVMtmpE6EfISXslCRxeQ1FQr1boQUepO83RUjDQlWPT5BvP7gLi9MlKbZqiwoszoRAMeYShRaHl2DRXc32R++HtMrk5ppWdAnBGVVPwvR2xteXjOzt0GcY+a1ry2kuEHa9QHIslf1Q5Ekg06oY8TcztNC9RQUMgVI4w1OoJEaCA0uFp/X6G2B29gO2XByNJogeaUWM+mtnRGuUq1DE7asqfQmYLsz3tb+unufZlfKjjej5xqKyLSkwUCfTVxWX5KHcLVuA8rElkz35w7gWEcpWzKToK4daA9r3nL4m2kuyCjDuaJ6aWt27q117ECIJ7ubO3TaLHRLEKIcXw9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y3axvFDKnDgMiAarkG0f86yRI7Gqft+VfbKew9KCQ4=;
 b=UljZb2moE+Sl7nB8ovbcmhI/2roD5jLqtDBWglc1xECMS07C0X2PQA8hwopj2mTsFF59kYutleIUgXFP318EmRmFC4u1oPy7qu2Vm9OFFIomKg8vZgbAaCRWuLtwEwWgshETXfUrhVe6J6352XCtfsWf/QMOV7Le0D9dh4VL8DOqRQwmsWu9YdDDMYFMcbUMtRiMPuxcFfoK15ASUr4Fby166d2SyQN4SUiBf4b7JW2WEgYgl5S6Xoqs16IOC8A0hfmIPRsZ6DZYg4z9nPYZ/P8moOfYME4OPA2VZVXjV/YBVuK+qntu6+NKlh4CfNvGAM0let2GeGPR9n8HdhBhaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2y3axvFDKnDgMiAarkG0f86yRI7Gqft+VfbKew9KCQ4=;
 b=ckeYoziL566cfcmEF8OSr5vsxYwTaz2I2hyqwxsOHDNpakGPJRdAz3Z7SB5Ck+LRWq7Hb2lCzGWoCSwVdxQsyto5pobNkF7/z/S1lj+NizP77XETkYYB6m9MuLq00CD8ogSTaKLCQLwxTEXzSwwfyeYNyq5wZdchIo52cWK2qus=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by SJ0PR11MB4800.namprd11.prod.outlook.com (2603:10b6:a03:2af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Mon, 29 Mar
 2021 02:01:19 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 02:01:19 +0000
Subject: Re: [OE-core] master eSDK hash problem with METADATA_REVISION and base-files:do_install
To: Mark Hatle <mark.hatle@kernel.crashing.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <e9b61d5e-0479-b5cb-2299-749b53d4df38@kernel.crashing.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <db1fb6d5-e2e8-113a-f1a8-5f05b6e86e8d@windriver.com>
Date: Mon, 29 Mar 2021 10:11:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <e9b61d5e-0479-b5cb-2299-749b53d4df38@kernel.crashing.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR03CA0056.apcprd03.prod.outlook.com
 (2603:1096:202:17::26) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR03CA0056.apcprd03.prod.outlook.com (2603:1096:202:17::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3999.16 via Frontend Transport; Mon, 29 Mar 2021 02:01:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf0d8858-cad4-4300-e3f0-08d8f2568415
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4800:
X-Microsoft-Antispam-PRVS: 
	<SJ0PR11MB48002954582C4B80885101F9ED7E9@SJ0PR11MB4800.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:393;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/5reueFUvsIA6WTbR934m9OjGcoSy8YhGFjeZUaUUPeXhmIlPimkOpqIbLEJPb5eFrEO6PgVDPP4X7k7in0afYvJQgdygl75H6H1GatO01o9j1vb5Den7HMX1948Yz3iLna05CgKUVChPnOyKAktDXFM4BrRJX7JSU373p7KPZ9yOMLz/mjEsSHCUbUmXund63owfmMJsY4YNHgwmTvtft4UUmHaqblrCtiMgWMISiunz0BQNhiVrNZnXirUqdoILLTHmlD39243FoQipXdxg0fH7+SNLPmTMqrg8diwDww8NV+7WJOvpL2bzC80AA2F0t6D6PTg2+LEHxPLN01+3QMZ+JHFQlrvLzam4OZaWbNaVK72/QB8IwX9U2I2b1yaK25qBLVeCoc+OlKr0CCQIc7o+OAwNrsy4nOeM0pcudSxEatMz0KVp9AQHPe17mqosS7hd5aArrimy1qfa/pRojwWb6vM4pioN38dcad5hziz19GRVvnGt5ULeJtcjurZy1mnSWJ7fGXz/hndT/aZ9D2pIBHyzL2UD2YeU9HxpWqgg2/OVbNk+lFe4DAqTCeP4ynEpXmoK7EfhXDeDc9uZMqQPl5DrsrTrVKFdljfSeJu/iwUuyWAPj6O7t6Mjss5t8PcPUdXlBbChqE9OqOiNt/1VjAT3POuI6MjETKhRdmRx+p5eep01XftBPyBA5TeJfLkH68NrQUhqLatA2fsHjsE3338cw8ld8PiPRARn2629inWsVoWEK+DY4D8jPw34qGRIARW5r6R/R6M0R6Fbdv3dwlwxNlaVqaMBxGHzU/w4u9uius+poWZXNgvb2T5TLa1+Hm4wqO3UtgRix1EmA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(136003)(396003)(346002)(376002)(366004)(6666004)(8936002)(478600001)(66556008)(83380400001)(956004)(31696002)(66476007)(6706004)(966005)(53546011)(36756003)(26005)(31686004)(5660300002)(66946007)(52116002)(6486002)(166002)(38100700001)(86362001)(8676002)(186003)(16526019)(33964004)(110136005)(16576012)(316002)(2616005)(2906002)(78286007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?eHA4dWk2U0hldisvcGZqZDlWTnJ6bExUOVptMHVNTlNzV0YwdXFXc1JhK1VF?=
 =?utf-8?B?V2k2RnpHRFErZDkremc1VUZaSWRKZkFQTFJUSXY2U2JzZ2JNR2dWdUxsN3A5?=
 =?utf-8?B?T0tUOU10VnNjdkhoSWRuMEZQMENrSlo5ZWlKTEpPM3hYQ21Ya3pBWWpVcllH?=
 =?utf-8?B?VFpCbGVTRWhibTI3YjYvSDMwRm41TGc1bm0wZXhpWG1weDdjak9zQmJ4Nndr?=
 =?utf-8?B?b1J3NERMbzI0SUNIcDdDNGVrQ0xpTDVQc2VxajcrL0tGbEZ4NGFHSXkyWjgz?=
 =?utf-8?B?WTBEV1ZJNDNCVEtMNDF3azE2a2ZqYkRNVXRlU1VWbGtFSzJyZ09FaWgwY1Fw?=
 =?utf-8?B?ZzRIYUcxOCs1QXZob21UR2dqRUg0QUxpdFVGamxSUHAxem1ZT2dVRXZVZ1kx?=
 =?utf-8?B?eUtWbWNGSzl3Mm1Telp0T1FBZzhuL1d2cTQ0RXlONkdtVllLVkhaK3QwWUls?=
 =?utf-8?B?WUliTnlNbXAzODJ2aWFQTW8wdTU5UE5VWWNjblJCam56aXY5Y3U5dm1QUXEv?=
 =?utf-8?B?UllWT3JjVjhPYmYydU1jL3k2VW1ab3oxaFIraE9FN1B5aDhYT2NBZEdvOW9H?=
 =?utf-8?B?eGI1UVZNVHlwcjJFUldSclFFK2dnNkJVaUxFY244ZTBPVi9MeHJQT1MwRTB0?=
 =?utf-8?B?WWs3dXVCNG4wODNsSmozZ3JVWTVkN255alBjb21JSFd1STJhTzBjcnRRT3Vi?=
 =?utf-8?B?OEVoRzF0YWp1QitOZkVIZkVlMXVXK0JDUFVPNCttTjFEYnhNOHhCN0EwSUow?=
 =?utf-8?B?aVg3NFcvK1JEUDhPYlhlcHVZUThubVlFa2dEUlp6QmZLWUdLZ3FXM0RNaU0r?=
 =?utf-8?B?VllJSWlKQ2JrYW1EYTh1QWl5MlVNZVNJbXpUZGFKdjIzM3JEeFROY2cxYTcz?=
 =?utf-8?B?dFYrV25lMzkvZnZSeVk0S2xXV3htcVNHMXNhOUNDeW5MRDB4TGpsUC90d2Z0?=
 =?utf-8?B?Slo3VmhMLzRmKzhuV3Fva1ZkWXFldi9UbmNVcFZJbW5LMVdma1lMRkJDMU13?=
 =?utf-8?B?UXJhdjdXU29oOTJ4NUV1Q2RLNVY0RVR6RkNSeXF3TWpHQWtqa1lER2x3aUtB?=
 =?utf-8?B?UFJrYnMxbmVoT1ZLQnVKbi9zMDZJcGlZSWpLZnl4TXZPQmZGZzBkY01uQVZv?=
 =?utf-8?B?WmxTYWpsODE5M0x2RG1aUmlySStYY1dWYzZQYnJiV29HbXduQm1QOGx5NHlS?=
 =?utf-8?B?VmdIVkdyRFdJRi95Q3JmaDFjZGRMeVJSUFh5bnJKQjRNdTVBbCtsbEd6OXZN?=
 =?utf-8?B?SXBNM2ZrU3pSV2pucDhMWm5VUTc4ampYRVU3aVBUbXRMNDRXNGwxYXJ1cEdB?=
 =?utf-8?B?UDJUVGE2bnh0akZzeUhpMm9ESDR2RUU5MVNoZndRWmI5aDFRQ0MxdWxtYkVG?=
 =?utf-8?B?alZtRVlMeHM3VHJZa2thNTBXcGxCbk1VRUNhYTZCeGVEbktWM0tRVWgxMFh3?=
 =?utf-8?B?UVJ0YXFsNmswSEpPLzluazlFV3VPb0dMTWtVemlQL2NaSEp5SGIxOTVJRzdI?=
 =?utf-8?B?dG5VTHNxSWE2WWhpUlNOL0pFeHVnTzVocURXaXl2cTVXUy90TzQ2TmtlL01H?=
 =?utf-8?B?VWVnamRjUGY3dmh3cEh6OXB4TFNBSnVrcVVpMGlBV01QYW1GTHFpUUt6NmZz?=
 =?utf-8?B?Mm1jNHFNQzlaRFo2NXJ5SHltYWpjeEVpanVnUGtyODI0eW9GMDRlU2IvZis2?=
 =?utf-8?B?WWZGakkzNkJFd1lzb05NS0hrY3NPcm9INHFVR3RoVUNORThaVzgxcUJOMFVl?=
 =?utf-8?Q?sL+XyuN9x8aeqa6O/YganUFXrUxYK4kZN7gLdPN?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf0d8858-cad4-4300-e3f0-08d8f2568415
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 02:01:19.7089
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oxsotu5Mgym1ACwZB1njEMMVuGDTAClnCigK+hWq8kuMOe3qif7JN40MpIk2gSNXotXnaXT/3YbEPTrzlxeLpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4800
Content-Type: multipart/alternative;
 boundary="------------E1DC33370237A04266324851"

--------------E1DC33370237A04266324851
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Mark,

I think this has been fixed by the following commit.

"""
commit ff2ad51b801fd62e2abbc573ba2c9ee8fdc7e012
Author: Chen Qi <Qi.Chen@windriver.com>
Date:   Fri Mar 5 18:10:40 2021 +0800

     populate_sdk_ext: record METADATA_REVISION

     As we delete the .git/ directory, it's impossible to get 
METADATA_REVISION
     inside eSDK. Because of this, we meet the following warning when 
installing eSDK.

       WARNING: The base-files:do_install sig is computed to be 
16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0, \
       but the sig is locked to 
6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36 in 
SIGGEN_LOCKEDSIGS_t-qemux86-64

     So we record METADATA_REVISION in eSDK generation time to fix this 
problem.

     Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
"""

Best Regards,
Chen Qi

On 03/26/2021 07:51 AM, Mark Hatle wrote:
> Building an eSDK (all stock config):
>
> MACHINE=qemuarm bitbake core-image-minimal -c populate_sdk_ext
>
>
> I then install it, and get:
>
> Checking sstate mirror object availability: 100%
> |#####################################################################################################################|
> Time: 0:00:00
> WARNING: The base-files:do_install sig is computed to be
> 587ccfa9299e26094ae342f1ce3d782bfaf776c639013428a511770c3828d49a, but the sig is
> locked to 0c35f266f1e79b1f34260df1b8d677f7eb74a7f7241155601ed73a014c8e286c in
> SIGGEN_LOCKEDSIGS_t-qemuarm
> Loading cache: 100%
> |##################################################################################################################################################|
> Time: 0:00:00
> Initialising tasks: 100%
> |#############################################################################################################################################|
> Time: 0:00:00
>
>
> Running a bitbake diffsigs on this file, I get:
>
> basehash changed from
> cffec52acb67f62fe3812d0d42d52b1081f9150386f43f0426f5469b4a1a6a25 to
> 332259212c5e9a4ed2a7fe25b8ea77cb54fb6b82f7deed90179e145f1d0cf1b6
> Variable METADATA_REVISION value changed from
> '3210cabe56d6cf6d51638e6f31f93110e40ab2cd' to '<unknown>'
>
>
> So it appears that some of the recent work on METADATA_REVISION has broken hash
> computations in the base-files package due to the value being 'unknown' in one,
> and set in the other.
>
> --Mark
>
>
> 
>


--------------E1DC33370237A04266324851
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Mark,<br>
      <br>
      I think this has been fixed by the following commit.<br>
      <br>
      &quot;&quot;&quot;<br>
      commit ff2ad51b801fd62e2abbc573ba2c9ee8fdc7e012<br>
      Author: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a><br>
      Date:&nbsp;&nbsp; Fri Mar 5 18:10:40 2021 +0800<br>
      <br>
      &nbsp;&nbsp;&nbsp; populate_sdk_ext: record METADATA_REVISION<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; As we delete the .git/ directory, it's impossible to get
      METADATA_REVISION<br>
      &nbsp;&nbsp;&nbsp; inside eSDK. Because of this, we meet the following warning
      when installing eSDK.<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARNING: The base-files:do_install sig is computed to be
      16b9d96148d45de183cc94667aae016ec7d102d48255456381e718cd4bbd0aa0,
      \<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; but the sig is locked to
      6eb0dcaed504282becee94662481d79264db920dee1f7deda18230133fff8f36
      in SIGGEN_LOCKEDSIGS_t-qemux86-64<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; So we record METADATA_REVISION in eSDK generation time to fix
      this problem.<br>
      &nbsp;&nbsp;&nbsp; <br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Chen Qi <a class="moz-txt-link-rfc2396E" href="mailto:Qi.Chen@windriver.com">&lt;Qi.Chen@windriver.com&gt;</a><br>
      &nbsp;&nbsp;&nbsp; Signed-off-by: Richard Purdie
      <a class="moz-txt-link-rfc2396E" href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a><br>
      &quot;&quot;&quot;<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 03/26/2021 07:51 AM, Mark Hatle wrote:<br>
    </div>
    <blockquote cite="mid:e9b61d5e-0479-b5cb-2299-749b53d4df38@kernel.crashing.org" type="cite">
      <pre wrap="">Building an eSDK (all stock config):

MACHINE=qemuarm bitbake core-image-minimal -c populate_sdk_ext


I then install it, and get:

Checking sstate mirror object availability: 100%
|#####################################################################################################################|
Time: 0:00:00
WARNING: The base-files:do_install sig is computed to be
587ccfa9299e26094ae342f1ce3d782bfaf776c639013428a511770c3828d49a, but the sig is
locked to 0c35f266f1e79b1f34260df1b8d677f7eb74a7f7241155601ed73a014c8e286c in
SIGGEN_LOCKEDSIGS_t-qemuarm
Loading cache: 100%
|##################################################################################################################################################|
Time: 0:00:00
Initialising tasks: 100%
|#############################################################################################################################################|
Time: 0:00:00


Running a bitbake diffsigs on this file, I get:

basehash changed from
cffec52acb67f62fe3812d0d42d52b1081f9150386f43f0426f5469b4a1a6a25 to
332259212c5e9a4ed2a7fe25b8ea77cb54fb6b82f7deed90179e145f1d0cf1b6
Variable METADATA_REVISION value changed from
'3210cabe56d6cf6d51638e6f31f93110e40ab2cd' to '&lt;unknown&gt;'


So it appears that some of the recent work on METADATA_REVISION has broken hash
computations in the base-files package due to the value being 'unknown' in one,
and set in the other.

--Mark
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

--------------E1DC33370237A04266324851--
