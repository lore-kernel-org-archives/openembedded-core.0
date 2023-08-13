Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFDAEB64DD
	for <webhook@archiver.kernel.org>; Sun, 13 Aug 2023 10:48:56 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web11.82953.1691923731889682287
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Aug 2023 03:48:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=XFtSIt/P;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-644e8aeb791so6187236d6.1
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 03:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691923731; x=1692528531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lZE7ogDcUVMK0YFZUOS1P8DKhYdcEhm/g41SKyGbND8=;
        b=XFtSIt/PgLFUaL77cFfPJa/FNXO9/TX2DkPbMDqBHdx5PPqtS+GBgXSlLwIicZtPZ4
         RP6Vj+oaQ1vq/dYPBri+kmiDP3uA2ig/MxwV5ho0k76Q0UNARhSMthtBFujnQEKFCqpX
         dnqoEZ3baw379jAuuImk/8VTWOXidw8p2CJ/a2TfM4Ak4PbXZetwtCh1IsNaewG8Rd+U
         4AgGpTmCKzVmtpc9pSHvErzkGMzzg28gy/iNy5QwlLHsP4TGI/yKLirAkFheUkAe/ztA
         W1xeE66Mx8FoqORHQt7OxNz6BFGELbhzcY1aQe/+jV5+CYsWuj8sadMVqTOabfbx9q1S
         UJ4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691923731; x=1692528531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lZE7ogDcUVMK0YFZUOS1P8DKhYdcEhm/g41SKyGbND8=;
        b=H+P2PetpG1ISHw/ieOvMoz1nIfeaFOgYN4YWivg4gY8X/OwLFgxvRZlEf5z7NYcvjp
         pATWoUE/vhOW0Xt8DZMso8L6YJi90CYdt3dhPaVUg8ajrfV7F8lXPaKzeQAq+9Ne02du
         aydkPdkm+h7foXLo1ZIgA1O/JM64+HyAqx39MfECV0m+kE9GC+aTdeIVkxBZM270vgiN
         L/kyQ0tMLURF9X83Y7CbdC2Xs7erhTQ2kX7d3C/v5v+xtvaHNBIFKdW3fN890VlZjFF8
         5NOqVpa4x9oF+gAQFcBDNyxfkJDIwmCOhJYb2/Dv00w8PLbGB4nLg7uZYVd6JnCNH0Om
         HfTg==
X-Gm-Message-State: AOJu0YzxGOpWhxBnvMwhQZkfPFVEtQrsIXInSD5FmCEwZlFP1yBwi2jl
	8QGCNVM0PYyh/Sa+W0myr5j3HybEc5id4DKfpUM=
X-Google-Smtp-Source: AGHT+IE3BrrLeHNQpSOnVmSoga5pX0Ki3ZZQpe0My8qNVgV/XD26YhRA2nfJTtiveNPw0xgKMKIU68NZlulbhYD/WEA=
X-Received: by 2002:a0c:fc05:0:b0:626:3a5a:f8dc with SMTP id
 z5-20020a0cfc05000000b006263a5af8dcmr6354009qvo.57.1691923730765; Sun, 13 Aug
 2023 03:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1691914589.git.frederic.martinsons@gmail.com> <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
In-Reply-To: <c4d2d924272d180ed88076e61dc59abc71d227f0.camel@linuxfoundation.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Sun, 13 Aug 2023 12:48:39 +0200
Message-ID: <CA+cAkeptfJVB=EzEm46898iXjnNodr7Ct9TzQ7FycOkCkiA0_Q@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCHV2 0/4] Introduction of cargo-c class and recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f59c400602cbb06e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Aug 2023 10:48:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185869

--000000000000f59c400602cbb06e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie <
richard.purdie@linuxfoundation.org> a =C3=A9crit :

