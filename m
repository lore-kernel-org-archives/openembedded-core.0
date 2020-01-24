Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 043597FD9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 21:19:32 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id c16so3409505ioh.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 13:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=AzY00KsqGYHo5mRanfUahd2SHEDaKK/wnCNf1LilJ8s=;
	b=gNnAgZYXU2qbN/AzaRv25J3/mwypVxIRZsplltL1wXLew5rJWnYO7ppWA5gwPFmLv6
	5cnvAR98JQuChvluMIiHnS9Jo0LrRYz24AyPL47pxOHXHPCwbeRX3f850BkOHsJTJEg1
	SULpzdWmr8pFud3dQCCriuXW6TmIoy9u6TweEsw6j1yU3Imyq0Qzp+TLtO06Km++ubdm
	q/AnLLtuq99B8AgRqsw9x/iyAKo33jKMh5szpGz3Q9KDaUmi4HcPhYcGtUnLprsFmK+d
	45fTv7shikkgm9DorWb7DIjlYT4HHxidzSF5Ne3/D8n38zkk6doX3ifMQMc3FXCmsp6l
	gs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=AzY00KsqGYHo5mRanfUahd2SHEDaKK/wnCNf1LilJ8s=;
	b=bHGF0B23uprdUNJJmftLqqTv/FrHZCPwDjivzU8X2lC/hahI62nJlC/vDAHHtSQMqi
	LfIr2J7dEeNT5a8rlPDb5jeIRnrcWWD64ETrA4dmyfA8tKikvzBUPlMvhdildvaDXjJM
	q6pV26PydE9wdmp1I61AEUEV072qBbNnsxbvoNliL4dUyz6X5tV0BJl+FHNYpPxYj+NS
	6kftR3qvPb3y9ziwaMBNEloduMhhzCiWbrRlAfPWRfOE/bl6nXnHjZA0qut1IhLaV4IQ
	ou/1p15GpiwfEVdiEHTXrkBBcXl5X+HXNMWfUPTpHtYTSg9x8pahDda8Kr1x8MzLhnUK
	TShA==
X-Gm-Message-State: APjAAAVCLK8GNVlozXqeBXf5N27X9TW6ak6yoU9yEGuynahKbOCkZiLE
	FfsgJGtJWJ+QlN1yKnkKj6J2s5YTZkIqWSNvyYQ=
X-Google-Smtp-Source: APXvYqy0F8MGR3vWe/6zIcor5umHE7qT4d4J998XY9Np/tLYHPa0A49zttCm/D1gqa4RcG+PS7oWY7m4b31gf/trA5U=
X-Received: by 2002:a05:6638:a4a:: with SMTP id
	10mr4122274jap.44.1579900773674; 
	Fri, 24 Jan 2020 13:19:33 -0800 (PST)
MIME-Version: 1.0
References: <20200123223449.90548-1-jason.wessel@windriver.com>
	<CABcZANnAW-HYaJmDs8U2iwfzJSb1ig3KsVMvXuz6QjTAR6vqtw@mail.gmail.com>
	<6027c983-71be-659e-5ca8-e203b57f528d@gmail.com>
	<20fa843b-7f99-a2dd-7449-ac5ed4cca0e5@windriver.com>
In-Reply-To: <20fa843b-7f99-a2dd-7449-ac5ed4cca0e5@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jan 2020 13:19:06 -0800
Message-ID: <CAMKF1spsJj5y2Pz2Fn8Z0xhrR00HZM43yeKAqDzUvZvm-a01pA@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] module.bbclass: swap AR and LD order
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
X-List-Received-Date: Fri, 24 Jan 2020 21:19:33 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 24, 2020 at 1:05 PM Jason Wessel <jason.wessel@windriver.com> wrote:
>
> On 1/24/20 1:13 PM, Khem Raj wrote:
> > On 1/24/20 10:19 AM, Christopher Larson wrote:
> >> What makefile change caused this? That behavior doesn't make much sense
> >> given how make processes its command-line arguments.
> >>
> >
> > I agree with you here, it could be a rare check where one want to define
> > what collect progam should be used ( ld or ar )
> >
> > besides, recently we moved AR to be gcc-ar/llvm-ar by default in config
> > metadata, which is not going to work out of box for compiling kernel and
> > modules, so overriding it with KERNEL_AR in
> > module_do_compile/install/configure tasks is good change.
>
> I am not actually sure which part of kbuild is parsing the LD
> arguments.  My best guess is that it is actually all the nested
> gnumake filter calls causing the issue.
>
> With some further experimentation I determined that a space at the end
> of the LD= is what causes it to think the next argument is part of the
> prior one.  The poky distro is defining KERNEL_LD as:
>
> % bitbake vboxguestdrivers -e |grep ^KERNEL_LD
> KERNEL_LD="x86_64-poky-linux-ld.bfd "
>
> The kbuild really doesn't like that space at the end.  You can trash out
> a host native kernel compile module build by adding the arguments:
>     LD="ld " JUNK_VAR="junk"
>
> Attempting to debug/fix kbuild doesn't seem like the right answer.
>
> The next version of this patch looks like what is below.  Would that be ok?
>
>
> diff --git a/meta/classes/module.bbclass b/meta/classes/module.bbclass
> index c0dfa35061..7b0a85a06d 100644
> --- a/meta/classes/module.bbclass
> +++ b/meta/classes/module.bbclass
> @@ -12,6 +12,9 @@ python __anonymous () {
>          if dep.startswith("kernel-module-"):
>              extra_symbols.append("${STAGING_INCDIR}/" + dep + "/Module.symvers")
>      d.setVar('KBUILD_EXTRA_SYMBOLS', " ".join(extra_symbols))
> +    d.setVar('KERNEL_CC', d.getVar('KERNEL_CC').rstrip())
> +    d.setVar('KERNEL_LD', d.getVar('KERNEL_LD').rstrip())
> +    d.setVar('KERNEL_AR', d.getVar('KERNEL_AR').rstrip())
>  }
>

no one else uses KERNEL_* vars, so if modules cant use it then we have
an issue, perhaps just delete it in base class where KERNEL_* vars are set

