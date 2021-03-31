Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.878.1617216628737253617
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Mar 2021 11:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cIo4GxQ7;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ce10so31617506ejb.6
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Mar 2021 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FOKml5sfH2DCssYyk7b0tiC8EyHEC/Rd7hY7Pii/ZtM=;
        b=cIo4GxQ7DBJIzxMXtANQWigv2mkbTpyzspslb79I9frHZH8codWQ6OG66gQ5XjZhnE
         6jcZQyYXXgPn55AAUdnvLhpDPU+nWjBnKDhPhG3GBhXxf/l6lDOp+7sICQmlXHFg9AUV
         9tJp0lLRPEj93DH5AnlOR7oJm6/iwGOTSCy+9W/y81i9P8GE0nyjqLdtcDoVnD4ssWv5
         AwqMrKb8/bsz/l35QJHB9/xg+JEGYiffSqX2Kb+nVBXDH7OQ6BVvRS2/utunX4ADXpz/
         BJq9CMaiLYwach9mHWz0LEV2K1RT4Ca7Zo3bE9KDt1fZgcGaxM09YTFrSGkC+/6mtEAq
         nMlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FOKml5sfH2DCssYyk7b0tiC8EyHEC/Rd7hY7Pii/ZtM=;
        b=PeTFIXC6z00fPE+mNuRFA9reY3Grs6WnOUpcKAgiDaXybg4JmZ64JWxiLihqtSm2WS
         JkYzak9KUItKTw9DmzEcivAY/UwEQmbykAi/+0WiJ4blAZWd11QfQbhIrYg0dJe4aXrD
         +IUWVfeIA0jlcQCE8QsSMw4zeeLnRRrqkpeqzDdkUUr3LCLal/HtE62F2A4IsCgkJfmg
         w9C7vP61QCLnBmgxiZqofYyBRrslzsihTTWwIL6GWy11jGGTwmpqWf5g4q23znBnYF7O
         f7d/ycraUFOV15GoTxQjz9ZgKaYaphum4dpd7PQOP+jS1bLcp1fIC0S0QuSyVFiQS9j6
         7cIg==
X-Gm-Message-State: AOAM530LCkYoXivgyDGM6FCAJq7Ph4gf/dYrlJ+qVPHDlWuw3RKy+3yi
	5iFIRptAV5DLm7ffnsfKLXm5dD2olZ4c/UayTyA=
X-Google-Smtp-Source: ABdhPJzMvWfi6C7m4dEQOH/vNsYw5F4HbEEkulS/dfVxT63RIc4veEQ5g/jPMpP17u0gDGFIHIrAZ98BzUuBmA6vD8I=
X-Received: by 2002:a17:906:aada:: with SMTP id kt26mr4985969ejb.137.1617216627214;
 Wed, 31 Mar 2021 11:50:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210331122254.121192-1-alex.kanavin@gmail.com>
 <CA+chaQeR3hT_jAUUjM4uEMF+U2a60tR-6kKiL1v-58+1Euo++A@mail.gmail.com> <d4b500da-5aec-075e-4632-8a65852b1600@gmail.com>
In-Reply-To: <d4b500da-5aec-075e-4632-8a65852b1600@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 31 Mar 2021 20:50:16 +0200
Message-ID: <CA+chaQfYEmLSZa6iDSQcq_LhG+tF==+MQDdd60iZnLaLJ-vz9w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] mesa: update 21.0.0 -> 21.0.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000970aad05bed99658"

--000000000000970aad05bed99658
Content-Type: text/plain; charset="UTF-8"

FWIW: I don't use mesa-gl at all, I've noticed it only in git grep
DRIDRIVERS when looking why swrast was still enabled in our normal mesa
(and it was because of our own bbappend).

But I agree that it's sad that it's OK to break Ross's recipe, when auh
says there is an update available, but it's Ross's responsibility now to
fix the follow-up breakage from that upgrade.

Thanks for the patch Khem!

