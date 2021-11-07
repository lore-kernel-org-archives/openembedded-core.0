Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F10C433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 11:40:01 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.30183.1636285200853758659
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 03:40:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XO7rOVCL;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id l22so2652942lfg.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 03:40:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iqF+wdKPXNJRd/IY43GNkbE+zX1FkM2ViVenQNf9Pc4=;
        b=XO7rOVCLoWb0fIgh3gN4dpCfui47aONxwsc18+itNv9vfOC1ohePaJeeWeigE2B3lk
         hJ2icCkRgYDRUQ+6h+cQh9IQLQlFa9LjWb41cAkIAxH0vMoZLgzehQ1BvvF1ilaoccuQ
         CkHpT3YxT+qYzlEhwXoQxfqtqhIVqWNwP6ENBfEb5r+NTWn+nF68uyR/Goz/gHSGOmzk
         1NkR77IzfyEJ8ihkrkdGdCLmHXeVFWO4eZzVhJeqxS0k3zBXImDmk81hMIVAoky8/vDv
         v86xBRZVDl4OsPwvXfV/jgFbQYsGF3FOwPIivVckKFjTp0/CkWYOgTk0WA0AJyKuLwz8
         zzww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iqF+wdKPXNJRd/IY43GNkbE+zX1FkM2ViVenQNf9Pc4=;
        b=h5ei3OtsmRgjExKjyXqvXgAVpy4MxCdeWZfqPK1vlr6UR/Dcpog3Ov/kfAtakpoxYS
         bqEyPXRLyA347Hj3bHqf0GKrcbT39m1vgkORWq0wh1KRq7J15VegSYMBVGKrxRdfR63J
         zqWMcoMoY0/5LFu79XqUU+nIRdgLsFEOi/xyYqgnLQF3cZgg12/veDKPtM0NPI0aAD0A
         vuUsA7Tfqiox3f3ZyQxR3rN33qVrGIN6pKDJ8MOyHxsC0+WDQXHjm0HiKcFy5pgxOaFr
         0tGhi+1PYNjReDyEOh/NL4rDAZZAtp/wGmXnwKsKAyUoaMjPBIOK9TsVP6tnSCXonovs
         W2Mg==
X-Gm-Message-State: AOAM533anEI1NXjC1AbkfGrqCMUi/bu8/Uec9eMlsYnnHShJy/PuotbN
	5FtsXsMiN6UcxZdBqgBWE7tBh0qZkJBjnJuyntw=
X-Google-Smtp-Source: 
 ABdhPJwvwMXfcwVwKdy8R6eizBTbTBub4WNc/GfqJNCqrq38FAOxzSOBG4SNksMvGpV8+pP44Y6AuQJiB+lPhlCe0FE=
X-Received: by 2002:ac2:5e65:: with SMTP id a5mr7290632lfr.94.1636285198896;
 Sun, 07 Nov 2021 03:39:58 -0800 (PST)
MIME-Version: 1.0
References: <16B46DC051798307.25609@lists.openembedded.org>
 <CANPvuRkNsLegEXwZBzjx6OHSwb36RHAhN8qH2HTZgBBFrE0_TQ@mail.gmail.com>
 <CAGDS+nmSC2FO9aOWdD39ciMn37s--kqwpWGBKg8UQpR2G-oKLg@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nmSC2FO9aOWdD39ciMn37s--kqwpWGBKg8UQpR2G-oKLg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Sun, 7 Nov 2021 11:39:48 +0000
Message-ID: 
 <CANPvuRk=Q3TpJeKdMSyeZT-Fdb60t38q4rr_rcL7bD46AMKXuA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sstate: another fix for touching files
 inside pseudo
To: Steve Sakoman <sakoman@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000811f805d031566b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 11:40:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157950

--0000000000000811f805d031566b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Steve Sakoman <sakoman@gmail.com> escreveu no dia s=C3=A1bado, 6/11/2021 =
=C3=A0(s)
21:18:

> On Sat, Nov 6, 2021 at 8:09 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> > Hi Steve,
> >
> > Can this patch be backported to dunfell branch to land in the next
> release 3.1.12?
>
> This patch won't apply due to the zstd related changes in master.
> Could you submit a dunfell version of the patch?
>

Sure, I have send it for dunfell

