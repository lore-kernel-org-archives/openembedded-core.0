Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDCF5C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 11:41:57 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web08.4935.1637754116670964083
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 03:41:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eqtn6t+2;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id o1so4410589uap.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 03:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ilxPpAOvJwKoehPidssLvAyQsZ6H5fHAvEfHsvvWonA=;
        b=Eqtn6t+2RbJ9c/oB0FZ/+4iwjGW/VtioWzgJmf7bX3Xb3442wh0IFRZCU7NyVKlf+T
         juRKBiKAxYSg4pabaq4jxSsvmsSlJmBJUvVECVZm7mvrRJGH9yx1xJeSSSeH/6riI+L+
         rIvwl3lcm5shBjfjrC9vMojkDhJd1NN9NrtufeCZS/3Xz6Ze3/dg2Q6ezoeCqHFO3Jnb
         uM5RV3M1GxJO/j49wsXj98c4eTxdStIIk0vzcmb/CDXvvb6plM0LsF2o26wHl8aB7l6r
         yBuY6La+CiEDnkc/kp1rB3Il922Z0DYh+9Eqo//IcOSEeAmNJluoyJ8lFpgfUvh2pWdq
         XUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ilxPpAOvJwKoehPidssLvAyQsZ6H5fHAvEfHsvvWonA=;
        b=J8zHhtz91PRZFH8Wj3FNFobcV1VaYYnTMS4fEz2XyF0vp82R6tW8PJFMpVIARhsi/i
         etVUEnyBot64QMZ98vrMmmY3sNUnfRF/VDMT83emQ/xtijQv47Cua+Fj58+sschHHjzG
         691YApFsR3iIYEjcsaFIFiN2FehnpioZSXY2OiGYjwfIdso58iGmBg74K24VI6FOMTD4
         axz6uSHG3visAzGnlTjpATA435xE3Y5vsk86XDPm8nl1a+j0FhkMzxJKzWllNn9Gr4Nx
         woSbbzP3q5DgVexZmet2vUNYR+Dgqlm6E+PchLgG4ovjCisdfAmVIeXzLJpxC7WuoCQB
         oh8w==
X-Gm-Message-State: AOAM530ARnLvkMA/DHapXFcYYdOzR1Vnza4cE+9afLRQUtJr+zktImx4
	pUvBjFR5O3p9n4Dtt1nlqOeCYL0wVw3K4aqnD8s=
X-Google-Smtp-Source: 
 ABdhPJx1ZtGxBpxlnpKTXA8NE4QprQfp8VHF1EhwG9+qHryRACN3jautoHojPBN02NphXeuBuNRkMjcRd/W8AH5Yo44=
X-Received: by 2002:ab0:55ce:: with SMTP id w14mr9429675uaa.93.1637754115780;
 Wed, 24 Nov 2021 03:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20211124092521.1077244-1-alex@linutronix.de>
 <1771e4a17c093f41521f561c053b321cb001c275.camel@linuxfoundation.org>
In-Reply-To: 
 <1771e4a17c093f41521f561c053b321cb001c275.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Nov 2021 12:41:44 +0100
Message-ID: 
 <CANNYZj_+EAYrfmc0nMUoYyUVkKM1eagww4oFhkLVM0Dtc2EqUA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] insane.bbclass: do not hardcode oe-core path in
 upstream-status check
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000004cf2d505d18758be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 11:41:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158688

--0000000000004cf2d505d18758be
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Nov 2021 at 10:40, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> >         # skip patches not in oe-core
> > -       if '/meta/' not in fullpath:
> > +       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
> > +       match_oecore = oecore_re.search(fullpath)
> > +       if not match_oecore:
> >             continue
> >
>
> Does this pass the sstate tests? I have a feeling it may encode a path
> into the
> sstate checksums :/
>

I just ran 'oe-selftest -r sstatetests' with this and they all passed.

Alex

--0000000000004cf2d505d18758be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Wed, 24 Nov 2021 at 10:40, Richard Purdie &lt;<a href=3D"mailto:r=
ichard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# skip patches not in oe-core<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;/meta/&#39; not in fullpath:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oecore_re =3D re.compile(d.getVar(&#39;BBF=
ILE_PATTERN_core&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0match_oecore =3D oecore_re.search(fullpath=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if not match_oecore:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br>
&gt;=C2=A0 <br>
<br>
Does this pass the sstate tests? I have a feeling it may encode a path into=
 the<br>
sstate checksums :/<br></blockquote></div><div class=3D"gmail_quote"><br></=
div><div class=3D"gmail_quote">I just ran &#39;oe-selftest -r sstatetests&#=
39; with this and they all passed.</div><div class=3D"gmail_quote"><br></di=
v><div class=3D"gmail_quote">Alex<br></div></div>

--0000000000004cf2d505d18758be--