On Wed, Mar 31, 2021 at 7:13 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 3/31/21 6:05 AM, Martin Jansa wrote:
> > Are you going to fix meta-gl issue with swrast still in DRIDRIVERS
> > reported on previous upgrade?
> >
> > https://lists.openembedded.org/g/openembedded-core/message/149775
> > <https://lists.openembedded.org/g/openembedded-core/message/149775>
> >
> > https://lists.openembedded.org/g/openembedded-core/message/149779
> > <https://lists.openembedded.org/g/openembedded-core/message/149779>
> > I don't know what exactly AB builds, but it's easy to reproduce locally,
> > something like:
> > DISTRO_FEATURES_remove = "x11"
> > PREFERRED_PROVIDER_virtual/libgl = "mesa-gl"
> > PREFERRED_PROVIDER_virtual/mesa = "mesa-gl"
> > bitbake mesa-gl
> > should be enough to see build failure.
>
> it is a build regression. mesa and mesa-gl should be updated in sync and
> especially if you reported the fallout and if it went unaddressed is sad.
>
> Could you try a patch somethiing like this and see if it helps.
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> index e50782be1c..fc8b4f7504 100644
> --- a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> +++ b/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> @@ -12,4 +12,4 @@ PACKAGECONFIG ??= "opengl dri
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x1
>   PACKAGECONFIG_class-target = "opengl dri
> ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa', d)}"
>
>   # When NOT using X11, we need to make sure we have swrast available.
> -DRIDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '',
> ',swrast', d)}"
> +GALLIUMDRIVERS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> '', ',swrast', d)}"
>
> >
> > On Wed, Mar 31, 2021 at 2:44 PM Alexander Kanavin
> > <alex.kanavin@gmail.com <mailto:alex.kanavin@gmail.com>> wrote:
> >
> >     Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
> >     <mailto:alex.kanavin@gmail.com>>
> >     ---
> >       .../mesa/{mesa-gl_21.0.0.bb <http://mesa-gl_21.0.0.bb> =>
> >     mesa-gl_21.0.1.bb <http://mesa-gl_21.0.1.bb>}               | 0
> >       meta/recipes-graphics/mesa/mesa.inc                             |
> 2 +-
> >       meta/recipes-graphics/mesa/{mesa_21.0.0.bb <http://mesa_21.0.0.bb>
> >     => mesa_21.0.1.bb <http://mesa_21.0.1.bb>}   | 0
> >       3 files changed, 1 insertion(+), 1 deletion(-)
> >       rename meta/recipes-graphics/mesa/{mesa-gl_21.0.0.bb
> >     <http://mesa-gl_21.0.0.bb> => mesa-gl_21.0.1.bb
> >     <http://mesa-gl_21.0.1.bb>} (100%)
> >       rename meta/recipes-graphics/mesa/{mesa_21.0.0.bb
> >     <http://mesa_21.0.0.bb> => mesa_21.0.1.bb <http://mesa_21.0.1.bb>}
> >     (100%)
> >
> >     diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> >     <http://mesa-gl_21.0.0.bb>
> >     b/meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
> >     <http://mesa-gl_21.0.1.bb>
> >     similarity index 100%
> >     rename from meta/recipes-graphics/mesa/mesa-gl_21.0.0.bb
> >     <http://mesa-gl_21.0.0.bb>
> >     rename to meta/recipes-graphics/mesa/mesa-gl_21.0.1.bb
> >     <http://mesa-gl_21.0.1.bb>
> >     diff --git a/meta/recipes-graphics/mesa/mesa.inc
> >     b/meta/recipes-graphics/mesa/mesa.inc
> >     index e9b72ce063..a40dad2b81 100644
> >     --- a/meta/recipes-graphics/mesa/mesa.inc
> >     +++ b/meta/recipes-graphics/mesa/mesa.inc
> >     @@ -21,7 +21,7 @@ SRC_URI =
> >     "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz
> >     <https://mesa.freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz> \
> >
> >     file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
> >                  "
> >
> >     -SRC_URI[sha256sum] =
> >     "e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c808ca0dd26ba522e0d84"
> >     +SRC_URI[sha256sum] =
> >     "379fc984459394f2ab2d84049efdc3a659869dc1328ce72ef0598506611712bb"
> >
> >       UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> >     diff --git a/meta/recipes-graphics/mesa/mesa_21.0.0.bb
> >     <http://mesa_21.0.0.bb> b/meta/recipes-graphics/mesa/mesa_21.0.1.bb
> >     <http://mesa_21.0.1.bb>
> >     similarity index 100%
> >     rename from meta/recipes-graphics/mesa/mesa_21.0.0.bb
> >     <http://mesa_21.0.0.bb>
> >     rename to meta/recipes-graphics/mesa/mesa_21.0.1.bb
> >     <http://mesa_21.0.1.bb>
> >     --
> >     2.29.2
> >
> >
> >
> >
> >
> >
> > 
> >
>

--000000000000970aad05bed99658
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">FWIW: I don&#39;t use mesa-gl at all, I&#39;ve noticed it =
only in git grep DRIDRIVERS when looking why swrast was still enabled in ou=
r normal mesa (and it was because of our own bbappend).<div><br></div><div>=
But I agree that it&#39;s sad that it&#39;s OK to break Ross&#39;s recipe, =
when auh says there is an update available, but it&#39;s Ross&#39;s respons=
ibility now to fix the follow-up breakage from that upgrade.</div><div><br>=
</div><div>Thanks for the patch Khem!</div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 31, 2021 at 7:13 PM =
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 3/31/21 6:05 AM, Martin Jansa wrote:<br>
&gt; Are you going to fix meta-gl issue with swrast still in DRIDRIVERS <b=
r>
&gt; reported on previous upgrade?<br>
&gt; <br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/149775" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/message/149775</a> <br>
&gt; &lt;<a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/149775" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/149775</a>&gt;<br>
&gt; <br>
&gt; <a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/149779" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.or=
g/g/openembedded-core/message/149779</a> <br>
&gt; &lt;<a href=3D"https://lists.openembedded.org/g/openembedded-core/mes=
sage/149779" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-core/message/149779</a>&gt;<br>
&gt; I don&#39;t know what exactly AB builds, but it&#39;s easy to reprodu=
ce locally, <br>
&gt; something like:<br>
&gt; DISTRO_FEATURES_remove =3D &quot;x11&quot;<br>
&gt; PREFERRED_PROVIDER_virtual/libgl =3D &quot;mesa-gl&quot;<br>
&gt; PREFERRED_PROVIDER_virtual/mesa =3D &quot;mesa-gl&quot;<br>
&gt; bitbake mesa-gl<br>
&gt; should be enough to see build failure.<br>
<br>
it is a build regression. mesa and mesa-gl should be updated in sync and <=
br>
especially if you reported the fallout and if it went unaddressed is sad.<=
br>
<br>
Could you try a patch somethiing like this and see if it helps.<br>
<br>
diff --git a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.b=
b" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> <br>
b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
index e50782be1c..fc8b4f7504 100644<br>
--- a/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
+++ b/meta/recipes-graphics/mesa/<a href=3D"http://mesa-gl_21.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a><br>
@@ -12,4 +12,4 @@ PACKAGECONFIG ??=3D &quot;opengl dri <br>
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x1<br>
=C2=A0 PACKAGECONFIG_class-target =3D &quot;opengl dri <br>
${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;x11&#3=
9;, &#39;osmesa&#39;, d)}&quot;<br>
<br>
=C2=A0 # When NOT using X11, we need to make sure we have swrast available=
.<br>
-DRIDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39=
;, &#39;x11&#39;, &#39;&#39;, <br>
&#39;,swrast&#39;, d)}&quot;<br>
+GALLIUMDRIVERS_append =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES=
&#39;, &#39;x11&#39;, <br>
&#39;&#39;, &#39;,swrast&#39;, d)}&quot;<br>
<br>
&gt; <br>
&gt; On Wed, Mar 31, 2021 at 2:44 PM Alexander Kanavin <br>
&gt; &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.=
kanavin@gmail.com</a> &lt;mailto:<a href=3D"mailto:alex.kanavin@gmail.com" =
target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Signed-off-by: Alexander Kanavin &lt;<a href=3D"ma=
ilto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a><b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:alex.kanavin@gmail.co=
m" target=3D"_blank">alex.kanavin@gmail.com</a>&gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0---<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.../mesa/{<a href=3D"http://mesa-gl_21.0.0.=
bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.0.bb</a> &lt;<a href=
=3D"http://mesa-gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">http://=
mesa-gl_21.0.0.bb</a>&gt; =3D&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"http://mesa-gl_21.0.1.bb" rel=3D"norefe=
rrer" target=3D"_blank">mesa-gl_21.0.1.bb</a> &lt;<a href=3D"http://mesa-gl=
_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">http://mesa-gl_21.0.1.bb</=
a>&gt;}=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-graphics/mesa/mesa.inc=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0meta/recipes-graphics/mesa/{<a href=3D"http=
://mesa_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb</a> =
&lt;<a href=3D"http://mesa_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">=
http://mesa_21.0.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0=3D&gt; <a href=3D"http://mesa_21.0.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">mesa_21.0.1.bb</a> &lt;<a href=3D"http://mesa_=
21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">http://mesa_21.0.1.bb</a>&g=
t;}=C2=A0 =C2=A0| 0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A03 files changed, 1 insertion(+), 1 deletion=
(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename meta/recipes-graphics/mesa/{<a href=
=3D"http://mesa-gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl=
_21.0.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://mesa-gl_21.0.0.bb</a>&gt; =3D&gt; <a hre=
f=3D"http://mesa-gl_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl=
_21.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa-gl_21.0.1.bb" rel=3D"no=
referrer" target=3D"_blank">http://mesa-gl_21.0.1.bb</a>&gt;} (100%)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0rename meta/recipes-graphics/mesa/{<a href=
=3D"http://mesa_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.=
0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa_21.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">http://mesa_21.0.0.bb</a>&gt; =3D&gt; <a href=3D"h=
ttp://mesa_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</=
a> &lt;<a href=3D"http://mesa_21.0.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">http://mesa_21.0.1.bb</a>&gt;}<br>
&gt;=C2=A0 =C2=A0 =C2=A0(100%)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-graphics/mesa/<a href=3D=
"http://mesa-gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.=
0.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://mesa-gl_21.0.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-graphics/mesa/<a href=3D"http://mes=
a-gl_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.1.bb</a><=
br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa-gl_21.0.1.bb" rel=3D"no=
referrer" target=3D"_blank">http://mesa-gl_21.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0similarity index 100%<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename from meta/recipes-graphics/mesa/<a href=3D"=
http://mesa-gl_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0=
.0.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa-gl_21.0.0.bb" rel=3D"no=
referrer" target=3D"_blank">http://mesa-gl_21.0.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename to meta/recipes-graphics/mesa/<a href=3D"ht=
tp://mesa-gl_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa-gl_21.0.1=
.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa-gl_21.0.1.bb" rel=3D"no=
referrer" target=3D"_blank">http://mesa-gl_21.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-graphics/mesa/mesa.inc<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0index e9b72ce063..a40dad2b81 100644<br>
&gt;=C2=A0 =C2=A0 =C2=A0--- a/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++ b/meta/recipes-graphics/mesa/mesa.inc<br>
&gt;=C2=A0 =C2=A0 =C2=A0@@ -21,7 +21,7 @@ SRC_URI =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;<a href=3D"https://mesa.freedesktop.org/arch=
ive/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://mes=
a.freedesktop.org/archive/mesa-${PV}.tar.xz</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://mesa.freedesktop.org/archiv=
e/mesa-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://mesa.=
freedesktop.org/archive/mesa-$%7BPV%7D.tar.xz</a>&gt; \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0file://0001-futex.h-Define-__NR_futex-if-it-does-n=
ot-exist.patch \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0-SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;e6204e98e6a8d77cf9dc5d34f99dd8e3ef7144f3601c=
808ca0dd26ba522e0d84&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0+SRC_URI[sha256sum] =3D<br>
&gt;=C2=A0 =C2=A0 =C2=A0&quot;379fc984459394f2ab2d84049efdc3a659869dc1328c=
e72ef0598506611712bb&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D &quot;mesa-(=
?P&lt;pver&gt;\d+(\.\d+)+)&quot;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0diff --git a/meta/recipes-graphics/mesa/<a href=3D=
"http://mesa_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb=
</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa_21.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">http://mesa_21.0.0.bb</a>&gt; b/meta/recipes-graph=
ics/mesa/<a href=3D"http://mesa_21.0.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">mesa_21.0.1.bb</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa_21.0.1.bb" rel=3D"noref=
errer" target=3D"_blank">http://mesa_21.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0similarity index 100%<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename from meta/recipes-graphics/mesa/<a href=3D"=
http://mesa_21.0.0.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.0.bb<=
/a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa_21.0.0.bb" rel=3D"noref=
errer" target=3D"_blank">http://mesa_21.0.0.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0rename to meta/recipes-graphics/mesa/<a href=3D"ht=
tp://mesa_21.0.1.bb" rel=3D"noreferrer" target=3D"_blank">mesa_21.0.1.bb</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"http://mesa_21.0.1.bb" rel=3D"noref=
errer" target=3D"_blank">http://mesa_21.0.1.bb</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A02.29.2<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
</blockquote></div>

--000000000000970aad05bed99658--
