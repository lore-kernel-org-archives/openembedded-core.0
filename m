Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6759AC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 00:07:59 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web08.24690.1655683674665648170
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 17:07:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qTCpg8HS;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id
 w19-20020a17090a8a1300b001ec79064d8dso5933436pjn.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jun 2022 17:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iGzhrkJS0k6YvC6zPJi4b2J0qICb0HgKy99dethCU40=;
        b=qTCpg8HSx6gD3TKi/3zOZZCpv3dElknnjaRtKJd0bkfJ/aXn3VINNRfLzY39xrvKVC
         Jc6Vs6oKZGaaB+A28CpFZCmIcXvQmi6E9Tdyezl9d7Aa91phJi6w966GmwF63T7VcFFX
         2XsW+xsKlYbcXHuF8MgHsm7jJsjb2tDIJjdI290NBmUMgu0gbzYOm966PdrwDitcYiRP
         5kPvbF/qU41Gv/A4XSptTdH0RbZWE+m+GH0rlmm8rwHYOrZMOJ14D15bD7w6EYF+wtqU
         dQyBnrGbh4UoBZaveNZKS1fvl6PHyLcm2kLRpH5WsHvk797vX5x4B2z41c0xcWMDUU9W
         afoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iGzhrkJS0k6YvC6zPJi4b2J0qICb0HgKy99dethCU40=;
        b=z9X3YBFYPEX5xXWM+uBvrVqaa7JSH1yECZJkUgaxR1sDKTHLajmYa0T4sucKhkSMRM
         feMz2TivXuLfy8MPyx6adtbgKou+edbvQganUqJUHSwWXsM7EJDZTHYvlbKT0qmYmGSG
         +wbHufEyOU2rjBhDEyIHNvXNTk3WDlDKHQlGOLhNW2eUPLOMqvZ/8aEeZrhqZk8PiNAU
         U4w7XA3RpvA0+qxHbCHAwAHWhX3qtoVjKfsD2lMExiK9FnTZyOGt66AmSmoMKGdZQ1bc
         XpCKHYR/XPXdNsYu92bY5CS7tYeeXX5TlS5lxkuZjPtkukmF7YEZXxUjKdaiS4IJuCMQ
         Qbaw==
X-Gm-Message-State: AJIora9CNcqyOV9lLeCtkB5k5ZCjtF0NTiKoLiPh8vmPb7D8OKeetDbQ
	GBJe0Ov4B9c/z8gvC7Ll8HO5+AgHX8XGDr0M1gw=
X-Google-Smtp-Source: 
 AGRyM1v5JMWIViXOlwZqimaAjtIMCZ3xPYwlvvaYIKTV5W/JTSY62Pa6pL4xJnOPgUy1lYY43O5AC9aJtkwL+vLGD3U=
X-Received: by 2002:a17:902:f60d:b0:16a:1a7f:a22f with SMTP id
 n13-20020a170902f60d00b0016a1a7fa22fmr5760917plg.13.1655683673891; Sun, 19
 Jun 2022 17:07:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CANNYZj_gJRaGsbm-Lb=eVZqYD1u=N4Xqe0edEz6DfTunT3hRWw@mail.gmail.com>
 <E113DB50-F77E-408E-ABCA-9B320BC506E0@burtonini.com>
In-Reply-To: <E113DB50-F77E-408E-ABCA-9B320BC506E0@burtonini.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Sun, 19 Jun 2022 17:07:42 -0700
Message-ID: 
 <CANx9H-Abrq7pWDYOZu3DvVRZ=3+fthKhW4FL=WHLoXD3-eCM=A@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-jsonschema: upgrading to 4.6.0 FAILED
To: Ross Burton <ross@burtonini.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
 Bruce Ashfield <bruce.ashfield@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003e2e0105e1d5e54e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 00:07:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167078

--0000000000003e2e0105e1d5e54e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 19, 2022 at 2:29 PM Ross Burton <ross@burtonini.com> wrote:

> Patches on the list.
>
> I=E2=80=99m now debating as to whether the class should be called hatch o=
r
> hatchling=E2=80=A6
>
or face hugger

