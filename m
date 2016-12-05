Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 47BBD719BD
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 16:44:18 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 50so32644526uae.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 08:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QUkO5az62CxLPMdRRBpiC68HL8DMVMyMbLrri2zABmA=;
	b=xL1XxF6ZjrsshgAjxJYFzVcois4HAP2UZM8qxP4WENeXRwN/HknL1J1c+Y9qjri55L
	XJrijQ6lfoUn3STbprbofxAYhDbbdwXvzdhtbmW5lgEK0Pqj5/PJUUkheB7Npb6bl0Nk
	XKfwglifWCBMxngGSEy9AhccXHTAb1DLwmpCG30+A7n2cfkOj9qYcuYSfmCY5Lr6B2Xi
	WqXm5BS8hj9Q4zp2Z/eny0ENTyoeb+Cnw54L6bm+N9orzalZK90FCNLbpWcgop34YEIH
	N0b8xT76mFOzuxo3Qvsf12+rhgihXrXsdqLmdH8ceuT9/jdoi7qApHz7iqY8zvjMEJQy
	UTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QUkO5az62CxLPMdRRBpiC68HL8DMVMyMbLrri2zABmA=;
	b=mdvCln2eh7fuWQFJHFCOrYXWT7HI3RCK5knciuH6G2GtI/ECxWKlaRVg0kp/G6TGb2
	UJuqHqcVGyr+1VD1iJ3yPJEFuHYXnHFDaK9PjopnRrKZurna4LmbgG/Vj/gRoM40g0Dk
	sAZZ3UUUSRIxSKBBK7wew/adAO0y+PGxRAzGMyJxTi8KJLbIck4sBP8GMqbVgbyB0WqJ
	7f9T5vmGhWubtdnz2Ag3P3rtv6tjZigpr1fyZrhbqI6/ZNU07hW5M/q7n5eAEh5DtGje
	8g7fXt0HYCkQ6m+4ckkHGihMRX3UwVE37H8VmXn8bNFkE+oqndmwxn5UUkidjkn/KXb/
	7g/w==
X-Gm-Message-State: AKaTC03qxmdp8TlvvUUEbky26xBPPBPqc9ENtao7wXRt93bXB8J498gLdaewQJzo5ZgbChnnCUsV1PJmBm9PSA==
X-Received: by 10.176.82.181 with SMTP id v50mr37548941uav.31.1480956260082;
	Mon, 05 Dec 2016 08:44:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 08:43:49 -0800 (PST)
In-Reply-To: <b645b26d-a60f-f42e-8545-13d3b36b0596@embed.me.uk>
References: <68b7f401-a888-ff73-45d5-b0df76f170c4@embed.me.uk>
	<CAMKF1sqVdGwXPX-hg2NCgY-VxL_1bBVQL3vpzC00033ah1N7WQ@mail.gmail.com>
	<f8d7dc4e-2788-f061-447c-67916f215aab@embed.me.uk>
	<b645b26d-a60f-f42e-8545-13d3b36b0596@embed.me.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2016 08:43:49 -0800
Message-ID: <CAMKF1sqWBAAdT7v7vky3-wEfxXZ-aDNe-JH_jzKgkB6_E8Da7g@mail.gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: non-standard library locations and rpath
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
X-List-Received-Date: Mon, 05 Dec 2016 16:44:19 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 5, 2016 at 2:54 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>
>
> On 05/12/16 10:44, Jack Mitchell wrote:
>>
>> On 02/12/16 07:08, Khem Raj wrote:
>>>
>>> On Thu, Dec 1, 2016 at 8:18 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>>>>
>>>> I'm having some troubles with shared library, shared library
>>>> dependencies
>>>> and rpaths. I have libfoo, which depends on libbar when I try to link
>>>> libfoo
>>>> with my app, it requires libbar to be found. libbar is in a non-standard
>>>> location, /usr/local/bar when I compiled libfoo, I used -Wl,rpath-link
>>>> ${STAGING_SYSROOT}/usr/local/bar and -Wl,rpath /usr/local/bar. Now
>>>> when I
>>>> come to try link my app with libfoo, it fails to link as it can't find
>>>> libbar, which I assume means the rpath in libfoo isn't being properly
>>>> prepending with sysroot what is the proper way to support this in OE? My
>>>> library has the following rpath information:
>>>>
>>>> 0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]
>>>>
>>>> So why isn't the rpath being prepended with the sysroot when I
>>>> compile my
>>>> app and link libfoo? The apps build system is using cmake, but this
>>>> should
>>>> be a built in linker feature, correct?
>>>
>>>
>>> Only first path ( before :) is relative to location of binary at runtime
>>>
>>
>> Exactly, so how can you make an OE build use the rpaths of libs that
>> point to the build sysroot. What I have at the moment is
>>
>> 0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]
>>
>> Which would be correct if I was linking on the target. However when OE
>> sees the rpath in it's cross compile environment it should prepend it
>> with the build sysroot so you end up with something like
>>
>> 0x0000000f (RPATH) Library rpath:
>> [$ORIGIN/../lib:/path/to/build/sysroot/usr/local/bar]
>>
>> And then the SDK should end up with something like
>>
>> 0x0000000f (RPATH) Library rpath:
>> [$ORIGIN/../lib:/path/to/sdk/sysroot/usr/local/bar]
>>
>> Is this what is expected to happen, or am I stumbling into an
>> unsupported scenario.
>>
>> Cheers,
>
>
> I think basically what I'm saying is that does the linker prepend it's
> --sysroot value to absolute rpaths, and if not, should it?

having absolute build paths into rpaths is not a good thing. Linker
will search the libs during link in sysroot its configured to do so.

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

