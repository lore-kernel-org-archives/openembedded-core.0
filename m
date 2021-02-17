Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web11.10182.1613579661513201767
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 08:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GItoNb0l;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: idadelm@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id jt13so23350804ejb.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 08:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ps4vhOo54t/7JGafOeXH4OfyyU4s6V5uI3IsmombajU=;
        b=GItoNb0l0f3TpB3/ys5Ew3MaWh13ziZhzsWqoKXyPAbW+ZdzpAhd0tMwrzjeH+27/b
         9m8aom6S8yk6WujnryRr7swN/Rb2Lo0x0OlV6fyQwrj+Tks+UiZDs0FbZ844H4yVhBg0
         rWAYG1GsuOd5rr0M7o6KDgZfFf9GeWLYJj8rS2+Hy8XkMZhf/9uU2PfaxQlVwf22n8Kp
         WbPg7A/rudE2Lz3Ee45dMHwNRzVPEl62OxFZaTSQs4zQr4cUL2tbyTcGj6j6jiW6HclH
         xR2soZ1sk/mx/M4jmlktoFxt9r6lMI3Lp89/tp2tDAJFE27Y1kxLV7W8vtlgCMgQkCjj
         9UpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ps4vhOo54t/7JGafOeXH4OfyyU4s6V5uI3IsmombajU=;
        b=IOJktvmFJhHuXgBg9BjH4gH4kvFSnZBfdfDwbjg6h0ru9rIagB0sU7z8P91E6Ua7Sa
         xwAYBJNlGWtBd48bnMWSAI8p6YgITD79mDjIwda2EodaK0owgbMpUfho0IkJloIuJLzv
         T6EjS1cZIeKQMeuycrzpkwbrKBS5kLSrrz6L02aGUDeAdEtOoLv29aIapPyijbDUsP6w
         9fmgXfJvScK/uFPql0ZarMIgGdrC8a1IGb+4ws7M0+WR1lbqQKxF5Y9IB4dF62a5rXak
         y+N4QRPwQ6UIrxsWJsApa6hZ0+T3mgJgaeKgogQ/x/PM0uLrNcdBnDKxpMRJgUq96jhr
         eyqQ==
X-Gm-Message-State: AOAM530XUvTDZMzbHccWGvFp4g+Z21ToVWyhLcIxLXI7gjFsf9LT2/+m
	dnM6rAyynCZgMjXWmdIVTux+Px32yKn2acrWn7U=
X-Google-Smtp-Source: ABdhPJwmSYzOnqb8W1Ck4lW7GfvAZsByJlNCETMl7YM0Kv4RiqTRiy/hR7oIX73RyqZ3o0T+Ryyaa5DIyAdSnvQCy8U=
X-Received: by 2002:a17:907:1b06:: with SMTP id mp6mr26514323ejc.408.1613579659888;
 Wed, 17 Feb 2021 08:34:19 -0800 (PST)
MIME-Version: 1.0
References: <20201015204539.24549-1-idadelm@gmail.com> <1312e9f5502bee8d7667c598ae4fc5b7de61830f.camel@linuxfoundation.org>
In-Reply-To: <1312e9f5502bee8d7667c598ae4fc5b7de61830f.camel@linuxfoundation.org>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Wed, 17 Feb 2021 17:34:07 +0100
Message-ID: <CAN7sTgv1q_Am=HT_h4-3Uh7CDgtVx-6Se8i1BDPx6VoPQVJigg@mail.gmail.com>
Subject: Re: [poky][PATCH v6] Update license file to match current SPDX names
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000071cb7705bb8aca1c"

--00000000000071cb7705bb8aca1c
Content-Type: text/plain; charset="UTF-8"

Okay. Thanks you.

Cheers,
Ida.

