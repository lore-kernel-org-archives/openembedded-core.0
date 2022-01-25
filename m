Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3614BC433F5
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 16:24:47 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.9430.1643127886108940799
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zvq0H3Bm;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id y17so24177988qtx.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Jan 2022 08:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mQMSq6afD7vgxErhCbvEnb/B3kLkIH92zinoR4AHmxU=;
        b=Zvq0H3BmLDcSq/YWTs1N721vJI3YCHerwb3MoAlrftdoWCJBGt7n9H0h1o+CMNT5Tx
         +3y2Dsu55CYlzixfg/KiSPfU+uHFNuQZcU2vMGvG7ihsmiF2jNaacDcy4CV0t6EwWGM4
         WgB1uCK/IcNbF66WeawJ3qTrNMzKdzWpm9+ZUGBr5rDGu7FoVDBeA9BNzVqJVv/cPX9Y
         b7eAN39H8GfAjQR7H+uIbqQgkUY3QWifXyW1GdXJHTM9DLc6k7KMuzU/n2fjgtzVguRH
         hhiVPZ5ohKqf5UjYn7Pu+Wh/dmcICmBAxlg3/IyZ5HEyMlBYrmtpVP3o1S9fdENIMIqV
         mGqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mQMSq6afD7vgxErhCbvEnb/B3kLkIH92zinoR4AHmxU=;
        b=PqKQG1rbAH3o7Tu+kyRRZAuweOuN18VlrPzDty13dz+ifgTvBHC70A0Wob9S3ptS0F
         K7D671vC6LISP7pPY6eQKmgJcOHDZg5Zl3k2zJf/WCziEyeobE0i1DmCiPe9Fa0vb4mL
         L9ptmprqM+qkMqX6cFe89lt5MyjdWjXXs1H4XvULfEUrm57UgW4xhn8zz3Q1B4CLXYQN
         WzbUvS2zhLzr+HgplYtzCR3viGzoZ5FF5IEPauArfYU5olVtJv5NB2qSOO0/kkTkO40F
         r3p+hSITsUDPygF2yDgVfUngk51ZoNamlmQ7gi61yaA2Md/4Qxkz+SJ3WVHZvjksnAGm
         5p1A==
X-Gm-Message-State: AOAM530u33W5tufOiq5BntXOKwdU1kfKD48ok+tFcihaP4zIJ28O38zJ
	3/UxMtBcD279B4x5SMu7J9iJVjtilhGd56dG9xk=
X-Google-Smtp-Source: 
 ABdhPJx1R8YqTF3oGWtjIGFh2s5FP8xkyT7Pt+lvaV/0wv2C7F3mdj86diP3aHLF1MRhjNmNsISfwd+xFrje2JfOHFs=
X-Received: by 2002:a05:622a:553:: with SMTP id
 m19mr232258qtx.229.1643127885089;
 Tue, 25 Jan 2022 08:24:45 -0800 (PST)
MIME-Version: 1.0
References: <20220124181219.2764108-1-raj.khem@gmail.com>
 <CAAnfSTvR3oeghGh8aDJmGkM2eWvgGqeAyYtvZSd8uOJ0KiYGuQ@mail.gmail.com>
 <16CD6DAF232F9743.31937@lists.openembedded.org>
 <b1c00ec1-86e2-b24c-4b80-25b2938ca2d0@t-online.de>
 <8f5b7c60d42151f7673e22d87930bf1ca68eac7f.camel@linuxfoundation.org>
In-Reply-To: 
 <8f5b7c60d42151f7673e22d87930bf1ca68eac7f.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Jan 2022 08:24:34 -0800
Message-ID: 
 <CAMKF1so3wMpeXAs9uTwtcY1UGubFBC9E59H_qiz04iBPQ5hUAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-dbusmock: Add native recipe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e950dc05d66a85ae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Jan 2022 16:24:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160945

--000000000000e950dc05d66a85ae
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 25, 2022 at 4:08 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2022-01-25 at 07:25 +0100, Markus Volk wrote:
> > The python3-dbusmock dependency could be dropped if folks is build with
> > EXTRA_OEMESON += "-Dtests=false"
>
> What you can often do is make it a PACKAGECONFIG and then change the
> PACKAGECONFIG for the native version of the recipe to something more
> minimal?


Still having a native variant will be required to enable them so this patch
should definitely help in that case

>
>
> Cheers,
>
> Richard
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160917):
> https://lists.openembedded.org/g/openembedded-core/message/160917
> Mute This Topic: https://lists.openembedded.org/mt/88653359/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e950dc05d66a85ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Jan 25, 2022 at 4:08 AM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, 2022-=
01-25 at 07:25 +0100, Markus Volk wrote:<br>
&gt; The python3-dbusmock dependency could be dropped if folks is build wit=
h<br>
&gt; EXTRA_OEMESON +=3D &quot;-Dtests=3Dfalse&quot;<br>
<br>
What you can often do is make it a PACKAGECONFIG and then change the<br>
PACKAGECONFIG for the native version of the recipe to something more minima=
l?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Still having a=
 native variant will be required to enable them so this patch should defini=
tely help in that case=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"a=
uto"><br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160917): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160917" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160917</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88653359/1997=
914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88653359/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000e950dc05d66a85ae--

