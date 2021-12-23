Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A2CC433F5
	for <webhook@archiver.kernel.org>; Thu, 23 Dec 2021 15:12:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web11.33924.1640272325904745584
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 07:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pODVZyx4;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id bq20so13060668lfb.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Dec 2021 07:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jiMSTjTzIxpo9Q/GmLaZ5MXIf6GpP49hlSiHNBDXk1U=;
        b=pODVZyx4gdLwkjXyDk5Tep2JQKUiSVdM3MATOCs6CDTyXFCW4n0meTURK8tyb7lqpi
         XfIdzxdi5t6Ql1BX0RF5wDWWvWBRakDaWS+PawHCeGSwb7HYm5ohR9HolEf35z9xNn5Y
         KljWNFpj0FPA2ZCbMXT2KFb1iFrgNyxYhT6YGOhhhfpWmkCUOo6AOjTsrDr49fzyuchW
         pGmK3TTwyQ/Tk4Tx1IuvjvI2vduyRZpb0emf4hOh7/URva+1FdpLkk64J9aB2BIdnx85
         cQrG3s7Vi6ajTMR1HtD0gBLrv/TrtJeVxGIIPgKPJe0KqKSF+aYzYgT6QhL11RlfKa53
         Y6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jiMSTjTzIxpo9Q/GmLaZ5MXIf6GpP49hlSiHNBDXk1U=;
        b=HaStUUQu+KBaZDqD3aDS9QVF1KeJn+Flfxip56E4plVx94/r0lyhJTwSVxywM1DuHp
         xcVGxxOwMoK9q05AT2x90opQCiWEJLibCpoo63TIRwFngdp444Cpe2ZkvFsQpUgV3cIa
         KQAXjeibxzBHcUjVY4uAjSKExQ3ffVIe7GDqCvcx4WmqtPoVR1KUXPl6xdFIznOUHEE0
         zssfuaMVA9eIzE60KbrPhQoBYH0QiBXJs3hFkzPL/9D8BrsH7WpBPcLKuHb+7VCIoN/e
         MYh6dk62mS9THw+HAG57oUCXEHm6pH4BHoO9GrlVKtoWUtXyhShSl6I2fCNqOIY4dnUY
         rCTw==
X-Gm-Message-State: AOAM532+CL9u8yESClln8R79yX313UOPQGIiBmt2whljJpKiHiC517l2
	42fo17+IRg6mu3m4qfpNFC8QRwkhRdUPd0gnEB4=
X-Google-Smtp-Source: 
 ABdhPJxs9SPb9Y4zCeFDBo9f3dhlrL1+EwKqscXUZe4TGghZBNhOXDdWlA7uU1lhJ7hgd5mzPoYQtZI7l7Z4PtPxhoQ=
X-Received: by 2002:ac2:5bc1:: with SMTP id u1mr2098253lfn.106.1640272324262;
 Thu, 23 Dec 2021 07:12:04 -0800 (PST)
MIME-Version: 1.0
References: <20211222232035.1036830-1-richard.purdie@linuxfoundation.org>
 <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
In-Reply-To: <baa4d9a18f054cc9a9064f9ca415d829@axis.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 23 Dec 2021 15:11:53 +0000
Message-ID: 
 <CANPvuRnjiBnhPrkjrYaJDFuTvHJiMn7qYpe8Cxrs4EB3Et=7zA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] base/patch: Disable network for
 unpack/patch/configure/compile/install
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000038fe9d05d3d1a9c9"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Dec 2021 15:12:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159988

