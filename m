Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.86])
 by mx.groups.io with SMTP id smtpd.web12.3248.1618536405056281402
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 18:26:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=ZAHknkJr;
 spf=pass (domain: windriver.com, ip: 40.107.92.86, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g9kJNiLwqXYPs/kmxbUSZw0PZYm0ORZJZOZCxZ52Ag/j2V7uio3Tb0qP+85YP1iHMpM73pnmySteRcX5KsjtLEoVPHfzKiqYr/Xwzejzu+gCz5JB00UX4dNM5WAb08UnDs3dP9VtPOI9y3ubXsuoGn4/MT+pd35ntlcL3/Y1RFqOxMGJcuPQbC5lbJCCYO9WfZ2H5PNmL1IV4/3+kDF2y1MEF6tH3/Sog7x1xZbYOhfr7GSSKm0cc6GY622NkiLJ67pVEZD7frwxIasbc2qaIaK2qt7JDQgsMUwzXoedulKNMd/9tbJFbbR+EX5tJF+HofKO4ayslkfPd3DWn40cdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/uGk5bpPm1QEyFxuu3HAmrzAZy0Y4pvhPd+go7Rrd4=;
 b=PBFXrOWETMQl3+87ECCYeA41pV0OiprfxcpU8mOllFQFb+BwzgLiKM4e+J6xEfcC5DYqsc4D5msDBU44jOIjQSTfV61SVRQOvTtpGKLFCy0KFs+22wnVPMrjQwhB1uJ9rJC3WtDRyIJa6iBO8S7Ho2me1HZm4mQOR82ODOMS/EqC0cJc36CpePmxrOMDWEfroNkgtXW3NAMh0v8sc1pZDhJrhNGsiOCOmE4SbC7pWPCPt8Ml+H4kkBHmqLjvig87CLT7lVFdOmmmSolK2pAWRRxvtzrHlijg+4d3mk5cqO1O5HJf8ATjqvz5QczX8LIruoM4BqA9Mmgv+jtrrqSfLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/uGk5bpPm1QEyFxuu3HAmrzAZy0Y4pvhPd+go7Rrd4=;
 b=ZAHknkJrhCJXEaN7dlGTYYbfuoae1Z7NZSpqJOtTmCeI3lWxq8SUXq3VobXcnWPkdWVGiHEPSDkLemJTMAPalUDZNycUgJvFLthTYIw0HIiHwmXbdlZNkCync5OSbonIQY5/ktT/wccqsSGZ9Jp237NWbx+MJhmUpNtaPDevsHM=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BYAPR11MB3480.namprd11.prod.outlook.com (2603:10b6:a03:79::27)
 by BY5PR11MB4388.namprd11.prod.outlook.com (2603:10b6:a03:1c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Fri, 16 Apr
 2021 01:26:42 +0000
Received: from BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b]) by BYAPR11MB3480.namprd11.prod.outlook.com
 ([fe80::5091:f32:2586:572b%7]) with mapi id 15.20.4042.018; Fri, 16 Apr 2021
 01:26:42 +0000
Subject: Re: [OE-core][PATCH] base.bbclass: remove obsolete hosttools
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210415080103.109691-1-Qi.Chen@windriver.com>
 <f1e774378de966fd8a8820e28bd547c07e482d07.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <04249d31-588d-6702-8c63-ab138787bbce@windriver.com>
