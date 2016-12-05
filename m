Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id A63DF605FF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 18:19:13 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id 20so32895541uak.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 10:19:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mmdMqLuDSNOxbD0+ThqsisqrExeA/dBiBC0CbYuZKjk=;
	b=bEQ4bW/6Dl88wj/NIhZQKAiW1XDpDF0mwYUm2bKZKjtBBnedbyJaBFgf+rz8vECUxe
	RlJGHDPtVGgQgxKrMZSokcvITyJqqEMpIEeGqlx4YjP+4Wsy5S0mW5a6tP0/JxDl6Z4J
	V0sRiU0JXs2sdN3LL2V1WFcbIuVgv4TsOYZ023luXwU7HzwHsGrF9EQfBa3i9mAb5VQx
	BUVKFNk97YwoWq1bCwjDklf/gjvweTfCSLyrRFxxhNE2wUHZlZwwg+UI3b/S9rbAdC7M
	EIvpJ2iWwIp3xah5KsM/jszMoA5OypnHKQpOwY+llsIPlT5rkD8nGt4+Gpr1X9dLlURB
	QU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mmdMqLuDSNOxbD0+ThqsisqrExeA/dBiBC0CbYuZKjk=;
	b=fSFthMVZ+gFCNK6o7qYyvvzDXePPWgwMenVwdABsdls39s4bwXzPr0uauqxNm3QUDh
	GO894GazIhfz4m7okKEaj67W85yP7gRjkg4H0EZ70/WqmWzB4CwImJzrzYlwhw9bISVQ
	VO05auDh/qovQVL4SwOoLKUi+VWLnQoCMXFeUtCoFtlCEndb8QAjm0BLi0biZM1FNbht
	Ew+gnT6QyKOZz25Ztk+HtqnU55LdLY0XmwekEvdQxquHRGa5uaI6wlcdel7uFptteY2V
	+swv5v5G2iqq1MVIs0dNwCZ6Iv0qfsNn/LrL+c4MT15xcP8dwzEiNzgzGX4sMv0QdK3A
	8ZBQ==
X-Gm-Message-State: AKaTC02/sItoxnOFgrAM61POis21I71B0L+5eazS+gF46Hk7+c5wUv+PgVwFB9j6M8YAscPEs+l9y0zkYNbRAw==
X-Received: by 10.159.55.142 with SMTP id q14mr46742218uaq.107.1480961954669; 
	Mon, 05 Dec 2016 10:19:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 10:18:44 -0800 (PST)
In-Reply-To: <e98508b9-e5e0-3c43-2532-a4ac54d1326f@embed.me.uk>
References: <68b7f401-a888-ff73-45d5-b0df76f170c4@embed.me.uk>
	<CAMKF1sqVdGwXPX-hg2NCgY-VxL_1bBVQL3vpzC00033ah1N7WQ@mail.gmail.com>
	<f8d7dc4e-2788-f061-447c-67916f215aab@embed.me.uk>
	<b645b26d-a60f-f42e-8545-13d3b36b0596@embed.me.uk>
	<CAMKF1sqWBAAdT7v7vky3-wEfxXZ-aDNe-JH_jzKgkB6_E8Da7g@mail.gmail.com>
	<e98508b9-e5e0-3c43-2532-a4ac54d1326f@embed.me.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2016 10:18:44 -0800
Message-ID: <CAMKF1srdL_p1BckDoZKw4bcY0fObUngf20St3q7bHUvGTx1dhA@mail.gmail.com>
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
X-List-Received-Date: Mon, 05 Dec 2016 18:19:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 5, 2016 at 9:41 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>
>
> On 05/12/16 16:43, Khem Raj wrote:
>>
>> On Mon, Dec 5, 2016 at 2:54 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>>>
>>>
>>>
>>> On 05/12/16 10:44, Jack Mitchell wrote:
>>>>
>>>>
>>>> On 02/12/16 07:08, Khem Raj wrote:
>>>>>
>>>>>
>>>>> On Thu, Dec 1, 2016 at 8:18 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>>>>>>
>>>>>>
>>>>>> I'm having some troubles with shared library, shared library
>>>>>> dependencies
>>>>>> and rpaths. I have libfoo, which depends on libbar when I try to link
>>>>>> libfoo
>>>>>> with my app, it requires libbar to be found. libbar is in a
>>>>>> non-standard
>>>>>> location, /usr/local/bar when I compiled libfoo, I used -Wl,rpath-link
>>>>>> ${STAGING_SYSROOT}/usr/local/bar and -Wl,rpath /usr/local/bar. Now
>>>>>> when I
>>>>>> come to try link my app with libfoo, it fails to link as it can't find
>>>>>> libbar, which I assume means the rpath in libfoo isn't being properly
>>>>>> prepending with sysroot what is the proper way to support this in OE?
>>>>>> My
>>>>>> library has the following rpath information:
>>>>>>
>>>>>> 0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]
>>>>>>
>>>>>> So why isn't the rpath being prepended with the sysroot when I
>>>>>> compile my
>>>>>> app and link libfoo? The apps build system is using cmake, but this
>>>>>> should
>>>>>> be a built in linker feature, correct?
>>>>>
>>>>>
>>>>>
>>>>> Only first path ( before :) is relative to location of binary at
>>>>> runtime
>>>>>
>>>>
>>>> Exactly, so how can you make an OE build use the rpaths of libs that
>>>> point to the build sysroot. What I have at the moment is
>>>>
>>>> 0x0000000f (RPATH) Library rpath: [$ORIGIN/../lib:/usr/local/bar]
>>>>
>>>> Which would be correct if I was linking on the target. However when OE
>>>> sees the rpath in it's cross compile environment it should prepend it
>>>> with the build sysroot so you end up with something like
>>>>
>>>> 0x0000000f (RPATH) Library rpath:
>>>> [$ORIGIN/../lib:/path/to/build/sysroot/usr/local/bar]
>>>>
>>>> And then the SDK should end up with something like
>>>>
>>>> 0x0000000f (RPATH) Library rpath:
>>>> [$ORIGIN/../lib:/path/to/sdk/sysroot/usr/local/bar]
>>>>
>>>> Is this what is expected to happen, or am I stumbling into an
>>>> unsupported scenario.
>>>>
>>>> Cheers,
>>>
>>>
>>>
>>> I think basically what I'm saying is that does the linker prepend it's
>>> --sysroot value to absolute rpaths, and if not, should it?
>>
>>
>> having absolute build paths into rpaths is not a good thing. Linker
>> will search the libs during link in sysroot its configured to do so.
>>
>
> Ok, that makes sense. So something like this would be more appropriate?
>
> rel_path = relative_path(mylib, otherlib)
>
> -Wl,-rpath $ORIGIN${relpath}

This could work.

>
>
>

