Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web12.3234.1602178335015170881
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Oct 2020 10:32:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jBRlzU00;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id q63so7875203qkf.3
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Oct 2020 10:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ci+fqHmzeCxiNr8Xu4bBnU975EqXfpbMPJAteAHbHHc=;
        b=jBRlzU00ImM5rlnDSGw2wcCSW/W1heOBatU6ESHYf1YBAxjUZzhXkI9WYVrZZvC7Pi
         ZVylIfnDgLiM8KsSdvRehRrKJ8+ZkjR5/g0tMCFBJQgx15h6DOKw8EN9Z9mrmvv0olD3
         q/kolT22tDFcLY3VlCXgOuqSDo4HPTV9n8OUY1gXkEyU4ZHauPkJkMurm2Pd2pNmVt6R
         IFVTX1IR+D4kdZqOoDwsTHXSyPOIuM4qQuNlOkfKSFh0eRdDsAwe9pXhzgzmkOc80y5d
         SmgvVeMGn782FXy5XRTXlUF3czIZWqVQX3sUvnIeGe6JNGpczKAZT11ZuFN4n95aPwmQ
         fiIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ci+fqHmzeCxiNr8Xu4bBnU975EqXfpbMPJAteAHbHHc=;
        b=bsvNqXbaxyj0cYGT9MyPJfT65PSinpSTVNFaNbtkTM4vP9F/DFv5+GXTYi8Bz8DAH7
         frqJONt3RKwcTg3N7W3aEnK0vL40LxPbPiGTOdT3N5GHv5tOaqrpGR0d+bmMiDaXAhgW
         R6ji4zo5+cWk+mapHGTVVeShQCc5fXi95A/qq+9UhcjxaegpadYLn3sNyjuHlYmVVwqi
         jKLrkPDiPE0dbMhIlXGLwAzdR4VGK4ejTlWEfRyrnHIrKpRMayRbpUVWDPOnTxqGjaCF
         O05B7ttw2uvxRflZauLLbQ2aObVBIvUGQ5rLiHGO0CnHv7DuLZZxuYhboiMkdg+SctUG
         UAHg==
X-Gm-Message-State: AOAM533iKJtlSlqhNRUoJOYeEj/chyAVL5tLyDqRCDPr5xskgB90WF7A
	yHU/s2bDDbQEo88/9PBurvTuBXmwdC8wtd10kQTPwMCWDbM=
X-Google-Smtp-Source: ABdhPJwijbKQReaoWkfQl4J7syeBG8tVl54O71JE5tSjfZWV9pv6EjZ5mObSH7uTNdB8/ipr75YXkuxHEIx3V9wbYqw=
X-Received: by 2002:a05:620a:7f6:: with SMTP id k22mr9285926qkk.337.1602178333955;
 Thu, 08 Oct 2020 10:32:13 -0700 (PDT)
MIME-Version: 1.0
References: <20201008143451.18668-1-jon.mason@arm.com>
In-Reply-To: <20201008143451.18668-1-jon.mason@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 10:31:47 -0700
Message-ID: <CAMKF1sp0jjxF6UJzMjn0UqA_JeCUJovTANQ2jHMS_-pq0vLQ2w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v5 0/4] ARMv8 Tune add
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am happy with this series.

On Thu, Oct 8, 2020 at 7:38 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> Changes since v4:
>  * rebase to latest master (which includes a aptch from the original
>    series)
>  * dropped reorg from this series, but put the newly created files in
>    the location where the existing will be moved in the future.  This
>    allows for users of these new files to not need to be modified when
>    the reorg happens (per request from RP).
>
> Changes since v3:
> * Tweaked commit message to reflect the comma-space patch should've used
>   --follow-symlinks to get the correct output.
> * Fixed bug in A55.inc found by Andreas Oberritter
>
> Changes since v2:
> * Removed errant files from the comma-space patch.  Still unknown how
>   they are pulled in by that command.
>
> ---
>
> The first 3 are clean-ups, then two to add currently unsupported ARMv8a
> cores, then the last one is to move them out of the generic tune area to
> an Arm specific one.  Given how late we are in the gatesgarth cycle, you
> can leave this last one off and I'll resend after the release.
>
> Thanks,
> Jon
>
>
> Jon Mason (4):
>   armv8/tunes: Move TUNECONFLICTS
>   armv8/tunes: reference parent's TUNE_FEATURES
>   armv8/tunes: Add tunes for supported ARMv8a cores
>   armv8/tunes: Add tunes for supported ARMv8.2a cores
>
>  meta/conf/machine/include/arm/arch-arm64.inc  |  1 +
>  .../include/arm/armv8-2a/tune-cortexa65.inc   | 16 ++++++++++++++
>  .../include/arm/armv8-2a/tune-cortexa65ae.inc | 16 ++++++++++++++
>  .../arm/armv8-2a/tune-cortexa75-cortexa55.inc | 20 ++++++++++++++++++
>  .../include/arm/armv8-2a/tune-cortexa75.inc   | 16 ++++++++++++++
>  .../arm/armv8-2a/tune-cortexa76-cortexa55.inc | 20 ++++++++++++++++++
>  .../include/arm/armv8-2a/tune-cortexa76.inc   | 16 ++++++++++++++
>  .../include/arm/armv8-2a/tune-cortexa76ae.inc | 16 ++++++++++++++
>  .../include/arm/armv8-2a/tune-cortexa77.inc   | 16 ++++++++++++++
>  .../include/arm/armv8-2a/tune-neoversee1.inc  | 16 ++++++++++++++
>  .../include/arm/armv8-2a/tune-neoversen1.inc  | 17 +++++++++++++++
>  .../include/arm/armv8a/tune-cortexa34.inc     | 20 ++++++++++++++++++
>  .../arm/armv8a/tune-cortexa73-cortexa35.inc   | 21 +++++++++++++++++++
>  .../include/arm/armv8a/tune-cortexa73.inc     | 16 ++++++++++++++
>  meta/conf/machine/include/tune-cortexa32.inc  |  3 +--
>  meta/conf/machine/include/tune-cortexa35.inc  |  2 +-
>  meta/conf/machine/include/tune-cortexa53.inc  |  3 +--
>  meta/conf/machine/include/tune-cortexa55.inc  |  2 +-
>  .../include/tune-cortexa57-cortexa53.inc      |  3 +--
>  meta/conf/machine/include/tune-cortexa57.inc  |  2 +-
>  .../include/tune-cortexa72-cortexa53.inc      |  3 +--
>  meta/conf/machine/include/tune-cortexa72.inc  |  2 +-
>  .../include/tune-cortexa73-cortexa53.inc      |  3 +--
>  23 files changed, 236 insertions(+), 14 deletions(-)
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-neoversee1.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-neoversen1.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
>  create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
>
> --
> 2.20.1
>
>
> 
>