Date: Fri, 16 Apr 2021 09:35:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <f1e774378de966fd8a8820e28bd547c07e482d07.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR02CA0159.apcprd02.prod.outlook.com
 (2603:1096:201:1f::19) To BYAPR11MB3480.namprd11.prod.outlook.com
 (2603:10b6:a03:79::27)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK2PR02CA0159.apcprd02.prod.outlook.com (2603:1096:201:1f::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.4042.16 via Frontend Transport; Fri, 16 Apr 2021 01:26:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 127c1774-93d0-4cea-8f4c-08d90076b0df
X-MS-TrafficTypeDiagnostic: BY5PR11MB4388:
X-Microsoft-Antispam-PRVS: 
	<BY5PR11MB438816344CEEBD9D25F2DB76ED4C9@BY5PR11MB4388.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2803;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LIx1I3aHeaMWugOVXw/9z97zIrsnY2DZbW8WFLW1hYgwIlsxP9CsCuQ33O/QUIu3PQTDum2ablq+Da0U7qi8UK2yjjTLClj0qL5quASJw5YGPQ7qAxiIU61rG3XRE2Nu5Z4foerAfLNCpbr7ESrZbla4hO/Rfz5yaxvZsIT0qEJU5MssFPpT8c6kR1VPMl+0KMk0OFc2Fzz1xdqzPQ7gKEsH2G7jThYwLcmxI7+NUbIUQAFjJyAtpb9EQa2gJhFsVOdY6aITJGRk2kVvdDmRWqLslQ/JN0GbsRbqiLWdwcTkawTLhSC9CNFLueAOW1hYQ9UJ+tiYeo5rFlFMqeHZ6rmzps9PYUBjpWw5/WPNpHGeKpkO8iIqwpZaxbIOD1pCMzuEC4fh9vQ4qCsO0doJLNm0rz2R+1nYC0PPEaTGoIRPQxFjpVowqcCCxzYGgbu9FTUXcd6JveKLexaB9tTYFwXZbxf1xOgcuU1lPvvMmfVfjOVF8GGZ5fJNcYThx171k9qxnMQkBJG3KkrqIa4W1DrOfYQxA+wEouRXI6SYMHpje3HMWMZsg4geo5cary4Gth6L98P1nIrw0xr/r6E5ClgI72mRNWlEkW4Ng8sKFHQqfLrubTWn5NKLiweJb1xf4Kk4BBRQOH0ww6PTSVuE8SzsHMykZrVeIx6FV52BnfzyYW+t+7LRobYGyNg3yilsnORPCnubY5t11RD7VtOS+9ZEru/aAZyqNFIQTbwU0R70BFLOMI0ZGD1HsJyvsy4Yov1O3lESBLZoQHne7Mdun+W5t+WOLXSQMnMCyRlM8hJCm/5Dd/TytIN4LfUBkVqqA7y+R+uu65zDWp3Y/tjW5A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3480.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(39840400004)(376002)(396003)(366004)(136003)(956004)(31696002)(2616005)(66556008)(86362001)(83380400001)(186003)(6706004)(33964004)(38100700002)(478600001)(66476007)(26005)(52116002)(8676002)(31686004)(16576012)(166002)(36756003)(2906002)(16526019)(6666004)(38350700002)(5660300002)(316002)(8936002)(53546011)(966005)(66946007)(6486002)(78286007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?NTY2SzB3bzhSdGViM1E2dXFpNlJaRHEvYktGMWd2Q1RYbFBrbnR5VjNwb3Yr?=
 =?utf-8?B?ZlcySVQ1S2dPN1NpVFpvU1JHbHlOTitYOVpuV0YvU09Gc2t6eTRLeitGRGhw?=
 =?utf-8?B?ZGVEWnprOW1kMVhndmJzMU9GVkhDQkJMNG4yNHJjaDZ3Ylh3d3ZLbmVybGg4?=
 =?utf-8?B?bkFTbVN4SGVLZDJjNTJ1N3loa2QwWGRPbzBxREZ1MEdWYmNsNDQ2ekc4VXBw?=
 =?utf-8?B?K1h4RndPMVhmNFpJQjJReCtieE1vZzY2UDB1KysyTWFmdUk0YUV1eC9rYkVL?=
 =?utf-8?B?SU9BcGZ6TUhJdGhqSmVleWxkZUNjWTQ4bUF6bUtJcFpXdkpIekFWNWVRa3E3?=
 =?utf-8?B?TGVRTmtYVmdUeXhxaDR6VHVBVVR4SzY5d1FRZkxVRmFWZ1MrbDZmTWdPb0ds?=
 =?utf-8?B?OUpvYk8zUlhic0daSUYrbS9ibnB4S0x0ZEtpVk5GQ3M5TTNqUG82MWFOTk94?=
 =?utf-8?B?Yzh6cVkzSDdWZkgwSTRCL1FDNzlrRlZ4NUtnYmtOSnNYT3QvWUZyRmdTcHlQ?=
 =?utf-8?B?TkdabWxTUWF6aXpTY2VJNjZhZTRvUG13ZmdwL2RZenZTeUNneDdkejljSTZ0?=
 =?utf-8?B?Rk1SUzJrWE40RXRVb2xNUkdmMFBUYStUanQrQWlwL1ZxeXNuSEE0TGRyVVA5?=
 =?utf-8?B?RHErNzFQN2NXVWpqSnFwNXdXdzNGd2ZaMHczcXNyVm9YdFVHQjlHTnV2NUVN?=
 =?utf-8?B?d0RpVW82NGF3cTZ4MjYrbDVkZTJ1LzVWOGdLZXR6QmZHVHRtMVFRY0tKM2x6?=
 =?utf-8?B?eG02ckZLUmJBeUNOQVJYMkpZZzBKeWVYVHRVcTZTQ2xVMVhEaFFVUWZFQTJ3?=
 =?utf-8?B?REpOUTA0QzM0cjBwdVg5cnJkOWpnL3FkbDJ2bzV5T05TWlFOdWR6ZjVKbmVL?=
 =?utf-8?B?b1dYL2l1YXlMcXNvOExrbkE1WWhLV0dKeWZqNnB1K3M4eU84Mm9IVG90RUhw?=
 =?utf-8?B?Ty9rWkJHaVcxMW5aMm5aOU50Qklhdkp1M0ZtTHUzU0x0TW9mc2JnaTllaUJ6?=
 =?utf-8?B?MTZXZ3laWmxvR3dOcW9WR0tqSEZmbWRPMjd4eTRDMjNxSUlUZ01zNHZYaVMw?=
 =?utf-8?B?YVI4N1RiclYwYklSa2hTNm9WZVV2NDZQT0k4OGtHSUxUZDY4Wm0vRitvWGFJ?=
 =?utf-8?B?VEpwcXMxVmlYZFFmT0U5NWxYd1Y0c1BjdHduUGd1UzRoOFM5NWw2T0lGZDRr?=
 =?utf-8?B?REFmcExCVVVlaFZTa1ByZExWVFRMb3d5NlVWSE9qRkFWa0xhWU9xVTU5ekc1?=
 =?utf-8?B?ekdRV205RVBEVUR5M1I0czU1RWZhNWFMekNyV090VlNMNlBaajJmUElkR0JI?=
 =?utf-8?B?aDZ2Y2g5YWhhT0k1QWY3bXgrUS9la0hEZzFKSUdRQUlUNWg2WHhwRDV0cFd3?=
 =?utf-8?B?YXdJTEViRHh2T1BBVnJpWlExamNMU3JzYURLUmdMZWYxNzFJQjBuNEtqR3Rh?=
 =?utf-8?B?WWZmZ3k5cVFoL0VSV3cwVnpiaVE2WTNsTmp6NzdodEJpaDQ5eTBSdEhIbnRx?=
 =?utf-8?B?NGQ4YlcwUUg5blpzSHdmN2VKUVFkQ2xKTGdoOTZQSDlPbElyZWpUbkV5R01F?=
 =?utf-8?B?eTRFMmFMZVhJYlNJQ0Mram8zVXJFOXVkUG13SXpEcDVXZ29MSFFSQmgvZEZO?=
 =?utf-8?B?N0tqUG9uMjJSNVA1eVNMMzNVa01XZjlwY05McjZ0SEdJekg4MVRxWEd0c0xL?=
 =?utf-8?B?Z21qcEp3ckkySEx3Qi81R2FmSWNkOU9MeTh4UElvd1ppZFYySFFBZDRIaVlo?=
 =?utf-8?Q?0XruUiXhDypodZ2mphAIGwsDRoGhF6PLXlA7/iQ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 127c1774-93d0-4cea-8f4c-08d90076b0df
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3480.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2021 01:26:42.5846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYT32bmlRQL7KdqJPK+hOvYQAh2orFbG3dKqyTXCKUg8Lp5xPA9sLkwGTlzxSyp1ng65+B8sphliDDoNXK3sCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4388
Content-Type: multipart/alternative;
 boundary="------------0E5BD15F7FE324BD83D25629"

--------------0E5BD15F7FE324BD83D25629
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/15/2021 10:18 PM, Richard Purdie wrote:
> On Thu, 2021-04-15 at 01:01 -0700, Chen Qi wrote:
>> If some tool is removed from HOSTTOOLS or HOSTTOOLS_NONFATAL, it
>> will not be removed from TMPDIR/hosttools in an existing build
>> directory. This is unexpected. Any tool that is not specified in
>> HOSTTOOLS and HOSTTOOLS_NONFATAL should be filtered out.
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>> ---
>>   meta/classes/base.bbclass | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index 4dd01ade33..eef573d1ce 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -145,6 +145,13 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
>>       if notfound and fatal:
>>           bb.fatal("The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s" % " ".join(notfound))
>>   
>>
>> +def clean_hosttools_dir(dest, tools):
>> +    import glob
>> +    desttools = glob.glob('%s/*' % dest)
>
> I think you want os.listdir() here?
>
>> +    for dt in desttools:
>> +        if os.path.basename(dt) not in tools:
>> +            os.unlink(dt)
>> +
>
> We didn't do this as it was assumed people very very rarely remove 
> anything from HOSTTOOLS and
> if they did, they'd know what else they needed to do. This does add 
> yet more housekeeping to every
> build which I try to avoid doing for performance :/.
>
> Cheers,
>
> Richard
>

Got it. Thanks for the clarification.

Best Regards,
Chen Qi

>
> 
>


--------------0E5BD15F7FE324BD83D25629
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 04/15/2021 10:18 PM, Richard Purdie
      wrote:<br>
    </div>
    <blockquote cite="mid:f1e774378de966fd8a8820e28bd547c07e482d07.camel@linuxfoundation.org" type="cite">
      
      <div>On Thu, 2021-04-15 at 01:01 -0700, Chen Qi wrote:</div>
      <blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px
        #729fcf solid;padding-left:1ex">
        <pre>If some tool is removed from HOSTTOOLS or HOSTTOOLS_NONFATAL, it</pre>
        <pre>will not be removed from TMPDIR/hosttools in an existing build</pre>
        <pre>directory. This is unexpected. Any tool that is not specified in</pre>
        <pre>HOSTTOOLS and HOSTTOOLS_NONFATAL should be filtered out.</pre>
        <pre>
</pre>
        <pre>Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true" href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;</pre>
        <pre>---</pre>
        <pre>&nbsp;meta/classes/base.bbclass | 8 ++++++++</pre>
        <pre>&nbsp;1 file changed, 8 insertions(+)</pre>
        <pre>
</pre>
        <pre>diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass</pre>
        <pre>index 4dd01ade33..eef573d1ce 100644</pre>
        <pre>--- a/meta/classes/base.bbclass</pre>
        <pre>+++ b/meta/classes/base.bbclass</pre>
        <pre>@@ -145,6 +145,13 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):</pre>
        <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;if notfound and fatal:</pre>
        <pre>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.fatal(&quot;The following required tools (as specified by HOSTTOOLS) appear to be unavailable in PATH, please install them in order to proceed:\n  %s&quot; % &quot; &quot;.join(notfound))</pre>
        <pre>&nbsp;

</pre>
        <pre>+def clean_hosttools_dir(dest, tools):</pre>
        <pre>+    import glob</pre>
        <pre>+    desttools = glob.glob('%s/*' % dest)</pre>
      </blockquote>
      <div><br>
      </div>
      <div>I think you want os.listdir() here?</div>
      <div><br>
      </div>
      <blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px
        #729fcf solid;padding-left:1ex">
        <pre>+    for dt in desttools:</pre>
        <pre>+        if os.path.basename(dt) not in tools:</pre>
        <pre>+            os.unlink(dt)</pre>
        <pre>+</pre>
      </blockquote>
      <div><br>
      </div>
      <div>We didn't do this as it was assumed people very very rarely
        remove anything from HOSTTOOLS and&nbsp;</div>
      <div>if they did, they'd know what else they needed to do. This
        does add yet more housekeeping to every</div>
      <div>build which I try to avoid doing for performance :/.</div>
      <div><br>
      </div>
      <div>Cheers,</div>
      <div><br>
      </div>
      <div>Richard&nbsp;</div>
      <br>
    </blockquote>
    <br>
    Got it. Thanks for the clarification.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote cite="mid:f1e774378de966fd8a8820e28bd547c07e482d07.camel@linuxfoundation.org" type="cite">
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">


</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------0E5BD15F7FE324BD83D25629--
