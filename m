Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.49])
 by mx.groups.io with SMTP id smtpd.web09.1294.1603479495490128623
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=DIPx/UGY;
 spf=pass (domain: windriver.com, ip: 40.107.244.49, mailfrom: sakib.sajal@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j41PT1XzwImz7i6C2HuTZU4EzcFRWBJMksU8FRkhXtuiJ/RvOfKxVZCbuv8ImUidViQdFoMNBxPZJHbau+6FJu0H772lgku3vPhn32xST9jUMO9CrMa5GSw/NnWUjF12E/U1C5ULvF9i9ZEyM2SbsZWp0O/4boJgYpzYhB7auieb7e0jqU3YfLoukm5VXPgoIhnz83nQQFdm/Sjy3uNtPQUdA7rkdOlmhxLwjG68g2bU+xfbk+1rQ8BPfeKDl/lWkgH8lXm5bP6+F2W7btk+BPC/fP9OiS6fCDYMTS57YKshS0+lbew7jpmpwyQY5WW4Bk/Z864kWntu+LYAT9flOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMjFZJL5erUj9cZtNtDTjMWljW+NgFlSj3F/MsF1cps=;
 b=SMfGHfu8SiCX9uhGl2iVVBSC/PxYLyqZVoHqt6af9zMbrJet8Vq15bU6bdTOCtlyxMoaohE+nDM1JRIDJGtIZ43bC4Z9n5cjprctN3DBja/W9sAzQL10jddEok2GLjzvtWgfh3sjYwkZDPzN88M6uztTWjQlOu6mSF+yQKPNvWldJBR1CkQi577qayq2v8S+QnUg2lQOG34uoXl3uxAOabZQIVll6zHCAVis2Ujy5l3bDLzD+k5R3yBuwVtEvLmayg5ZSy/LiE8R0oB8cmzOZhdJiOvoH4LNsTGxwxKUAgn2TfNcYRVVb9ESiwpTPPfLVYeLslfVlFuffncNZbYPQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xMjFZJL5erUj9cZtNtDTjMWljW+NgFlSj3F/MsF1cps=;
 b=DIPx/UGYjrwxSwYtiV3UJrZtJpl21BvLfUoMZEYw2wtXhz8/sE2nSP8mBMqElqNgvcVvQYJJndThrzZwEogxCqFBmWv/owmUxU3Q2gIPZxCyhYhqmrixGdPoJYbzZTrKB7f8VXQH54vqJyCs9W/pui3PVIOKTsIqefXznPqKC6k=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from DM6PR11MB2538.namprd11.prod.outlook.com (2603:10b6:5:be::20) by
 DM6PR11MB4218.namprd11.prod.outlook.com (2603:10b6:5:201::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3499.18; Fri, 23 Oct 2020 18:58:12 +0000
Received: from DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a]) by DM6PR11MB2538.namprd11.prod.outlook.com
 ([fe80::e8b7:eec1:e6fb:35a%7]) with mapi id 15.20.3477.028; Fri, 23 Oct 2020
 18:58:12 +0000
Subject: Re: [OE-core] [PATCH 1/1] buildstats.bbclass: add functionality to collect build system stats
To: Christopher Larson <kergoth@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
References: <20201023165648.5515-1-sakib.sajal@windriver.com>
 <20201023165648.5515-2-sakib.sajal@windriver.com>
 <CABcZANnFfhA5T+7Z_BgVsPZb0KDQ4gtmQK5e2BtbQ9wVRfyQVQ@mail.gmail.com>
From: "Sakib Sajal" <sakib.sajal@windriver.com>
Message-ID: <64db6786-3a44-140e-fb62-3e3298c8782f@windriver.com>
Date: Fri, 23 Oct 2020 14:58:09 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CABcZANnFfhA5T+7Z_BgVsPZb0KDQ4gtmQK5e2BtbQ9wVRfyQVQ@mail.gmail.com>
X-Originating-IP: [174.88.220.58]
X-ClientProxiedBy: BYAPR07CA0030.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::43) To DM6PR11MB2538.namprd11.prod.outlook.com
 (2603:10b6:5:be::20)
