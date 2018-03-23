Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 052627889F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 14:31:49 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id w3-v6so2820455itc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 07:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Z8Jy5A0dmsj7icjyzihsjAMcEO2unWmpZkHnWgEG5ZY=;
	b=T9rrBQF+UILiDSWIttgktIS74+Oc/1dKrh4Vk1pikjMzC8wiBrTD0MexhZpUexQ02o
	FyuqvqXp8SbcyLjYyOAeSmDrOQSh5lgG2e0p2Hc6HYeU8BsBu0ybWWL5x4ki3RfxPRjb
	swaz3pmnnl75OUjDRdlO38kpDLZn/LpFQykzsSoORHruHt5m7JQczH4WMCWLkjVbkN3a
	xfkZSEEHlpT8GssD9bn4FBF3t9vVw0pPoSYNdPlKLEDPOZnfhb/Q/Ejb1pv+H5wAddDd
	dgHPdjGn+tO3CZCxcYv58ocYR9E98NBzKI2IyDpEiqOZgGXR03Zd2NAK7Txpxl88m4Q3
	u1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Z8Jy5A0dmsj7icjyzihsjAMcEO2unWmpZkHnWgEG5ZY=;
	b=KO7l5fB461uwCEZnynGmdjFeTf3+caLCZZWl9Urwya9TGQOT7S6c4bN/Q/TP7oCoX7
	TW0VB0+WwcDp9MPRlQNlcrG5/WHvQB+L7R/ADwvI+zMON2zQoMIHgmGpVXB41H4qDW3A
	Bk9oeIqi/BP0p66VfRQaXBMDMvQQmng393f2Mx+za/2pDoH0QJl+WW/4C6C+TCZA+nX4
	4QyhsTFQgMEgUy2mTnuvbOdbFhSdOUqOnTKuWBu8LGTpmAheOSHqDsmYzcgN7RmCzIig
	kbuGoM3D2HQqg92cvBnS9pMLjUtw8sFpfxfLt3bPLsH2gQRsrLfo/3d9K3Mq7ULUbT0U
	IfVg==
X-Gm-Message-State: AElRT7FoTKLFYz6XoQ78RQOJEGV5EjEauw9Che6x+G+2ZygibX6Vdp2K
	bPiFvgp+kr0cAhqt+PAfauIvc62pTuDzpvlxRvHvyw==
X-Google-Smtp-Source: AIpwx4/njxZeJVhMbFUBL6+pzc9lc/rf64fMtZCOX2TmtOVwHJ/5wMz9CzR5RgH3cnHxzP8qzvXzspEmfERB1Ftd88U=
X-Received: by 2002:a24:1f15:: with SMTP id
	d21-v6mr5834472itd.45.1521815510926; 
	Fri, 23 Mar 2018 07:31:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Fri, 23 Mar 2018 07:31:30 -0700 (PDT)
In-Reply-To: <bcd2bae7-cbfb-8fbf-8a24-458d2c10d6fc@gmail.com>
References: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sreT7Pm9k7C74S7JggUOA7i52YefxoGGKyq5HhOkspaew@mail.gmail.com>
	<bcd2bae7-cbfb-8fbf-8a24-458d2c10d6fc@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Mar 2018 14:31:30 +0000
Message-ID: <CAJTo0Laa5a=KcaurORaN=nYXO8T5LZWJUAQpt=o9Z-doP9o=ng@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: akuster <akuster@mvista.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][v2][PATCH] distcc: Change SRC_URI
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Mar 2018 14:31:50 -0000
Content-Type: text/plain; charset="UTF-8"

So many questions.

What did we ship?  Why doesn't it exist upstream anymore?

Shipping a fork in a personal repo sounds like a good solution for the
stable branches following the principle of least surprise: they're
shipping what they always did.  For master/2.5 though, I'm not happy
about it (but will pull this in for now to get it building again).

Ross

