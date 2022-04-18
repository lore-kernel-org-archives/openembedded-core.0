Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F625C64E7C
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.36039.1650261137497736135
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 22:52:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j6NSMUwT;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id g19so8856340lfv.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Apr 2022 22:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AhEy6siF9QCAn0krYO78UrV33FgwxwVZ5hfsHVPmu8A=;
        b=j6NSMUwT1xk0pMyewyTHDRdnuysmXYjN4gScbFAqz1pQGgO3a8OHN5F7iLnvUJBJPJ
         xcOTWNLltey4BuExR0z9gKu6ud6FWSy3NJA0rfMpHLZ8ZwJaCVjxniqGk9s4505ezwFX
         Sz1dJ0v+aXp5GYWsRkj1XIm1EL/YQ+v7V6ETm2wv17Sr79g76HrBQR87B3qjnM3fCgfs
         38kSKoUNlSWKiDq0AWLlZ9fqKvAwZlVErQyKXO6XcGw9YaWAqGONPSdOGzl+YiAy2HCu
         vNQuzBp+0Yh/bBy2uvLUNE7sFvemzSugeaXqxogNggwm5F4up8UAG+udsFN6in5rSr2A
         dnrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AhEy6siF9QCAn0krYO78UrV33FgwxwVZ5hfsHVPmu8A=;
        b=kskwPblTt2nSw0Qq8g2SdVcHSLT9kZ4pzUSUeBjt711Ni8FbAzgjByZ4EIOy0uU/AP
         dYrGU9v1Mm77q5ZSimHa9lyvUyRi5khiEeyd7oQcSlvHLHAxLoxUHgfUw17QcuugSi0m
         AHz1AzjLfJgRpwiify8VWeH5N2CE5DKY05y5rXv3EiG8Y7Bz0vD5AjwVN8GClcSfbfgE
         JfVmyJhCMfEdUgH6TpEH6SwGdgDknBHbFfZvTjdJWnvyjnjgiJgjVv4cfQbzzg4Ok/LQ
         s7K0mPPVyDduXYusxmV2xE/2lwNAtAfBODt2iAuOUsmtRraTmOMsJSqJl5SkELx19e/D
         QzLg==
X-Gm-Message-State: AOAM5330mKbIU45h4QLXnKx5XdcEtuZM3YZRzTKysRh0QZvjVd8EAecs
	ligSfZfJwiFcVMJP4QsDK6LDJACTJQXCX0+ZrOw=
X-Google-Smtp-Source: 
 ABdhPJzuhBqe6OxAcV/KgqCiWKU5teAcTjhGFxGAHFlaovs3980JvTXkL6m9eqzjRqJbBzT7LDKKMSJQXILicW+S4QQ=
X-Received: by 2002:ac2:4292:0:b0:46b:c417:38c2 with SMTP id
 m18-20020ac24292000000b0046bc41738c2mr7085579lfh.106.1650261135475; Sun, 17
 Apr 2022 22:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220416202401.179351-1-quaresma.jose@gmail.com>
 <3040f0d6eaabad9a0ec2632e49336af0ff189533.camel@linuxfoundation.org>
 <CANPvuR=mh73YEdu2=OZMu8Z-cPO+qa1E-VVywezi4wwZJZh7HA@mail.gmail.com>
 <b12f88e43a70b06208b3f0424a098b7ce39fca49.camel@linuxfoundation.org>
In-Reply-To: 
 <b12f88e43a70b06208b3f0424a098b7ce39fca49.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 18 Apr 2022 06:52:04 +0100
Message-ID: 
 <CANPvuRn=4n=0+H3t6MBeTZSiAko34+KCjPgifKpNfpbd72YQmg@mail.gmail.com>
Subject: Re: [OE-core] [RFC][PATCH 1/2] sstate: use the python3
 ThreadPoolExecutor instead of the OE ThreadedPool
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c4464005dce75c27"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164583

--000000000000c4464005dce75c27
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
domingo, 17/04/2022 =C3=A0(s) 08:57:

