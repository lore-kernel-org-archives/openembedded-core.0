Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A4FC001E0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:39:26 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web10.18859.1691678359498891172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=crE8Z67t;
 spf=pass (domain: gmail.com, ip: 209.85.160.174, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-403ea0a50f7so6194521cf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691678358; x=1692283158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gkxbZ0PPuiYQyH1b26b1IfzJmhbUNraiIKF6l7dtjZ8=;
        b=crE8Z67tbL/4N2B/5qBRIUOPKoJNjDnY4qEDzxUd5xBXO6o3a/KFRkV6O6+h8N+k6Q
         7GUA6yhF7W6gVisqOjVPmQl3wnx/EhZi2x6RGugSPk50TWz7Wrj4Z9keP2VclYThHXa8
         HxVc2og/4ZscCMz7N9SQVCQfTEEyb70OwdJoRbg/mU9bstbfhrtLRU2rM7qX4MDPLmQE
         xkO5dani7JZeFLIY1XPOOfpwzIFhOHh6PNbCMFrufo0a6I++Y5HfyhAF2Yuh0HYbmhph
         uvbrzz1AXfLNJ8R5MEWtpG4naRrvM8plNp7oBEW8HMdK2JVEXvL7wmcRoD8LdAdeogCL
         fFTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691678358; x=1692283158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gkxbZ0PPuiYQyH1b26b1IfzJmhbUNraiIKF6l7dtjZ8=;
        b=ema6ocGqgWT3fC0kD9PMv2v3ssDq72L3OQK+LEwT4TbaxvWV4n1YZyxbyVzSony22v
         5I3A/JOYcz9miSZRryIW9scNN588PxrLFKDYqD0RSpPgEBTiSNgbhoydmCrdJ/OhYd4l
         qCFU96M/B9ncbKYIBzrzuLOp6yzyDmV+yDAZbGY8dJJ7WfjluqNERZ4etqANUEgNm/IW
         Aocje5bD6xepqCWAFwlrcWdOCHGT6Xqu3fBRZ/1LiwwYEzhlDgQh1VIWnW3KMN57o4of
         Wm5lR/5zy/4PiFuv0IRFAVl0CWLzkK9Uy8K06X3I9BexqwWj94kNfo6UoRg6dF2Lw2jv
         IYVA==
X-Gm-Message-State: AOJu0YyeBChSq5yUXGIyI+39KDYlD07SFhyR3pVMvPjcju0cx0XY2dDr
	/Bs55YfeE0UsSmx9IJkamB4pdWisAZ3tvs3C3JM=
X-Google-Smtp-Source: AGHT+IH8hOWW5cM98vpIh2ELvYTj+v31nMf8tRFgE1UF/J/3cEOUMJ37tgWvXRsW6Cjq0+4smDsjX+RRFOIp0Va0UC8=
X-Received: by 2002:ad4:4044:0:b0:63c:fb1b:6bb0 with SMTP id
 r4-20020ad44044000000b0063cfb1b6bb0mr2634249qvp.52.1691678358482; Thu, 10 Aug
 2023 07:39:18 -0700 (PDT)
MIME-Version: 1.0
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com> <CADkTA4PUSq22Ct4qg50VaAtY79Q9o9FgtDmziry7QwyAqqi3qg@mail.gmail.com>
In-Reply-To: <CADkTA4PUSq22Ct4qg50VaAtY79Q9o9FgtDmziry7QwyAqqi3qg@mail.gmail.com>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Thu, 10 Aug 2023 16:39:07 +0200
Message-ID: <CA+cAkercJOuNXtmiy1WKXZnSzhMH3wQ8TFRA3hva5bXRMEWD=g@mail.gmail.com>
Subject: Re: [docs] Keep scripts/create-pull-request and send-pull-request ?
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000a1b4bd0602928fce"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185756

--000000000000a1b4bd0602928fce
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 10 ao=C3=BBt 2023, 16:09, Bruce Ashfield <bruce.ashfield@gmail.com>=
 a
=C3=A9crit :

> On Thu, Aug 10, 2023 at 10:04=E2=80=AFAM Michael Opdenacker via
> lists.yoctoproject.org
> <michael.opdenacker=3Dbootlin.com@lists.yoctoproject.org> wrote:
> >
> > Greetings,
> >
> > I'm reviewing
> >
> https://docs.yoctoproject.org/next/contributor-guide/submit-change.html#u=
sing-scripts-to-push-a-change-upstream-and-request-a-pull
> > and trying to simplify it.
> >
> > Do people still use scripts/create-pull-request and send-pull-request? =
I
> > see some obsolete URLs in the first script, and mostly old commits to
> > their code.
>
> I use create-pull-request for all my series, so the scripts still do
> work and are in at least in use here.
>
> But I send with git send-email directly.
>


Same here, I use the both scripts for patch series but I can perfectly use
git tools directly with some documentations (or if I opened those scripts)


>
> Bruce
>
> >
> > I'm also asking because I'm wondering whether it's better to document
> > how to create and send pull requests from standard git tools. This way,
> > people also learn how to submit pull requests to other upstreams.
> >
> > What do you think?
> >
> > Thanks in advance
> > Michael.
> >
> > --
> > Michael Opdenacker, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#4136):
> https://lists.yoctoproject.org/g/docs/message/4136
> Mute This Topic: https://lists.yoctoproject.org/mt/100663723/6213388
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [
> frederic.martinsons@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a1b4bd0602928fce
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Le jeu. 10 ao=C3=BBt 2023, 16:09, Bruce Ashfield &lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;=
 a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Aug 10=
, 2023 at 10:04=E2=80=AFAM Michael Opdenacker via<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">lists.yoctoproject.org</a><br>
&lt;michael.opdenacker=3D<a href=3D"mailto:bootlin.com@lists.yoctoproject.o=
rg" target=3D"_blank" rel=3D"noreferrer">bootlin.com@lists.yoctoproject.org=
</a>&gt; wrote:<br>
&gt;<br>
&gt; Greetings,<br>
&gt;<br>
&gt; I&#39;m reviewing<br>
&gt; <a href=3D"https://docs.yoctoproject.org/next/contributor-guide/submit=
-change.html#using-scripts-to-push-a-change-upstream-and-request-a-pull" re=
l=3D"noreferrer noreferrer" target=3D"_blank">https://docs.yoctoproject.org=
/next/contributor-guide/submit-change.html#using-scripts-to-push-a-change-u=
pstream-and-request-a-pull</a><br>
&gt; and trying to simplify it.<br>
&gt;<br>
&gt; Do people still use scripts/create-pull-request and send-pull-request?=
 I<br>
&gt; see some obsolete URLs in the first script, and mostly old commits to<=
br>
&gt; their code.<br>
<br>
I use create-pull-request for all my series, so the scripts still do<br>
work and are in at least in use here.<br>
<br>
But I send with git send-email directly.<br></blockquote></div></div><div d=
ir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Same he=
re, I use the both scripts for patch series but I can perfectly use git too=
ls directly with some documentations (or if I opened those scripts)=C2=A0</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br><br>
Bruce<br>
<br>
&gt;<br>
&gt; I&#39;m also asking because I&#39;m wondering whether it&#39;s better =
to document<br>
&gt; how to create and send pull requests from standard git tools. This way=
,<br>
&gt; people also learn how to submit pull requests to other upstreams.<br>
&gt;<br>
&gt; What do you think?<br>
&gt;<br>
&gt; Thanks in advance<br>
&gt; Michael.<br>
&gt;<br>
&gt; --<br>
&gt; Michael Opdenacker, Bootlin<br>
&gt; Embedded Linux and Kernel engineering<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=
=3D"_blank">https://bootlin.com</a><br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#4136): <a href=3D"https://lists.yoctoproject.org/g/docs=
/message/4136" rel=3D"noreferrer noreferrer" target=3D"_blank">https://list=
s.yoctoproject.org/g/docs/message/4136</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/100663723/621=
3388" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/100663723/6213388</a><br>
Group Owner: <a href=3D"mailto:docs%2Bowner@lists.yoctoproject.org" target=
=3D"_blank" rel=3D"noreferrer">docs+owner@lists.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/docs/unsub" rel=3D=
"noreferrer noreferrer" target=3D"_blank">https://lists.yoctoproject.org/g/=
docs/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"=
_blank" rel=3D"noreferrer">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000a1b4bd0602928fce--

