Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139E7C433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 19:59:31 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.2967.1636055969680401328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:59:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fe3IcssP;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id f3so14159741lfu.12
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 12:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4gi9/cdfrX7n5kb0DQ6ACjjAmSeF3bWsw6fg8Z3PPWc=;
        b=fe3IcssPBwPh7cyI5I0+RdabgmXFR9qxK+gfcutrm2kgTtddebvamurKDy2a+hYufU
         2GFGZ6HJgXzo4A6F5H7LaxlQkCHFQdauWj8cbxf4yVfSZYVwj7KYXLfZqiohMcUVOAbq
         NSnPYxJvHMEK8cUzkv1SAk4wfPIjrNlNCuvXhJuDv1N074Ic5Gzfjpsh8jXjFTdEgwQ8
         jSSCGoS9G/9LzMqU42DerD6fdf6iPUBlUpmdnMANVX3nRtIGFX2R8sutNk511JokICeT
         9SX2JtAGEo00V/roHs7RwUtbZXQ+MQW7aHVuPXgXbmsuOtXQ0dZVex+jGQ9qSjPpDvAG
         LMKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4gi9/cdfrX7n5kb0DQ6ACjjAmSeF3bWsw6fg8Z3PPWc=;
        b=TTl8JxCTmHZxW33wqHxHPDwqhTfs9P6MlEk2d4XRlRJQXkzECKVuxxqVCMFpJuAvE5
         R2Ai7kGsNrjaJRQ9RswuA4lJU9Ndvri6RTkBUn5skJR5gqpIGOOy3fJ5AcG4XzZQeVXD
         1zxyFLi2c73TD4h9KhalOK6X9Jq53nM4Lq6EM3F8FBqGyDC8N924pGzIpkz6soCYt5gX
         7GYaQLW+rj3nbSqMebWxAwWd6eXnINILh9pBXiSr2KxeFCIH6h8uH48MIuanYNX91xuw
         gGLv6ZA+6bOXEC98ifilaLcW4Ek+/metFYmXRhdOARDlQPmRnRsVfDEGq0KrmJUjg4Gt
         c5yQ==
X-Gm-Message-State: AOAM532Kf7EQDeKSfCtWO+1eagASmDdTLbCZcu/0UElZik/X8/LUXSds
	0/yJ7H6D4k1kvpemihl5oA6c3WyYg+8swOEwnTQ=
X-Google-Smtp-Source: 
 ABdhPJzvyKemc2s1jYtLqoPLsjEtZci5Qr80kPVS7VsGVrgpEqM09E+coKrhBZdl2uwDIPbZ78trQssoQRjAbK8RIPw=
X-Received: by 2002:a19:f703:: with SMTP id z3mr18951405lfe.555.1636055967838;
 Thu, 04 Nov 2021 12:59:27 -0700 (PDT)
MIME-Version: 1.0
References: <20211029231306.16066-1-quaresma.jose@gmail.com>
 <e1aaf911870cae93d089ec745fbc243910863666.camel@linuxfoundation.org>
In-Reply-To: 
 <e1aaf911870cae93d089ec745fbc243910863666.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 4 Nov 2021 19:59:16 +0000
Message-ID: 
 <CANPvuRkg-op9iKgBkTGYpgsGsp0ZK8EgLi1jcqYXrWy_rHNeeg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] sstate.bbclass: exceptions on mirror
 fetcher is not fatal
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cbb6c505cffbf6d4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 19:59:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157869

--000000000000cbb6c505cffbf6d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia s=C3=A1=
bado,
30/10/2021 =C3=A0(s) 22:34:

> On Sat, 2021-10-30 at 00:13 +0100, Jose Quaresma wrote:
> > An exceptions in sstate_checkhashes sstate mirror fetcher
> > is not fatal for the build and it can be a warning.
> >
> > If we can't check status in the fetcher we can assume that sstate
> > file don't exist on the mirror and build it from sources, ignoring
> > the sstate cache.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 6e4eb09f8e..54d38ed42d 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -995,7 +995,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse,
> currentcount=3D0, summary=3DTrue,
> >                  missed.add(tid)
> >                  bb.debug(2, "SState: Unsuccessful fetch test for %s
> (%s)" % (srcuri, e))
> >              except Exception as e:
> > -                bb.error("SState: cannot test %s: %s" % (srcuri, e))
> > +                bb.warn("SState: cannot test file %s from mirrors '%s'=
:
> (%s)" % (srcuri, mirrors, e))
> >              if len(tasklist) >=3D min_tasks:
> >                  bb.event.fire(bb.event.ProcessProgress(msg,
> len(tasklist) - thread_worker.tasks.qsize()), d)
> >
>
> This has been discussed a bit before. Whilst the issue isn't fatal to the
> build
> I do think this should be an error and have bitbake return an exit code
> that
> there was an issue as there is something wrong somewhere if we're hitting
> this
> code path.
>
> As an example:
>
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4230/st=
eps/15/logs/stdio
>
> which might have not shown up if it wasn't an error.
>
>
I was not aware that this subject had already been discussed.
But it makes sense that when we have the sstate mirrors, if we can't
communicate with the server we have a problem.

My assumption in this patch can hide these issues as it will always build
from the sources and the warning can go unnoticed.

Cheers,
>
> Richard
>
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000cbb6c505cffbf6d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia s=C3=A1bado, 30/10/2021 =C3=A0(s) 22:34:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">On Sat, 2021-10-30 at 00:13 +0=
100, Jose Quaresma wrote:<br>
&gt; An exceptions in sstate_checkhashes sstate mirror fetcher<br>
&gt; is not fatal for the build and it can be a warning.<br>
&gt; <br>
&gt; If we can&#39;t check status in the fetcher we can assume that sstate<=
br>
&gt; file don&#39;t exist on the mirror and build it from sources, ignoring=
<br>
&gt; the sstate cache.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 6e4eb09f8e..54d38ed42d 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -995,7 +995,7 @@ def sstate_checkhashes(sq_data, d, siginfo=3DFalse=
, currentcount=3D0, summary=3DTrue,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missed.a=
dd(tid)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.debug=
(2, &quot;SState: Unsuccessful fetch test for %s (%s)&quot; % (srcuri, e))<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 except Exception as e:=
<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.error(&quo=
t;SState: cannot test %s: %s&quot; % (srcuri, e))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;SState: cannot test file %s from mirrors &#39;%s&#39;: (%s)&quot; % (srcur=
i, mirrors, e))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(tasklist) &gt;=
=3D min_tasks:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.event=
.fire(bb.event.ProcessProgress(msg, len(tasklist) - thread_worker.tasks.qsi=
ze()), d)<br>
&gt;=C2=A0 <br>
<br>
This has been discussed a bit before. Whilst the issue isn&#39;t fatal to t=
he build<br>
I do think this should be an error and have bitbake return an exit code tha=
t<br>
there was an issue as there is something wrong somewhere if we&#39;re hitti=
ng this<br>
code path.<br>
<br>
As an example:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/63/build=
s/4230/steps/15/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https://au=
tobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4230/steps/15/logs/=
stdio</a><br>
<br>
which might have not shown up if it wasn&#39;t an error.<br>
<br></blockquote><div><br></div><div>I was not aware that this subject had =
already been discussed.</div><div>But it makes sense that when we have the =
sstate=C2=A0mirrors, if we can&#39;t communicate with the server we have a =
problem.<br></div><div><br></div><div>My assumption in this patch can hide =
these issues as it will always build from the sources and the warning=C2=A0=
can go unnoticed.</div><div><br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000cbb6c505cffbf6d4--

