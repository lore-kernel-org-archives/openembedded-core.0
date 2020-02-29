Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2C7F861A51
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 15:13:24 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t14so2426278plr.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 07:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=q8DQ+QcinRi2u6lpFoqwFyGvyMLcMKJ9WLtTqjrxfZU=;
	b=WezfAu/deHvbprxeQERpJs5uUKEwNqPN+nydTrGBiHrACerSuOYQFINZRXcZDe0hkG
	Zn2SJXbRrx3e8IpjcadpGDQHy35IjYeHBN5booECLRbzn8OfXWWhWvusJ1SxWdKk/qat
	nQcQ7mE+G4PR66q3dlFUXoc8Zrq1k2eu49pGRtly5G6FGTCTD+vEMv3qKKcomUpLIGEy
	52XzYl9o2RlEmhVQb34dB4UEJ9aKvIdFzBmfgWSkgjBVnz/6djLpC5tzGmggQdPdeIV3
	FmyEOy+7yKF7LyqVr2STcAXjj1SQ/V/Qa18TQL2oduUkDVeioNu5HxmAWGuysR8ax5NH
	+Jbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=q8DQ+QcinRi2u6lpFoqwFyGvyMLcMKJ9WLtTqjrxfZU=;
	b=a34cO4jrTURvkUeFcfdwzUGc2qa0gF0a5z9UuLKXxhtyfTM7NPIqgi+Y3rwcD1fYgL
	kZhgHmttmb2Cf+18HUwv+Ca6p2L/e7ESSkAVH7wbD9blRrlrFo8IT6ay7ppAIWGi3UZ9
	Ef8t76J7/HLlAZP5rt041WYgwU8IO/mujuOk433AO+Ojd7ifuoHE5Pm2kwhpC5So7mwI
	wWj4tJU0pTKT2mh8nYoHshuiq4QwJwJFiEOI+p1wvb2VbkESeV/VbUKI/i1mpe4T/L39
	BIXi/jF5EoR+4gyFXJdA864tJcfJuW0qL0uaP7nMi8wBnwgXyjscTPBVfeHjuCGFCYOu
	SP3w==
X-Gm-Message-State: APjAAAXFTozfJPcmMdQNX6bikbDGKNHcVQ93TmAI24mjxHEV7mJdqOpp
	q4HdwE8GnquKc2kgpZm+jd26YbL+HLI=
X-Google-Smtp-Source: APXvYqwtLkOxWi+3VHGlUTQ5egWAgjXNeV532mYMO4TDbWzX9DDHseI1bj/ydD7iOZfW6f6pYfGLgw==
X-Received: by 2002:a17:902:a588:: with SMTP id
	az8mr9574570plb.123.1582989205698; 
	Sat, 29 Feb 2020 07:13:25 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:8446:2edf:6d4c:9a00?
	([2601:646:9200:4e0:8446:2edf:6d4c:9a00])
	by smtp.gmail.com with ESMTPSA id
	u12sm14716600pfm.165.2020.02.29.07.13.24
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 29 Feb 2020 07:13:25 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Petr Vorel <petr.vorel@gmail.com>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
	<20200229064656.GA4045619@x230>
	<4db943be8cba440551847721156d22f9664cca0a.camel@linuxfoundation.org>
	<da2bffd2ba22435a66a17044f922ab555d7a3ede.camel@linuxfoundation.org>
	<c70d9ceacc5b7a557179ff9fc1b05100b7aa4065.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <7719eee9-9635-c7dc-2f48-56d574c539ed@gmail.com>
Date: Sat, 29 Feb 2020 07:13:24 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <c70d9ceacc5b7a557179ff9fc1b05100b7aa4065.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 15:13:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/29/20 5:53 AM, Richard Purdie wrote:
> On Sat, 2020-02-29 at 13:42 +0000, Richard Purdie wrote:
>> On Sat, 2020-02-29 at 13:22 +0000, Richard Purdie wrote:
>>> On Sat, 2020-02-29 at 07:46 +0100, Petr Vorel wrote:
>>>> At least we know, that once we solve this problem, we can remove
>>>> 0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch
>>>>
>>>> Please, how to reproduce this build locally? Is it:
>>>> . oe-init-build-env
>>>> TCLIBC=musl bitbake ltp
>>>
>>> Yes, that should be enough.
>>>
>>>> Or do I need to put something into config files conf/local.conf
>>>> or conf/bblayers.conf ?
>>>>
>>>> I need to double check if musl-fts is really built and whether
>>>> the
>>>> order of
>>>> -lfts is correct. But all this has been solved even for static
>>>> build
>>>> for Buildroot,
>>>> so I guess it's some issue related to openembedded.
>>>> Unfortunately,
>>>> I'm not much
>>>> experienced in openembedded (stepped in, because nobody else has
>>>> updated LTP
>>>> package yet).
>>>>
>>>> Khem, any idea, what can be wrong?
>>>
>>> FWIW I'll run a build here and see if I can spot anything but I'm
>>> trying to do other things today!
>>
>> I was able to confirm that fts is in the recipe sysroot and that the
>> compile step is running "make -j 88 LIBC=musl LIBS=-lfts", i.e. its
>> being passed in to ltp. Beyond that I'm a little out my depth to know
>> how/why its not ending up where it should unfortunately. At least the
>> issue does appear to reproduce though...
> 
> Grep suggests LIBS is a configure option, not a makefile one. I tried:
> 
> diff --git a/meta/recipes-extended/ltp/ltp_20200120.bb b/meta/recipes-extended/ltp/ltp_20200120.bb
> index 847f267b0b7..5be9489a756 100644
> --- a/meta/recipes-extended/ltp/ltp_20200120.bb
> +++ b/meta/recipes-extended/ltp/ltp_20200120.bb
> @@ -16,7 +16,8 @@ LIC_FILES_CHKSUM = "\
>   
>   DEPENDS = "attr libaio libcap acl openssl zip-native"
>   DEPENDS_append_libc-musl = " fts "
> -EXTRA_OEMAKE_append_libc-musl = " LIBC=musl LIBS=-lfts "
> +EXTRA_OEMAKE_append_libc-musl = " LIBC=musl "
> +EXTRA_OECONF_append_libc-musl = " LIBS=-lfts "
>   
>   # since ltp contains x86-64 assembler which uses the frame-pointer register,
>   # set -fomit-frame-pointer x86-64 to handle cases where optimisation
> 
> and this does seem to build for musl. Might be worth runtime testing
> that on the autobuilder?

yes thats right fix, I have sent v6 of original patch including above 
fix, please give it a try

> 
> Cheers,
> 
> Richard
> 

