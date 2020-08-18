Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web11.76575.1597786705509930264
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Aug 2020 14:38:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k+1/ZWI5;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id b14so19775201qkn.4
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Aug 2020 14:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qf65eTgKJJnQdC9WFD3AInKk56q0+6IHK2QwCVaSBNM=;
        b=k+1/ZWI5tWdPw8YjME3St6GQ5LfgDzlDWBwlENKvuPYM04oaGixIGvdxrsDx/F8osx
         q3Oh3lr2ulkS5mES6UQYLnlG3GqDYsL527XDbbQH9EqexNLl3G7FE8Gc2IVHXqoof3qB
         HB/rdZxWvl5lfOH06aLI6vCH2bvOvQwZL4do+qZKuStPXb4gJMkpHdplXg3c6cGXIrsx
         EYZGO33pP1tN9pvw78r9s1mu6tYGjkQmpuV2uEMd0ZMAaa2GWxiM0qp0K4VvRyjBk3JS
         Zd9pqlrlVCrnNjcUvtRJkCQ8R64U9ZlKiYAUHym9sX32mDuZkkeXCR7w35Xni9FCjnLm
         Aryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qf65eTgKJJnQdC9WFD3AInKk56q0+6IHK2QwCVaSBNM=;
        b=St7CXs8V8b03OtoVKsw8cH2Z6u88+D73QOwPsiiB9ETSXrRMaCjTRVUS8iwKD261jX
         NI3S1dS8HCE4t99jOitDtor7FJ2GDuKtvVq9bH3DuQ4A7e8bfN5XDYjpcB3uL7NoLQUR
         RWvpA5Mba3souA36LGojxYxqxJ7Bo3+wymkEwf10JkkrxMXFHSTgZNWd+D0MutLKNJhw
         XBXdtA0prHGDLc/xlTEQRQtsTGWIybWE+uiSlGE6w9vMx3Uz7uhAUIvZGHGqa3bh2dWX
         TYbnhzsJm6rtjeUsFP8u0B5cYLFCB0ASG2ciTsiH9Xckc8NQa9XkNiPNPE+SmH1PPQIK
         Odqw==
X-Gm-Message-State: AOAM533sK++etNsYvWjKT9FCUSK+sGhrv7sXLaMU3NiqvGeXeUGfhPyp
	rDu935zJwkF4H3PkmFHG6fSYm9EVJ8NquqWeJH4=
X-Google-Smtp-Source: ABdhPJzjPp2tSAZ6lsKAcW6AHBG/6odaNPbTrtOFKlicX2niUz/EwNudaNn8EpYpzaur/3l7BsfPsdX7oTKo+3w19zk=
X-Received: by 2002:a37:9b15:: with SMTP id d21mr19592651qke.9.1597786704573;
 Tue, 18 Aug 2020 14:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200818211332.38006-1-jonathan.richardson@broadcom.com>
In-Reply-To: <20200818211332.38006-1-jonathan.richardson@broadcom.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 14:37:58 -0700
Message-ID: <CAMKF1sqe-3pePMJh67AG8kMriyJw5hSbMzwvDbKQku5pEJQdcg@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/1] cortex-m0plus.inc: Add tuning for cortex M0 plus
To: Jonathan Richardson <jonathan.richardson@broadcom.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 2:13 PM Jonathan Richardson via
lists.openembedded.org
<jonathan.richardson=broadcom.com@lists.openembedded.org> wrote:
>
> Add tuning files for ARM cortex m0 plus and the armv6-m architecture
> that it is based on.
>
> Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
> ---
>  meta/conf/machine/include/arm/arch-armv6m.inc | 20 +++++++++++++++++++
>  .../machine/include/tune-cortex-m0plus.inc    | 11 ++++++++++
>  2 files changed, 31 insertions(+)
>  create mode 100755 meta/conf/machine/include/arm/arch-armv6m.inc
>  create mode 100755 meta/conf/machine/include/tune-cortex-m0plus.inc
>
> diff --git a/meta/conf/machine/include/arm/arch-armv6m.inc b/meta/conf/machine/include/arm/arch-armv6m.inc
> new file mode 100755
> index 0000000000..8202ef52f7
> --- /dev/null
> +++ b/meta/conf/machine/include/arm/arch-armv6m.inc
> @@ -0,0 +1,20 @@
> +# Tuning for ARMV6-m defined in ARM v6-M ArchitectureReference Manual
> +# at https://static.docs.arm.com/ddi0419/d/DDI0419D_armv6m_arm.pdf
> +DEFAULTTUNE ?= "armv6m"
> +
> +TUNEVALID[armv6m] = "Enable instructions for ARMv6-m"
> +TUNECONFLICTS[armv6m] = "armv4 armv5 armv6 armv7a"
> +
> +# Use armv6s-m instead of armv6-m to avoid gcc bug "SVC is not permitted on this architecture".
> +# SVC is a valid instruction.
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', ' -march=armv6s-m', '', d)}"
> +MACHINEOVERRIDES =. "${@bb.utils.contains('TUNE_FEATURES', 'armv6m', 'armv6m:', '' ,d)}"
> +
> +require conf/machine/include/arm/arch-armv5.inc
> +
> +# Little Endian
> +AVAILTUNES += "armv6m"
> +ARMPKGARCH_tune-armv6m             = "armv6m"
> +TUNE_FEATURES_tune-armv6m          = "armv6m"
> +PACKAGE_EXTRA_ARCHS_tune-armv6m    = "armv6m"
> +BASE_LIB_tune-armv6m               = "lib32"

do we need BASE_LIB defined here ?

> diff --git a/meta/conf/machine/include/tune-cortex-m0plus.inc b/meta/conf/machine/include/tune-cortex-m0plus.inc
> new file mode 100755
> index 0000000000..1c7512b061
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortex-m0plus.inc
> @@ -0,0 +1,11 @@
> +DEFAULTTUNE ?= "cortexm0-plus"
> +require conf/machine/include/arm/arch-armv6m.inc
> +
> +TUNEVALID[cortexm0-plus] = "Enable Cortex-M0 Plus specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexm0-plus', ' -mcpu=cortex-m0plus', '', d)}"
> +AVAILTUNES += "cortexm0-plus"
> +
> +ARMPKGARCH_tune-cortexm0-plus = "cortexm0-plus"
> +TUNE_FEATURES_tune-cortexm0-plus = "${TUNE_FEATURES_tune-armv6m} cortexm0-plus"
> +
> +PACKAGE_EXTRA_ARCHS_tune-cortexm0-plus = "${PACKAGE_EXTRA_ARCHS_tune-armv6m} cortexm0-plus"
> --
> 2.20.1
>
> 
