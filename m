Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.1564.1615570799080927990
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 09:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=imeT9zAs;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: idadelm@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id mm21so54819149ejb.12
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 09:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HuPDenaY8Fce/79P5OR66z97stZnPl3MBeYmyTjnVhg=;
        b=imeT9zAsmg9AOQx8lijx8Q0YvjyE1gEGkDctdfMHdJr35n7HOBp3nGwYLiEQBgmq9+
         zMT0OWuNPDoYg1VX9hU99EE/Fgl2iIdl89mVJUTnYRozUo183TpJU8lysKyTtua5JUv+
         EYgcLwSPCPdun1Bt25I/BaMNT51t7djlWsvAXyVTuUgakAP+3P8suxVOc42vFevShcYO
         bnXbxxsqP/G07UblJ+u3QLfJjK7TJcT+c0SLWeMjylDsadC7w2Bj+ONZUDyIvhUrULhn
         zGZy4VY+CrijUvx9UHRD6jSChuKEFNKwZemXozgAgpPtN4bpZAY3lpDjoWfneXN5H8ak
         xXnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HuPDenaY8Fce/79P5OR66z97stZnPl3MBeYmyTjnVhg=;
        b=KR88UoZxxYWbYZI/iepZ7O0fYrKngSAkOdCBdN5ihBUzrdap1QLH/ciV/Py8F8PWZy
         +EwRrxeVPBk4leVDWhPVzPSOvoLRTN+2vaTJAkHy7lrL5g6H+1c6FiOAAtK6Bq6u3Ch0
         Kt1iNwSQca74d1aesF2P0KrXErXcszzRLlVzdcRVked3GeLPphzAXofVEGZuq9eitaDI
         KQWdzH0AMVU7YSMwsX7SfighPJnFXYMN8GNC4Ua1YZA66GqIk2CPm/10cvHHvsVgAbbl
         8k6zI8lUfICNZU//umly9jRS7s/FkBfaLm1tIfQ45VeS/fRTnvnVv2/5jh6mY6a/YC+3
         Zvjg==
X-Gm-Message-State: AOAM5322A3sC2srCbQnn6EdwWK8M1HjB0wiF+U59dOcipZJhittp2ybD
	dkUE469Y2hEXLo0cULolRloc48lfmI3jnv7pcwY=
X-Google-Smtp-Source: ABdhPJzlanleVv3iynUYkPc9rL2hpI5qpsVy84SU5qnYEra+CcmGBYZ1zS1xC6EFGw0zhqFIrKwadVuw1oIAc3+9I+8=
X-Received: by 2002:a17:906:ae96:: with SMTP id md22mr9446148ejb.409.1615570797423;
 Fri, 12 Mar 2021 09:39:57 -0800 (PST)
MIME-Version: 1.0
References: <20210309233130.104839-1-idadelm@gmail.com> <20210309233130.104839-4-idadelm@gmail.com>
 <8bb63481eacc4f7cac51e5f88ab856dd@XBOX03.axis.com>
In-Reply-To: <8bb63481eacc4f7cac51e5f88ab856dd@XBOX03.axis.com>
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
Date: Fri, 12 Mar 2021 18:38:58 +0100
Message-ID: <CAN7sTgtvTLpub2bR0NpN7Zt40=168C33oj9EQ7XboSgAKYUbGw@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][PATCH 4/4] Moved logic to get filelics from package.bbclass to license.py
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007d6e1005bd5a639e"

--0000000000007d6e1005bd5a639e
Content-Type: text/plain; charset="UTF-8"

Okay. I will fix that.

