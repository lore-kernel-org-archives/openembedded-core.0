Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.907.1615568076594178260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Mar 2021 08:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Vhim0jd7;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: kergoth@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id ci14so54484248ejc.7
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Mar 2021 08:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j/GrF/JHphdQYy+Q6VkTLrFEmFmrTojDyXdk4MZiN9E=;
        b=Vhim0jd7DhRkQGTZgGWBAM+ADtShlC8UlOKZjeohUfl/OZL9TdStD8McTcXAJFmxzc
         pfBGjGjvB9QeluN1M2HSynca4n8Br/KGgwgpwRI7iB1v67dhTgqv/r9kma7Tsh1Dpbtd
         jhYuAO2JUzf2JSarkWRc3gdQVs46CUiMtIaaWRxRzZ8wgiDv1Oj4NgZ4AP4PbLCF5nWb
         DUXVqnvGhMGbCkqxvuJECcLzPJczMusdNXOwEvgG9xuz3QT4MQu9hDPp3blamrbHwAdw
         QkyDBaRxe3/+dnZA3nIgUoRtw8l7jrU2+btn5ReYwIJc/TASv4jP7H/aLJBSoAbyFbhE
         mieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j/GrF/JHphdQYy+Q6VkTLrFEmFmrTojDyXdk4MZiN9E=;
        b=BBDzcTiDilvifZ1f99zNtig4jm0nQCZ7TI+vvMAvcpk+eMHyM6W4zfma8CPoHtueFu
         eu50iB1/bKT4nn6myBIlGhsCIsZ34uDjiaUyTyb6/FkpkmoQfoI7uimTOnn9SAcV2oRt
         gycu7s9xAyETdQ35U4MceLItMX0jw+XLzzXQj4AwFmrqVeMGrY34+VMAXxz49adZjVgJ
         zgrI2oXIHbFdRp9Ribc5x5sGbp1vjrhGGV5wa1lLj02xqCyt24V1g0h64oEcuAYORVtS
         kzCT7nvpb3FmapppS0hG4GrqrdGNk8uxaJyrta6a/JzLH1pE4CoZXgThUG6vPW6MXMN2
         YteA==
X-Gm-Message-State: AOAM531xTttFocNrUy4xgHTdODpfcW3gQk1IqqJuMsTwqzK/0PR6fL4C
	QOpNUUhc61lrwvkZ4eTxmFJ88qvNux28H+eevuc=
X-Google-Smtp-Source: ABdhPJy2XhJoVOEgFXx32NpHPxf6lyWWcjdILBXUlu5scolD8CdwCHSrcW5aYKLcYVdhhczgBIhaNxqXneQ1g8bN30U=
X-Received: by 2002:a17:906:f210:: with SMTP id gt16mr9384154ejb.206.1615568074812;
 Fri, 12 Mar 2021 08:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20210309233130.104839-1-idadelm@gmail.com> <20210309233130.104839-3-idadelm@gmail.com>
 <0e7e667066734d1c9276c1730742c659@XBOX03.axis.com>
In-Reply-To: <0e7e667066734d1c9276c1730742c659@XBOX03.axis.com>
From: "Christopher Larson" <kergoth@gmail.com>
Date: Fri, 12 Mar 2021 09:54:23 -0700
Message-ID: <CABcZAN=e_-OTy0x8jsiEb1-ysqfP6fqf27BoG9ZE63dzkGm_Ug@mail.gmail.com>
Subject: Re: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add handle_qa_error check
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Meh Mbeh Ida Delphine <idadelm@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000035b06505bd59c15c"

--00000000000035b06505bd59c15c
Content-Type: text/plain; charset="UTF-8"

Indeed, bitbake only requires python 3.5.0 right now, we can't use 3.6 or
3.7 features in it or oe-core at this time.

On Fri, Mar 12, 2021 at 9:44 AM Peter Kjellerstedt <
peter.kjellerstedt@axis.com> wrote:

> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-
> > core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> > Sent: den 10 mars 2021 00:31
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add
> > handle_qa_error check
> >
> > package_qa_handle_error() from insane.bbclass handles display of warnings
> > by allowing the user decide whether they want the issues treated as
> > warnings, errors or hidden completely. This is done by setting a variable
> > "license_source_spdx" in local.conf.
> >
> > Signed-off-by: Ida Delphine <idadelm@gmail.com>
> > ---
> >  meta/classes/package.bbclass | 128 ++++++++++++++++++-----------------
> >  1 file changed, 65 insertions(+), 63 deletions(-)
> >
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> > index 4e1be661b3..8c0a49ad76 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -1552,6 +1552,7 @@ PKGDATA_VARS = "PN PE PV PR PKGE PKGV PKGR LICENSE
> > DESCRIPTION SUMMARY RDEPENDS
> >
> >  python emit_pkgdata() {
> >      import oe.license
> > +    import bb.utils
> >      from glob import glob
> >      import json
> >      import subprocess
> > @@ -1712,70 +1713,71 @@ fi
> >          write_extra_runtime_pkgs(global_variants, packages, pkgdatadir)
> >
> >      sourceresult = d.getVar('TEMPDBGSRCMAPPING', False)
> > -    sources = {}
> > -    if sourceresult:
> > -        for r in sourceresult:
> > -            sources[r[0]] = r[1]
> > -        with open(data_file + ".srclist", 'w') as f:
> > -            f.write(json.dumps(sources, sort_keys=True))
> > -
> > -        filelics = {}
> > -        for dirent in [d.getVar('PKGD'),
> d.getVar('STAGING_DIR_TARGET')]:
> > -            p = subprocess.Popen(["grep", 'SPDX-License-Identifier:',
> '-R', '-I'], stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=dirent)
> > -            out, err = p.communicate()
> > -            if p.returncode == 0:
> > -                for l in out.decode("utf-8").split("\n"):
> > -                    l = l.strip()
> > -                    if not l:
> > -                        continue
> > -                    l = l.split(":")
> > -                    if len(l) < 3:
> > -                        bb.warn(str(l))
> > -                        continue
> > -                    fn = "/" + l[0]
> > -                    lic = l[2].strip()
> > -                    if lic.endswith("*/"):
> > -                        lic = lic[:-2]
> > -                    lic = lic.strip()
> > -                    filelics[fn] = lic
> > -        with open(data_file + ".filelics", 'w') as f:
> > -            f.write(json.dumps(filelics, sort_keys=True))
> > -
> > -        computedlics = {}
> > -        computedpkglics = {}
> > -        for r in sourceresult:
> > -            for subf in r[1]:
> > -                if subf in filelics:
> > -                    if r[0] not in computedlics:
> > -                        computedlics[r[0]] = set()
> > -                    computedlics[r[0]].add(filelics[subf])
> > -
> > -
> > -        dvar = d.getVar('PKGD')
> > -        for f in computedlics:
> > -            shortf = f.replace(dvar, "")
> > -            found = False
> > -            for pkg in filemap:
> > -                if shortf in filemap[pkg]:
> > -                    found = True
> > -                    if pkg not in computedpkglics:
> > -                        computedpkglics[pkg] = set()
> > -                    computedpkglics[pkg].update(computedlics[f])
> > -            if not found:
> > -                bb.warn("%s not in %s" % (f, str(filemap)))
> > -
> > -        for pkg in computedpkglics:
> > -            lic = d.getVar('LICENSE_%s' % (pkg))
> > -            if not lic:
> > -                lic = d.getVar('LICENSE')
> > -
> > -            # Splits the LICENSE values and canonicalise each license
> > -            # in the set of split license(s)
> > -            spdx_lic = oe.license.split_spdx_lic(lic, d)
> > +    if bb.utils.contains("license_source_spdx", "1", True, False, d):
>
> This kind of bitbake variable that controls functionality is typically in
> upper case. It also needs to be documented in the manual, and it should
> have
> a default value (??=). It would also make more sense to use
> bb.utils.to_boolean() than bb.utils.contains(). You can also do:
>
>     if not bb.utils.to_boolean(d.getVar("license_source_spdx")):
>         return
>
> thereby avoiding the reindentation, making code review easier.
>
> > +        sources = {}
> > +        if sourceresult:
> > +            for r in sourceresult:
> > +                sources[r[0]] = r[1]
> > +            with open(data_file + ".srclist", 'w') as f:
> > +                f.write(json.dumps(sources, sort_keys=True))
> > +
> > +            filelics = {}
> > +            for dirent in [d.getVar('PKGD'),
> d.getVar('STAGING_DIR_TARGET')]:
> > +                p = subprocess.Popen(["grep",
> 'SPDX-License-Identifier:', '-R', '-I'], stdout=subprocess.PIPE,
> stderr=subprocess.PIPE, cwd=dirent)
> > +                out, err = p.communicate()
> > +                if p.returncode == 0:
> > +                    for l in out.decode("utf-8").split("\n"):
> > +                        l = l.strip()
> > +                        if not l:
> > +                            continue
> > +                        l = l.split(":")
> > +                        if len(l) < 3:
> > +                            bb.warn(str(l))
> > +                            continue
> > +                        fn = "/" + l[0]
> > +                        lic = l[2].strip()
> > +                        if lic.endswith("*/"):
> > +                            lic = lic[:-2]
> > +                        lic = lic.strip()
> > +                        filelics[fn] = lic
> > +            with open(data_file + ".filelics", 'w') as f:
> > +                f.write(json.dumps(filelics, sort_keys=True))
> > +
> > +            computedlics = {}
> > +            computedpkglics = {}
> > +            for r in sourceresult:
> > +                for subf in r[1]:
> > +                    if subf in filelics:
> > +                        if r[0] not in computedlics:
> > +                            computedlics[r[0]] = set()
> > +                        computedlics[r[0]].add(filelics[subf])
> > +
> > +
> > +            dvar = d.getVar('PKGD')
> > +            for f in computedlics:
> > +                shortf = f.replace(dvar, "")
> > +                found = False
> > +                for pkg in filemap:
> > +                    if shortf in filemap[pkg]:
> > +                        found = True
> > +                        if pkg not in computedpkglics:
> > +                            computedpkglics[pkg] = set()
> > +                        computedpkglics[pkg].update(computedlics[f])
> > +                if not found:
> > +                    bb.warn("%s not in %s" % (f, str(filemap)))
> >
> > -            # Displays warnings for licenses found in the recipes and
> not sources
> > -            if spdx_lic - computedpkglics[pkg]:
> > -                bb.warn("License for package %s is %s vs %s" % (pkg,
> computedpkglics[pkg], spdx_lic))
> > +            for pkg in computedpkglics:
> > +                lic = d.getVar('LICENSE_%s' % (pkg))
> > +                if not lic:
> > +                    lic = d.getVar('LICENSE')
> > +
> > +                # Splits the LICENSE values and canonicalise each
> license
> > +                # in the set of split license(s)
> > +                spdx_lic = oe.license.split_spdx_lic(lic, d)
> > +
> > +                # Displays warnings for licenses found in the recipes
> and not sources
> > +                if spdx_lic - computedpkglics[pkg]:
> > +                    package_qa_handle_error("license_source_spdx",
> f'License for package {pkg} is {computedpkglics[pkg]}(source SPDX headers)
> vs {spdx_lic} (LICENSE)', d)
>
> I'm all for using f'' strings, as I think it makes for a lot more readable
> code. However, I am not sure it has been approved for use in the OE code
> yet.
>
> >  }
> >  emit_pkgdata[dirs] = "${PKGDESTWORK}/runtime
> ${PKGDESTWORK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides"
> >
> > --
> > 2.25.1
>
>
> 
>
>

-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Senior Software Engineer, Mentor Graphics

--00000000000035b06505bd59c15c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Indeed, bitbake only requires python 3.5.0 right now, we c=
an&#39;t use 3.6 or 3.7 features in it or oe-core at this time.</div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar =
12, 2021 at 9:44 AM Peter Kjellerstedt &lt;<a href=3D"mailto:peter.kjellers=
tedt@axis.com">peter.kjellerstedt@axis.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">&gt; -----Original Message-----<b=
r>
&gt; From: <a href=3D"mailto:openembedded-core@lists.openembedded.org" tar=
get=3D"_blank">openembedded-core@lists.openembedded.org</a> &lt;openembedde=
d-<br>
&gt; <a href=3D"mailto:core@lists.openembedded.org" target=3D"_blank">core=
@lists.openembedded.org</a>&gt; On Behalf Of Meh Mbeh Ida Delphine<br>
&gt; Sent: den 10 mars 2021 00:31<br>
&gt; To: <a href=3D"mailto:openembedded-core@lists.openembedded.org" targe=
t=3D"_blank">openembedded-core@lists.openembedded.org</a><br>
&gt; Subject: [OE-core] [poky-contrib][PATCH 3/4] package.bbclass: Add<br>
&gt; handle_qa_error check<br>
&gt; <br>
&gt; package_qa_handle_error() from insane.bbclass handles display of warn=
ings<br>
&gt; by allowing the user decide whether they want the issues treated as<b=
r>
&gt; warnings, errors or hidden completely. This is done by setting a vari=
able<br>
&gt; &quot;license_source_spdx&quot; in local.conf.<br>
&gt; <br>
&gt; Signed-off-by: Ida Delphine &lt;<a href=3D"mailto:idadelm@gmail.com" =
target=3D"_blank">idadelm@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/package.bbclass | 128 ++++++++++++++++++----------=
-------<br>
&gt;=C2=A0 1 file changed, 65 insertions(+), 63 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbcl=
ass<br>
&gt; index 4e1be661b3..8c0a49ad76 100644<br>
&gt; --- a/meta/classes/package.bbclass<br>
&gt; +++ b/meta/classes/package.bbclass<br>
&gt; @@ -1552,6 +1552,7 @@ PKGDATA_VARS =3D &quot;PN PE PV PR PKGE PKGV PK=
GR LICENSE<br>
&gt; DESCRIPTION SUMMARY RDEPENDS<br>
&gt; <br>
&gt;=C2=A0 python emit_pkgdata() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import oe.license<br>
&gt; +=C2=A0 =C2=A0 import bb.utils<br>
&gt;=C2=A0 =C2=A0 =C2=A0 from glob import glob<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import json<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import subprocess<br>
&gt; @@ -1712,70 +1713,71 @@ fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_extra_runtime_pkgs(global_var=
iants, packages, pkgdatadir)<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 sourceresult =3D d.getVar(&#39;TEMPDBGSRCMAPPING&=
#39;, False)<br>
&gt; -=C2=A0 =C2=A0 sources =3D {}<br>
&gt; -=C2=A0 =C2=A0 if sourceresult:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in sourceresult:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sources[r[0]] =3D r[1]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(data_file + &quot;.srclist&quo=
t;, &#39;w&#39;) as f:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(json.dumps(sources=
, sort_keys=3DTrue))<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 filelics =3D {}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dirent in [d.getVar(&#39;PKGD&#39;),=
 d.getVar(&#39;STAGING_DIR_TARGET&#39;)]:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subprocess.Popen([&q=
uot;grep&quot;, &#39;SPDX-License-Identifier:&#39;, &#39;-R&#39;, &#39;-I&#=
39;], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE, cwd=3Ddirent)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err =3D p.communicate=
()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returncode =3D=3D 0:<=
br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in out=
.decode(&quot;utf-8&quot;).split(&quot;\n&quot;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 l =3D l.strip()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if not l:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 l =3D l.split(&quot;:&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if len(l) &lt; 3:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 bb.warn(str(l))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 continue<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 fn =3D &quot;/&quot; + l[0]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lic =3D l[2].strip()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if lic.endswith(&quot;*/&quot;):<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 lic =3D lic[:-2]<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lic =3D lic.strip()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 filelics[fn] =3D lic<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(data_file + &quot;.filelics&qu=
ot;, &#39;w&#39;) as f:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(json.dumps(filelic=
s, sort_keys=3DTrue))<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 computedlics =3D {}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 computedpkglics =3D {}<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in sourceresult:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for subf in r[1]:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if subf in f=
ilelics:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if r[0] not in computedlics:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 computedlics[r[0]] =3D set()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 computedlics[r[0]].add(filelics[subf])<br>
&gt; -<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dvar =3D d.getVar(&#39;PKGD&#39;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in computedlics:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shortf =3D f.replace(dvar,=
 &quot;&quot;)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D False<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in filemap:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if shortf in=
 filemap[pkg]:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 found =3D True<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if pkg not in computedpkglics:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 computedpkglics[pkg] =3D set()<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 computedpkglics[pkg].update(computedlics[f])<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not found:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quo=
t;%s not in %s&quot; % (f, str(filemap)))<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in computedpkglics:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic =3D d.getVar(&#39;LICE=
NSE_%s&#39; % (pkg))<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not lic:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic =3D d.ge=
tVar(&#39;LICENSE&#39;)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Splits the LICENSE value=
s and canonicalise each license<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in the set of split lice=
nse(s)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_lic =3D oe.license.sp=
lit_spdx_lic(lic, d)<br>
&gt; +=C2=A0 =C2=A0 if bb.utils.contains(&quot;license_source_spdx&quot;, =
&quot;1&quot;, True, False, d):<br>
<br>
This kind of bitbake variable that controls functionality is typically in =
<br>
upper case. It also needs to be documented in the manual, and it should ha=
ve <br>
a default value (??=3D). It would also make more sense to use <br>
bb.utils.to_boolean() than bb.utils.contains(). You can also do:<br>
<br>
=C2=A0 =C2=A0 if not bb.utils.to_boolean(d.getVar(&quot;license_source_spd=
x&quot;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
<br>
thereby avoiding the reindentation, making code review easier.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sources =3D {}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if sourceresult:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in sourceresult:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sources[r[0]=
] =3D r[1]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(data_file + &quo=
t;.srclist&quot;, &#39;w&#39;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(json=
.dumps(sources, sort_keys=3DTrue))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 filelics =3D {}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for dirent in [d.getVar(&#=
39;PKGD&#39;), d.getVar(&#39;STAGING_DIR_TARGET&#39;)]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D subpro=
cess.Popen([&quot;grep&quot;, &#39;SPDX-License-Identifier:&#39;, &#39;-R&#=
39;, &#39;-I&#39;], stdout=3Dsubprocess.PIPE, stderr=3Dsubprocess.PIPE, cwd=
=
=3Ddirent)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 out, err =3D=
 p.communicate()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if p.returnc=
ode =3D=3D 0:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 for l in out.decode(&quot;utf-8&quot;).split(&quot;\n&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 l =3D l.strip()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if not l:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 l =3D l.split(&quot;:&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if len(l) &lt; 3:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(str(l))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 fn =3D &quot;/&quot; + l[0]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 lic =3D l[2].strip()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if lic.endswith(&quot;*/&quot;):<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic =3D lic[:-2]<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 lic =3D lic.strip()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 filelics[fn] =3D lic<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 with open(data_file + &quo=
t;.filelics&quot;, &#39;w&#39;) as f:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(json=
.dumps(filelics, sort_keys=3DTrue))<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 computedlics =3D {}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 computedpkglics =3D {}<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for r in sourceresult:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for subf in =
r[1]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if subf in filelics:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if r[0] not in computedlics:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 computedlics[r[0]] =3D set()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 computedlics[r[0]].add(filelics[subf])<br>
&gt; +<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dvar =3D d.getVar(&#39;PKG=
D&#39;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for f in computedlics:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 shortf =3D f=
.replace(dvar, &quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 found =3D Fa=
lse<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in f=
ilemap:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 if shortf in filemap[pkg]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 found =3D True<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 if pkg not in computedpkglics:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 computedpkglics[pkg] =3D set()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 computedpkglics[pkg].update(computedlics[f])<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not found=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 bb.warn(&quot;%s not in %s&quot; % (f, str(filemap)))<br>
&gt; <br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Displays warnings for li=
censes found in the recipes and not sources<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if spdx_lic - computedpkgl=
ics[pkg]:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quo=
t;License for package %s is %s vs %s&quot; % (pkg, computedpkglics[pkg], sp=
dx_lic))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for pkg in computedpkglics=
:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lic =3D d.ge=
tVar(&#39;LICENSE_%s&#39; % (pkg))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if not lic:<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 lic =3D d.getVar(&#39;LICENSE&#39;)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Splits the=
 LICENSE values and canonicalise each license<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # in the set=
 of split license(s)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 spdx_lic =3D=
 oe.license.split_spdx_lic(lic, d)<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Displays w=
arnings for licenses found in the recipes and not sources<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if spdx_lic =
- computedpkglics[pkg]:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 package_qa_handle_error(&quot;license_source_spdx&quot;, f&#39;License=
 for package {pkg} is {computedpkglics[pkg]}(source SPDX headers) vs {spdx_=
lic} (LICENSE)&#39;, d)<br>
<br>
I&#39;m all for using f&#39;&#39; strings, as I think it makes for a lot m=
ore readable <br>
code. However, I am not sure it has been approved for use in the OE code <=
br>
yet.<br>
<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 emit_pkgdata[dirs] =3D &quot;${PKGDESTWORK}/runtime ${PKGDESTWO=
RK}/runtime-reverse ${PKGDESTWORK}/runtime-rprovides&quot;<br>
&gt; <br>
&gt; --<br>
&gt; 2.25.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr=
" class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr">Christop=
her Larson<br>kergoth at gmail dot com<br>Founder - BitBake, OpenEmbedded, =
OpenZaurus<br>Senior Software Engineer, Mentor Graphics</div></div></div></=
div>

--00000000000035b06505bd59c15c--