On 23 March 2018 at 14:20, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 03/22/2018 10:25 PM, Khem Raj wrote:
>> On Thu, Mar 22, 2018 at 10:04 PM, Armin Kuster <akuster808@gmail.com> wrote:
>>> From: Armin Kuster <akuster@mvista.com>
>>>
>>> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision d8b18df3e9dcbe4f092bed565835d3975e99432c in branch 3.2 even from upstream
>>> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: 'git://github.com/distcc/distcc.git;branch=3.2'. Unable to fetch URL from any source.
>>> ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch
>>>
>>> [v2]
>>> upstream deleted the branch and the hash no longer exists.
>>>
>>> Took the git snapshot from yocto and created a copy on my github.
>>> There was no offical 3.2 release, only rc versions.
>>>
>>
>> I think V1 was ok. Is there any difference in the 3.2-maint branch that
>> we may not be able to use it on rocko
>
>
> diffstat:
>
> INSTALL                                                       |    6
>  Makefile.in                                                   |   71
>  README.md                                                     |   62
>  configure.ac                                                  |  128
>  doc/web/man/distcc_1.html                                     |   19
>  doc/web/man/index.html                                        |    1
>  doc/web/man/lsdistcc_1.html                                   |  225
>  include_server/basics.py                                      |   29
>  include_server/basics_test.py                                 |   28
>  include_server/c_extensions/distcc_pump_c_extensions_module.c |  132
>  include_server/c_extensions_test.py                           |   32
>  include_server/cache_basics.py                                |   27
>  include_server/compiler_defaults.py                           |   12
>  include_server/compress_files.py                              |   24
>  include_server/include_analyzer.py                            |   29
>  include_server/include_analyzer_memoizing_node.py             |   48
>  include_server/include_analyzer_memoizing_node_test.py        |   30
>  include_server/include_analyzer_test.py                       |   40
>  include_server/include_server.py                              |  134
>  include_server/include_server_test.py                         |   28
>  include_server/macro_eval.py                                  |   27
>  include_server/macro_eval_test.py                             |   14
>  include_server/mirror_path.py                                 |    2
>  include_server/mirror_path_test.py                            |    6
>  include_server/parse_command.py                               |   40
>  include_server/parse_command_test.py                          |   16
>  include_server/parse_file.py                                  |   30
>  include_server/parse_file_test.py                             |   20
>  include_server/run.py                                         |   17
>  include_server/setup.py                                       |    8
>  include_server/statistics.py                                  |   76
>  lzo/README.LZO                                                |  123
>  lzo/lzoconf.h                                                 |  517
>  lzo/lzodefs.h                                                 | 2998 ----
>  lzo/minilzo.c                                                 | 7016
> ++--------
>  lzo/minilzo.h                                                 |   28
>  man/distcc.1                                                  |   14
>  man/include_server.1                                          |    7
>  man/lsdistcc.1                                                |  159
>  packaging/RedHat/conf/clients.allow                           |    4
>  packaging/RedHat/rpm.spec                                     |    1
>  pump.in                                                       |   19
>  src/arg.c                                                     |    3
>  src/backoff.c                                                 |   27
>  src/clirpc.c                                                  |   11
>  src/compile.c                                                 |   27
>  src/distcc.c                                                  |   15
>  src/distcc.h                                                  |    5
>  src/dotd.c                                                    |    3
>  src/hosts.c                                                   |    4
>  src/include_server_if.c                                       |    8
>  src/io.c                                                      |    2
>  src/lsdistcc.c                                                |    4
>  src/remote.c                                                  |    2
>  src/rpc.c                                                     |   11
>  src/rpc.h                                                     |    5
>  src/sendfile.c                                                |    2
>  src/serve.c                                                   |    2
>  src/snprintf.h                                                |    1
>  src/stats.c                                                   |    1
>  src/stringmap.c                                               |    4
>  src/timeval.c                                                 |    7
>  src/timeval.h                                                 |    7
>  src/where.c                                                   |   15
>  src/zeroconf.c                                                |   18
>  src/zeroconf.h                                                |    2
>  test/comfychair.py                                            |   84
>  test/onetest.py                                               |    2
>  test/testdistcc.py                                            |  168
>
>>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>>> ---
>>>  meta/recipes-devtools/distcc/distcc_3.2.bb | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
>>> index b6da65a..e6f159c 100644
>>> --- a/meta/recipes-devtools/distcc/distcc_3.2.bb
>>> +++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
>>> @@ -14,7 +14,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
>>>
>>>  RRECOMMENDS_${PN} = "avahi-daemon"
>>>
>>> -SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
>>> +SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
>>>             file://separatebuilddir.patch \
>>>             file://0001-zeroconf-Include-fcntl.h.patch \
>>>             file://default \
>>> --
>>> 2.7.4
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

