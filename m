Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEF5C0015E
	for <webhook@archiver.kernel.org>; Sat, 29 Jul 2023 08:24:52 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.50851.1690619091606708041
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jul 2023 01:24:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ErN/zofp;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3174aac120aso2811302f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 01:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690619090; x=1691223890;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XDfeQJB++iKVYQTZO520ErDHmQggE4dNUjS29xaJAXE=;
        b=ErN/zofpYk5hYgrBYGaKKHvNERQEOqcnwdTX+c8jbHR840vkpzYKU7zT3yERSVWps7
         /Fdh6UubykAyE7fJZp88xPukC/4RbE/Jm6tjry4/26eOuv5Wn8TeOCr4GK7q66nnCx7G
         dnSfuqrpE4/Rr75zR1oqwB5DnJ2pfOyMy2P8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690619090; x=1691223890;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDfeQJB++iKVYQTZO520ErDHmQggE4dNUjS29xaJAXE=;
        b=hBSx3Q3bub3CO79ZamP7l2vtUiAGLul0xWCDgZ1S8uuVs84Hj3emV6LvINfGwqMyvp
         zdN5xW/8Q/T82lOpUU83vLBwDqFdDABqd9j9Pxs28lVzxk48Es/a4EmBI9DW/LNlJCpx
         8Rj4bP+AuqKAEF36/Cs+CsvdQ21+lDyvcM3fXvN3zAYGi/ewe1nicnNUtlt8Z8dp8t7E
         5XglMInIw8F159Cx6Fq/QRJWVTgExOLxt0gQV7qRTzxw3wbpMgtWpOiphGbEyXTyki7v
         wrzLYHnMzRFnpdU7cqkYzHuRQ9lzfziTj5nY2MGGqmNBB1u6XpsKjFdA4Uo+fJT4w39p
         pG5A==
X-Gm-Message-State: ABy/qLaziL6+6Kk38umK/MuzqTCw3r7729xUhxgKaJOtUR0HEdUmuCyr
	OfmELv0Q0fancenEvww9wgcwZQ==
X-Google-Smtp-Source: APBJJlG8C2SuOG7Dyizl9pdJX8plMKGq9s91joWrM2Ps2ck2Xln2c97OH19fqpUa67LrXhHfw47Thg==
X-Received: by 2002:adf:f9c4:0:b0:317:5fce:18e1 with SMTP id w4-20020adff9c4000000b003175fce18e1mr3134327wrr.23.1690619089846;
        Sat, 29 Jul 2023 01:24:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f929:4921:3439:ee63? ([2001:8b0:aba:5f3c:f929:4921:3439:ee63])
        by smtp.gmail.com with ESMTPSA id k14-20020a5d524e000000b0030fd03e3d25sm6819864wrc.75.2023.07.29.01.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 01:24:49 -0700 (PDT)
Message-ID: <b373c22ddf468a582df6e2d1ae4803e8eb8c3535.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH 1/2] base-passwd: Add the sgx group
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alex Kiernan <alex.kiernan@gmail.com>, Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 29 Jul 2023 09:24:48 +0100
In-Reply-To: <CAO5Uq5S6b1LpkeEXBL6eo-YELeRATERAu3ikOFsT=+UUgdG=sA@mail.gmail.com>
References: <20230728093950.12046-1-alex.kiernan@gmail.com>
	 <CAPoiz9xVrUn-B7U61CjrU7Qkq2tMVJ-znYbSMnv0zPFBUDSLhA@mail.gmail.com>
	 <CAO5Uq5S6b1LpkeEXBL6eo-YELeRATERAu3ikOFsT=+UUgdG=sA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jul 2023 08:24:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185051

On Fri, 2023-07-28 at 15:01 +0100, Alex Kiernan wrote:
> On Fri, Jul 28, 2023 at 1:52=E2=80=AFPM Jon Mason <jdmason@kudzu.us> wrot=
e:
> >=20
> > On Fri, Jul 28, 2023 at 5:40=E2=80=AFAM Alex Kiernan <alex.kiernan@gmai=
l.com> wrote:
> > >=20
> > > To avoid errors from eudev/udev we need an sgx group, but if we add i=
t
> > > via groupadd that causes shadow login to be brought into an image, wh=
ich
> > > causes images which have CONFIG_MULTIUSER unset to fail with `setgid:
> > > Function not implemented` as shadow's login doesn't implement the
> > > heuristics which busybox has to handle this kernel configuration.
> >=20
> > Firstly, thank you very much for fixing this.  I was having lots of
> > trouble with it.
> >=20
> > I just wanted to point out that the underlying sgx issue is unique to
> > Intel/x86.  So, it might make sense to only apply this patch in this
> > case.
> >=20
>=20
> You get the noise from eudev on everything (I'm deploying onto
> aarch64), I guess because it fails at parse time and everyone gets the
> same rules. Obviously we could try for an sgx only rule on x86, but
> tbh that feels like way too much effort!

FWIW I agree and merged this as the best of the bad options.

>=20
> I think we want something like this on poky-tiny so this doesn't regress:
>=20
> diff --git a/meta-poky/conf/distro/poky-tiny.conf
> b/meta-poky/conf/distro/poky-tiny.conf
> index f65d2dabf3af..728d161d59af 100644
> --- a/meta-poky/conf/distro/poky-tiny.conf
> +++ b/meta-poky/conf/distro/poky-tiny.conf
> @@ -122,3 +122,7 @@ SKIP_RECIPE[core-image-weston] =3D "not buildable
> with poky-tiny"
>=20
>  # Disable python usage in opkg-utils since it won't build with tiny conf=
ig
>  PACKAGECONFIG:remove:pn-opkg-utils =3D "python"
> +
> +# If shadow-base is brought into the image, logins will fail because it
> +# doesn't have the heuristics to work when CONFIG_MULTIUSER is unset.
> +PACKAGE_EXCLUDE:poky-tiny =3D "shadow-base"

A patch would be welcome for that please!

Cheers,

Richard


