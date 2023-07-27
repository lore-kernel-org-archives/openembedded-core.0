Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D59C0015E
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 19:05:02 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.15829.1690484696333347867
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jul 2023 12:04:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ALtdRJA8;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.46, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-98e011f45ffso169854966b.3
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 12:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690484695; x=1691089495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FGOBs8kxsVrbJUkOOuw6OHPLpRE+Y01TmkfiWl8oVlo=;
        b=ALtdRJA8rqgup1wCYTEaqBlilWbHx1cVujNojirQ4GFmNWHVbRlaI4+h58XNjf9P1k
         dirwyKQuIZYiVHZHTr1yzXLto9hZXFfwiuQLzeR1Hz6IOkKS//1G8IK77V1IWyOCXwiK
         A1DahT1AHVemiuWyfxKVasrAwNCu2ZRC3/O7e7Et5TAnSowxCNFHpdIZZB5Str/kOpV1
         P9r/dT3ApYKTpu0/Heyk0V8FWHhLG9Z2iXeLQWNMDCEvG6auiW/GDL42UyFj4jiwTIkU
         E+AsRmNKqw5NmwrYxfWWeKupYvn+EmmP8vppdEDjIq4Of4YNLgmGLJZ7ocsrGPXjbcmn
         wAUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690484695; x=1691089495;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGOBs8kxsVrbJUkOOuw6OHPLpRE+Y01TmkfiWl8oVlo=;
        b=fLjphBflu93BsnydNqLu36PcjjOZYu38Y5jlE9ZDnnqNRPKxlhT6TIZwyl4h7Vhq11
         JvWJrH4ycKGNSqQ0iyHZ+a/k1aYUJud56uXltgbqqe7YqFyOp+qpq557KGyfXYyRJvKS
         ve09AXo08jFOZhwaBtbPZOkSA8bwYSV5vAfTS5BPLJzD5n4FqmXJNhWVWIXML+ThjERz
         VeEtK92zwWDgxQlcNFuNYb6oL62qCcl5FEcgLtS9yGVxuGCaFcKeQddzhkMULsTxzr+S
         zS52JSJJOZmU6zpGzcyEXptUfcOThZerZEKd/yQDwmutOmxPWlpNzPx+lVZZOxHSVZ5p
         gHAQ==
X-Gm-Message-State: ABy/qLZavNRiYKoAPwoPqKiC+CI0BrOrc1rKuY7G4fEzihEaXXvfXzCH
	MIouT5PL960BNpJ3V7ITtbtH5BOHFsCTab/eaOLVWHJ/xxWSe1fh
X-Google-Smtp-Source: APBJJlFKvPNlpgoXIT/6CcMLYKSkpF7m2ZjAyhIKSrZc6rCdvI9CKetdgQuDrj1vCnUwFP5kkbR7rn3ca6shutPTcpk=
X-Received: by 2002:a17:906:10c:b0:99b:499c:ddb6 with SMTP id
 12-20020a170906010c00b0099b499cddb6mr66092eje.68.1690484694489; Thu, 27 Jul
 2023 12:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <1775ABAC58286773.27447@lists.openembedded.org> <512858f6-70f2-1e0a-5b7b-2ba667dbf3b1@lineo.co.jp>
In-Reply-To: <512858f6-70f2-1e0a-5b7b-2ba667dbf3b1@lineo.co.jp>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 27 Jul 2023 09:04:42 -1000
Message-ID: <CAOSpxdbQLtdgaDBWRvA6KYhr+4fSKnvBPT0akfdiXgdZt6UTuw@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][kirkstone][dunfell][PATCH]
 systemd-systemctl: fix errors in instance name expansion
To: Yuta Hayama <hayama@lineo.co.jp>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b6afdf06017ca315"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jul 2023 19:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184972

--000000000000b6afdf06017ca315
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 26, 2023 at 10:22=E2=80=AFPM Yuta Hayama <hayama@lineo.co.jp> w=
rote:

> Hi Steve,
>
> Sorry for rushing you.
> If the patch obviously needs to be backported to stable branch, could I
> post
> a backport request email right away? This issue is not listed in bugzilla=
,
> so
> I was worried that the patch might have been missed.
>
>
I have the patch in my mickledore test queue right now, and should have it
in kirkstone and dunfell shortly.

