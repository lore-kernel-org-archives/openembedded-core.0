Return-Path: <sanakazisk19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0B1C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 13:03:18 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web08.26085.1644411796803872032
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=l6Y1U0pZ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: sanakazisk19@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id e7so3060785ejn.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:03:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rGQOKMVPhm0mfhyXtWtFe0K0CdeLOO7/5Rsm9yxiwf4=;
        b=l6Y1U0pZeLCIcblDbObM7yNsZ8TkUslLwqVJqKsGn30A658hNd2NGJGNLIAljQW/Oa
         2cRwWs7G9+nWrrvikPcCD5gOWNWT3UNVSCecq+rxhNSgBx0BffuaRCYannlhy2lSziuc
         cdclLsyRhwOVuF7XaU8uKmFQIR61oCpA2NPSg9EV92T82+laDHX9y6JQp207l6dxAw75
         mcJdLPfq2UyyrS/JgjJ9XZMsPVlWrKUGeJoy1nl2ogkt8Zta3+7b+eF79c+aXiwOkovP
         tf6P9n9r6kqU4MmxGUdcON5nSsQUqezAzXoLpECL2XSL421WKoB8KMiYqvzpoExnC5zM
         1Ihw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rGQOKMVPhm0mfhyXtWtFe0K0CdeLOO7/5Rsm9yxiwf4=;
        b=rT1IRu3Q5vzVBk1rrEM7RtQAzrI36WDGgXINOZz1b88rTnr/ml42sF4H3VOxJ+Fpg+
         hEgVrfjyXbwlLCm4Hz35PiDSpjOYj4HQezfCmFOM7UGdffVcUBweoqhG1D6JQqcSnsFH
         fqPMD/c3aLQ+J9B7+GDZHaT3nQXCyq2qVhg38MgHSr65Ss5R+H8CLKdH/N2HDq5m+yuw
         Vw+XTOXfYa777w02qVB8RYk3B2QBZmD/NB4Q4fbI+8m2lutFC7UEwyXgkYgbqMIHzS1a
         7gZOGpG9xD5Fjkzr6Vno0Ba1/po3ij1zIzg6ko9is1VjaXMfj+FrAr7JAdT9apXtVX/0
         FabA==
X-Gm-Message-State: AOAM532+ntZhAyxoFU7u1tlYRHAjv5y+naNe3dT5TiMRz9IxKz+kLuHl
	/eGBKIBLaQcGysaym+ZQa+HNPSb2ArFGX3+4ZmE=
X-Google-Smtp-Source: 
 ABdhPJz4qofNU0uQ2FIB//CbuPAqWlkbeewyKOum8wtP47QA5MRPZUeOp7QSoLMQkA5VTgrbojCAWxsFUCXRRK+6iD0=
X-Received: by 2002:a17:906:7487:: with SMTP id
 e7mr1871267ejl.58.1644411795052;
 Wed, 09 Feb 2022 05:03:15 -0800 (PST)
MIME-Version: 1.0
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
 <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
In-Reply-To: 
 <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
From: sana kazi <sanakazisk19@gmail.com>
Date: Wed, 9 Feb 2022 18:33:03 +0530
Message-ID: 
 <CAPxU0mu3PiEvsY8t27r1to5s47mX7c9sLFzcsTqMNRxux9y_yQ@mail.gmail.com>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: multipart/alternative; boundary="000000000000e89d6a05d7957498"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 13:03:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161556

--000000000000e89d6a05d7957498
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

I need all the variables but am also interested in additional information
like CVE_PRODUCT or MAINTAINER. Prepared these changes so that any project
specific additional information like that can be added by appending them in
a recipe or distro specific conf.

Regards,
Sana Kazi