--00000000000038fe9d05d3d1a9c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Peter Kjellerstedt <peter.kjellerstedt@axis.com> escreveu no dia quinta,
23/12/2021 =C3=A0(s) 10:49:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <
> openembedded-core@lists.openembedded.org> On Behalf Of Richard Purdie
> > Sent: den 23 december 2021 00:21
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [PATCH] base/patch: Disable network for
> unpack/patch/configure/compile/install
> >
> > Use the newly added nonetwork task flag to disable network access where
> > possible in unpack/patch/configure/compile/install tasks.
> >
> > We can't disable networking in sstate tasks due to sstate downloads and
> > also so we can report hash equivalence to the server.
>
> Since no tasks except fetch (and apparently the sstate tasks) are expecte=
d
> to use the network, wouldn't it make more sense to reverse this flag?
> I.e.,
> add do_fetch[network] =3D "1" instead. That way you don't get away with
> adding some random task and using the network from it unless you
> explicitly
> state that you will.
>

It is more safe and easy to check what are the tasks that need network
access.

Jose


>
> >
> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > ---
> >  meta/classes/base.bbclass  | 4 ++++
> >  meta/classes/patch.bbclass | 1 +
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
> > index b709777f243..e4c6c983b59 100644
> > --- a/meta/classes/base.bbclass
> > +++ b/meta/classes/base.bbclass
> > @@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {
> >      oe.reproducible.epochfile_write(source_date_epoch,
> d.getVar('SDE_FILE'), d)
> >  }
> >  do_unpack[postfuncs] +=3D "create_source_date_epoch_stamp"
> > +do_unpack[nonetwork] =3D "1"
> >
> >  def get_source_date_epoch_value(d):
> >      return oe.reproducible.epochfile_read(d.getVar('SDE_FILE'), d)
> > @@ -358,6 +359,7 @@ base_do_configure() {
> >               echo ${BB_TASKHASH} > ${CONFIGURESTAMPFILE}
> >       fi
> >  }
> > +do_configure[nonetwork] =3D "1"
> >
> >  addtask compile after do_configure
> >  do_compile[dirs] =3D "${B}"
> > @@ -368,11 +370,13 @@ base_do_compile() {
> >               bbnote "nothing to compile"
> >       fi
> >  }
> > +do_compile[nonetwork] =3D "1"
> >
> >  addtask install after do_compile
> >  do_install[dirs] =3D "${B}"
> >  # Remove and re-create ${D} so that is it guaranteed to be empty
> >  do_install[cleandirs] =3D "${D}"
> > +do_install[nonetwork] =3D "1"
> >
> >  base_do_install() {
> >       :
> > diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
> > index 8de70254919..57aaf7c31d1 100644
> > --- a/meta/classes/patch.bbclass
> > +++ b/meta/classes/patch.bbclass
> > @@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] =3D "PATCHRESOLVE"
> >
> >  addtask patch after do_unpack
> >  do_patch[dirs] =3D "${WORKDIR}"
> > +do_patch[nonetwork] =3D "1"
> >  do_patch[depends] =3D "${PATCHDEPENDENCY}"
> >
> >  EXPORT_FUNCTIONS do_patch
> > --
> > 2.32.0
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159975):
> https://lists.openembedded.org/g/openembedded-core/message/159975
> Mute This Topic: https://lists.openembedded.org/mt/87909311/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000038fe9d05d3d1a9c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Peter Kjellerstedt &lt;<a href=3D"mai=
lto:peter.kjellerstedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; escrev=
eu no dia quinta, 23/12/2021 =C3=A0(s) 10:49:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;<a href=3D"m=
ailto:openembedded-core@lists.openembedded.org" target=3D"_blank">openembed=
ded-core@lists.openembedded.org</a>&gt; On Behalf Of Richard Purdie<br>
&gt; Sent: den 23 december 2021 00:21<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [PATCH] base/patch: Disable network for unpack/patc=
h/configure/compile/install<br>
&gt; <br>
&gt; Use the newly added nonetwork task flag to disable network access wher=
e<br>
&gt; possible in unpack/patch/configure/compile/install tasks.<br>
&gt; <br>
&gt; We can&#39;t disable networking in sstate tasks due to sstate download=
s and<br>
&gt; also so we can report hash equivalence to the server.<br>
<br>
Since no tasks except fetch (and apparently the sstate tasks) are expected =
<br>
to use the network, wouldn&#39;t it make more sense to reverse this flag? I=
.e., <br>
add do_fetch[network] =3D &quot;1&quot; instead. That way you don&#39;t get=
 away with <br>
