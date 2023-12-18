Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12532C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 11:45:55 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
 by mx.groups.io with SMTP id smtpd.web11.42296.1702899946168393167
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 03:45:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=SM27p7IA;
 spf=pass (domain: snapchat.com, ip: 209.85.218.50, mailfrom: ecordonnier@snapchat.com)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a23648cf557so47271666b.3
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 03:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1702899944; x=1703504744; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WOMHwLx+kfJauKXnls0Wjhuuc8rP2INVr/JcOUDs0eU=;
        b=SM27p7IAQxygbHGj0BSZ+zc+QZF7x2jW1bL48K0LRMT2BObwjRAFVjj5Ggo/Lt1FG6
         CyKzDBachGvK/v3ksv6PvMQ7PyMKOLr6Pe8uoMlGO5xgrb9qC9FSMOPMKMNpgGBabd+I
         QyEsZga32J2NmqO4SLxLPe4B/dXYj+TVVufNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702899944; x=1703504744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WOMHwLx+kfJauKXnls0Wjhuuc8rP2INVr/JcOUDs0eU=;
        b=rLp2QBz/FyosIvakwXreEmO+6z6XGvqTsIZtwXfj+mFV2Jnus7cTLnluGZy3OFhVPf
         AAgy/+lfh1/VZC21FAVjUs2xhuzhtzr49reAz/KaOTVvq00knuPoLdJGKuofJff58WB0
         8hyKNj1yPpqxi+PjJxqYUYkOTLv6QAirODHIo9wRIwV2fhWWYiBrZXT3g3TAsib2RAAQ
         tuDpmFCMJKpLGjVqbk/MCfbh7p3u5NmqwTc/ZmSrvRTVLSxO7SL0AcXLS1YXo2cindyL
         vBRZ5OmsgJM/JvBlKC53KxBjP89UmCCRgc/wpYLInIozZdRsDcGrp/LlRkZ6OOvCq9kZ
         LmVQ==
X-Gm-Message-State: AOJu0YylWlYp4FE1nx/Uvv7e3YsMVhW5QUWs0P1zB9FzVliuS03YdDG+
	a0sjqZLxxFo20p/tEezVAV2joyfYrwdKm5OUDPvvzA==
X-Google-Smtp-Source: AGHT+IHt7epq1PcrYogmK90Ge5GPYo9qtQZI7Rz1zz7dPHkxvLkmTNwKL7ltCiw68/h/d978LNavXKzD0UK/u8mZPmU=
X-Received: by 2002:a17:906:8457:b0:a23:688b:f37a with SMTP id
 e23-20020a170906845700b00a23688bf37amr163646ejy.148.1702899944468; Mon, 18
 Dec 2023 03:45:44 -0800 (PST)
MIME-Version: 1.0
References: <20231216135306.188070-1-ecordonnier@snap.com> <34bee488217f82e9575f52dff15447474bf63d00.camel@linuxfoundation.org>
In-Reply-To: <34bee488217f82e9575f52dff15447474bf63d00.camel@linuxfoundation.org>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 18 Dec 2023 12:45:33 +0100
Message-ID: <CAHUKmYY_NE=OEkTQ6qXVxWTs7UuHRK=+2_8FGW4AtJgv77RA9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] kernel.bbclass: make do_symlink_kernelsrc reentrant
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000479431060cc74a57"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 11:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192635

--000000000000479431060cc74a57
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

My thinking was that in my local build I was updating from a build without
https://github.com/yoctoproject/poky/commit/3b8d0acca30c806fb69fc3096d41593=
cc76ed22c
to a build containing this commit, so the behavior of do_symlink_kernsrc
got modified, but my incremental build is not executing the new version of
the code since it detects that the symlink already exists and then the rest
of the function gets skipped, so I thought this justified a warning.

I'll lower the warning to info, but then this assumes that we will never
modify do_symlink_kernsrc in a way which is not backwards-compatible.

@Richard: the reason I didn't go for the copy to "orig" is that I don't see
a way to add this without breaking incremental builds (where s is a symlink
to kernsrc which is potentially modified already by do_patch etc.). However
I think it would be a cleaner solution than simply skipping the code like I
did:

-        if d.getVar("EXTERNALSRC"):
+        if d.getVar("EXTERNALSRC") and not os.path.islink(s):
             # With EXTERNALSRC S will not be wiped so we can symlink to it
             os.symlink(s, kernsrc)
         else:
             import shutil
+            s_copy =3D s + ".orig"
+            if not os.path.isdir(s_copy):
+                shutil.copytree(s, s_copy)
+            bb.utils.remove(s, recurse=3DTrue)
+            shutil.copytree(s_copy, s)

Etienne