On Wed, 9 Feb 2022 at 17:53, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2022-02-09 at 14:59 +0530, sana kazi wrote:
> > Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and
> > BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package
> > data to the latest file of buildhistory and sorted it alphabetically.
> >
> > This makes extending data in buildhistory git tree simple and avoids
> > patches to it for users who care about things like SRC_URI and like
> > to track it in buildhistory git tree.
> >
> > Now we can add additional information as per our requirement to the
> > buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory
> > by appending them in a recipe or distro specific conf file as follows:
> >
> > BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "MAINTAINER"
> > BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "MAINTAINER"
> >
> > Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> > Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> > ---
> >  meta/classes/buildhistory.bbclass | 111 ++++++++++++++++++++----------
> >  1 file changed, 73 insertions(+), 38 deletions(-)
> >
> > diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> > index daa96f3b63..377b325518 100644
> > --- a/meta/classes/buildhistory.bbclass
> > +++ b/meta/classes/buildhistory.bbclass
> > @@ -69,6 +69,11 @@ BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
> >  PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
> >  PATCH_GIT_USER_NAME ?= "OpenEmbedded"
> >
> > +# Set BUILDHISTORY_EXPORT_RECIPE_VARIABLES and
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES
> > +# to export recipe and package data to the latest file of buildhistory
> > +BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS
> PACKAGES SRC_URI LICENSE CONFIG"
> > +BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR
> RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES
> FILELIST"
> > +
> >  #
> >  # Write out the contents of the sysroot
> >  #
> > @@ -264,12 +269,11 @@ python buildhistory_emit_pkghistory() {
> >      rcpinfo.pe = pe
> >      rcpinfo.pv = pv
> >      rcpinfo.pr = pr
> > -    rcpinfo.depends =
> sortlist(oe.utils.squashspaces(d.getVar('DEPENDS') or ""))
> >      rcpinfo.packages = packages
> >      rcpinfo.layer = layer
> > -    rcpinfo.license = license
> >      rcpinfo.config =
> sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
> > -    rcpinfo.src_uri = oe.utils.squashspaces(d.getVar('SRC_URI') or "")
> > +    export_recipe_variables =
> d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
> > +    rcpinfo.export_recipe_variables = export_recipe_variables
> >      write_recipehistory(rcpinfo, d)
> >
> >      bb.build.exec_func("read_subpackage_metadata", d)
> > @@ -323,6 +327,9 @@ python buildhistory_emit_pkghistory() {
> >
> >          pkginfo.size = int(localdata.getVar('PKGSIZE') or '0')
> >
> > +        export_package_variables =
> d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
> > +        pkginfo.export_package_variables = export_package_variables
> > +
> >          write_pkghistory(pkginfo, d)
> >
> >      oe.qa.exit_if_errors(d)
> > @@ -370,17 +377,22 @@ def write_recipehistory(rcpinfo, d):
> >      pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
> >
> >      infofile = os.path.join(pkghistdir, "latest")
> > +    export_recipe_variables =
> set(rcpinfo.export_recipe_variables.split())
> > +    ret = []
> >      with open(infofile, "w") as f:
> > -        if rcpinfo.pe != "0":
> > -            f.write(u"PE = %s\n" %  rcpinfo.pe)
> > -        f.write(u"PV = %s\n" %  rcpinfo.pv)
> > -        f.write(u"PR = %s\n" %  rcpinfo.pr)
> > -        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
> > -        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
> > -        f.write(u"LAYER = %s\n" %  rcpinfo.layer)
> > -        f.write(u"LICENSE = %s\n" %  rcpinfo.license)
> > -        f.write(u"CONFIG = %s\n" %  rcpinfo.config)
> > -        f.write(u"SRC_URI = %s\n" %  rcpinfo.src_uri)
> > +        for var in export_recipe_variables:
> > +            if var == "PE":
> > +                if rcpinfo.pe != "0":
> > +                    ret.append("%s = %s" % (var, rcpinfo.pe))
> > +            elif var == "LAYER":
> > +                ret.append("%s = %s" % (var, rcpinfo.layer))
> > +            elif var == "CONFIG":
> > +                ret.append("%s = %s" % (var, rcpinfo.config))
> > +            else:
> > +                ret.append("%s = %s" % (var,"
> ".join((str(d.getVar(var)).split()))))
> > +        ret.sort()
> > +        for element in ret:
> > +            f.write(element + "\n")
> >
> >      write_latest_srcrev(d, pkghistdir)
> >
> > @@ -394,32 +406,55 @@ def write_pkghistory(pkginfo, d):
> >          bb.utils.mkdirhier(pkgpath)
> >
> >      infofile = os.path.join(pkgpath, "latest")
> > +    export_package_variables =
> set(pkginfo.export_package_variables.split())
> > +    ret = []
> >      with open(infofile, "w") as f:
> > -        if pkginfo.pe != "0":
> > -            f.write(u"PE = %s\n" %  pkginfo.pe)
> > -        f.write(u"PV = %s\n" %  pkginfo.pv)
> > -        f.write(u"PR = %s\n" %  pkginfo.pr)
> > -
> > -        if pkginfo.pkg != pkginfo.name:
> > -            f.write(u"PKG = %s\n" % pkginfo.pkg)
> > -        if pkginfo.pkge != pkginfo.pe:
> > -            f.write(u"PKGE = %s\n" % pkginfo.pkge)
> > -        if pkginfo.pkgv != pkginfo.pv:
> > -            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
> > -        if pkginfo.pkgr != pkginfo.pr:
> > -            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
> > -        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
> > -        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
> > -        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
> > -        if pkginfo.rsuggests:
> > -            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
> > -        if pkginfo.rreplaces:
> > -            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
> > -        if pkginfo.rconflicts:
> > -            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
> > -        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
> > -        f.write(u"FILES = %s\n" %  pkginfo.files)
> > -        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)
> > +        for var in export_package_variables:
> > +            if var == "PE":
> > +                if pkginfo.pe != "0":
> > +                    ret.append("%s = %s" % (var, pkginfo.pe))
> > +            elif var == "PV":
> > +                ret.append("%s = %s" % (var, pkginfo.pv))
> > +            elif var == "PR":
> > +                ret.append("%s = %s" % (var, pkginfo.pr))
> > +            elif var == "RPROVIDES":
> > +                ret.append("%s = %s" % (var, pkginfo.rprovides))
> > +            elif var == "RDEPENDS":
> > +                ret.append("%s = %s" % (var, pkginfo.rdepends))
> > +            elif var == "RRECOMMENDS":
> > +                ret.append("%s = %s" % (var, pkginfo.rrecommends))
> > +            elif var == "PKGSIZE":
> > +                ret.append("%s = %s" % (var, pkginfo.size))
> > +            elif var == "FILES":
> > +                ret.append("%s = %s" % (var, pkginfo.files))
> > +            elif var == "FILELIST":
> > +                ret.append("%s = %s" % (var, pkginfo.filelist))
> > +            elif var == "RSUGGESTS":
> > +                if pkginfo.rsuggests:
> > +                    ret.append(u"RSUGGESTS = %s" %  pkginfo.rsuggests)
> > +            elif var == "RREPLACES":
> > +                if pkginfo.rreplaces:
> > +                    ret.append(u"RREPLACES = %s" %  pkginfo.rreplaces)
> > +            elif var == "RCONFLICTS":
> > +                if pkginfo.rconflicts:
> > +                    ret.append(u"RCONFLICTS = %s" %  pkginfo.rconflicts)
> > +            elif var == "PKG":
> > +                if pkginfo.pkg != pkginfo.name:
> > +                    ret.append(u"PKG = %s" % pkginfo.pkg)
> > +            elif var == "PKGE":
> > +                if pkginfo.pkge != pkginfo.pe :
> > +                    ret.append(u"PKGE = %s" % pkginfo.pkge)
> > +            elif var == "PKGV":
> > +                if pkginfo.pkgv != pkginfo.pv:
> > +                    ret.append(u"PKGV = %s" % pkginfo.pkgv)
> > +            elif var == "PKGR":
> > +                if pkginfo.pkgr != pkginfo.pr:
> > +                    ret.append(u"PKGR = %s" % pkginfo.pkgr)
> > +            else:
> > +                ret.append("%s = %s" % (var, d.getVar(var)))
> > +        ret.sort()
> > +        for element in ret:
> > +            f.write(element + "\n")
>
>
> People have requested changes like this before and I rejected it as I'm
> worried
> that allowing people to customise this code will just fork the project
> into many
> different directions.
>
> The elif block above illustrates part of my concern since it still isn't
> scaling
> well and just potentially makes every buildhistory output difference (even
> with
> different ordering). There are reasons the data is taken from pkginfo
> rather
> than getVar too and I think this could introduce subtle bugs in the future.
>
> Which variables are you actually interested in when changing this?
>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>

--000000000000e89d6a05d7957498
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Richard,<div><br></div><div>I need all the variables bu=
t am also interested in additional information like=C2=A0CVE_PRODUCT or MAI=
NTAINER. Prepared these changes=C2=A0so that any project specific=C2=A0addi=
tional=C2=A0information like that can be added=C2=A0<span style=3D"color:rg=
b(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-ser=
if;font-size:14px;white-space:pre-wrap">by appending them in a recipe or di=
stro specific conf.</span></div><div><span style=3D"color:rgb(51,51,51);fon=
t-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:14=
px;white-space:pre-wrap"><br></span></div><div><span style=3D"color:rgb(51,=
51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;fo=
nt-size:14px;white-space:pre-wrap">Regards,</span></div><div><span style=3D=
"color:rgb(51,51,51);font-family:&quot;Helvetica Neue&quot;,Helvetica,Arial=
,sans-serif;font-size:14px;white-space:pre-wrap">Sana Kazi</span></div></di=
v><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On W=
ed, 9 Feb 2022 at 17:53, Richard Purdie &lt;<a href=3D"mailto:richard.purdi=
e@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2022-02-09=
 at 14:59 +0530, sana kazi wrote:<br>
&gt; Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and<br>
&gt; BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package<br>
&gt; data to the latest file of buildhistory and sorted it alphabetically.<=
br>
&gt; <br>
&gt; This makes extending data in buildhistory git tree simple and avoids<b=
r>
&gt; patches to it for users who care about things like SRC_URI and like<br=
>
&gt; to track it in buildhistory git tree.<br>
&gt; <br>
&gt; Now we can add additional information as per our requirement to the<br=
>
&gt; buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory<=
br>
&gt; by appending them in a recipe or distro specific conf file as follows:=
<br>
&gt; <br>
&gt; BUILDHISTORY_EXPORT_RECIPE_VARIABLES +=3D &quot;MAINTAINER&quot;<br>
&gt; BUILDHISTORY_EXPORT_PACKAGE_VARIABLES +=3D &quot;MAINTAINER&quot;<br>
&gt; <br>
&gt; Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" tar=
get=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
&gt; Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com"=
 target=3D"_blank">sanakazisk19@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/buildhistory.bbclass | 111 ++++++++++++++++++++----=
------<br>
&gt;=C2=A0 1 file changed, 73 insertions(+), 38 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhis=
tory.bbclass<br>
&gt; index daa96f3b63..377b325518 100644<br>
&gt; --- a/meta/classes/buildhistory.bbclass<br>
&gt; +++ b/meta/classes/buildhistory.bbclass<br>
&gt; @@ -69,6 +69,11 @@ BUILDHISTORY_PRESERVE =3D &quot;latest latest_srcre=
v sysroot&quot;<br>
&gt;=C2=A0 PATCH_GIT_USER_EMAIL ?=3D &quot;buildhistory@oe&quot;<br>
&gt;=C2=A0 PATCH_GIT_USER_NAME ?=3D &quot;OpenEmbedded&quot;<br>
&gt;=C2=A0 <br>
&gt; +# Set BUILDHISTORY_EXPORT_RECIPE_VARIABLES and BUILDHISTORY_EXPORT_PA=
CKAGE_VARIABLES<br>
&gt; +# to export recipe and package data to the latest file of buildhistor=
y<br>
&gt; +BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?=3D &quot;PR PV PE LAYER DEPEND=
S PACKAGES SRC_URI LICENSE CONFIG&quot;<br>
&gt; +BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?=3D &quot;PE PV PR PKG PKGE PK=
GV PKGR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSI=
ZE FILES FILELIST&quot;<br>
&gt; +<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 # Write out the contents of the sysroot<br>
&gt;=C2=A0 #<br>
&gt; @@ -264,12 +269,11 @@ python buildhistory_emit_pkghistory() {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://rcpinfo.pe" rel=3D"noreferrer" t=
arget=3D"_blank">rcpinfo.pe</a> =3D pe<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rcpinfo.pv =3D pv<br>
&gt;=C2=A0 =C2=A0 =C2=A0 <a href=3D"http://rcpinfo.pr" rel=3D"noreferrer" t=
arget=3D"_blank">rcpinfo.pr</a> =3D pr<br>
&gt; -=C2=A0 =C2=A0 rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.ge=
tVar(&#39;DEPENDS&#39;) or &quot;&quot;))<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rcpinfo.packages =3D packages<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rcpinfo.layer =3D layer<br>
&gt; -=C2=A0 =C2=A0 rcpinfo.license =3D license<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rcpinfo.config =3D sortlist(oe.utils.squashspaces(=
d.getVar(&#39;PACKAGECONFIG&#39;) or &quot;&quot;))<br>
&gt; -=C2=A0 =C2=A0 rcpinfo.src_uri =3D oe.utils.squashspaces(d.getVar(&#39=
;SRC_URI&#39;) or &quot;&quot;)<br>
&gt; +=C2=A0 =C2=A0 export_recipe_variables =3D d.getVar(&#39;BUILDHISTORY_=
EXPORT_RECIPE_VARIABLES&#39;) or &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 rcpinfo.export_recipe_variables =3D export_recipe_varia=
bles<br>
&gt;=C2=A0 =C2=A0 =C2=A0 write_recipehistory(rcpinfo, d)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 bb.build.exec_func(&quot;read_subpackage_metadata&=
quot;, d)<br>
&gt; @@ -323,6 +327,9 @@ python buildhistory_emit_pkghistory() {<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkginfo.size =3D int(localdata.getVa=
r(&#39;PKGSIZE&#39;) or &#39;0&#39;)<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 export_package_variables =3D d.getVar(&#3=
9;BUILDHISTORY_EXPORT_PACKAGE_VARIABLES&#39;) or &#39;&#39;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkginfo.export_package_variables =3D expo=
rt_package_variables<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_pkghistory(pkginfo, d)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 oe.qa.exit_if_errors(d)<br>
&gt; @@ -370,17 +377,22 @@ def write_recipehistory(rcpinfo, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 pkghistdir =3D d.getVar(&#39;BUILDHISTORY_DIR_PACK=
AGE&#39;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 infofile =3D os.path.join(pkghistdir, &quot;latest=
&quot;)<br>
&gt; +=C2=A0 =C2=A0 export_recipe_variables =3D set(rcpinfo.export_recipe_v=
ariables.split())<br>
&gt; +=C2=A0 =C2=A0 ret =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 with open(infofile, &quot;w&quot;) as f:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://rcpinfo.pe" rel=3D"n=
oreferrer" target=3D"_blank">rcpinfo.pe</a> !=3D &quot;0&quot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PE =3D %s\n&=
quot; %=C2=A0 <a href=3D"http://rcpinfo.pe" rel=3D"noreferrer" target=3D"_b=
lank">rcpinfo.pe</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PV =3D %s\n&quot; %=C2=A0 =
rcpinfo.pv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PR =3D %s\n&quot; %=C2=A0 =
<a href=3D"http://rcpinfo.pr" rel=3D"noreferrer" target=3D"_blank">rcpinfo.=
pr</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;DEPENDS =3D %s\n&quot; %=
=C2=A0 rcpinfo.depends)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PACKAGES =3D %s\n&quot; %=
=C2=A0 rcpinfo.packages)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;LAYER =3D %s\n&quot; %=C2=
=A0 rcpinfo.layer)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;LICENSE =3D %s\n&quot; %=
=C2=A0 rcpinfo.license)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;CONFIG =3D %s\n&quot; %=C2=
=A0 rcpinfo.config)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;SRC_URI =3D %s\n&quot; %=
=C2=A0 rcpinfo.src_uri)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in export_recipe_variables:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if var =3D=3D &quot;PE&quot=
;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D=
"http://rcpinfo.pe" rel=3D"noreferrer" target=3D"_blank">rcpinfo.pe</a> !=
=3D &quot;0&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(&quot;%s =3D %s&quot; % (var, <a href=3D"http://rcpinfo.pe" rel=
=3D"noreferrer" target=3D"_blank">rcpinfo.pe</a>))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;LAYER=
&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, rcpinfo.layer))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;CONFI=
G&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, rcpinfo.config))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var,&quot; &quot;.join((str(d.getVar(var)).split()))=
))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.sort()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for element in ret:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(element + &quot;\n&=
quot;)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 write_latest_srcrev(d, pkghistdir)<br>
&gt;=C2=A0 <br>
&gt; @@ -394,32 +406,55 @@ def write_pkghistory(pkginfo, d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier(pkgpath)<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 infofile =3D os.path.join(pkgpath, &quot;latest&qu=
ot;)<br>
&gt; +=C2=A0 =C2=A0 export_package_variables =3D set(pkginfo.export_package=
_variables.split())<br>
&gt; +=C2=A0 =C2=A0 ret =3D []<br>
&gt;=C2=A0 =C2=A0 =C2=A0 with open(infofile, &quot;w&quot;) as f:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://pkginfo.pe" rel=3D"n=
oreferrer" target=3D"_blank">pkginfo.pe</a> !=3D &quot;0&quot;:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PE =3D %s\n&=
quot; %=C2=A0 <a href=3D"http://pkginfo.pe" rel=3D"noreferrer" target=3D"_b=
lank">pkginfo.pe</a>)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PV =3D %s\n&quot; %=C2=A0 =
pkginfo.pv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PR =3D %s\n&quot; %=C2=A0 =
<a href=3D"http://pkginfo.pr" rel=3D"noreferrer" target=3D"_blank">pkginfo.=
pr</a>)<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkg !=3D <a href=3D"http://pkg=
info.name" rel=3D"noreferrer" target=3D"_blank">pkginfo.name</a>:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKG =3D %s\n=
&quot; % pkginfo.pkg)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkge !=3D <a href=3D"http://pk=
ginfo.pe" rel=3D"noreferrer" target=3D"_blank">pkginfo.pe</a>:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGE =3D %s\=
n&quot; % pkginfo.pkge)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkgv !=3D pkginfo.pv:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGV =3D %s\=
n&quot; % pkginfo.pkgv)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkgr !=3D <a href=3D"http://pk=
ginfo.pr" rel=3D"noreferrer" target=3D"_blank">pkginfo.pr</a>:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGR =3D %s\=
n&quot; % pkginfo.pkgr)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RPROVIDES =3D %s\n&quot; %=
=C2=A0 pkginfo.rprovides)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RDEPENDS =3D %s\n&quot; %=
=C2=A0 pkginfo.rdepends)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RRECOMMENDS =3D %s\n&quot;=
 %=C2=A0 pkginfo.rrecommends)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rsuggests:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RSUGGESTS =
