Return-Path: <pbarker@toganlabs.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 75FA96FFFE
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Oct 2017 16:16:11 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id i124so23873243wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Oct 2017 09:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Xq/7qeNNP3S6nOD/o5P8ev8urzHJnKESocLrqc4XxrU=;
	b=i45nkvwEBdYg9pHubelD5icbfB7SidEAzDxOgf7Rji6ABnM+WjsmR7Ebem1BTqM9LS
	zvQhLDaXE8JyBXfgZv/+O6JMjgtzSl+GpSLrM6uUy63iPP1UoowDOrKebhlJvJmNS+P+
	EWm00xEh2gUPbjs4HAfQ/Dzfvw/xj9ibXq5j7cMAjhDrOsLkQKE+ShATqCznoEtF+Sg3
	VJPYWepPX3Tfs+d6FMIW0wpgwbxYUXV502KzT1gmZvTxDhnw2AU4pqxttkYwmWkPuxMp
	Ax7/HbECSdaCr++WbmFrA2UlTW/AKM9F8AYwCNgrWx4AVDRZHsZQn6MOp3intadRZtKH
	Me9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Xq/7qeNNP3S6nOD/o5P8ev8urzHJnKESocLrqc4XxrU=;
	b=a9yY6zE/fi7Lfv4cEkIbxhgf3GXGA1hZjk/cHkMke1k39ZIYbIZA6W8CNTS/tgI/dP
	2m9oupaznQbnoekU61VnoQtGNfS4CS2ljMLkabGt2TpTOKW0BLAs2aD6aQ1liLgTxaP6
	t9kf2tRtenTFsANvu3uBh7AmEFwBjgzT/pa7FtcLqCeu4wgeyV5nz+VTkst41bbgFNy2
	/wFddArROgDvbd3Ec1k2Ir9RyOFWVt/rblkMY/PJYE4cssjdGGLcuFa9lLAeD2cNwG0Z
	7OoysCIG37bOmJYtkb1KDnPKnawENA5rMndjw4U3nhLUFwrV9en6FfWUcigE/g6VaLuZ
	MUPA==
X-Gm-Message-State: AMCzsaWajX5i/UlTJpVsPZStw9x1iVa0zUIv5Sj+MvgIbkYakNBxwbc6
	k7JpkOP2Kt3CYcKzYtzCmU9kEhEJTPEUFJhLxGdTHA==
X-Google-Smtp-Source: AOwi7QC5yKBJyLh04FwifofW5u8tvxj28qeFTP2rYKefYWMOWDlbHZDgJxjC+BK89ixF4sgwS26XYACmc8lidR85yGk=
X-Received: by 10.28.156.67 with SMTP id f64mr8281388wme.42.1507565772096;
	Mon, 09 Oct 2017 09:16:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.154.248 with HTTP; Mon, 9 Oct 2017 09:16:11 -0700 (PDT)
In-Reply-To: <CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
References: <CAPyrkgxRNsTbD=o7op_xi7T+f85rT3-4XF9d0bvkqVpvphiKaQ@mail.gmail.com>
	<CAJTo0LY8Z+qqGHXuBNAD1_4eS-fXjhL3VcofkbeHfp6aaBGhaQ@mail.gmail.com>
	<CAPyrkgxRjHRF9ALg9QwdUPdXAsetFNb9iUCQZNw+GtJsz+hM5g@mail.gmail.com>
	<CAPyrkgxV9aQvx3frYAJFKuK3jBY7Cv+V8=zFjvvLM-jbK5PH8g@mail.gmail.com>
	<CAMKF1sqQF01x8WOWQRt=jnfBCAsP8_5OSLZnJtPo9QWBu9RGCA@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Mon, 9 Oct 2017 17:16:11 +0100
Message-ID: <CAPyrkgwgE2SKjh8ODxVRku2E3VmHKJLF8sBUL7Mzd4gAWnJ0jg@mail.gmail.com>
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
X-List-Received-Date: Mon, 09 Oct 2017 16:16:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 5:04 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, Oct 9, 2017 at 6:15 AM, Paul Barker <pbarker@toganlabs.com> wrote=
:
>> On Thu, Oct 5, 2017 at 3:35 PM, Paul Barker <pbarker@toganlabs.com> wrot=
e:
>>> On Thu, Oct 5, 2017 at 3:31 PM, Burton, Ross <ross.burton@intel.com> wr=
ote:
>>>> On 5 October 2017 at 15:23, Paul Barker <pbarker@toganlabs.com> wrote:
>>>>>
>>>>> So my question is: should we just set GO386 =3D "387" so that it appl=
ies
>>>>> to all go binaries and accept the slight loss of performance on x86
>>>>> systems that do support sse2 instructions? Or should we make this
>>>>> MACHINE specific so that sse2 instructions can be used where
>>>>> supported?
>>>>
>>>>
>>>> Definitely machine-specific.  Need a way of mapping from OE tunes to G=
o
>>>> options that control the instructions used.
>>>>
>>>> Ross
>>>
>>> Looking again, we already have go_map_arm() in goarch.bbclass to set
>>> HOST_GOARM and TARGET_GOARM. We probably need to do the same for the
>>> GO386 variable.
>>>
>>
>> I'm looking at what I can use to determine if sse2 is supported for a
>> given machine/tune.
>>
>> In TUNE_FEATURES I could check for "core2" or "corei7" based on what's
>> in oe-core, but not sure this will cover tunings which might be
>> defined in other layers.
>>
>> Alternatively I could check TUNE_CCARGS for "-msse2" or later but that
>> feels dirty.
>>
>> Any suggestions on this?
>>
>
> For cross compile there is no easy way, I would think using a map is
> probably the
> best thing we can do,

This is my intention, just trying to work out what I can map from.
What I'm currently thinking is, in rough pseudocode:

go_map_386():
    if "core2" or "corei7" in TUNE_FEATURES:
        return "sse2"
    else:
        return "387"

Then set TARGET_GO386 and HOST_GO386 appropriately. This can then
determine the final "export GO386 =3D ...." depending on if we're
building for host or target. Much the same way GOARM is currently
handled.

Cheers,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd

