Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
 by mx.groups.io with SMTP id smtpd.web10.5983.1593172356147025386
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2020 04:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SOYtiTpE;
 spf=pass (domain: gmail.com, ip: 209.85.218.66, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f66.google.com with SMTP id y10so9102537eje.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2020 04:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gomCVPuiMMDBU0kNn1UweeJB2Y1xHGc3rA0b0gVZtJM=;
        b=SOYtiTpEDLgLMIxd8EA6SeLrhSQytINMlgljjng8tFFq50gBBw9PWDNwtyX8XjiKib
         uj0NZyfDWYbgnuxxYCwh+vo1PxNtoEcbASrcGC3Q2paItHZzgbveE+PVoMRgkJJ+eIee
         0097trw2qA+uhl8+nMSFHOKCEPSS9l4OpiNFi/264p20iydOtr9l8OtHPYi05dlfHaTV
         sYtO6ucgD7696J9DXRhm4KvjfKwMivbU0YdAvEMsbNCk82m9Lzo0zMf+94QP3aZ39ae6
         7Kro/5LTAv03tGqn6QuJK71np87q22ENpub+hGFitXfAmA15udV7Vvrv2JnQ7BFzmR0P
         KjKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gomCVPuiMMDBU0kNn1UweeJB2Y1xHGc3rA0b0gVZtJM=;
        b=NhzaCsuoeC2WP9cfMBTBXdKcb5DF4oMhWa+Mimx1uUHcBXKW4h6gbKK8OGh41/Mpsf
         2xWSgk28nc9gBJWdQCZOzmwC7VZKPCWSBWbw3a3Z+lxJ9pIRRYh4jA+i/JOVJNBr8nZT
         xMhUDyx3FiEcq/hcJCeaopvTcfVNFFHjiNXRh3R0IBHZ/Tsd8W/YEIP6C8KxCIrCepzM
         Xesitee4hv03hf9hMt5PKheuQVm+RVjGG5qhGhw4O0MpDZtuDo+o5NmpsGuCsp8ccUkc
         +2Yb1v9ZJWwe07SjFvTEWRcYLy3PfPgDsKS1vnMV0Y07JUJR6VMetlf3S1urkksn9c/u
         U1Ww==
X-Gm-Message-State: AOAM532c6ayYmLvSfujmET55ChjEGZ1j+v9MlMCVJh4rL+UzhID6MFE5
	zbNgJjfO9fOliIWx1dApeTFq1hynd+tQGc7xH78=
X-Google-Smtp-Source: ABdhPJyJJ3b8j72Mt8+gop3E7pE7b2PRPgTzp9QHMn4LwxwULDSw+6Jxk1NjWkBlojU3eU7QZIYNziaGa7FmiSYVWf8=
X-Received: by 2002:a17:906:5fc4:: with SMTP id k4mr2176782ejv.94.1593172354505;
 Fri, 26 Jun 2020 04:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200622141915.31932-1-akuster808@gmail.com> <20200622141915.31932-2-akuster808@gmail.com>
In-Reply-To: <20200622141915.31932-2-akuster808@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Fri, 26 Jun 2020 13:52:23 +0200
Message-ID: <CA+chaQcyFpghZzAAASfwL+-u7mcZfuqNy_NYodyyxZdYEhmk5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/6] libuv: move from meta-oe to core for bind update
To: akuster <akuster808@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Armin Kuster <akuster@mvista.com>
Content-Type: multipart/alternative; boundary="00000000000041afbc05a8fb5800"

--00000000000041afbc05a8fb5800
Content-Type: text/plain; charset="UTF-8"

Looks like 1.34.2 was imported from meta-oe, but there was 1.38.0 version
(as removed in
https://git.openembedded.org/meta-openembedded/commit/?id=4413f4cb70a5a4cf11c2f9c1881c4506860c588c)
causing downgrade as shown by QA checks like:
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA
Issue: Package version for package libuv-src went backwards which would
break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
[version-going-backwards]
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA
Issue: Package version for package libuv-dbg went backwards which would
break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
[version-going-backwards]
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA
Issue: Package version for package libuv-staticdev went backwards which
would break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
[version-going-backwards]
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA
Issue: Package version for package libuv-dev went backwards which would
break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
[version-going-backwards]
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA
Issue: Package version for package libuv-doc went backwards which would
break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
[version-going-backwards]
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA
Issue: Package version for package libuv-locale went backwards which would
break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)
[version-going-backwards]
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA
Issue: Package version for package libuv went backwards which would break
package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]

