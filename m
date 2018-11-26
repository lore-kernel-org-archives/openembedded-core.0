Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8A1236C4B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 22:16:55 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o89so13437991qko.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Nov 2018 14:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aUmzefTNN12M2cNYSDSJpy2u8o9DGmoiwwqJVWcUoUk=;
	b=tBpKZeDNV4fRCyDSpOSYwNexuxoZ7jktlnWfob+vklkosBX0jIO9qFHjW8tfNFrXIj
	Wr5lQGOeYd+9Wzc2k4LHrFY9I7k5TwRzV/Z9AHuYdIVpZMJeEPawR/EQGmDzAn/y9zkn
	5zcYUphqbuq5YxLszBhbAp9toRMSpt/mKRao8vbSYiNfhelVIKiROQ+4475F9MoJKJIA
	MvKXWwEQshQ4f+TdJm3Vm3Swg4KrwVZt+kvzcSEDurnJeYdt+bYlmchF5JUNUNjT63BC
	LfnzDt6R7zb7zVn19bHryITa/uUybY4iRtSGScvMPFR/XZgGSn0pHw9G45Qq6OjkCZ43
	b8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aUmzefTNN12M2cNYSDSJpy2u8o9DGmoiwwqJVWcUoUk=;
	b=siV59oIo4i3ax2bEhQfQJzi+09v6IbfHo3NnD9OArBXspTBFLBCioNBzmtR09w28GT
	HDvPQC08FXey9BqzHE4yVZPfAd8KHh1jiBUIyMupktiEMtYw6U/ofQ3z+lgJ4TGgC7ZG
	HiqCV2P7R6rwWmx8KbhqRwBCoTGOcjIbdwJuOerT04Ud0WtmUbBCsOfeOa7OLm79GcRc
	tIFG4wpeGDd9tlFgXyjZd6nJxsZOUZS8yCjbF/Prn9kVY7ZQUcYR4GnEOcQR3G/HOkp6
	SMaje00jscXfJsUVe9Rwah3lKJvHhGySfHvTGfp59u/Kh2CUysmtzlewdySRBF+lME2U
	p2kQ==
X-Gm-Message-State: AA+aEWYk+LCHBuHQl6bA34EPvNvtQhteXk6IR8/+chorOY9wUxWA1mR+
	OaIALEq+ACVhCeCglReM8X9VlCmA6yB1DSJFuT8=
X-Google-Smtp-Source: AFSGD/V72/Ax8Kf0Q6KP3cNLS/dcmXxxzgS8ENwT0M1aT2hdPBg8Ime5nra+mb+7IDiP3hSl7sYuPteZwotTudjIvNE=
X-Received: by 2002:a37:d408:: with SMTP id l8mr27160856qki.315.1543270616023; 
	Mon, 26 Nov 2018 14:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20181122225820.2553-1-abrodkin@synopsys.com>
	<CAMKF1sqbHtV1UYiXre_1sNEzyFWJw3mRs_hcuVzu+us_r0OWVg@mail.gmail.com>
	<8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
In-Reply-To: <8950e9f58055a8667d20ff83de1f8acd14b7f303.camel@synopsys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 14:16:29 -0800
Message-ID: <CAMKF1soUiWrDmyGq-Y04PgKRB=oSw+mW8ieNQFxSz8OsViAPOQ@mail.gmail.com>
To: Alexey Brodkin <alexey.brodkin@synopsys.com>
Cc: Marek Vasut <marex@denx.de>, Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v7] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 26 Nov 2018 22:16:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 26, 2018 at 1:30 PM Alexey Brodkin
<alexey.brodkin@synopsys.com> wrote:
>
> Hi Khem,
>
>
> On Sat, 2018-11-24 at 06:57 -0800, Khem Raj wrote:
> >
> > http://errors.yoctoproject.org/Errors/Details/202185/
>
> Looking at the target name "u-boot-tools-1_2018.11-r0 do_compile"
> I think it might have something to do with bump of U-Boot to v2018.11
> and the error message in question was added in v2018.11-rc1,
> see http://git.denx.de/?p=u-boot.git;a=commitdiff;h=a4958a71017fb142542f977c843c5fce769fc6ea
>
> The problem is we use "sandbox_defconfig" as a dummy defconfig
> because otherwise (not configured) U-Boot's build-system won't
> allow us to proceed and in its turn mentioned patch adds a check
> for a target platform like "if defined(__x86_64__)" which
> we essentially don't satisfy and so we fail.
>
> There're the following solutions:
>  1. Revert mentioned patch
>  2. Disable "CONFIG_EFI_LOADER"
>
> Reverting is not nice and not future-proof.
> Disabling of "CONFIG_EFI_LOADER" might be done in a couple of ways
> like:
>  1. Patching sandbox_defconfig
>  2. Filtering "CONFIG_EFI_LOADER" from "sandbox_defconfig" right before
>     execution of "make sandbox_defconfig"
>
> I think latter option is the simplest and cleanest.
>
> Should I send a patch for that?

seems ok. Please do

>
> -Alexey

