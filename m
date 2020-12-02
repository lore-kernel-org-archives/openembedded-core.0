Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.65])
 by mx.groups.io with SMTP id smtpd.web10.51.1606931653558571748
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Dec 2020 09:54:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=EqBHNP8L;
 spf=pass (domain: windriver.com, ip: 40.107.244.65, mailfrom: randy.macleod@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BmzmAxfZnrZQA1btgWLNOJiqzsadNLjwaaynS9VhNKtmHs52yEoU9Ir9Dp6UN8BidTFj158eAIkAHqywXmd+sGEPyYyk2qzJCEmDZAT+BqVGPrZHLd35t4FvU2D23DxW3+v3Bnfc/cshhWCngL7RFsnVLCkc9ioTeYQQfgYgvIxnvdPK+F8vrHB28NOiXLOygcKyFd+3mv/Puw5KEBU3y1Ks2SU0iOSeGRpnmgljS+2uxNr53P6Z4YYfGXHFBYv2rEnaIcFU8CcYDUD67gS/Q8a2Tfvs/9pPfYKXoVLKna4dcM5IQvv1i0n4zN3YYnL7AOZ7yvKqPDbDSbd4RHGXUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siWc+eP2x6pdKANmfXbD2ST3Ko46Er6+6rfWzufFR5c=;
 b=OQK9zvkWEplC3okzBpm6PRByv53hTvm47aaq9vdYyWdWr9Y9iFqCb4P+uhivTH0Mj3tg771xB/4RSoPEf+/tvRexCAGSfVedVHQog5QDcpY0gIAA8s42iRhLPuS9xQlocusvOT6OZYy1uJLJQroqMMhms042/NvBDL0KsPaJ6ABf+l6LqIMqaXp/RHw8kRN3Dt4TvP/yCrTogpABGVrhjbjjgCcz0rm/57hdwG7OEJBoIu869egptTLUCL2bZLPIBtcv4Xp79qPd9hLo/4eFryE1KMv0N0D5A7i1/gkdUczzDuYs2EO11YHb5loRaR1QFLDpH1FOpYq0Ihw1PMAK7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=siWc+eP2x6pdKANmfXbD2ST3Ko46Er6+6rfWzufFR5c=;
 b=EqBHNP8LLx2lIoN8K5/TDZB7uHusz7tY8y+haJT94BQ8BIiHP2bnxm/DjC8Inwo7YE0OrGdE87iwUKbfUPxMUHtGlOJWxkYgSQC1VqfdxLXaVgT8Xzx8Vaiu7u5g9fFN+WVCpFnoWo3fpo7mhc4bJ8H3y2FD94ZW7A3h9XO09uE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB3994.namprd11.prod.outlook.com (2603:10b6:5:193::19)
 by DM6PR11MB4073.namprd11.prod.outlook.com (2603:10b6:5:19f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.25; Wed, 2 Dec
 2020 17:54:11 +0000
Received: from DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::7dda:eef1:5113:c588]) by DM6PR11MB3994.namprd11.prod.outlook.com
 ([fe80::7dda:eef1:5113:c588%6]) with mapi id 15.20.3632.017; Wed, 2 Dec 2020
 17:54:11 +0000
Subject: Re: [OE-core] Multi-threaded npm build
To: michal.frynas@sigma.se, openembedded-core@lists.openembedded.org
References: <WyJB.1606926356468119429.WUQh@lists.openembedded.org>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <b7a231f9-5b84-c10e-32ab-c1cd4254b3b8@windriver.com>
Date: Wed, 2 Dec 2020 12:54:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <WyJB.1606926356468119429.WUQh@lists.openembedded.org>
X-Originating-IP: [198.48.226.187]
X-ClientProxiedBy: BYAPR02CA0007.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::20) To DM6PR11MB3994.namprd11.prod.outlook.com
 (2603:10b6:5:193::19)
Return-Path: randy.macleod@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.25.44.2] (198.48.226.187) by BYAPR02CA0007.namprd02.prod.outlook.com (2603:10b6:a02:ee::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17 via Frontend Transport; Wed, 2 Dec 2020 17:54:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e69606f5-5a94-47e9-06eb-08d896eb4662
X-MS-TrafficTypeDiagnostic: DM6PR11MB4073:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB40730F3D00A3618125012B43F8F30@DM6PR11MB4073.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tVnuawg0iZYuSn+QnOT95l9jQ6QQcWltQWCFz/mcnMTQpRVlswpjU7XHx5fxqwsIvD4Ylm2qOdzRc9fNyaWab6e7dM69xa0xk66RWfqo9DUz1HLk2fFPmqqJdXHCg8AQQGFg6gTrclXZ2VPdmJAoSBsxcVYBEJOlRHhI9oJ3tDKMK2XfFgSwLOMbm689ry0R79aDkc52tEdJOHGwLG9hC8vVCgHeJ3PHr3vqTBgXrtcHeFOjKNoflItJAZzOA+Spf9qX0GLgH3okVfViZtk+cx1XR5CkXsKxjQJlWphjrJCqWnjGDCJIiKxOHturukEHknsyOsESJBX6cBoRg+Q4PVtEHR40ljAQOoHXrCmkM95a5d18dVZo4YiQv9Zeke5weVjO9D7y7RHcxlEx7yoYWyw50Qzvjmc7PGpHD7gK92dE3ddd1QN/5u3oKbVA/PkWG6o6x8Npef0L9JIQrszLufTRgZAJFz0Emqpt9TaYO+w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3994.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(366004)(16576012)(83380400001)(86362001)(8676002)(66946007)(166002)(5660300002)(66476007)(316002)(6486002)(66556008)(956004)(26005)(186003)(966005)(2906002)(31696002)(2616005)(36756003)(16526019)(31686004)(53546011)(478600001)(33964004)(8936002)(52116002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?MVIzakpQbWwzU2orR3QzTUZBTVgxeUpvNkFKVm9OeHJMdW40OEF5RTZTM0tZ?=
 =?utf-8?B?ZXlFQnZPbk5NWVBrRFBBNmNnZHExaC9XU2VwQ0xqT21nNURFRnNscUQ4NFRC?=
 =?utf-8?B?YURxOU91Q3hSY2Z6dXJyQTdYNXBRVExGZUVFcWt5bStRUS80WXo5ZnpDWC9s?=
 =?utf-8?B?UkFTNHVjdmt3RFYwV3U0VElTeWV3cmU5ckIzQUlVZ0FpdGw5QkU5K1RPTEo4?=
 =?utf-8?B?Lzc2Q0hkUGQxS28zczhJV0g4TGxvYkh3ZGdDV1NYTWF1V1FLWkhKdXlDdnhy?=
 =?utf-8?B?TWlHdWpzUUhQbWtVb2JrUVRzN2ZYT2sxRG9QR1J1V3RhM0I1RGRFYmN6OUNq?=
 =?utf-8?B?N3MybVJDaitPdG1JK1JFMC9JYVEzMW51bTIxbXVmNUN0UVRia05ZdVIvbnFK?=
 =?utf-8?B?UEJJUmREUXJiQytBTkthUmFnNEVKc2dPTUZVZktPUTJZRlNIZ3NFYlNJU1pD?=
 =?utf-8?B?aElRVHpqYTd5WVEyU2I5c0k0NU1UemU3QklkMW1JUzkwUnhoYTBTUnlZWDdH?=
 =?utf-8?B?RFFUZDNyUWxwdzhSaVZDTms4WWY3clFKUDBNOEs4WkcxLzAzRXN6T1hXNUtm?=
 =?utf-8?B?VzdlZWVkbmk3U01TeGpuSndlS2ZIR3JQZHFVSzl5SVhmeVJDc0IvOEc3MTBk?=
 =?utf-8?B?WDJkL1ZkN21BR21KVW9BSHgydm9kcUt2VmxKbi9yNHkyY3M1M2p6RlE2bDRG?=
 =?utf-8?B?SEljUTF6dzhNS3FXRTF6bysySFVESFpCUlF6Y29UQVd0enRhb3VBOEx5WUd3?=
 =?utf-8?B?ek1nSkE0QzBnZmRLa01qM0dmZmwvZXQyOE5oc2NpdW5sRDk4TXNlM3dGd0Zy?=
 =?utf-8?B?d041N1lWcWtoQkNjZGY4OWluRFQ2b1dtd0p6VklvNEdoRlFoRWxZY0FLdjVL?=
 =?utf-8?B?ZXlJSGF4WDNsN1R6bytXOU1obE9zWXNheGMvOURVNzg5K1F0OGJJOEdiRElT?=
 =?utf-8?B?ME5NaXRROGR3THRtM1YyQ2MyeWNRUVBnNHRlbVFwakphT0ZjNG9xQVdrOGs4?=
 =?utf-8?B?TFlDZlBOUEhNUWJiWlY1cEJ4b3JVNDBEOWgvcXozdllCeFhNQXZ5TWxtZUZL?=
 =?utf-8?B?c3JNSlF2SE10SGZiV3hVUDlacU11b0tXMjFlK1lLUkdNZ0tjQUd3dStNV1Nz?=
 =?utf-8?B?L0R4YmliZGZwVGp4UDEwaTRXZjF4Uy9JSFhxblBoZ2drN0xIUjQ2L25OeDYr?=
 =?utf-8?B?RWpETzU0Y3VQdXlVZTZyZG5RWkNCVlY3RDA5UUpxRStUbDNtYTVQSmpiSmdT?=
 =?utf-8?B?Z05iN2tBU0RxRVlnV2Z0VUl2aUJ3RnRhOGJsNFQ3VE5oeU8rdVd3WVJRcm1S?=
 =?utf-8?Q?9n9LhqXCJrgt0h4W/EWln+hrsbj37CybcB?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e69606f5-5a94-47e9-06eb-08d896eb4662
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3994.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2020 17:54:11.8003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rCwykmvmGezTRKsT6NAtHzgCnjEFhdyjz+2uO+7kZ6z599U60oYrJhGVpLiJ6GCAfwrdkd685kxsN4W4WClwrFI8UzO6tGwhDB+9UOp149A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4073
Content-Type: multipart/alternative;
 boundary="------------9A250D8AE7EAB15F57B0348E"
Content-Language: en-CA

--------------9A250D8AE7EAB15F57B0348E
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2020-12-02 11:25 a.m., michal.frynas@sigma.se wrote:
> Task do_configure delivered by npm.bbclass takes a lot of time, the 
> longer shrinkwrap dependency list the longer time needed for 
> do_configure to execute.
> Following improvement allows to execute do_configure on any available 
> CPI threads.
Thanks for the patch Michal.

Can you resend to:
    bitbake-devel@lists.openembedded.org

using git send-email as per:
https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

Thanks,

../Randy


>     diff --git a/bitbake/lib/bb/fetch2/npmsw.py
>     b/bitbake/lib/bb/fetch2/npmsw.py
>     index 0c3511d8ab..0e6075859c 100644
>     --- a/bitbake/lib/bb/fetch2/npmsw.py
>     +++ b/bitbake/lib/bb/fetch2/npmsw.py
>     @@ -29,8 +29,9 @@ from bb.fetch2.npm import npm_integrity
>      from bb.fetch2.npm import npm_localfile
>      from bb.fetch2.npm import npm_unpack
>      from bb.utils import is_semver
>     +from concurrent.futures import ThreadPoolExecutor
>     -def foreach_dependencies(shrinkwrap, callback=None, dev=False):
>     +def foreach_dependencies(shrinkwrap, callback=None, dev=False,
>     executor=None):
>          """
>      Run a callback for each dependencies of a shrinkwrap file.
>      The callback is using the format:
>     @@ -49,7 +50,10 @@ def foreach_dependencies(shrinkwrap,
>     callback=None, dev=False):
>              continue
>          elif deps[name].get("bundled", False):
>              continue
>     -       callback(name, deps[name], subtree)
>     +       if executor:
>     +           executor.submit(callback, name=name,
>     params=deps[name], deptree=subtree)
>     +       else:
>     +           callback(name, deps[name], subtree)
>      _walk_deps(shrinkwrap.get("dependencies", {}), [])
>     diff --git a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass
>     index 068032a1e5..1869b63cdb 100644
>     --- a/meta/classes/npm.bbclass
>     +++ b/meta/classes/npm.bbclass
>     @@ -80,6 +80,7 @@ python npm_do_configure() {
>          from bb.fetch2.npm import npm_unpack
>          from bb.fetch2.npmsw import foreach_dependencies
>          from bb.progress import OutOfProgressHandler
>     +    from concurrent.futures import ThreadPoolExecutor
>      bb.utils.remove(d.getVar("NPM_CACHE"), recurse=True)
>      bb.utils.remove(d.getVar("NPM_PACKAGE"), recurse=True)
>     @@ -164,9 +165,11 @@ python npm_do_configure() {
>      progress_done += 1
>      progress.write("%d/%d" % (progress_done, progress_total))
>     + executor = ThreadPoolExecutor(max_workers = os.cpu_count())
>          dev = bb.utils.to_boolean(d.getVar("NPM_INSTALL_DEV"), False)
>      foreach_dependencies(orig_shrinkwrap, _count_dependency, dev)
>     - foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev)
>     + foreach_dependencies(orig_shrinkwrap, _cache_dependency, dev,
>     executor)
>     + executor.shutdown(True)
>          # Configure the main package
>          with tempfile.TemporaryDirectory() as tmpdir:
>
>
> 
>

-- 
# Randy MacLeod
# Wind River Linux


--------------9A250D8AE7EAB15F57B0348E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2020-12-02 11:25 a.m.,
      <a class="moz-txt-link-abbreviated" href="mailto:michal.frynas@sigma.se">michal.frynas@sigma.se</a> wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:WyJB.1606926356468119429.WUQh@lists.openembedded.org">
      
      <div style="margin: 0px; padding: 0px; border: 0px; font-style:
        inherit; font-variant: inherit; font-weight: inherit;
        font-stretch: inherit; font-size: 12pt; line-height: inherit;
        font-family: Calibri, Arial, Helvetica, sans-serif;
        vertical-align: baseline; color: #000000;">Task do_configure
        delivered by npm.bbclass takes a lot of time, the longer
        shrinkwrap dependency list the longer time needed for
        do_configure to execute.</div>
      <div style="margin: 0px; padding: 0px; border: 0px; font-style:
        inherit; font-variant: inherit; font-weight: inherit;
        font-stretch: inherit; font-size: 12pt; line-height: inherit;
        font-family: Calibri, Arial, Helvetica, sans-serif;
        vertical-align: baseline; color: #000000;">Following improvement
        allows to execute do_configure on any available CPI threads.<br>
      </div>
    </blockquote>
    Thanks for the patch Michal.<br>
    <p>Can you resend to:<br>
      &nbsp;&nbsp; <a class="moz-txt-link-abbreviated" href="mailto:bitbake-devel@lists.openembedded.org">bitbake-devel@lists.openembedded.org</a><br>
    </p>
    <p>using git send-email as per:<br>
      &nbsp;&nbsp;
      <a class="moz-txt-link-freetext" href="https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded">https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded</a></p>
    <p>Thanks,</p>
    <p>../Randy</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:WyJB.1606926356468119429.WUQh@lists.openembedded.org">
      <div style="margin: 0px; padding: 0px; border: 0px; font-style:
        inherit; font-variant: inherit; font-weight: inherit;
        font-stretch: inherit; font-size: 12pt; line-height: inherit;
        font-family: Calibri, Arial, Helvetica, sans-serif;
        vertical-align: baseline; color: #000000;">
        <blockquote>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">diff --git
            a/bitbake/lib/bb/fetch2/npmsw.py
            b/bitbake/lib/bb/fetch2/npmsw.py</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">index
            0c3511d8ab..0e6075859c 100644</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">---
            a/bitbake/lib/bb/fetch2/npmsw.py</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+++
            b/bitbake/lib/bb/fetch2/npmsw.py</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">@@ -29,8
            +29,9 @@ from bb.fetch2.npm import npm_integrity</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;from
            bb.fetch2.npm import npm_localfile</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;from
            bb.fetch2.npm import npm_unpack</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;from
            bb.utils import is_semver</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+from
            concurrent.futures import ThreadPoolExecutor</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">-def
            foreach_dependencies(shrinkwrap, callback=None, dev=False):</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+def
            foreach_dependencies(shrinkwrap, callback=None, dev=False,
            executor=None):</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp;&quot;&quot;&quot;</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;Run a callback for each dependencies of a shrinkwrap file.</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;The callback is using the format:</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">@@ -49,7
            +50,10 @@ def foreach_dependencies(shrinkwrap,
            callback=None, dev=False):</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp;elif deps[name].get(&quot;bundled&quot;, False):</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;continue</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">-&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; callback(name, deps[name], subtree)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; if executor:</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; executor.submit(callback, name=name,
            params=deps[name], deptree=subtree)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; else:</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; callback(name, deps[name], subtree)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp;
            &nbsp;_walk_deps(shrinkwrap.get(&quot;dependencies&quot;, {}), [])</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">diff --git
            a/meta/classes/npm.bbclass b/meta/classes/npm.bbclass</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">index
            068032a1e5..1869b63cdb 100644</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">---
            a/meta/classes/npm.bbclass</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+++
            b/meta/classes/npm.bbclass</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">@@ -80,6
            +80,7 @@ python npm_do_configure() {</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp;from
            bb.fetch2.npm import npm_unpack</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp;from
            bb.fetch2.npmsw import foreach_dependencies</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp;from
            bb.progress import OutOfProgressHandler</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp; from
            concurrent.futures import ThreadPoolExecutor</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp;
            &nbsp;bb.utils.remove(d.getVar(&quot;NPM_CACHE&quot;), recurse=True)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp;
            &nbsp;bb.utils.remove(d.getVar(&quot;NPM_PACKAGE&quot;), recurse=True)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">@@ -164,9
            +165,11 @@ python npm_do_configure() {</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;progress_done += 1</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            &nbsp;progress.write(&quot;%d/%d&quot; % (progress_done, progress_total))</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp;
            executor = ThreadPoolExecutor(max_workers = os.cpu_count())</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp;dev =
            bb.utils.to_boolean(d.getVar(&quot;NPM_INSTALL_DEV&quot;), False)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp;
            &nbsp;foreach_dependencies(orig_shrinkwrap, _count_dependency,
            dev)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">-&nbsp; &nbsp;
            foreach_dependencies(orig_shrinkwrap, _cache_dependency,
            dev)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp;
            foreach_dependencies(orig_shrinkwrap, _cache_dependency,
            dev, executor)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">+&nbsp; &nbsp;
            executor.shutdown(True)</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp;</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp;#
            Configure the main package</div>
          <div style="margin: 0px; padding: 0px; border: 0px;
            font-style: inherit; font-variant: inherit; font-weight:
            inherit; font-stretch: inherit; font-size: 12pt;
            line-height: inherit; vertical-align: baseline;">&nbsp; &nbsp; &nbsp;with
            tempfile.TemporaryDirectory() as tmpdir:</div>
          <div>&nbsp;</div>
        </blockquote>
      </div>
      <div style="margin: 0px; padding: 0px; border: 0px; font-style:
        inherit; font-variant: inherit; font-weight: inherit;
        font-stretch: inherit; font-size: 12pt; line-height: inherit;
        font-family: Calibri, Arial, Helvetica, sans-serif;
        vertical-align: baseline; color: #000000;">&nbsp;</div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
# Randy MacLeod
# Wind River Linux</pre>
  </body>
</html>

--------------9A250D8AE7EAB15F57B0348E--