Yes, it is fine to send patches for stable branches once they have been
accepted in master.  It will help ensure that I don't miss something.

Steve


>
> On 2023/07/27 17:19, Yuta Hayama via lists.openembedded.org wrote:
> > If the instance name indicated by %i begins with a number, the meaning
> of the
> > replacement string "\\1{}".format(instance) is ambiguous.
> >
> > To indicate group number 1 regardless of the instance name, use "\g<1>"=
.
> >
> > (From OE-Core rev: d18b939fb08b37380ce95934da38e6522392621c)
> >
> > Signed-off-by: Yuta Hayama <hayama@lineo.co.jp>
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > index 514f747fe6..7fe751b397 100755
> > --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> > @@ -202,7 +202,7 @@ class SystemdUnit():
> >          try:
> >              for dependent in config.get('Install', prop):
> >                  # expand any %i to instance (ignoring escape sequence
> %%)
> > -                dependent =3D re.sub("([^%](%%)*)%i",
> "\\1{}".format(instance), dependent)
> > +                dependent =3D re.sub("([^%](%%)*)%i",
> "\\g<1>{}".format(instance), dependent)
> >                  wants =3D systemdir / "{}.{}".format(dependent, dirste=
m)
> / service
> >                  add_link(wants, target)
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#184918):
> https://lists.openembedded.org/g/openembedded-core/message/184918
> > Mute This Topic: https://lists.openembedded.org/mt/100386774/7729851
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> hayama@lineo.co.jp]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b6afdf06017ca315
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 26, 2023 at 10:22=E2=80=
=AFPM Yuta Hayama &lt;<a href=3D"mailto:hayama@lineo.co.jp">hayama@lineo.co=
.jp</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Steve,<br>
<br>
Sorry for rushing you.<br>
If the patch obviously needs to be backported to stable branch, could I pos=
t<br>
a backport request email right away? This issue is not listed in bugzilla, =
so<br>
I was worried that the patch might have been missed.<br><br></blockquote><d=
iv><br></div><div>I have the patch in my mickledore test queue right now, a=
nd should have it in kirkstone and dunfell shortly.</div><div><br></div><di=
v>Yes, it is fine to send patches for stable branches=C2=A0once they have b=
een accepted in master.=C2=A0 It will help ensure that I don&#39;t miss som=
ething.</div><div><br></div><div>Steve</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
On 2023/07/27 17:19, Yuta Hayama via <a href=3D"http://lists.openembedded.o=
rg" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<=
br>
&gt; If the instance name indicated by %i begins with a number, the meaning=
 of the<br>
&gt; replacement string &quot;\\1{}&quot;.format(instance) is ambiguous.<br=
>
&gt; <br>
&gt; To indicate group number 1 regardless of the instance name, use &quot;=
\g&lt;1&gt;&quot;.<br>
&gt; <br>
&gt; (From OE-Core rev: d18b939fb08b37380ce95934da38e6522392621c)<br>
&gt; <br>
&gt; Signed-off-by: Yuta Hayama &lt;<a href=3D"mailto:hayama@lineo.co.jp" t=
arget=3D"_blank">hayama@lineo.co.jp</a>&gt;<br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/recipes-core/systemd/systemd-systemctl/systemctl | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl b/m=
eta/recipes-core/systemd/systemd-systemctl/systemctl<br>
&gt; index 514f747fe6..7fe751b397 100755<br>
&gt; --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl<br>
&gt; +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl<br>
&gt; @@ -202,7 +202,7 @@ class SystemdUnit():<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dependent in confi=
g.get(&#39;Install&#39;, prop):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # expand=
 any %i to instance (ignoring escape sequence %%)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependent =3D=
 re.sub(&quot;([^%](%%)*)%i&quot;, &quot;\\1{}&quot;.format(instance), depe=
ndent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dependent =3D=
 re.sub(&quot;([^%](%%)*)%i&quot;, &quot;\\g&lt;1&gt;{}&quot;.format(instan=
ce), dependent)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wants =
=3D systemdir / &quot;{}.{}&quot;.format(dependent, dirstem) / service<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add_link=
(wants, target)<br>
&gt;=C2=A0 <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#184918): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/184918" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/184918</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10038677=
4/7729851" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/100386774/7729851</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:hayama@lineo.co.jp" t=
arget=3D"_blank">hayama@lineo.co.jp</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--000000000000b6afdf06017ca315--

