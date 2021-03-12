Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web08.1303.1615507267255267446
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 16:01:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cJH/aa9b;
 spf=pass (domain: gmail.com, ip: 209.85.160.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f176.google.com with SMTP id j7so2560988qtx.5
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 16:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RSyWHZEVhG4SKm0lr6jIDlpapAWbMk9FkdT+Tx+b3lQ=;
        b=cJH/aa9bJHMlMOAIZGILQ0IZtdF75D6lCurvLkFHQ/22zE+FUKo2aWbcWJMFlT6+BR
         HPsA2UYI+cq1RMAAB49ZRNc1iSJC2gss7mUIYOVyjvU+ttdEyGeYp2xiEv8KYWZPYpI/
         PRKDLVTd/QMJAp1ciAqVdQSjehe8fD6CWKMeddPGxTw8U0Q4RV7UPjUMNyaHX4p6fozj
         mBEpfp6lLyHF+/GvHDyAdtgbYgRDU62uLQ+DBOb05RxZcnVEDUdDENcPYqcE8k/J/tG/
         BxInPIHHxe0ttHXqVn0bCYNO0h7zfG2D5jP6FKlcmCFRtvO5kZEN2LvovdDzg70DMycW
         QNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RSyWHZEVhG4SKm0lr6jIDlpapAWbMk9FkdT+Tx+b3lQ=;
        b=uiMuwuC9Qa9A0/KzpR6e01IRYGCu/l3CMsGNvhWZSEdHQPbJy39xZXeJmlznKf7EmE
         yjj5KPYclSZBrFp5e1+4kkrCF9QwUx0JDd4Qws7yJrILefk4saY/qYWIXCrjSs/neA9L
         wA3zsAP3sGPGxNdGlFRvZEffaGOFQ5dF/Vntf0ewO6R2T0FNBYi1HjZkrozuaIdMOPjF
         Fd3WU1ccl6EYMlYQ6qsPu5esNC52+LBHNWt4mUkWimElGKp9eH8iJ4yqkmEzDigU5qj8
         UcddT/keP27Pjs53fcgDqvSIk5ho1JBLr2/DFfMgVrkJTlkPc/gHlcmM0VQQk1hbVGJP
         d4HA==
X-Gm-Message-State: AOAM533BMZe1XLticTOFho2ye6yG5d3QGFGQYhZGDmChfkY28LXWqso4
	wNL2kt/3P9S9NAhKuJcjvXL0qmN2GQCbyG0gCwM=
X-Google-Smtp-Source: ABdhPJxOKWAuBXPlEUbBRCkPSyC712NxTQoJJwWcK7YXNSBlaIKYC64QVlXYm0EWVSqn5FTEfI9snuzTl6TBsQpFaxo=
X-Received: by 2002:ac8:4b6d:: with SMTP id g13mr9663254qts.369.1615507266282;
 Thu, 11 Mar 2021 16:01:06 -0800 (PST)
MIME-Version: 1.0
References: <20210311185641.24754-1-stefan.ghinea@windriver.com>
In-Reply-To: <20210311185641.24754-1-stefan.ghinea@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 16:00:40 -0800
Message-ID: <CAMKF1sqV5hz7w72_et_iT+ZDoYQObBUT+e1EphTsoFwv7zY2AA@mail.gmail.com>
Subject: Re: [PATCH] [OE-core] [meta-openembedded] quagga: fix do_fetch warning
To: Stefan Ghinea <stefan.ghinea@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

oe-core mailing list is only for oe-core patches, this one is for
meta-networking layer in meta-openembedded so please send this patch
to oe-devel mailing list.

On Thu, Mar 11, 2021 at 10:57 AM Stefan Ghinea
<stefan.ghinea@windriver.com> wrote:
>
> WARNING: quagga-1.2.4-r0 do_fetch: Failed to fetch URL
> https://download.savannah.gnu.org/releases/quagga/quagga-1.2.4.tar.gz;,
> attempting MIRRORS if available
>
> Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
> ---
>  meta-networking/recipes-protocols/quagga/quagga.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
> index 6df72427b..6680fec01 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -20,7 +20,7 @@ SNMP_CONF="${@bb.utils.contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '',
>  # the "ip" command from busybox is not sufficient (flush by protocol flushes all routes)
>  RDEPENDS_${PN} += "iproute2"
>
> -SRC_URI = "${SAVANNAH_GNU_MIRROR}/quagga/quagga-${PV}.tar.gz; \
> +SRC_URI = "https://github.com/Quagga/quagga/releases/download/${BP}/${BP}.tar.gz; \
>             file://quagga.init \
>             file://quagga.default \
>             file://watchquagga.init \
> --
> 2.17.1
>
>
> 
>