Jose


>
> Steve
>
> >
> > Jose
> >
> > Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
> gmail.com@lists.openembedded.org> escreveu no dia quinta, 4/11/2021 =C3=
=A0(s)
> 19:14:
> >>
> >> This patch is a fixup for 676757f "sstate: fix touching files inside
> pseudo"
> >>
> >> running the 'id' command inside the sstate_unpack_package
> >> function shows that this funcion run inside the pseudo:
> >>
> >>  uid=3D0(root) gid=3D0(root) groups=3D0(root)
> >>
> >> The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo ]
> >> will always return true and the touch can fail when the real user
> >> don't have permission or in readonly filesystem.
> >>
> >> As the documentation refers:
> >> - the file test operator "-w" check if the file has write permission
> >> (for the user running the test).
> >> - the file test operator "-O" check if you are owner of file
> >>
> >> We can avoid this test running the touch and mask any return errors
> >> that we have.
> >>
> >> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> >> ---
> >>
> >> V2: match the original code
> >>
> >>  meta/classes/sstate.bbclass | 12 ++++++------
> >>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> >> index 8182010047..849723d4dc 100644
> >> --- a/meta/classes/sstate.bbclass
> >> +++ b/meta/classes/sstate.bbclass
> >> @@ -900,12 +900,12 @@ sstate_unpack_package () {
> >>         fi
> >>
> >>         tar -I "$ZSTD" -xvf ${SSTATE_PKG}
> >> -       # update .siginfo atime on local/NFS mirror
> >> -       [ -O ${SSTATE_PKG}.siginfo ] && [ -w ${SSTATE_PKG}.siginfo ] &=
&
> [ -h ${SSTATE_PKG}.siginfo ] && touch -a ${SSTATE_PKG}.siginfo
> >> -       # Use "! -w ||" to return true for read only files
> >> -       [ ! -w ${SSTATE_PKG} ] || touch --no-dereference ${SSTATE_PKG}
> >> -       [ ! -w ${SSTATE_PKG}.sig ] || [ ! -e ${SSTATE_PKG}.sig ] ||
> touch --no-dereference ${SSTATE_PKG}.sig
> >> -       [ ! -w ${SSTATE_PKG}.siginfo ] || [ ! -e ${SSTATE_PKG}.siginfo
> ] || touch --no-dereference ${SSTATE_PKG}.siginfo
> >> +       # update .siginfo atime on local/NFS mirror if it is a symboli=
c
> link
> >> +       [ ! -h ${SSTATE_PKG}.siginfo ] || touch -a
> ${SSTATE_PKG}.siginfo 2>/dev/null || true
> >> +       # update each symbolic link instead of any referenced file
> >> +       touch --no-dereference ${SSTATE_PKG} 2>/dev/null || true
> >> +       [ ! -e ${SSTATE_PKG}.sig ] || touch --no-dereference
> ${SSTATE_PKG}.sig 2>/dev/null || true
> >> +       [ ! -e ${SSTATE_PKG}.siginfo ] || touch --no-dereference
> ${SSTATE_PKG}.siginfo 2>/dev/null || true
> >>  }
> >>
> >>  BB_HASHCHECK_FUNCTION =3D "sstate_checkhashes"
> >> --
> >> 2.33.1
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157943):
> https://lists.openembedded.org/g/openembedded-core/message/157943
> > Mute This Topic: https://lists.openembedded.org/mt/86824160/3617601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> sakoman@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000000811f805d031566b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Steve Sakoman &lt;<a href=3D"mailto:s=
akoman@gmail.com">sakoman@gmail.com</a>&gt; escreveu no dia s=C3=A1bado, 6/=
11/2021 =C3=A0(s) 21:18:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Sat, Nov 6, 2021 at 8:09 AM Jose Quaresma &lt;<a href=3D"mail=
to:quaresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&g=
t; wrote:<br>
&gt;<br>
&gt; Hi Steve,<br>
&gt;<br>
&gt; Can this patch be backported to dunfell branch to land in the next rel=
ease 3.1.12?<br>
<br>
This patch won&#39;t apply due to the zstd related changes in master.<br>
Could you submit a dunfell version of the patch?<br></blockquote><div><br><=
/div><div>Sure, I have send it for dunfell</div><div><br></div><div>Jose</d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Steve<br>
<br>
&gt;<br>
&gt; Jose<br>
&gt;<br>
&gt; Jose Quaresma via <a href=3D"http://lists.openembedded.org" rel=3D"nor=
eferrer" target=3D"_blank">lists.openembedded.org</a> &lt;quaresma.jose=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org" target=3D"_blank">gmail.=
com@lists.openembedded.org</a>&gt; escreveu no dia quinta, 4/11/2021 =C3=A0=
(s) 19:14:<br>
&gt;&gt;<br>
&gt;&gt; This patch is a fixup for 676757f &quot;sstate: fix touching files=
 inside pseudo&quot;<br>
