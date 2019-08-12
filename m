Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id D66157D718
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 18:55:49 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id i18so49949435pgl.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 11:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=LrPA8JS3U7mTi5sr7YTwlJAWpULrj45eDAcQPBB49z4=;
	b=Z+rQ/700bcMP6iOYbsWkfZeOyFn1X2MbJ8K4Fdz+1AjQFRkKWxfmG2IUUHtP/u29xP
	ebXnz8RYgAvEvo2ZjDeosbUYhPg6OC631yiatD6euMXvAWw+6UftALrHbYZkvcDAGXvg
	85b89aCy32dUa08fYeTN0d7Xd5RMm21MvaN3v+ss1smIUkgE1zeDHfjgNm1UHe3tMoRY
	B33+qvsaarDnBpuVqLfWoFbkmJyTk/Ia4fIGl87QWgwOM92U9akVqtuxeTNpb6A2lErq
	h8+T1Pemv8eVGgdUg2qzOz5OUQiXqZTKPf9ujN9Iq1qZ0VO/EJtx0ZyTzY6QxX6wmUrn
	ACng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=LrPA8JS3U7mTi5sr7YTwlJAWpULrj45eDAcQPBB49z4=;
	b=oev+McbeHD/9UyKRVE/1RJ73pi447ZFPExv9frtZ69IJj61se50kY7x2LKTkX3w8bA
	rDEFrSKOtM/WfFcoMAaOPo3iCuZbW56hCM/chXsVyjySbZS5ldQVBzYjBXqqCAIhVtpR
	n/hwC+y7Rx0T4RjIJetLM4m9oET4OTofYTtJVscuzO0clOJ4vA/T4O+wyIg2BjpHVKlp
	HY5hHHQxv/8spF94CklgILvB7cYHTkCYBB5h3CMMV1I3epRKiu9UlXk6sfVu7axkq8O1
	u1LjqPrmG/Fn1KqJXZnzXNYmkktGfokUaNIEQLI3haLJgGGjVn6Dpg8P7tkkjZiPV8/y
	TZlw==
X-Gm-Message-State: APjAAAUKtNaR3ITxtGQHwCZVyEsXelH/43vLgYbyMj/+YSIR2/mGUhBk
	B/F14595VhR7hJ3KW3+KXN6pt07nFcE=
X-Google-Smtp-Source: APXvYqwnWsenp24jK6dukZnnxMnNwLpdzABbgLhXAZOwadzAp8yq5CszZJZ3zPXjb4Pz+jT5DaurnQ==
X-Received: by 2002:a63:724f:: with SMTP id c15mr32036738pgn.257.1565636150199;
	Mon, 12 Aug 2019 11:55:50 -0700 (PDT)
Received: from ?IPv6:2601:646:8500:6bc6:ecf5:55f9:1f07:fceb?
	([2601:646:8500:6bc6:ecf5:55f9:1f07:fceb])
	by smtp.gmail.com with ESMTPSA id z13sm282971pjn.32.2019.08.12.11.55.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 12 Aug 2019 11:55:49 -0700 (PDT)
To: Andre McCurdy <armccurdy@gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
	<2c5a62b8c4afe40ff2c0fbe2263e9c96d40b63d7.1534791421.git.raj.khem@gmail.com>
	<CAJ86T=UNpjZTn4NE1z7QYg5O4LmEihiA=vXF6gKg-8tSPBJ5jA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <07b03e33-f21a-32a2-8c63-6de2db2724ee@gmail.com>
Date: Mon, 12 Aug 2019 11:55:48 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=UNpjZTn4NE1z7QYg5O4LmEihiA=vXF6gKg-8tSPBJ5jA@mail.gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] gdb: Alias rpl_stat to stat() on musl
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
X-List-Received-Date: Mon, 12 Aug 2019 18:55:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/12/19 11:12 AM, Andre McCurdy wrote:
> On Mon, Aug 20, 2018 at 12:00 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Use CPPFLAGS instead of CFLAGS since there is C++ compiler being used for somefiles
>>
>> Fixes
>> gdb/gdbserver/../../../gdb-8.1.1/gdb/gdbserver/../common/common-utils.c:419: undefined reference to `rpl_stat'
>> | collect2: error: ld returned 1 exit status
>> | make[4]: *** [Makefile:414: libinproctrace.so] Error 1
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>   meta/recipes-devtools/gdb/gdb_8.1.1.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb_8.1.1.bb b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
>> index 84ab08ce93..c6eac84dd8 100644
>> --- a/meta/recipes-devtools/gdb/gdb_8.1.1.bb
>> +++ b/meta/recipes-devtools/gdb/gdb_8.1.1.bb
>> @@ -26,4 +26,4 @@ EOF
>>                  chmod +x ${WORKDIR}/python
>>          fi
>>   }
>> -CFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday"
>> +CPPFLAGS_append_libc-musl = " -Drpl_gettimeofday=gettimeofday -Drpl_stat=stat"
> 
> rpl_stat() is a wrapper for stat, so by forcefully redefining rpl_stat
> to stat you create a local stat() function which recurses
> infinitely... which causes obvious runtime problems (e.g. gdbserver
> crashes on startup).
> 
> Simply removing these additional CPPFLAGS fixes the runtime issues for
> me (and doesn't trigger the original build failure so presumably
> something has changed since the patch was originally created...).
> 

I think setting CPPFLAGS is not right way and we can not fully remove it
as well because in this case gnulib does not recognize musl as gnu
system and detection logic is wrong for musl. So what we should do is
remove the above CPPFLAGS settings and instead pass the cached values to
configure

CACHED_CONFIGUREVARS += "gl_cv_func_gettimeofday_clobber=no"

for stat issue it has been fixed [1] so we can just drop it.

[1] 
https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=3c025cfe5efc44eb4dfb03b53dca28e75096dd1e

care to send a patch ?

Thanks
-Khem

