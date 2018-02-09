Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 698286FFFE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Feb 2018 19:52:41 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g1so17346761wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Feb 2018 11:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=mqqvSAWDNBjMOkISunPHsZsxnQKluxavemCHzXgM4MI=;
	b=hiY1exA8SFk0XSoIu3OTt8DwH2SErAMFbWDUNn32w7TI3hyESZ5UpxjQQ7fWCIOQF2
	BabyswCneThLR/zXu3jkWfJUfONPYbPa8/LMd2pbOvwziqnTXoUzArgr8vJVjbD9W55L
	d1Dg6JFVeUzWGJUef4GD9PKEtXXoOe9wRaAMo119fKvhMxUmWBZW8ITrDIWrqmGdUtBK
	5Rho2DKKbOWeMmUPb1zL2TLEMp4l/DLB0HTUjPDBbmd7tKDyTn0HmRo5LZQUtmidiWoX
	ncuROuNUaPFTW0cubIImr1hFeDjCW8nigS/J67hrLaQEQkywquCabgJEFwPsgJWrtPef
	LT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=mqqvSAWDNBjMOkISunPHsZsxnQKluxavemCHzXgM4MI=;
	b=GjSA8/7I+8dQOAf5eE8T+Oi+YqebZNlDHc3bypyRJJj+tMSIu65SM/5NmqwyW/sHKd
	cJwHMC17Vkp9wH3EjjWR6KlsSSnyOKzAcWa0U9HYRnJ8i1/PbpOElYhFt6vlOwdlBusH
	UfIq9sCsQU2jGkTMU+yqKyI7qmIvhiGMcUBcmH6h/Uxyqwm8of3QgHHrdzE9f6HtNtpY
	oZhhX+nCiSQZaWGDN0IgQ0iQuDPqNlR4pIKbCt0m2MQzoB1jZ4p71cXtRXsTyuOnnfBB
	RKEmV14CLdztqnwXO45Z0ZFT+dzzhhwGK6Pa8XYGxXhv73TqwkmibkeYWqdbBENcu2jB
	pxPw==
X-Gm-Message-State: APf1xPCTAQLTPKI25EotzPzD6SmbF0lRq4KvnkufSN6zrQn/bJnkRgP9
	z5cFlNiFdeXW3Ndmv7PHfINOqOyDEEMSvZI4LgU=
X-Google-Smtp-Source: AH8x227YYBEreysRs631pBfl5kWYXzoqNkWrmhe7TznKxEjo17pbi4KjeJbBcPmZBuaIt9C4YHKB3fV9GvjK6mPKeKY=
X-Received: by 10.28.212.69 with SMTP id l66mr151787wmg.110.1518205962825;
	Fri, 09 Feb 2018 11:52:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.144.193 with HTTP; Fri, 9 Feb 2018 11:52:42 -0800 (PST)
In-Reply-To: <CAJ86T=Wegev0YRi8DNvUwJ4ry+BP=UY_tiQce9TEqmHu6Q+O_Q@mail.gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
	<826373113902dd8d6284ec49a2ea2076c7e298c0.1510192517.git.raj.khem@gmail.com>
	<CAJ86T=VKWCdmAXRMV8dqSnQS=MdHX=H3odPHKtydB6SCEFyrMQ@mail.gmail.com>
	<CAMKF1srPGiyC3YfwyZBKW7+Ttm037dCoOg8D9i=m3qq04Og1_w@mail.gmail.com>
	<CAJ86T=Wegev0YRi8DNvUwJ4ry+BP=UY_tiQce9TEqmHu6Q+O_Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 9 Feb 2018 11:52:42 -0800
Message-ID: <CAJ86T=WFoFn=xXV4tzrU4gvfK-jWD9xTdK3hq2PwmgGng-80Eg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/5] musl: Update to 1.1.18
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
X-List-Received-Date: Fri, 09 Feb 2018 19:52:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Dec 1, 2017 at 4:41 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Fri, Dec 1, 2017 at 4:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Fri, Dec 1, 2017 at 4:31 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>> On Wed, Nov 8, 2017 at 5:58 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> Rich Felker (9):
>>>>       fix access by setjmp and longjmp to __hwcap on arm built as thumb2
>>>>       for executing init array functions, use function type with prototype
>>>>       fix read-after-free type error in pthread_detach
>>>>       fix incorrect base name offset from nftw when pathname ends in slash(es)
>>>>       in dns parsing callback, enforce MAXADDRS to preclude overflow
>>>>       release 1.1.17
>>>>       fix regression in glob with literal . or .. path component
>>>>       fix build regression on ARM for ISA levels less than v5
>>>>       release 1.1.18
>>>>
>>>> Szabolcs Nagy (1):
>>>>       math: rewrite fma with mostly int arithmetics
>>>>
>>>> Will Dietz (1):
>>>>       posix_spawn: use larger stack to cover worst-case in execvpe
>>>
>>> With the version of musl currently included in rocko, various apps
>>> (including bash) segfault at startup when compiled as Thumb2. The "fix
>>> access by setjmp and longjmp to __hwcap on arm built as thumb2" commit
>>> from musl 1.1.18 fixes that.
>>>
>>> However the other changes in musl 1.1.18 look pretty useful too, so
>>> unless there's strong objection, I'd like to suggest aligning rocko
>>> with the musl 1.1.18 release. ie cherry-picking the following two
>>> commits from oe-core master to rocko:
>>>
>>>   c3f0a70 musl: Update to 1.1.18
>>>   3953c54 musl: Update to latest
>>
>> It seems good to me. Please send a pull and CC Armin
>
> Armin, please consider the following two commits for rocko:
>
>   c3f0a70 musl: Update to 1.1.18
>   3953c54 musl: Update to latest

Ping.

Any comments Armin?

