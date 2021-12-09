Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B159C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 22:35:13 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web08.421.1639089312010675557
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 14:35:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FsGbb+f5;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id m16so4748005vkl.13
        for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Dec 2021 14:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z7k0aIAh2BfAhAIzcuOC4p2djmj6j9+EYfzdUZyss+c=;
        b=FsGbb+f5Q0nYAHNAxmfmzShZEusqvAYZr5a/dFFP0YRLIXWsDi1Nd0VAisr23PgKnf
         hAKi9190Mtqg4iY3ujg0bG2G1HQ9PgoGLUaIT43bpAIz5bvbmB7S+anprUCe0LkDOVEv
         pRByJB0hmq4SVAUpdmyNVTbpZbyj9eFT7kV41C3ck8+lx7LAz+SqDQeXOvv2enc8v8jr
         yKzjfMc+GQpWuKhhJuH0OtwMzVYgQMZAzARvOm60WCexKjgvjHKkQRoICfHYGN/ysBKT
         Qn8mY+cCtfL+WegSPxS4NJMvsbdtATrw5tsonM+Ku1zSLcUw+2VBgnDlGa7TSDUZoU/S
         9MIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z7k0aIAh2BfAhAIzcuOC4p2djmj6j9+EYfzdUZyss+c=;
        b=QPYNmHWK/iMpg4lNuC2d4D/48zXNOVLqFeavVP0cpUa2vD3cojg/hvonMf3NNlw2jJ
         MpfobGGNwaVSd1xHTP5j9GMjnbINdgBIJ7UB9ZrXxzNrnD57PfvZX4GyriCegLHUe+ZO
         Bgd8xtzkB6dvzPdRNVGCcv+LYO8p341dAkeU13wkK/2oCnLsZ67Joz//w9x55jGjfgMK
         iDijCKS7BsXgnlnFOxftcPqs9GR/nfexR9VBjDjZ6g4eEitgHPP/5xDmeJRKnm5sq/Jt
         maPnlVX1tnOP2Ywj7EhqsaC5HDHnSxrEI8M/UWgSZlvfp2opk3ID5KDb5T9BB0YfclS0
         z8Kw==
X-Gm-Message-State: AOAM532d98ApZ3NDIiF+jeYRuAqkr/UibLBLhoElyXArsdfYTmsL74Ov
	TyQgkR0Tguq2WuoPSKWPOjpB8l2so8xB7UcsH5o=
X-Google-Smtp-Source: 
 ABdhPJzb5tik7s5C0fZfll2wdhcaEvXI5s6N4KH7W8cs+KVqZMN/mv0sK3plddVEbP3vUZmCJU10qrJDbjmsCTyc7jI=
X-Received: by 2002:a1f:3f4f:: with SMTP id m76mr13688450vka.1.1639089311167;
 Thu, 09 Dec 2021 14:35:11 -0800 (PST)
MIME-Version: 1.0
References: <20211208215947.1979470-1-alex@linutronix.de>
 <20211208215947.1979470-2-alex@linutronix.de>
 <ab2226704dded8c823c02a45b051bd65683de13b.camel@linuxfoundation.org>
In-Reply-To: 
 <ab2226704dded8c823c02a45b051bd65683de13b.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 9 Dec 2021 23:34:59 +0100
Message-ID: 
 <CANNYZj_vCXfy9E0uek3w2hkdcvsvum=4nEvjoKVvC7EDSN=eCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/29] insane.bbclass: do not hardcode oe-core
 path in upstream-status check
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Konrad Weihmann <kweihmann@outlook.com>
Content-Type: multipart/alternative; boundary="00000000000025b9d105d2be3844"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Dec 2021 22:35:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159485

--00000000000025b9d105d2be3844
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Dec 2021 at 13:12, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> >         # skip patches not in oe-core
> > -       if '/meta/' not in fullpath:
> > +       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
> > +       match_oecore = oecore_re.search(fullpath)
> > +       if not match_oecore:
> >             continue
>
...

> I've realised the sstate tests don't pick this up since the metadata is in
> a
> fixed location for the tests so it doesn't change. As well as fixing this
> patch,
> we should revise the sstate sigs tests to test for changes in metadata path
> changing the sigs.
>

I've sent a patch that adds the test that fails with this change and passes
without it.

The next step would be to fix the above snippet. Taking the path variable
out of the signature is possible, but it would be better to do away with
file paths altogether, and start giving layers unique layer ids that can be
used in recipe context to detect which layer we're in. I can't quite figure
out how to do this - presumably, such id would be set in layer.conf, but
its scope would be limited only to recipes from that layer.

Alex

--00000000000025b9d105d2be3844
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 9 Dec 2021 at 13:12, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&gt;=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# skip patches not in oe-core<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;/meta/&#39; not in fullpath:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0oecore_re =3D re.compile(d.getVar(&#39;BBF=
ILE_PATTERN_core&#39;))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0match_oecore =3D oecore_re.search(fullpath=
)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0if not match_oecore:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0continue<br></blockquot=
e><div>... <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I&#3=
9;ve realised the sstate tests don&#39;t pick this up since the metadata is=
 in a<br>
fixed location for the tests so it doesn&#39;t change. As well as fixing th=
is patch,<br>
we should revise the sstate sigs tests to test for changes in metadata path=
<br>
changing the sigs.<br></blockquote><div><br></div></div><div class=3D"gmail=
_quote">I&#39;ve sent a patch that adds the test that fails with this chang=
e and passes without it.</div><div class=3D"gmail_quote"><br></div><div cla=
ss=3D"gmail_quote">The next step would be to fix the above snippet. Taking =
the path variable out of the signature is possible, but it would be better =
to do away with file paths altogether, and start giving layers unique layer=
 ids that can be used in recipe context to detect which layer we&#39;re in.=
 I can&#39;t quite figure out how to do this - presumably, such id would be=
 set in layer.conf, but its scope would be limited only to recipes from tha=
t layer.</div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quot=
e">Alex<br></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_q=
uote"><br></div></div>

--00000000000025b9d105d2be3844--

