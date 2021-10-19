Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85320C433F5
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 17:45:56 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web12.13508.1634665555032868059
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 10:45:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OH6JMdgD;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id r17so1491449uaf.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Oct 2021 10:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=freAlq4YHeipHANuS5t0P9kGTxfmMlNKxljPMNgI3us=;
        b=OH6JMdgD5Tgf0k/DEcfAd02gPgHM8W6K3kO/uiK4+1luy+EuJekmlWAhrffS0j56n5
         Tsuc01I1EuvVKCQqqcXIEbcwP/WSx/FQGbloTUI05kOw4U30N0NCKyL9yhRV6ynMOzgg
         MMzKnpkSSim/du0QHMf1stSKm0LIoSJVAASYQbvrvHYOkJlHu4XYp0qAk0yZ4BZwBQD0
         LJNHTynilpL4+dtoczH7HajGgykbDwEvXTrptYclgkOJC8zrs56Ixk15reDzFBR/jDdu
         t5bosWZ5fUR2QDv3B27Ie8Lq5iXNg/2EmcNdimFOUnDbompzLQyibTWGLpvov7Nrmg32
         jrIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=freAlq4YHeipHANuS5t0P9kGTxfmMlNKxljPMNgI3us=;
        b=bSKu3Kr7kGUU1Are6PKwQyjZ+jSzvalfF2gESUDxykEyDT/KMyQfLdn466hag7yl8F
         EWeaPRTrnJDCaN+bSpeXCaLTGupMohEAxoibPifIGg8moMvLrRZgVdcwktknFiLDlzYp
         6Y60xMIsZPRW3bkz9Ye8WaSu8eyHMSB4hR0AK+6defNh7Wj51PRFPgfGMZ7FPCrN3I8U
         QrCxKOmsFWjOwZBreIFYZppGUHbpgA4XW1SWuzFlPMjfNhAjj0HDNulgiTD3rk/E2ZoJ
         VS/e9E0y9kfTZ2gGaxPxSSp8fg7jrO+4Egc8ZXGDsFyGkH0in4BG0h7QBzPgY3MYYRRA
         XHKg==
X-Gm-Message-State: AOAM533ZDnXbZP9XR3RXQhPsmc8GFxkRl2KHtCctl5iNXrYcfVqXHDBN
	mlm0IxkWcJxHrq5otwoEW6mrE3+Jnm6xrXj8lrs=
X-Google-Smtp-Source: 
 ABdhPJwkIgQLKIDhKgny15U4QHW8cCEM7wjSKaUiY7ZkIYnyh+qBoxHXp9ocrv3NXaYGDhVAaSze0DPZwIZ5fvaNuSo=
X-Received: by 2002:a05:6102:951:: with SMTP id
 a17mr36322656vsi.18.1634665554217;
 Tue, 19 Oct 2021 10:45:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211019153419.3319802-1-alex@linutronix.de>
 <20211019153419.3319802-65-alex@linutronix.de>
 <ebae2be9-c655-3f39-cd09-eeef03b30e3d@gmail.com>
In-Reply-To: <ebae2be9-c655-3f39-cd09-eeef03b30e3d@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 19 Oct 2021 19:45:43 +0200
Message-ID: 
 <CANNYZj_OUE5cgp_ARRxU=Yub2vn12T_ZtrNn6qsdsStHgEzw-A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 65/65] systemd: disable seccomp on mips32
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>,
 openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000af958e05ceb83b97"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 17:45:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157193

--000000000000af958e05ceb83b97
Content-Type: text/plain; charset="UTF-8"

Can you explain why please?

Alex

On Tue 19. Oct 2021 at 18.47, Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 10/19/21 8:34 AM, Alexander Kanavin wrote:
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >   meta/recipes-core/systemd/systemd_249.5.bb | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-core/systemd/systemd_249.5.bb
> b/meta/recipes-core/systemd/systemd_249.5.bb
> > index 70f8813895..47d5209f96 100644
> > --- a/meta/recipes-core/systemd/systemd_249.5.bb
> > +++ b/meta/recipes-core/systemd/systemd_249.5.bb
> > @@ -111,6 +111,9 @@ PACKAGECONFIG:remove:libc-musl = " \
> >       utmp \
> >   "
> >
> > +# https://github.com/seccomp/libseccomp/issues/347
> > +PACKAGECONFIG:remove:mips = "seccomp"
> > +
>
> this should be mipsarch
>
> >   CFLAGS:append:libc-musl = " -D__UAPI_DEF_ETHHDR=0 "
> >
> >   # Some of the dependencies are weak-style recommends - if not
> available at runtime,
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157184):
> https://lists.openembedded.org/g/openembedded-core/message/157184
> > Mute This Topic: https://lists.openembedded.org/mt/86442719/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--000000000000af958e05ceb83b97
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Can you explain why please?</div><div dir=3D"auto"><br></=
div><div dir=3D"auto">Alex</div><div><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Tue 19. Oct 2021 at 18.47, Khem Raj &lt;<=
a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;padding-left:1ex;border-left-co=
lor:rgb(204,204,204)"><br>
<br>
On 10/19/21 8:34 AM, Alexander Kanavin wrote:<br>
&gt; Signed-off-by: Alexander Kanavin &lt;<a href=3D"mailto:alex@linutronix=
.de" target=3D"_blank">alex@linutronix.de</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.=
bb" rel=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a> | 3 +++<br>
&gt;=C2=A0 =C2=A01 file changed, 3 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5=
.bb" rel=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a> b/meta/recip=
es-core/systemd/<a href=3D"http://systemd_249.5.bb" rel=3D"noreferrer" targ=
et=3D"_blank">systemd_249.5.bb</a><br>
&gt; index 70f8813895..47d5209f96 100644<br>
&gt; --- a/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a><br>
&gt; +++ b/meta/recipes-core/systemd/<a href=3D"http://systemd_249.5.bb" re=
l=3D"noreferrer" target=3D"_blank">systemd_249.5.bb</a><br>
&gt; @@ -111,6 +111,9 @@ PACKAGECONFIG:remove:libc-musl =3D &quot; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0utmp \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +# <a href=3D"https://github.com/seccomp/libseccomp/issues/347" rel=3D=
"noreferrer" target=3D"_blank">https://github.com/seccomp/libseccomp/issues=
/347</a><br>
&gt; +PACKAGECONFIG:remove:mips =3D &quot;seccomp&quot;<br>
&gt; +<br>
<br>
this should be mipsarch<br>
<br>
&gt;=C2=A0 =C2=A0CFLAGS:append:libc-musl =3D &quot; -D__UAPI_DEF_ETHHDR=3D0=
 &quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Some of the dependencies are weak-style recommends - if =
not available at runtime,<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157184): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157184" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157184</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86442719=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86442719/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--000000000000af958e05ceb83b97--

