Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.36448.1605540232677066295
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 07:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uOk/ycrm;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id cw8so24939999ejb.8
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 07:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RuQYbp30IyUauAIcG2G/YO5Z2cXorBBIyz311TIX54U=;
        b=uOk/ycrmCOLgEiliC2bHFAEQhPDtgaIiiK6XnpJtgA81I3qwgJntGYJOPvlIMjHsk+
         CU/0OAa2FodLxguFSDAoIZcLHYSWuZkxz2kS+Ntw58dMXbaL13Ffo1qJ7tXRVDmRAKEx
         CI+9DKTVo80TPpFjhZBUezFtHwKZtojdRjNW7OitDQ8sXr5rNLvJHmwvkf7phbVsm9eO
         2Z1pjceao1XQCt/dDBaFDYPp37FkZ0YyyraQvvS6pv2mclxDxxDsKLbsrVG1LL83n+x9
         2Pt6DomG/Urvq7hB+4p5bc+XPCLAkIftbMQBPWxzv21VZKyYqP/vs4OVt6nTRpLUnn0S
         ezIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RuQYbp30IyUauAIcG2G/YO5Z2cXorBBIyz311TIX54U=;
        b=paDF/cmrW8LtfonKrUFe95ohKVQanYgrbQoXRJJkqwJbKWCq+t4hZXB+BqZR6E9FsQ
         HgZfAksJiKOl7Rl8pdAK3PNesDbo5pd8u0nd+5RmtmNPvMt6mJ8nEspEhRd6Ff1vFDi1
         4TrS/O2tCj7dNYBBjTN36HV4ua7pREJEC6RPsT6PaTV8TRR3VXD6yThS+hShfV8gkac0
         12oDHb3bAka5Vwurrfta0vKVoszQ/4EO3ydGTqz75zVK1QEFn9gGoHa9U88IMMfP9EHb
         kzebw5fvSayKnLalGj/HQB1sJxb89bqqPgP+mnKgvbQ+dQgeBZ12AqdTPCPc87F/dIFL
         qrKQ==
X-Gm-Message-State: AOAM530Ipta314zvOjtq7UeCsgDmfNiHuOZ9hJfkJNy8YT+0/TZ5zRqe
	z9c9oIzAY0KRUmu4P32+vE/13q8OgATEP+rjywQ=
X-Google-Smtp-Source: ABdhPJzj5ggoEXoMtPYBe4vOS5fQI+sxN+yP0R6MR6aKIjM4ynLFKjkjIuJZrUOdnOLD34SbOwHr6pWasSmFXpnk30k=
X-Received: by 2002:a17:906:3644:: with SMTP id r4mr15130825ejb.517.1605540230668;
 Mon, 16 Nov 2020 07:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20201029114052.23141-1-dzagorui@cisco.com> <CADkTA4OGBOtnMD=t1xppe-5quLow8uPf99ZHknrSnPLAQKkoDA@mail.gmail.com>
 <1642C502B17F26A6.28917@lists.openembedded.org> <1645CE4049F0E4CD.31324@lists.openembedded.org>
 <1605539690406.1214@cisco.com>
In-Reply-To: <1605539690406.1214@cisco.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 16 Nov 2020 10:23:39 -0500
Message-ID: <CADkTA4PFtRR0sT+U1SRdwr-p266rgNj=Y1uF=R4Z9qoLuyaKoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel-devsrc: improve reproducibility for arm64
To: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)" <dzagorui@cisco.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000001f2b6b05b43af73d"

--0000000000001f2b6b05b43af73d
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 16, 2020 at 10:14 AM Denys Zagorui -X (dzagorui - GLOBALLOGIC
INC at Cisco) <dzagorui@cisco.com> wrote:

>
> > > > .vdso-offsets.h.cmd contains command that was used to produce
> vdso-offsets.h.
> > > > It breaks reproducibility because it has an absolute path in it.
> There is no
> > > > any value to package such files so it can be dropped.
> > > >
> > >
> > > Have you confirmed that an on-target 'make scripts prepare' property
> > > regenerates the file without triggering and oldconfig ?
> > >
> > > Otherwise, the change looks fine to me.
> > >
> > > Bruce
> >
> > Yes, confirmed that oldconfig wont be triggered.
> >
> > Thanks,
> > Denys
>
> ping
>
I expected that this would have been picked up after I acked it, but there
was a release to do in the middle of it being submitted and now .. so
things have been a bit slower.

I'll put it in my local queue, that way if it doesn't get picked up, I'll
send it with my next pull request.

Bruce



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--0000000000001f2b6b05b43af73d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Mon, Nov 16, 2020 at 10:14 AM Denys Zagorui -X (=
dzagorui - GLOBALLOGIC INC at Cisco) &lt;<a href=3D"mailto:dzagorui@cisco.c=
om">dzagorui@cisco.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex"><br>
&gt; &gt; &gt; .vdso-offsets.h.cmd contains command that was used to produc=
e vdso-offsets.h.<br>
&gt; &gt; &gt; It breaks reproducibility because it has an absolute path in=
 it. There is no<br>
&gt; &gt; &gt; any value to package such files so it can be dropped.<br>
&gt; &gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; Have you confirmed that an on-target &#39;make scripts prepare&#3=
9; property<br>
&gt; &gt; regenerates the file without triggering and oldconfig ?<br>
&gt; &gt;<br>
&gt; &gt; Otherwise, the change looks fine to me.<br>
&gt; &gt;<br>
&gt; &gt; Bruce<br>
&gt;<br>
&gt; Yes, confirmed that oldconfig wont be triggered.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Denys<br>
<br>
ping<br>
</blockquote></div><div class=3D"gmail_default" style=3D"font-size:small"><=
/div><div class=3D"gmail_default" style=3D"font-size:small">I expected that=
 this would have been picked up after I acked it, but there was a release t=
o do in the middle of it being submitted and now .. so things have been a b=
it slower.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ll put i=
t in my local queue, that way if it doesn&#39;t get picked up, I&#39;ll sen=
d it with my next pull request.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Bruce</div><div><br></div><br clear=3D"all"><div><br></div>-- <br><d=
iv dir=3D"ltr" class=3D"gmail_signature">- Thou shalt not follow the NULL p=
ointer, for chaos and madness await thee at its end<br>- &quot;Use the forc=
e Harry&quot; - Gandalf, Star Trek II<br><br></div></div>

--0000000000001f2b6b05b43af73d--
