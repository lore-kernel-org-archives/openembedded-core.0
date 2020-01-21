Return-Path: <jupiter.hce@gmail.com>
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
	[209.85.166.170])
	by mail.openembedded.org (Postfix) with ESMTP id CA4287FF89
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 21:13:33 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id s15so3539527iln.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jan 2020 13:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=G827/+B6XF+yxf/GE05liIyyxNwbVES/nxWZXzotPDU=;
	b=DhsCnSsO5tLKHKhB5i2OOGM+Ko8JJEuyvtSHcgR9FZaufDt3ZiLa2NrF4HskDhO39l
	gMAGL6oLfS4JA/yLScJAjV90O+8DheYS1yEd/w3T7pUIUE0kkk22FeDHX3AkkUFT1p/B
	BEq5FKctRiTN5xZUsaGvJJS/Ha1HH3Gacd5rucIzORC+0m77ESf7fYD4DXcNM8fHc8Ky
	JOn0uki3WdkvTY15xwsTsH9Y3cI+cP4saCre8asZjTD7Hjb70m2d2+ZksOAtc/vEjWuD
	AjFpEYikMF5xOIj/pHDT2r/V5p5gbQ5ugJi4EH0sV59EiX+pey3tXbn+dk5Cs3sfUtjY
	6KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=G827/+B6XF+yxf/GE05liIyyxNwbVES/nxWZXzotPDU=;
	b=MxMOPHX25jqlzdBnfQQCdTC/bUKxC3vAJA4ysCWGSaC7DvYtm/IiBAofVhe/7BRNTF
	wfMcnlptGKD5EMH9vt91i1grTPwJAOE85abZLWa6gEFhueKE0tKL1RMSGKP6TqY4W0me
	PhS5yGKRLXgu7kOFPoZxxJsUuB+R+wKL3i1NbDPKM8m8Gh94PLgk3+XTPw4l/ZfrPRvN
	R64/kqDzksl6NieYAyCMFZSZvTsMUk/BZHDBC0MiokXGZM/6q1L4WN8s5SKsjO0aLAUe
	+wQdaRwnEyrcCI2iCq5jGjI9hXA69s9w8XUIiWBBN9A0CJELaq46qehScTrf9sBtkui9
	8j9Q==
X-Gm-Message-State: APjAAAVB52L8rygQRekXWqmnOcKdTitWhqb4vuZjlk2rpS7+KNxp8bjm
	9CQN0ygwldGif0HAWLa+hyBr/09TES8Y8Vgp7N4=
X-Google-Smtp-Source: APXvYqxvcck+tfTJAwpeBys3LAOphoqXxv9jbxfZid3o2Yqj8npNvyRwXwo6JE9wM1/lzrEc4J1VgSA9xwY/mFjXEd4=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr5615507ilq.192.1579641214859; 
	Tue, 21 Jan 2020 13:13:34 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ac0:e345:0:0:0:0:0 with HTTP; Tue, 21 Jan 2020 13:13:34
	-0800 (PST)
In-Reply-To: <4e3bf60b3f87b1c87a0fdb5016239414429bf499.camel@linuxfoundation.org>
References: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
	<4e3bf60b3f87b1c87a0fdb5016239414429bf499.camel@linuxfoundation.org>
From: JH <jupiter.hce@gmail.com>
Date: Wed, 22 Jan 2020 08:13:34 +1100
Message-ID: <CAA=hcWQN-EPQasgE5cKYmMFHE-7Pc6-c3XLBxn8CwdyFwwXK6Q@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Could oe-core be infected by virus?
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
X-List-Received-Date: Tue, 21 Jan 2020 21:13:33 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thanks for your response.

On 1/21/20, Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2020-01-21 at 22:21 +1100, JH wrote:
>> Hi,
>>
>> I have been using thud version to build imx6 image for about a year,
>> it was all good until my last image built at Mon Dec 23 2019.
>>
>> The image was booted fine in the first and second times, then in the
>> third time, it broken, the boot could not be completed. The wired
>> thing was that image injected so many new messages, including
>> "Welcome
>> to OpenEmbedded nodistro.0!" I have never seen in previous built
>> image
>> boot. Here are new messages in booting, which were never seen in good
>> normal image booting:
>>
>> ..................
>>
>> [    0.440012] No ATAGs?
>
> Those messages all look fairly normal parts of system boot up so I very
> much doubt any virus is involved.
>
> I suspect many of these have always been there but maybe directed to
> different consoles which you weren't using.

No, no change to consoles, but I'll double check it.

> Something has probably changed on the device with the bootloader to
> kernel handoff and its changed the kernel boot parameters and console
> setup. This is now printing things on the console you've not seen
> before.

I am sure I did not make any changes to bootloader on the device, no
change to kernel, no change to console setup, the only changes were
applications, which are nothing to do with this problem. Having said
that, I'll double check it.

> The no ATAGS may or may not be related, I don't know what your system
> did differently.
>
> So if it was me, I'd be looking at how the bootloader and/or kernel
> commandline has changed with your last update.

I am not too concern about different message, but it looks like a
different system to start Bluetooth, ALSA, can, NFS, videodev, vgaar
which was weird, that device does not have sound, video, and
bluetooth. But the real problem I posted here is after 2 - 3 good
boot, the boot failed with so many errors of Failed to start udev
Coldplug all Devices, Failed to mount FUSE Control File System, Failed
to start Remount Root and Kernel File System, it seems it was
completed damaged by something which I found no clue for it.

Let me clarify it again, when I test the boot, I just switch it on,
shut it down, turn it on again several times, no thing injected to the
bootload or kernel, no thing was deleted. Has anyone seen that
problem? Appreciate if you could explain what could cause that errors?

Thank you very much.

Kind regards,

- jh

