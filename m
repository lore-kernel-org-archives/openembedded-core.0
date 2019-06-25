Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 836707CECF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2019 04:46:24 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id s15so16972973qtk.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Zk8tAxcikQnBWCLuXMgovLwRQS/uWf79Qj8TKuUKMMc=;
	b=TGEvyvLwT9+F50YXRzkdUiRWlb/OaGHvfLjzJqCF/xgRFx/bSAcxEiQFToIdigsV3u
	l9F5dxS11rK24S8cpZ+Z6O4gfCtfg93e113PGUKfRpkvC725Ytd2b863//E5JnuJvx1K
	snWcI9n6G9g1uFRhqsHeiXr7J0TbMLUt+SK/Syu8BATQ73ks+ep55Q28Ow+62gYdYZaR
	C/kWQxfZ1wzZjUDreaTcJMgct6YgA0BNTstZAgBRWbCJFHho+ZcGOU3HxbvFBQTXUSEC
	Au4Pwn/4UjMJtD5Xb6COCBX3zHAXp/ycqg3S7Nq/v4XDF7ZcpP4bOL2jO91jzxubNhVC
	IqJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Zk8tAxcikQnBWCLuXMgovLwRQS/uWf79Qj8TKuUKMMc=;
	b=qBIr+6t61vxBGnsrdrzTMiivVghOA+3kckEi1MWqlLdqACEMX6AtACz3ovppderBxa
	a1B9zHmgCkbn9sl+qdOeLpIrgxkO0xyL4cYi8I6fbG1bOdoRR8hSUvQkxYorzrIzZ3LM
	abh0u23o/nSCEvW9518aXfPBHuVPSFvSdv/0lhzbFTaaqAVmJQi72hDJC71NGpN7b9MP
	w0YLP8s+O2Aq3lG8+uPhMMmwHTRn6mNxpcVxUbKEQNRSKmc/Gr+bV7b6/MnaG1XGSVO8
	GzQT9Eq5WLdv7/48BwVKY7WA+1gyX6MOwQfDQKEpddwX+76TZQRhFEfIA757YAA6ODUc
	jXtQ==
X-Gm-Message-State: APjAAAV9CPT610ZgG4vPS8SeJtWAv+8glcS5Cpuxz9U/nQmN8EI99ksF
	1vj1nmzS/OUeq+oQm3DwiydCIRc39fVfFw/Dqgg=
X-Google-Smtp-Source: APXvYqxsw4ErefvHYY0RxbEkegH2961AnC1SrF63c95Hjkdg43k0aNBm+ocXAa/plNh37PWqVnY4E7V60IcU3jC/1mA=
X-Received: by 2002:a0c:b115:: with SMTP id q21mr31419382qvc.68.1561437984933; 
	Mon, 24 Jun 2019 21:46:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190624082750.39458-1-raj.khem@gmail.com>
	<CAJTo0LZ_qVCjoWNNL4wa++BtRXOmRsH5XqK1jjyJD0cb3AA-Vw@mail.gmail.com>
In-Reply-To: <CAJTo0LZ_qVCjoWNNL4wa++BtRXOmRsH5XqK1jjyJD0cb3AA-Vw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jun 2019 21:46:06 -0700
Message-ID: <CAMKF1srVqOQvHwoz5NOp_j5euTKEX0zRv0VL69x+TjTPeCn3QA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] efibootmgr: Pass correct flags to compiler from pkg-config
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
X-List-Received-Date: Tue, 25 Jun 2019 04:46:24 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 24, 2019 at 2:11 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> So why does this build for me?

This happens when TOOLCHAIN = "clang" which is when using meta-clang
when using TOOLCHAIN = "gcc" all works

>
> Ross
>
> On Mon, 24 Jun 2019 at 09:30, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > efivar.h is in usr/include/efirvar directory so it should be
> > added to include search path via -I to compiler cmdline to fix
> >
> > make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
> > | make[1]: *** Waiting for unfinished jobs....
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> > index 0e5a81e316..2f8fa34ee7 100644
> > --- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> > +++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> > @@ -22,8 +22,7 @@ inherit pkgconfig
> >  # The directory under the ESP that the default bootloader is found in.  When
> >  # wic uses a subdirectory, this should use the same one too.
> >  EFIDIR ?= "/"
> > -
> > -EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}'"
> > +EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}' 'CFLAGS=${CFLAGS} `pkg-config --cflags efivar`'"
> >
> >  CFLAGS += " -Wno-error"
> >
> > --
> > 2.22.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

