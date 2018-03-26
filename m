Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by mail.openembedded.org (Postfix) with ESMTP id C476560191
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 18:49:30 +0000 (UTC)
Received: by mail-yw0-f194.google.com with SMTP id c20so6459647ywa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2018 11:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=AsZtbg3yGwSKCNgb4jC5QE+xi/dONs6dZc8+RTjVdzM=;
	b=OASpwjd6fHO8TE0Nmu7g4PNGyb0/vmo/yzpjRrPRolF2m6yOaOscL4GRSzctDM1XKE
	EtaQysmg8D6eOqmLbabEt297Fg0GGDnzWLwazxNNCUid6y6pGtJyl0VyB9TG8y4/IGYg
	tlaXBMGZVNfK0kKor58Lqwe2MlVHguloI3LnP0ffObpPDYlFaWkAGpWeBD0XQZc4u8iE
	Ae541prPYDS8BWmYp7iBl4YVAG5NXpWBlVH6FE520Z05J4ua64/1oZd9aiUj82TZEo9c
	2lr3jzDFpnJ1H6Lve4Utoe8I+VepxAeDo4oANFDUSlibvEZniZZVMyN9w6Ev7AGHWnGK
	/m7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=AsZtbg3yGwSKCNgb4jC5QE+xi/dONs6dZc8+RTjVdzM=;
	b=iPnB9gTJkAa1iqjzm8s4KAcwFCkOiEYt1yNIhyzg6D7a1GMcUxCpQawdAJbECsGrO/
	WM54iAcFpjzaA2SyCeVgQN0v8n00m841QN+Bq0nPO+gtjRZI12cnxbYYhJfhj+2rcshq
	RAUz4JDnhp+nb3+QwBPhBZi4SLczlreIMoD04bVaDqffgu6nR7oN/T1d30aSiu3rXTnm
	4XjhgcHKMz+lU7fE0+3Hs2VLnm/7rPQz79iIHragCySJ94cp8jeT51U/KS9QOQSOC7MA
	lVgbPtFDp3vjRTtA7N4KiLncBzCwYiOHu0oL5sE02Gww4FbLb9/Wwe2m8QcIp4iTcNdG
	i4UQ==
X-Gm-Message-State: AElRT7FCqpDRb2HGr7K5x0HCibZ8dsvGSr8RWmjJfKTU+Mv6vuCxR4wZ
	fS4YeHXa/5jhxlsoA8clYMjssUmc5H8c/o2u+3QfwQ==
X-Google-Smtp-Source: AG47ELv+EsLtAZkjivdmyVrLZDf25PvIus/dU7e48zZn2B6sI2KDQtRX/sak1Gon7E1Xq3lQUJ4Hdq0WtWEqscEBC/g=
X-Received: by 10.129.108.137 with SMTP id h131mr23415027ywc.180.1522090171183;
	Mon, 26 Mar 2018 11:49:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Mon, 26 Mar 2018 11:49:30
	-0700 (PDT)
In-Reply-To: <CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
	<alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 26 Mar 2018 20:49:30 +0200
Message-ID: <CALbNGRREDMPeqY5WXmen77eEDQJwVu_QnkbDFCyPz0BOyUsL4A@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Mon, 26 Mar 2018 18:49:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 25, 2018 at 9:05 AM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Sat, Mar 24, 2018 at 10:37 PM, Victor Kamensky <kamensky@cisco.com> wrote:
>> On Sat, 24 Mar 2018, Andre McCurdy wrote:
>>> On Sat, Mar 24, 2018 at 5:09 PM, Victor Kamensky <kamensky@cisco.com>
>>> wrote:
>>>> On Sat, 24 Mar 2018, Burton, Ross wrote:
>>>>> On 24 March 2018 at 20:12, Victor Kamensky <kamensky@cisco.com> wrote:
>>>>>> Here is another crazy idea how to deal with it, just
>>>>>> brainstorming what options are on the table: disable
>>>>>> renameat2 with help of seccomp and force coreutils to
>>>>>> use other calls. Something along the lines that were
>>>>>> suggested with intercept of syscall function call, but
>>>>>> let kernel to do interception work.
>>>>>
>>>>> Wow, that's impressively magic.  Does this depend on kernel options or
>>>>> specific recent versions?
>>>
>>> Yeah, it's impressive but perhaps overkill for this situation.
>>>
>>> Having the kernel run a BPF script on every syscall is going to have a
>>> much bigger performance impact than intercepting one specific libc
>>> function in user space.
>>
>> I don't think we should worry about overhead in pseudo case.
>>
>>> Also, AFAIK, seccomp can't be nested - so building within an
>>> environment which has already been secured with seccomp (e.g. recent
>>> versions of docker?) might be a problem if pseudo starts to rely on
>>> seccomp too.
>>
>> Above is true. It was on my mind.
>>
>> Note I have no problem whatsoever if you can intercept syscall
>> function correctly. Function intercepting way is definitely more
>> aligned with what pseudo does. I was just listing other
>> possible options.
>>
>> But please note syscall function takes a
>> variable number of arguments and call another variable
>> number of argument function, real syscall implementation, in
>> general, cannot be done. One would need to have complimentary
>> vsyscall function taking va_list. I.e like printf and vprintf.
>>
>> Please see http://c-faq.com/varargs/handoff.html
>>
>> But maybe something special can be done for syscall case.
>> Disclaimer: I did not read full thread, maybe you already
>> discussed this.
>
> Yes, I think it's already been covered in the thread. Although the
> libc syscall() function takes a variable number of arguments, it's
> known that there are a maximum of 6 of them and they are all of a data
> type which fits into the register size of the target architecture (ie
> "long" for most 32bit and 64bit targets, "long long" for x32 etc).
> Therefore it's possible to extract them from the va_args created by
> the caller into 6 temporary variables and then pass those variables on
> when calling the real libc syscall() function. ie we don't actually
> need to pass the original caller's va_args on to the real syscall()
> function - we just need to pass on all the arguments.
>
> There's some concern that unconditionally extracting 6 arguments when
> the caller may have supplied less than that could be problematic.
> However, there's code in both glibc and musl which does exactly that,
> so I'm inclined to think it's OK in practice. The worst that can
> happen would seem to be passing some extra junk values to a syscall in
> the kernel which is going to ignore them.
> --
FWIW: All my build machines are affected by this issue. As temporary
workaround I downgraded coreutils-8.27-20.fc27 by

dnf install coreutils-8.27-16.fc27

Now images seem to build again without floods of host contamination.
Have no idea for how long downgrade is possible...

Interesting background: mv/renameat2 change seemed so important for
Fedora that they backported the changes into 8.27.

Andreas

