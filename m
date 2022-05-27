Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6117AC433EF
	for <webhook@archiver.kernel.org>; Fri, 27 May 2022 10:07:38 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.1972.1653646051012517936
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 03:07:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pZM6o2Hc;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id p4so6184788lfg.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 27 May 2022 03:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l4wMyz4nBHfN6Eoxs+Sb9JuMumFKocI8o90ifj5GVyQ=;
        b=pZM6o2Hc0f59WHJAMiY0pucEsXGom4/jXBzEW/jI5NoHUEpp0meSqp05As8PgSWh24
         V777U9Ul2ZBzqQN4GIFDDGXH4fquoNysAvF4feo0ddPM3cmKX+euThGbxcmEeNzrCSo+
         wxT3+uJr7/iifgoxC4hy0FdA/0bOzpxxJ3O62yF1J+Fo35gsvWDe/EMwwsRPwJCDYr0W
         FBmrhLmzzGPjA/JYl1+sgDtGwHxieQcWFJJ9y6EVL5JU6zWYdHYkUKquYipYOyLIPGnN
         yl85yC5WduIhHYa5BXV+IJfPqy6D67+pRRNJ1vnaxA0CD8AfkzidiVVShlvpdm+E86xi
         Lsgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l4wMyz4nBHfN6Eoxs+Sb9JuMumFKocI8o90ifj5GVyQ=;
        b=a03KnkVNfwRk2Nq3/fq1YQIX+KyMMZ+It/lk0sKo6MJVqJUJSdp/XnwC7730KihRsA
         /lcUufRYEiqyLMoHLCNo2LRlplZaJ65YeiZkOVg/x719thJTV3g1OH9WeSRaofxVAP3I
         i/GIOeZ6FKnRoGu49lNYTuJluFjJBuwUIubo1198GjcOl7onKmXnZ2Q8mB3ONkMv5phR
         xtQEfz/MDUD2gvJTFUlkh9iEAGeb1bpUy7CPPXcvXCC6Y4pktdpUgmriLfXy6r4FvjKY
         cP6GN+7TQdtS2FUZac4Z4oCrpOK8y1Ks9pT/CaL4Dr8AolkBueYeQ6fjtsz3DPffYxch
         Pclg==
X-Gm-Message-State: AOAM530Jd79qXOTcOLm7cJ0hF9/gmjr8QicbhyvwyIp0lYqMK/+62l8s
	28AjJxUmBnlqk+8GZlIaW36p0KwDhdKrlkDNNRQ=
X-Google-Smtp-Source: 
 ABdhPJy4NpWyK/jM9cPqdnAqdvRcf0W+ftVXBwmzPGqcZc2/RS2XjnO64tjZXdCHyGTut9xF+W5RULi9nQ9yiUL1OX0=
X-Received: by 2002:a05:6512:3989:b0:477:caeb:1a13 with SMTP id
 j9-20020a056512398900b00477caeb1a13mr28604571lfu.64.1653646049146; Fri, 27
 May 2022 03:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220527082923.3652488-1-jose.quaresma@foundries.io>
 <1da31a89d51503ae233f426b185aefefd0f48446.camel@linuxfoundation.org>
In-Reply-To: 
 <1da31a89d51503ae233f426b185aefefd0f48446.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 27 May 2022 11:07:18 +0100
Message-ID: 
 <CANPvuRnw5D9Geyg0XVUQeBuHpxDQdq+m+HxhReM+m32OWr-JkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] archiver: exit to avoid race conditions
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000057fcc505dffb79c5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 May 2022 10:07:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166206

--00000000000057fcc505dffb79c5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<richard.purdie@linuxfoundation.org> escreveu no dia sexta, 27/05/2022 =C3=
=A0(s)
10:13:

