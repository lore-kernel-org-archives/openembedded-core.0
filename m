Received: from mail-il1-f194.google.com (mail-il1-f194.google.com [209.85.166.194])
 by mx.groups.io with SMTP id smtpd.web12.1943.1601052601604473921
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 09:50:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=fT5xetBh;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.194, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f194.google.com with SMTP id s88so2976669ilb.6
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0pv01Gsn09T4jK0GZ+NPZnvs0bdvQDf9Qbr6r4Z/9HA=;
        b=fT5xetBha82Ajp7t8Azmz98MGAtHtOrzZOgxO3ePsnApA1a7VJ1i5upxXhZ+QmNMCf
         J98T0qMNz3Sz/gQi6ypsdcB88aE0h41GfkEtsTX8wXWk7f6TnMPa8wmLlrRbUXMD2m7o
         6G5b2x88Nw7iydwbEOXt8c+VvOZWqZyxSSEuTbhdl+W7mZOgm42sAxpe1Cn9+PQtZw4F
         H17bPkFV6VZHaUDuZcdXGgRWMU8ah+b0IiALd7CqACbHmEHyIIG+JcLD5mxsApGpwhlp
         27fgunXLb7ufAVTLOFl4cWeXhsSknCmNfnY39JNotnRkwhGXOTt8a7yMxkMG/IDgjMAN
         8RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0pv01Gsn09T4jK0GZ+NPZnvs0bdvQDf9Qbr6r4Z/9HA=;
        b=EzNkyPUmaPBAXYDFTGMWf4XFgv9hFq/8d7RAIO/Se2CUCtsedbyD6n1piAeTTzxcHE
         NAkHa1FEgH6hJGPodtZnSIbNXI8gD2mMuNp63h6n6SW1aPHHhcerPSJoY/6zv8sPjZsV
         MoM/tZvjUJhz1Z2P0v7eqeJcXmT/DorSemjpsAtU1YE7qrgubykXaLYEO+To/rleDFHA
         hmKnauMEHfyUN0FwCfpwd6Kisyq6OH5In4SQ9MzG5BaexUZ1IVtpXQtpUQj6+/O5E0Hc
         68dKMkoDOQiqDeLWdA+9Ni0k1jxytTwO9rD1otDuT72Dl3mIRwisnABFxdBHQA/mIZj2
         r+SA==
X-Gm-Message-State: AOAM532e3Wu/p/ZsQeV+TNrT/VwpVkfjOGPOPkaFYHIAYDBcrJg7K+6i
	qP8dxa2Pj4tlUEcLro+MRKHiWllWIrMIcQdwiUJHaA==
X-Google-Smtp-Source: ABdhPJwOsQEukX/p1o1yJEYLF0iFNJErnlW11jxNFFMtVhLBdJcjGD7E7C6V34owDARzhU7TqZ3+9u02hTlmnQNAsRw=
X-Received: by 2002:a92:89c3:: with SMTP id w64mr969997ilk.49.1601052600822;
 Fri, 25 Sep 2020 09:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200923223109.39388-1-jonathan.richardson@broadcom.com>
In-Reply-To: <20200923223109.39388-1-jonathan.richardson@broadcom.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Fri, 25 Sep 2020 12:49:49 -0400
Message-ID: <CAPoiz9z_4syojkYFThg6mVnhPWUFvatG-s0ymDiE994BbCA1Yw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1] cortex-m0.inc: Add tuning for cortex-m0
To: jonathan.richardson@broadcom.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 23, 2020 at 6:31 PM Jonathan Richardson via
lists.openembedded.org
<jonathan.richardson=broadcom.com@lists.openembedded.org> wrote:
>
> Add tuning or ARM cortex-m0.
>
> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>

Looks like what I have queued for m0.  So, one less for me to send out :)

Reviewed-off-by: Jon Mason <jon.mason@arm.com>

> ---
>  meta/conf/machine/include/tune-cortex-m0.inc | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortex-m0.inc
>
> diff --git a/meta/conf/machine/include/tune-cortex-m0.inc b/meta/conf/machine/include/tune-cortex-m0.inc
> new file mode 100644
> index 0000000000..a59c8af941
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortex-m0.inc
> @@ -0,0 +1,11 @@
> +DEFAULTTUNE ?= "cortexm0"
> +require conf/machine/include/arm/arch-armv6m.inc
> +
> +TUNEVALID[cortexm0] = "Enable Cortex-M0 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0', ' -mcpu=cortex-m0', '', d)}"
> +AVAILTUNES += "cortexm0"
> +
> +ARMPKGARCH_tune-cortexm0 = "cortexm0"
> +TUNE_FEATURES_tune-cortexm0 = "${TUNE_FEATURES_tune-armv6m} cortexm0"
> +

If I were going to be nitty, I would say to remove this line :)

Thanks,
Jon

> +PACKAGE_EXTRA_ARCHS_tune-cortexm0 = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0"
> --
> 2.20.1
>
>
> 
>
