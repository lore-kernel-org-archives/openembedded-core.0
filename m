Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 94CCD71ADD
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 07:05:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id t6so10047489wmt.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s1nZqx7te+QNXzKLV5Qw1m9r5TfPw7Sx8ryk454nOn4=;
	b=qtXYMhpzE/P09N11LhD8qBTChjFFHE/j8kgUwBRPvnIa/ckNgS/NcVDrP4+D2jiP0E
	VjJrxka2MwQz2LYfjcrFj/hlu28p8AvnrYIevQ52CuSBMRwVBMMqM0uaOWzmIcF2x0Aq
	GxO84Y3o3rzFsoKx0CwJpC8/0Njou9IGV98HBvBALyL5syO7qUCuCdu+PODJNcBA0ELj
	i4fDxU1qu5qXn3N9OFIZQBFHX0nh5zCipGdy0kv9rj86t6j2gH+kLQOzXRXLY9joEq4m
	CuXA7tYnV2p3LOiLQX+vD0/sBUZ1Z4xiOsDVHC+6myj7+ydbtAhJRSyiJA/kKVGGunXu
	j26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s1nZqx7te+QNXzKLV5Qw1m9r5TfPw7Sx8ryk454nOn4=;
	b=PPsCkbrqQEY9/Av8exFEx3dctbi/Kls9AyENmwCkY5HWOSxJIsknlPPTif+eKcdRJk
	NwIE+43npqLoF6wB8pZ459zwOE4WLU1Lfsc/QOpLrTjWM9LmSsl8PSAo2q3tt6NDvHYU
	S9VjLd8EaqA7JqPqwbn4Gnr+CzSlKlQ//OOtOdOv5ErVrIZEMJl1E0l4Pseeg573sOIM
	D0DDlD6GVoK0wJcyFIN0EOTHN4bxqPXMHHkSoI9Z1NOtK/s9alvrWT90absrTcEYEX94
	mIqBdCngWsHfbb0O/xmdMrfrZFBGhUINDv/b1pvO1tC6NK3ys69/Q9QroLJVcsPDrYGM
	4tvw==
X-Gm-Message-State: AElRT7E0cxLE9caiq0Xr+WrAm+4V8Fa57t7M4LUq6VpjMJ5lw8oOPc6Y
	J+9Elge7eDlckI3WFPFjKCxotgZGZPe038C4MHs=
X-Google-Smtp-Source: AG47ELv+sGO5czITrjaunXVbObGHSXdVz3LzpiEJvcfG3F68O/WhsRO3cgXFSOJNhQb/gUqub0tPlMVzh4jDxa6H9AM=
X-Received: by 10.28.176.134 with SMTP id z128mr12838650wme.86.1521961554904; 
	Sun, 25 Mar 2018 00:05:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Sun, 25 Mar 2018 00:05:54 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
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
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sun, 25 Mar 2018 00:05:54 -0700
Message-ID: <CAJ86T=WBP_Cw133Z1s0LxjL-sgp3YQmuYGx7eBxUFACUJP++nw@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 25 Mar 2018 07:05:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 24, 2018 at 10:37 PM, Victor Kamensky <kamensky@cisco.com> wrote:
> On Sat, 24 Mar 2018, Andre McCurdy wrote:
>> On Sat, Mar 24, 2018 at 5:09 PM, Victor Kamensky <kamensky@cisco.com>
>> wrote:
>>> On Sat, 24 Mar 2018, Burton, Ross wrote:
>>>> On 24 March 2018 at 20:12, Victor Kamensky <kamensky@cisco.com> wrote:
>>>>> Here is another crazy idea how to deal with it, just
>>>>> brainstorming what options are on the table: disable
>>>>> renameat2 with help of seccomp and force coreutils to
>>>>> use other calls. Something along the lines that were
>>>>> suggested with intercept of syscall function call, but
>>>>> let kernel to do interception work.
>>>>
>>>> Wow, that's impressively magic.  Does this depend on kernel options or
>>>> specific recent versions?
>>
>> Yeah, it's impressive but perhaps overkill for this situation.
>>
>> Having the kernel run a BPF script on every syscall is going to have a
>> much bigger performance impact than intercepting one specific libc
>> function in user space.
>
> I don't think we should worry about overhead in pseudo case.
>
>> Also, AFAIK, seccomp can't be nested - so building within an
>> environment which has already been secured with seccomp (e.g. recent
>> versions of docker?) might be a problem if pseudo starts to rely on
>> seccomp too.
>
> Above is true. It was on my mind.
>
> Note I have no problem whatsoever if you can intercept syscall
> function correctly. Function intercepting way is definitely more
> aligned with what pseudo does. I was just listing other
> possible options.
>
> But please note syscall function takes a
> variable number of arguments and call another variable
> number of argument function, real syscall implementation, in
> general, cannot be done. One would need to have complimentary
> vsyscall function taking va_list. I.e like printf and vprintf.
>
> Please see http://c-faq.com/varargs/handoff.html
>
> But maybe something special can be done for syscall case.
> Disclaimer: I did not read full thread, maybe you already
> discussed this.

Yes, I think it's already been covered in the thread. Although the
libc syscall() function takes a variable number of arguments, it's
known that there are a maximum of 6 of them and they are all of a data
type which fits into the register size of the target architecture (ie
"long" for most 32bit and 64bit targets, "long long" for x32 etc).
Therefore it's possible to extract them from the va_args created by
the caller into 6 temporary variables and then pass those variables on
when calling the real libc syscall() function. ie we don't actually
need to pass the original caller's va_args on to the real syscall()
function - we just need to pass on all the arguments.

There's some concern that unconditionally extracting 6 arguments when
the caller may have supplied less than that could be problematic.
However, there's code in both glibc and musl which does exactly that,
so I'm inclined to think it's OK in practice. The worst that can
happen would seem to be passing some extra junk values to a syscall in
the kernel which is going to ignore them.

