Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id E9F7F60116
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2020 10:32:04 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id e10so10615110edv.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2020 02:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RoCtzUTyEzhzT6kGUNYBG9jBjazhN77M31hdR8pStbE=;
	b=vDIsSDCgwyQmJNV7fgMNjU5EsQCxvbJAUzvREI0t52TiypNmZmjJvGlDpcPDtr7gqi
	9zq/1QFEkrdUpCa44rVsqnixbGS9mJzhi00w1U9SztZ65MwDryuDxMDpbxCn4qBKTIBr
	/3Fl20DYxdp/D+U1P6C416e2Q8PTT13bjGY27y4QNae/J5WdXBNzYDpywpilXMhWrF+W
	AXv+NZ3bZcAvSz4fdpDXO1zvuk4T+ykabHBBYJrbdrdoG/NPgCF6NroA23BAvwkPXdHN
	rbtxfq/woybtRVxTTJsFTNWVn08yo2zTcJn9ScJeY49uxFLZAfiwYjaXGFHxywpMqLuH
	xGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RoCtzUTyEzhzT6kGUNYBG9jBjazhN77M31hdR8pStbE=;
	b=TJLGMBeC09wHk0y3GBHv2VjEurvSOYzUSfcjxEJYaQ9pPeQLxpfdQ4WQ7il2e5GSnZ
	wMJ8Hg9jXEiV4mYmpgDieWatmvWcxJuxloq2ms4VWgwMS5hxl69B1/yTQLT59eyOISYN
	sIw9eaJzSgDxXGUVgY8gPix0kO+YohPNKaYX1i2XvIqpwe5h2WHXf4fj0VxGseZ0QtgJ
	7UTkkrsB33Fg+sxYbhl2UdfCYACCU+Y2A5kQVdwOmfzswKzpAOWk4f1ccmQk2S8wkMRD
	fRqqfY0lmEwKfBpYvF7vX0KeE86xF9xz7HxQtEP4+EDQ5h2vZ7c/FlDnvNzhwXP60dgx
	4RMw==
X-Gm-Message-State: APjAAAXctlBesCrs/swz+0mQ5yGb/+fgQQZ5DLpF4DS1iIavGO0hLLYH
	74Hp5QqqrsVdarHB9+iIieonSppab59gG4IhuL8=
X-Google-Smtp-Source: APXvYqxILT7sU9f/tLKfaQIW+w+qZURWAeE2ksbiKI81jXc+ABH67hDCxa+Rb6XZ5RYFy7i5urjhjgSfhc9Oxjc/V9s=
X-Received: by 2002:aa7:c1d8:: with SMTP id d24mr4215948edp.388.1580553125104; 
	Sat, 01 Feb 2020 02:32:05 -0800 (PST)
MIME-Version: 1.0
References: <20200106091806.49129-1-tanuk@iki.fi>
	<20200106091806.49129-3-tanuk@iki.fi>
	<CAP71WjyMNKJJ0CFzVaVRx0T4rffN0dWJQ-JfJEk7iKHPFegEpA@mail.gmail.com>
	<5259176251b3dcbf2c0600bb343b8484c4bdb53c.camel@iki.fi>
In-Reply-To: <5259176251b3dcbf2c0600bb343b8484c4bdb53c.camel@iki.fi>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 1 Feb 2020 11:31:54 +0100
Message-ID: <CA+chaQc8ak9FNc=JxvVxL-w3z5u1ukPifRBfjUL4+WwO9GWw9Q@mail.gmail.com>
To: Tanu Kaskinen <tanuk@iki.fi>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/5] alsa-ucm-conf: new recipe, version 1.2.1.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 01 Feb 2020 10:32:05 -0000
Content-Type: multipart/alternative; boundary="000000000000920e14059d8133c0"

--000000000000920e14059d8133c0
Content-Type: text/plain; charset="UTF-8"

In LuneOS we have .bbappend in distro layer adding the UCM files for
MACHINEs we support.

It's not nice, but before this recipe we were adding the same in alsa-lib
bbappend, so it's not worse than before for sure.