> On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:
> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
> >
> > This is an RFC for introducing a new class and recipes that
> > help building C-ABI compatible header and library around
> > rust code.
> >
> > The third patch add examples and test to demonstrate
> > the usage and the good working of this use case.
> >
> > Test have been passed with the following in local.conf:
> >
> > CORE_IMAGE_EXTRA_INSTALL:append =3D " openssh-sshd openssh-scp cargo ru=
st
> rust-c-lib-example-bin"
> > IMAGE_CLASSES +=3D "testimage"
> > TEST_SUITES =3D "ping ssh rust"
> > # To use slirp option in testimage.bbclass
> > TEST_RUNQEMUPARAMS =3D "slirp"
> > TEST_SERVER_IP =3D "127.0.0.1"
> > QEMU_USE_SLIRP =3D "1"
>
> In testing it showed:
>
> stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe cargo-c
> in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/rust/
> cargo-c_0.9.18.bb does not contain a SUMMARY. Please add an entry.
> [missing-metadata]
> stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue: Recipe
> cargo-c in
> /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/rust/
> cargo-c_0.9.18.bb does not contain a SUMMARY. Please add an entry.
> [missing-metadata]
> stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recip=
e
> cargo-c in
> /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/rust/
> cargo-c_0.9.18.bb does not contain a SUMMARY. Please add an entry.
> [missing-metadata]
>

Thanks Richard, will take care of that soon.

Can you tell me what commands do you run to have that sanity check? It will
avoid me to do the same mistake next time I'll add a recipe.


> Cheers,
>
> Richard
>

--000000000000f59c400602cbb06e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le dim. 13 ao=C3=BBt 2023, 12:23, Richard Purdie &lt;<=
a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfo=
undation.org</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">On Sun, 2023-08-13 at 10:23 +0200, Frederic Martinsons wrote:<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com=
</a>&gt;<br>
&gt; <br>
&gt; This is an RFC for introducing a new class and recipes that<br>
&gt; help building C-ABI compatible header and library around<br>
&gt; rust code.<br>
&gt; <br>
&gt; The third patch add examples and test to demonstrate<br>
&gt; the usage and the good working of this use case.<br>
&gt; <br>
&gt; Test have been passed with the following in local.conf:<br>
&gt; <br>
&gt; CORE_IMAGE_EXTRA_INSTALL:append =3D &quot; openssh-sshd openssh-scp ca=
rgo rust rust-c-lib-example-bin&quot;<br>
&gt; IMAGE_CLASSES +=3D &quot;testimage&quot;<br>
&gt; TEST_SUITES =3D &quot;ping ssh rust&quot;<br>
&gt; # To use slirp option in testimage.bbclass<br>
&gt; TEST_RUNQEMUPARAMS =3D &quot;slirp&quot;<br>
&gt; TEST_SERVER_IP =3D &quot;127.0.0.1&quot;<br>
&gt; QEMU_USE_SLIRP =3D &quot;1&quot;<br>
<br>
In testing it showed:<br>
<br>
stdio: WARNING: cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe cargo-c in=
 /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/rust/<a hr=
ef=3D"http://cargo-c_0.9.18.bb" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">cargo-c_0.9.18.bb</a> does not contain a SUMMARY. Please add an entry.=
 [missing-metadata]<br>
stdio: WARNING: cargo-c-native-0.9.18-r0 do_recipe_qa: QA Issue: Recipe car=
go-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/rus=
t/<a href=3D"http://cargo-c_0.9.18.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">cargo-c_0.9.18.bb</a> does not contain a SUMMARY. Please add an=
 entry. [missing-metadata]<br>
stdio: WARNING: nativesdk-cargo-c-0.9.18-r0 do_recipe_qa: QA Issue: Recipe =
cargo-c in /home/pokybuild/yocto-worker/a-full/build/meta/recipes-devtools/=
rust/<a href=3D"http://cargo-c_0.9.18.bb" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">cargo-c_0.9.18.bb</a> does not contain a SUMMARY. Please add=
 an entry. [missing-metadata]<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">Thanks Richard, will take care of that soon.=
=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Can you tell me w=
hat commands do you run to have that sanity check? It will avoid me to do t=
he same mistake next time I&#39;ll add a recipe.=C2=A0</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"></blockquote></div></div><div dir=3D"auto"><div class=3D"gmai=
l_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div></div></div>

--000000000000f59c400602cbb06e--

