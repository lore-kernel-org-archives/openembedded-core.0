Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 583B272F42
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 17:01:23 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id k4so25297307wmc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 10:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=mxKm11nRqw3HrXDwK+zsJL+MOD2nJCXWWwPH/qDlz/I=;
	b=vfiQ0zr/iJZgGFyRDcNSvrvg1TyybA77HrTtRXrlQiKVeXomTewBKVNzLDU3qJhux9
	+lJJAWHzlPKXWVF1lbonY7po0fdc7y70R6L+2HQzYafkZDJuaKK1eUVREdCuUL3ryg7M
	SEvN+D3CvonmRw8XVgdta8UAzQJDBgrLwCEQb7/Y1yPjKZmIUTMQcuR0wDfNQs2/8u1J
	FcOa6sXeh/3ekP5XhVmc8KWH3W+giAYit5+pFRolo3T0sjkS4xWje97JsvBl81SKy44W
	5O9eKkIuFFs4L9HY9m/yjV6On2cOj71nDq9ZiFrBBrQtZXDA8HSLxgjKUOtYhEO9L0Yq
	auTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=mxKm11nRqw3HrXDwK+zsJL+MOD2nJCXWWwPH/qDlz/I=;
	b=lbKULEkWEH9YqRCclPj36qdDHRyOYOljPvSpoJF3nCB+QUN4c0m4+qYO1VQf6bD5y0
	EI66kVB0W8+Dj28bZ5M3c+oSXK/Pco5IM5VJd/Psz5giNnEagk4tes+IoioHhPWGiKfd
	USL9jH79i7SLMBD0G7HQtaEMa+sVDFK7pwffdS1mocqo1Gn6GfFMzVv9QBqTXvkje5Yl
	+JpuquIFFEClnlWAocOKtEhcdxaY4biVeLSNULEbFB7d/J4dT/pS4Ng9tAvXNSc3+cOt
	Rznm9qsCxqSFPkG6LGKy1YtVG0iT563Vjlo+NLf0Y25s4ABBi9l7ts9yj/E/nPlY2i6a
	h9/A==
X-Gm-Message-State: AMCzsaXA9kGrgEZsrWO6WgqryIa9tEWrX4jqxYQaTRUQF+JZybkRgGxF
	khdX6panXIEV9t3Pk1Ju3Ds1Zjc3dzjat3lQ93soEA==
X-Google-Smtp-Source: AOwi7QBcQJ9H0IvjMMaGdz0aIDLcnZxxqIK0aiLsdx5417EVQtYzbDBrScSpb+t63F9r0seOsZhMdi5hFV4TIqIA/zk=
X-Received: by 10.28.20.80 with SMTP id 77mr8232339wmu.154.1507568484988; Mon,
	09 Oct 2017 10:01:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Mon, 9 Oct 2017 10:01:24 -0700 (PDT)
In-Reply-To: <CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
	<CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
	<CAMKF1somGhHGW_0i=2eBB9xkB+6Fkcv5PUK8Yp2evtvWzHbB6Q@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 9 Oct 2017 18:01:24 +0100
Message-ID: <CAPyrkgwhNAh+q1cPayXa=DV7x3K_T8T2YL4h=kfOiiz4CimJdQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 09 Oct 2017 17:01:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 5:49 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Oct 9, 2017 at 9:16 AM, Paul Barker <pbarker@toganlabs.com> wrote=
:
>> On Mon, Oct 9, 2017 at 5:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> wro=
te:
>>>>
>>>> I'm looking at what I can use to determine if sse2 is supported for a
>>>> given machine/tune.
>>>>
>>>> In TUNE_FEATURES I could check for "core2" or "corei7" based on what's
>>>> in oe-core, but not sure this will cover tunings which might be
>>>> defined in other layers.
>>>>
>>>> Alternatively I could check TUNE_CCARGS for "-msse2" or later but that
>>>> feels dirty.
>>>>
>>>> Any suggestions on this?
>>>>
>>>
>>> For cross compile there is no easy way, I would think using a map is
>>> probably the
>>> best thing we can do,
>>
>> This is my intention, just trying to work out what I can map from.
>> What I'm currently thinking is, in rough pseudocode:
>>
>> go_map_386():
>>     if "core2" or "corei7" in TUNE_FEATURES:
>>         return "sse2"
>>     else:
>>         return "387"
>>
>
> Perhaps inverse is easier, meaning, set 387 for i586, i486 and i386
> and leave the
> defaults as it is for other variants
>

Sadly that won't cover it. We'd also need to cover Pentium variants
pre-Pentium4 and early AMD variants. It's SSE2 which is needed not the
original SSE instructions.

Do the names in TUNE_FEATURES match those in
https://gcc.gnu.org/onlinedocs/gcc-7.2.0/gcc/x86-Options.html#x86-Options?
If so I might be able to build a rough map from that documentation.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

