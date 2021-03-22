Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.77])
 by mx.groups.io with SMTP id smtpd.web10.8098.1616383383702107366
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 20:23:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=GleGlcjO;
 spf=pass (domain: windriver.com, ip: 40.107.237.77, mailfrom: changqing.li@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Se7T4VzDhZHHwuVD8Q+HcGRcqIkFhf72LNMOrfe2ZG7jUzp1WZdZoobiYLmY5VCNd9Sm/wjtL6q83KUu9xdqi6Hv6Xetw5JNLj22t2hR38vr8vuKo9AqodUxz/OIu9PCShk82iT5HRPslaiTmxa94ApzYBk7Ss/Ttg5joI2DH46csgzRomgIfcR9XXSHfOM4BKeO/wOJSzjS+LmCakZonjwAfceJ4Ftf0NP+LggJWX90l9SI2LwjOm8FzBmr1YfsL63E2AaD9U2lqrek6+EmwM1IUDi6ItMk/wMYo6CCPGrZp4mnvQm8/hhFlmucAS+oPyUfS5Ivmhr5n/P1+1Jimg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s83FUb/zlFAFUeOeEEJ0UrgPVGQTmVUfCnndDP78F4M=;
 b=CI+dR764gR3ze3FtgA69eyb9/hr8t0jjUtHnW+l0T0k5RTJXub6YVMes2nZOXTbPGpmb3xZq8bZ4l2IWhA+M8e+SuDDtxH880hHQ9LrWPS6hvlpuLipkAD021wU9CbJuFFAp4BYx4wQbs53W5uSmthB1LM0v28LvFiRRTmJFTf8ZkJ1hFfPLrn/OtfHTqIF/IFyrpKiC8ecmiVnCSTjQJtBMBDUx1YZtTitkYk96Q1CNxjwYIh8T8sAMQMvPlfFjxyyovXHWiOqaN1eI36wFHPkdelRCbJKT1GQn0LjPVtC+IQYz7UY1CBTQyd/p6J9Si3LuJ8dYwam0NUR285DjcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s83FUb/zlFAFUeOeEEJ0UrgPVGQTmVUfCnndDP78F4M=;
 b=GleGlcjOfbl/1wubr5TX7F2Fmp8nlJUvjMYZ07lvGP520x471jvuL/22ppIKfNfwGUBBv5vm4EmOSV519n2vLpRqLf7er9kgYP1XHmx1gSTQ1TIeVyIv17vD5cOC9LgZY2/7DVM86L9TF4S+SEFD18bNaIABciAf9I/keqttqQM=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
 by BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 03:22:59 +0000
Received: from BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::9a7:24f8:c607:23fe]) by BN7PR11MB2548.namprd11.prod.outlook.com
 ([fe80::9a7:24f8:c607:23fe%7]) with mapi id 15.20.3955.025; Mon, 22 Mar 2021
 03:22:59 +0000
Subject: Re: [OE-core] [PATCH v2 3/3] go-helloworld: Turn into a go module enabled build
To: Naveen Saini <naveen.kumar.saini@intel.com>, Khem Raj
 <raj.khem@gmail.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210224041320.3968776-1-raj.khem@gmail.com>
 <20210224041320.3968776-3-raj.khem@gmail.com>
 <5baa9e0336304fa281deaf975e3f1191@intel.com>
From: "Changqing Li" <changqing.li@windriver.com>
Message-ID: <b307aaa6-2228-1aec-3d2f-41f33fbe694f@windriver.com>
Date: Mon, 22 Mar 2021 11:22:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <5baa9e0336304fa281deaf975e3f1191@intel.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: CY4PR01CA0024.prod.exchangelabs.com (2603:10b6:903:1f::34)
 To BN7PR11MB2548.namprd11.prod.outlook.com (2603:10b6:406:b3::19)