these 3 meta-oe commits are now missing in oe-core:
https://git.openembedded.org/meta-openembedded/commit/?id=e03b48481438c747322f07ac1e1f04add541ffac
https://git.openembedded.org/meta-openembedded/commit/?id=9b61f412d36b390f8d71ad1fb5875f5f6e32fd8a
https://git.openembedded.org/meta-openembedded/commit/?id=644ea1ee145902b00e4e66856ebe8d8800dfc1f0

On Mon, Jun 22, 2020 at 4:19 PM akuster <akuster808@gmail.com> wrote:

> From: Armin Kuster <akuster@mvista.com>
>
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../libuv/libuv_1.34.2.bb                     | 19 +++++++++++++++++++
>  2 files changed, 20 insertions(+)
>  create mode 100644 meta/recipes-connectivity/libuv/libuv_1.34.2.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> index 6496a48e40..fc1b5272da 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -393,6 +393,7 @@ RECIPE_MAINTAINER_pn-liburcu = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-liburi-perl = "Tim Orling <
> timothy.t.orling@linux.intel.com>"
>  RECIPE_MAINTAINER_pn-libusb1 = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-libubootenv = "Stefano Babic <sbabic@denx.de>"
> +RECIPE_MAINTAINER_pn-libuv = "Armin Kuster <akuster@mvista.com>"
>  RECIPE_MAINTAINER_pn-libva = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-libva-initial = "Anuj Mittal <anuj.mittal@intel.com
> >"
>  RECIPE_MAINTAINER_pn-libva-utils = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
> b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
> new file mode 100644
> index 0000000000..234cec37bb
> --- /dev/null
> +++ b/meta/recipes-connectivity/libuv/libuv_1.34.2.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "A multi-platform support library with a focus on asynchronous
> I/O"
> +HOMEPAGE = "https://github.com/libuv/libuv"
> +BUGTRACKER = "https://github.com/libuv/libuv/issues"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=a68902a430e32200263d182d44924d47"
> +
> +SRCREV = "f868c9ab0c307525a16fff99fd21e32a6ebc3837"
> +SRC_URI = "git://github.com/libuv/libuv;branch=v1.x"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure() {
> +    ${S}/autogen.sh || bbnote "${PN} failed to autogen.sh"
> +    oe_runconf
> +}
> +
> +BBCLASSEXTEND = "native"
> --
> 2.17.1
>
> 
>

--00000000000041afbc05a8fb5800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Looks like 1.34.2 was imported=C2=A0from meta-oe, but ther=
e was 1.38.0 version (as removed in=C2=A0<a href=3D"https://git.openembedde=
d.org/meta-openembedded/commit/?id=3D4413f4cb70a5a4cf11c2f9c1881c4506860c58=
8c">https://git.openembedded.org/meta-openembedded/commit/?id=3D4413f4cb70a=
5a4cf11c2f9c1881c4506860c588c</a>) causing downgrade as shown by QA checks =
like:<div><span style=3D"color:rgb(33,33,33);font-family:&quot;Segoe UI&quo=
t;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;fo=
nt-size:13.3333px">log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packa=
gedata_setscene: QA Issue: Package version for package libuv-src went backw=
ards which would break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0) [ver=
sion-going-backwards]</span><br style=3D"color:rgb(33,33,33);font-family:&q=
uot;Segoe UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Ari=
al,sans-serif;font-size:13.3333px"><span style=3D"color:rgb(33,33,33);font-=
family:&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,T=
ahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR:=
 libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package version for pac=
