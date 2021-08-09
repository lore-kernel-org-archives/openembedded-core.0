Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web11.19343.1628490308014349652
 for <Openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 23:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NccHFmtP;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: sanakazisk19@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id y12so22927607edo.6
        for <Openembedded-core@lists.openembedded.org>; Sun, 08 Aug 2021 23:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=chiSfLwYE1SUogekZlAclBzPhjHTOdzGva378Vzlvdw=;
        b=NccHFmtPekKrYpkFZi6RdHNVPratsrpsIPTE56GlWhCZS4WEo1SQ+tg5N7BnUqLQqW
         n5uGju3Og0kTGgelLjHFoNEZP+S7Sh8O5wudZmVVPmBWIKHBIOxjxviJRaaqzrxniNWt
         ZJ+xOQsCb55h0Js/sua8OkGG+OPIaaTSBq/wD8Mks/XlHqC+aM2V9NQlIs+/mOYriQJ4
         656VcE2ONKF4fV91zCJEmIbehxDJd29coRcgLQ9dFk8zdduT96Q1RXE+8D4B8vmIHTlc
         AoT/nq1ZFC/szmnEyYh3BvFF/3ffq2sBfilRiQzdQFRB9kTQbiXwfqsAJ0PPqh6Tdb1A
         Qrcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=chiSfLwYE1SUogekZlAclBzPhjHTOdzGva378Vzlvdw=;
        b=T4BOeln1PY9DDd/ayCeVSWOXWyyzfSd2EvaXG/Ds/DNpRcBlQnNho9Mebil9n0gXLn
         AVb4b4+NRgyEsrKfnYuXbasZgECUxy2K7JpKhMDQikALbOjUbrIVDkAc3mWGonamB/bq
         brZDCp7ouDob7lgdF05A53Pul+TNUILAxHHGfDQb4LAounHZROC2KRswwGybUqpx9hW1
         7EE2VhJnj51oRrpSRdHl0pNKqwblcPsl8pv/1V1d1HfDt8IMvhFnM9S+drAD3hftNz20
         /MHJH5MqgL9P00g2367ECPfMZof1St5oxUZLXF+a5ZyduDqMASjzfiz/eOsIwcFmnSJ0
         vXyg==
X-Gm-Message-State: AOAM532Hteb2iyaY5MIhW2qTwb642mNrqNnidMUb6YfPA6VRdSSRXLq3
	e7ri4BP9bnKFzXg9An+jjTv/fw0gxz0ivV1oFpaCX1zdgM1N53yv
X-Google-Smtp-Source: ABdhPJy7WZJqCUAEIq1JyYGsfQIVxOaz3DjCOvZaQf++3Hq/L5dGdjeWiY9EWc8pYvFp7hHcMQdJCbKaOWN+sm3SvMI=
X-Received: by 2002:aa7:d757:: with SMTP id a23mr27782617eds.29.1628490305757;
 Sun, 08 Aug 2021 23:25:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210726034509.13131-1-sanakazisk19@gmail.com>
In-Reply-To: <20210726034509.13131-1-sanakazisk19@gmail.com>
From: "sana kazi" <sanakazisk19@gmail.com>
Date: Mon, 9 Aug 2021 11:54:54 +0530
Message-ID: <CAPxU0mucuKPp7kMUkeT1aX2Nq29ye0AmG6xHUO_H2qD1wPKtcQ@mail.gmail.com>
Subject: Re: [poky][master][PATCH] buildhistory.bbclass: Enable exporting more recipe and package data
To: Openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000031e2b405c91a72ee"

--00000000000031e2b405c91a72ee
Content-Type: text/plain; charset="UTF-8"

Hi,

Could you please review the patch for master branch to enable exporting
more recipe and package data?

Regards,
Sana Kazi

On Mon, 26 Jul 2021 at 09:15, Sana Kazi <sanakazisk19@gmail.com> wrote:

