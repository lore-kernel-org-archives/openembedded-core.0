Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.1412.1616688143760131312
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Mar 2021 09:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fml6o9Qi;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: kergoth@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id h10so2962526edt.13
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Mar 2021 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=01BMQWtTDqit/DzN8x1RLfKEdeUDY5eqfghbaboUSic=;
        b=fml6o9QiKI0fbsDDsXk0YBYZNHrXHjItBCu3qO3zJBmgmA2qWYoSTB2D0xkiRAXyoz
         pXz6ynA+P91mJPs+6h7km6K6Q7B4d4RkaBNBViVmhDqMpYMYIZW/i1Qj6gOkb2ng0UR3
         SbsXNduJv4tFXFPMkgmhEpGlH/eD9zuSLyXFHAS5b2811h77q1AEy3PAJDDmaqkHWqwk
         jGGbzDMcE25mwse2yItNUwSCh8ouw9vI70od5/1Ze/7qb02l0ZfjDqntRIQLHWoLV/fn
         xFUuvRfEo3lcV0YMiRaE5DzQ2nK5i7d2x+OYK9v7APeUuqAlx976PFudsNaNhFBpTewi
         3ghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01BMQWtTDqit/DzN8x1RLfKEdeUDY5eqfghbaboUSic=;
        b=Tib7BPhVU6tGfjK5GgHH9C/wZ3v4nJRB2k8mmOEQxX8faQlHfLDcjzAAvg+j4FslxM
         sclxxJYa3mZCwU50NxoJW32fhj4bWd5M8d0Fip+Ehrznlrt3VgGifqPym0hjqZfe+CS8
         cCBlUdlwA4p/wClRBS89ahqutd6ZsNno+Q1izTdiK98HqtRsw5r1wFOD76CqxyobhZD4
         YC9F+hdAWAekDqSe+jGiuL1ZwGU2qlmitJgOrVSXduFZjhwPLJURWJi0HZG/+q1hrbtJ
         1xai4insw930azU+ggogUIhs9M9raLjFL/lbUuiq3XVd9kk313aBZTx88IqkQF2duuhq
         0DnA==
X-Gm-Message-State: AOAM532JY7EE6CJeP08A8OMJRnrgEeX0knmpyyZSVWrHRIXLT5vEyP/r
	OTJwO8XUWpU7YzCE5DWiQsNXOQkWXk6NpTyfACM=
X-Google-Smtp-Source: ABdhPJwoyAufbcdNJCIXQkeJGyDADioFCEss4bPK7scVmEwTYHlPubLGx7pw8w04UmhUBpZm/0V9JGlKjoRDseSKPdM=
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr9786722edb.113.1616688137164;
 Thu, 25 Mar 2021 09:02:17 -0700 (PDT)
MIME-Version: 1.0
References: <429b51e-7cc5-54a7-a28-7e8beab0c77d@crashcourse.ca>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.437c1374-0ed0-4179-b9f8-331319118723@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.1ce5b84f-c798-4314-b673-c5072a296141@emailsignatures365.codetwo.com>
 <dc3e6ce6-21fe-729f-63e9-c1b94819a524@topic.nl> <652b28-29c5-4d79-5c77-ac98ed9bd0@crashcourse.ca>
In-Reply-To: <652b28-29c5-4d79-5c77-ac98ed9bd0@crashcourse.ca>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Thu, 25 Mar 2021 09:02:05 -0700
Message-ID: <CABcZANnDXiUvHmBmcmmiXJs4bW4qQPfqarPF0VWFtFXO5+x0Eg@mail.gmail.com>
Subject: Re: [OE-core] any *compelling* reasons to whitelist env vars for an OE build?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Mike Looijmans <mike.looijmans@topic.nl>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000020dc1205be5e8a52"

--00000000000020dc1205be5e8a52
Content-Type: text/plain; charset="UTF-8"

Just a quick note that you *can* script config file alterations without
having to alter files that may be under source control, that's what
auto.conf is for :)

