Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7721B788B6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 14:20:22 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 68so4768628pfx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 07:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=dSlzP/F6ELAAGNqSsCZDoc6i8tr7+Qpc7yej+s914f4=;
	b=oWWEkcVg11C2sKxdVSLraUbrWzfTx5qWjNplQzWFxBzuQBKu7NHmS8M2KN31GsUGOV
	oYwxYso1ZGOoSBNV3WliocgbQBPAa3GhSJT59j3IYWlY8QhkaC79ID0I7BPTgOCYeuWq
	rokKWmqS/baZUSFKFnFu8PEaZA5oXjzkF26hyecHzSPBY5k4GJfUQdZuUtNzp8pt3/dA
	sJvj05qxV0P54T2ZhT7UZ317AO8qFu4YKRcN+wpsvpmB6SVh+pDh+O1TWhc7GW5WZ03w
	NuAF+l9jtDCIkQe/oNc5U1/ea7oIWqPNcIyOUV+SO9LjHRX1dbc4XLOyKdEhhMvubbqr
	6+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=dSlzP/F6ELAAGNqSsCZDoc6i8tr7+Qpc7yej+s914f4=;
	b=ePj5r0GcXPzIuKS8+/4/OcIxgnwjqBeGHw8RbRMnMC8JZ38yaou1yiJt/vB2tumlPu
	SjPsBoCzfiasO9RqD9lvRIPZIT2owuiCgdALfrJMZLGWbBD5R/P5wSPgCafMktpC/Ckg
	Ow7YDsGdZ/AOfALeNPd2dkHHlhW90UNyfh1mD+7RCNrdhmgPfm0s/SqbFl6UAm8P/E4V
	37jwCAi1vGDQ7jboEeWoCxBqtn7aTnz2ppVtxrKE87sr8qb2PaLn2VnqiddFdYxvJc/6
	Sw5apzDfSL85SbeC6yZrCttPb0UmL7ZzYh30K5pwftqc+wYMSnFl6m/LtypPJbxLJ740
	b+/Q==
X-Gm-Message-State: AElRT7E3Z8FQLII7ooL6IS1QX4rLfZ1oFXXpkShMAGAWQhiFKcIeqbkh
	igzyYc1UWhanl9AlJrZUmwfS3A==
X-Google-Smtp-Source: AG47ELt/n1xfUYr3HS09ZJIVsLf8fFcLgvRlIdmXXF70+Gf+k8sMl0j8+4X1JdgQMu1ocVvQT/cBhg==
X-Received: by 10.99.107.9 with SMTP id g9mr21025774pgc.3.1521814823269;
	Fri, 23 Mar 2018 07:20:23 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:d51a:28df:7b7:12f5?
	([2601:202:4000:1184:d51a:28df:7b7:12f5])
	by smtp.gmail.com with ESMTPSA id
	t28sm19277837pfk.138.2018.03.23.07.20.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 07:20:22 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sreT7Pm9k7C74S7JggUOA7i52YefxoGGKyq5HhOkspaew@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <bcd2bae7-cbfb-8fbf-8a24-458d2c10d6fc@gmail.com>
Date: Fri, 23 Mar 2018 07:20:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sreT7Pm9k7C74S7JggUOA7i52YefxoGGKyq5HhOkspaew@mail.gmail.com>
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
X-List-Received-Date: Fri, 23 Mar 2018 14:20:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 03/22/2018 10:25 PM, Khem Raj wrote:
> On Thu, Mar 22, 2018 at 10:04 PM, Armin Kuster <akuster808@gmail.com> wrote:
>> From: Armin Kuster <akuster@mvista.com>
>>
>> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure: Unable to find revision d8b18df3e9dcbe4f092bed565835d3975e99432c in branch 3.2 even from upstream
>> ERROR: distcc-3.2-r0 do_fetch: Fetcher failure for URL: 'git://github.com/distcc/distcc.git;branch=3.2'. Unable to fetch URL from any source.
>> ERROR: distcc-3.2-r0 do_fetch: Function failed: base_do_fetch
>>
>> [v2]
>> upstream deleted the branch and the hash no longer exists.
>>
>> Took the git snapshot from yocto and created a copy on my github.
>> There was no offical 3.2 release, only rc versions.
>>
>
> I think V1 was ok. Is there any difference in the 3.2-maint branch that
> we may not be able to use it on rocko


