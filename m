Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 779467E5B0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 09:11:07 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id r185so415988iod.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2019 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ceml0SPK6hslVlhuFMbuIYMRFHOrQeN6P6wNmQsLnzA=;
	b=Zb22qaTg5uYp31Ogb2eecgGY2Uq3CBdTR8sXaG8auQuSXVId7A95yvOQyFQqk9iH2h
	AsBzjztUNeKb5kY2RZ2u3mTudE0GhvisxY3zP0CWQn1jd+F2kHPArEUjoqkMkkxy4hi7
	E42Jh8TzhXFDN+s8FblwOlRagtY9764pv7X3s8Xc8x5/VhOf1rPyp3dKXg+55KnvmSrT
	HwBtaiXalF5gc1V6KsAlUizxcXCRce8UzFeabM4hFX3rpuR3CL0WevGw7641yiOMlnf0
	ZM0nnroHarkMBiXm8iRs0jwuaCeJdoMxL9GO+4SicfmkwQpzPXN0cq2cfgFFu77q62WW
	cfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ceml0SPK6hslVlhuFMbuIYMRFHOrQeN6P6wNmQsLnzA=;
	b=EKxWouN2dNpDaxXtQC9cRMhYe0R9yBaCM/cEaJhXHXklwZyZ1macsalQoJreSKFt/g
	iOsG9EiTMoyzN3K2uaLgfUQe9Z3UX0Rti6TySS3c+Er7I3lGuA2d0gfgwqVfqwsM1Eg8
	niqLepfFFjkHREUCy1ePqLMwezuBrUGrw9JbaQn8v+dWf/S2zpM2XvQ1CH+oInTaW/ci
	LPPcmr0sIqsUHHTNSxd2CflnY/LX7WteIryY402JCz1S+ddYWiNiRJDKagkRlYRCHw9O
	s9NPbCXxRtNzSh+7D7obW7oDMvo6IYvLUyMwfSbwViYt9yf60UvdHjrAgt4Vuj1NnEoM
	MZhA==
X-Gm-Message-State: APjAAAUofmGkh91dHRcFKkB+oyrtv7fsxRuJfOJb7P006gmj6Qc6rtDR
	UHu5/UemSnNUwC9hGOhNIxd/n9+rtIM0VrDZ+imm8Q==
X-Google-Smtp-Source: APXvYqwt7KoF2JBqsjR8qw43/6VH1w7EuoiGtSMxHievw7+nN+pfE4hCyOb8AKXCHHSMPJp2MbrPcqvD46uwUG6PeC8=
X-Received: by 2002:a02:c7c9:: with SMTP id s9mr123367203jao.82.1561367468593; 
	Mon, 24 Jun 2019 02:11:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190624082750.39458-1-raj.khem@gmail.com>
In-Reply-To: <20190624082750.39458-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jun 2019 10:10:57 +0100
Message-ID: <CAJTo0LZ_qVCjoWNNL4wa++BtRXOmRsH5XqK1jjyJD0cb3AA-Vw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 24 Jun 2019 09:11:07 -0000
Content-Type: text/plain; charset="UTF-8"

So why does this build for me?

Ross

On Mon, 24 Jun 2019 at 09:30, Khem Raj <raj.khem@gmail.com> wrote:
>
> efivar.h is in usr/include/efirvar directory so it should be
> added to include search path via -I to compiler cmdline to fix
>
> make[1]: *** No rule to make target 'efivar.h', needed by 'efibootmgr.o'.  Stop.
> | make[1]: *** Waiting for unfinished jobs....
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-bsp/efibootmgr/efibootmgr_17.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> index 0e5a81e316..2f8fa34ee7 100644
> --- a/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> +++ b/meta/recipes-bsp/efibootmgr/efibootmgr_17.bb
> @@ -22,8 +22,7 @@ inherit pkgconfig
>  # The directory under the ESP that the default bootloader is found in.  When
>  # wic uses a subdirectory, this should use the same one too.
>  EFIDIR ?= "/"
> -
> -EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}'"
> +EXTRA_OEMAKE += "'EFIDIR=${EFIDIR}' 'CFLAGS=${CFLAGS} `pkg-config --cflags efivar`'"
>
>  CFLAGS += " -Wno-error"
>
> --
> 2.22.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

