Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 439577197A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 21:21:34 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id z19so32306596qtg.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 14:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jap0Jx7slJmyWb9hGIn1DtcUouO4Lyv6wUs7W+sxb+0=;
	b=Y8U5thqCn7P7hB6T0YaXvPlY7ye08RtJmsvqTj5rS42UwfDYoWWNwfV3ztQO2Pv/FH
	YRz+EzEUYahkcf/7LSNLGRWqW8xqSY76msKl2cRqxDpARdAzh+ouWNlS8iSFbWkwl+la
	gBPt3jOWQVhEo8dtBBwZ8gGRC2gMAnjC3Oz2U6t2ixmvosVIyJG0ur4KCo5hhkAvXtA3
	RQYaXGrl8rkkKFEzB99WUpSNSEHIfxikkl5ZjCu30NwF7qa40jyNu7poVyx6jArpEdbh
	erPbEk48z7BZSn+kSjaqNWSid2WFCXOxaHMBFzNrnHyaWpUxW+tIFx1ZJhi5Scv4vuKa
	iEuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jap0Jx7slJmyWb9hGIn1DtcUouO4Lyv6wUs7W+sxb+0=;
	b=hY2YZSXzg4HVP9lplvdX3jtBvizHhpOfTkTaqtcbO+GlbJmaf6wCsAzvkBZymtxQQQ
	hLCjdZjkTTLUeap9shmfUymWpOQihty+tOREz0iBfLNAlx6xnRQ0wVRwU39ut8KWdUuN
	EjDsPZo1ybFnYWXa+IvLCH4jtKKzVMay/XbPDdnQM5fL6k23AJs0wXy4e3uyK0epYkhN
	NhQ13GMyizUyTCjCckM/4rkUCWEss5hQxMM84+g7gCZwFzP3UaYVgEvzVpmO1eX675nP
	ybgein+MShloBoGsCl4DTcA2KG0/a5Iju/4ImSpGkEQbBWY6BBzTJcagXq9/cd9mSxZW
	8RUQ==
X-Gm-Message-State: AMCzsaVTr6aXoN/p5KG/a0UnvKPBMwJfpa/F3l+feBinbvZ7zV2qMjuX
	WOwqNKldPReruF8ZCa8wTN1RP/4AoudmlZNc5Hs=
X-Google-Smtp-Source: ABhQp+R14DUmzBPzDf9aCT4l5i7XrjISlVuWiFj0AN7wS9nPF4x4dvXufoBrmwKDKGimYvdMVmPdoMdN79Tuh66ye+k=
X-Received: by 10.200.48.103 with SMTP id g36mr27568123qte.289.1508880096123; 
	Tue, 24 Oct 2017 14:21:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.182.80 with HTTP; Tue, 24 Oct 2017 14:21:35 -0700 (PDT)
In-Reply-To: <1508879860-7170-1-git-send-email-mark.asselstine@windriver.com>
References: <1508879860-7170-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 24 Oct 2017 17:21:35 -0400
Message-ID: <CADkTA4NE9C6mv=pcsHQ78wSEf2ewDyyC3Yr9G2P2Fd+YNMZCfA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [IGNORE][PATCH] linux-yocto_4.12.bb: Use AUTOREV for qemu* BSPs
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
X-List-Received-Date: Tue, 24 Oct 2017 21:21:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 5:17 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> The kernel we ship as part of product may have newer commits beyond
> any SRCREV captured in this recipe. Since the assignment operator used
> here is an early assiignment it could be argued that we could simply
> overwrite these in a bbappend, however, between layer order and
> priority and our desire to allow folks to set their own assignment it
> is most prudent to change these to AUTOREV here.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> Richard, Bruce,
>
> This is being sent only to conform with YP compliance and I don't
> expect or want this applied. No need to respond in any form.

.. but I can't help myself.

I find that patch, really, really odd. Compliance or not.

Bruce

>
> Mark
>
>
>  meta/recipes-kernel/linux/linux-yocto_4.12.bb | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.12.bb b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> index a262409..919bf31 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.12.bb
> @@ -11,14 +11,7 @@ KBRANCH_qemux86  ?= "standard/base"
>  KBRANCH_qemux86-64 ?= "standard/base"
>  KBRANCH_qemumips64 ?= "standard/mti-malta64"
>
> -SRCREV_machine_qemuarm ?= "67b62d8d7bd9f19f0f4fad044787d947ebc4ec25"
> -SRCREV_machine_qemuarm64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> -SRCREV_machine_qemumips ?= "371926551d44c140a0fb869cec34762b40bdf1a6"
> -SRCREV_machine_qemuppc ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> -SRCREV_machine_qemux86 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> -SRCREV_machine_qemux86-64 ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> -SRCREV_machine_qemumips64 ?= "9d63d9c11c44ceabd452d7ee49cf55a88c39383f"
> -SRCREV_machine ?= "16de0149674ed12d983b77a453852ac2e64584b4"
> +SRCREV_machine ?= "${AUTOREV}"
>  SRCREV_meta ?= "eda4d18ce4b259c84ccd5c249c3dc5958c16928c"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-4.12.git;name=machine;branch=${KBRANCH}; \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

