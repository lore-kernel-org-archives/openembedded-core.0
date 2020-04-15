Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com [209.85.221.196])
 by mx.groups.io with SMTP id smtpd.web10.21046.1586976041356149583
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Apr 2020 11:40:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WDXxRgUa;
 spf=pass (domain: gmail.com, ip: 209.85.221.196, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f196.google.com with SMTP id g129so1138156vkh.9
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Apr 2020 11:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xY5bphfeezLeNF0CsBTf4P8U1RiNAHACkEQboaeyDow=;
        b=WDXxRgUaAE3fEd7cyPU2IAcwpVCiAPJPC2h33Gwk0FhjSBZylaZPpvScw99nIkqsUG
         jV5xQhmsZF+Xj17WNX8nMMQPeC0Fi1OVCtXyGosOKLS/tkvfbB76KzQq7eDGNz0J4UkS
         rISva7BY1AHBnbnnb0DUvRQQ2T+MmfFD1ZjbZbBwrxofo+ySXHPFC/8ffI1nT3/nWjTH
         ZApEKhgA8AaxDrpLKsKmxjs2vytmTpRx3ZPEnrd2OJnyIq0G7jXAs7LSuyxgIWNuBFTa
         StiiEM1F/qweWullhb8uWopqS1kEAdTjJved0PGAUVaCHjgVtmtAfzQA61EsCx8xi+H8
         4Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xY5bphfeezLeNF0CsBTf4P8U1RiNAHACkEQboaeyDow=;
        b=tOmx2Ie0Lfn08SxpR8tjvl82mQZcnR5s+O/Ma2OR0v1wHR+/uQIpaTEzsqjsvKpDSc
         kh2RtwU5GMK3rboOh+sHr7JleJoNYABoCD/MSZwuP6L7VWcEnBGjnHjQIJzxXhQtvKhg
         EOV7+Rln3foK7dqKbpewAXZF2M6PtPzlL3aPe2QtHBeacPLUjnNBCR7hA2m9T8vtJmgW
         hbPHXOz97V2z9AKkoibWTG7AOLnFFZetq2fP/v1MGUYGFw67MFK1QdGAA+Juc3XzC5As
         CnSXxpXU3LiAVjmXRH65+fEOnhfEorCod18Rz3oXXdhNyNOmw/q4d/LrC3kQseNjnFmW
         TR8g==
X-Gm-Message-State: AGi0PuZWgZvHJtd+2cO7c/2oMVasmubNaGsF3e4vGO/n4lSN3vM8C+FZ
	a3hFoFWNe02jlJIi7wpq5KpTPd4jj/dHYulhC6s=
X-Google-Smtp-Source: APiQypIbQedgqXJY/Z3EE91N9uGGYp1zXhMVX/SPJiuojJ3lvRHsCq48Yu2qs/eo9rY/dKjKV3atUhf6kWY9nyg/qxs=
X-Received: by 2002:a1f:2154:: with SMTP id h81mr19067091vkh.9.1586976040432;
 Wed, 15 Apr 2020 11:40:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200324213647.20829-1-alex.kanavin@gmail.com> <87y2qwfvhk.fsf@windriver.com>
In-Reply-To: <87y2qwfvhk.fsf@windriver.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 15 Apr 2020 20:40:28 +0200
Message-ID: <CANNYZj8Ma_3gm9XE6gcSshJiu7xSoEy9ygpWZK-91HnqzTgnog@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] quilt: do not test patch-wrapper as it is not enabled
To: "Mingde (Matthew) Zeng" <matthew.zeng@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000028399205a358a7ff"

--00000000000028399205a358a7ff
Content-Type: text/plain; charset="UTF-8"

Richard didn't want to merge the patch, as the intermittent nature of the
failure means there may be a deeper issue that will not be solved by
disabling the test that exposes it. Sadly I have not been able to reproduce
this at all, so if you have better ideas or a good understanding of what
the test is doing, you are welcome to help.

