Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.2861.1591227114383210161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2020 16:31:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F0kzt/xy;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id fc4so2072099qvb.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jun 2020 16:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MLOrkA19fYJEEc5lzDuNy1GCxb7lwdNEfD7cAeMTZoE=;
        b=F0kzt/xy6B3VipBjDpOZ2E8nQhyPMdHydOJ3hPEPArKyGlLJOd9IoiHIaIjbVlUZTE
         VUgKpbMMVIayofI/Gt8PV6DHKzv49tE79aCgucIjecnNABHEIALV9sF3aI9iNdOWNWkS
         rwK/S3dcvpw2OW1THvVX+faIhcKClNVZ4IEy6GSlhMdjyCO/JIcTu2nB+m1RQO/32EjL
         4HdT35di06PCCDPuCB4nWGUJnlsD2NPkjjcJGC5/yKlwAhPakt7Zoo1AFG1xLyYlPnW2
         eCi/ORK5r7DD3pZq2jcGnq6rr5bwf0Ds4DGqGupfS9JRAs4u4xgKMhsKza3YN1pl2wws
         xZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MLOrkA19fYJEEc5lzDuNy1GCxb7lwdNEfD7cAeMTZoE=;
        b=lbMBxGjGsPg5BVoXyWWEky1n66Q6ewIChkzpAX+pLcVHGWsVQevAv/DKabe+mwAqbo
         8EvCyBg8ElKVWx4jdVKWHbJ+/PZpDbPSRJEfaz7dVCt+QNX1ZJQq4dPrh+prXcpwZ6wZ
         kaAmnyEscIiqw3iTvhsabyLLzlRBN5o6qSZDzgbrFzIDITl7jdkB+oUGENmQyjM4q6YY
         iYrNtFUKHVTIuTwU9OjOHncM457n48y8Ok+4qamuLGEOfKsoZHhQ/Aa5f4ySX2EroHQb
         QKEkElZqO/BcPuovfFHZ/+tNT26wQddFKvy5IZCsrju6PjrsPkozW5WaxgUJuQEMYOc+
         rRQg==
X-Gm-Message-State: AOAM533bklWKPnB181rzXx8lhJfqzt+SuUqb5xZ6RlV0+kLFgqMiGVIe
	pTJ1Wb9OduSkB/Ch44UY6x+kaVNW6jXGIVM1ef+SXc1P
X-Google-Smtp-Source: ABdhPJy1f80kFkGYbNyxbE+WeOZuKqbYeTOtc1/J4zGx75aV9Ri4LZ/5g2+9jOb93nOVmzTjy0aGTQcds0wC2eYfWr4=
X-Received: by 2002:a0c:e9cd:: with SMTP id q13mr2273881qvo.23.1591227113217;
 Wed, 03 Jun 2020 16:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200521161543.3273063-1-raj.khem@gmail.com>
In-Reply-To: <20200521161543.3273063-1-raj.khem@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 3 Jun 2020 16:31:27 -0700
Message-ID: <CAMKF1sr1q0s2h=t-xjFqsOyX44TXBzhFr=VeLC-5rDEjYfOx3Q@mail.gmail.com>
Subject: Re: [dunfell][ 01/10] tunes: Add new tune files for cortexa55 and cortexa73-cortexa53
To: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Ping for this series.

On Thu, May 21, 2020 at 9:15 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/machine/include/tune-cortexa55.inc  | 17 ++++++++++++++
>  .../include/tune-cortexa73-cortexa53.inc      | 23 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/conf/machine/include/tune-cortexa55.inc
>  create mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa53.inc
>
> diff --git a/meta/conf/machine/include/tune-cortexa55.inc b/meta/conf/machine/include/tune-cortexa55.inc
> new file mode 100644
> index 0000000000..8242cc9cef
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa55.inc
> @@ -0,0 +1,17 @@
> +DEFAULTTUNE ?= "cortexa55"
> +
> +TUNEVALID[cortexa55] = "Enable Cortex-A55 specific processor optimizations"
> +TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'cortexa55', ' -mcpu=cortex-a55', '', d)}"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +# Little Endian base configs
> +AVAILTUNES += "cortexa55 cortexa55-crypto"
> +ARMPKGARCH_tune-cortexa55             = "cortexa55"
> +ARMPKGARCH_tune-cortexa55-crypto      = "cortexa55"
> +TUNE_FEATURES_tune-cortexa55          = "aarch64 cortexa55 crc"
> +TUNE_FEATURES_tune-cortexa55-crypto   = "aarch64 cortexa55 crc crypto"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa55             = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc} cortexa55"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa55-crypto      = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa55 cortexa55-crypto"
> +BASE_LIB_tune-cortexa55               = "lib64"
> +BASE_LIB_tune-cortexa55-crypto        = "lib64"
> diff --git a/meta/conf/machine/include/tune-cortexa73-cortexa53.inc b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> new file mode 100644
> index 0000000000..8df418227f
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-cortexa73-cortexa53.inc
> @@ -0,0 +1,23 @@
> +DEFAULTTUNE ?= "cortexa73-cortexa53"
> +
> +require conf/machine/include/arm/arch-armv8a.inc
> +
> +TUNEVALID[cortexa73-cortexa53] = "Enable big.LITTLE Cortex-A73.Cortex-A53 specific processor optimizations"
> +
> +TUNECONFLICTS[aarch64] = "armv4 armv5 armv6 armv7 armv7a"
> +
> +MACHINEOVERRIDES =. "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", "cortexa73-cortexa53:", "" ,d)}"
> +
> +TUNE_CCARGS .= "${@bb.utils.contains("TUNE_FEATURES", "cortexa73-cortexa53", " -mtune=cortex-a73.cortex-a53", "", d)}"
> +
> +# cortexa73.cortexa53 implies crc support
> +AVAILTUNES += "cortexa73-cortexa53 cortexa73-cortexa53-crypto"
> +ARMPKGARCH_tune-cortexa73-cortexa53                  = "cortexa73-cortexa53"
> +ARMPKGARCH_tune-cortexa73-cortexa53-crypto           = "cortexa73-cortexa53"
> +TUNE_FEATURES_tune-cortexa73-cortexa53               = "${TUNE_FEATURES_tune-armv8a-crc} cortexa73-cortexa53"
> +TUNE_FEATURES_tune-cortexa73-cortexa53-crypto        = "${TUNE_FEATURES_tune-armv8a-crc-crypto} cortexa73-cortexa53"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53         = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc}        cortexa73-cortexa53"
> +PACKAGE_EXTRA_ARCHS_tune-cortexa73-cortexa53-crypto  = "${PACKAGE_EXTRA_ARCHS_tune-armv8a-crc-crypto} cortexa73-cortexa53 cortexa73-cortexa53-crypto"
> +BASE_LIB_tune-cortexa73-cortexa53                    = "lib64"
> +BASE_LIB_tune-cortexa73-cortexa53-crypto             = "lib64"
> +
> --
> 2.26.2
>
