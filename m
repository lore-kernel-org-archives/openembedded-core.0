Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E3BC83F14
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 10:02:11 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.10323.1693389723618003700
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 03:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bdCZwv5V;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-31aeedbb264so4874801f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693389722; x=1693994522; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a1oV9nSOW3rEl9jDEMkgsr9SmKywrym4pjaye5kKuAI=;
        b=bdCZwv5VYv6WfG02y0aV0nCdzxPC5pMTYzl1nof64Vj/3XHG9FUbtpkbSaVPzYuJjZ
         twyIZn0Dh2G/B0W+byxyXnJyQTRGRuKPvJLcjgP4IQHCkoLDtHNAASU6ObraJfhZkp1n
         grSIHS51S4A6AJm0v5BkfYpq0WbEFxk59+U0WoSlWtq3TgufaSQqrAqt5x27PFE22huP
         VL60ZYbc114vNcmiP7NmB//9zHUGiL1p0emReuXy/qZqsiFz50meDPSxLVSvpvhXgZY+
         /WxXa6VA7iDnnfvcuNAy338A19IXa8VQPpIb6JR/4zFBXY5w7C6miG0fTivHUdCZdTMP
         2wnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693389722; x=1693994522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a1oV9nSOW3rEl9jDEMkgsr9SmKywrym4pjaye5kKuAI=;
        b=Dd0ZITk9KxDS5umMkiHTmZdN2iN7WSpq2j/tKTKefOvdqs80exbBpBelW8rHk8iU3M
         v1batPoWON8vcw09H63tbmeNKmn4Ur9n/wdETC8YQ7y+zhLHSBaTzm7neALUfmHHAnTt
         2Xea0JDbuB9yJRGZC24zZpI1Dt8xEWV0fu5MukNZJF83SSfiObEa0J0KrPtWn0qF17I5
         Qxfzq2yZoLh6Ozf8T9JKYMIxYiLuo0+28W11Ab3O1FYv0FNFFvP1FtIn/p+EbGzX5u9e
         Xp1pIyxQco547RExFax/L681qTr0EzSHSLEGrs7Yi36FzJ58Q9neq7Y3MdLcF+W7gFI4
         2iMg==
X-Gm-Message-State: AOJu0YzM/RL6HNd8+HY2Ybc6c9FlgvbeBYf/g2tI0cZv3g+g7Elz65nx
	tgHsHT5FzjuuxaDLoJhoUZxVVZYg94RYJFINb+s=
X-Google-Smtp-Source: AGHT+IF0e4QJn3kf1ZpG50Q8OcZhsagNhCRpdlMfcO3tiEDtaC1UggosJRtz4Vr9Bg29DexWYkgTM+0B+bJy3RiHs3Y=
X-Received: by 2002:adf:e608:0:b0:31a:e744:1297 with SMTP id
 p8-20020adfe608000000b0031ae7441297mr1282995wrm.50.1693389721671; Wed, 30 Aug
 2023 03:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230825171625.1213968-1-pkj@axis.com> <171af98e8758a2a933858f9b7297d1adb088c015.camel@linuxfoundation.org>
In-Reply-To: <171af98e8758a2a933858f9b7297d1adb088c015.camel@linuxfoundation.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Aug 2023 12:01:37 +0200
Message-ID: <CA+chaQceoRr3UYohwbiOsGCHpFdC3+gAShod_gmfw_EuG-g7Dw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base.bbclass: Do not fail during parsing if
 ${SRCREV} does not exist
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000d39f240604210420"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:02:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186879

--000000000000d39f240604210420
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

FWIW: I have seen this in some meta-evil-bsp and the unfortunate part is
that only the first parsing fatal error is shown at time, so to find all
recipes which now need SkipRecipe, because your bsp vendor is evil, takes
possibly many parsing cycles.

But in the end nobody should work with evil vendors, so maybe we should
take the sticks to them not to core.

