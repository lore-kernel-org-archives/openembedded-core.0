Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC3B0C433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 11:13:16 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web09.6460.1634728395430459161
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 04:13:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f0ss74wM;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id t9so14346322lfd.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Oct 2021 04:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cdLCJ7pEW5HwBqgiFqEJjyomQ2BIWrtXdNz4rFjnp28=;
        b=f0ss74wMB2wAxoY48qQuSTIQWeryO3xT0g5d1fLuouS7Y39mTkgcG/D3d9VBeQQGbX
         1T3kS3FTNPu6Fl5qkOJ28mw+T/hSxZfd1dJvZNsdS6aCbitArb3TRhs01pu4hMzfCxsB
         veeQRuGVXPRJRUxD+gSkiL8qWg02I1CWpj2PQlRpWtqdYBOBgkRzIXpLailHqHjKYLIk
         NmC7m7dW6AQ9UqjUID5FRjMKbAqOiQxEhFP+4Ac9LyyIEqMnta0m4+aGb1PU1UkYCnR1
         B0p5fyiFLB0wmCkMzUF6lTqmc9EUvHOKkXg2wfNFu1aFC7gAFbRNk5gISrOL7yhIBafq
         qHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cdLCJ7pEW5HwBqgiFqEJjyomQ2BIWrtXdNz4rFjnp28=;
        b=przvPraIsMIT3tqRRKZbfnxbEJZQxV8blZWUJelzg3Sr74uAPfqtIeyQjhOMUftsTd
         MiB3dGVLYXn2TLDcmt6J7IQlQg4jfAK9BIyZi80G81st02K8EpUSiWITf1Ld1cpW7K9H
         injVhTN1povaKNE1IKM3x1Rg1mO2fCXtIGa+8Z+BZTQAD0qw+TUirm77TlcYBHxPqK+V
         aa9CY2B3rUVcZyALB02bdyrC91OQ5A4HbjXEqRGqI+BGjwHTRKPWnc/dSy6N5m70sBTf
         ECtEzkNvqJOuCNyDUwEwkMA/K1ogE2B6xdr8AVpErS8fJ6VKtzvaucB4shoHlnEbqKLK
         EdsQ==
X-Gm-Message-State: AOAM5317+HzjZa0dg5LzXQnl7/cGsl5KjhFZ+N9Wfw+x88XjMdrU3l9i
	5Pwr7CDCc4WBrNVQnwjaUDJziRKyorsh5jJ3lFg=
X-Google-Smtp-Source: 
 ABdhPJySdsWCs4lsuilTJgU6hgT2WK+TR7gpDemHv2iPamNuMICv1QK2p+O/gpJYiayguPYw1TbEFZTLr2E/iBRS2OQ=
X-Received: by 2002:a19:c7cb:: with SMTP id
 x194mr11083235lff.555.1634728393491;
 Wed, 20 Oct 2021 04:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211018184711.94970-1-quaresma.jose@gmail.com>
 <b41d22f66c4b41d4ba82fff0ccdfba11@axis.com>
In-Reply-To: <b41d22f66c4b41d4ba82fff0ccdfba11@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Wed, 20 Oct 2021 12:13:02 +0100
Message-ID: 
 <CANPvuRm=8c1KKsQ8vfo4ydO3vLNHKHVoVOpudU-j6MippBamCg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] sstate: fix touching files inside pseudo
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000032ca9005cec6dd6d"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Oct 2021 11:13:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157258

--00000000000032ca9005cec6dd6d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia ter=C3=A7a=
,
19/10/2021 =C3=A0(s) 20:37:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Jose Quaresma
> > Sent: den 18 oktober 2021 20:47
> > To: openembedded-core@lists.openembedded.org
> > Cc: Jose Quaresma <quaresma.jose@gmail.com>
> > Subject: [OE-core] [PATCH] sstate: fix touching files inside pseudo
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
> >  meta/classes/sstate.bbclass | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> > index 7f034d746a..d4555150c4 100644
> > --- a/meta/classes/sstate.bbclass
> > +++ b/meta/classes/sstate.bbclass
> > @@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] =3D "${WORKDIR}"
> >  sstate_create_package () {
> >       # Exit early if it already exists
> >       if [ -e ${SSTATE_PKG} ]; then
> > -             [ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> > +             touch ${SSTATE_PKG} || true
>
> You should pass stderr to /dev/null to avoid messages in the log
> if/when touch fails, i.e.:
>
>                 touch ${SSTATE_PKG} 2>/dev/null || :
>
>
I only see the logs when the task fails but I will add the redirection and
send a V2.
Thanks for the review.


> >               return
> >       fi
> >
> > @@ -865,7 +865,7 @@ sstate_create_package () {
> >       else
> >               rm $TFILE
> >       fi
> > -     [ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}
> > +     touch ${SSTATE_PKG} || true
> >  }
> >
> >  python sstate_sign_package () {
> > --
> > 2.33.1
>
> //Peter
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000032ca9005cec6dd6d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mailto:=
peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escreveu n=
o dia ter=C3=A7a, 19/10/2021 =C3=A0(s) 20:37:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedded=
-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core@=
lists.openembedded.org</a>&gt; On Behalf Of Jose Quaresma<br>
&gt; Sent: den 18 oktober 2021 20:47<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Cc: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com" targe=
t=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
&gt; Subject: [OE-core] [PATCH] sstate: fix touching files inside pseudo<br=
>
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
&gt;=C2=A0 meta/classes/sstate.bbclass | 4 ++--<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass=
<br>
&gt; index 7f034d746a..d4555150c4 100644<br>
&gt; --- a/meta/classes/sstate.bbclass<br>
&gt; +++ b/meta/classes/sstate.bbclass<br>
&gt; @@ -830,7 +830,7 @@ sstate_task_postfunc[dirs] =3D &quot;${WORKDIR}&qu=
ot;<br>
&gt;=C2=A0 sstate_create_package () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0# Exit early if it already exists<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -e ${SSTATE_PKG} ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} =
] || touch ${SSTATE_PKG}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0touch ${SSTATE_PKG} |=
| true<br>
<br>
You should pass stderr to /dev/null to avoid messages in the log <br>
if/when touch fails, i.e.:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 touch ${SSTATE_PKG}=
 2&gt;/dev/null || :<br>
<br></blockquote><div><br></div><div>I only see the logs when the task fail=
s but I will add the redirection and send a V2.</div><div>Thanks for the re=
view.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; <br>
&gt; @@ -865,7 +865,7 @@ sstate_create_package () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm $TFILE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; -=C2=A0 =C2=A0 =C2=A0[ ! -w ${SSTATE_PKG} ] || touch ${SSTATE_PKG}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0touch ${SSTATE_PKG} || true<br>
&gt;=C2=A0 }<br>
&gt; <br>
&gt;=C2=A0 python sstate_sign_package () {<br>
&gt; --<br>
&gt; 2.33.1<br>
<br>
//Peter<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000032ca9005cec6dd6d--