On Sun, Dec 17, 2023 at 8:52=E2=80=AFPM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Sat, 2023-12-16 at 14:53 +0100, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > From: Etienne Cordonnier <ecordonnier@snap.com>
> >
> > The function do_symlink_kernsrc is not reentrant in the case where S is
> defined
> > to a non-default value. This causes build-failures e.g. when building
> linux-yocto, then updating
> > poky to a commit which modifies kernel.bbclass, and then building
> linux-yocto again.
> >
> > Bugzilla:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproj=
ect.org_show-5Fbug.cgi-3Fid-3D15325&d=3DDwIFaQ&c=3DncDTmphkJTvjIDPh0hpF_4vC=
HvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DqcR=
ut2Wm9dH26YP_YovPl6QVczLOYUxs1xfzA75ZJBiHj4dWwxbAS-2JjGPlyiyS&s=3D_WTBsDroH=
fmiIIyCOXRV2CAId9PmKZ4sN3bRO3EOcyU&e=3D
> >
> > Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
> > ---
> >  meta/classes-recipe/kernel.bbclass | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> > index 9ff37f5c38..130bedd901 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {
> >              os.symlink(s, kernsrc)
> >          else:
> >              import shutil
> > +            if os.path.islink(s):
> > +                # this happens for instance when a poky update forces
> symlink_kernsrc to run again
> > +                # after s was already moved to kernsrc
> > +                bb.warn("%s is already a symlink! Not symlinking kerne=
l
> sources" % s)
> > +                return 0
> >              shutil.move(s, kernsrc)
> >              os.symlink(kernsrc, s)
> >  }
>
> Usually what we recommend is that the first pass does something if "if
> not exists X.org; cp X X.orig; fi", then you can always copy from
> X.orig.
>
> As Bruce says, it definitely shouldn't be a warning, this can happen
> quite normally.
>
> Cheers,
>
> Richard
>

--000000000000479431060cc74a57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">My thinking was that in my local build I was updating from=
 a build without=C2=A0<a href=3D"https://github.com/yoctoproject/poky/commi=
t/3b8d0acca30c806fb69fc3096d41593cc76ed22c">https://github.com/yoctoproject=
/poky/commit/3b8d0acca30c806fb69fc3096d41593cc76ed22c</a> to a build contai=
ning this commit, so the behavior of do_symlink_kernsrc got modified, but m=
y incremental build is not executing the new version of the code since it d=
etects that the symlink already exists and then the rest of the function ge=
ts skipped, so I thought this justified a warning.<br><br>I&#39;ll lower th=
e warning to info, but then this assumes that we will never modify do_symli=
nk_kernsrc in a way which is not backwards-compatible.<br><br>@Richard: the=
 reason I didn&#39;t go for the copy to &quot;orig&quot; is that I don&#39;=
t see a way to add this without breaking incremental builds (where s is a s=
ymlink to kernsrc which is potentially modified already by do_patch etc.). =
However I think it would be a cleaner solution than simply skipping the cod=
e like I did:<br><br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;EXTERNA=
LSRC&quot;):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if d.getVar(&quot;EXTERNALSRC&=
quot;) and not os.path.islink(s):<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0# With EXTERNALSRC S will not be wiped so we can symlink to it<br=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.symlink(s, kernsrc)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0import shutil<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0s_copy =3D s + &quot;.orig&quot;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0if not os.path.isdir(s_copy):<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(s, s_copy)<br>+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(s, recurse=3DTrue)<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0shutil.copytree(s_copy, s)<br><br>Etienne<br=
><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Sun, Dec 17, 2023 at 8:52=E2=80=AFPM Richard Purdie &lt;<a href=3D"=
mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Sat, 2023-12-16 at 14:53 +0100, Etienne Cordonnier via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> wrote:<br>
&gt; From: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@snap.com" t=
arget=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; <br>
&gt; The function do_symlink_kernsrc is not reentrant in the case where S i=
s defined<br>
&gt; to a non-default value. This causes build-failures e.g. when building =
linux-yocto, then updating<br>
&gt; poky to a commit which modifies kernel.bbclass, and then building linu=
x-yocto again.<br>
&gt; <br>
&gt; Bugzilla: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttp=
s-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fid-3D15325&amp;d=3DDwIFaQ&=
amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfP=
x_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqcRut2Wm9dH26YP_YovPl6QVczLOYUxs1xfzA7=
5ZJBiHj4dWwxbAS-2JjGPlyiyS&amp;s=3D_WTBsDroHfmiIIyCOXRV2CAId9PmKZ4sN3bRO3EO=
cyU&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proof=
point.com/v2/url?u=3Dhttps-3A__bugzilla.yoctoproject.org_show-5Fbug.cgi-3Fi=
d-3D15325&amp;d=3DDwIFaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdi=
w&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DqcRut2Wm9dH26=
YP_YovPl6QVczLOYUxs1xfzA75ZJBiHj4dWwxbAS-2JjGPlyiyS&amp;s=3D_WTBsDroHfmiIIy=
COXRV2CAId9PmKZ4sN3bRO3EOcyU&amp;e=3D</a> <br>
&gt; <br>
&gt; Signed-off-by: Etienne Cordonnier &lt;<a href=3D"mailto:ecordonnier@sn=
ap.com" target=3D"_blank">ecordonnier@snap.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes-recipe/kernel.bbclass | 5 +++++<br>
&gt;=C2=A0 1 file changed, 5 insertions(+)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/=
kernel.bbclass<br>
&gt; index 9ff37f5c38..130bedd901 100644<br>
&gt; --- a/meta/classes-recipe/kernel.bbclass<br>
&gt; +++ b/meta/classes-recipe/kernel.bbclass<br>
&gt; @@ -194,6 +194,11 @@ python do_symlink_kernsrc () {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(s, kernsrc)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 import shutil<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if os.path.islink(s):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # this happen=
s for instance when a poky update forces symlink_kernsrc to run again<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # after s was=
 already moved to kernsrc<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot=
;%s is already a symlink! Not symlinking kernel sources&quot; % s)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shutil.move(s, kernsrc=
)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.symlink(kernsrc, s)=
<br>
&gt;=C2=A0 }<br>
<br>
Usually what we recommend is that the first pass does something if &quot;if=
<br>
not exists X.org; cp X X.orig; fi&quot;, then you can always copy from<br>
X.orig.<br>
<br>
As Bruce says, it definitely shouldn&#39;t be a warning, this can happen<br=
>
quite normally. <br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000479431060cc74a57--