BSP layer with .bbappend is a bit worse, because including BSP layer
shouldn't change anything for other MACHINEs. For UCM it's on edge, because
if the files are added correctly, then there won't be any change in
behavior for other MACHINEs in practise, but still people won't be happy
from even alsa-ucm-conf being rebuilt just by adding BSP layer to
bblayers.conf. (In theory distro layers shouldn't influence anything when
their supported DISTRO isn't selected as well, but this rule is much less
enforced, because often it doesn't make much sense to include the distro
layer without using that DISTRO - unlike BSP where multiple BSP layers will
be included just to sequentially build the images for various MACHINEs in
the same build directory).

Maybe nobody replied, because there isn't really good way how to handle
this :/.

On Sat, Feb 1, 2020 at 9:21 AM Tanu Kaskinen <tanuk@iki.fi> wrote:

> On Thu, 2020-01-30 at 15:01 +0100, Nicolas Dechesne wrote:
> > hey,
> >
> > On Mon, Jan 6, 2020 at 10:18 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > The UCM configuration files were moved from the alsa-lib repository to
> a
> > > new alsa-ucm-conf repository. The move was accompanied by a license
> > > change from LGPL2.1 to BSD-3-Clause.
> > >
> > > Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
> > > ---
> > >  meta/conf/distro/include/maintainers.inc      |  1 +
> > >  .../alsa/alsa-lib_1.2.1.2.bb                  |  2 +-
> > >  .../alsa/alsa-ucm-conf_1.2.1.2.bb             | 23
> +++++++++++++++++++
> > >  3 files changed, 25 insertions(+), 1 deletion(-)
> > >  create mode 100644 meta/recipes-multimedia/alsa/
> alsa-ucm-conf_1.2.1.2.bb
> > >
> > > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > > index 39eee9475c..c9fb373f52 100644
> > > --- a/meta/conf/distro/include/maintainers.inc
> > > +++ b/meta/conf/distro/include/maintainers.inc
> > > @@ -35,6 +35,7 @@ RECIPE_MAINTAINER_pn-alsa-lib = "Tanu Kaskinen <
> tanuk@iki.fi>"
> > >  RECIPE_MAINTAINER_pn-alsa-plugins = "Tanu Kaskinen <tanuk@iki.fi>"
> > >  RECIPE_MAINTAINER_pn-alsa-state = "Tanu Kaskinen <tanuk@iki.fi>"
> > >  RECIPE_MAINTAINER_pn-alsa-tools = "Tanu Kaskinen <tanuk@iki.fi>"
> > > +RECIPE_MAINTAINER_pn-alsa-ucm-conf = "Tanu Kaskinen <tanuk@iki.fi>"
> > >  RECIPE_MAINTAINER_pn-alsa-utils = "Tanu Kaskinen <tanuk@iki.fi>"
> > >  RECIPE_MAINTAINER_pn-alsa-utils-scripts = "Tanu Kaskinen <
> tanuk@iki.fi>"
> > >  RECIPE_MAINTAINER_pn-apmd = "Anuj Mittal <anuj.mittal@intel.com>"
> > > diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > > index 9565ad1b20..7bc78b8523 100644
> > > --- a/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > > +++ b/meta/recipes-multimedia/alsa/alsa-lib_1.2.1.2.bb
> > > @@ -33,7 +33,7 @@ FILES_alsa-server = "${bindir}/*"
> > >  FILES_alsa-conf = "${datadir}/alsa/"
> > >  FILES_libatopology = "${libdir}/libatopology.so.*"
> > >
> > > -RDEPENDS_${PN}_class-target = "alsa-conf"
> > > +RDEPENDS_${PN}_class-target = "alsa-conf alsa-ucm-conf"
> > >
> > >  # upgrade path
> > >  RPROVIDES_${PN} = "libasound"
> > > diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> > > new file mode 100644
> > > index 0000000000..469d1f7a95
> > > --- /dev/null
> > > +++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.1.2.bb
> > > @@ -0,0 +1,23 @@
> > > +SUMMARY = "ALSA Use Case Manager configuration"
> > > +HOMEPAGE = "https://alsa-project.org"
> > > +BUGTRACKER = "https://alsa-project.org/wiki/Bug_Tracking"
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM =
> "file://LICENSE;md5=20d74d74db9741697903372ad001d3b4"
> > > +
> > > +# The tarball doesn't have any toplevel directory. The subdir option
> tells
> > > +# Bitbake to unpack the archive to the correct place.
> > > +SRC_URI = "
> https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=${BP}"
> > > +SRC_URI[md5sum] = "b7fa43cfd79df978184a6333766d2a50"
> > > +SRC_URI[sha256sum] =
> "ea8a86875f4cf430d49a662a04a6d6c606c5c9d67e54cb944c4d77b24554062f"
> > > +
> > > +inherit allarch
> >
> > it's a bit late into the game.. but I have some questions about this
> > patch. now that the alsa-ucm-conf are allarch, how do we expect a BSP
> > layer to provide its own UCM config files? if i add a .bbappend file,
> > I can't change PACKAGE_ARCH to be 'machine' specific. If i create a
> > new recipe for my custom UCM files, then it's not obvious when I
> > should install them, since we need them only if alsa-ucm-conf is
> > installed in the first place..
> >
> > I was thinking about adding an empty alsa-ucm-machine-conf recipe that
> > BSP could append,  like gpsd, e.g.:
> >
> http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb
> >
> > Is that a good idea?
>
> I was hoping someone else would answer this, since I have no experience
> with BSPs or .bbappend files... Since I don't know how this *should* be
> done, I'm not against creating alsa-ucm-machine-conf. However, my
> intuition would be that the BSP installs its configuration as a
> separate recipe whenever the BSP is used. I don't see the need to have
> conditions such as "install only if alsa-ucm-conf is installed". Is it
> just to save disk space? alsa-ucm-conf anyway installs a bunch of files
> that aren't relevant to most machines, so if you're worried about UCM
> disk consumption, the alsa-ucm-conf recipe would need work to somehow
> install only those files that are needed by the current machine.
>
> Another approach that would make sense to me (even more than creating a
> separate recipe) is to submit your UCM config to ALSA upstream. While
> waiting for the change to get accepted to upstream and then later
> incorporated in the main alsa-ucm-conf recipe, you could use .bbappend
> to add the configuration to the alsa-ucm-conf recipe as a patch.
>
> --
> Tanu
>
> https://www.patreon.com/tanuk
> https://liberapay.com/tanuk
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000920e14059d8133c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">In LuneOS we have .bbappend in distro layer adding the UCM=
 files for MACHINEs we support.<div><br></div><div>It&#39;s not nice, but b=