On Thu, Mar 25, 2021 at 7:51 AM Robert P. J. Day <rpjday@crashcourse.ca>
wrote:

> On Thu, 25 Mar 2021, Mike Looijmans wrote:
>
> > I for one use a whitelist env vars daily, both hobby and work.
> >
> > We tend to build for multiple machines, so in general we'd have
> > something like this running on the build server:
> >
> > for machine in mach1 mach2 mach3 mach4 ... mach40
> > do
> >    MACHINE=$machine bitbake image1 image2 image3
> > done
> >
> > Being able to pass the MACHINE through the environment is a big win. We
> could
> > alter a config file in the shell script, but that would change a file
> that
> > we'd want under version control, and I really don't like it when builds
> change
> > files under version control.
> >
> > (The "40" machines is not exaggerated, I'm really involved in projects
> that
> > build for that many targets)
> >
> > Come to think of it, MACHINE is the one and only environment we ever
> pass to
> > bitbake.
> >
> > For release/test/production/debug/... etcetera I tend to use a different
> > image, so you'd see:
> >
> > MACHINE=mach1 bitbake interesting-image interesting-image-dev
>
>   you and mark are right, i was being a bit too draconian -- being
> able to select MACHINE and DISTRO on the bitbake invocation line are
> obvious benefits.
>
>   just to refresh my memory, what is it that identifies the env vars
> that are by default passed through without any need for extra
> whitelisting? is that BB_ENV_EXTRAWHITE? i recall that contains
> MACHINE and DISTRO already, so that might be all i care about.
>
> rday
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000020dc1205be5e8a52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Just a quick note that you *can* script config file altera=
tions without having to alter files that may be under source control, that&=
#39;s what auto.conf is for :)</div><br><div class=3D"gmail_quote"><div dir=
=
=3D"ltr" class=3D"gmail_attr">On Thu, Mar 25, 2021 at 7:51 AM Robert P. J.=
 Day &lt;<a href=3D"mailto:rpjday@crashcourse.ca">rpjday@crashcourse.ca</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On T=
hu, 25 Mar 2021, Mike Looijmans wrote:<br>
<br>
&gt; I for one use a whitelist env vars daily, both hobby and work.<br>
&gt;<br>
&gt; We tend to build for multiple machines, so in general we&#39;d have<b=
r>
&gt; something like this running on the build server:<br>
&gt;<br>
&gt; for machine in mach1 mach2 mach3 mach4 ... mach40<br>
&gt; do<br>
&gt;=C2=A0 =C2=A0 MACHINE=3D$machine bitbake image1 image2 image3<br>
&gt; done<br>
&gt;<br>
&gt; Being able to pass the MACHINE through the environment is a big win. =
We could<br>
&gt; alter a config file in the shell script, but that would change a file=
 that<br>
&gt; we&#39;d want under version control, and I really don&#39;t like it w=
hen builds change<br>
&gt; files under version control.<br>
&gt;<br>
&gt; (The &quot;40&quot; machines is not exaggerated, I&#39;m really invol=
ved in projects that<br>
&gt; build for that many targets)<br>
&gt;<br>
&gt; Come to think of it, MACHINE is the one and only environment we ever =
pass to<br>
&gt; bitbake.<br>
&gt;<br>
&gt; For release/test/production/debug/... etcetera I tend to use a differ=
ent<br>
&gt; image, so you&#39;d see:<br>
&gt;<br>
&gt; MACHINE=3Dmach1 bitbake interesting-image interesting-image-dev<br>
<br>
=C2=A0 you and mark are right, i was being a bit too draconian -- being<br=
>
able to select MACHINE and DISTRO on the bitbake invocation line are<br>
obvious benefits.<br>
<br>
=C2=A0 just to refresh my memory, what is it that identifies the env vars<=
br>
that are by default passed through without any need for extra<br>
whitelisting? is that BB_ENV_EXTRAWHITE? i recall that contains<br>
MACHINE and DISTRO already, so that might be all i care about.<br>
<br>
rday<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--00000000000020dc1205be5e8a52--