Alex

On Wed, 15 Apr 2020 at 20:35, Mingde (Matthew) Zeng <
matthew.zeng@windriver.com> wrote:

>
> Can we get an update regarding the status of this patch? It is to fix
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=13841 which the target
> milestone is set to 3.1 M4.
>
> Thanks,
> Matthew
>
> Alexander Kanavin <alex.kanavin@gmail.com> writes:
>
> > Upstream only enables the test if --with-patch-wrapper
> > was supplied to ./configure, and so should we.
> >
> > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> > ---
> >  meta/recipes-devtools/quilt/quilt.inc | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-devtools/quilt/quilt.inc
> b/meta/recipes-devtools/quilt/quilt.inc
> > index d6d06c049c..d2db079e0b 100644
> > --- a/meta/recipes-devtools/quilt/quilt.inc
> > +++ b/meta/recipes-devtools/quilt/quilt.inc
> > @@ -71,6 +71,9 @@ do_install_ptest() {
> >       tar -c --exclude=mail.test --exclude=delete.test test/ | ( cd
> ${D}${PTEST_PATH} && tar -xf - && chmod 777 test)
> >       cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}
> >       cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
> > +
> > +     # This is specifically excluded when --with-patch-wrapper is
> absent during ./configure
> > +     rm ${D}${PTEST_PATH}/test/patch-wrapper.test
> >  }
> >
> >  PACKAGES += "guards guards-doc"
>
>
> --
> Mingde (Matthew) Zeng
>

--00000000000028399205a358a7ff
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Richard didn&#39;t want to merge the patch, as the in=
termittent nature of the failure means there may be a deeper issue that wil=
l not be solved by disabling the test that exposes it. Sadly I have not bee=
n able to reproduce this at all, so if you have better ideas or a good unde=
rstanding of what the test is doing, you are welcome to help.<br></div><div=
><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, 15 Apr 2020 at 20:35, Mingde (Matthew=
) Zeng &lt;<a href=3D"mailto:matthew.zeng@windriver.com">matthew.zeng@windr=
iver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex"><br>
Can we get an update regarding the status of this patch? It is to fix <a hr=
ef=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D13841" rel=3D"nor=
eferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.cgi?i=
d=3D13841</a> which the target milestone is set to 3.1 M4.<br>
<br>
Thanks,<br>
Matthew<br>
<br>
Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_=
blank">alex.kanavin@gmail.com</a>&gt; writes:<br>
<br>
&gt; Upstream only enables the test if --with-patch-wrapper<br>
&gt; was supplied to ./configure, and so should we.<br>
&gt;<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gm=
ail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-devtools/quilt/quilt.inc | 3 +++<br>
&gt;=C2=A0 1 file changed, 3 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devt=
ools/quilt/quilt.inc<br>
&gt; index d6d06c049c..d2db079e0b 100644<br>
&gt; --- a/meta/recipes-devtools/quilt/quilt.inc<br>
&gt; +++ b/meta/recipes-devtools/quilt/quilt.inc<br>
&gt; @@ -71,6 +71,9 @@ do_install_ptest() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0tar -c --exclude=3Dmail.test --exclude=3Ddel=
ete.test test/ | ( cd ${D}${PTEST_PATH} &amp;&amp; tar -xf - &amp;&amp; chm=
od 777 test)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/Makefile ${D}${PTEST_PATH}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# This is specifically excluded when --with-patch=
-wrapper is absent during ./configure<br>
&gt; +=C2=A0 =C2=A0 =C2=A0rm ${D}${PTEST_PATH}/test/patch-wrapper.test<br>
&gt;=C2=A0 }<br>
&gt;<br>
&gt;=C2=A0 PACKAGES +=3D &quot;guards guards-doc&quot;<br>
<br>
<br>
--<br>
Mingde (Matthew) Zeng<br>
</blockquote></div>

--00000000000028399205a358a7ff--