diffstat:

INSTALL                                                       |    6
 Makefile.in                                                   |   71
 README.md                                                     |   62
 configure.ac                                                  |  128
 doc/web/man/distcc_1.html                                     |   19
 doc/web/man/index.html                                        |    1
 doc/web/man/lsdistcc_1.html                                   |  225
 include_server/basics.py                                      |   29
 include_server/basics_test.py                                 |   28
 include_server/c_extensions/distcc_pump_c_extensions_module.c |  132
 include_server/c_extensions_test.py                           |   32
 include_server/cache_basics.py                                |   27
 include_server/compiler_defaults.py                           |   12
 include_server/compress_files.py                              |   24
 include_server/include_analyzer.py                            |   29
 include_server/include_analyzer_memoizing_node.py             |   48
 include_server/include_analyzer_memoizing_node_test.py        |   30
 include_server/include_analyzer_test.py                       |   40
 include_server/include_server.py                              |  134
 include_server/include_server_test.py                         |   28
 include_server/macro_eval.py                                  |   27
 include_server/macro_eval_test.py                             |   14
 include_server/mirror_path.py                                 |    2
 include_server/mirror_path_test.py                            |    6
 include_server/parse_command.py                               |   40
 include_server/parse_command_test.py                          |   16
 include_server/parse_file.py                                  |   30
 include_server/parse_file_test.py                             |   20
 include_server/run.py                                         |   17
 include_server/setup.py                                       |    8
 include_server/statistics.py                                  |   76
 lzo/README.LZO                                                |  123
 lzo/lzoconf.h                                                 |  517
 lzo/lzodefs.h                                                 | 2998 ----
 lzo/minilzo.c                                                 | 7016
++--------
 lzo/minilzo.h                                                 |   28
 man/distcc.1                                                  |   14
 man/include_server.1                                          |    7
 man/lsdistcc.1                                                |  159
 packaging/RedHat/conf/clients.allow                           |    4
 packaging/RedHat/rpm.spec                                     |    1
 pump.in                                                       |   19
 src/arg.c                                                     |    3
 src/backoff.c                                                 |   27
 src/clirpc.c                                                  |   11
 src/compile.c                                                 |   27
 src/distcc.c                                                  |   15
 src/distcc.h                                                  |    5
 src/dotd.c                                                    |    3
 src/hosts.c                                                   |    4
 src/include_server_if.c                                       |    8
 src/io.c                                                      |    2
 src/lsdistcc.c                                                |    4
 src/remote.c                                                  |    2
 src/rpc.c                                                     |   11
 src/rpc.h                                                     |    5
 src/sendfile.c                                                |    2
 src/serve.c                                                   |    2
 src/snprintf.h                                                |    1
 src/stats.c                                                   |    1
 src/stringmap.c                                               |    4
 src/timeval.c                                                 |    7
 src/timeval.h                                                 |    7
 src/where.c                                                   |   15
 src/zeroconf.c                                                |   18
 src/zeroconf.h                                                |    2
 test/comfychair.py                                            |   84
 test/onetest.py                                               |    2
 test/testdistcc.py                                            |  168

>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  meta/recipes-devtools/distcc/distcc_3.2.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
>> index b6da65a..e6f159c 100644
>> --- a/meta/recipes-devtools/distcc/distcc_3.2.bb
>> +++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
>> @@ -14,7 +14,7 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
>>
>>  RRECOMMENDS_${PN} = "avahi-daemon"
>>
>> -SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
>> +SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
>>             file://separatebuilddir.patch \
>>             file://0001-zeroconf-Include-fcntl.h.patch \
>>             file://default \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