Return-Path: sakib.sajal@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.48] (174.88.220.58) by BYAPR07CA0030.namprd07.prod.outlook.com (2603:10b6:a02:bc::43) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend Transport; Fri, 23 Oct 2020 18:58:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ec36b274-3511-4a36-22f9-08d877859716
X-MS-TrafficTypeDiagnostic: DM6PR11MB4218:
X-Microsoft-Antispam-PRVS: 
	<DM6PR11MB42182AEF3B9A2BCA559E7B4CF21A0@DM6PR11MB4218.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1388;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LAztnbB6w5woKiwoZRGdtJ12vz6fXr1DOXxnjAFDinqFS0QrvO4P23q0Y6ItxTU0gyNIFJOnqQkdH20ioU4zVwWjF3sqZs4TfcnjZHlN+9j9+qhz/hEaR3oGw6O+gHTOUb8INQPDtjTEiB9igoC+UCPftVksvh9iR+I3h/ATwvMSX0yhZ41GXKg37UvUehqfRcJO8fW522t9XGJIxHVc4e2u7Nfpo2c+OKf00ul0I9nFo/X5RDi14M2CrrDjN9ULPYNH+jt4vu4/kytgr5XTOKx4+gYQ14kNTRCeJjU6hcAMApG6JFBbmj/iBUVfx/n26Is+6CB2mewOTK0bV3XnNYm5eZjH5F3HQbxmGRVxEG+e4Z7cGuu99dw5Rc+D0xTP6kpbnr4IHNzkP/MOzz0x/ZAlyQ2Pqk2vBEj3S6iESLr4Pr0AywSJnMhMeldWTqjS4w1h5CfUh2Kg/U0tJzmgmw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB2538.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(39850400004)(346002)(376002)(136003)(5660300002)(66476007)(66556008)(83380400001)(4001150100001)(31686004)(33964004)(6916009)(478600001)(16526019)(2906002)(31696002)(8676002)(26005)(166002)(8936002)(66946007)(16576012)(53546011)(6486002)(966005)(44832011)(186003)(86362001)(52116002)(4326008)(36756003)(316002)(956004)(2616005)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	syt918HZ4qkr9smOPV3TXa6r8zfH5Rd+3DdAOEry2R7XZj/7uM2gbTsnln8Wy9Krwt/vfIqrLumX8NaeFVro5HEXwxHooKZ77kS9otDBRKBioDkEyUiNGiaTtGHHEPHOIOiaqDz1ZaVfImVdqp/fQJNqXFYUjwSjzWXVYNcuHZykgDwflSM/ZU0Xb2upikttV2slbLxoZOfo+vdnyw/cHes+JpQEprN7bG+DSqE6mkY5BEgIFF90PXaBMCEvUQJEb6e7GP1Ljr+x85UQydDe2+MmOWymXGiLBiNODR7j2BCf6KkpspHm3vWeay7w+UNXR7jW3wBlA4ErBO4WopSvmpgyJxL5xjj6QsvtzXFF12wltS9c0CA2cGLwe+Q8pkyaUngwcdYYtQTYjo2DOg0E/xEbswKpd9xDaUxhjMdNaLqw15vux06u7Ej07qmO7wu8AJrsYQCeLTCEDABBADc0ymeWVUriIRGPB1SCJUBqfQdiU9NOX74Y7X4rA+NgjyThdTQslda7X9xkj1QkQfdnP4b07Qz+Izx4ySL7cqkenAl7htNUgLl1oYryJFDvfuZ3vl3vJUlEo8E1QzvQyG+Kp4aHbrT/pwfyQ1Pziy1H6sGs1MMnwMIA/4U7L+FnRZz5UpuPoO7Pr+8tXncvGdcAkQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec36b274-3511-4a36-22f9-08d877859716
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2538.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2020 18:58:12.4429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2tJKC578xjWk7LmDJ1agpS32kEhNGIA1VpqAJ8YTgYIN7sklrak3aO/+yvCKDQ/HynOtZa76iQ5lQhqj07Urg/q9VgdQCAXZAJjiSOYVmY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4218
Content-Type: multipart/alternative;
 boundary="------------EA859A2A8B43CEE9BCF63328"