efore this recipe we were adding the same in alsa-lib bbappend, so it&#39;s=
 not worse than before for sure.</div><div><br></div><div>BSP layer with .b=
bappend is a bit worse, because including BSP layer shouldn&#39;t change an=
ything for other MACHINEs. For UCM it&#39;s on edge, because if the files a=
re added correctly, then there won&#39;t be any change in behavior for othe=
r MACHINEs in practise, but still people won&#39;t be happy from even alsa-=
ucm-conf being rebuilt just by adding BSP layer to bblayers.conf. (In theor=
y distro layers shouldn&#39;t influence anything when their supported DISTR=
O isn&#39;t selected as well, but this rule is much less enforced, because =
often it doesn&#39;t make much sense to include the distro layer without us=
ing that DISTRO - unlike BSP where multiple BSP layers will be included jus=
t to sequentially build the images for various MACHINEs in the same build d=
irectory).</div><div><br></div><div>Maybe nobody replied, because there isn=
&#39;t really good way how to handle this :/.</div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Feb 1, 2020 at 9=
:21 AM Tanu Kaskinen &lt;<a href=3D"mailto:tanuk@iki.fi">tanuk@iki.fi</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu=
, 2020-01-30 at 15:01 +0100, Nicolas Dechesne wrote:<br>
&gt; hey,<br>
&gt; <br>
&gt; On Mon, Jan 6, 2020 at 10:18 AM Tanu Kaskinen &lt;<a href=3D"mailto:ta=
nuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt; wrote:<br>
&gt; &gt; The UCM configuration files were moved from the alsa-lib reposito=
ry to a<br>
&gt; &gt; new alsa-ucm-conf repository. The move was accompanied by a licen=
se<br>
&gt; &gt; change from LGPL2.1 to BSD-3-Clause.<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Tanu Kaskinen &lt;<a href=3D"mailto:tanuk@iki.fi" =
target=3D"_blank">tanuk@iki.fi</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 1 +<br>
&gt; &gt;=C2=A0 .../alsa/<a href=3D"http://alsa-lib_1.2.1.2.bb" rel=3D"nore=
ferrer" target=3D"_blank">alsa-lib_1.2.1.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 2 +-<br>
&gt; &gt;=C2=A0 .../alsa/<a href=3D"http://alsa-ucm-conf_1.2.1.2.bb" rel=3D=
"noreferrer" target=3D"_blank">alsa-ucm-conf_1.2.1.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 3 files changed, 25 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-multimedia/alsa/<a href=3D"=
http://alsa-ucm-conf_1.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-=
ucm-conf_1.2.1.2.bb</a><br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf=
/distro/include/maintainers.inc<br>
&gt; &gt; index 39eee9475c..c9fb373f52 100644<br>
&gt; &gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; &gt; @@ -35,6 +35,7 @@ RECIPE_MAINTAINER_pn-alsa-lib =3D &quot;Tanu Ka=
skinen &lt;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</=
a>&gt;&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER_pn-alsa-plugins =3D &quot;Tanu Kaskinen &=
lt;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;&q=
uot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER_pn-alsa-state =3D &quot;Tanu Kaskinen &lt=
;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;&quo=
t;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER_pn-alsa-tools =3D &quot;Tanu Kaskinen &lt=
;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;&quo=
t;<br>
&gt; &gt; +RECIPE_MAINTAINER_pn-alsa-ucm-conf =3D &quot;Tanu Kaskinen &lt;<=
a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;&quot;=
<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER_pn-alsa-utils =3D &quot;Tanu Kaskinen &lt=
;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>&gt;&quo=
t;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER_pn-alsa-utils-scripts =3D &quot;Tanu Kask=
inen &lt;<a href=3D"mailto:tanuk@iki.fi" target=3D"_blank">tanuk@iki.fi</a>=
&gt;&quot;<br>
&gt; &gt;=C2=A0 RECIPE_MAINTAINER_pn-apmd =3D &quot;Anuj Mittal &lt;<a href=
=3D"mailto:anuj.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</=
a>&gt;&quot;<br>
&gt; &gt; diff --git a/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-=
lib_1.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.2.bb</a=
> b/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.2.1.2.bb" rel=
=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.2.bb</a><br>
&gt; &gt; index 9565ad1b20..7bc78b8523 100644<br>
&gt; &gt; --- a/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.2=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.2.bb</a><br>
&gt; &gt; +++ b/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-lib_1.2=
.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-lib_1.2.1.2.bb</a><br>
&gt; &gt; @@ -33,7 +33,7 @@ FILES_alsa-server =3D &quot;${bindir}/*&quot;<b=
r>
&gt; &gt;=C2=A0 FILES_alsa-conf =3D &quot;${datadir}/alsa/&quot;<br>
&gt; &gt;=C2=A0 FILES_libatopology =3D &quot;${libdir}/libatopology.so.*&qu=
ot;<br>
&gt; &gt; <br>
&gt; &gt; -RDEPENDS_${PN}_class-target =3D &quot;alsa-conf&quot;<br>
&gt; &gt; +RDEPENDS_${PN}_class-target =3D &quot;alsa-conf alsa-ucm-conf&qu=
ot;<br>
&gt; &gt; <br>
&gt; &gt;=C2=A0 # upgrade path<br>
&gt; &gt;=C2=A0 RPROVIDES_${PN} =3D &quot;libasound&quot;<br>
&gt; &gt; diff --git a/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-=
ucm-conf_1.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-ucm-conf_1.2=
.1.2.bb</a> b/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-ucm-conf_=
1.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-ucm-conf_1.2.1.2.bb</=
a><br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..469d1f7a95<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-multimedia/alsa/<a href=3D"http://alsa-ucm-con=
f_1.2.1.2.bb" rel=3D"noreferrer" target=3D"_blank">alsa-ucm-conf_1.2.1.2.bb=
</a><br>
&gt; &gt; @@ -0,0 +1,23 @@<br>
&gt; &gt; +SUMMARY =3D &quot;ALSA Use Case Manager configuration&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://alsa-project.org" rel=3D"n=
oreferrer" target=3D"_blank">https://alsa-project.org</a>&quot;<br>
&gt; &gt; +BUGTRACKER =3D &quot;<a href=3D"https://alsa-project.org/wiki/Bu=
g_Tracking" rel=3D"noreferrer" target=3D"_blank">https://alsa-project.org/w=
iki/Bug_Tracking</a>&quot;<br>
&gt; &gt; +LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3D20d74d74db974169=
7903372ad001d3b4&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +# The tarball doesn&#39;t have any toplevel directory. The subdi=
r option tells<br>
&gt; &gt; +# Bitbake to unpack the archive to the correct place.<br>
&gt; &gt; +SRC_URI =3D &quot;<a href=3D"https://www.alsa-project.org/files/=
pub/lib/$%7BBP%7D.tar.bz2;subdir=3D$%7BBP%7D" rel=3D"noreferrer" target=3D"=
_blank">https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2;subdir=3D$=
{BP}</a>&quot;<br>
&gt; &gt; +SRC_URI[md5sum] =3D &quot;b7fa43cfd79df978184a6333766d2a50&quot;=
<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;ea8a86875f4cf430d49a662a04a6d6c606c=
5c9d67e54cb944c4d77b24554062f&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +inherit allarch<br>
&gt; <br>
&gt; it&#39;s a bit late into the game.. but I have some questions about th=
is<br>
&gt; patch. now that the alsa-ucm-conf are allarch, how do we expect a BSP<=
br>
&gt; layer to provide its own UCM config files? if i add a .bbappend file,<=
br>
&gt; I can&#39;t change PACKAGE_ARCH to be &#39;machine&#39; specific. If i=
 create a<br>
&gt; new recipe for my custom UCM files, then it&#39;s not obvious when I<b=
r>
&gt; should install them, since we need them only if alsa-ucm-conf is<br>
&gt; installed in the first place..<br>
&gt; <br>
&gt; I was thinking about adding an empty alsa-ucm-machine-conf recipe that=
<br>
&gt; BSP could append,=C2=A0 like gpsd, e.g.:<br>
&gt; <a href=3D"http://git.openembedded.org/meta-openembedded/tree/meta-oe/=
recipes-navigation/gpsd/gpsd-machine-conf_1.0.bb" rel=3D"noreferrer" target=
=3D"_blank">http://git.openembedded.org/meta-openembedded/tree/meta-oe/reci=
pes-navigation/gpsd/gpsd-machine-conf_1.0.bb</a><br>
&gt; <br>
&gt; Is that a good idea?<br>
<br>
I was hoping someone else would answer this, since I have no experience<br>
with BSPs or .bbappend files... Since I don&#39;t know how this *should* be=
<br>
done, I&#39;m not against creating alsa-ucm-machine-conf. However, my<br>
intuition would be that the BSP installs its configuration as a<br>
separate recipe whenever the BSP is used. I don&#39;t see the need to have<=
br>
conditions such as &quot;install only if alsa-ucm-conf is installed&quot;. =
Is it<br>
just to save disk space? alsa-ucm-conf anyway installs a bunch of files<br>
that aren&#39;t relevant to most machines, so if you&#39;re worried about U=
CM<br>
disk consumption, the alsa-ucm-conf recipe would need work to somehow<br>
install only those files that are needed by the current machine.<br>
<br>
Another approach that would make sense to me (even more than creating a<br>
separate recipe) is to submit your UCM config to ALSA upstream. While<br>
waiting for the change to get accepted to upstream and then later<br>
incorporated in the main alsa-ucm-conf recipe, you could use .bbappend<br>
to add the configuration to the alsa-ucm-conf recipe as a patch.<br>
<br>
-- <br>
Tanu<br>
<br>
<a href=3D"https://www.patreon.com/tanuk" rel=3D"noreferrer" target=3D"_bla=
nk">https://www.patreon.com/tanuk</a><br>
<a href=3D"https://liberapay.com/tanuk" rel=3D"noreferrer" target=3D"_blank=
">https://liberapay.com/tanuk</a><br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000920e14059d8133c0--