On Wed, 17 Feb 2021, 12:17 pm Richard Purdie, <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2020-10-15 at 21:45 +0100, Meh Mbeh Ida Delphine wrote:
> > Updated mappings of license fields of meta/conf/licenses.conf to match
> latest SPDX naming.
> > Added missing mappings.
> > Renamed license files that were added in license mappings eg from
> GPL-2.0 to GPL-2.0-only.
> > Added "or later" versions of license mappings
> > Added "or later" versions of common license files eg GPL-2.0-or-later
> >
> > Fixes: [YOCTO #13320]
> >
> > Signed-off-by: Meh Mbeh Ida Delphine <idadelm@gmail.com>
>
> I really want to get this issue resolved so I've queued this patch.
> There is a comment below.
>
> > Changes in V6:
> >  * Added "or later" versions of common license files eg GPL-2.0-or-later
> in meta/files/common-licenses.
> >
> > Changes in V5:
> >  * Added "or later" versions of license mappings in
> meta/conf/licenses.conf
> >
> > Changes in V4:
> >  * Renamed license files that were added in license mappings eg from
> GPL-2.0 to GPL-2.0-only
> >
> > Changes in V3:
> >  * Added missing mappings to meta/conf/licenses.conf
> >
> > Changes in V2:
> >  * Corrected the email subject line.
> [...]
> >   #MPL variations
> >  SPDXLICENSEMAP[MPL-1] = "MPL-1.0"
> >  SPDXLICENSEMAP[MPLv1] = "MPL-1.0"
> > +SPDXLICENSEMAP[MPL-1.0] = "MPL-1.0"
> >  SPDXLICENSEMAP[MPLv1.1] = "MPL-1.1"
> > +SPDXLICENSEMAP[MPL-1.1] = "MPL-1.1"
> >  SPDXLICENSEMAP[MPLv2] = "MPL-2.0"
> > +SPDXLICENSEMAP[MPL-2.0] = "MPL-2.0"
> > +
> >   #MIT variations
> >  SPDXLICENSEMAP[MIT-X] = "MIT"
> > @@ -48,33 +66,43 @@ SPDXLICENSEMAP[openssl] = "OpenSSL"
> >  #PSF variations
> >  SPDXLICENSEMAP[PSF] = "PSF-2.0"
> >  SPDXLICENSEMAP[PSFv2] = "PSF-2.0"
> > +SPDXLICENSEMAP[PSF-2.0] = "PSF-2.0"
> >
> >  #Python variations
> >
> >  SPDXLICENSEMAP[Python-2] = "Python-2.0"
> > +SPDXLICENSEMAP[Python-2.0] = "Python-2.0"
> >
> >  #Apache variations
> >  SPDXLICENSEMAP[Apachev2] = "Apache-2.0"
> >  SPDXLICENSEMAP[Apache-2] = "Apache-2.0"
> > +SPDXLICENSEMAP[Apache-2.0] = "Apache-2.0"
> >
> >  #Artistic variations
> >  SPDXLICENSEMAP[Artisticv1] = "Artistic-1.0"
> >  SPDXLICENSEMAP[Artistic-1] = "Artistic-1.0"
> > +SPDXLICENSEMAP[Artistic-1.0] = "Artistic-1.0"
> >   #Academic variations
> >
> >  SPDXLICENSEMAP[AFL-2] = "AFL-2.0"
> > +SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
> >  SPDXLICENSEMAP[AFL-1] = "AFL-1.2"
> > +SPDXLICENSEMAP[AFL-1.2] = "AFL-1.2"
> >  SPDXLICENSEMAP[AFLv2] = "AFL-2.0"
> > +SPDXLICENSEMAP[AFL-2.0] = "AFL-2.0"
> >  SPDXLICENSEMAP[AFLv1] = "AFL-1.2"
> >
> >  #CDDL variations
> >  SPDXLICENSEMAP[CDDLv1] = "CDDL-1.0"
> >  SPDXLICENSEMAP[CDDL-1] = "CDDL-1.0"
> > +SPDXLICENSEMAP[CDDL-1.0] = "CDDL-1.0"
> >   #Other variations
> >  SPDXLICENSEMAP[EPLv1.0] = "EPL-1.0"
> > +SPDXLICENSEMAP[EPL-1.0] = "EPL-1.0"
> >
> >
>
> >  #Silicon Graphics variations
> >  SPDXLICENSEMAP[SGIv1] = "SGI-1"
> > +SPDXLICENSEMAP[SGI-1] = "SGI-1"
> >
>
> I removed the above pieces where the piece in [] is the same as the
> value at the end. We don't need mappings where the two pieces are
> identical. Everything else in the patch looked ok.
>
> I also realised that we have recipes which reference some of the names
> which have been renamed in LIC_FILES_CHKSUM entries. The following
> files look to be affected:
>
> meta/recipes-connectivity/connman/connman-conf.bb
> meta/recipes-core/busybox/busybox-inittab_1.32.0.bb
> meta/recipes-core/systemd/systemd-serialgetty.bb
> meta/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bb
> meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
>
> I've queued a patch to fix these.
>
> Cheers,
>
> Richard
>
>
>

--00000000000071cb7705bb8aca1c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Okay. Thanks you.<div dir=3D"auto"><br></div><div dir=3D"=
auto">Cheers,</div><div dir=3D"auto">Ida.</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Feb 2021, 12:17 p=
m Richard Purdie, &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
>richard.purdie@linuxfoundation.org</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">On Thu, 2020-10-15 at 21:45 +0100, Meh Mbeh Ida Delphine wr=
ote:<br>
&gt; Updated mappings of license fields of meta/conf/licenses.conf to match=
 latest SPDX naming.<br>
&gt; Added missing mappings.<br>
&gt; Renamed license files that were added in license mappings eg from GPL-=
2.0 to GPL-2.0-only.<br>
&gt; Added &quot;or later&quot; versions of license mappings<br>
&gt; Added &quot;or later&quot; versions of common license files eg GPL-2.0=
-or-later<br>
&gt; <br>
&gt; Fixes: [YOCTO #13320]<br>
&gt; <br>
&gt; Signed-off-by: Meh Mbeh Ida Delphine &lt;<a href=3D"mailto:idadelm@gma=
il.com" target=3D"_blank" rel=3D"noreferrer">idadelm@gmail.com</a>&gt;<br>
<br>
I really want to get this issue resolved so I&#39;ve queued this patch.<br>
There is a comment below.<br>
<br>
&gt; Changes in V6:<br>
&gt; =C2=A0* Added &quot;or later&quot; versions of common license files eg=
 GPL-2.0-or-later in meta/files/common-licenses.<br>
&gt; <br>
&gt; Changes in V5:<br>
&gt; =C2=A0* Added &quot;or later&quot; versions of license mappings in met=
a/conf/licenses.conf<br>
&gt; <br>
&gt; Changes in V4:<br>
&gt; =C2=A0* Renamed license files that were added in license mappings eg f=
rom GPL-2.0 to GPL-2.0-only<br>
&gt; <br>
&gt; Changes in V3:<br>
&gt; =C2=A0* Added missing mappings to meta/conf/licenses.conf<br>
&gt; <br>
&gt; Changes in V2:<br>
&gt; =C2=A0* Corrected the email subject line.<br>
[...]<br>
&gt; =C2=A0=C2=A0#MPL variations<br>
&gt; =C2=A0SPDXLICENSEMAP[MPL-1] =3D &quot;MPL-1.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[MPLv1] =3D &quot;MPL-1.0&quot;<br>
&gt; +SPDXLICENSEMAP[MPL-1.0] =3D &quot;MPL-1.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[MPLv1.1] =3D &quot;MPL-1.1&quot;<br>
&gt; +SPDXLICENSEMAP[MPL-1.1] =3D &quot;MPL-1.1&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[MPLv2] =3D &quot;MPL-2.0&quot;<br>
&gt; +SPDXLICENSEMAP[MPL-2.0] =3D &quot;MPL-2.0&quot;<br>
&gt; +<br>
&gt; =C2=A0=C2=A0#MIT variations<br>
&gt; =C2=A0SPDXLICENSEMAP[MIT-X] =3D &quot;MIT&quot;<br>
&gt; @@ -48,33 +66,43 @@ SPDXLICENSEMAP[openssl] =3D &quot;OpenSSL&quot;<br=
>
&gt; =C2=A0#PSF variations<br>
&gt; =C2=A0SPDXLICENSEMAP[PSF] =3D &quot;PSF-2.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[PSFv2] =3D &quot;PSF-2.0&quot;<br>
&gt; +SPDXLICENSEMAP[PSF-2.0] =3D &quot;PSF-2.0&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0#Python variations<br>
&gt; <br>
&gt; =C2=A0SPDXLICENSEMAP[Python-2] =3D &quot;Python-2.0&quot;<br>
&gt; +SPDXLICENSEMAP[Python-2.0] =3D &quot;Python-2.0&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0#Apache variations<br>
&gt; =C2=A0SPDXLICENSEMAP[Apachev2] =3D &quot;Apache-2.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[Apache-2] =3D &quot;Apache-2.0&quot;<br>
&gt; +SPDXLICENSEMAP[Apache-2.0] =3D &quot;Apache-2.0&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0#Artistic variations<br>
&gt; =C2=A0SPDXLICENSEMAP[Artisticv1] =3D &quot;Artistic-1.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[Artistic-1] =3D &quot;Artistic-1.0&quot;<br>
&gt; +SPDXLICENSEMAP[Artistic-1.0] =3D &quot;Artistic-1.0&quot;<br>
&gt; =C2=A0=C2=A0#Academic variations<br>
&gt; <br>
&gt; =C2=A0SPDXLICENSEMAP[AFL-2] =3D &quot;AFL-2.0&quot;<br>
&gt; +SPDXLICENSEMAP[AFL-2.0] =3D &quot;AFL-2.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[AFL-1] =3D &quot;AFL-1.2&quot;<br>
&gt; +SPDXLICENSEMAP[AFL-1.2] =3D &quot;AFL-1.2&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[AFLv2] =3D &quot;AFL-2.0&quot;<br>
&gt; +SPDXLICENSEMAP[AFL-2.0] =3D &quot;AFL-2.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[AFLv1] =3D &quot;AFL-1.2&quot;<br>
&gt; =C2=A0<br>
&gt; =C2=A0#CDDL variations<br>
&gt; =C2=A0SPDXLICENSEMAP[CDDLv1] =3D &quot;CDDL-1.0&quot;<br>
&gt; =C2=A0SPDXLICENSEMAP[CDDL-1] =3D &quot;CDDL-1.0&quot;<br>
&gt; +SPDXLICENSEMAP[CDDL-1.0] =3D &quot;CDDL-1.0&quot;<br>
&gt; =C2=A0=C2=A0#Other variations<br>
&gt; =C2=A0SPDXLICENSEMAP[EPLv1.0] =3D &quot;EPL-1.0&quot;<br>
&gt; +SPDXLICENSEMAP[EPL-1.0] =3D &quot;EPL-1.0&quot;<br>
&gt; =C2=A0<br>
&gt; <br>
<br>
&gt; =C2=A0#Silicon Graphics variations<br>
&gt; =C2=A0SPDXLICENSEMAP[SGIv1] =3D &quot;SGI-1&quot;<br>
&gt; +SPDXLICENSEMAP[SGI-1] =3D &quot;SGI-1&quot;<br>
&gt; <br>
<br>
I removed the above pieces where the piece in [] is the same as the<br>
value at the end. We don&#39;t need mappings where the two pieces are<br>
identical. Everything else in the patch looked ok.<br>
<br>
I also realised that we have recipes which reference some of the names<br>
which have been renamed in LIC_FILES_CHKSUM entries. The following<br>
files look to be affected:<br>
<br>
meta/recipes-connectivity/connman/<a href=3D"http://connman-conf.bb" rel=3D=
"noreferrer noreferrer" target=3D"_blank">connman-conf.bb</a><br>
meta/recipes-core/busybox/<a href=3D"http://busybox-inittab_1.32.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">busybox-inittab_1.32.0.bb</a><=
br>
meta/recipes-core/systemd/<a href=3D"http://systemd-serialgetty.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">systemd-serialgetty.bb</a><br>
meta/recipes-core/sysvinit/<a href=3D"http://sysvinit-inittab_2.88dsf.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">sysvinit-inittab_2.88dsf.bb<=
/a><br>
meta/recipes-kernel/make-mod-scripts/<a href=3D"http://make-mod-scripts_1.0=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">make-mod-scripts_1.0.b=
b</a>=C2=A0 =C2=A0 <br>
<br>
I&#39;ve queued a patch to fix these.<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
</blockquote></div>

--00000000000071cb7705bb8aca1c--