> From: Sana Kazi <Sana.Kazi@kpit.com>
>
> Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package
> data to the latest file of buildhistory and sorted it alphabetically.
>
> This makes extending data in buildhistory git tree simple and avoids
> patches to it for users who care about things like SRC_URI and like
> to track it in buildhistory git tree.
>
> Now we can add additional information as per our requirement to the
> buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory
> by appending them in a recipe or distro specific conf file as follows:
>
> BUILDHISTORY_EXPORT_RECIPE_VARIABLES += "MAINTAINER"
> BUILDHISTORY_EXPORT_PACKAGE_VARIABLES += "MAINTAINER"
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> ---
>  meta-poky/conf/distro/poky.conf   |   3 +
>  meta/classes/buildhistory.bbclass | 107 +++++++++++++++++++-----------
>  2 files changed, 71 insertions(+), 39 deletions(-)
>
> diff --git a/meta-poky/conf/distro/poky.conf
> b/meta-poky/conf/distro/poky.conf
> index 522cc92f74..2280e95569 100644
> --- a/meta-poky/conf/distro/poky.conf
> +++ b/meta-poky/conf/distro/poky.conf
> @@ -76,3 +76,6 @@ INHERIT += "reproducible_build"
>
>  BB_SIGNATURE_HANDLER ?= "OEEquivHash"
>  BB_HASHSERVE ??= "auto"
> +
> +BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?= "PR PV PE LAYER DEPENDS PACKAGES
> LICENSE SRC_URI CONFIG"
> +BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?= "PE PV PR PKG PKGE PKGV PKGR
> RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FILES
> FILELIST"
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 55b12d7893..9b1542643e 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -220,7 +220,6 @@ python buildhistory_emit_pkghistory() {
>      pv = d.getVar('PV')
>      pr = d.getVar('PR')
>      layer = bb.utils.get_file_layer(d.getVar('FILE'), d)
> -    license = d.getVar('LICENSE')
>
>      pkgdata_dir = d.getVar('PKGDATA_DIR')
>      packages = ""
> @@ -258,12 +257,11 @@ python buildhistory_emit_pkghistory() {
>      rcpinfo.pe = pe
>      rcpinfo.pv = pv
>      rcpinfo.pr = pr
> -    rcpinfo.depends = sortlist(oe.utils.squashspaces(d.getVar('DEPENDS')
> or ""))
>      rcpinfo.packages = packages
>      rcpinfo.layer = layer
> -    rcpinfo.license = license
>      rcpinfo.config =
> sortlist(oe.utils.squashspaces(d.getVar('PACKAGECONFIG') or ""))
> -    rcpinfo.src_uri = oe.utils.squashspaces(d.getVar('SRC_URI') or "")
> +    export_recipe_variables =
> d.getVar('BUILDHISTORY_EXPORT_RECIPE_VARIABLES') or ''
> +    rcpinfo.export_recipe_variables = export_recipe_variables
>      write_recipehistory(rcpinfo, d)
>
>      bb.build.exec_func("read_subpackage_metadata", d)
> @@ -317,6 +315,9 @@ python buildhistory_emit_pkghistory() {
>
>          pkginfo.size = int(localdata.getVar('PKGSIZE') or '0')
>
> +        export_package_variables =
> d.getVar('BUILDHISTORY_EXPORT_PACKAGE_VARIABLES') or ''
> +        pkginfo.export_package_variables = export_package_variables
> +
>          write_pkghistory(pkginfo, d)
>
>      # Create files-in-<package-name>.txt files containing a list of files
> of each recipe's package
> @@ -365,17 +366,22 @@ def write_recipehistory(rcpinfo, d):
>      pkghistdir = d.getVar('BUILDHISTORY_DIR_PACKAGE')
>
>      infofile = os.path.join(pkghistdir, "latest")
> +    export_recipe_variables = set(rcpinfo.export_recipe_variables.split())
> +    ret = []
>      with open(infofile, "w") as f:
> -        if rcpinfo.pe != "0":
> -            f.write(u"PE = %s\n" %  rcpinfo.pe)
> -        f.write(u"PV = %s\n" %  rcpinfo.pv)
> -        f.write(u"PR = %s\n" %  rcpinfo.pr)
> -        f.write(u"DEPENDS = %s\n" %  rcpinfo.depends)
> -        f.write(u"PACKAGES = %s\n" %  rcpinfo.packages)
> -        f.write(u"LAYER = %s\n" %  rcpinfo.layer)
> -        f.write(u"LICENSE = %s\n" %  rcpinfo.license)
> -        f.write(u"CONFIG = %s\n" %  rcpinfo.config)
> -        f.write(u"SRC_URI = %s\n" %  rcpinfo.src_uri)
> +        for var in export_recipe_variables:
> +            if var == "PE":
> +                if rcpinfo.pe != "0":
> +                    ret.append("%s = %s" % (var, rcpinfo.pe))
> +            elif var == "LAYER":
> +                ret.append("%s = %s" % (var, rcpinfo.layer))
> +            elif var == "CONFIG":
> +                ret.append("%s = %s" % (var, rcpinfo.config))
> +            else:
> +                ret.append("%s = %s" % (var,"
> ".join((str(d.getVar(var)).split()))))
> +        ret.sort()
> +        for element in ret:
> +            f.write(element + "\n")
>
>      write_latest_srcrev(d, pkghistdir)
>
> @@ -389,32 +395,55 @@ def write_pkghistory(pkginfo, d):
>          bb.utils.mkdirhier(pkgpath)
>
>      infofile = os.path.join(pkgpath, "latest")
> +    export_package_variables =
> set(pkginfo.export_package_variables.split())
> +    ret = []
>      with open(infofile, "w") as f:
> -        if pkginfo.pe != "0":
> -            f.write(u"PE = %s\n" %  pkginfo.pe)
> -        f.write(u"PV = %s\n" %  pkginfo.pv)
> -        f.write(u"PR = %s\n" %  pkginfo.pr)
> -
> -        if pkginfo.pkg != pkginfo.name:
> -            f.write(u"PKG = %s\n" % pkginfo.pkg)
> -        if pkginfo.pkge != pkginfo.pe:
> -            f.write(u"PKGE = %s\n" % pkginfo.pkge)
> -        if pkginfo.pkgv != pkginfo.pv:
> -            f.write(u"PKGV = %s\n" % pkginfo.pkgv)
> -        if pkginfo.pkgr != pkginfo.pr:
> -            f.write(u"PKGR = %s\n" % pkginfo.pkgr)
> -        f.write(u"RPROVIDES = %s\n" %  pkginfo.rprovides)
> -        f.write(u"RDEPENDS = %s\n" %  pkginfo.rdepends)
> -        f.write(u"RRECOMMENDS = %s\n" %  pkginfo.rrecommends)
> -        if pkginfo.rsuggests:
> -            f.write(u"RSUGGESTS = %s\n" %  pkginfo.rsuggests)
> -        if pkginfo.rreplaces:
> -            f.write(u"RREPLACES = %s\n" %  pkginfo.rreplaces)
> -        if pkginfo.rconflicts:
> -            f.write(u"RCONFLICTS = %s\n" %  pkginfo.rconflicts)
> -        f.write(u"PKGSIZE = %d\n" %  pkginfo.size)
> -        f.write(u"FILES = %s\n" %  pkginfo.files)
> -        f.write(u"FILELIST = %s\n" %  pkginfo.filelist)
> +        for var in export_package_variables:
> +            if var == "PE":
> +                if pkginfo.pe != "0":
> +                    ret.append("%s = %s" % (var, pkginfo.pe))
> +            elif var == "PV":
> +                ret.append("%s = %s" % (var, pkginfo.pv))
> +            elif var == "PR":
> +                ret.append("%s = %s" % (var, pkginfo.pr))
> +            elif var == "RPROVIDES":
> +                ret.append("%s = %s" % (var, pkginfo.rprovides))
> +            elif var == "RDEPENDS":
> +                ret.append("%s = %s" % (var, pkginfo.rdepends))
> +            elif var == "RRECOMMENDS":
> +                ret.append("%s = %s" % (var, pkginfo.rrecommends))
> +            elif var == "PKGSIZE":
> +                ret.append("%s = %s" % (var, pkginfo.size))
> +            elif var == "FILES":
> +                ret.append("%s = %s" % (var, pkginfo.files))
> +            elif var == "FILELIST":
> +                ret.append("%s = %s" % (var, pkginfo.filelist))
> +            elif var == "RSUGGESTS":
> +                if pkginfo.rsuggests:
> +                    ret.append(u"RSUGGESTS = %s" %  pkginfo.rsuggests)
> +            elif var == "RREPLACES":
> +                if pkginfo.rreplaces:
> +                    ret.append(u"RREPLACES = %s" %  pkginfo.rreplaces)
> +            elif var == "RCONFLICTS":
> +                if pkginfo.rconflicts:
> +                    ret.append(u"RCONFLICTS = %s" %  pkginfo.rconflicts)
> +            elif var == "PKG":
> +                if pkginfo.pkg != pkginfo.name:
> +                    ret.append(u"PKG = %s" % pkginfo.pkg)
> +            elif var == "PKGE":
> +                if pkginfo.pkge != pkginfo.pe :
> +                    ret.append(u"PKGE = %s" % pkginfo.pkge)
> +            elif var == "PKGV":
> +                if pkginfo.pkgv != pkginfo.pv:
> +                    ret.append(u"PKGV = %s" % pkginfo.pkgv)
> +            elif var == "PKGR":
> +                if pkginfo.pkgr != pkginfo.pr:
> +                    ret.append(u"PKGR = %s" % pkginfo.pkgr)
> +            else:
> +                ret.append("%s = %s" % (var, d.getVar(var)))
> +        ret.sort()
> +        for element in ret:
> +            f.write(element + "\n")
>
>      for filevar in pkginfo.filevars:
>          filevarpath = os.path.join(pkgpath, "latest.%s" % filevar)
> --
> 2.17.1
>
>

--00000000000031e2b405c91a72ee
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>Could you please review the patch f=
or master branch to=C2=A0enable exporting more recipe and package data?</di=
v><div><br></div><div>Regards,</div><div>Sana Kazi=C2=A0</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 26 Ju=
l 2021 at 09:15, Sana Kazi &lt;<a href=3D"mailto:sanakazisk19@gmail.com">sa=
nakazisk19@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">From: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.co=
m" target=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
<br>
Used BUILDHISTORY_EXPORT_RECIPE_VARIABLES and<br>
BUILDHISTORY_EXPORT_PACKAGE_VARIABLES to export recipe and package<br>
data to the latest file of buildhistory and sorted it alphabetically.<br>
<br>
This makes extending data in buildhistory git tree simple and avoids<br>
patches to it for users who care about things like SRC_URI and like<br>
to track it in buildhistory git tree.<br>
<br>
Now we can add additional information as per our requirement to the<br>
buildhistory like LICENSE, SRC_URI AND MAINTAINER to the buildhistory<br>
by appending them in a recipe or distro specific conf file as follows:<br>
<br>
BUILDHISTORY_EXPORT_RECIPE_VARIABLES +=3D &quot;MAINTAINER&quot;<br>
BUILDHISTORY_EXPORT_PACKAGE_VARIABLES +=3D &quot;MAINTAINER&quot;<br>
<br>
Signed-off-by: Sana Kazi &lt;<a href=3D"mailto:Sana.Kazi@kpit.com" target=
=3D"_blank">Sana.Kazi@kpit.com</a>&gt;<br>
---<br>
=C2=A0meta-poky/conf/distro/poky.conf=C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
=C2=A0meta/classes/buildhistory.bbclass | 107 +++++++++++++++++++----------=
-<br>
=C2=A02 files changed, 71 insertions(+), 39 deletions(-)<br>
<br>
diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.c=
onf<br>
index 522cc92f74..2280e95569 100644<br>
--- a/meta-poky/conf/distro/poky.conf<br>
+++ b/meta-poky/conf/distro/poky.conf<br>
@@ -76,3 +76,6 @@ INHERIT +=3D &quot;reproducible_build&quot;<br>
<br>
=C2=A0BB_SIGNATURE_HANDLER ?=3D &quot;OEEquivHash&quot;<br>
=C2=A0BB_HASHSERVE ??=3D &quot;auto&quot;<br>
+<br>
+BUILDHISTORY_EXPORT_RECIPE_VARIABLES ?=3D &quot;PR PV PE LAYER DEPENDS PAC=
KAGES LICENSE SRC_URI CONFIG&quot;<br>
+BUILDHISTORY_EXPORT_PACKAGE_VARIABLES ?=3D &quot;PE PV PR PKG PKGE PKGV PK=
GR RPROVIDES RDEPENDS RRECOMMENDS RSUGGESTS RREPLACES RCONFLICTS PKGSIZE FI=
LES FILELIST&quot;<br>
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass<br>
index 55b12d7893..9b1542643e 100644<br>
--- a/meta/classes/buildhistory.bbclass<br>
+++ b/meta/classes/buildhistory.bbclass<br>
@@ -220,7 +220,6 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0pv =3D d.getVar(&#39;PV&#39;)<br>
=C2=A0 =C2=A0 =C2=A0pr =3D d.getVar(&#39;PR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0layer =3D bb.utils.get_file_layer(d.getVar(&#39;FILE&#3=
9;), d)<br>
-=C2=A0 =C2=A0 license =3D d.getVar(&#39;LICENSE&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0pkgdata_dir =3D d.getVar(&#39;PKGDATA_DIR&#39;)<br>
=C2=A0 =C2=A0 =C2=A0packages =3D &quot;&quot;<br>
@@ -258,12 +257,11 @@ python buildhistory_emit_pkghistory() {<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://rcpinfo.pe" rel=3D"noreferrer" target=
=3D"_blank">rcpinfo.pe</a> =3D pe<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.pv =3D pv<br>
=C2=A0 =C2=A0 =C2=A0<a href=3D"http://rcpinfo.pr" rel=3D"noreferrer" target=
=3D"_blank">rcpinfo.pr</a> =3D pr<br>
-=C2=A0 =C2=A0 rcpinfo.depends =3D sortlist(oe.utils.squashspaces(d.getVar(=
&#39;DEPENDS&#39;) or &quot;&quot;))<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.packages =3D packages<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.layer =3D layer<br>
-=C2=A0 =C2=A0 rcpinfo.license =3D license<br>
=C2=A0 =C2=A0 =C2=A0rcpinfo.config =3D sortlist(oe.utils.squashspaces(d.get=
Var(&#39;PACKAGECONFIG&#39;) or &quot;&quot;))<br>
-=C2=A0 =C2=A0 rcpinfo.src_uri =3D oe.utils.squashspaces(d.getVar(&#39;SRC_=
URI&#39;) or &quot;&quot;)<br>
+=C2=A0 =C2=A0 export_recipe_variables =3D d.getVar(&#39;BUILDHISTORY_EXPOR=
T_RECIPE_VARIABLES&#39;) or &#39;&#39;<br>
+=C2=A0 =C2=A0 rcpinfo.export_recipe_variables =3D export_recipe_variables<=
br>
=C2=A0 =C2=A0 =C2=A0write_recipehistory(rcpinfo, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;read_subpackage_metadata&quot;=
, d)<br>
@@ -317,6 +315,9 @@ python buildhistory_emit_pkghistory() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pkginfo.size =3D int(localdata.getVar(&#3=
9;PKGSIZE&#39;) or &#39;0&#39;)<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 export_package_variables =3D d.getVar(&#39;BUI=
LDHISTORY_EXPORT_PACKAGE_VARIABLES&#39;) or &#39;&#39;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 pkginfo.export_package_variables =3D export_pa=
ckage_variables<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_pkghistory(pkginfo, d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0# Create files-in-&lt;package-name&gt;.txt files contai=
ning a list of files of each recipe&#39;s package<br>
@@ -365,17 +366,22 @@ def write_recipehistory(rcpinfo, d):<br>
=C2=A0 =C2=A0 =C2=A0pkghistdir =3D d.getVar(&#39;BUILDHISTORY_DIR_PACKAGE&#=
39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0infofile =3D os.path.join(pkghistdir, &quot;latest&quot=
;)<br>
+=C2=A0 =C2=A0 export_recipe_variables =3D set(rcpinfo.export_recipe_variab=
les.split())<br>
+=C2=A0 =C2=A0 ret =3D []<br>
=C2=A0 =C2=A0 =C2=A0with open(infofile, &quot;w&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://rcpinfo.pe" rel=3D"norefe=
rrer" target=3D"_blank">rcpinfo.pe</a> !=3D &quot;0&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PE =3D %s\n&quot;=
 %=C2=A0 <a href=3D"http://rcpinfo.pe" rel=3D"noreferrer" target=3D"_blank"=
>rcpinfo.pe</a>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PV =3D %s\n&quot; %=C2=A0 rcpin=
fo.pv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PR =3D %s\n&quot; %=C2=A0 <a hr=
ef=3D"http://rcpinfo.pr" rel=3D"noreferrer" target=3D"_blank">rcpinfo.pr</a=
>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;DEPENDS =3D %s\n&quot; %=C2=A0 =
rcpinfo.depends)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PACKAGES =3D %s\n&quot; %=C2=A0=
 rcpinfo.packages)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;LAYER =3D %s\n&quot; %=C2=A0 rc=
pinfo.layer)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;LICENSE =3D %s\n&quot; %=C2=A0 =
rcpinfo.license)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;CONFIG =3D %s\n&quot; %=C2=A0 r=
cpinfo.config)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;SRC_URI =3D %s\n&quot; %=C2=A0 =
rcpinfo.src_uri)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in export_recipe_variables:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if var =3D=3D &quot;PE&quot;:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http=
://rcpinfo.pe" rel=3D"noreferrer" target=3D"_blank">rcpinfo.pe</a> !=3D &qu=
ot;0&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(&quot;%s =3D %s&quot; % (var, <a href=3D"http://rcpinfo.pe" rel=3D"n=
oreferrer" target=3D"_blank">rcpinfo.pe</a>))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;LAYER&quot=
;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, rcpinfo.layer))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;CONFIG&quo=
t;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, rcpinfo.config))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var,&quot; &quot;.join((str(d.getVar(var)).split()))))<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.sort()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for element in ret:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(element + &quot;\n&quot;=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0write_latest_srcrev(d, pkghistdir)<br>
<br>
@@ -389,32 +395,55 @@ def write_pkghistory(pkginfo, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(pkgpath)<br>
<br>
=C2=A0 =C2=A0 =C2=A0infofile =3D os.path.join(pkgpath, &quot;latest&quot;)<=
br>
+=C2=A0 =C2=A0 export_package_variables =3D set(pkginfo.export_package_vari=
ables.split())<br>
+=C2=A0 =C2=A0 ret =3D []<br>
=C2=A0 =C2=A0 =C2=A0with open(infofile, &quot;w&quot;) as f:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http://pkginfo.pe" rel=3D"norefe=
rrer" target=3D"_blank">pkginfo.pe</a> !=3D &quot;0&quot;:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PE =3D %s\n&quot;=
 %=C2=A0 <a href=3D"http://pkginfo.pe" rel=3D"noreferrer" target=3D"_blank"=
>pkginfo.pe</a>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PV =3D %s\n&quot; %=C2=A0 pkgin=
fo.pv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PR =3D %s\n&quot; %=C2=A0 <a hr=
ef=3D"http://pkginfo.pr" rel=3D"noreferrer" target=3D"_blank">pkginfo.pr</a=
>)<br>
-<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkg !=3D <a href=3D"http://pkginfo.=
name" rel=3D"noreferrer" target=3D"_blank">pkginfo.name</a>:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKG =3D %s\n&quot=
; % pkginfo.pkg)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkge !=3D <a href=3D"http://pkginfo=
.pe" rel=3D"noreferrer" target=3D"_blank">pkginfo.pe</a>:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGE =3D %s\n&quo=
t; % pkginfo.pkge)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkgv !=3D pkginfo.pv:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGV =3D %s\n&quo=
t; % pkginfo.pkgv)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkgr !=3D <a href=3D"http://pkginfo=
.pr" rel=3D"noreferrer" target=3D"_blank">pkginfo.pr</a>:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGR =3D %s\n&quo=
t; % pkginfo.pkgr)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RPROVIDES =3D %s\n&quot; %=C2=
=A0 pkginfo.rprovides)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RDEPENDS =3D %s\n&quot; %=C2=A0=
 pkginfo.rdepends)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RRECOMMENDS =3D %s\n&quot; %=C2=
=A0 pkginfo.rrecommends)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rsuggests:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RSUGGESTS =3D %s\=
n&quot; %=C2=A0 pkginfo.rsuggests)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rreplaces:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RREPLACES =3D %s\=
n&quot; %=C2=A0 pkginfo.rreplaces)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rconflicts:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;RCONFLICTS =3D %s=
\n&quot; %=C2=A0 pkginfo.rconflicts)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;PKGSIZE =3D %d\n&quot; %=C2=A0 =
pkginfo.size)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;FILES =3D %s\n&quot; %=C2=A0 pk=
ginfo.files)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(u&quot;FILELIST =3D %s\n&quot; %=C2=A0=
 pkginfo.filelist)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for var in export_package_variables:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if var =3D=3D &quot;PE&quot;:<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if <a href=3D"http=