&gt;&gt;<br>
&gt;&gt; running the &#39;id&#39; command inside the sstate_unpack_package<=
br>
&gt;&gt; function shows that this funcion run inside the pseudo:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 uid=3D0(root) gid=3D0(root) groups=3D0(root)<br>
&gt;&gt;<br>
&gt;&gt; The check for [ -w ${SSTATE_PKG} ] and [ -O ${SSTATE_PKG}.siginfo =
]<br>
&gt;&gt; will always return true and the touch can fail when the real user<=
br>
&gt;&gt; don&#39;t have permission or in readonly filesystem.<br>
&gt;&gt;<br>
&gt;&gt; As the documentation refers:<br>
&gt;&gt; - the file test operator &quot;-w&quot; check if the file has writ=
e permission<br>
&gt;&gt; (for the user running the test).<br>
&gt;&gt; - the file test operator &quot;-O&quot; check if you are owner of =
file<br>
&gt;&gt;<br>
&gt;&gt; We can avoid this test running the touch and mask any return error=
s<br>
&gt;&gt; that we have.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@g=
mail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;<br>
&gt;&gt; V2: match the original code<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 meta/classes/sstate.bbclass | 12 ++++++------<br>
&gt;&gt;=C2=A0 1 file changed, 6 insertions(+), 6 deletions(-)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbc=
lass<br>
&gt;&gt; index 8182010047..849723d4dc 100644<br>
&gt;&gt; --- a/meta/classes/sstate.bbclass<br>
&gt;&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt;&gt; @@ -900,12 +900,12 @@ sstate_unpack_package () {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tar -I &quot;$ZSTD&quot; -xvf ${S=
STATE_PKG}<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS m=
irror<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ -O ${SSTATE_PKG}.siginfo ] &amp;&amp=
; [ -w ${SSTATE_PKG}.siginfo ] &amp;&amp; [ -h ${SSTATE_PKG}.siginfo ] &amp=
;&amp; touch -a ${SSTATE_PKG}.siginfo<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0# Use &quot;! -w ||&quot; to return tr=
ue for read only files<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} ] || touch --no-d=
ereference ${SSTATE_PKG}<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG}.sig ] || [ ! -e $=
{SSTATE_PKG}.sig ] || touch --no-dereference ${SSTATE_PKG}.sig<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG}.siginfo ] || [ ! =
-e ${SSTATE_PKG}.siginfo ] || touch --no-dereference ${SSTATE_PKG}.siginfo<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# update .siginfo atime on local/NFS m=
irror if it is a symbolic link<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -h ${SSTATE_PKG}.siginfo ] || touc=
h -a ${SSTATE_PKG}.siginfo 2&gt;/dev/null || true<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0# update each symbolic link instead of=
 any referenced file<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0touch --no-dereference ${SSTATE_PKG} 2=
&gt;/dev/null || true<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -e ${SSTATE_PKG}.sig ] || touch --=
no-dereference ${SSTATE_PKG}.sig 2&gt;/dev/null || true<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -e ${SSTATE_PKG}.siginfo ] || touc=
h --no-dereference ${SSTATE_PKG}.siginfo 2&gt;/dev/null || true<br>
&gt;&gt;=C2=A0 }<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 BB_HASHCHECK_FUNCTION =3D &quot;sstate_checkhashes&quot;<br>
&gt;&gt; --<br>
&gt;&gt; 2.33.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157943): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157943" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157943</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86824160=
/3617601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86824160/3617601</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:sakoman@gmail.com" ta=
rget=3D"_blank">sakoman@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000000811f805d031566b--

