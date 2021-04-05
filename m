Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web12.4179.1617662138732800393
 for <Openembedded-core@lists.openembedded.org>;
 Mon, 05 Apr 2021 15:35:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QYXp4c9A;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id z1so14034598ybf.6
        for <Openembedded-core@lists.openembedded.org>; Mon, 05 Apr 2021 15:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SdrDTJoK+9Zgzt/gEJqLPIOgbnYRF31vYYhuhNnIv+E=;
        b=QYXp4c9AsY6rNobeGduFOO61Bq0cMyUFgqRw2E5xm1ZaJssDbZtzZ0Xr5Bs8ER1lrq
         r6VarJ8d0WJX2Xp/PGJwoZXoFqtL5YLen/k3cHLpGiENE7eJl1vRJzsgPbJFurB2xVvs
         B+Ov2mBGjow4wR1k0m8cANZjYEA9CsjJZIWRpIb4F1i2OM+TZGXQuxUHHyMkP4cUXeCB
         jO6gIsvHa1ueYPFb3WuA4GQPSdbiSAJmXoHW83aVsPuu/4th38hPdsflQFdL33MnsrFT
         8UEsfc4L9SCRc7/wgj85vZ7uLIYA2RN6BXUrEaw1owiQsTgJFEOsme5JUe0mbHi3mj9c
         ytqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SdrDTJoK+9Zgzt/gEJqLPIOgbnYRF31vYYhuhNnIv+E=;
        b=uh0ExCGfj0Pv09Agn9DwVLRq8ChVCVrLl4oV11ku3GickQ1Og9C4n9pbKHxy3D0cF9
         gn+lfpSjoOjAzKvOHsxYROdsqMi/m1px8IyXmDSSMKL1YzcL6l6ikIDhTUx7OQku6w3i
         3IhAJRtaRMMoZcXtd5+oqyJLW6yizStYHBxsUJxYsy8Gs1veyR/IJIgLh6jIGt3MbLrX
         sUUEgf5L7esnZ9cCVdsVW1FDx0E+Y0agXdgxgIqZr1rUBDZ329Xu6lsDduLvJZ3C4fel
         jMb7rUxNc2vZVzMQtib6VS2jS0lcS3hqa55gAXJrzU3nIMq30A7+zgizHDzM9aWh1K27
         3KEg==
X-Gm-Message-State: AOAM5338S63mNL1teRe5jxl8EOkahhb8U583N3c0Dqu+pPabUJZPEFjB
	XgWFVevGc6Ovgh6S/LBexhOR4acOj4YmPQe4RFs=
X-Google-Smtp-Source: ABdhPJycKNiF8BuOnP5jdgMf4kbXofNSHM4XzH0jvJaje3eorq7ExNxGiTphQNH4QAZgi0w0GeaiwDsJo9qUOqCkHQ0=
X-Received: by 2002:a25:d8ca:: with SMTP id p193mr17478133ybg.61.1617662137977;
 Mon, 05 Apr 2021 15:35:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210405132946.22548-1-Sana.Kazi@kpit.com>
In-Reply-To: <20210405132946.22548-1-Sana.Kazi@kpit.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Mon, 5 Apr 2021 12:35:25 -1000
Message-ID: <CAGDS+nkyKZpj-Q8ux-bS+Cy3Hjm_sggNRFCLvboeV=dZZtfg8w@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] openssh: Whitelist CVE-2008-3844 and CVE-2020-15778
To: Sana Kazi <Sana.Kazi@kpit.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, 
	Purushottam Choudhary <Purushottam.Choudhary@kpit.com>, 
	Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 5, 2021 at 3:30 AM Sana Kazi <Sana.Kazi@kpit.com> wrote:
>
> Whitelisted below CVEs reported for openssh:
>
> CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
> and certain packages may have been compromised and has been fixed
> by Red Hat. This CVE is not applicable as our source is OpenBSD.
> Hence, this CVE  is not reported for other distros and
> can be whitelisted.
> Links:
> https://securitytracker.com/id?1020730
> https://www.securityfocus.com/bid/30794
>
> For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
> Hence, it can be whitelisted for 8.2p1

This explanation doesn't make sense to me!  If 8.2p1 is affected, why
are you proposing to whitelist it?

Steve

> https://nvd.nist.gov/vuln/detail/CVE-2020-15778
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_8.2p1.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/r=
ecipes-connectivity/openssh/openssh_8.2p1.bb
> index fe94f30503..f8037db986 100644
> --- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
> @@ -32,6 +32,20 @@ SRC_URI[sha256sum] =3D "43925151e6cf6cee1450190c0e9af=
4dc36b41c12737619edff8bcebdff
>  # and when running in a Kerberos environment. As such it is not relevan=
t to OpenEmbedded
>  CVE_CHECK_WHITELIST +=3D "CVE-2014-9278"
>
> +# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux
> +# and certain packages may have been compromised and has been fixed
> +# by Red Hat. This CVE is not applicable as our source is OpenBSD.
> +# Hence, this CVE  is not reported for other distros
> +# and can be marked whitelisted.
> +# https://securitytracker.com/id?1020730
> +# https://www.securityfocus.com/bid/30794
> +CVE_CHECK_WHITELIST +=3D "CVE-2008-3844"
> +
> +# For CVE-2020-15778 OpenSSH through 8.3p1 is affected.
> +# Hence, it can be whitelisted for 8.2p1
> +# https://nvd.nist.gov/vuln/detail/CVE-2020-15778
> +CVE_CHECK_WHITELIST +=3D "CVE-2020-15778"
> +
>  PAM_SRC_URI =3D "file://sshd"
>
>  inherit manpages useradd update-rc.d update-alternatives systemd
> --
> 2.17.1
>
> This message contains information that may be privileged or confidential=
 and is the property of the KPIT Technologies Ltd. It is intended only for =
the person to whom it is addressed. If you are not the intended recipient, =
you are not authorized to read, print, retain copy, disseminate, distribute=
, or use this message or any part thereof. If you receive this message in e=
rror, please notify the sender immediately and delete all copies of this me=
ssage. KPIT Technologies Ltd. does not accept any liability for virus infec=
ted mails.
>
>=20
>