Content-Language: en-US

--------------EA859A2A8B43CEE9BCF63328
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2020-10-23 1:25 p.m., Christopher Larson wrote:
> Testing for isfile() and +x will mean you can't run commands via the PATH
> via that commands variable, only full absolute paths. is that really the
> intention? It's inconsistent with every other such variable, and also means
> you can't define bitbake functions to be run instead.

Hi Christopher,

That is the intended usage. We need to break out of the 
recipe-specific-sysroot and the tools run would not typically be built 
as -native, I expect. See:

https://lists.openembedded.org/g/openembedded-core/message/143717

This is still work in progress and any kind of feedback/suggestion is 
welcome!

Sakib

>
> On Fri, Oct 23, 2020 at 9:57 AM Sakib Sajal <sakib.sajal@windriver.com>
> wrote:
>
>> There are a number of timeout and hang defects where
>> it would be useful to collect statistics about what
>> is running on a build host when that condition occurs.
>>
>> This adds functionality to collect build system stats
>> on a regular interval and/or on task failure. Both
>> features are disabled by default.
>>
>> To enable logging on a regular interval, set:
>> BB_HEARTBEAT_EVENT = "<interval>"
>> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/host_stats
>>
>> To enable logging on a task failure, set:
>> BB_LOG_HOST_STAT_ON_FAILURE = "1"
>> Logs are stored in ${BUILDSTATS_BASE}/<build_name>/build_stats
>>
>> The list of commands, along with the desired options, need
>> to be specified in the BB_LOG_HOST_STAT_CMDS variable
>> delimited by ; as such:
>> BB_LOG_HOST_STAT_CMDS = "/<absolute>/<path>/<executable> <options> ; ... ;"
>>
>> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>> ---
>>   meta/classes/buildstats.bbclass | 32 +++++++++++++++++++++++++++++---
>>   1 file changed, 29 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/buildstats.bbclass
>> b/meta/classes/buildstats.bbclass
>> index 6f87187233..c68d7bb8a2 100644
>> --- a/meta/classes/buildstats.bbclass
>> +++ b/meta/classes/buildstats.bbclass
>> @@ -104,14 +104,38 @@ def write_task_data(status, logfile, e, d):
>>               f.write("Status: FAILED \n")
>>           f.write("Ended: %0.2f \n" % e.time)
>>
>> +def write_host_data(logfile, e, d):
>> +    import subprocess, os, datetime
>> +    cmds = d.getVar('BB_LOG_HOST_STAT_CMDS').split(";")
>> +    with open(logfile, "a") as f:
>> +        f.write("Event Time: %f\nDate: %s\n" % (e.time,
>> datetime.datetime.now()))
>> +        for cmd in cmds:
>> +            if len(cmd) == 0:
>> +                continue
>> +            c = cmd.split()
>> +            if os.path.isfile(c[0]) and os.access(c[0], os.X_OK):
>> +                try:
>> +                    output = subprocess.check_output(c,
>> stderr=subprocess.STDOUT).decode('utf-8')
>> +                except subprocess.CalledProcessError as err:
>> +                    output = "Error running command: %s\n%s" % (cmd, err)
>> +                f.write("%s\n%s\n" % (cmd, output))
>> +            else:
>> +                f.write("Error running command: '%s': %s is not an
>> executable.\n" % (cmd, c[0]))
>> +
>>   python run_buildstats () {
>>       import bb.build
>>       import bb.event
>>       import time, subprocess, platform
>>
>>       bn = d.getVar('BUILDNAME')
>> -    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
>> -    taskdir = os.path.join(bsdir, d.getVar('PF'))
>> +    # bitbake fires HeartbeatEvent even before a build has been
>> +    # triggered, causing BUILDNAME to be None
>> +    if bn is not None:
>> +        bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
>> +        taskdir = os.path.join(bsdir, d.getVar('PF'))
>> +        if isinstance(e, bb.event.HeartbeatEvent):
>> +            bb.utils.mkdirhier(bsdir)
>> +            write_host_data(os.path.join(bsdir, "host_stats"), e, d)
>>
>>       if isinstance(e, bb.event.BuildStarted):
>>
>>   ########################################################################
>> @@ -186,10 +210,12 @@ python run_buildstats () {
>>           build_status = os.path.join(bsdir, "build_stats")
>>           with open(build_status, "a") as f:
>>               f.write(d.expand("Failed at: ${PF} at task: %s \n" % e.task))
>> +            if
>> bb.utils.to_boolean(d.getVar("BB_LOG_HOST_STAT_ON_FAILURE")):
>> +                write_host_data(build_status, e, d)
>>   }
>>
>>   addhandler run_buildstats
>> -run_buildstats[eventmask] = "bb.event.BuildStarted
>> bb.event.BuildCompleted bb.build.TaskStarted bb.build.TaskSucceeded
>> bb.build.TaskFailed"
>> +run_buildstats[eventmask] = "bb.event.BuildStarted
>> bb.event.BuildCompleted bb.event.HeartbeatEvent bb.build.TaskStarted
>> bb.build.TaskSucceeded bb.build.TaskFailed"
>>
>>   python runqueue_stats () {
>>       import buildstats
>> --
>> 2.27.0
>>
>>
>> 
>>
>>

--------------EA859A2A8B43CEE9BCF63328
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>
</p>
    <div class="moz-cite-prefix">On 2020-10-23 1:25 p.m., Christopher
      Larson wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:CABcZANnFfhA5T+7Z_BgVsPZb0KDQ4gtmQK5e2BtbQ9wVRfyQVQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">Testing for isfile() and +x will mean you can't run commands via the PATH
via that commands variable, only full absolute paths. is that really the
intention? It's inconsistent with every other such variable, and also means
you can't define bitbake functions to be run instead.</pre>
    </blockquote>
    <p>Hi Christopher,</p>
    <p style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">That is the intended usage. We need to break out of the recipe-specific-sysroot and the tools run would not typically be built as -native, I expect. See:</p>
    <p><style type="text/css">
p, li { white-space: pre-wrap</style></p>
    <p><a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/143717">https://lists.openembedded.org/g/openembedded-core/message/143717</a></p>
    <p>This is still work in progress and any kind of feedback/suggestion is welcome!</p>
    <p>Sakib
</p>
    <blockquote type="cite" cite="mid:CABcZANnFfhA5T+7Z_BgVsPZb0KDQ4gtmQK5e2BtbQ9wVRfyQVQ@mail.gmail.com">
      <pre class="moz-quote-pre" wrap="">

On Fri, Oct 23, 2020 at 9:57 AM Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
wrote:

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">There are a number of timeout and hang defects where
it would be useful to collect statistics about what
is running on a build host when that condition occurs.

This adds functionality to collect build system stats
on a regular interval and/or on task failure. Both
features are disabled by default.

To enable logging on a regular interval, set:
BB_HEARTBEAT_EVENT = &quot;&lt;interval&gt;&quot;
Logs are stored in ${BUILDSTATS_BASE}/&lt;build_name&gt;/host_stats

To enable logging on a task failure, set:
BB_LOG_HOST_STAT_ON_FAILURE = &quot;1&quot;
Logs are stored in ${BUILDSTATS_BASE}/&lt;build_name&gt;/build_stats

The list of commands, along with the desired options, need
to be specified in the BB_LOG_HOST_STAT_CMDS variable
delimited by ; as such:
BB_LOG_HOST_STAT_CMDS = &quot;/&lt;absolute&gt;/&lt;path&gt;/&lt;executable&gt; &lt;options&gt; ; ... ;&quot;

Signed-off-by: Sakib Sajal <a class="moz-txt-link-rfc2396E" href="mailto:sakib.sajal@windriver.com">&lt;sakib.sajal@windriver.com&gt;</a>
---
 meta/classes/buildstats.bbclass | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/meta/classes/buildstats.bbclass
b/meta/classes/buildstats.bbclass
index 6f87187233..c68d7bb8a2 100644
--- a/meta/classes/buildstats.bbclass
+++ b/meta/classes/buildstats.bbclass
@@ -104,14 +104,38 @@ def write_task_data(status, logfile, e, d):
             f.write(&quot;Status: FAILED \n&quot;)
         f.write(&quot;Ended: %0.2f \n&quot; % e.time)

+def write_host_data(logfile, e, d):
+    import subprocess, os, datetime
+    cmds = d.getVar('BB_LOG_HOST_STAT_CMDS').split(&quot;;&quot;)
+    with open(logfile, &quot;a&quot;) as f:
+        f.write(&quot;Event Time: %f\nDate: %s\n&quot; % (e.time,
datetime.datetime.now()))
+        for cmd in cmds:
+            if len(cmd) == 0:
+                continue
+            c = cmd.split()
+            if os.path.isfile(c[0]) and os.access(c[0], os.X_OK):
+                try:
+                    output = subprocess.check_output(c,
stderr=subprocess.STDOUT).decode('utf-8')
+                except subprocess.CalledProcessError as err:
+                    output = &quot;Error running command: %s\n%s&quot; % (cmd, err)
+                f.write(&quot;%s\n%s\n&quot; % (cmd, output))
+            else:
+                f.write(&quot;Error running command: '%s': %s is not an
executable.\n&quot; % (cmd, c[0]))
+
 python run_buildstats () {
     import bb.build
     import bb.event
     import time, subprocess, platform

     bn = d.getVar('BUILDNAME')
-    bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
-    taskdir = os.path.join(bsdir, d.getVar('PF'))
+    # bitbake fires HeartbeatEvent even before a build has been
+    # triggered, causing BUILDNAME to be None
+    if bn is not None:
+        bsdir = os.path.join(d.getVar('BUILDSTATS_BASE'), bn)
+        taskdir = os.path.join(bsdir, d.getVar('PF'))
+        if isinstance(e, bb.event.HeartbeatEvent):
+            bb.utils.mkdirhier(bsdir)
+            write_host_data(os.path.join(bsdir, &quot;host_stats&quot;), e, d)

     if isinstance(e, bb.event.BuildStarted):

 ########################################################################
@@ -186,10 +210,12 @@ python run_buildstats () {
         build_status = os.path.join(bsdir, &quot;build_stats&quot;)
         with open(build_status, &quot;a&quot;) as f:
             f.write(d.expand(&quot;Failed at: ${PF} at task: %s \n&quot; % e.task))
+            if
bb.utils.to_boolean(d.getVar(&quot;BB_LOG_HOST_STAT_ON_FAILURE&quot;)):
+                write_host_data(build_status, e, d)
 }

 addhandler run_buildstats
-run_buildstats[eventmask] = &quot;bb.event.BuildStarted
bb.event.BuildCompleted bb.build.TaskStarted bb.build.TaskSucceeded
bb.build.TaskFailed&quot;
+run_buildstats[eventmask] = &quot;bb.event.BuildStarted
bb.event.BuildCompleted bb.event.HeartbeatEvent bb.build.TaskStarted
bb.build.TaskSucceeded bb.build.TaskFailed&quot;

 python runqueue_stats () {
     import buildstats
--
2.27.0





</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------EA859A2A8B43CEE9BCF63328--
