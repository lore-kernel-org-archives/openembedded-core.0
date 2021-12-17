Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752D7C433EF
	for <webhook@archiver.kernel.org>; Fri, 17 Dec 2021 23:39:43 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com
 [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web12.3698.1639784382791632288
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 15:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cTG66S19;
 spf=pass (domain: gmail.com, ip: 209.85.222.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id p2so7150471uad.11
        for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Dec 2021 15:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aGuPnID6WGGeO+XAc3JmH2eZ8IIaL07hVHFI44sTc3U=;
        b=cTG66S19/5otM/m/+HVGJ1O6MRqQw1wh9M77gwgZTuotaBTKWdrFCY1ad0ME0C+WrU
         ddHuSdpCqy5wCUL2MIG9BPzV0Fw645DxdZY3ZoO4c1MAitaCHF4/gVhVVyFi2C9ATrMO
         PcpmDh6LFLbIG1hkzK8c5uypX0Quf3cxAPAaLr02odVOYE5lzNX7jSNdtAbwGLskPrNx
         SmdN+U6fCqifAeNv+CNFWOORvQkPu/l71xhS1Hy8InHFOVBKt9a13Ce/t7veURkGEqbp
         L+BDU6dbfNOoTPin5PC6rZympaMi+paKlWY5AorIIeaIs2OrQM03YGQLFyuoGVjM67iq
         wHEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aGuPnID6WGGeO+XAc3JmH2eZ8IIaL07hVHFI44sTc3U=;
        b=25poGzCyIMmIWg9nZzFFHphKaCatTTT3zjv8B2Iu9OQ1xjtyDJnP0803ovIajB6PWh
         R8azU48I8dfNFxr0EMhepLr5120MzTpeQ5YwZTEF+NCkH1KRmoEAJUeGcuQOUto7XLtU
         zcetjbrq53nJx7C5SsTDJOLQp3UqkiTMCdGYvHZnI1Ef4Z+bWTnKwS+NkZDHQqXOjP0q
         kmAm/rG6fhn+VvLhy9A5BcasAUytQRmAwbXVhNt+Oq94E8ZzazcC+Cr81mOp+0HJ/rJO
         Hys/w76t7+5jUJeXPSIxNUapjL4r/c2w0PclbfY1L8w7u6W8weZYaDvYDyfcjHRaTdS9
         aWQA==
X-Gm-Message-State: AOAM532HBIe3PKnlpgvvHXGcPMVyjvuVY5G44yvd6eJJGjPiwKjbt3HS
	DlpJSg5VITh8FyGyLLGmp1m8x35J6tYe4TMpev4=
X-Google-Smtp-Source: 
 ABdhPJwnEE5Plt7vgeE/fmp47qzfO43/Bcb6IOV6ANV6FlcPE3byW46otrDSTO2vNYr9ae0Sotf6yidVRKQyNHy8t9Q=
X-Received: by 2002:a9f:218c:: with SMTP id 12mr2030903uac.71.1639784381874;
 Fri, 17 Dec 2021 15:39:41 -0800 (PST)
MIME-Version: 1.0
References: 
 <a1bb6b60bbde7da4496db1a2f7e48bbfb637fa4e.1638136329.git.steve@sakoman.com>
 <3913.1639769589677243183@lists.openembedded.org>
 <CAOSpxdbvezkBr6t_rPJ0nW4JiHO0eXKVcVcrtfa9iXKcAgizfw@mail.gmail.com>
In-Reply-To: 
 <CAOSpxdbvezkBr6t_rPJ0nW4JiHO0eXKVcVcrtfa9iXKcAgizfw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 18 Dec 2021 02:39:31 +0300
Message-ID: 
 <CANNYZj8_St9K1NrjiBtC6Py0gMPkEmeHS7-68XXhEgS=LeKcyQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell 16/42] libpcre/libpcre2: correct SRC_URI
To: Steve Sakoman <steve@sakoman.com>
Cc: jhorns@ics.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009705c505d3600da5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Dec 2021 23:39:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159838

--0000000000009705c505d3600da5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99d suggest we host the tarball somewhere on yoctoproject.org actua=
lly.

Alex

On Sat 18. Dec 2021 at 2.16, Steve Sakoman <steve@sakoman.com> wrote:

> On Fri, Dec 17, 2021 at 9:33 AM <jhorns@ics.com> wrote:
> >
> > Dunfell uses 10.34 pcre2. This SRC_URI does not work with 10.34, as tha=
t
> version is not available there.
>
> Urghh . . .you are correct.
>
> It does look like sourceforge is still carrying this (as do a few
> other random mirrors):
>
> https://downloads.sourceforge.net/pcre/pcre2-10.34.tar.bz2
>
> Any thoughts on which to use Alex?
>
> >
> > Does Dunfell need to be updated to pcre2 > 10.36?
>
> No, I think we should stick with the current version since this is a
> stable release.
>
> Steve
>
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#159836):
> https://lists.openembedded.org/g/openembedded-core/message/159836
> > Mute This Topic: https://lists.openembedded.org/mt/87365168/3620601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000009705c505d3600da5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I=E2=80=99d suggest we host the tarball somewhere on <a h=
ref=3D"http://yoctoproject.org">yoctoproject.org</a> actually.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto">Alex</div><div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat 18. Dec 2021 at 2.16=
, Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left=
:1ex;border-left-color:rgb(204,204,204)">On Fri, Dec 17, 2021 at 9:33 AM &l=
t;<a href=3D"mailto:jhorns@ics.com" target=3D"_blank">jhorns@ics.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; Dunfell uses 10.34 pcre2. This SRC_URI does not work with 10.34, as th=
at version is not available there.<br>
<br>
Urghh . . .you are correct.<br>
<br>
It does look like sourceforge is still carrying this (as do a few<br>
other random mirrors):<br>
<br>
<a href=3D"https://downloads.sourceforge.net/pcre/pcre2-10.34.tar.bz2" rel=
=3D"noreferrer" target=3D"_blank">https://downloads.sourceforge.net/pcre/pc=
re2-10.34.tar.bz2</a><br>
<br>
Any thoughts on which to use Alex?<br>
<br>
&gt;<br>
&gt; Does Dunfell need to be updated to pcre2 &gt; 10.36?<br>
<br>
No, I think we should stick with the current version since this is a<br>
stable release.<br>
<br>
Steve<br>
<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#159836): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/159836" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/159836</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87365168=
/3620601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/87365168/3620601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" ta=
rget=3D"_blank">steve@sakoman.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div></div>

--0000000000009705c505d3600da5--

