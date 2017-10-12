Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id C446277E9C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:07:54 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id m72so23722577wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i46xXJMIkeECBIgtiVhQLTlacxq8suQXYxirxB1Zzfs=;
	b=Zc+t9QNVGLvlOSn4g5AXGUofeuPbESR6wRDnrsKj6+k+gY+734rb1qVgYYTpmTJdUJ
	aQSYzKKQl3COuvrxm/Npbi+eN1xXQPCRQL8l1BoN13rnmNW6Kp1QwIXDErlArsHSRMeM
	hSruc3P7gTdwgSxYc8eVbrrhVRn9liqWJrWnRnMNDTUTjtaq0kFaKDyPbw23OQcSJbdI
	UUFLrDSpagNMjfKwqvKZn+eJXbh2NAO1bqEBB6F27rw+jhSZSAHjLYra+gAnRCp+yaKK
	/1f79bM23kJA0xT5Se2YBaqs4oFR6j5sNewmyCpXVBK2f8TWfSswZ9kB5ZwbvI6q5Yg5
	q7CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i46xXJMIkeECBIgtiVhQLTlacxq8suQXYxirxB1Zzfs=;
	b=Zo3aKpufeP2gg61FHyjTr4AfC1vD3BaBuyuuYuQVhjINc5nikvCqBaY4T6OnO3qNXM
	HURzqWr9Ohnsj76xwzksh+tWwaGT2ihFTRmbEg/lC4NgN3cF8rH1swRDgvifIj6kO1kk
	JmLSahNL9tmDLlSeCShjI7QtBZ8af5fNilX7v08c8DaH/ODKB4ykr/9n8J38AgjJS/gO
	JMUnOuEAE9vKkqvRBRt4WBY1wBWeewqRUJd9eewkGRDJYkzydwbCbiSA3jrmFS04oEIR
	W6cYEbqzWgNqQk5OssqmznPwfAJovexKWhGJ1qj70ypdAAq0mFBosDStvJCFAruQllBj
	9UCw==
X-Gm-Message-State: AMCzsaWMFsviU4vpQAbQi6B3KgFsQpEW7vaicjycXxOsyaEf3Okff5zM
	5djhcA9n9ro1hGCPALoasO8r0fvY+gWwYnWqSQmHeg==
X-Google-Smtp-Source: AOwi7QCqh4vQX+lnU4pgfsgJVQSq9V0lZGzm7uKFjj66e1t12bGKvm/K70h4YIqBSzFA/H5ulqTrNGWiQvM9UO58bOk=
X-Received: by 10.28.156.67 with SMTP id f64mr1640383wme.42.1507810075440;
	Thu, 12 Oct 2017 05:07:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Thu, 12 Oct 2017 05:07:54 -0700 (PDT)
In-Reply-To: <0c97da3b-489d-eba0-8106-7b00d142746b@windriver.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
	<CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
	<CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
	<CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
	<0c97da3b-489d-eba0-8106-7b00d142746b@windriver.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 12 Oct 2017 13:07:54 +0100
Message-ID: <CAPyrkgwDWH4Rk2T3V31Jyt0RjU4wCEd5sfPnm8Qevn3PWkbk6w@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
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
X-List-Received-Date: Thu, 12 Oct 2017 12:07:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 6:28 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> On 10/9/17 12:11 PM, Andre McCurdy wrote:
>> On Mon, Oct 9, 2017 at 10:01 AM, Paul Barker <pbarker@toganlabs.com> wro=
te:
>>> On Mon, Oct 9, 2017 at 5:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Mon, Oct 9, 2017 at 9:16 AM, Paul Barker <pbarker@toganlabs.com> wr=
ote:
>>>>> On Mon, Oct 9, 2017 at 5:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>> On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> =
wrote:
>>>>>>>
>>>>>>> I'm looking at what I can use to determine if sse2 is supported for=
 a
>>>>>>> given machine/tune.
>>>>>>>
>>>>>>> In TUNE_FEATURES I could check for "core2" or "corei7" based on wha=
t's
>>>>>>> in oe-core, but not sure this will cover tunings which might be
>>>>>>> defined in other layers.
>>>>>>>
>>>>>>> Alternatively I could check TUNE_CCARGS for "-msse2" or later but t=
hat
>>>>>>> feels dirty.
>>>>>>>
>>>>>>> Any suggestions on this?
>>>>>>>
>>>>
>>>> Perhaps inverse is easier, meaning, set 387 for i586, i486 and i386
>>>> and leave the
>>>> defaults as it is for other variants
>>>
>>> Sadly that won't cover it. We'd also need to cover Pentium variants
>>> pre-Pentium4 and early AMD variants. It's SSE2 which is needed not the
>>> original SSE instructions.
>>>
>
> This is why 'TUNE_FEATURES' was introduced.  If SSE2 (or something else) =
is need
> for proper configuration, then we should add a specific tune_feature and =
update
> the corresponding tunes.
>

Is it too late in the cycle for rocko to start adding "sse2" to
TUNE_FEATURES for relevant machine configurations and include files?
If it's still ok to make this change for rocko then this might be the
best path forward.

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

