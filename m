Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D24BC433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 02:10:12 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.61704.1638843011801792222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 18:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bj2PEod2;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id p19so12820235qtw.12
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 18:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6ywwhaqeJANeNKAV8paRgW6IFI4u4I8S53qLxNx2lVo=;
        b=Bj2PEod21N5XVJyTrmGUe5x5I1n43WV0T2ox3PgeXfNWgY/lOtjd6mRJdfdg7UCjF6
         wuRipyPi07ABXx9wNv2z47W5f48nbtBiFSgTHJJ82eANvqSllPXgodu3upY+9wxFz3O3
         /NeNiTFi2m0/1p669Utfrju0VCrV5utDmsmvfbLlZZVubmZBoONMLVl+i/5HS+prtJjh
         mxQ61D+NZFyDI17LWlqmLtDE5aimLoxNxVZDxNgzGzpfxDwpLtDTyuxU4s+iSLUS1EMy
         /g9/QSVnDn42feFFy0WyOaIp44mcA6SMkNR+byckkeKlFKWAJ5rZ011xXZV+yWYBFO2z
         ujzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6ywwhaqeJANeNKAV8paRgW6IFI4u4I8S53qLxNx2lVo=;
        b=xsmyfdcOVg/EgiPj+y55x5oIDlwaxsdEgGKljsluXYnIKZahNDpdf1UbiQdsVNLP25
         c6M9QN/kZPC3MfnMGbMpIZGZYG9z8RQIY9nWhUnHgkNihbKyyqdAxDWhlb0GWj8G0ywK
         +AgkPSMOlSv/PclYkP8+foBtgaSKFuVxSYviijJyRCkTcWqYd8XQ76hBlDfwfDqk+6fv
         gbfMksY6WYETuQN1SF/2Re75ywL4X9MxfOlmHyn9zs3hLZeBrP8FmsuSQskuDnS9vfjw
         u1vmSrhJppW0rdomvCjrI4eiq/pBcMSbyG3glix7QLZlYVV3us2Uhf53xw49mzROCJP4
         QmlQ==
X-Gm-Message-State: AOAM5339OzUjddafn2AVwbkkKtZ1aQRrN1Ifq3l35Xi7ECGdYSJdHt82
	xEmu23FneORizWPV1HtcGECEPyLVDDQtkiVHxTYZ4/+D49E=
X-Google-Smtp-Source: 
 ABdhPJw/XupzxuRWMC4/EG17wDLOLXU0zozQ5pkSiHH3aQ9XoTClzJbHSSkZoBnF9xv88n/5QjfXQHvzB3TqwtGEMoU=
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr44422244qtw.185.1638843010790;
 Mon, 06 Dec 2021 18:10:10 -0800 (PST)
MIME-Version: 1.0
References: <20211206221418.2281162-1-raj.khem@gmail.com>
 <fafa300be74d5ab50be74489d5d7725d9863bcda.camel@linuxfoundation.org>
 <CAMKF1sqK0Nxp3NBggH7br4K7Qyxx6voMk1rUXJpVhuxBTBSrUQ@mail.gmail.com>
 <61881d47fe575c33b194fc099b9688788e33f1d1.camel@linuxfoundation.org>
In-Reply-To: 
 <61881d47fe575c33b194fc099b9688788e33f1d1.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 Dec 2021 18:09:59 -0800
Message-ID: 
 <CAMKF1so8vh4mPAomuHS2q3s+kzR5h5_MDbs+OBAX+cNykvaXNQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Drop fsqrt implementation patches
 for fsl ppc
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000008037ce05d284df21"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 02:10:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159280

--0000000000008037ce05d284df21
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 6, 2021 at 3:32 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2021-12-06 at 15:28 -0800, Khem Raj wrote:
> >
> >
> > On Mon, Dec 6, 2021 at 2:51 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > > I did test such a patch today as well since we discussed it. I'd
> propose
> > > this
> > > commit message since we need to say why:
> > >
> > > """
> > >
> > > glibc: Drop ppc sqrt optimisations
> > >
> > > OpenEmbedded isn't an upstream or a patch repository. These are
> > > optimisations
> > > which for reasons unknown were never merged into upstream glibc. We
> have no
> > > active ppc maintainers and these patches are at an evolutionary dead
> end.
> > > Since they are optimisations, there may be small performance
> regressions by
> > > removing them but OE can't carry patches like this indefinitely and
> these
> > > appear to have no future.
> > > """
> > >
> >
> >
> > This sounds good to me. I guess will add it to commit or do you want me
> to
> > send v2. This passed my local testing on qemuppc
> >
>
> I can sort if you're ok with it, thanks.


Sounds good


>
> Cheers,
>
> Richard
>
>

--0000000000008037ce05d284df21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Dec 6, 2021 at 3:32 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;paddi=
ng-left:1ex;border-left-color:rgb(204,204,204)">On Mon, 2021-12-06 at 15:28=
 -0800, Khem Raj wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Dec 6, 2021 at 2:51 PM Richard Purdie<br>
&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_b=
lank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt; &gt; I did test such a patch today as well since we discussed it. I&#3=
9;d propose<br>
&gt; &gt; this<br>
&gt; &gt; commit message since we need to say why:<br>
&gt; &gt; <br>
&gt; &gt; &quot;&quot;&quot;<br>
&gt; &gt; <br>
&gt; &gt; glibc: Drop ppc sqrt optimisations<br>
&gt; &gt; <br>
&gt; &gt; OpenEmbedded isn&#39;t an upstream or a patch repository. These a=
re<br>
&gt; &gt; optimisations<br>
&gt; &gt; which for reasons unknown were never merged into upstream glibc. =
We have no<br>
&gt; &gt; active ppc maintainers and these patches are at an evolutionary d=
ead end.<br>
&gt; &gt; Since they are optimisations, there may be small performance regr=
essions by<br>
&gt; &gt; removing them but OE can&#39;t carry patches like this indefinite=
ly and these<br>
&gt; &gt; appear to have no future.<br>
&gt; &gt; &quot;&quot;&quot;<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; This sounds good to me. I guess will add it to commit or do you want m=
e to<br>
&gt; send v2. This passed my local testing on qemuppc=C2=A0<br>
&gt; <br>
<br>
I can sort if you&#39;re ok with it, thanks.</blockquote><div dir=3D"auto">=
<br></div><div dir=3D"auto">Sounds good</div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)" dir=3D"auto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--0000000000008037ce05d284df21--

