Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web09.9032.1612537351448581652
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Feb 2021 07:02:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=uKpFK4Wh;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.42, mailfrom: steve@sakoman.com)
Received: by mail-wr1-f42.google.com with SMTP id a1so8031003wrq.6
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Feb 2021 07:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=R854y+f0F8VCB+lcyPEd0U7wzDrH4yTMjvCQXBHdkwk=;
        b=uKpFK4Whet4QAL9HvXjR85C7CeVw8t7q4iSxmjQjtIR2z2VfdNK+tqpkYJMxT6+BFd
         eh4aENoLTSLDEUJu3/mlaGX64GrXg4y/AKhJ40YoKFTdrTS9WVrjUFwPlOZ3BFLkB5vE
         YHZBoyUrfNotLRSWKP9qDWy+ZGtCjXcTsIsfnJI1/VD3Q17BlH0LHqoJzLPS2kjZU5Sq
         vOXyE4Bi3lgtNOuxXl6vwWBcjA5JB+EybXoLjDNrGojUTc1aqSApjIaJslOMiEdIjKnO
         djnm3QHdn3/+Nxsh/elV48CmS00TeFrqjAZZtystRXig4tuUJ2nHJyyOk6w/hJqMcveh
         EXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R854y+f0F8VCB+lcyPEd0U7wzDrH4yTMjvCQXBHdkwk=;
        b=LviouF41GZUuLUWrrs+kZuXvlcYHmxAryRX1atlqD+g0Js/DuDWhBRro1HSTPhVE0t
         5vZ12OjkMzyhEZ2PPlnbFgAr1qLSztjAq003Ptw+a6LxnFBC8qHb90JQC34wsgWmMz8N
         ARfwX+oP9qNA0/JtfhzAeId6Jz2kUV3Re8Q5AP/8luiWGkzgLeyLXTjJ81HXAxitWmDB
         mm0C17UzgYMNSzc+V5KOY44C0SAQw7YY5WHorYm9HJxhjhlHTmuGzC2d9KvVKmhUmYUl
         WnZw3ESWaCZujj1/S6qtY2KRMCkvlwqMta/BwxG6rnLzy2mUxlceABjD+bOaQfxgLxgY
         DHKQ==
X-Gm-Message-State: AOAM533DR00aNWOVzu3Fq5peuSVRQATXW77MlGq5aMe8WL64W0y6RtHA
	l/uaNxkziR8d+SCLgvpWnyuZl8cjak3MgX0H6jUajQ==
X-Google-Smtp-Source: ABdhPJzUNINNzIqqWl4/fmm//ZXIozxNll8aPiu1VPXYRxgHFMIgGfaR3fZe2AiAGRZE51hNnlogSXLWjpMvXlp6roc=
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr5362412wrd.329.1612537349863;
 Fri, 05 Feb 2021 07:02:29 -0800 (PST)
MIME-Version: 1.0
References: <1612534114-30444-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1612534114-30444-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Fri, 5 Feb 2021 05:02:17 -1000
Message-ID: <CAOSpxdYugu=peB7eDjfbW1F6tEyA1OnyUN7CfJx7s8dj=VifEQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH v2] libgcrypt: Whitelisted CVEs
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	Nisha Parrakat <nisha.parrakat@kpit.com>, Anuj Chougule <anuj.chougule@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 5, 2021 at 4:09 AM saloni <saloni.jain@kpit.com> wrote:
>
> Whitelisted below CVEs:
>
> 1. CVE-2018-12433
> Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
> Link: https://nvd.nist.gov/vuln/detail/CVE-2018-12433
> CVE-2018-12433 is marked disputed and ignored by NVD as it does
> not impact crypt libraries for any distros and hence, can be safely
> marked whitelisted.
>
> 2. CVE-2018-12438
> Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
> Link: https://ubuntu.com/security/CVE-2018-12438
> CVE-2018-12438 was reported for affecting openjdk crypt libraries
> but there are no details available on which openjdk versions are
> affected and does not directly affect libgcrypt or any specific
> yocto distributions, hence, can be whitelisted.

Much better explanation.

I checked and master and gatesgarth are also flagging this issue. So
this will need to go into the master branch first and then backported
to gatesgarth and dunfell taking into account the different versions
of libgcrypt.

> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> ---
>  meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb b/meta/re=
cipes-support/libgcrypt/libgcrypt_1.8.5.bb
> index 4e0eb0a..ba3666f 100644
> --- a/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> +++ b/meta/recipes-support/libgcrypt/libgcrypt_1.8.5.bb
> @@ -29,6 +29,9 @@ SRC_URI =3D "${GNUPG_MIRROR}/libgcrypt/libgcrypt-${PV}=
.tar.bz2 \
>  SRC_URI[md5sum] =3D "348cc4601ca34307fc6cd6c945467743"
>  SRC_URI[sha256sum] =3D "3b4a2a94cb637eff5bdebbcaf46f4d95c4f25206f459809=
339cdada0eb577ac3"
>
> +# Below whitelisted CVEs are disputed and not affecting Ubuntu and Debi=
an environments.

Could you revise the comment and then resubmit for the master branch
(with backports to gatesgarth and dunfell)?

Thanks,

Steve

> +CVE_CHECK_WHITELIST +=3D "CVE-2018-12433 CVE-2018-12438"
> +
>  BINCONFIG =3D "${bindir}/libgcrypt-config"
>
>  inherit autotools texinfo binconfig-disabled pkgconfig
> --
> 2.7.4
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
