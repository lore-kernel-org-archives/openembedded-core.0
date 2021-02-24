Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web08.673.1614187161886989290
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 09:19:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R9ICVFSl;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: jatedev@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id o10so1881375pgg.4
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 09:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+ghxBrQICezs7yOGFYv4cCX13X9s73HJtYBg5Ow8eAE=;
        b=R9ICVFSl6mv5QZvLUcGsTDGQei8BLZ9h7++VuzkY4RC+M5Iid6G9L66tA4yDN9MGDH
         BBGB1iyflM7O+V+1fZpLcXEZyODk09paGquIjPXufr09WawAiSFNQz5qyiOvTdy9dsEr
         J5Gz467atwxB3wOOI33dD8UYHvNbq4i/rfHFStT2K6AU8uUf05DpVvckiIygs3H0xkCh
         74IY7/L5Xh0lGDtJtcLN4xWkriceiQZabzK8VDe99vMXKgsRLHYmYz+fk1ZuhCYYsdXJ
         dBpI+w3SaOOsV+uWAo/NSWre9x4nZkwOThCsxjBv63Qfx6PhsNagCV2XPs85vBE0sM27
         dX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+ghxBrQICezs7yOGFYv4cCX13X9s73HJtYBg5Ow8eAE=;
        b=nPiAhRDIvCcduZyMZNC3TB2asONKsf++nJYl2pjb8WBXy/Ptxqv8C40wbOrDewv8Wq
         /sfnBECVw4/hxblQaCXzyWtAXu3UJJr63FJSNHYAXj+FxY7yq0sx6+EsRBSNf3VmFdhq
         xcDp68GP3hAbFT4J+S3+aobU8xMRLbiAE6WijL+WQHdmFNs20CfLZJT0eHGN9QvoZdk5
         AJTlsAG8hxaE7biKIB8c5a921GK66rf/DNnb5Skjqi1b0BrkLntL/qXdH4CqvNEt8Iin
         VGUllEg3+RgcbgbOU7+hXPMAF6ZvKJARuLvj4Oah9SpGh43IDE6y/Qb4Btzi/N9F0/fD
         MBiw==
X-Gm-Message-State: AOAM533sF//Zk6WRT9QknxnBMxZ1k3GBmSKZMG9Yc7OWoFeK86/zeJ0+
	f60OGkOwhZ+npjeU+4W9mHTv30tJ1/UEOcRjiQc=
X-Google-Smtp-Source: ABdhPJyvP1YKbWoULECVjwabea9xsM3WdUW1r+g2jpchWHN8oU2ai+MNzQIWIxJ7eJuruOC1nGi25H0VvpGcfEq7D2c=
X-Received: by 2002:a05:6a00:ac8:b029:1ed:f8dc:cb3b with SMTP id
 c8-20020a056a000ac8b02901edf8dccb3bmr3484741pfl.60.1614187161259; Wed, 24 Feb
 2021 09:19:21 -0800 (PST)
MIME-Version: 1.0
References: <20210219175307.46218-1-jatedev@gmail.com> <20210219175307.46218-2-jatedev@gmail.com>
 <CANPvuRkEwbKHMDf7EzD9r8PwDR-akj8JJtc6D3-youOiYiU4Wg@mail.gmail.com>
 <CAPphmgayRkWXYqSmoCB-8LrTxfuSj+n+cVPX9F7HzpYe3QstCw@mail.gmail.com>
 <CANPvuRkSZxTOLM-gANOs_jrmkkMVZD83AJQMcJsWq5OCnhh1Lw@mail.gmail.com> <b06711bf332e943142cdda180915add2c78c6b69.camel@linuxfoundation.org>
In-Reply-To: <b06711bf332e943142cdda180915add2c78c6b69.camel@linuxfoundation.org>
From: "Jate Sujjavanich" <jatedev@gmail.com>
Date: Wed, 24 Feb 2021 12:19:10 -0500
Message-ID: <CAPphmgZSqnYxV8K-jYZGvDxREAu5X--rMX7BODra6opYzg6e3g@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iputils: Fix setcap/setuid of executables
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jose Quaresma <quaresma.jose@gmail.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000059128105bc183cb9"

--00000000000059128105bc183cb9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I tested removing the cross-compile detection patch and removing libcap
from PACKAGECONFIG. The build does find setcap on the build machine.

log.do_configure:
CONFIGURATION
Capatiblity (with libcap): false
...
Program /usr/sbin/setcap found: YES (/usr/sbin/setcap)

However, meson did pass perm_type =3D setuid to setcap-setuid.sh.

log.do_install
[1/2]
/workdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/reci
pe-sysroot-native/usr/bin/meson install --no-rebuild
setcap-setuid.sh: changing
'/workdir/poky/build/tmp/work/core2-64-poky-linux/ipu
tils/s20200821-r0/image//bin/ping' to be setuid root executable
ownership of
'/workdir/poky/build/tmp/work/core2-64-poky-linux/iputils/s20200821-r0/imag=
e//bin/ping'
retained as root

The conditional code in meson.build does fall back to setuid mode based on
the presence of libcap stored in cap_dep.found(). So I think you are right,
Jose.
if cap_dep.found() and setcap.found()
        perm_type =3D 'caps'
        setcap_path =3D setcap.path()
else
        perm_type =3D 'setuid'
        setcap_path =3D '/dev/null'
endif

And setcap-setuid.sh uses a simple chown and chmod. I *think* these are
universal in posix and that we don't have to worry about host contamination=
.
        setuid)
                _log "changing '$exec_path' to be setuid root executable"
                chown -v root "$exec_path"
                chmod -v u+s "$exec_path"

- Jate


