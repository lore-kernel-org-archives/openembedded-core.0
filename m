Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id C225060553
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 17:11:43 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id i124so24280062wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 10:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h4fNO3hWpmK6ja/PyVip/MgQWxK0IlRNxalVz19RNAg=;
	b=fF7Uez1eTEDUf5aarAKCRhm+CFEup96MGvGqEfyM837WnH8f/WI+MDFcwaSoKv8Dyu
	TlYMXXVc3hz62Sqllb+IYbyFWZNcMDj9OGrKUL7pMsgaG/NQueg85qEoPEriu8nR2d0S
	PH6KIfcq+hKpYmS9/1sPRZ+i66m2LQ0jNDz+zOUwZhIlB8AcWe9+JmjbT52hKzBt6Vbd
	hN0NhxIlK+jLLnKG5CMTl2WT8Tm3rXP9yw0aeHtHHY51Xvmf0zagpyxmRbbVgxPs5P4I
	nw6okT64O8sJaWlqFczd7RpUEnin4dPvSpvUv7hylYQ9DXIsJYbZpQdEjrV6hpMxy76h
	WTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h4fNO3hWpmK6ja/PyVip/MgQWxK0IlRNxalVz19RNAg=;
	b=W5L77qpQLdURJpnw/kOr8k+JnxhBRRTaBTStkTqFsZ2f0/MEJLQGlYKdkZsDhwrMPI
	7jKxFmYhK/uiQuQ1EHL3A4GEfBY4ghAkEQi+OKCSNnFTmjfAAl95M4lgyw6BADPPWAMq
	zwHE7tpeDFTji1HLN0s/0PQ6PvdQKGUQvc+L3oay46/q7vhfnBI6JUkmoz6ZxLMYSwxb
	mhdTv8LVwjWzARxoZw8CKJyfbSc95a0XjgAc+jl0uy/CIjQSknxMNT3NMYQFay1qKQvA
	IHsETioSfQq8ivd/DxQL3gQ6x2t6B5ZhxFV9Q/nqLksVp+CFfHOfAkjddrGpCxmVUmst
	mG8w==
X-Gm-Message-State: AMCzsaWJq6BaOCFx6R0vdY5CMOeWSPpHRg17Is2lcTinrzhPyYKkzeyv
	49M+eDbWQNiSbI/95FX5kRn4/kpBRbvoILLV+mQ=
X-Google-Smtp-Source: AOwi7QCScIySHoVb/0YJPIzYUpvfqeV84L6O/apVpZOJa921KU12PSvA73zzRk9FEesHGDBuY2uqIuiKhj0i2Xwkj9c=
X-Received: by 10.28.147.208 with SMTP id v199mr8221813wmd.136.1507569104504; 
	Mon, 09 Oct 2017 10:11:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Mon, 9 Oct 2017 10:11:43 -0700 (PDT)
In-Reply-To: <CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
	<CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
	<CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 9 Oct 2017 10:11:43 -0700
Message-ID: <CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Illegal instruction when running go binaries in qemux86
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
X-List-Received-Date: Mon, 09 Oct 2017 17:11:44 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 9, 2017 at 10:01 AM, Paul Barker <pbarker@toganlabs.com> wrote:
> On Mon, Oct 9, 2017 at 5:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Oct 9, 2017 at 9:16 AM, Paul Barker <pbarker@toganlabs.com> wrote:
>>> On Mon, Oct 9, 2017 at 5:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> wrote:
>>>>>
>>>>> I'm looking at what I can use to determine if sse2 is supported for a
>>>>> given machine/tune.
>>>>>
>>>>> In TUNE_FEATURES I could check for "core2" or "corei7" based on what's
>>>>> in oe-core, but not sure this will cover tunings which might be
>>>>> defined in other layers.
>>>>>
>>>>> Alternatively I could check TUNE_CCARGS for "-msse2" or later but that
>>>>> feels dirty.
>>>>>
>>>>> Any suggestions on this?
>>>>>
>>
>> Perhaps inverse is easier, meaning, set 387 for i586, i486 and i386
>> and leave the
>> defaults as it is for other variants
>
> Sadly that won't cover it. We'd also need to cover Pentium variants
> pre-Pentium4 and early AMD variants. It's SSE2 which is needed not the
> original SSE instructions.
>

Does testing X86ARCH32 work?