On Fri, 12 Mar 2021, 5:18 pm Peter Kjellerstedt, <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> > Sent: den 10 mars 2021 00:32
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [poky-contrib][PATCH 4/4] Moved logic to get filelics
> > from package.bbclass to license.py
> >
> > The logic to obtain filelics is moved from package.bbclass to license.py
> > as a standalone function.
> > Also, the check in package.bbclass after obtaining filelics ensures
> > licenses with * WITH Linux-syscall-note" are ignored, as long as they're
> > only in header files.
> >
> > Signed-off-by: Ida Delphine <idadelm@gmail.com>
> > ---
> >  meta/classes/package.bbclass | 24 ++++++------------------
> >  meta/lib/oe/license.py       | 29 ++++++++++++++++++++++++++++-
> >  2 files changed, 34 insertions(+), 19 deletions(-)
> >
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index 8c0a49ad76..a2e0eab848 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1721,25 +1721,13 @@ fi
> >              with open(data_file + ".srclist", 'w') as f:
> >                  f.write(json.dumps(sources, sort_keys=True))
> >
> > +            flics = oe.license.get_filelics([d.getVar('PKGD'),
> > d.getVar('STAGING_DIR_TARGET')])
> >              filelics = {}
> > -            for dirent in [d.getVar('PKGD'),
> > d.getVar('STAGING_DIR_TARGET')]:
> > -                p = subprocess.Popen(["grep",
> 'SPDX-License-Identifier:',
> > '-R', '-I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
> > -                out, err = p.communicate()
> > -                if p.returncode == 0:
> > -                    for l in out.decode("utf-8").split("\n"):
> > -                        l = l.strip()
> > -                        if not l:
> > -                            continue
> > -                        l = l.split(":")
> > -                        if len(l) < 3:
> > -                            bb.warn(str(l))
> > -                            continue
> > -                        fn = "/" + l[0]
> > -                        lic = l[2].strip()
> > -                        if lic.endswith("*/"):
> > -                            lic = lic[:-2]
> > -                        lic = lic.strip()
> > -                        filelics[fn] = lic
> > +            for k, v in flics.items():
> > +                if k.endswith(".h") and v.endswith("WITH
> Linux-syscall-note"):
>
> What about .hh files, or .hpp files, or header files from some
> other language than C/C++? At the least, this if statement should
> have a comment explaining what is going on.
>
> > +                    continue
> > +                else:
> > +                    filelics[k] = v
> >              with open(data_file + ".filelics", 'w') as f:
> >                  f.write(json.dumps(filelics, sort_keys=True))
> >
> > diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
> > index 9e9957be1d..3c40fa73eb 100644
> > --- a/meta/lib/oe/license.py
> > +++ b/meta/lib/oe/license.py
> > @@ -3,6 +3,8 @@
> >  #
> >  """Code for parsing OpenEmbedded license strings"""
> >
> > +import subprocess
> > +import bb
> >  import ast
> >  import re
> >  from fnmatch import fnmatchcase as fnmatch
> > @@ -258,4 +260,29 @@ def split_spdx_lic(licensestr,d):
> >      """
> >      split_lic = list_licenses(licensestr)
> >      spdx_lic = set([canonical_license(l, d) for l in split_lic])
> > -    return spdx_lic
> > \ No newline at end of file
> > +    return spdx_lic
> > +
> > +def get_filelics(dirs):
> > +    """"
> > +    This function returns a dictionary of file paths (keys) and their
> > corresponding SPDX header identifiers (values).
> > +    """
> > +    filelics = {}
> > +    for dirent in dirs:
> > +        p = subprocess.Popen(["grep", 'SPDX-License-Identifier:',
> '-R','-
> > I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
> > +        out, err = p.communicate()
> > +        if p.returncode == 0:
> > +            for l in out.decode("utf-8").split("\n"):
> > +                l = l.strip()
> > +                if not l:
> > +                    continue
> > +                l = l.split(":")
> > +                if len(l) < 3:
> > +                    bb.warn(str(l))
> > +                    continue
> > +                fn = "/" + l[0]
> > +                lic = l[2].strip()
> > +                if lic.endswith("*/"):
> > +                    lic = lic[:-2]
> > +                lic = lic.strip()
> > +                filelics[fn] = lic
> > +    return filelics
> > \ No newline at end of file
> > --
> > 2.25.1
>
> //Peter
>
>

--0000000000007d6e1005bd5a639e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Okay. I will fix that.</div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 12 Mar 2021, 5:18 pm Peter =
Kjellerstedt, &lt;<a href=3D"mailto:peter.kjellerstedt@axis.com">peter.kjel=
lerstedt@axis.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&g=
t; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targ=
et=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</=
a> &lt;openembedded-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank" rel=
=3D"noreferrer">core@lists.openembedded.org</a>&gt; On Behalf Of Meh Mbeh I=
da Delphine<br>
&gt; Sent: den 10 mars 2021 00:32<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" target=
=3D"_blank" rel=3D"noreferrer">openembedded-core@lists.openembedded.org</a>=
<br>
&gt; Subject: [OE-core] [poky-contrib][PATCH 4/4] Moved logic to get fileli=
cs<br>
&gt; from package.bbclass to license.py<br>
&gt; <br>
&gt; The logic to obtain filelics is moved from package.bbclass to license.=
py<br>
&gt; as a standalone function.<br>
&gt; Also, the check in package.bbclass after obtaining filelics ensures<br=
>
&gt; licenses with * WITH Linux-syscall-note&quot; are ignored, as long as =
they&#39;re<br>
&gt; only in header files.<br>
&gt; <br>
&gt; Signed-off-by: Ida Delphine &lt;<a href=3D"mailto:idadelm@gmail.com" t=
arget=3D"_blank" rel=3D"noreferrer">idadelm@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/package.bbclass | 24 ++++++------------------<br>
&gt;=C2=A0 meta/lib/oe/license.py=C2=A0 =C2=A0 =C2=A0 =C2=A0| 29 ++++++++++=
++++++++++++++++++-<br>
&gt;=C2=A0 2 files changed, 34 insertions(+), 19 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcla=
ss<br>
&gt; index 8c0a49ad76..a2e0eab848 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -1721,25 +1721,13 @@ fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(data_file + =
&quot;.srclist&quot;, &#39;w&#39;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(=
json.dumps(sources, sort_keys=3DTrue))<br>
&gt; <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 flics =3D oe.license.get_fi=
lelics([d.getVar(&#39;PKGD&#39;),<br>
&gt; d.getVar(&#39;STAGING_DIR_TARGET&#39;)])<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filelics =3D {}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dirent in [d.getVar(&#3=
9;PKGD&#39;),<br>
&gt; d.getVar(&#39;STAGING_DIR_TARGET&#39;)]:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subproc=
ess.Popen([&quot;grep&quot;, &#39;SPDX-License-Identifier:&#39;,<br>
&gt; &#39;-R&#39;, &#39;-I&#39;], stdout=3Dsubprocess.PIPE, stderr=3Dsubpro=
cess.PIPE, cwd=3Ddirent)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err =3D =
p.communicate()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returnco=
de =3D=3D 0:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 for l in out.decode(&quot;utf-8&quot;).split(&quot;\n&quot;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 l =3D l.strip()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if not l:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 l =3D l.split(&quot;:&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if len(l) &lt; 3:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(str(l))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 fn =3D &quot;/&quot; + l[0]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 lic =3D l[2].strip()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 if lic.endswith(&quot;*/&quot;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic =3D lic[:-2]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 lic =3D lic.strip()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 filelics[fn] =3D lic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for k, v in flics.items():<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if k.endswith=
(&quot;.h&quot;) and v.endswith(&quot;WITH Linux-syscall-note&quot;):<br>
<br>
What about .hh files, or .hpp files, or header files from some <br>
other language than C/C++? At the least, this if statement should <br>
have a comment explaining what is going on.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 filelics[k] =3D v<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(data_file + =
&quot;.filelics&quot;, &#39;w&#39;) as f:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(=
json.dumps(filelics, sort_keys=3DTrue))<br>
&gt; <br>
&gt; diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py<br>
&gt; index 9e9957be1d..3c40fa73eb 100644<br>
&gt; --- a/meta/lib/oe/license.py<br>
&gt; +++ b/meta/lib/oe/license.py<br>
&gt; @@ -3,6 +3,8 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 &quot;&quot;&quot;Code for parsing OpenEmbedded license strings&=
quot;&quot;&quot;<br>
&gt; <br>
&gt; +import subprocess<br>
&gt; +import bb<br>
&gt;=C2=A0 import ast<br>
&gt;=C2=A0 import re<br>
&gt;=C2=A0 from fnmatch import fnmatchcase as fnmatch<br>
&gt; @@ -258,4 +260,29 @@ def split_spdx_lic(licensestr,d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 split_lic =3D list_licenses(licensestr)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 spdx_lic =3D set([canonical_license(l, d) for l in=
 split_lic])<br>
&gt; -=C2=A0 =C2=A0 return spdx_lic<br>
&gt; \ No newline at end of file<br>
&gt; +=C2=A0 =C2=A0 return spdx_lic<br>
&gt; +<br>
&gt; +def get_filelics(dirs):<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 This function returns a dictionary of file paths (keys)=
 and their<br>
&gt; corresponding SPDX header identifiers (values).<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 filelics =3D {}<br>
&gt; +=C2=A0 =C2=A0 for dirent in dirs:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen([&quot;grep&quot;,=
 &#39;SPDX-License-Identifier:&#39;, &#39;-R&#39;,&#39;-<br>
&gt; I&#39;], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE, cwd=3Ddir=
ent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err =3D p.communicate()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returncode =3D=3D 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in out.decode(&quot;u=
tf-8&quot;).split(&quot;\n&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D l.strip=
()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not l:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 l =3D l.split=
(&quot;:&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if len(l) &lt=
; 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 bb.warn(str(l))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fn =3D &quot;=
/&quot; + l[0]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic =3D l[2].=
strip()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if lic.endswi=
th(&quot;*/&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 lic =3D lic[:-2]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic =3D lic.s=
trip()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filelics[fn] =
=3D lic<br>
&gt; +=C2=A0 =C2=A0 return filelics<br>
&gt; \ No newline at end of file<br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
//Peter<br>
<br>
</blockquote></div>

--0000000000007d6e1005bd5a639e--