On Mon, Feb 22, 2021 at 3:26 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Mon, 2021-02-22 at 17:39 +0000, Jose Quaresma wrote:
> > Hi,
> >
> > Jate Sujjavanich <jatedev@gmail.com> escreveu no dia segunda,
> 22/02/2021 =C3=A0(s) 15:58:
> > > If libcap is disabled in PACKAGECONFIG, then arguments two and three
> mean
> > > find_program find could setcap on the build machine. This would mean
> it is
> > >  not strictly determined by the recipe and it's determined by the
> > > configuration of the build machine instead.
> > >
> >
> > In this case the meson will not use the setcap from the build machine
> because
> > the libcap not found on the target sysroot. The libcap is a dependencie
> when
> > PACKAGECONFIG+=3D"libcap" and in this case the meson it will fallback t=
o
> use
> > setuid.
> >
> https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8d82bc4d2d=
2312d8a/meson.build#L221
>
> Whilst it may not use libcap, I seem to remember issues with the output
> still not being deterministic since there was something in the out which
> indicated the presence of setcap (or not).
>
> Cheers,
>
> Richard
>
>

--00000000000059128105bc183cb9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tested removing the cross-compile detection patch a=
nd removing libcap from PACKAGECONFIG. The build does find setcap on the bu=
ild machine.<br></div><div><br></div><div>log.do_configure:<br></div><div s=
tyle=3D"margin-left:40px"><span style=3D"font-family:monospace">CONFIGURATI=
ON</span></div><div style=3D"margin-left:40px"><span style=3D"font-family:m=
onospace">Capatiblity (with libcap): false</span></div><div style=3D"margin=
-left:40px"><span style=3D"font-family:monospace">...<br></span></div><div =
style=3D"margin-left:40px"><span style=3D"font-family:monospace">Program /u=
sr/sbin/setcap found: YES (/usr/sbin/setcap)</span></div><div><br></div><di=
v>However, meson did pass perm_type =3D setuid to setcap-setuid.sh.<br></di=
v><div><br></div><div>log.do_install</div><div style=3D"margin-left:40px"><=
span style=3D"font-family:monospace">[1/2] /workdir/poky/build/tmp/work/cor=
e2-64-poky-linux/iputils/s20200821-r0/reci<br>pe-sysroot-native/usr/bin/mes=
on install --no-rebuild<br>setcap-setuid.sh: changing &#39;/workdir/poky/bu=
ild/tmp/work/core2-64-poky-linux/ipu<br>tils/s20200821-r0/image//bin/ping&#=
39; to be setuid root executable<br>ownership of &#39;/workdir/poky/build/t=
mp/work/core2-64-poky-linux/iputils/s20200821-r0/image//bin/ping&#39; retai=
ned as root</span></div><span style=3D"font-family:monospace"></span><div><=
br></div><div>The conditional code in meson.build does fall back to setuid =
mode based on the presence of libcap stored in cap_dep.found(). So I think =
you are right, Jose.<br></div><div style=3D"margin-left:40px"><span style=
=3D"font-family:monospace">if cap_dep.found() and setcap.found()<br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 perm_type =3D &#39;caps&#39;<br>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 setcap_path =3D setcap.path()<br>else<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 perm_type =3D &#39;setuid&#39;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 setcap_path =
=3D &#39;/dev/null&#39;<br>endif</span></div><span style=3D"font-family:mon=
ospace"></span><div><br></div><div>And setcap-setuid.sh uses a simple chown=
 and chmod. I *think* these are universal in posix and that we don&#39;t ha=
ve to worry about host contamination.<br></div><div style=3D"margin-left:40=
px"><span style=3D"font-family:monospace">=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =
setuid)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _log &qu=
ot;changing &#39;$exec_path&#39; to be setuid root executable&quot;<br>=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 chown -v root &quot;$e=
xec_path&quot;<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 c=
hmod -v u+s &quot;$exec_path&quot;</span></div><span style=3D"font-family:m=
onospace"></span><div><br></div><div>- Jate <br></div><div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon=
, Feb 22, 2021 at 3:26 PM Richard Purdie &lt;<a href=3D"mailto:richard.purd=
ie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon, 2021-02-2=
2 at 17:39 +0000, Jose Quaresma wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com" target=3D"_b=
lank">jatedev@gmail.com</a>&gt; escreveu no dia segunda, 22/02/2021 =C3=A0(=
s) 15:58:<br>
&gt; &gt; If libcap is disabled in PACKAGECONFIG, then arguments two and th=
ree mean=C2=A0<br>
&gt; &gt; find_program find could setcap on the build machine. This would m=
ean it is<br>
&gt; &gt;=C2=A0 not strictly determined by the recipe and it&#39;s determin=
ed by the=C2=A0<br>
&gt; &gt; configuration of the build machine instead.<br>
&gt; &gt; <br>
&gt; <br>
&gt; In this case the meson will not use the setcap from the build machine =
because=C2=A0<br>
&gt; the libcap not found on the target sysroot. The libcap is a dependenci=
e when=C2=A0<br>
&gt; PACKAGECONFIG+=3D&quot;libcap&quot; and in this case the meson it will=
 fallback to use<br>
&gt; setuid.<br>
&gt; <a href=3D"https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bf=
eeed8d82bc4d2d2312d8a/meson.build#L221" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/iputils/iputils/blob/f0c64bbb2b1563647bfeeed8d82bc4d2d=
2312d8a/meson.build#L221</a><br>
<br>
Whilst it may not use libcap, I seem to remember issues with the output=C2=
=A0<br>
still not being deterministic since there was something in the out which=C2=
=A0<br>
indicated the presence of setcap (or not).<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div>

--00000000000059128105bc183cb9--