> On Sat, 2022-04-16 at 23:27 +0100, Jose Quaresma wrote:
> >
> >
> > Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia
> s=C3=A1bado,
> > 16/04/2022 =C3=A0(s) 22:57:
> > > On Sat, 2022-04-16 at 21:24 +0100, Jose Quaresma wrote:
> > > > for the FetchConnectionCache use a queue where each thread can
> > > > get an unsed connection_cache that is properly initialized before
> > > > we fireup the ThreadPoolExecutor.
> > > >
> > > > for the progress bar we need an adictional task counter
> > > > that is protected with thread lock as it runs inside the
> > > > ThreadPoolExecutor.
> > > >
> > > > Fixes [YOCTO #14775] --
> > > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
> > > >
> > > > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > > > ---
> > > >   meta/classes/sstate.bbclass | 44
> +++++++++++++++++++++++--------------
> > > >   1 file changed, 28 insertions(+), 16 deletions(-)
> > >
> > > Are there specific issues you see with oe.utils.ThreadedPool that thi=
s
> > > change
> > > addresses? Were you able to reproduce the issue in 14775?
> > >
> >
> >
> > Looking deeper while testing the patch I think I found another bug in t=
he
> > sstate mirror handling.
> > The python set() is not thread safe and we use it inside the thread
> pool, I
> > added a new python set class for that in my V2
>
> That might explain things.
>
> > I don't know if it is related to 14775 but it can be, I can't reproduce
> the
> > 14775 on my side, maybe it's better to remove the 14775 mention from my
> > commits, what do you think?
>
> I think you shouldn't say it fixes it as we simply don't know that. It ma=
y
> be
> related to so perhaps say that instead.
>

I will do that.


>
> > > I'm a little concerned we swap one implementation where we know
> roughly what
> > > the issues are for another where we dont :/.
> > >
> >
> > I think there some issues on ThreadedPool in the worker_init and
> worker_end,
> > this functions is called in all workers and it seems to me that the
> > right thing to do is calling and reuse the previous ones connection_cac=
he
> > otherwise the connection_cache does nothing.
>
> It creates a connection_cache in each thread that is created. Once create=
d
> in a
> given thread, that connection cache is reused there? I'm not sure you can
> say it
> does nothing?
>

I may have misunderstood this part and you may be right. I have to
re-analyze more carefully.


>
> >
> > >
> > > I notice that ThreadPoolExecutor can take an initializer but you're
> doing
> > > this
> > > using the queue instead. Is that because you suspect some issue with
> those
> > > being
> > > setup in the separate threads?
> > >
> >
> >
> > I am using a queue as it is the easy way I find for reusing the
> > FetchConnectionCache.
>
> I think that piece of code was working already?
>

it may be working fine on OE ThreadPool and I misunderstood that


>
> >
> > >
> > > You also mentioned the debug messages not showing. That suggests
> something
> > > is
> > > wrong with the event handlers in the new threading model and that
> errors
> > > wouldn't propagate either so we need to check into that.
> > >
> >
> >
> > This is fixed in V2
>
>
> What was the issue out of interest?
>

I don't know but it starts working when I add the thread safe collections.


>
> >
> > >
> > > This is definitely an interesting idea but I'm nervous about it :/.
> > >
> >
> >
> > It would be interesting if you could test it in the autobuilder.
> > On my side it is working well now, I will send a V2
>
> The challenge with autobuilder testing of this is that there is only a
> small
> portion of the autobuilder tests which exercise this code (testsdkext for
> images). The current issues only occur intermittently so it is hard to
> know if
> any given change fixes anything (or introduces a new race).
>
> One more interesting test which may more quickly find issues would be to
> make
> everything use the http mirror on the autobuilder I guess. We'd need to
> figure
> out the configuration for that though.
>

What you mean by this is that there are builds on the autobuilder that uses
the sstate mirror
and others that use some shared sstate cache filesystem?

As you previously said and as the sstate mirror is available for the
community,
I think and I will try to add some tests for that.
I still don't know how to do it but I'll think about it.

Another thing about this RFC series is that I think I need to do it in a wa=
y
that it can be backported for dunfell if we need to do that.

I will spend more time on this during this week.
Thanks for your always valuable comments.

Jose


> Cheers,
>
> Richard
>
>
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000c4464005dce75c27
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia domingo, 17/04/2022 =C3=A0(s) 08:57:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Sat, 2022-04-16 at 23:27 +0100,=
 Jose Quaresma wrote:<br>
&gt; <br>
&gt; <br>
&gt; Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.or=
g" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; escreveu no=
 dia s=C3=A1bado,<br>
&gt; 16/04/2022 =C3=A0(s) 22:57:<br>
&gt; &gt; On Sat, 2022-04-16 at 21:24 +0100, Jose Quaresma wrote:<br>
&gt; &gt; &gt; for the FetchConnectionCache use a queue where each thread c=
an<br>
&gt; &gt; &gt; get an unsed connection_cache that is properly initialized b=
efore<br>
&gt; &gt; &gt; we fireup the ThreadPoolExecutor.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; for the progress bar we need an adictional task counter<br>
&gt; &gt; &gt; that is protected with thread lock as it runs inside the<br>
&gt; &gt; &gt; ThreadPoolExecutor.<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Fixes [YOCTO #14775] --<br>
&gt; &gt; <a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14=
775" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org=
/show_bug.cgi?id=3D14775</a><br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.=
jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; &gt; &gt; ---<br>
&gt; &gt; &gt; =C2=A0 meta/classes/sstate.bbclass | 44 ++++++++++++++++++++=
+++--------------<br>
&gt; &gt; &gt; =C2=A0 1 file changed, 28 insertions(+), 16 deletions(-)<br>
&gt; &gt; <br>
&gt; &gt; Are there specific issues you see with oe.utils.ThreadedPool that=
 this<br>
&gt; &gt; change<br>
&gt; &gt; addresses? Were you able to reproduce the issue in 14775?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; Looking deeper while testing the patch I think I found another bug in =
the<br>
&gt; sstate=C2=A0mirror handling.<br>
&gt; The=C2=A0python set() is not thread safe and we use it inside the thre=
ad pool, I<br>
&gt; added a=C2=A0new python set class for=C2=A0that in=C2=A0my V2=C2=A0<br=
>
<br>
That might explain things.<br>
<br>
&gt; I don&#39;t=C2=A0know if it is related to 14775 but it can=C2=A0be,=C2=
=A0I can&#39;t=C2=A0reproduce the<br>
&gt; 14775 on my side, maybe it&#39;s better to remove the=C2=A014775 menti=
on from my<br>
&gt; commits, what do you think?<br>
<br>
I think you shouldn&#39;t say it fixes it as we simply don&#39;t know that.=
 It may be<br>
related to so perhaps say that instead.<br></blockquote><div><br></div><div=
>I will do that.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
&gt; &gt; I&#39;m a little concerned we swap one implementation where we kn=
ow roughly what<br>
&gt; &gt; the issues are for another where we dont :/.<br>
&gt; &gt; <br>
&gt; <br>
&gt; I think there some issues on ThreadedPool in the worker_init and worke=
r_end,<br>
&gt; this functions is called in all workers and it seems to me that the<br=
>
&gt; right=C2=A0thing to do is calling and reuse the previous ones=C2=A0con=
nection_cache<br>
&gt; otherwise the connection_cache does nothing.<br>
<br>
It creates a connection_cache in each thread that is created. Once created =
in a<br>
given thread, that connection cache is reused there? I&#39;m not sure you c=
an say it<br>
does nothing?<br></blockquote><div><br></div><div>I may have misunderstood =
this part and you may be right. I have to re-analyze more carefully.<br></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; =C2=A0<br>
&gt; &gt; <br>
&gt; &gt; I notice that ThreadPoolExecutor can take an initializer but you&=
#39;re doing<br>
&gt; &gt; this<br>
&gt; &gt; using the queue instead. Is that because you suspect some issue w=
ith those<br>
&gt; &gt; being<br>
&gt; &gt; setup in the separate threads?<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; I am using a queue as it is the easy way=C2=A0I find for reusing the<b=
r>
&gt; FetchConnectionCache.<br>
<br>
I think that piece of code was working already?<br></blockquote><div><br></=
div><div>it may be working fine on OE ThreadPool and I misunderstood that<b=
r></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
<br>
&gt; =C2=A0<br>
&gt; &gt; <br>
&gt; &gt; You also mentioned the debug messages not showing. That suggests =
something<br>
&gt; &gt; is<br>
&gt; &gt; wrong with the event handlers in the new threading model and that=
 errors<br>
&gt; &gt; wouldn&#39;t propagate either so we need to check into that.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; This is fixed in V2<br>
<br>
<br>
What was the issue out of interest?<br></blockquote><div><br></div><div>I d=
on&#39;t=C2=A0know but it starts working when I add the thread safe collect=
ions.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
&gt; =C2=A0<br>
&gt; &gt; <br>
&gt; &gt; This is definitely an interesting idea but I&#39;m nervous about =
it :/.<br>
&gt; &gt; <br>
&gt; <br>
&gt; <br>
&gt; It would be interesting if you could test it in the autobuilder.<br>
&gt; On my side it is working well now, I will send a V2<br>
<br>
The challenge with autobuilder testing of this is that there is only a smal=
l<br>
portion of the autobuilder tests which exercise this code (testsdkext for<b=
r>
images). The current issues only occur intermittently so it is hard to know=
 if<br>
any given change fixes anything (or introduces a new race).<br>
<br>
One more interesting test which may more quickly find issues would be to ma=
ke<br>
everything use the http mirror on the autobuilder I guess. We&#39;d need to=
 figure<br>
out the configuration for that though.<br></blockquote><div><br></div><div>=
What you mean by this is that there are builds on the autobuilder that uses=
 the sstate mirror<br></div><div>and others that use some shared sstate cac=
he filesystem?</div><div><br></div><div>As you previously=C2=A0said and as =
the sstate mirror is available for the community,</div><div>I think and I w=
ill try to add some tests for that.</div><div>I still don&#39;t know how to=
 do it but I&#39;ll think about it.<br></div><div><br></div><div>Another th=
ing about this RFC series is that I think I need to do it=C2=A0in a way</di=
v><div>that it can be backported for dunfell if we need to do that.</div><d=
iv><br></div><div>I will spend more time on this during this week.</div><di=
v>Thanks for your always valuable comments.</div><div><br></div><div>Jose</=
div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000c4464005dce75c27--

