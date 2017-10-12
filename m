Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4C72E719A4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:04:46 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id u138so12518616wmu.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 05:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=uCkiyw9izbXEDAjcksg2q9FAFSAYPCrHtypJVoHozR8=;
	b=Wdqtc3f098mQ5FGajNdCL7xMwL166NrLS+o3xydFvJHuqsdIyOD/5u4T1eNzTR2Zb4
	b0713ajMPOmZKKVeCEmwrkyEDvXJCGUf/yl4MD7SGViOSyaj9Ze4e/vhIWDKncCm83QJ
	xVBqcqAIvwn6hq5GO1dyswQlw4QdKVs2oYWFS0mmHNAjNyFkowksP+SVZo7/8h+WjQh4
	Lvf//ex652cub6gonIUPTBa+vCegwfIcL1DrR/MARKEi7+aZHpQA/WxPeMhpwglJdX2B
	a0WsRQz3Y2plFgua7PDo64/iFtcz+oVDaA/YvgoxMyO9d9ELkC3sqjV+vh+6s4f+Qdnh
	KjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=uCkiyw9izbXEDAjcksg2q9FAFSAYPCrHtypJVoHozR8=;
	b=FHtmAT82VtELbxufkk/d0HIHOnjn6Jgf8LKhkdjMYoZHMDIZ7OscGS7KDJr5ejAkkm
	lteOaaYMjx6wmaLUcO+UCW+4NrXGA0pXaaEeskMYmgh/33ep+WxGQM+X8ZTCk3nROoIp
	6F17rAUpzn1MeOeNoj5lYPGyR/Zyi/Uoh+LiB1n4DyaM4pa4mnsJaa+qAZxRpuGVpKzn
	TDY7E2rptnLF+6sy1TyIYCM+8NonU0/Dq3dzUjKEdtKVxOvnkdjeN8gJ6QbvuIoWH3or
	OET5Z8BOhAm589RCYv1btlAgOK6DPTFX6ycfKNCaN/Jxfpkfv2yBHy0h5+GI+poMHbgz
	i6xw==
X-Gm-Message-State: AMCzsaWgqMcUFt0eh0fDAphYwRGCSQgZ6+tGS26uO6s5U5wBdiykLFWg
	DLu4qQWEnUVySy0MQDwhZf/QDCXoD8BgXpSzl7ntLQ==
X-Google-Smtp-Source: AOwi7QAx23xDLblf9+3/RRyWUyGuaWjP3w4Tr8bZaMK9+Lgpq0GuOqwZN3GfvorkTJuGe6F2wKelxHCjRqky20PhnEU=
X-Received: by 10.28.156.67 with SMTP id f64mr1632534wme.42.1507809888119;
	Thu, 12 Oct 2017 05:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Thu, 12 Oct 2017 05:04:47 -0700 (PDT)
In-Reply-To: <CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
	<CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
	<CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
	<CAJ86T=UCwz44_twkQR-y=MR8TQVeTo2+RdXzOWc5Eyvv8dV5jg@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 12 Oct 2017 13:04:47 +0100
Message-ID: <CAPyrkgw7xOj+RkK6fgvNEAi3kERRp_NP1bmetiQfJRaS0XEDdA@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
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
X-List-Received-Date: Thu, 12 Oct 2017 12:04:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 6:11 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Mon, Oct 9, 2017 at 10:01 AM, Paul Barker <pbarker@toganlabs.com> wrot=
e:
>> On Mon, Oct 9, 2017 at 5:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Mon, Oct 9, 2017 at 9:16 AM, Paul Barker <pbarker@toganlabs.com> wro=
te:
>>>> On Mon, Oct 9, 2017 at 5:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> w=
rote:
>>>>>>
>>>>>> I'm looking at what I can use to determine if sse2 is supported for =
a
>>>>>> given machine/tune.
>>>>>>
>>>>>> In TUNE_FEATURES I could check for "core2" or "corei7" based on what=
's
>>>>>> in oe-core, but not sure this will cover tunings which might be
>>>>>> defined in other layers.
>>>>>>
>>>>>> Alternatively I could check TUNE_CCARGS for "-msse2" or later but th=
at
>>>>>> feels dirty.
>>>>>>
>>>>>> Any suggestions on this?
>>>>>>
>>>
>>> Perhaps inverse is easier, meaning, set 387 for i586, i486 and i386
>>> and leave the
>>> defaults as it is for other variants
>>
>> Sadly that won't cover it. We'd also need to cover Pentium variants
>> pre-Pentium4 and early AMD variants. It's SSE2 which is needed not the
>> original SSE instructions.
>>
>
> Does testing X86ARCH32 work?

Sadly not. "tune-core2.inc" sets this to "i686" which would indicate
no SSE2 support, however the core2 series does support SSE2. So we
can't base the decision on the value of this variable.

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