Return-Path: changqing.li@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.189] (60.247.85.82) by CY4PR01CA0024.prod.exchangelabs.com (2603:10b6:903:1f::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend Transport; Mon, 22 Mar 2021 03:22:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa3b3524-9a31-4850-80f1-08d8ece1cab5
X-MS-TrafficTypeDiagnostic: BN9PR11MB5257:
X-Microsoft-Antispam-PRVS: 
	<BN9PR11MB525746069898D5591912207F82659@BN9PR11MB5257.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:222;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bbMbQPK0iQiw/cOsiphti4HeVcOIFLVoLf3hlD8l5PfcpFRK+w3XrlFEJaXN1cAtZrW9kmsFvZG2EJNARpqqv2UvzdJ0hsti27w8t473JUdMrv7iIZXkjOuzzjvEz8xpNlcwigFgbZIre3dLraqVwASy91etkO5dwOtwV2vD5Y2GblVPpMchEYQXHIWH72g2Gu+7g9H5Tj31UVaaaKV5yDpud3gKonujbmvNPRHSvUZ8x2iLxasc4KmKLbB2zYPvomeL69M8+QkSuY3/hAB1xwyL35OhjMSCyOZIVAEtXCGn+JFTZw+fe5nHfAAtVi/Cczr90yRKoTukx4g+peQd3iN7t4wBIqb4y7rcnJ5S/sQnYqZt0oZsBLEz/57KCklJe3gIyq39bYRxSZj9rew/Wu/c427iwF7iX7NcLcxNklSjJVkMO1EbhaQp+jP4E3CEwby8+L2Z8fIkaEdZbEFWVFKFUddRHOCqBqzZAW4c3K80puZOs1ktJMOwPmM3meVFUQPqVHVnMPBHfBVz1PRN2uLgQ2vD4pprFDBdHuQDQHxsaoPzuQ4lkacL7vkJdMsNy+Xcv0Tcr8ep+6LYFn3TtXtMpFU7Zfl2nhJMuJFBGKYaQ8BYIQ6l38Xb1bUkLCH3nQJXMq/h6k8EbG0oW+503o2vDVCt7IaaWfAR0CBPD/q4Qizx3dWVakQnuT/kMCYKkpaKVeRTN/MjTT1qt5Cssb4o1CZw/yK6Dfai55YxpLblex1D60azmIA/mjyolBabaoq8P6MzUga+slI9ZadI5Fv23NUHHf+FJqpn469zfxo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR11MB2548.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(39840400004)(376002)(396003)(66556008)(31686004)(166002)(8676002)(6486002)(83380400001)(8936002)(66946007)(66476007)(5660300002)(110136005)(966005)(38100700001)(478600001)(2616005)(316002)(52116002)(36756003)(186003)(956004)(26005)(6666004)(16526019)(31696002)(53546011)(44832011)(2906002)(16576012)(86362001)(6706004)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?Windows-1252?Q?B2Hq0X51QpokCPqCU/8GGXTUjgiBzdpVkv7mTmLdNFR3I+mpcuVjYRY8?=
 =?Windows-1252?Q?PksHs/ckuB6Arl9aVHNn4eUtBKJ9AntRWGRA78rbRTpyvXFmJfFwA9VY?=
 =?Windows-1252?Q?us2sDzq1JfztckymjUmtr/7i44hZXzIJAmfArXJ4a8PMRtOb0vuPFB9/?=
 =?Windows-1252?Q?eKDepEf380xnx8QPzraIgHZWCBvRu49DJOXeOkBa/C7wsmKwyFkIbk0t?=
 =?Windows-1252?Q?jGUwkwJzgexQElaWJqQYRWlGklJ/XmbGnA0sRcSYkGo7XdQNgnMB4lh3?=
 =?Windows-1252?Q?lUDxBXh64SEwVxK8MLsnEU79KP5sPZWghr7qdRGAJOC/Iwr4EguKn8BG?=
 =?Windows-1252?Q?jtNuBWLFs7ag4+PmUIH7nK9g/tAL1MhlwHEpWKq6g59BiBfOTgoONLKA?=
 =?Windows-1252?Q?C/dmBlUYzOVtYk+gH9Uuf4sNHJ18N69JqSeXLkKkUQa9Cp/hMiyDnSWE?=
 =?Windows-1252?Q?5g+fb0zl+gkg8pbCVqotiP9tvFUpfnzp5uYNJrmaFcyIHp7zawLwcu6H?=
 =?Windows-1252?Q?zQpyf5vXh4CRd1fgWKl/b3keUPFl2sgeMm9Lvukot9bdKQkzJjIsZ24e?=
 =?Windows-1252?Q?udvU+iBPS2HA0Q11kDK19ZoZ0VZR1o+JRAerh6kUYnpa5cLCKLeKNw8X?=
 =?Windows-1252?Q?CaHD9v6caWPiipcwo67Nec88mcWJTsfsrrl70aMuQZZweZ7a79lBLdYO?=
 =?Windows-1252?Q?kJiXPmx2BJHC3Ql567Jh43tJxG455upjLFKsdnEYSjpt/Xy6lhEcCPtV?=
 =?Windows-1252?Q?10gglNb6Zb2gsI8sQLyavT1xEsbMQK+hOhI6GKg/Xvg+PFDLBjS8cBxc?=
 =?Windows-1252?Q?8ZusaR9GrmZB2oOPz9J7dTV5jp7zM3yYp8gVZhRtJP2vMUXqzAhID9yU?=
 =?Windows-1252?Q?3zf+KcTiV6lTy3hchpRVVCISi//zqsn9Aoa6iJDLd0zxC3nlHT992fm8?=
 =?Windows-1252?Q?aRKfdMDKUNidjwboAiBYZ/zP3TVwiY6js6z3KHjSNYWPXQUEpQimdvI4?=
 =?Windows-1252?Q?MOLftU7u4302l+4i3UqPFQga5MbT3GocjptVnfqWrXT5gAHOlk8XH5k2?=
 =?Windows-1252?Q?ug2CvzSTKyDlos+Zf2g8xpc+Olga5VdZRC1TEQpl5grnW0Z90lEVD1UR?=
 =?Windows-1252?Q?IMxUQIWrtv6wquyeJjfatPzkBJQx8glL/NpqvtT00cOZJLaa+OzfKRXW?=
 =?Windows-1252?Q?2EyPJrY89xkiHsVGRpkSEqVeXwQDVMxUMzJ8YFrXWxvbtGw5Du5zQLtx?=
 =?Windows-1252?Q?I1dPsO+PeOY5ctpIl5rrf3WZpcR0bI/Z0OxMU5u4krTS8SgGcQ4uUHiQ?=
 =?Windows-1252?Q?DKjr6W+P183cE+U/s0Pol6gRE15KKJAwzsvY9mM2S9nadQNLuONdLgta?=
 =?Windows-1252?Q?ldpwc2v+TgfCeHzSNI6L8+5S/O5slTjY3Q/3/GTHSjKn9vJ2bEcxZBLU?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa3b3524-9a31-4850-80f1-08d8ece1cab5
X-MS-Exchange-CrossTenant-AuthSource: BN7PR11MB2548.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 03:22:59.3590
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dRSbowFVXASd/6xgjyj+oI1YWk3OHo3cYrKYBCSYQJWuhuZEM9iaKDa8hTNgRyL9bkoN0QKu7gPl2ZHSTS4sbhuj0LW/FhVgU0LPobVAw7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5257
Content-Type: multipart/alternative;
 boundary="------------7F5400AF9EC97D50101A64D6"
Content-Language: en-US

--------------7F5400AF9EC97D50101A64D6
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit


On 3/2/21 5:49 PM, Naveen Saini wrote:
> [Please note: This e-mail is from an EXTERNAL e-mail address]
>
> This is now failing when you are behind a proxy because it's trying to fetch those modules during do_compile().
> https://github.com/golang/example/commit/bcf50bfd7dcd8020c90965747d857ae42802e0c5
>
> Error log:
>
> | ERROR: Execution of '~/build/tmp/work/corei7-64-poky-linux/go-helloworld/0.1-r0/temp/run.do_compile.26031' failed with exit code 1:
> | go: golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0: Get "https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod": dial tcp 216.58.196.49:443: i/o timeout
> | go: golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0: Get "https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod": dial tcp 216.58.196.49:443: i/o timeout
>
> Regards,
> Naveen

I send a patch to disable the module-aware mode for this recipe, as 
module-aware mode blocks offline build

and condition when  proxy.golang.org is not accssible.

But disable module-aware mode is just a temporary workaround,  now go is 
1.16,  from go1.17, GOPATH mode will be dropped,

GO111MODULE will be ignored. Maybe, the final solution  should be 
making  bitbake's fetcher support offline build with

go module-aware mode.

>
>> -----Original Message-----
>> From: openembedded-core@lists.openembedded.org <openembedded-
>> core@lists.openembedded.org> On Behalf Of Khem Raj
>> Sent: Wednesday, February 24, 2021 12:13 PM
>> To: openembedded-core@lists.openembedded.org
>> Cc: Khem Raj <raj.khem@gmail.com>
>> Subject: [OE-core] [PATCH v2 3/3] go-helloworld: Turn into a go module
>> enabled build
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> index ab70ea98a3..d3f7525dc9 100644
>> --- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> +++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
>> @@ -6,13 +6,14 @@ LICENSE = "MIT"
>>   LIC_FILES_CHKSUM =
>> "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b
>> 4f302"
>>
>>   SRC_URI = "git://${GO_IMPORT}"
>> -SRCREV = "46695d81d1fae905a270fb7db8a4d11a334562fe"
>> +SRCREV = "bcf50bfd7dcd8020c90965747d857ae42802e0c5"
>>   UPSTREAM_CHECK_COMMITS = "1"
>>
>>   GO_IMPORT = "github.com/golang/example"
>>   GO_INSTALL = "${GO_IMPORT}/hello"
>> +GO_WORKDIR = "${GO_INSTALL}"
>>
>> -inherit go
>> +inherit go-mod
>>
>>   # This is just to make clear where this example is
>>   do_install_append() {
>> --
>> 2.30.1
>
> 
>

--------------7F5400AF9EC97D50101A64D6
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=Windows-1252">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/2/21 5:49 PM, Naveen Saini wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5baa9e0336304fa281deaf975e3f1191@intel.com">
      <pre class="moz-quote-pre" wrap="">[Please note: This e-mail is from an EXTERNAL e-mail address]

This is now failing when you are behind a proxy because it's trying to fetch those modules during do_compile().
<a class="moz-txt-link-freetext" href="https://github.com/golang/example/commit/bcf50bfd7dcd8020c90965747d857ae42802e0c5">https://github.com/golang/example/commit/bcf50bfd7dcd8020c90965747d857ae42802e0c5</a>

Error log:

| ERROR: Execution of '~/build/tmp/work/corei7-64-poky-linux/go-helloworld/0.1-r0/temp/run.do_compile.26031' failed with exit code 1:
| go: <a class="moz-txt-link-abbreviated" href="mailto:golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0">golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0</a>: Get <a class="moz-txt-link-rfc2396E" href="https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod">&quot;https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod&quot;</a>: dial tcp 216.58.196.49:443: i/o timeout
| go: <a class="moz-txt-link-abbreviated" href="mailto:golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0">golang.org/x/tools@v0.0.0-20210112183307-1e6ecd4bf1b0</a>: Get <a class="moz-txt-link-rfc2396E" href="https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod">&quot;https://proxy.golang.org/golang.org/x/tools/@v/v0.0.0-20210112183307-1e6ecd4bf1b0.mod&quot;</a>: dial tcp 216.58.196.49:443: i/o timeout

Regards,
Naveen</pre>
    </blockquote>
    <p>I send a patch to disable the module-aware mode for this recipe,
      as module-aware mode blocks offline build <br>
    </p>
    <p>and condition when&nbsp; proxy.golang.org is not accssible.</p>
    But disable module-aware mode is just a temporary workaround,&nbsp; now
    go is 1.16,&nbsp; from go1.17, GOPATH mode will be dropped,<br>
    <p>GO111MODULE will be ignored. Maybe, the final solution&nbsp; should be
      making&nbsp; bitbake's fetcher support offline build with</p>
    <p>go module-aware mode.&nbsp; <br>
    </p>
    <blockquote type="cite" cite="mid:5baa9e0336304fa281deaf975e3f1191@intel.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> &lt;openembedded-
<a class="moz-txt-link-abbreviated" href="mailto:core@lists.openembedded.org">core@lists.openembedded.org</a>&gt; On Behalf Of Khem Raj
Sent: Wednesday, February 24, 2021 12:13 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
Cc: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
Subject: [OE-core] [PATCH v2 3/3] go-helloworld: Turn into a go module
enabled build

Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E" href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
---
 meta/recipes-extended/go-examples/go-helloworld_0.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
index ab70ea98a3..d3f7525dc9 100644
--- a/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
+++ b/meta/recipes-extended/go-examples/go-helloworld_0.1.bb
@@ -6,13 +6,14 @@ LICENSE = &quot;MIT&quot;
 LIC_FILES_CHKSUM =
<a class="moz-txt-link-rfc2396E" href="file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302">&quot;file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b
4f302&quot;</a>

 SRC_URI = &quot;git://${GO_IMPORT}&quot;
-SRCREV = &quot;46695d81d1fae905a270fb7db8a4d11a334562fe&quot;
+SRCREV = &quot;bcf50bfd7dcd8020c90965747d857ae42802e0c5&quot;
 UPSTREAM_CHECK_COMMITS = &quot;1&quot;

 GO_IMPORT = &quot;github.com/golang/example&quot;
 GO_INSTALL = &quot;${GO_IMPORT}/hello&quot;
+GO_WORKDIR = &quot;${GO_INSTALL}&quot;

-inherit go
+inherit go-mod

 # This is just to make clear where this example is
 do_install_append() {
--
2.30.1
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">


</pre>
    </blockquote>
  </body>
</html>

--------------7F5400AF9EC97D50101A64D6--
