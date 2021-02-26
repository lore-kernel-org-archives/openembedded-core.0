Received: from NAM04-MW2-obe.outbound.protection.outlook.com (NAM04-MW2-obe.outbound.protection.outlook.com [40.107.101.68])
 by mx.groups.io with SMTP id smtpd.web09.3663.1614304632529915808
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Feb 2021 17:57:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=f2YYXE0x;
 spf=pass (domain: windriver.com, ip: 40.107.101.68, mailfrom: kai.kang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9cPHXqurKDIMGxvLuZThwsU6Nc+VLcz+yW1UXAhD+seHcuRIf5CduWoOYSuNlZQZGG9tiVd4JwQk/yrh6A5sMTHefdJHb9Y5Cv0altePHrp9LPeN64y3zrGNWpxcddlsDbRIl4Zal621ClW1r0saUPLKJk2c65/t88kkngfn0jH1u8IdtWo6zg8eS3jvi+7pfOJkpF+Gaq0d8sEemw1XdOb1WRvQazlWzTuoUHaHyVnT9QuImwfau8C75i8gjmHbGLADiKe26ifHPz7cinK1vb08uPn8bOYjdOM0XVxdbhXTc04Fp4NJTzqL8NPFBTC6AJSILq1lt0EzaeU12BnFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BODU5zKA3Dndm51FKTo3AXZAvv3kjchY0GKI4peTtlE=;
 b=Xm24T0zpM78ejFTo6zyteaHz1TqDX/YRS+GTQkIO0kGJXpO4qEh8DreQ6GUivYuVe1d1ZRicqDmP+jAvdfSzVLDD8Xei8joFdltKlzG23it4WsNTo0Ew6GU4nVLXNofBf/INBL2E+W/PMUdk7umXiFhqHQLqaILQc30VBBdLPZI63/f2Yt9FKWgkYPUzovBeWCCnYpE8TWk9Xzyasw69zNYJRzRcWaBNyml0Z9AEAfQVJvSBCEWoJw+zwiCi9O9lOmfS6Ejl+eIH5ClB2/aBEdIM3wczuUQPTqIOQkveqfJtCvjV6Czyd3lVfolX+sbLpdmbbinomydlmrDErA4o2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BODU5zKA3Dndm51FKTo3AXZAvv3kjchY0GKI4peTtlE=;
 b=f2YYXE0xLxQQvGLfXbNZlj/p1Buh6ZUBCY+Pvj3aTXMVSR6m5zXZ65Juvs6VmYdy348HhV9lLACdH6Z9YVw45vovHT++1kl7iRlRa5MPKVec7e0PICppWEnYm5IyCHMUM44dPdPUUPY05A7qLsgy8090dcUANTL7e24l+M2oKQA=
Authentication-Results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
Received: from CY4PR11MB1432.namprd11.prod.outlook.com (2603:10b6:910:5::22)
 by CY4PR11MB1431.namprd11.prod.outlook.com (2603:10b6:910:3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.31; Fri, 26 Feb
 2021 01:57:10 +0000
Received: from CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484]) by CY4PR11MB1432.namprd11.prod.outlook.com
 ([fe80::5575:11f2:7054:b484%4]) with mapi id 15.20.3890.020; Fri, 26 Feb 2021
 01:57:10 +0000
Subject: Re: [OE-core] [PATCH v2] toolchain-scripts.bbclass: customize prompt string for SDKs
To: Christopher Larson <kergoth@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
 Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20210225055914.34860-1-kai.kang@windriver.com>
 <CABcZANm-+8uOoAskLz7GM4DDGrYM4c2O4NZyAz2WuHhdiH7jMg@mail.gmail.com>
From: "kai" <kai.kang@windriver.com>
Message-ID: <0a2eff5a-9121-e31f-abee-47c096799e85@windriver.com>
Date: Fri, 26 Feb 2021 09:57:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CABcZANm-+8uOoAskLz7GM4DDGrYM4c2O4NZyAz2WuHhdiH7jMg@mail.gmail.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0109.apcprd03.prod.outlook.com
 (2603:1096:203:b0::25) To CY4PR11MB1432.namprd11.prod.outlook.com
 (2603:10b6:910:5::22)
