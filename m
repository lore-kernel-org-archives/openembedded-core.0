Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB70CC4167B
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 08:11:58 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.95678.1701763914516548530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Dec 2023 00:11:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=wZrb23mx;
 spf=pass (domain: smile.fr, ip: 209.85.208.175, mailfrom: yoann.congal@smile.fr)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2c9f72176cfso30639381fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 00:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1701763912; x=1702368712; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a2DwGse3kIflk/cQoFQJLru/hGWCx0sWYrRnoFfRymU=;
        b=wZrb23mxg6bDilPRrwk79hfwruwz2mfF+fuXw/P2VozO04GfX8m+AeB4p3Kv6yOG8t
         +RrIhUZkbOK8+PBw2uIj9RYjYRZhxlgNZHpgYpLEDcpPsKhyiAU9rV95CJgKOqmqhItm
         u8ohmDeeNJffy497JfyKi8msrbF9O9Zu6bqz/KWVjvZhLIpvuvXvJ4vWiVJQ+Ho1nLpj
         A9TqdTgsYUOPViKhZsx0O3/fW+f/wNsXLOxmKdJW86749xGbrTPko/yP1HCeGHMFCvi4
         CmMIYb5DjdVA6+Y1q+j0xhXIbT7RFJ/bi5SCLDie+rjDSSEUp1uYwBzfmZ2cxsXFQZwG
         dC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701763912; x=1702368712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2DwGse3kIflk/cQoFQJLru/hGWCx0sWYrRnoFfRymU=;
        b=VTKicPdFFSqOgw/uySfwzhuaDbssI5NjoNlXyKHWfmLcTv5nPZt6XFswzUNoLGJDSD
         Mj1kOAJtg4KbO0uYsEylGkgsfpqK2xTLHc6Gd/mHgGWPk6OoF/9wsDD9J6H14T/afMEe
         xyY6ubOl5mXEmuBx5qkCceRNiqiky64FWDHNLrjNih3YUb/I9SwkxcC+IEPAT5A5yDa0
         bwzMNfgjgEfEoS1jHYDNJdYEcBnSFgg2jpZg8hHuOQbqiJs4DQVb6dP+TZnUTjzF6ihD
         kZEA9HenChbOpwQdi1q3lRVQzT4qcjZ4LALaXM+tu6CeA/W7FNBBNzgXGaKxeSCRj27A
         Qv9g==
X-Gm-Message-State: AOJu0Yw0K7IPWKDhX878fW/35sGzPlP2Nb/hHPgcy8CkR75NCBqujMCI
	vRm0FpZkJUrLT2JQcogHmpPDv5omjZitFtrgVHjFDg==
X-Google-Smtp-Source: AGHT+IEf7MDIJfQLfXIe+1EGt8DxSnSlk6h9fsSjbc5UGHV8ddzqKLGOJT8pSi8BDOe7j03Bb1OQ97RoHAles+MjT4I=
X-Received: by 2002:a05:651c:10c7:b0:2c9:f5b9:69bd with SMTP id
 l7-20020a05651c10c700b002c9f5b969bdmr969751ljn.1.1701763912418; Tue, 05 Dec
 2023 00:11:52 -0800 (PST)
MIME-Version: 1.0
References: <20231127134903.1327808-1-yoann.congal@smile.fr> <2023120507485824c14f37@mail.local>
In-Reply-To: <2023120507485824c14f37@mail.local>
From: Yoann CONGAL <yoann.congal@smile.fr>
Date: Tue, 5 Dec 2023 09:11:26 +0100
Message-ID: <CAMSfU+57_XepVZG9o9DKgT_a43uo_MPoLO5aD4qWMe7+x1kQzw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lib/oe/patch: handle creating patches for CRLF sources
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007de74b060bbec905"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 08:11:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191807

--0000000000007de74b060bbec905
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 5 d=C3=A9c. 2023 =C3=A0 08:48, Alexandre Belloni <
alexandre.belloni@bootlin.com> a =C3=A9crit :

> Hello,
>
> This doesn't apply on master, can you rebase?
>

Yes! I will send a v2 today