://pkginfo.pe" rel=3D"noreferrer" target=3D"_blank">pkginfo.pe</a> !=3D &qu=
ot;0&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(&quot;%s =3D %s&quot; % (var, <a href=3D"http://pkginfo.pe" rel=3D"n=
oreferrer" target=3D"_blank">pkginfo.pe</a>))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PV&quot;:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, pkginfo.pv))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PR&quot;:<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, <a href=3D"http://pkginfo.pr" rel=3D"noreferrer" tar=
get=3D"_blank">pkginfo.pr</a>))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RPROVIDES&=
quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, pkginfo.rprovides))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RDEPENDS&q=
uot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, pkginfo.rdepends))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RRECOMMEND=
S&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, pkginfo.rrecommends))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGSIZE&qu=
ot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, pkginfo.size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;FILES&quot=
;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, pkginfo.files))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;FILELIST&q=
uot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, pkginfo.filelist))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RSUGGESTS&=
quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rsugges=
ts:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(u&quot;RSUGGESTS =3D %s&quot; %=C2=A0 pkginfo.rsuggests)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RREPLACES&=
quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rreplac=
es:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(u&quot;RREPLACES =3D %s&quot; %=C2=A0 pkginfo.rreplaces)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;RCONFLICTS=
&quot;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.rconfli=
cts:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(u&quot;RCONFLICTS =3D %s&quot; %=C2=A0 pkginfo.rconflicts)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKG&quot;:=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkg !=
=3D <a href=3D"http://pkginfo.name" rel=3D"noreferrer" target=3D"_blank">pk=
ginfo.name</a>:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(u&quot;PKG =3D %s&quot; % pkginfo.pkg)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGE&quot;=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkge !=
=3D <a href=3D"http://pkginfo.pe" rel=3D"noreferrer" target=3D"_blank">pkgi=
nfo.pe</a> :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(u&quot;PKGE =3D %s&quot; % pkginfo.pkge)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGV&quot;=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkgv !=
=3D pkginfo.pv:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(u&quot;PKGV =3D %s&quot; % pkginfo.pkgv)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 elif var =3D=3D &quot;PKGR&quot;=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if pkginfo.pkgr !=
=3D <a href=3D"http://pkginfo.pr" rel=3D"noreferrer" target=3D"_blank">pkgi=
nfo.pr</a>:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.=
append(u&quot;PKGR =3D %s&quot; % pkginfo.pkgr)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.append(&quot;%=
s =3D %s&quot; % (var, d.getVar(var)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret.sort()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for element in ret:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 f.write(element + &quot;\n&quot;=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0for filevar in pkginfo.filevars:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0filevarpath =3D os.path.join(pkgpath, &qu=
ot;latest.%s&quot; % filevar)<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div>

--00000000000031e2b405c91a72ee--
