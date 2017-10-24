Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EBF5A60796
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 23:43:09 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id b9so13588876wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Oct 2017 16:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=bjWYi6T2QFrbp3zcVrfPSPDh2Aejn7vbVMSLK2pKoS8=;
	b=IMMRcVIt8UyUpyoU7kGl9+FJSZKPI/uot+ZgqbuKxRte0ZJxvEH7a3j0HOMtyzt3MH
	0TDjIVO52muIdrxjjaaz6DEqiS5LIg5pwYLBx+Mei38SRE+QBTurXh9gmEaWsFfVHJqn
	vAY+5+0kdwAeSOLnBjLDCsG9UxBm//KJ7lmKo8r0VYH2YYb+608pzBJHLysMdnfHv9Uc
	LGgQhZ9EbNJ4luq6cw6tpU5tAJWT++wHWdFXFlDclQ4j1QnjmFTcewwR0oWPjbVwpJyI
	VDp+2/TmZ7rvSEKwlE/DjlwvndNeKmKw9U4iLjJtidHBehUOXPirap0hCdhsAOCrGa5v
	RMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bjWYi6T2QFrbp3zcVrfPSPDh2Aejn7vbVMSLK2pKoS8=;
	b=SUZqrDWh2cDtx2Pkh6Ayv6vBBjDY2t0HIqRifwGAbM4XtnbdQdlfmZBxOp0m+k0CNs
	/p9FFuwUfBOJGUDqnIPHQ7aPBP3rQ3efquFwUalQmGzikTHUaGRzQ4uCDmUh0NSKX1Ws
	imsXpXjwfxyxqKhXaTKs1S4cIngi7+SBVMtEzR4oloqA445RIbaTR6/iWjFotJS6a4by
	CXxaTxE6Ww3InQkHW6zErOdI0+brbUg5e/KlkyuPSMghsw0iniOtVUTOvyXOmwnI05X8
	8tpP3K7VC/Y4J+aozUfc+rnn6gb4kH3FtNK6RA//G3DLp7T1hVCsyGDKjgfrmuJhVFAr
	TPdQ==
X-Gm-Message-State: AMCzsaXxrzX+8qJ0r5ti3xDhF7jEjWONaJN0vLhXm2CKFb0BEOZKBhPe
	NtmunTVBEy0upu9p2alJttkCVN9cos6zA1jrQas=
X-Google-Smtp-Source: ABhQp+SE6hzra13Zg8MWV2FOS3nYINfpuXMTN7/DXsagydnghVKwJnCjoJJcVsV1DybYvMG6Oosus7rzOsIT6GiwNkY=
X-Received: by 10.28.19.73 with SMTP id 70mr129918wmt.87.1508888590510; Tue,
	24 Oct 2017 16:43:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 24 Oct 2017 16:43:10 -0700 (PDT)
In-Reply-To: <20171024232359.63328-1-jslater@windriver.com>
References: <20171024232359.63328-1-jslater@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 24 Oct 2017 16:43:10 -0700
Message-ID: <CAJ86T=V_Miu6Ui_zBOWzKRtPTbv6HE_O3B_Y5swmzRap2JgaAw@mail.gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] qemumips64: no qemu-usermode for n32
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
X-List-Received-Date: Tue, 24 Oct 2017 23:43:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 24, 2017 at 4:23 PM, Joe Slater <jslater@windriver.com> wrote:
> qemu-usermode is only available for mips64 and o32 code.

Isn't that already handled by meta/conf/machine/include/mips/arch-mips.inc

  # user mode qemu doesn't support mips64 n32: "Invalid ELF image for
this architecture"
  MACHINE_FEATURES_BACKFILL_CONSIDERED_append = "
${@bb.utils.contains('TUNE_FEATURES', 'n32', 'qemu-usermode', '', d)}"

?

> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  meta/conf/machine/qemumips64.conf | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/conf/machine/qemumips64.conf b/meta/conf/machine/qemumips64.conf
> index 3f91cbe..8feefc4 100644
> --- a/meta/conf/machine/qemumips64.conf
> +++ b/meta/conf/machine/qemumips64.conf
> @@ -12,3 +12,7 @@ KERNEL_ALT_IMAGETYPE = "vmlinux.bin"
>  SERIAL_CONSOLES ?= "115200;ttyS0 115200;ttyS1"
>
>  MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
> +
> +# no qemu-usermode for libn32
> +MACHINE_FEATURES_remove_mipsarchn32 = "qemu-usermode"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

