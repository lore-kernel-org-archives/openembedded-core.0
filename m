Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 45CF578860
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 19:27:04 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id y89so2411234pfk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 11:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wrNtRKqsYNSVHQbp5g14D4n0lQtKc71u3uEKitLSRSY=;
	b=pP9CQ6KD7nxYWksgL5tlzdCsvbGT+cTahR8bK+QMUihgDkQriZYjeUNJnNKDFs/Kwi
	DgNMIPuzfTobif1TZUk0fD9wdIBnuMBQ0rLQdTYWvhh7Q1k9Wx0HUGnVKVREdrZF6quT
	Jqw37hw+5o2eVAhOOYyzcsL4JnEZvattlz8KxexQ7cYdvNNjXGDC+Ih406xn/sQdcjcD
	x6QaZdIvHyQit0whtuTPTcZJzpr5WwfwCLU/JxdPABgW3KeOdlx/x9ySiT8XR4Q+LQah
	S9ZtmgcAvv+zfe9H1YD+2UAaXCq2geisACPcRL1P7WIjjF0NUfHMC8rPa7C8XNJg3Gyk
	Nf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wrNtRKqsYNSVHQbp5g14D4n0lQtKc71u3uEKitLSRSY=;
	b=P73lRsuM6fqkQPR0f2oSabbdPAg5uBXttoQwksmfdJ/Dp7KkxaNu+B3djHGZkLWbut
	nZXtEj0qS2E/gD8pgM7mPEp3DnWNDkHwSmrHaA/TwiSpWr/1mv7iDIj7g/KPqhxoW9MN
	6T3GtrxOY4Cudf0diDumETaBDbCaA5CxPL7aHTvO0aJitfhzjmyJuXx47b+citqEhjtX
	rG/uRy8lGpkMbyszQKAysFl3jArjKXi8o799yC3PvEdYBr+2Fuy95Fp2mHRHrnjIOzrd
	XlB38L+Rrt6716mWuaabrGkDk3WrnMlVyjsWQBrIlPAKx6J+Oe+h50ZHv6WHhYgYLa/O
	emDQ==
X-Gm-Message-State: AKGB3mLGaH0liVS9DlnEBjMdikb0o5li+SKVmPYjTAx1911nkUQwDJVK
	49hR0iP0veW1Y7m4bBs04To9arsd8BExKo/N0fo=
X-Google-Smtp-Source: ACJfBotfCkYhzuCzpcrK9dMwHJOWSBdz1mRb5TyJyNghftmJ71fRAC1bYKGUTRJyi29svJ90k4IWQVYojzhmM9twT/Q=
X-Received: by 10.98.30.132 with SMTP id e126mr21372724pfe.119.1515698826003; 
	Thu, 11 Jan 2018 11:27:06 -0800 (PST)
MIME-Version: 1.0
Received: by 10.100.159.15 with HTTP; Thu, 11 Jan 2018 11:26:35 -0800 (PST)
In-Reply-To: <aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
References: <2ce0ac68-4ef4-41f5-c931-81990ecd1d03@xevo.com>
	<CADqQcK4-=Q3mvKJfhjHbJEUYeTiGq3c7dCAR3E=w+ktr+_7RyA@mail.gmail.com>
	<e3dda70b-e6b2-bb18-2fe0-807b5c4fed48@xevo.com>
	<CAAjYPQ=u2U3f6DrL1KP-RkftD8P3nbASf1YUeeL0PFP6vY=hzQ@mail.gmail.com>
	<0ca64688-6a1d-0415-537f-bf59fb8dd2a6@xevo.com>
	<aa0ec366-dcd4-bac2-418a-acb0f9a06709@xevo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 11 Jan 2018 11:26:35 -0800
Message-ID: <CAMKF1sqKEc6KBZChcgx2U9e9eWLrW1NC60=HkSPHjfJn5UX7NA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
Cc: Jussi Pakkanen <jpakkane@gmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Issues with meson in SDK with cross-file
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
X-List-Received-Date: Thu, 11 Jan 2018 19:27:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 11, 2018 at 11:22 AM, Martin Kelly <mkelly@xevo.com> wrote:
> Khem and Alexander, could you comment on which solution is preferable from
> an SDK standpoint? Otherwise, could you nominate someone else to do so in
> your place? :)
>
> Here are the possible solutions proposed:
>
> - Generate meson.cross toolchain file at SDK extraction time.
> - Wrap meson with a shell script that dynamically generates a toolchain file
> and then runs meson pointing to it.
> - Change meson to support pulling in env vars in meson.cross, and use a
> fixed meson.cross file that references the env vars.
>

We already have environment file, could it be used for meson as well and needed
bits be generated during build time for SDK.

>
> On 01/09/2018 12:33 PM, Martin Kelly wrote:
>>
>> On 01/09/2018 10:40 AM, Jussi Pakkanen wrote:
>>>
>>> On Tue, Jan 9, 2018 at 8:20 PM, Martin Kelly <mkelly@xevo.com> wrote:
>>>
>>>> Note the "native C compiler" line, which directly uses $CC.
>>>>
>>>> I'm not sure if this is correct, but an easy way to fix the issue is to
>>>> ignore $CC for internal sanity checking when a cross file is specified.
>>>> In
>>>> that way, meson would probe the system and use the normal gcc for sanity
>>>> checking while still using the cross file for the actual build.
>>>
>>>
>>> That breaks the whole reason the sanity check is there in the first
>>> place. Its point is to test "is the native compiler the user has
>>> specified working and capable of creating executables". If we change
>>> it then that becomes "is the system default compiler (which we might
>>> or might not use) working". We need to be able to support the case of
>>> users defining both the cross compiler and the native compiler. So
>>> something like this:
>>>
>>> CC=/some/native/cc meson --cross-file=mycross.txt <other options>
>>>
>>
>> Yeah, that makes sense. The issue here is that the OE SDK sets CC, CXX etc
>> to point to the cross compiler, not to the native compiler, so when meson
>> assumes it's native, things will break. I think we need a way to specify
>> both cross and host compilers separately from the env vars. For example, if
>> the binaries section were split in two: "host-binaries" and
>> "target-binaries", then in the cross-file case, meson could use
>> "host-binaries" instead of looking at CC and other vars.
>>
>>>> Right now, the SDK contains fixed contents, and there is some top-level
>>>> logic
>>>> for rewriting a few paths to make everything relocatable. I don't think
>>>> OE
>>>> wants to inject a special-case one-time generation of the toolchain file
>>>> at SDK
>>>> extraction time, as it circumvents the normal build process,
>>>
>>>
>>> Would it not be possible to generate the cross file when creating the
>>> SDK contents originally? The only change it would need is the same
>>> kind of path fixing. The setup does not really change.
>>>
>>
>> I think it would be possible, but I'm guessing it would require some
>> special-casing that we may not want to do. Khem probably has a better
>> informed opinion on this than I.
>>
>>>> Another approach would be to generate the toolchain file truly
>>>> "on-the-fly",
>>>> such that the meson command points to a script that first generates a
>>>> toolchain file based on the contents of CC, CXX, etc. and then runs
>>>> meson. I
>>>> think this is a bad idea because it is complex (will definitely surprise
>>>> people) and slow. It also breaks people in surprising ways when they
>>>> accidentally use a meson from outside the SDK due to the PATH setup.
>>>
>>>
>>> This is, roughly, what Debian does currently.
>>>
>>
>> That's too bad :).

