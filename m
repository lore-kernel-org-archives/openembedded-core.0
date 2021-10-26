Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BEBC433EF
	for <webhook@archiver.kernel.org>; Tue, 26 Oct 2021 09:06:12 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.9570.1635239171153891258
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 02:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J+xJ02VL;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id bp15so18093752lfb.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Oct 2021 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kONdM0L4kJYNHRyAKNhQwYo7yFuxxH7xbKEBCY4RJRE=;
        b=J+xJ02VLRqxSEgTVzxKbk+JANcws0z5ZMcSVoah2u6tHJxT1ocdAYrHbXQIuQjbqGe
         JYtF8CGaBFDw/AXmC3TA8oQO2hBZSbHe8lSVM+TbdXmcpmONb0V85jn5XQUuQTnDVpVa
         vtf0AWzGJmnq+aYMt60ETTEPLB4LZii9cR+5wobeqRd1Of8lnVKeEReCq21NyboComUT
         z1CZVXeTt0SLxLeVeahyL1YRnUCR+Z9yfCDPpCdOFYFIWKLwjJq1eWYFBB13CYwOVNPn
         evRPcbh3jxaXpnVZW021JuJc/AzEv0zsFbN7mZVWSJl9nSy+zyTlWD+Nb3pxaQQUqwF4
         /5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kONdM0L4kJYNHRyAKNhQwYo7yFuxxH7xbKEBCY4RJRE=;
        b=I+RbsJgOVJmYLAn4YPKRVm7q9nCFHIVRL5ONEBkwHSKUjWhLR34a0jiSjdbwvupXgM
         bnfO83atEeWEBUkfDmipUqHN+OB/NCa3xbtYdWsK2XTKQiMlRqieJ0VjMrCHBflEs7c6
         IKBmVEEYUo5Fs4I5wYYUzqyX42rmwIW4gHA+lvkBZQaHrEBR1fW9vTW4wWo7icflZPzZ
         6aztvo/zxzq81akygIEOMETu+9z/i7FpdHO+T1FlWKrOZ+nHwIDFVZJsRWIdWpfllJ8Z
         usQkpo29InKw73/r4uPVkvNudTSG5OaGOeUHo9OWQG159yYM71zfaIv03B4KxCNdalrH
         osRw==
X-Gm-Message-State: AOAM5338B8Lignt4ClbaNBtf7MMPdFBjlbghkKNJl4X226rT8u9jzrQ0
	ExzzxNsQVwXC6xe2O9Jts7tkKKX277GP4eLosI4=
X-Google-Smtp-Source: 
 ABdhPJyWMtis0HKCW+BP/+rcZLTEo96Aysm+v6si5c9KSZOagauiiKFUn69Rhe8AKpLx+HHK58Jgw43ZU2d6KHyASN0=
X-Received: by 2002:a05:6512:2209:: with SMTP id
 h9mr4182509lfu.324.1635239169143;
 Tue, 26 Oct 2021 02:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211020172544.394910-1-quaresma.jose@gmail.com>
 <0f410a21bce841669662ebb9b742f08a@axis.com>
In-Reply-To: <0f410a21bce841669662ebb9b742f08a@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 26 Oct 2021 10:05:57 +0100
Message-ID: 
 <CANPvuR=3KGiP6mcdVaBkod6xYz9tbwKXx-Z-SBo7qVa82w+EWQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "Mittal, Anuj" <anuj.mittal@intel.com>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000ccb53405cf3dc98c"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Oct 2021 09:06:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157377

--000000000000ccb53405cf3dc98c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have found this bug on the dunfell branch, can it be backported to
dunfell too?

Jose

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia segunda,
25/10/2021 =C3=A0(s) 15:28:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Jose Quaresma
> > Sent: den 20 oktober 2021 19:26
> > To: openembedded-core@lists.openembedded.org
> > Cc: Jose Quaresma <quaresma.jose@gmail.com>
> > Subject: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo
> >
> > running the 'id' command inside the sstate_create_package
> > function shows that this funcion run inside the pseudo:
> >
> >  uid=3D0(root) gid=3D0(root) groups=3D0(root)
> >
> > The check for touch files [ ! -w ${SSTATE_PKG} ]
> > will always return true and the touch can fail
> > when the real user don't have permission or
> > in readonly filesystem.
> >
> > As the documentation refers, the file test operator "-w"
> > check if the file has write permission (for the user running the test).
> >
> > We can avoid this test running the touch and mask any return errors
> > that we have.
> >
> > Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> > ---
> >
> > v2: redirect stderr to /dev/null to avoid messages in the log
> >
> >  meta/classes/sstate.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 3c179259e7..146f56ea2d 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] =3D "${WORKDIR}"
> >  sstate_create_package () {
> >       # Exit early if it already exists
> >       if [ -e ${SSTATE_PKG} ]; then
> > -             [ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> > +             touch ${SSTATE_PKG} 2>/dev/null || true
> >               return
> >       fi
> >
> > @@ -865,7 +865,7 @@ sstate_create_package () {
> >       else
> >               rm $TFILE
> >       fi
> > -     [ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> > +     touch ${SSTATE_PKG} 2>/dev/null || true
> >  }
> >
> >  python sstate_sign_package () {
> > --
> > 2.33.1
>
> Can this please be backported to Hardknott and Honister now that
> it has been accepted for master?
>
> //Peter
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ccb53405cf3dc98c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have found this bug on the dunfell branch, can it be bac=
kported to dunfell too?<div><br></div><div>Jose</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &=
lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.c=
om</a>&gt; escreveu no dia segunda, 25/10/2021 =C3=A0(s) 15:28:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">&gt; -----Original Message-=
----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Jose Quaresma<br>
&gt; Sent: den 20 oktober 2021 19:26<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" targe=
t=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH v2] sstate: fix touching files inside pseudo=
<br>
&gt; <br>
&gt; running the &#39;id&#39; command inside the sstate_create_package<br>
&gt; function shows that this funcion run inside the pseudo:<br>
&gt; <br>
&gt;=C2=A0 uid=3D0(root) gid=3D0(root) groups=3D0(root)<br>
&gt; <br>
&gt; The check for touch files [ ! -w ${SSTATE_PKG} ]<br>
&gt; will always return true and the touch can fail<br>
&gt; when the real user don&#39;t have permission or<br>
&gt; in readonly filesystem.<br>
&gt; <br>
&gt; As the documentation refers, the file test operator &quot;-w&quot;<br>
&gt; check if the file has write permission (for the user running the test)=
.<br>
&gt; <br>
&gt; We can avoid this test running the touch and mask any return errors<br=
>
&gt; that we have.<br>
&gt; <br>
&gt; Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail=
.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; <br>
&gt; v2: redirect stderr to /dev/null to avoid messages in the log<br>
&gt; <br>
&gt;=C2=A0 meta/classes/sstate.bbclass | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 3c179259e7..146f56ea2d 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] =3D &quot;${WORKDIR}&qu=
ot;<br>
&gt;=C2=A0 sstate_create_package () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Exit early if it already exists<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${SSTATE_PKG} ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} =
] || touch ${SSTATE_PKG}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${SSTATE_PKG} 2=
&gt;/dev/null || true<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; <br>
&gt; @@ -865,7 +865,7 @@ sstate_create_package () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm $TFILE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0touch ${SSTATE_PKG} 2&gt;/dev/null || true<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 python sstate_sign_package () {<br>
&gt; --<br>
&gt; 2.33.1<br>
<br>
Can this please be backported to Hardknott and Honister now that <br>
it has been accepted for master?<br>
<br>
//Peter<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div>

--000000000000ccb53405cf3dc98c--

