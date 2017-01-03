Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2DAC26E650
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jan 2017 17:14:29 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id v2so18161385uac.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Jan 2017 09:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=97GG68XAxYMqQ92s0DSP1NaAihkhts4ypXkwsB8Z8jg=;
	b=ZcHsLyUL+7jgu4RoI/Hfvm4l3qrUfTrzmnHwvRu7qjsy8zOiN47CzW5C2VzlQjH04s
	UQ10I88WnQVaAVl6NzuR2fhcfGW++Pw7tsl3DHeCOTOrUC3zEwQV6/E4NpJSSBQD6eN1
	DsmcAC0aLtp4JPb/DJX/QWKx3Z/lopKfGhtbf8w2nZrf9Cm77OcS0elCgKYcfzg2cMAv
	pVu4D4p2ALgVbErQBju7AKYcFITorcXzDOqj/ErUJrFncaL1MJ6pKlJ2W1Ygnz3UVM9I
	9sYjFZs9EYsHPe6rKL+pEqxt1ljwGoGBkpRHK2ip+Bm0zQKFEU8Us9ddtP5tRxbp4vzh
	7lJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=97GG68XAxYMqQ92s0DSP1NaAihkhts4ypXkwsB8Z8jg=;
	b=oxohSnF8sIBv3FhWu6EIAtbeoABSq4jhZG8si5qzrzCyUAVcXdJgqrzDLWq3KD+XDX
	0sFsGzJyxf86EqySd58PR54CTAlZ3fepIzOvHC1VihS5UwQlDNao+pQXthPqUXuZv9yj
	u3QQmaysvvQnIH/+BHB9gkVn01dgZTamq+/CLBNL7x/QMEV0ctuA/nRim5h8O+StxKbk
	u0mmelAZvD06G9XfDbZhT2m6uW7qY1hZDjSjmQfvUkjbPCHnhQhnRrOn6+pzADgvxu3g
	xfjNUwHrYiqujLsqd58wYJPakkPCl6WITqpBaANRTAjdTYNG+TgjBM8XPPdykmW42T9K
	12yw==
X-Gm-Message-State: AIkVDXI8MM3ebm8xp1j0md9YWYrmjwNtm17RqXRpwRQe1t7W5Qg7OPnCU+wt/B0MmVVh/XEk+49IFLq2Y6Vp6Q==
X-Received: by 10.159.48.147 with SMTP id j19mr43145089uab.6.1483463670006;
	Tue, 03 Jan 2017 09:14:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Tue, 3 Jan 2017 09:13:59 -0800 (PST)
In-Reply-To: <80e2a281-3a69-3ea6-e46a-01b56acc947a@retotech.se>
References: <80e2a281-3a69-3ea6-e46a-01b56acc947a@retotech.se>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jan 2017 09:13:59 -0800
Message-ID: <CAMKF1sq6O2SXZ_Y65LXFBsyfrVy-rXx1xLV-NuhF1APmeVwzxw@mail.gmail.com>
To: Ola Redell <ola.redell@retotech.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: questions on patching
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
X-List-Received-Date: Tue, 03 Jan 2017 17:14:30 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 3, 2017 at 7:21 AM, Ola Redell <ola.redell@retotech.se> wrote:
> Hi all,
>
> I am a bit new to sending in patches to a list like this and specifically to
> OE-core, so I need a bit of guidance.
>
> I have a fix for a bug I found in Jethro in the kernel.bbclass and I have
> tested my fix there (update-alternatives needs a full path also when
> removing an alternative). Now, the bug is around in many different branches
> (laverne, krogoth and master for sure) but that particular patch will only
> apply to Jethro.
>
> I can make a patch for master but would have problems testing it thoroughly
> there without spending quite a bit of time (which I don't have at the
> moment).
>
> Easy questions:
> How should I proceed?

Master should definitely get this patch first. Then you can send
backports for release
branches that you are interested in.

> How do I know what branches are actively maintained and for which patches
> are welcome?

https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
https://wiki.yoctoproject.org/wiki/Releases

>
> I should have asked these questions before sending my earlier patch for the
> kernel-module-split.bbclass since this holds for that too.
>
> Thanks,
> Ola
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

