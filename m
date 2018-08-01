Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id BC93E78CBD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 22:55:00 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id u11-v6so151711uan.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2018 15:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0Mu3qnablm6k+tCJX4yyUzxIuu0AZh6UzVA7xCZdm5M=;
	b=cA2xnoJRAJSuSb52NcUbZRkFjIt64oz09EEU2ABHH1rFrnTVD5XIpZRFGuWx5DPfON
	qyZHzaXg3wInMTt9iD2tcfmil6h1e6VaHJ1GbPnJ/I4ZjmxGw2NSGD/7q4aKz6nw9TSs
	Agi52czqPaw5Zec0QW67uFekfBTTeE1poZnKQpZ12t8Qoql5LD3Hp2mBlU+Fb19tw7Zb
	pRzICMRnaxNzFLYiIApm9Lj4KerTqEeiliIY7/40uMoUkYU8LW1lWW/TtudcjZojXPT1
	H9oSiNSqCRS/aOlMeCanAlc4ayJRzTPsmpLVb5/3/8SMk6hjO7+uBHgtR0WPwW286fLv
	EVOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0Mu3qnablm6k+tCJX4yyUzxIuu0AZh6UzVA7xCZdm5M=;
	b=Pi4i8s7YjLp3NNFf6EiSPl1xsWLxAeJKAh/whbvf821DQ/qZO9Q32My3kZwXoefgIm
	Dgm8MLB59mNBN+UqvZOL4/Ps6QKESLUefUFHvOQzdCLzJHvF952tT2TKunsIodBaIpfT
	r9U97//14SoKlqxbbStJNOi8bw2WowkvZZlMOcapcobLOCdIInf+lWsJic6AhW6xhYCn
	fgYjoU1epf4bP1VYu/qdkDiHX1pft0LID3lY7nZuPrIdTQooqYgy5h0VFivzDSbg4K5O
	FtBgJmAf1lZleOxJcUGyEgFKKJtpk2HkK2hSJIAdDybVFn7t20pXUlw2Be4Ixw9Rv9kl
	BrkA==
X-Gm-Message-State: AOUpUlEW9ifoOX1t1/Vd29hYI2WYTsHiL1V5bLn93vHW3MfT0weWQZYj
	yOEOuErExX5+I2YccoB4vIbZgK03NQ9AsuRX5HE=
X-Google-Smtp-Source: AAOMgpdTmYY5ANSTYvpO3qE/VLM/UT8c9CvxacolonP1+Ye+i4GT6EFIHTYqc93QMKGEYlZv8D3GZaQv+HKNv2CrgWk=
X-Received: by 2002:ab0:52f1:: with SMTP id w46-v6mr249741uaw.52.1533164101468;
	Wed, 01 Aug 2018 15:55:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Wed, 1 Aug 2018 15:55:01 -0700 (PDT)
In-Reply-To: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
References: <0D62475714C01347BCA118AE7A61400376B2C64D@FMSMSX109.amr.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 1 Aug 2018 15:55:01 -0700
Message-ID: <CAJ86T=W=3iDViBHQhiUnXOVfAbFxCBUbHMzWt886biUnuscq0A@mail.gmail.com>
To: "Ocampo Coronado, Omar" <omar.ocampo.coronado@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Strip kernel modules and signatures
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
X-List-Received-Date: Wed, 01 Aug 2018 22:55:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 1, 2018 at 3:46 PM, Ocampo Coronado, Omar
<omar.ocampo.coronado@intel.com> wrote:
> Hello OE,
>
> While attempting to sign our kernel modules (using the kernel configuration  CONFIG_MODULE_SIG) the drivers in our image did not have the signature, even the certificate was being loaded by the kernel or the driver being signed during do_install().
>
> Turns out package.bbclass, while it ignores to create debug info files it does strips the kernel modules files:
>
> python split_and_strip_files () {
>         ...
>         ...
>                 for f in kernmods:
>                           sfiles.append((f, 16, strip))
>
>         oe.utils.multiprocess_exec(sfiles, oe.package.runstrip)
>     #
>     # End of strip
>     #
>     os.chdir(oldcwd)
> }
>
> The strip is required for many reasons yet it removes the signature which we want to preserve in this scenario.
> To work around this issue add
>      INHIBIT_PACKAGE_STRIP = "1"
>      either on your virtual/kernel bb file or driver bb file.
>
> Hope this helps someone in the future when adding signature to files, perhaps including this into the Yocto kernel development manual.

The better fix would perhaps be to determine which section the
signature information is stored in and then update the code which
strips kernel modules to specifically leave that section intact.

> Cheers
>
> P.S.
> In a linux-intel kernel (master) without stripped kernel modules the image size increased in 650kb.