=3D %s\n&quot; %=C2=A0 pkginfo.rsuggests)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rreplaces:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RREPLACES =
=3D %s\n&quot; %=C2=A0 pkginfo.rreplaces)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rconflicts:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RCONFLICTS =
=3D %s\n&quot; %=C2=A0 pkginfo.rconflicts)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGSIZE =3D %d\n&quot; %=
=C2=A0 pkginfo.size)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;FILES =3D %s\n&quot; %=C2=
=A0 pkginfo.files)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;FILELIST =3D %s\n&quot; %=
=C2=A0 pkginfo.filelist)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in export_package_variables:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if var =3D=3D &quot;PE&quot=
;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D=
"http://pkginfo.pe" rel=3D"noreferrer" target=3D"_blank">pkginfo.pe</a> !=
=3D &quot;0&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(&quot;%s =3D %s&quot; % (var, <a href=3D"http://pkginfo.pe" rel=
=3D"noreferrer" target=3D"_blank">pkginfo.pe</a>))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PV&qu=
ot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, pkginfo.pv))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PR&qu=
ot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, <a href=3D"http://pkginfo.pr" rel=3D"noreferrer=
" target=3D"_blank">pkginfo.pr</a>))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RPROV=
IDES&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, pkginfo.rprovides))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RDEPE=
NDS&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, pkginfo.rdepends))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RRECO=
MMENDS&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, pkginfo.rrecommends))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGSI=
ZE&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, pkginfo.size))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;FILES=
&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, pkginfo.files))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;FILEL=
IST&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, pkginfo.filelist))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RSUGG=
ESTS&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rs=
uggests:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(u&quot;RSUGGESTS =3D %s&quot; %=C2=A0 pkginfo.rsuggests)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RREPL=
ACES&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rr=
eplaces:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(u&quot;RREPLACES =3D %s&quot; %=C2=A0 pkginfo.rreplaces)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RCONF=
LICTS&quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rc=
onflicts:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(u&quot;RCONFLICTS =3D %s&quot; %=C2=A0 pkginfo.rconflicts)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKG&q=
uot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pk=
g !=3D <a href=3D"http://pkginfo.name" rel=3D"noreferrer" target=3D"_blank"=
>pkginfo.name</a>:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(u&quot;PKG =3D %s&quot; % pkginfo.pkg)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGE&=
quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pk=
ge !=3D <a href=3D"http://pkginfo.pe" rel=3D"noreferrer" target=3D"_blank">=
pkginfo.pe</a> :<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(u&quot;PKGE =3D %s&quot; % pkginfo.pkge)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGV&=
quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pk=
gv !=3D pkginfo.pv:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(u&quot;PKGV =3D %s&quot; % pkginfo.pkgv)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGR&=
quot;:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pk=
gr !=3D <a href=3D"http://pkginfo.pr" rel=3D"noreferrer" target=3D"_blank">=
pkginfo.pr</a>:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 ret.append(u&quot;PKGR =3D %s&quot; % pkginfo.pkgr)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&q=
uot;%s =3D %s&quot; % (var, d.getVar(var)))<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.sort()<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 for element in ret:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(element + &quot;\n&=
quot;)<br>
<br>
<br>
People have requested changes like this before and I rejected it as I&#39;m=
 worried<br>
that allowing people to customise this code will just fork the project into=
 many<br>
different directions.=C2=A0<br>
<br>
The elif block above illustrates part of my concern since it still isn&#39;=
t scaling<br>
well and just potentially makes every buildhistory output difference (even =
with<br>
different ordering). There are reasons the data is taken from pkginfo rathe=
r<br>
than getVar too and I think this could introduce subtle bugs in the future.=
<br>
<br>
Which variables are you actually interested in when changing this?<br>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000e89d6a05d7957498--

