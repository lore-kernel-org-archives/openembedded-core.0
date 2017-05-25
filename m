Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id DBBD377FC7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 02:47:29 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id d127so50249398wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 19:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZBKpIuQZIzpJNOL9ySJ8/MI0azm/JgxvpWzDwQVM1H4=;
	b=nArlHYpUmp6g+4nu/UPYd9cOBhZOwBE9duYuNYU2UoVAxn2ocsILiQiSgjrCIR2UNd
	zgjCzcRAllGrhay78Q7DXM6UnNb6A9+3wYzfhddXT92oyTJGJT8GKMLkI/ZtXeIMFjJ6
	Kh+8CYpjM6C+nOt2a6aXDJMJWhXRec4iM0Iu1bP7Mo+7nThpM/pVdSO3yKguKGN4aXXQ
	4ujpmbuuN0MJGUVC7l5ynuGZK4R4J3WOnbT/j4qpyHylvPxiRh+vuEw/oREYLmlmKZrM
	P/ZHO22RXJFtIqnxVANnkbVGIG0ZJ78mD1SVQyWR/jH6wNU8I6Z9hh1zx4H6E2xX1bJ5
	3tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZBKpIuQZIzpJNOL9ySJ8/MI0azm/JgxvpWzDwQVM1H4=;
	b=dJhcr8UY7pIZkep1mRb0KP9kmyRBXF0ug75vJyXZyJmTEM0XXS6JGMAqz1XDEiNjeL
	pNA+1bb0BXS+2sNShC7DjgIWmsQevrNwCleP4aFA2x8alQQ3z7LxZu+AfwK9rmYMSlqP
	kzs4L1JRjZBEMDh4k5/bGXUIkRkSewhgc5rfRrxiZuJoyS/bEI5x6dPCUScBYli1aA+A
	W8H5VXinTN2J4Usgh2LgBetyqUg4QE+HGlj4n152Ze8bGtjM4hAMmTFYWRS8iztPVnHm
	TqilziOD6IbSIc3tyCKPdicWxcjOHE4C6aPExOeGnT4otZa04fdlvnAH8+H1mEONUTeL
	pJ5Q==
X-Gm-Message-State: AODbwcAAyv6QnSnyL2I3xUwMxtm9Yz9Mr45hAuFmxDQGXmwlIIpY8aIY
	VDYip1DTyqm6chuwx/uPi4/RRA7WPw==
X-Received: by 10.80.143.227 with SMTP id y90mr20167729edy.131.1495680450120; 
	Wed, 24 May 2017 19:47:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Wed, 24 May 2017 19:46:59 -0700 (PDT)
In-Reply-To: <CADkTA4OFuN3c1QoevxzQuUT5zNSxmMPxooWwKLhu2aeF_vbb-w@mail.gmail.com>
References: <20170522050042.42403-1-raj.khem@gmail.com>
	<20170522050042.42403-11-raj.khem@gmail.com>
	<CADkTA4M-3HipxJL7GnE9FJkK1hKJQ9EOjJpvUpyom8WNgbcGnw@mail.gmail.com>
	<CAMKF1sqBtBGzB_o_eM5SYhG+mS=kNqspYQDEu4dOe=FT70HSqA@mail.gmail.com>
	<CADkTA4NZ2E7TPb7-Awd4d_ZsWCB8Zz2Xv06VzUOnbWY5VFAUpw@mail.gmail.com>
	<CADkTA4OFuN3c1QoevxzQuUT5zNSxmMPxooWwKLhu2aeF_vbb-w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 May 2017 19:46:59 -0700
Message-ID: <CAMKF1sqnqBr9wZwnHoozcE1swutjaRQyuEnLFMh0p6THcGybtg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 11/15] linux-yocto: Enable drm by default
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
X-List-Received-Date: Thu, 25 May 2017 02:47:30 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 24, 2017 at 7:40 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Tue, May 23, 2017 at 3:36 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
>>
>>
>>
>> On Mon, May 22, 2017 at 1:06 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>> >> +SRC_URI += "file://drm.cfg"
>>> >
>>> >
>>> >
>>> > If anything gets added to the default configurations, they need to go
>>> > into
>>> > the kernel-cache
>>> > and then be included by the relevant kernel types there.
>>> >
>>> > If you want, I can take care of switching things to that format.
>>> >
>>>
>>> yes please.
>>
>>
>> Will do. I'll make it available to all active kernel versions + future
>> ones.
>
>
> As it turns out, we already have a similar fragment for vmware guests:
>
> cfg/vmware-guest.cfg
>
> --------------------
>
> CONFIG_VMWARE_BALLOON=m
>
> CONFIG_VMWARE_PVSCSI=y
>
> CONFIG_VMWARE_VMCI=m
>
> CONFIG_VSOCKETS=m
>
> CONFIG_VMWARE_VMCI_VSOCKETS=m
>
> CONFIG_VMXNET3=y
>
> CONFIG_DRM_VMWGFX=m
>
> CONFIG_DRM_VMWGFX_FBCON=y
>
> CONFIG_FUSION=y
>
> CONFIG_FUSION_SPI=y
>
> CONFIG_FUSION_FC=y
>
> CONFIG_FUSION_SAS=y
>
> CONFIG_FUSION_MAX_SGE=128
>
> CONFIG_FUSION_CTL=y
>
> CONFIG_FUSION_LAN=y
>
> CONFIG_FUSION_LOGGING=y
>
> CONFIG_SCSI_MPT2SAS=y
>
> CONFIG_SCSI_MPT2SAS_MAX_SGE=128
>
> CONFIG_SCSI_MPT2SAS_LOGGING=y
>
> CONFIG_SCSI_MPT3SAS=y
>
> CONFIG_SCSI_MPT3SAS_MAX_SGE=128
>
> CONFIG_SCSI_MPT3SAS_LOGGING=y
>
> -------------
>
> To stay consistent with that naming, I'll call this virtual-box-guest.cfg,
> and it can be enabled
> via KERNEL_FEATURES when needed.
>
> I'm hesitant to globally enable it, since we don't need those modules on all
> linux-yocto
> kernels, just ones that are going to run on virtual box.
>
> I could enable them for qemux86*, since those already have virtio configs
> enabled by
> default and these have a similar goal.
>
> Thoughts ? I'd like to make sure that sounds reasonable, before spending the
> time to
> make the changes and test.
>

I would suggest to enable them by default since these are modules they
dont impact the size of kernel itself. Then we can use recommends to
choose them in machine configs.

> Bruce
>
>>
>> Cheers,
>>
>> Bruce
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
>> at its end"
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"

