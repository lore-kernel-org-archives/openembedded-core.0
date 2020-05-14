Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
 by mx.groups.io with SMTP id smtpd.web10.1324.1589491174796383449
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 May 2020 14:19:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WYY4q2TV;
 spf=pass (domain: gmail.com, ip: 209.85.217.66, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f66.google.com with SMTP id 1so2887837vsl.9
        for <openembedded-core@lists.openembedded.org>; Thu, 14 May 2020 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vgkx7FCe/760Vs/XzqKIzZPcVQ1QZMabtIK+ud4gLJE=;
        b=WYY4q2TVIPwzwjbRmvr+dUdDN+FjMBLyZLMW+ZknVUCS9BJIpK+UnpV0cwuNkHQuLN
         /RKHbtz+aL0z1312/gmU6rQOAje0eeEvErJlktaVkXN128F+BVI495GRYI8jGCQo4d5d
         Cg9aJVezAZ9hyqzHwfajwcZ+K/f4DvXbtbg0rnLfSyqfu6u08aqLm+JWd33g9fehgSQd
         vMlwyVMPtFYHAN/QAGUBBJqdBNzFtY9Thp4DnGxrvptd2C23ibRquAVwenL5QsDUeUa7
         bilHrSmWJ7F44+OaQIsdR/NZgs/BMDaLfAUw7QH8MfrqUUM3Q2eltrk6n56wgRSjQfqi
         n7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vgkx7FCe/760Vs/XzqKIzZPcVQ1QZMabtIK+ud4gLJE=;
        b=Pp+g3d8txREB+KIsNMie3m6SbU57Uy2hlr/dAOiRrkfcrMkXQX8YpICmVvdUMI8FZo
         L1XQqREV+5+ZUrRQcFXAxzprV+Mdgx2Dgk9kvGilYbeNq7T7ZY6V3dygV46btjSxfjkY
         NFlRT7lJ641Yc8u0+74cVBeaLWG0mGWACQH6oXlfHxsLG9dw7o6tUTO2D5rF+iPkpItp
         yvhQ/XL9cCTxyoNsykPBxqyjWYA2Ly+r1/gaVqI4uClPvZ25RVJo2z9+6MGpkOobtYE2
         7yYuZNa9wheFimMNV94V+8IOWnvyXrMpalEKHkztAEcOkt7SA8lSF48lv3LJlmkcH52S
         /0+A==
X-Gm-Message-State: AOAM530/ZMEK2PeLV6vGm+tgXHzXoX2P00+pp0/CsLWRzF8ZtzU9/15x
	H0OcbbQoRatoZodU8DHUiVJ6jVMuLgliMOoMK4k=
X-Google-Smtp-Source: ABdhPJzJS0bijhJTMvUo04ekyjQ/vOc4CyTcyxKNYsQ4DHGpy6wR5is7g5+zqbiCVHrQMrIMjBr6K0rL3qwrLygYKcg=
X-Received: by 2002:a67:df86:: with SMTP id x6mr287362vsk.94.1589491173831;
 Thu, 14 May 2020 14:19:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200514142107.20702-1-diego.rondini@kynetics.com>
 <CANNYZj8_gXYNTewvCX3TFp5nj9LP6+cZfKYgdBEF9Y_F_U2S_A@mail.gmail.com> <CAMfw5YofhKNfDTmSAKf+Xa=jU49F4FedfZsyYBdJKWv3c4wgwA@mail.gmail.com>
In-Reply-To: <CAMfw5YofhKNfDTmSAKf+Xa=jU49F4FedfZsyYBdJKWv3c4wgwA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 14 May 2020 23:19:22 +0200
Message-ID: <CANNYZj_Z1ipdudKMFhwwqJ29_9wKCRRyyg3JF2d1aUVzOwy=ew@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bmap-tools: update to latest git master
To: Diego Rondini <diego.rondini@kynetics.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ca395f05a5a240a8"

--000000000000ca395f05a5a240a8
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2020 at 22:59, Diego Rondini <diego.rondini@kynetics.com>
wrote:

> Hi Alexander,
>
> On Thu, May 14, 2020 at 7:31 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> You can't generally update to a random development commit, especially if
>> PV stays the same. Please ask upstream to make a new release.
>>
>>
> Thank you for your feedback, I understand your point.
> The odd thing is that the situation is already broken, as what's in
> oe-core master right now is not bmap-tools release 3.5, but some "random
> development commit" in between 3.5 and current master:
>
> http://git.openembedded.org/openembedded-core/commit/meta/recipes-support/bmap-tools?id=3fbee26af2f3263180f75652b5dd6e50adb1d8fe
>
> https://github.com/intel/bmap-tools/commits/master
> Release 3.5:
>
> https://github.com/intel/bmap-tools/commit/14b411a65c371e273fe599bee9e52bd9f9b751e1
> Commit in oe-core:
>
> https://github.com/intel/bmap-tools/commit/db7087b883bf52cbff063ad17a41cc1cbb85104d
>
> What do you suggest?
>

Right - generally we need to trust that version updates don't do this, and
there's no easy way to detect this. The recipe already does:
PV .= "+git${SRCPV}"
which is the standard way to mark "random development commits", so I'd say
resubmit your patch with an explanation in the commit log
that you're merely bumping one development snapshot to a newer development
snapshot.

--000000000000ca395f05a5a240a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 14 May 2020 at 22:59, Diego Rondi=
ni &lt;<a href=3D"mailto:diego.rondini@kynetics.com">diego.rondini@kynetics=
.com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hi Alexa=
nder,<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, May 14, 2020 at 7:31 PM Alexander Kanavin &lt;<a href=3D"m=
ailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div =
dir=3D"ltr"><div>You can&#39;t generally update to a random development com=
mit, especially if PV stays the same. Please ask upstream to make a new rel=
ease.</div><div><br></div></div></blockquote><div><br></div><div>Thank you =
for your feedback, I understand your point.</div><div>The odd thing is that=
 the situation is already broken, as what&#39;s in oe-core master right now=
 is not bmap-tools release 3.5, but some &quot;random development commit&qu=
ot; in between 3.5 and current master:</div><div><a href=3D"http://git.open=
embedded.org/openembedded-core/commit/meta/recipes-support/bmap-tools?id=3D=
3fbee26af2f3263180f75652b5dd6e50adb1d8fe" target=3D"_blank">http://git.open=
embedded.org/openembedded-core/commit/meta/recipes-support/bmap-tools?id=3D=
3fbee26af2f3263180f75652b5dd6e50adb1d8fe</a></div><div><br></div><div><a hr=
ef=3D"https://github.com/intel/bmap-tools/commits/master" target=3D"_blank"=
>https://github.com/intel/bmap-tools/commits/master</a></div><div>Release 3=
.5:<br><a href=3D"https://github.com/intel/bmap-tools/commit/14b411a65c371e=
273fe599bee9e52bd9f9b751e1" target=3D"_blank">https://github.com/intel/bmap=
-tools/commit/14b411a65c371e273fe599bee9e52bd9f9b751e1</a></div><div>Commit=
 in oe-core:</div><div><a href=3D"https://github.com/intel/bmap-tools/commi=
t/db7087b883bf52cbff063ad17a41cc1cbb85104d" target=3D"_blank">https://githu=
b.com/intel/bmap-tools/commit/db7087b883bf52cbff063ad17a41cc1cbb85104d</a><=
/div><div><br></div><div>What do you suggest?</div></div></div></blockquote=
><div><br></div><div>Right - generally we need to trust that version update=
s don&#39;t do this, and there&#39;s no easy way to detect this. The recipe=
 already does:</div><div>PV .=3D &quot;+git${SRCPV}&quot;</div><div>which i=
s the standard way to mark &quot;random development commits&quot;, so I&#39=
;d say resubmit your patch with an explanation in the commit log</div><div>=
that you&#39;re merely bumping one development snapshot to a newer developm=
ent snapshot.<br></div><div> <br></div></div></div>

--000000000000ca395f05a5a240a8--