kage libuv-dbg went backwards which would break package feeds (from 0:1.38.=
0-r0 to 0:1.34.2-r0) [version-going-backwards]</span><br style=3D"color:rgb=
(33,33,33);font-family:&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,&quot;Sego=
e UI WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px"><span style=3D"=
color:rgb(33,33,33);font-family:&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,&=
quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.wo=
rld-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA Issue=
: Package version for package libuv-staticdev went backwards which would br=
eak package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backward=
s]</span><br style=3D"color:rgb(33,33,33);font-family:&quot;Segoe UI&quot;,=
&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;font-=
size:13.3333px"><span style=3D"color:rgb(33,33,33);font-family:&quot;Segoe =
UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-se=
rif;font-size:13.3333px">log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do=
_packagedata_setscene: QA Issue: Package version for package libuv-dev went=
 backwards which would break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0=
) [version-going-backwards]</span><br style=3D"color:rgb(33,33,33);font-fam=
ily:&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Taho=
ma,Arial,sans-serif;font-size:13.3333px"><span style=3D"color:rgb(33,33,33)=
;font-family:&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&q=
uot;,Tahoma,Arial,sans-serif;font-size:13.3333px">log.world-all.qemux86-64:=
ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA Issue: Package version f=
or package libuv-doc went backwards which would break package feeds (from 0=
:1.38.0-r0 to 0:1.34.2-r0) [version-going-backwards]</span><br style=3D"col=
or:rgb(33,33,33);font-family:&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,&quo=
t;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px"><span sty=
le=3D"color:rgb(33,33,33);font-family:&quot;Segoe UI&quot;,&quot;Segoe WP&q=
uot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px">=
log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0 do_packagedata_setscene: QA=
 Issue: Package version for package libuv-locale went backwards which would=
 break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0) [version-going-backw=
ards]</span><br style=3D"color:rgb(33,33,33);font-family:&quot;Segoe UI&quo=
t;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;fo=
nt-size:13.3333px"><span style=3D"color:rgb(33,33,33);font-family:&quot;Seg=
oe UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans=
-serif;font-size:13.3333px">log.world-all.qemux86-64:ERROR: libuv-1.34.2-r0=
 do_packagedata_setscene: QA Issue: Package version for package libuv went =
backwards which would break package feeds (from 0:1.38.0-r0 to 0:1.34.2-r0)=
 [version-going-backwards]</span><br></div><div><span style=3D"color:rgb(33=
,33,33);font-family:&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,&quot;Segoe U=
I WPC&quot;,Tahoma,Arial,sans-serif;font-size:13.3333px"><br></span></div><=
div><span style=3D"color:rgb(33,33,33);font-family:&quot;Segoe UI&quot;,&qu=
ot;Segoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;font-siz=
e:13.3333px">these 3 meta-oe commits are now missing in oe-core:</span></di=
v><div><a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=
=3De03b48481438c747322f07ac1e1f04add541ffac">https://git.openembedded.org/=
meta-openembedded/commit/?id=3De03b48481438c747322f07ac1e1f04add541ffac</a>=
<span style=3D"color:rgb(33,33,33);font-family:&quot;Segoe UI&quot;,&quot;S=
egoe WP&quot;,&quot;Segoe UI WPC&quot;,Tahoma,Arial,sans-serif;font-size:13=
.3333px"><br></span></div><div><a href=3D"https://git.openembedded.org/meta=
-openembedded/commit/?id=3D9b61f412d36b390f8d71ad1fb5875f5f6e32fd8a">https:=
//git.openembedded.org/meta-openembedded/commit/?id=3D9b61f412d36b390f8d71a=
d1fb5875f5f6e32fd8a</a><br></div><div><a href=3D"https://git.openembedded.o=
rg/meta-openembedded/commit/?id=3D644ea1ee145902b00e4e66856ebe8d8800dfc1f0"=
>https://git.openembedded.org/meta-openembedded/commit/?id=3D644ea1ee145902=
b00e4e66856ebe8d8800dfc1f0</a><br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 22, 2020 at 4:19 PM aku=
ster &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: =
Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" target=3D"_blank">ak=
uster@mvista.com</a>&gt;<br>
<br>
Signed-off-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com" targ=
et=3D"_blank">akuster@mvista.com</a>&gt;<br>
---<br>
=C2=A0meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 |=C2=A0=
 1 +<br>
