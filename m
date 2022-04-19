Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FCEC352A1
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 14:22:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web12.3265.1650369352106442444
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 04:55:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N9IsLpaE;
 spf=pass (domain: gmail.com, ip: 209.85.208.180,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 17so20226577lji.1
        for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Apr 2022 04:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24QpAqDJxaAgZ5n0x7XQIA8YP2vmb3id66upLFwuXdw=;
        b=N9IsLpaEhJrIcmot9VXP6UII29KXHeynKOH7Aw4veAxDR6aFrW9ymFvjvutB4tJFRb
         +RMrH6ZIyOLiaL6Q34G2BMSZZhU7esgK6hklYCpJJXmK09Kc+/Rn8aTbbhGsBhdU7NJ+
         7NMDs9i5yF+acfTHbXvoTwprClK9XeyFq4XB9AOiSZwHgyPDbGKmabZgsKb5+cBO0gsE
         dv0A5wuaMHM+L2tER56VNdUe8ODsj1hjXGP7srYdqVombyIt0w+cE0/tSPtthknPyx3b
         LZjTHDojKFrZ5kF5BshfCsUp/sOEzX8vmYhYTB0QmaooA4HEa0qokkkMCw5aFOSAvNak
         /rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24QpAqDJxaAgZ5n0x7XQIA8YP2vmb3id66upLFwuXdw=;
        b=nakiDQIqPG03pUVrHvG05ABUBBSRNe1Oom9+3lJecnDVb2B5JkEMG+p4YNVtqsoZkH
         ZsBLSST04tb5AW8UQNlQJ6SJp+rPe5q/KxnMZwI0+XaqbrYPI99tRSV0PczoO4bovrqI
         5XMqNSsTdQG+oK2ZtAIva7Y4kEurKeDETmn69sCPP7guqpoKGrmg3HodESfvv30W3q5/
         cZOS77NV+1qq98MAWaeHmObviJ3WZM+733/8/D62qFOkDMkqehJR0ujK2u1H5nC6A9Zu
         u1MGbzMiSuIF7s8OauMSBpJ3fUakMaAN2dCMCgEdcnABz+aObygNfY7FFguv6xyWsnJY
         FfYQ==
X-Gm-Message-State: AOAM530OYMXLvSg86bFx4ZuHI+pzmJzud/Cme3bAm/ZBeUNSXCjA9zV3
	fmNt5yAui/AoBNnbdu/Rx6m8/b/lQG4JV1+/EpM=
X-Google-Smtp-Source: 
 ABdhPJyB/5VmY/QQs/BLkI95jYSubohJ1D3UlXsIdD/i6mz5JyEz79fOEnhJc3SyJ2cv/EkbeHNHACzOHIgPf1vTf9c=
X-Received: by 2002:a2e:3c19:0:b0:24d:a5ad:e7d3 with SMTP id
 j25-20020a2e3c19000000b0024da5ade7d3mr10129164lja.426.1650369350035; Tue, 19
 Apr 2022 04:55:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220419094616.433632-1-quaresma.jose@gmail.com>
 <20220419094616.433632-2-quaresma.jose@gmail.com>
 <6f880050d15a2b07d1d9a6d766c5f74bd6f07772.camel@linuxfoundation.org>
In-Reply-To: 
 <6f880050d15a2b07d1d9a6d766c5f74bd6f07772.camel@linuxfoundation.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 19 Apr 2022 12:55:39 +0100
Message-ID: 
 <CANPvuRnMTdvOc_uso-zOJ-z7_xV2eqSoTBaDgEy-StHQ9qka+g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] sstate: reuse the localdata copy on the
 mirror thread pool
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000db6cdf05dd008ed9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Apr 2022 14:22:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164626

--000000000000db6cdf05dd008ed9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Richard Purdie <richard.purdie@linuxfoundation.org> escreveu no dia ter=C3=
=A7a,
19/04/2022 =C3=A0(s) 11:57:

> On Tue, 2022-04-19 at 10:46 +0100, Jose Quaresma wrote:
> > We don't need a new copy of the bitbake data [localdata2] in each runni=
ng
> > thread of the pool.
> >
> > We can do the copy on the startup of the thread pool in each thread
> worker
> > and reuse it in each running thread, this is the same we did for the
> > connection_cache which is reused by fetcher.
> >
> > May be related with [YOCTO #14775] --
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >  meta/classes/sstate.bbclass | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
>
> It is a standard coding practise where you're changing the data store and
> don't
> want changes to persist, to use createCopy() on the datastore. It is fast
> and
> cheap and I'm not sure we need to make this thread specific?
>

My interpretation of the use of the createCopy was so that the existing
one localdata, would not be used at the same time in the thread pool.
i.e: each thread has its own localdata2 copied from localdata.

In my patch the behavior is the same, each thread has its own localdata2
but the call of createCopy is done in a safe place.


>
> Was there a reason you thought we should change that to fix some specific
> issue?
>

I suspect that there may be some race condition when calling the createCopy
on the thread pool. If I understand well, the createCopy on the
bitbake/lib/bb/data_smart.py copies a couple of structures.

So I don't know if the call createCopy is safe to do inside the tread pool,
if you think so please drop this patch.

Jose


> Cheers,
>
> Richard
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000db6cdf05dd008ed9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Richard Purdie &lt;<a href=3D"mailto:=
richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&=
gt; escreveu no dia ter=C3=A7a, 19/04/2022 =C3=A0(s) 11:57:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On Tue, 2022-04-19 at 10:46 +01=
00, Jose Quaresma wrote:<br>
&gt; We don&#39;t need a new copy of the bitbake data [localdata2] in each =
running<br>
&gt; thread of the pool.<br>
&gt; <br>
&gt; We can do the copy on the startup of the thread pool in each thread wo=
rker<br>
&gt; and reuse it in each running thread, this is the same we did for the<b=
r>
&gt; connection_cache which is reused by fetcher.<br>
&gt; <br>
&gt; May be related with [YOCTO #14775] -- <a href=3D"https://bugzilla.yoct=
oproject.org/show_bug.cgi?id=3D14775" rel=3D"noreferrer" target=3D"_blank">=
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D14775</a><br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
<br>
It is a standard coding practise where you&#39;re changing the data store a=
nd don&#39;t<br>
want changes to persist, to use createCopy() on the datastore. It is fast a=
nd<br>
cheap and I&#39;m not sure we need to make this thread specific?<br></block=
quote><div><br></div><div>My interpretation of the use of the createCopy wa=
s so that the existing<br>one localdata, would not be used at the same time=
 in the thread pool.</div><div>i.e: each thread has its own localdata2 copi=
ed from localdata.</div><div><br></div><div>In my patch the behavior is the=
 same, each thread has its own localdata2</div><div>but the call of createC=
opy is done in a safe place.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Was there a reason you thought we should change that to fix some specific i=
ssue?<br></blockquote><div><br></div><div>I suspect that there may be some =
race condition when calling the createCopy<br></div><div>on the thread pool=
. If I understand well, the=C2=A0createCopy on the</div><div>bitbake/lib/bb=
/data_smart.py copies a couple of structures.</div><div><br></div><div>So I=
 don&#39;t know if the call createCopy is safe to do inside the tread pool,=
</div><div>if you think so please drop this patch.</div><div><br></div><div=
>Jose</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--000000000000db6cdf05dd008ed9--

