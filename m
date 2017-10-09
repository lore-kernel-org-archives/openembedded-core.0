Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 2F33F601F6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 16:50:27 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id z84so14339107pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 09:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/S5AgaoFcF+8ILSX7U4z1UURPfgKe3FVJAlspzptHGg=;
	b=uLbWpFnzPaNpgQYgxBA/5sj/fSXtd43g294JpL+41mtDncVLT+lVq+EHlHoxtIeW3Z
	VytEgguNVdBO1nWxjhTnJIHoeOKN4djwpQ+aSNGjO+f6IZ9TmCAoNRxR3M58kNgzfgaa
	FBokmyzmryWMIZyeVESfO8tG8BnLdfA8RVftr+Cw+o6lA764+ZQSnicFJdGdn7MhvXDb
	G16FcKZkUUMjlO/Nk55JrqoOxgyXaWDiAAbbbwjt/Bc6GMj5LdtpJ2BdgrQ56XrJBJOe
	dezp4lpFRbjjDJa2Nk1ot0PVu5mQbErN4+b52cuvuCOJQh3sPy0PB3pLjKv8x2Neb0jH
	T3+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/S5AgaoFcF+8ILSX7U4z1UURPfgKe3FVJAlspzptHGg=;
	b=QUmNyV7bOgI+M9fngI7mb1Jb9bFrmpFulLeArUoDHOMnrOCH2CpX98OIZXKuNIGrZd
	5B8gVONJz+SFJzInnlkSfB4GRRcHnlGDvicJZvlScUG8CjUjZr7qe9O8tpXqd+Uj1XB0
	rOlIapE7JZZZcbB+TQEf/ir1PqpstPybyG6CQQSfnf8dEYYznlvAFHcDaEbegGB8XObO
	xI5B1+WdC6DorVKsZV/O2Um6l9UX6PwhGAQDYmNfO2HR/blGgFRu6ny2GdD/dW1sNrBx
	vEXQIPem4/+VLvdhjjS3BUieurFC3X9gRkexgol2ZJ5shKSJtTg2WiVtAFFkQAl1lPm6
	Ia2g==
X-Gm-Message-State: AMCzsaUpiFST3/RGz9AYiPtNrT18rD0hi07ZIITvgqVwbrBEuoJ9RJjO
	Y11ebJyO3jIiPvbuswzrqYSP6aHel2x02glYvqY=
X-Google-Smtp-Source: AOwi7QCBPqJbh5kWB35afPAbFB8dmcvqNTWhEqY8BcFeXvLkSaNbYHi++YPSFBNQMZ2vDlynfPhDAmRDKfS1q4wwcsE=
X-Received: by 10.84.177.129 with SMTP id x1mr9749433plb.161.1507567829022;
	Mon, 09 Oct 2017 09:50:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 9 Oct 2017 09:49:58 -0700 (PDT)
In-Reply-To: <CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Oct 2017 09:49:58 -0700
Message-ID: <CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 Oct 2017 16:50:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 9:16 AM, Paul Barker <pbarker@toganlabs.com> wrote:
> On Mon, Oct 9, 2017 at 5:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> wrot=
e:
>>> On Thu, Oct 5, 2017 at 3:35 PM, Paul Barker <pbarker@toganlabs.com> wro=
te:
>>>> On Thu, Oct 5, 2017 at 3:31 PM, Burton, Ross <ross.burton@intel.com> w=
rote:
>>>>> On 5 October 2017 at 15:23, Paul Barker <pbarker@toganlabs.com> wrote=
:
>>>>>>
>>>>>> So my question is: should we just set GO386 =3D "387" so that it app=
lies
>>>>>> to all go binaries and accept the slight loss of performance on x86
>>>>>> systems that do support sse2 instructions? Or should we make this
>>>>>> MACHINE specific so that sse2 instructions can be used where
>>>>>> supported?
>>>>>
>>>>>
>>>>> Definitely machine-specific.  Need a way of mapping from OE tunes to =
Go
>>>>> options that control the instructions used.
>>>>>
>>>>> Ross
>>>>
>>>> Looking again, we already have go_map_arm() in goarch.bbclass to set
>>>> HOST_GOARM and TARGET_GOARM. We probably need to do the same for the
>>>> GO386 variable.
>>>>
>>>
>>> I'm looking at what I can use to determine if sse2 is supported for a
>>> given machine/tune.
>>>
>>> In TUNE_FEATURES I could check for "core2" or "corei7" based on what's
>>> in oe-core, but not sure this will cover tunings which might be
>>> defined in other layers.
>>>
>>> Alternatively I could check TUNE_CCARGS for "-msse2" or later but that
>>> feels dirty.
>>>
>>> Any suggestions on this?
>>>
>>
>> For cross compile there is no easy way, I would think using a map is
>> probably the
>> best thing we can do,
>
> This is my intention, just trying to work out what I can map from.
> What I'm currently thinking is, in rough pseudocode:
>
> go_map_386():
>     if "core2" or "corei7" in TUNE_FEATURES:
>         return "sse2"
>     else:
>         return "387"
>

Perhaps inverse is easier, meaning, set 387 for i586, i486 and i386
and leave the
defaults as it is for other variants

> Then set TARGET_GO386 and HOST_GO386 appropriately. This can then
> determine the final "export GO386 =3D ...." depending on if we're
> building for host or target. Much the same way GOARM is currently
> handled.
>
> Cheers,
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd

