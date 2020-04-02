Received: from mail-io1-f65.google.com (mail-io1-f65.google.com [209.85.166.65])
 by mx.groups.io with SMTP id smtpd.web10.17.1585845987184777060
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2020 09:46:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=R5oxPKiF;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.65, mailfrom: brgl@bgdev.pl)
Received: by mail-io1-f65.google.com with SMTP id c16so4313771iod.6
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2020 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=g4/TkCozE7DR9LEOCr+EBzF3QUolPFewFC0Gj0nctHA=;
        b=R5oxPKiFU4+9G3e01m8T9UO68O7ptHV+0WSs2jpkNaU+hNCjbGpTF+YjF2QoIbMTJj
         NgZ6xr7YodE+gUWETq3fIKo0KXxqdPagzi2ZW0dPHrWnCBHROUFtYkG1i76atOpIS/ol
         X8Y+IDC5n2W94AO9UHuC50rL2BTJ1qI2JU09ZOxkWJT0QGDd6epzvxLpJ9ENAp0MaZ7f
         g0sphWOrD/Bmz6UO3qVlWDdDpp/bdJW/hA/P/65cNtNSAyxvvd37OTHAePOjFX/PZaRA
         oDpSq0/VqUnfKAUPjshsSPzC2ROTxBuXoDSa2ToQmWu19QdGkcgiW2ZmhCgyi7DScMCL
         cNvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=g4/TkCozE7DR9LEOCr+EBzF3QUolPFewFC0Gj0nctHA=;
        b=GzGXTKsxaDf19uDFtG1jtfDoZknOg7mlBkr9mZKM7p28RJLvPW84mJa5UPFlmb+Uz6
         2EuzqBPSGWEotOjEezWYadd8mWFDnZ/BPl1Yy8PAKBETqiEOkDbQmF8vKyy+sdRqsn2U
         6x0GqN1oaZe5N1QYboBru/1CBc7c4ddnWKRRWU5FoDRAMOkH1jepXnBX+PFz1eJ6Jn33
         4l5EpMjCD5Kqg9hB2oZOlzV9OSN7bwS46vfaKe8fziyocibozCVtrPQO95JvO0GxUUym
         NceA+JoC7/kwMlSZbLE5hsRYR+u1T9FGLeMHw8h/OwibLAdoEboa21AVSsmXc+5EKthK
         YSFQ==
X-Gm-Message-State: AGi0Puauig+y9HSQ98DFMBA1pf2ML/0F1SRIMMw4sV98J9z5ll9nQfsk
	4duqPyawCrZEBTswyRjlyHScxXMvxTz8ld+AemMpeQ==
X-Google-Smtp-Source: APiQypJidqUbcP7tGYI090qirfJlEj2Qxn9IVHUuYTAYflFQ/jIipPwO+XJ3ya/OMG7UkhB+2N/77xJZKYOToSOkGhs=
X-Received: by 2002:a5e:8703:: with SMTP id y3mr3559435ioj.119.1585845986570;
 Thu, 02 Apr 2020 09:46:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200323172808.26338-1-brgl@bgdev.pl> <20200323172808.26338-2-brgl@bgdev.pl>
In-Reply-To: <20200323172808.26338-2-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Thu, 2 Apr 2020 18:46:15 +0200
Message-ID: <CAMRc=Md3S1QGun1fuh5HpU4QFYFUae0ec3Ou96CLMoH6d=+3SQ@mail.gmail.com>
Subject: Re: [OE-core][RFC PATCH 1/2] qemuboot.bbclass: don't redefine IMGDEPLOYDIR
To: Khem Raj <raj.khem@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Armin Kuster <akuster808@gmail.com>, Jerome Neanne <jneanne@baylibre.com>, 
	Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

pon., 23 mar 2020 o 18:28 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(=
a):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> This variable is already defined in image.bbclass and there's not need
> to redefine it here.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta/classes/qemuboot.bbclass | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclas=
s
> index 54044c38da..68f7a03619 100644
> --- a/meta/classes/qemuboot.bbclass
> +++ b/meta/classes/qemuboot.bbclass
> @@ -83,7 +83,6 @@ QB_DRIVE_TYPE ?=3D "/dev/sd"
>
>  # Create qemuboot.conf
>  addtask do_write_qemuboot_conf after do_rootfs before do_image
> -IMGDEPLOYDIR ?=3D "${WORKDIR}/deploy-${PN}-image-complete"
>
>  def qemuboot_vars(d):
>      build_vars =3D ['MACHINE', 'TUNE_ARCH', 'DEPLOY_DIR_IMAGE',
> --
> 2.19.1
>

Hi Richard,

this patch can be applied without waiting for the v2 of the image
deployment patch. Would you mind picking it up into your tree?

Bartosz
