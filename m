Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f43.google.com (mail-pl0-f43.google.com
	[209.85.160.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7DDA7788D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 14:17:39 +0000 (UTC)
Received: by mail-pl0-f43.google.com with SMTP id f5-v6so7493006plj.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 07:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=bKT8dyS6ASnlzTVq17CJooM2q2NwzcE5aPVT8wNijDI=;
	b=aJWwQ7w3YDWRlmouBijzoPZDkJTLKn172kWRvr/J1cZ157MBAIw8K7y0IWzpvbT4zT
	mOeLz+U4vHiAmDgnNQ9l5YVsXZCi03aq6vcOj2aWLU3d7boIL1IQEZMUp8jE5Dvj+cCf
	c6izVLcIo0Vz53PCHfvHZeXuxc+8FmTdbUJYQBW/XZqiFepQl6IAPdv69gH2jygixO7W
	Ll6zP7AX5+OG7V+KvJHmW39vB7xh8swk/Qo4WlFfletleBDb+ZXNlXMxoOrNBm+T1sfT
	tG9V3P/AD7MIZpl/qYmP0fSEetQtqW46INgPyLMxHKSWdKwNBXLOlPDG8MBBFnUCnXcR
	3kLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=bKT8dyS6ASnlzTVq17CJooM2q2NwzcE5aPVT8wNijDI=;
	b=aVnDXztOqp6GOrLX4SKclJez8B2qgUMq6ZDfKn6jFy1bevf1CIKVvETDqc0jqnphVu
	NcHKb0X4TDpcf6uxtgWe6s6rvoPL6c0YEoLu4l85WJVcnLcE82nDOiGQkSLVklmM1dtX
	e5GlAEoGn7OHBqSmyRw+fQ2VKwmk/WtYR6ExByInyX5BBhUnfadH4FnBfrMh5rzfeFvZ
	c3Ealj7aVSuhbt+qdOlJzmQ8qQT5TELvsKO5npfP6c5sBohuG/7eTzOyCEeH/XnHT3Zb
	bSCbs7i5d+66sr9bFewRLziJSU9CY9ycp8oUngyCaN8T4CNYvDsAaza4vfBazcLXsmjl
	wG5A==
X-Gm-Message-State: AElRT7FV39qGkbwYJ2rvDDRdZfG0VYZlKUlS/GenbmUOUenLHNmmkSrp
	Qka/5Tb62+tj1aqHCNTt4gz+RQ==
X-Google-Smtp-Source: AG47ELub4l6HF4dif79r0ZyrKUgtwLmQ1n/UGsZ0k13MhKA7mNuN/RSHVoEuuw4KThrgDSAYkcV1PA==
X-Received: by 2002:a17:902:8bc1:: with SMTP id
	r1-v6mr19860520plo.310.1521814661383; 
	Fri, 23 Mar 2018 07:17:41 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:d51a:28df:7b7:12f5?
	([2601:202:4000:1184:d51a:28df:7b7:12f5])
	by smtp.gmail.com with ESMTPSA id
	g8sm17870569pfc.106.2018.03.23.07.17.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 23 Mar 2018 07:17:40 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>
References: <1521781486-20919-1-git-send-email-akuster808@gmail.com>
	<CAMKF1sreT7Pm9k7C74S7JggUOA7i52YefxoGGKyq5HhOkspaew@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Message-ID: <9d780e9e-0b34-185e-3612-a8cc060a7601@gmail.com>
Date: Fri, 23 Mar 2018 07:17:39 -0700
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
X-List-Received-Date: Fri, 23 Mar 2018 14:17:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
> I think V1 was ok. 
It did not compile.

> Is there any difference in the 3.2-maint branch that
> we may not be able to use it on rocko

Yes, the snaphot YP sources contained and 3.2-maint are not the same.

- armin
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