On 27/11/2023 14:49:03+0100, Yoann Congal wrote:
> > Using devtool to patch CRLF based sources creates patch files which hav=
e
> > mixed end of lines : LF for headers and CRLF for source context and
> > modified lines.
> >
> > Python open(..., newline=3DNone) (default for newline arg)does detect
> > end-of-line in this mixed file but only outputs LF EOL data. This
> > result in patch files that does not apply on the original sources.
> >
> > Switching to open(..., newline=3D'') allows to detect end-of-line but k=
eep
> > the original end-of-line intact. This generate correct patches for CRLF
> > based sources.
> >
> > Fixes [YOCTO #15285]
> >
> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> > ---
> >  meta/lib/oe/patch.py | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
> > index ff9afc9df9..7bf660978e 100644
> > --- a/meta/lib/oe/patch.py
> > +++ b/meta/lib/oe/patch.py
> > @@ -477,7 +477,7 @@ class GitApplyTree(PatchTree):
> >                          patchlines =3D []
> >                          outfile =3D None
> >                          try:
> > -                            with open(srcfile, 'r', encoding=3Dencodin=
g)
> as f:
> > +                            with open(srcfile, 'r', encoding=3Dencodin=
g,
> newline=3D'') as f:
> >                                  for line in f:
> >                                      if
> line.startswith(GitApplyTree.patch_line_prefix):
> >                                          outfile =3D
> line.split()[-1].strip()
> > --
> > 2.30.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#191303):
> https://lists.openembedded.org/g/openembedded-core/message/191303
> > Mute This Topic: https://lists.openembedded.org/mt/102828787/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>


--=20
Yoann Congal
Smile ECS - Tech expert

--0000000000007de74b060bbec905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Le=C2=A0mar. 5 d=C3=A9c. 2023 =C3=A0=C2=
=A008:48, Alexandre Belloni &lt;<a href=3D"mailto:alexandre.belloni@bootlin=
.com">alexandre.belloni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:</div><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hell=
o,<br>
<br>
This doesn&#39;t apply on master, can you rebase?<br></blockquote><div><br>=
</div>Yes! I will send a v2 today<br></div><div class=3D"gmail_quote"><br><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">

On 27/11/2023 14:49:03+0100, Yoann Congal wrote:<br>
&gt; Using devtool to patch CRLF based sources creates patch files which ha=
ve<br>
&gt; mixed end of lines : LF for headers and CRLF for source context and<br=
>
&gt; modified lines.<br>
&gt; <br>
&gt; Python open(..., newline=3DNone) (default for newline arg)does detect<=
br>
&gt; end-of-line in this mixed file but only outputs LF EOL data. This<br>
&gt; result in patch files that does not apply on the original sources.<br>
&gt; <br>
&gt; Switching to open(..., newline=3D&#39;&#39;) allows to detect end-of-l=
ine but keep<br>
&gt; the original end-of-line intact. This generate correct patches for CRL=
F<br>
&gt; based sources.<br>
&gt; <br>
&gt; Fixes [YOCTO #15285]<br>
&gt; <br>
&gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/lib/oe/patch.py | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py<br>
&gt; index ff9afc9df9..7bf660978e 100644<br>
&gt; --- a/meta/lib/oe/patch.py<br>
&gt; +++ b/meta/lib/oe/patch.py<br>
&gt; @@ -477,7 +477,7 @@ class GitApplyTree(PatchTree):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 patchlines =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 outfile =3D None<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(srcfile, &#39;r&#39;, encoding=3Denc=
oding) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(srcfile, &#39;r&#39;, encoding=3Denc=
oding, newline=3D&#39;&#39;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for line in f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.star=
tswith(GitApplyTree.patch_line_prefix):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 outfile =3D line.split()[-1].strip()<br>
&gt; -- <br>
&gt; 2.30.2<br>
&gt; <br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#191303): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/191303" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/191303</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10282878=
7/3617179" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/102828787/3617179</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alexandre.belloni@boo=
tlin.com" target=3D"_blank">alexandre.belloni@bootlin.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
<br>
-- <br>
Alexandre Belloni, co-owner and COO, Bootlin<br>
Embedded Linux and Kernel engineering<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--0000000000007de74b060bbec905--

