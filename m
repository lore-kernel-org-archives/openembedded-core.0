Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web09.10146.1612363538301432363
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:45:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NTxCxtPx;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: sakoman@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id b187so10109974ybg.9
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=y+FsjKMZ+XCoQP8k1+0e2pxa5kKKr9KxDZiWEy9rgcM=;
        b=NTxCxtPx3Yx3pPS5EDBG9NPtpY8cziqnYuom5/+9XxTGmvUUMGsxc8CKUzWFIm/a7g
         RPFt/bhr5pS5a3LX3WAzYfzzYqMygV5KAHBrbBzSf72HjX1AFG//pAbU7zE58vGubfgb
         51NOII59xiY2HKo02ec+CJpD48T4emFS3MH2kaRDcSTKAWqbO7/VmTBKG5oS+4KQzAbn
         qj6hFfOqh0YEflfETviy4SfF8VfRdFXqnCwxqLpPJ1MnfElcHCBswURw9vRWf7emVjkt
         VamIy120YUVyakQXnHbFOh1AOnG7XobJF3s/+cdsm9lsYMXw8u8bWy90XvGZNjj8+iU0
         XIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=y+FsjKMZ+XCoQP8k1+0e2pxa5kKKr9KxDZiWEy9rgcM=;
        b=l6gktcYhgB5FnfXrrX8kWySmeTcabq6o1MTuaHUxPDxU8swBiyxoBKdWLel2npVqhw
         rZKES62RLFTMXUYFWPtwNMF+472AJI3RJDBqR2Hs10Jb2WErTvXMaU3WVpVdC0mlA8l7
         LjsMUU/0KLV/0KXdtM0u8dWAR+1NrEZGWwe5z3q7Sg+tyyTXSXOJinnpQLa8aS2MiZ80
         ggvMt/QgDEJsDp6Tfmxt5dfJDCCL6zEiIVg3d7MfZibLZnKtYXv5OYT7jkfKRZyPmPmo
         lSBJLREapTO5Z/+5PurmZAgZFd96SWqSYONei26EFfG5qPUlogd2xwoAniLcjpxQpObh
         FJUA==
X-Gm-Message-State: AOAM532As3ziOvfeQLZbZnKzFqbyWfq73HA6DKFH6wUNEdqr4QKh6kOc
	y8AbBuIguL9PDziiVBjwiiQCn3hQES0z774YW6c=
X-Google-Smtp-Source: ABdhPJyuUqm0dvbTeN/0ascHAAzWgpmIVfGUMhmNiSdtLmgs8iOCrPXN+jouetA1bLFn4jqR0NQqb4G/7fMMNZMaofM=
X-Received: by 2002:a25:21d4:: with SMTP id h203mr4606075ybh.290.1612363537486;
 Wed, 03 Feb 2021 06:45:37 -0800 (PST)
MIME-Version: 1.0
References: <1612289367-10977-1-git-send-email-Saloni.Jain@kpit.com>
In-Reply-To: <1612289367-10977-1-git-send-email-Saloni.Jain@kpit.com>
From: "Steve Sakoman" <sakoman@gmail.com>
Date: Wed, 3 Feb 2021 04:45:26 -1000
Message-ID: <CAGDS+nmxYCFTrt-Sd3_cO94tSBWvg4U15P7UFr2cTw8fQo_vWQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][dunfell][PATCH] libgcrypt: Whitelisted CVEs
To: saloni <saloni.jain@kpit.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>, 
	nisha.parrakat@kpit.com, Anuj Chougule <anuj.chougule@kpit.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 2, 2021 at 8:09 AM saloni <saloni.jain@kpit.com> wrote:
>
> Whitelisted below CVEs as their status is disputed
> and ignored and not affecting the Ubuntu and Debian
> environments. Hence, marked them whitelisted.

I'm not sure why you are referencing Ubuntu and Debian environments.
We care about whether it is affecting the Yocto implementation.

Could you explain your reasoning a bit more?  Are you saying that
Ubuntu and Debian maintainers don't consider these CVE's to be a
serious enough issue to mitigate and thus it is safe for us to do the
same?

Thanks!

Steve

> 1. CVE-2018-12433
> Link: https://security-tracker.debian.org/tracker/CVE-2018-12433
>
> 2. CVE-2018-12438
> Link: https://security-tracker.debian.org/tracker/CVE-2018-12438
>
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