> On Fri, 2022-05-27 at 09:29 +0100, Jose Quaresma wrote:
> > The archiver doesn't support using multiconfig sharing the same TMPDIR
> > so rise an error when we have something that shouldn't exist.
> >
> > When in the multiconfig and using the same TMPDIR: the two machines can
> make
> > the same copy at the same time to the same destination, which will not
> work.
> >
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> >  meta/classes/archiver.bbclass | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/classes/archiver.bbclass
> b/meta/classes/archiver.bbclass
> > index c19c770d11..5514e44a78 100644
> > --- a/meta/classes/archiver.bbclass
> > +++ b/meta/classes/archiver.bbclass
> > @@ -486,6 +486,8 @@ python do_unpack_and_patch() {
> >      if d.getVarFlag('ARCHIVER_MODE', 'diff') =3D=3D '1':
> >          src =3D d.getVar('S').rstrip('/')
> >          src_orig =3D '%s.orig' % src
> > +        if os.path.isdir(src_orig):
> > +            bb.error("A previous copy of the original source already
> exist '%s'" % src_orig)
> >          oe.path.copytree(src, src_orig)
> >
> >      if bb.data.inherits_class('dos2unix', d):
>
> I suspect we need to make archiver hard error if multiconfig is being
> used in that case. This can work around some subset of the races
> but could also still result in broken trees of files :(
>
> I'd also note that the patch will still break since bb.error doesn't
> actually exit, it just prints an error and causes the task to fail. You
> probably meant bb.fatal().


Sorry for that, it was bb.fatal() that I wanted to use, I will send a V2

But as you said it can solve some of the races but not all.
The right solution can be a check to see if multicast is enabled
and using the same TMPDIR but I don't know how to do that.
I need to think a little more about this.

Jose




> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000057fcc505dffb79c5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">&lt;<a href=3D"mailto:richard.purdie@=
linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; escreveu no=
 dia sexta, 27/05/2022 =C3=A0(s) 10:13:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Fri, 2022-05-27 at 09:29 +0100, Jose Quaresma wr=
ote:<br>
&gt; The archiver doesn&#39;t support using multiconfig sharing the same TM=
PDIR<br>
&gt; so rise an error when we have something that shouldn&#39;t exist.<br>
&gt; <br>
&gt; When in the multiconfig and using the same TMPDIR: the two machines ca=
n make<br>
&gt; the same copy at the same time to the same destination, which will not=
 work.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:jose.quaresma@found=
ries.io" target=3D"_blank">jose.quaresma@foundries.io</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/archiver.bbclass | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbc=
lass<br>
&gt; index c19c770d11..5514e44a78 100644<br>
&gt; --- a/meta/classes/archiver.bbclass<br>
&gt; +++ b/meta/classes/archiver.bbclass<br>
&gt; @@ -486,6 +486,8 @@ python do_unpack_and_patch() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if d.getVarFlag(&#39;ARCHIVER_MODE&#39;, &#39;diff=
&#39;) =3D=3D &#39;1&#39;:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src =3D d.getVar(&#39;S&#39;).rstrip=
(&#39;/&#39;)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 src_orig =3D &#39;%s.orig&#39; % src=
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.isdir(src_orig):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quot;A previous c=
opy of the original source already exist &#39;%s&#39;&quot; % src_orig)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 oe.path.copytree(src, src_orig)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&#39;dos2unix&#39;, d):<=
br>
<br>
I suspect we need to make archiver hard error if multiconfig is being<br>
used in that case. This can work around some subset of the races<br>
but=C2=A0could also still result in broken trees of files :(<br>
<br>
I&#39;d also note that the patch will still break since bb.error doesn&#39;=
t<br>
actually exit, it just prints an error and causes the task to fail. You<br>
probably meant bb.fatal().</blockquote><div>=C2=A0</div><div>Sorry for that=
, it was=C2=A0bb.fatal()=C2=A0that I wanted to use, I will send a V2</div><=
div><br></div><div>But as you said it can solve some of the races but not a=
ll.</div><div>The right=C2=A0solution can be a check to see if multicast=C2=
=A0is enabled</div><div>and using the same TMPDIR but I don&#39;t know how =
to do that.</div><div>I need to think a little more about this.</div><div><=
br></div><div>Jose</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">=C2=A0</blockquote><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000057fcc505dffb79c5--