Return-Path: kai.kang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.141] (60.247.85.82) by HK0PR03CA0109.apcprd03.prod.outlook.com (2603:1096:203:b0::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend Transport; Fri, 26 Feb 2021 01:57:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78377e68-3e33-4f9a-4c6d-08d8d9f9d3b9
X-MS-TrafficTypeDiagnostic: CY4PR11MB1431:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR11MB14313E13BF2EB05B22242BC2959D9@CY4PR11MB1431.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tpZ/cRMhpdLhPYIEzHjtmBI3ITSoS5DS+DdCnVQvvMwzA6CjMdZ3OsjjuTnWc/S9hoBotZD60ci3V+86yu+RzF8iMUGh9XExLj5sZFtkvlW5du98CxSeLOEI1h44C/0pcNits0XNyHTpP3QzpAPzOQDTKcM8RxvJajRvwMhzSAa79jFrDM8HVFKJQbyHcjFaw5y5QVscahyMdoyQFMDYQTNjrkM5VXP85fLGjYEtnWyX/9bPZZVvpRQB+BC85qHCMWoiWSbQZn9RNYpNK/qcQtF7cJNQvspAlOMDoSl/rest+oJVcmqcnVltrB1idHv+7Vf6YKI0J57wqUPEyHEIwkYe27nE6KrjhTBR8lar3Od6oBAM6skEWgxk34AAGMmyZPcrcKkoxnjqPtK0ODm4oO0ce7++3tMKCNgJCiAkKTul7/AmOLdrjFTdSCB+/M1IzScdzmrDGBdpfXmBcn/sg/cY6n2ALCBMWVfeJdG9vVDQryubEQY77T5u46OfDvG1AuOk+HDqY+zDWmJry1Viqt1fSxoGOEZEeljHaE/TM8/0fbsHEQJT6XInz4WIWaMxDu8IZP8DaemGbUqn2wkaKU4gaNDHcL8ufnumEuiR8MBn75VEo9Dz+eTAQIEuCmbz323ge6SMQg3pNWi0TmRIDP36ZLGt+13G9tR0MbiSLQ7nDg2ukzV9cBqicAa0QhXeQ8NTB+teemcXaIw+wx1BTQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY4PR11MB1432.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39850400004)(376002)(346002)(52116002)(36756003)(8936002)(33964004)(26005)(956004)(6706004)(53546011)(2616005)(16526019)(478600001)(186003)(6916009)(66556008)(8676002)(66476007)(66946007)(31696002)(6486002)(83380400001)(5660300002)(16576012)(54906003)(86362001)(6666004)(966005)(316002)(31686004)(2906002)(4326008)(166002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?aGFQdzc3em9idHc3VFdqY1FsRXNXV0crSWN4a0VWQnRLTXJtMXVzU1FwekJO?=
 =?utf-8?B?elVlM0lVVUJtVWpRbERiTXhZTmJSaldYclVaOHgrSkxUL3drUFJNYU1yMWhi?=
 =?utf-8?B?RkFBYnFpc3J2a1dneC9GSTI2SVRXckRlSDVDdk5tQkFzc0NXNmJsci9ubTNJ?=
 =?utf-8?B?QldMV3crMUxnajJjVlJPTklESFhMTXNuRjhGSzhQNmswcUR6aU5zVHVvYU93?=
 =?utf-8?B?YkE4dStLVW40b3F5ZCtBUHRxeThpQW8rQVJrRGQyN1Y0ZUNMWFl5MlQvUDhS?=
 =?utf-8?B?UG40eXNUVHYrdEtDbTlMWHk3UlorSmJRWml2dGphTWVSQjNCYUl3cHo5eEph?=
 =?utf-8?B?b0kxR0dnQ0VZaGhCU0dZZ21jUzJqY1FuMXRuMUpvNk84Q2x2YlJQRTRzTk03?=
 =?utf-8?B?eXRsN29HNGhUZmdjbEo2SllwdjRmYTVRQTJCMzNseVRUOThNY0dtZ1hFdjVo?=
 =?utf-8?B?aFFUNzlqY1dkeGdzNFIxa0tTamRwRzROVkRWcW04ZWxZRDhRZnRiZGZUclRY?=
 =?utf-8?B?Ykp5UWxNK2lqZXRidFBBS0JRY2tseXBRODdGRStXZzRxbXZIZmVEY1RJY0ZL?=
 =?utf-8?B?SGlXenRUUmhDRWxWbzRsRFNOVW8wcUd1ZHZrdGFWU3QwaEZLZjlHQXVxZ05n?=
 =?utf-8?B?WHIyZ0Q5MTBXekt0SFZPdlVZZGJNcUNJdTdSRU00RjZGRjIvbmhIZzhWV1M2?=
 =?utf-8?B?QVAwakpDeGtHdmFFUE1QYlA0ZzNUdlhqM29EU0lDRE92cFJmYnVBR25Ob1h0?=
 =?utf-8?B?aElKdDh4ZnNXWGlBMnNCbVRsN0dobUxWTGN6Q1d3dVN6RHgwVXVkNHlxc1d1?=
 =?utf-8?B?WlR3ZVk4ZEtPUHBYK2dOcXVidXdscTdZN25EM3pkYUNwMmY0ZXAwUGRON0pK?=
 =?utf-8?B?RVRwQlNIVUFaNDVoMWNoZXFOUTJuMWN0ODdETDhpNXFnalJvZSt5eXZpb0xy?=
 =?utf-8?B?TkVpV1dCdVlkRlJxUEFiZnE5VlVKUVpzcnhvZ3VxR001cEZ5SllYVWQrMmdS?=
 =?utf-8?B?V0Z3WEd3ZUViNGJhVnl5c1h0cGZxNXoveWgyampUWk42NUk1WEtMUDhxejFh?=
 =?utf-8?B?RDExdm4vbFNqQ00xd2Q0SnROVXVwemVxRGZUcDlnSm9jUUVscWFHSzkrZTlP?=
 =?utf-8?B?Mkd4UStZL3FMK3JZKzRZYzVLK3ZIYVR3cldFUldpNHlGR0x6Ukx5VlZrR3hO?=
 =?utf-8?B?WWVzREozWGt2anA0RGxDV3k5cmhmUnpMQUtMblkzbTJFUEZmY3F5cFBHWEJn?=
 =?utf-8?B?cjJTVmZaUzVhTGxaVGxGTVNDcHZMeDUzZFNITW9PcjFtd2N6TzljbkQvRith?=
 =?utf-8?B?bjNkUGpWQ2wzV0xlbzFzZDk4dmNhakw3VEVNRmExZElpcldBclRFVHFZcy9I?=
 =?utf-8?B?aStBZDNsQ0JEcFhNQ2w0eTdVNDlod2FtU2J6NmpCV2RJMHBkQWpFdmM0SnpO?=
 =?utf-8?B?NDR5bmNYc09WQ1R0RFdkb3NlVTdlWHVjYjdDOXJQQ0NYTFBHNkZLWW5mRk9s?=
 =?utf-8?B?a0NzU1RTa2FSelNkV3JSV090NGx5UjlMeFREZWdZSEtUdGp0dVB6VkZRc0I2?=
 =?utf-8?B?N2RVL3Bmc1kyNzUzb3MwZUw4bWoyV3dmbjZmaGw0MUYwVHRueWNwQUpwcmhq?=
 =?utf-8?B?VzljUFVWblFmZWhHWERDaWNvNVA0K0NvRTJvMWdzSGNmQXBueTBEeW00dmQv?=
 =?utf-8?B?VTlnNmlkUnNLNDNER2VRNUxCdTE2VkVtMjZiVUtnYjFMOXV0bkNHUzVFWEov?=
 =?utf-8?Q?Xl5SG7tiBEofqOmHvAMrPoGUX5cU1qZ2r5tTXsi?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78377e68-3e33-4f9a-4c6d-08d8d9f9d3b9
X-MS-Exchange-CrossTenant-AuthSource: CY4PR11MB1432.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2021 01:57:09.7264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/R5IbHsiaxal5TXSIofQj1bK1I7Ni0mBIdCGPiQ8+IYym6icnDXb4+6nohB2lHTx/RiqpFziF5WzUkAa16E1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR11MB1431
Content-Type: multipart/alternative;
 boundary="------------7E6FF31DA1D3A455A0028DDB"
Content-Language: en-US

--------------7E6FF31DA1D3A455A0028DDB
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/25/21 11:29 PM, Christopher Larson wrote:
> Are we sure we want to completely override it rather than adding to 
> it? I'd be rather irritated if this blows away my prompt without my 
> asking for it. I think either it should append or have a variable 
> controlling whether this is enabled when building the SDK.
The original requirement is that the PS1 after source sdk environment 
file is as same as the original one. It can not tell whether in a sdk 
environment.

The default assignment of SDK_PS1 is '?=', you can set it in conf file 
to override it.

Regards,
Kai

>
> On Wed, Feb 24, 2021 at 10:59 PM kai <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     Introduce a new variable SDK_PS1 to customize prompt string for SDKs
>     when source script environment-setup-script.
>
>     The default prompt string of SDKs looks like:
>
>     SDK-poky-glibc-x86_64--cortexa57-qemuarm64$
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>     v2: not set PS1 for buildtools-tarball
>
>      meta/classes/toolchain-scripts.bbclass | 1 +
>      meta/conf/bitbake.conf                 | 1 +
>      2 files changed, 2 insertions(+)
>
>     diff --git a/meta/classes/toolchain-scripts.bbclass
>     b/meta/classes/toolchain-scripts.bbclass
>     index db1d3215ef..88df373d0b 100644
>     --- a/meta/classes/toolchain-scripts.bbclass
>     +++ b/meta/classes/toolchain-scripts.bbclass
>     @@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {
>     EXTRAPATH="$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i"
>             done
>             echo "export
>     PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}"$EXTRAPATH':$PATH'
>     >> $script
>     +       echo 'export PS1="${SDK_PS1}"' >>$script
>             echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT' >>
>     $script
>             echo 'export
>     PKG_CONFIG_PATH=$SDKTARGETSYSROOT'"$libdir"'/pkgconfig:$SDKTARGETSYSROOT'"$prefix"'/share/pkgconfig'
>     >> $script
>             echo 'export
>     CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >>
>     $script
>     diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>     index 48af17fbf7..6075749a5e 100644
>     --- a/meta/conf/bitbake.conf
>     +++ b/meta/conf/bitbake.conf
>     @@ -422,6 +422,7 @@ PKGDATA_DIR = "${TMPDIR}/pkgdata/${MACHINE}"
>
>      SDK_NAME_PREFIX ?= "oecore"
>      SDK_NAME = "${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}"
>     +SDK_PS1 ?= "SDK-${SDK_NAME}:\\\\$ "
>      SDKPATH = "/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}"
>      SDKPATHNATIVE = "${SDKPATH}/sysroots/${SDK_SYS}"
>
>     -- 
>     2.17.1
>
>
>     
>
>
>
> -- 
> Christopher Larson
> kergoth at gmail dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Senior Software Engineer, Mentor Graphics


-- 
Kai Kang
Wind River Linux


--------------7E6FF31DA1D3A455A0028DDB
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 2/25/21 11:29 PM, Christopher Larson
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CABcZANm-+8uOoAskLz7GM4DDGrYM4c2O4NZyAz2WuHhdiH7jMg@mail.gmail.com">
      
      <div dir="ltr">Are we sure we want to completely override it
        rather than adding to it? I'd be rather irritated if this blows
        away my prompt without my asking for it. I think either it
        should append or have a variable controlling whether this is
        enabled when building the SDK.</div>
    </blockquote>
    The original requirement is that the PS1 after source sdk
    environment file is as same as the original one. It can not tell
    whether in a sdk environment.<br>
    <p>The default assignment of SDK_PS1 is '?=', you can set it in conf
      file to override it.</p>
    <p>Regards,<br>
      Kai<br>
    </p>
    <blockquote type="cite" cite="mid:CABcZANm-+8uOoAskLz7GM4DDGrYM4c2O4NZyAz2WuHhdiH7jMg@mail.gmail.com"><br>
      <div class="gmail_quote">
        <div dir="ltr" class="gmail_attr">On Wed, Feb 24, 2021 at 10:59
          PM kai &lt;<a href="mailto:kai.kang@windriver.com" moz-do-not-send="true">kai.kang@windriver.com</a>&gt; wrote:<br>
        </div>
        <blockquote class="gmail_quote" style="margin:0px 0px 0px
          0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          <br>
          Introduce a new variable SDK_PS1 to customize prompt string
          for SDKs<br>
          when source script environment-setup-script.<br>
          <br>
          The default prompt string of SDKs looks like:<br>
          <br>
          SDK-poky-glibc-x86_64--cortexa57-qemuarm64$<br>
          <br>
          Signed-off-by: Kai Kang &lt;<a href="mailto:kai.kang@windriver.com" target="_blank" moz-do-not-send="true">kai.kang@windriver.com</a>&gt;<br>
          ---<br>
          v2: not set PS1 for buildtools-tarball<br>
          <br>
          &nbsp;meta/classes/toolchain-scripts.bbclass | 1 +<br>
          &nbsp;meta/conf/bitbake.conf&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;| 1 +<br>
          &nbsp;2 files changed, 2 insertions(+)<br>
          <br>
          diff --git a/meta/classes/toolchain-scripts.bbclass
          b/meta/classes/toolchain-scripts.bbclass<br>
          index db1d3215ef..88df373d0b 100644<br>
          --- a/meta/classes/toolchain-scripts.bbclass<br>
          +++ b/meta/classes/toolchain-scripts.bbclass<br>
          @@ -45,6 +45,7 @@ toolchain_create_sdk_env_script () {<br>
          &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
EXTRAPATH=&quot;$EXTRAPATH:$sdkpathnative$bindir/${TARGET_ARCH}${TARGET_VENDOR}-$i&quot;<br>
          &nbsp; &nbsp; &nbsp; &nbsp; done<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo &quot;export
PATH=$sdkpathnative$bindir:$sdkpathnative$sbindir:$sdkpathnative$base_bindir:$sdkpathnative$base_sbindir:$sdkpathnative$bindir/../${HOST_SYS}/bin:$sdkpathnative$bindir/${TARGET_SYS}&quot;$EXTRAPATH':$PATH'
          &gt;&gt; $script<br>
          +&nbsp; &nbsp; &nbsp; &nbsp;echo 'export PS1=&quot;${SDK_PS1}&quot;' &gt;&gt;$script<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo 'export PKG_CONFIG_SYSROOT_DIR=$SDKTARGETSYSROOT'
          &gt;&gt; $script<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo 'export
PKG_CONFIG_PATH=$SDKTARGETSYSROOT'&quot;$libdir&quot;'/pkgconfig:$SDKTARGETSYSROOT'&quot;$prefix&quot;'/share/pkgconfig'
          &gt;&gt; $script<br>
          &nbsp; &nbsp; &nbsp; &nbsp; echo 'export
          CONFIG_SITE=${SDKPATH}/site-config-'&quot;${multimach_target_sys}&quot;
          &gt;&gt; $script<br>
          diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf<br>
          index 48af17fbf7..6075749a5e 100644<br>
          --- a/meta/conf/bitbake.conf<br>
          +++ b/meta/conf/bitbake.conf<br>
          @@ -422,6 +422,7 @@ PKGDATA_DIR =
          &quot;${TMPDIR}/pkgdata/${MACHINE}&quot;<br>
          <br>
          &nbsp;SDK_NAME_PREFIX ?= &quot;oecore&quot;<br>
          &nbsp;SDK_NAME = &quot;${SDK_NAME_PREFIX}-${SDK_ARCH}-${TUNE_PKGARCH}&quot;<br>
          +SDK_PS1 ?= &quot;SDK-${SDK_NAME}:\\\\$ &quot;<br>
          &nbsp;SDKPATH = &quot;/usr/local/${SDK_NAME_PREFIX}-${SDK_ARCH}&quot;<br>
          &nbsp;SDKPATHNATIVE = &quot;${SDKPATH}/sysroots/${SDK_SYS}&quot;<br>
          <br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br clear="all">
      <div><br>
      </div>
      -- <br>
      <div dir="ltr" class="gmail_signature">
        <div dir="ltr">
          <div>
            <div dir="ltr">Christopher Larson<br>
              kergoth at gmail dot com<br>
              Founder - BitBake, OpenEmbedded, OpenZaurus<br>
              Senior Software Engineer, Mentor Graphics</div>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Kai Kang
Wind River Linux</pre>
  </body>
</html>

--------------7E6FF31DA1D3A455A0028DDB--