On Wed, Aug 30, 2023 at 11:04=E2=80=AFAM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2023-08-25 at 19:16 +0200, Peter Kjellerstedt wrote:
> > After commit a8e7b0f932 (base/package: Move source revision information
> > from PV to PKGV) was integrated, having a recipe with a SRCREV that
> > currently cannot be fetched would lead to an exception during parsing.
> > Catch that exception and instead raise bb.parse.SkipRecipe. That way
> > the parsing continues as it should. Instead you now get a meaningful
> > error if you try build a recipe with a SRCREV that cannot be fetched,
> > e.g.:
> >
> >   ERROR: Nothing PROVIDES 'psplash'
> >   psplash was skipped: Fetcher failure: Unable to resolve 'unknown-ref'
> >   in upstream git repository in git ls-remote output for
> >   git.yoctoproject.org/psplash
>
> Something doesn't sound quite right in this description. You've said "a
> SRCREV that currently cannot be fetched" but "unknown-ref" will never
> be fetchable and is completely invalid as a revision. I'd guess bitbake
> is assuming it is a tag and trying to resolve it.
>
> I really don't like complicating the core code when it doesn't make
> sense to, particularly when it relates to cornercases most people don't
> hit. I think SkipRecipe is also the incorrect thing to do here,
> particularly when no reason is being passed back to bitbake to give
> back to the user.
>
> I suspect if you set the SRCREV to something that looks like a
> revision, like "badbadbadbadbadbadbadbadbadbadbadbadbadb" it will avoid
> the problems. Alternatively, just add the SkipRecipe locally along with
> your unknown-ref.
>
> Cheers,
>
> Richard
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186874):
> https://lists.openembedded.org/g/openembedded-core/message/186874
> Mute This Topic: https://lists.openembedded.org/mt/100960059/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000d39f240604210420
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I have seen this in some meta-evil-bsp and the unfor=
tunate part is that only the first parsing fatal error is shown at time, so=
 to find all recipes which now need SkipRecipe, because your bsp vendor is =
evil, takes possibly many parsing cycles.<div><br></div><div>But in the end=
 nobody should work with evil vendors, so maybe we should take the sticks t=
o them not to core.</div></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Wed, Aug 30, 2023 at 11:04=E2=80=AFAM Richard P=
urdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">On Fri, 2023-08-25 at 19:16 +0200, Peter Kjellersted=
t wrote:<br>
&gt; After commit a8e7b0f932 (base/package: Move source revision informatio=
n<br>
&gt; from PV to PKGV) was integrated, having a recipe with a SRCREV that<br=
>
&gt; currently cannot be fetched would lead to an exception during parsing.=
<br>
&gt; Catch that exception and instead raise bb.parse.SkipRecipe. That way<b=
r>
&gt; the parsing continues as it should. Instead you now get a meaningful<b=
r>
&gt; error if you try build a recipe with a SRCREV that cannot be fetched,<=
br>
&gt; e.g.:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0ERROR: Nothing PROVIDES &#39;psplash&#39;<br>
&gt;=C2=A0 =C2=A0psplash was skipped: Fetcher failure: Unable to resolve &#=
39;unknown-ref&#39;<br>
&gt;=C2=A0 =C2=A0in upstream git repository in git ls-remote output for<br>
&gt;=C2=A0 =C2=A0<a href=3D"http://git.yoctoproject.org/psplash" rel=3D"nor=
eferrer" target=3D"_blank">git.yoctoproject.org/psplash</a><br>
<br>
Something doesn&#39;t sound quite right in this description. You&#39;ve sai=
d &quot;a<br>
SRCREV that currently cannot be fetched&quot; but &quot;unknown-ref&quot; w=
ill never<br>
be fetchable and is completely invalid as a revision. I&#39;d guess bitbake=
<br>
is assuming it is a tag and trying to resolve it.<br>
<br>
I really don&#39;t like complicating the core code when it doesn&#39;t make=
<br>
sense to, particularly when it relates to cornercases most people don&#39;t=
<br>
hit. I think SkipRecipe is also the incorrect thing to do here,<br>
particularly when no reason is being passed back to bitbake to give<br>
back to the user.<br>
<br>
I suspect if you set the SRCREV to something that looks like a<br>
revision, like &quot;badbadbadbadbadbadbadbadbadbadbadbadbadb&quot; it will=
 avoid<br>
the problems. Alternatively, just add the SkipRecipe locally along with<br>
your unknown-ref.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186874): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186874" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/186874</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100960059/361=
7156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100960059/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000d39f240604210420--