=C2=A0.../libuv/<a href=3D"http://libuv_1.34.2.bb" rel=3D"noreferrer" targ=
et=3D"_blank">libuv_1.34.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 +++++++++++++++++++<br>
=C2=A02 files changed, 20 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-connectivity/libuv/<a href=3D"http:/=
/libuv_1.34.2.bb" rel=3D"noreferrer" target=3D"_blank">libuv_1.34.2.bb</a><=
br>
<br>
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/i=
nclude/maintainers.inc<br>
index 6496a48e40..fc1b5272da 100644<br>
--- a/meta/conf/distro/include/maintainers.inc<br>
+++ b/meta/conf/distro/include/maintainers.inc<br>
@@ -393,6 +393,7 @@ RECIPE_MAINTAINER_pn-liburcu =3D &quot;Alexander Kanav=
in &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kan=
avin@gmail.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-liburi-perl =3D &quot;Tim Orling &lt;<a href=3D=
"mailto:timothy.t.orling@linux.intel.com" target=3D"_blank">timothy.t.orlin=
g@linux.intel.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libusb1 =3D &quot;Anuj Mittal &lt;<a href=3D"ma=
ilto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;=
&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libubootenv =3D &quot;Stefano Babic &lt;<a href=
=
=3D"mailto:sbabic@denx.de" target=3D"_blank">sbabic@denx.de</a>&gt;&quot;<=
br>
+RECIPE_MAINTAINER_pn-libuv =3D &quot;Armin Kuster &lt;<a href=3D"mailto:a=
kuster@mvista.com" target=3D"_blank">akuster@mvista.com</a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libva =3D &quot;Anuj Mittal &lt;<a href=3D"mail=
to:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;&q=
uot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libva-initial =3D &quot;Anuj Mittal &lt;<a href=
=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com<=
/a>&gt;&quot;<br>
=C2=A0RECIPE_MAINTAINER_pn-libva-utils =3D &quot;Anuj Mittal &lt;<a href=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com<=
/a>&gt;&quot;<br>
diff --git a/meta/recipes-connectivity/libuv/<a href=3D"http://libuv_1.34.=
2.bb" rel=3D"noreferrer" target=3D"_blank">libuv_1.34.2.bb</a> b/meta/recip=
es-connectivity/libuv/<a href=3D"http://libuv_1.34.2.bb" rel=3D"noreferrer"=
 target=3D"_blank">libuv_1.34.2.bb</a><br>
new file mode 100644<br>
index 0000000000..234cec37bb<br>
--- /dev/null<br>
+++ b/meta/recipes-connectivity/libuv/<a href=3D"http://libuv_1.34.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libuv_1.34.2.bb</a><br>
@@ -0,0 +1,19 @@<br>
+SUMMARY =3D &quot;A multi-platform support library with a focus on asynch=
ronous I/O&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"https://github.com/libuv/libuv" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/libuv/libuv</a>&quot;<br>
+BUGTRACKER =3D &quot;<a href=3D"https://github.com/libuv/libuv/issues" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/libuv/libuv/issues</a=
>&quot;<br>
+LICENSE =3D &quot;MIT&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Da68902a430e32200263d182d4=
4924d47&quot;<br>
+<br>
+SRCREV =3D &quot;f868c9ab0c307525a16fff99fd21e32a6ebc3837&quot;<br>
+SRC_URI =3D &quot;git://<a href=3D"http://github.com/libuv/libuv;branch=
=3Dv1.x" rel=3D"noreferrer" target=3D"_blank">github.com/libuv/libuv;branc=
h=3Dv1.x</a>&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+inherit autotools<br>
+<br>
+do_configure() {<br>
+=C2=A0 =C2=A0 ${S}/autogen.sh || bbnote &quot;${PN} failed to autogen.sh&=
quot;<br>
+=C2=A0 =C2=A0 oe_runconf<br>
+}<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
-- <br>
2.17.1<br>
<br>
<br>
</blockquote></div>

--00000000000041afbc05a8fb5800--