adding some random task and using the network from it unless you explicitly=
 <br>
state that you will.<br></blockquote><div><br></div><div>It is more safe an=
d easy to check what are the tasks that need network access.</div><div><br>=
</div><div>Jose</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt; <br>
&gt; Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@lin=
uxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundation.org</a>&=
gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/base.bbclass=C2=A0 | 4 ++++<br>
&gt;=C2=A0 meta/classes/patch.bbclass | 1 +<br>
&gt;=C2=A0 2 files changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass<br>
&gt; index b709777f243..e4c6c983b59 100644<br>
&gt; --- a/meta/classes/base.bbclass<br>
&gt; +++ b/meta/classes/base.bbclass<br>
&gt; @@ -214,6 +214,7 @@ python create_source_date_epoch_stamp() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe.reproducible.epochfile_write(source_date_epoch,=
 d.getVar(&#39;SDE_FILE&#39;), d)<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 do_unpack[postfuncs] +=3D &quot;create_source_date_epoch_stamp&q=
uot;<br>
&gt; +do_unpack[nonetwork] =3D &quot;1&quot;<br>
&gt; <br>
&gt;=C2=A0 def get_source_date_epoch_value(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return oe.reproducible.epochfile_read(d.getVar(&#3=
9;SDE_FILE&#39;), d)<br>
&gt; @@ -358,6 +359,7 @@ base_do_configure() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo ${BB_TASKHA=
SH} &gt; ${CONFIGURESTAMPFILE}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt; +do_configure[nonetwork] =3D &quot;1&quot;<br>
&gt; <br>
&gt;=C2=A0 addtask compile after do_configure<br>
&gt;=C2=A0 do_compile[dirs] =3D &quot;${B}&quot;<br>
&gt; @@ -368,11 +370,13 @@ base_do_compile() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;not=
hing to compile&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 }<br>
&gt; +do_compile[nonetwork] =3D &quot;1&quot;<br>
&gt; <br>
&gt;=C2=A0 addtask install after do_compile<br>
&gt;=C2=A0 do_install[dirs] =3D &quot;${B}&quot;<br>
&gt;=C2=A0 # Remove and re-create ${D} so that is it guaranteed to be empty=
<br>
&gt;=C2=A0 do_install[cleandirs] =3D &quot;${D}&quot;<br>
&gt; +do_install[nonetwork] =3D &quot;1&quot;<br>
&gt; <br>
&gt;=C2=A0 base_do_install() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0:<br>
&gt; diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass<b=
r>
&gt; index 8de70254919..57aaf7c31d1 100644<br>
&gt; --- a/meta/classes/patch.bbclass<br>
&gt; +++ b/meta/classes/patch.bbclass<br>
&gt; @@ -164,6 +164,7 @@ patch_do_patch[vardepsexclude] =3D &quot;PATCHRESO=
LVE&quot;<br>
&gt; <br>
&gt;=C2=A0 addtask patch after do_unpack<br>
&gt;=C2=A0 do_patch[dirs] =3D &quot;${WORKDIR}&quot;<br>
&gt; +do_patch[nonetwork] =3D &quot;1&quot;<br>
&gt;=C2=A0 do_patch[depends] =3D &quot;${PATCHDEPENDENCY}&quot;<br>
&gt; <br>
&gt;=C2=A0 EXPORT_FUNCTIONS do_patch<br>
&gt; --<br>
&gt; 2.32.0<br>
<br>
//Peter<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159975): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159975" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159975</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87909311/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87909311/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000038fe9d05d3d1a9c9--