>
> Ross
>
> > On 18 Jun 2022, at 21:54, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
> >
> > =EF=BB=BFpython3-jsonschema has replaced setuptools with a "modern,
> > well-designed, legacy-free, and now well-supported packaging tool,
> > Hatch", which oe-core does not yet support:
> >
> https://github.com/python-jsonschema/jsonschema/commit/f61f3b7a73c1440917=
8921bf4ce23050bf90560d
> >
> > Ross, I think there's been some work to enable that? Can you carry it
> > to completion?
> >
> > Alex
> >
> >> On Wed, 15 Jun 2022 at 15:05, Auto Upgrade Helper <auh@yoctoproject.or=
g>
> wrote:
> >>
> >> Hello,
> >>
> >> this email is a notification from the Auto Upgrade Helper
> >> that the automatic attempt to upgrade the recipe *python3-jsonschema*
> to *4.6.0* has Failed(do_compile).
> >>
> >> Detailed error information:
> >>
> >> do_compile failed
> >>
> >>
> >>
> >> Next steps:
> >>    - apply the patch: git am
> 0001-python3-jsonschema-upgrade-4.5.1-4.6.0.patch
> >>    - check the changes to upstream patches and summarize them in the
> commit message,
> >>    - compile an image that contains the package
> >>    - perform some basic sanity tests
> >>    - amend the patch and sign it off: git commit -s --reset-author
> --amend
> >>    - send it to the appropriate mailing list
> >>
> >> Alternatively, if you believe the recipe should not be upgraded at thi=
s
> time,
> >> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> >> automatic upgrades would no longer be attempted.
> >>
> >> Please review the attached files for further information and
> build/update failures.
> >> Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
> >>
> >> Regards,
> >> The Upgrade Helper
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#166956):
> https://lists.openembedded.org/g/openembedded-core/message/166956
> >> Mute This Topic: https://lists.openembedded.org/mt/91775634/1686489
> >> Group Owner: openembedded-core+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub =
[
> alex.kanavin@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>
>

--0000000000003e2e0105e1d5e54e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun, Jun 19, 2022 at 2:29 PM Ross Burton &lt;<a href=3D"=
mailto:ross@burtonini.com">ross@burtonini.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Patches on the list.<br>
<br>
I=E2=80=99m now debating as to whether the class should be called hatch or =
hatchling=E2=80=A6<br>
</blockquote><div dir=3D"auto">or face hugger</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><br>
Ross<br>
<br>
&gt; On 18 Jun 2022, at 21:54, Alexander Kanavin &lt;<a href=3D"mailto:alex=
.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrote:=
<br>
&gt; <br>
&gt; =EF=BB=BFpython3-jsonschema has replaced setuptools with a &quot;moder=
n,<br>
&gt; well-designed, legacy-free, and now well-supported packaging tool,<br>
&gt; Hatch&quot;, which oe-core does not yet support:<br>
&gt; <a href=3D"https://github.com/python-jsonschema/jsonschema/commit/f61f=
3b7a73c14409178921bf4ce23050bf90560d" rel=3D"noreferrer" target=3D"_blank">=
https://github.com/python-jsonschema/jsonschema/commit/f61f3b7a73c144091789=
21bf4ce23050bf90560d</a><br>
&gt; <br>
&gt; Ross, I think there&#39;s been some work to enable that? Can you carry=
 it<br>
&gt; to completion?<br>
&gt; <br>
&gt; Alex<br>
&gt; <br>
&gt;&gt; On Wed, 15 Jun 2022 at 15:05, Auto Upgrade Helper &lt;<a href=3D"m=
ailto:auh@yoctoproject.org" target=3D"_blank">auh@yoctoproject.org</a>&gt; =
wrote:<br>
&gt;&gt; <br>
&gt;&gt; Hello,<br>
&gt;&gt; <br>
&gt;&gt; this email is a notification from the Auto Upgrade Helper<br>
&gt;&gt; that the automatic attempt to upgrade the recipe *python3-jsonsche=
ma* to *4.6.0* has Failed(do_compile).<br>
&gt;&gt; <br>
&gt;&gt; Detailed error information:<br>
&gt;&gt; <br>
&gt;&gt; do_compile failed<br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; <br>
&gt;&gt; Next steps:<br>
&gt;&gt;=C2=A0 =C2=A0 - apply the patch: git am 0001-python3-jsonschema-upg=
rade-4.5.1-4.6.0.patch<br>
&gt;&gt;=C2=A0 =C2=A0 - check the changes to upstream patches and summarize=
 them in the commit message,<br>
&gt;&gt;=C2=A0 =C2=A0 - compile an image that contains the package<br>
&gt;&gt;=C2=A0 =C2=A0 - perform some basic sanity tests<br>
&gt;&gt;=C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s --re=
set-author --amend<br>
&gt;&gt;=C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
&gt;&gt; <br>
&gt;&gt; Alternatively, if you believe the recipe should not be upgraded at=
 this time,<br>
&gt;&gt; you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so =
that<br>
&gt;&gt; automatic upgrades would no longer be attempted.<br>
&gt;&gt; <br>
&gt;&gt; Please review the attached files for further information and build=
/update failures.<br>
&gt;&gt; Any problem please file a bug at <a href=3D"https://bugzilla.yocto=
project.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"no=
referrer" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi=
?product=3DAutomated%20Update%20Handler</a><br>
&gt;&gt; <br>
&gt;&gt; Regards,<br>
&gt;&gt; The Upgrade Helper<br>
&gt;&gt; <br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; View/Reply Online (#166956): <a href=3D"https://lists.openembedded=
.org/g/openembedded-core/message/166956" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.openembedded.org/g/openembedded-core/message/166956</a><br=
>
&gt;&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/9177=
5634/1686489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedd=
ed.org/mt/91775634/1686489</a><br>
&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.ope=
nembedded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded=
.org</a><br>
&gt;&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembed=
ded-core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmai=
l.com" target=3D"_blank">alex.kanavin@gmail.com</a>]<br>
&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; <br>
</blockquote></div></div>

--0000000000003e2e0105e1d5e54e--

