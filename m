Return-Path: <jpewhacker@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 75AFC60213
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 13:15:18 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g1so9902642wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Feb 2020 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=TQb6xlAE2Pd/+lgEsAduNMwkUxA4HlMzUGrMIh7U9ck=;
	b=WbaBMPFwwF5xHlPuDFyUwPsk00stu6iu4miF2gb5zRwXnVzkZ9HfkStaOjVlnX0alT
	xSI8DDZQlTrEaCwbTN/U5NDelDgiIp2PBjduewIWPNiygx/v+hyRPf1TQljjlwzXXYZF
	iRRH0qpuaellT/QpIPs/ERE1b1Ymxs8Cl9rdbJ8W8G7DC6R7ik9+kyXvnCA2b0Tmh4VS
	vW6w+ccKeueqnxG+2U2DkTOToA/A0EPbACMT+/Y8JRYITiRh8iSd2tf5RJQ+/5nbNsgE
	8Vg+ukvOLjbchTUrt9vkwut+X1iHsPjXQONp6yY3kyboLVMv3EVvZw6LX2uvwOvbyWRT
	W0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=TQb6xlAE2Pd/+lgEsAduNMwkUxA4HlMzUGrMIh7U9ck=;
	b=jud+iW3EbbvaCfPkzX+nHOx1oFJfAmdDOP8Okds9ZGaU+dJargxwTjZTvWurDqmKsz
	uRYkdznabQgTMrwy8tC/E7kLasQUctDH/SmLrawIHP7XclkxxXez6lPOmXWkaR3c2yoz
	YrciOWsfigPAOffsxfLPeRqnHxhgAC9jOHn/RhIssaPacWCUFkXvCuhA/Fz1e8Ynix2W
	PHfLFIWWK8YFDfV/Iy12fbYbXKfv66CZKQKsEU3ifsWjSHlFVQBrJyXOnCgCWQ7P9WVe
	gRia67Yhe2sULbyoViaGwMYreEcXXMutxyTjDDu/1Wb3wyFL5T4r7nxvvx6BLhCm5fA0
	FOCg==
X-Gm-Message-State: APjAAAX1H6RZkFJ9AXYZon5i2T3UvBs5r2ubIK6sXYmK5GmJkuG4kLX3
	DlJUVshA5MnWr7qYrS5QZthqZxD03+UYzFGWy8w=
X-Google-Smtp-Source: APXvYqy6hZ2EB/qJYQYovb804h+TrfH+pwyjvUi3MzNawlgHJBUq42brnigtvD0d43t2ZYuGiwSBWaRm2EfNeTBueHc=
X-Received: by 2002:a1c:9ad6:: with SMTP id c205mr4597456wme.78.1581686119046; 
	Fri, 14 Feb 2020 05:15:19 -0800 (PST)
MIME-Version: 1.0
References: <20200212031435.792802-1-JPEWhacker@gmail.com>
	<20200212031435.792802-4-JPEWhacker@gmail.com>
	<CAMKF1srqz+B9YEHCvMcsZRiWa5AvjD7H-ef7pQjd8baWsHWNAQ@mail.gmail.com>
In-Reply-To: <CAMKF1srqz+B9YEHCvMcsZRiWa5AvjD7H-ef7pQjd8baWsHWNAQ@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 14 Feb 2020 07:15:06 -0600
Message-ID: <CAJdd5Gb565Y-9GhHSb9JJZgPijd_zBCbAgBNSRHQ3U=YsX65eA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] recipes-support: Add diffoscope recipe
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
X-List-Received-Date: Fri, 14 Feb 2020 13:15:18 -0000
Content-Type: multipart/alternative; boundary="00000000000045a31c059e88ff62"

--00000000000045a31c059e88ff62
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020, 12:34 AM Khem Raj <raj.khem@gmail.com> wrote:

> Hi Joshua
>
> I think it needs to be ignored on musl
>
> 15:37:23 ERROR: Nothing RPROVIDES 'squashfs-tools' (but
>
> /mnt/jenkins/workspace/Yocto-world-musl/sources/openembedded-core/meta/recipes-support/diffoscope/
> diffoscope_136.bb
> RDEPENDS on or otherwise requires it)
> 15:37:23 squashfs-tools was skipped: incompatible with host
> aarch64-yoe-linux-musl (not in COMPATIBLE_HOST
>

Would an RRECOMMENDS fix it?


> On Tue, Feb 11, 2020 at 7:15 PM Joshua Watt <jpewhacker@gmail.com> wrote:
> >
> > Diffoscope is the universal diff tool, capable of comparing many
> > different formats.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  meta/conf/distro/include/maintainers.inc          |  1 +
> >  meta/recipes-support/diffoscope/diffoscope_136.bb | 15 +++++++++++++++
> >  2 files changed, 16 insertions(+)
> >  create mode 100644 meta/recipes-support/diffoscope/diffoscope_136.bb
> >
> > diff --git a/meta/conf/distro/include/maintainers.inc
> b/meta/conf/distro/include/maintainers.inc
> > index 171a43615e3..4a267faabce 100644
> > --- a/meta/conf/distro/include/maintainers.inc
> > +++ b/meta/conf/distro/include/maintainers.inc
> > @@ -146,6 +146,7 @@ RECIPE_MAINTAINER_pn-dejagnu = "Nathan Rossi <
> nathan@nathanrossi.com>"
> >  RECIPE_MAINTAINER_pn-depmodwrapper-cross = "Mark Hatle <
> mark.hatle@windriver.com>"
> >  RECIPE_MAINTAINER_pn-desktop-file-utils = "Alexander Kanavin <
> alex.kanavin@gmail.com>"
> >  RECIPE_MAINTAINER_pn-dhcp = "Hongxu Jia <hongxu.jia@windriver.com>"
> > +RECIPE_MAINTAINER_pn-diffoscope = "Joshua Watt <JPEWhacker@gmail.com>"
> >  RECIPE_MAINTAINER_pn-diffstat = "Chen Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER_pn-diffutils = "Chen Qi <Qi.Chen@windriver.com>"
> >  RECIPE_MAINTAINER_pn-distcc = "Hongxu Jia <hongxu.jia@windriver.com>"
> > diff --git a/meta/recipes-support/diffoscope/diffoscope_136.bb
> b/meta/recipes-support/diffoscope/diffoscope_136.bb
> > new file mode 100644
> > index 00000000000..a00f281deb0
> > --- /dev/null
> > +++ b/meta/recipes-support/diffoscope/diffoscope_136.bb
> > @@ -0,0 +1,15 @@
> > +SUMMARY = "in-depth comparison of files, archives, and directories"
> > +HOMEPAGE = "https://diffoscope.org/"
> > +LICENSE = "GPL-3.0+"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> > +
> > +PYPI_PACKAGE = "diffoscope"
> > +
> > +inherit pypi setuptools3
> > +
> > +SRC_URI[md5sum] = "c84d8d308a40176ba2f5dc4abdbf6f73"
> > +SRC_URI[sha256sum] =
> "0d6486d6eb6e0445ba21fee2e8bdd3a366ce786bfac98e00e5a95038b7815f15"
> > +
> > +RDEPENDS_${PN} += "binutils vim squashfs-tools python3-libarchive-c
> python3-magic"
> > +
> > +BBCLASSEXTEND = "native"
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--00000000000045a31c059e88ff62
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri, Feb 14, 2020, 12:34 AM Khem Raj &lt;<a href=3D=
"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">Hi Joshua<br>
<br>
I think it needs to be ignored on musl<br>
<br>
15:37:23 ERROR: Nothing RPROVIDES &#39;squashfs-tools&#39; (but<br>
/mnt/jenkins/workspace/Yocto-world-musl/sources/openembedded-core/meta/reci=
pes-support/diffoscope/<a href=3D"http://diffoscope_136.bb" rel=3D"noreferr=
er noreferrer" target=3D"_blank">diffoscope_136.bb</a><br>
RDEPENDS on or otherwise requires it)<br>
15:37:23 squashfs-tools was skipped: incompatible with host<br>
aarch64-yoe-linux-musl (not in COMPATIBLE_HOST<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Would an RRECOMMENDS fix it?<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">
<br>
On Tue, Feb 11, 2020 at 7:15 PM Joshua Watt &lt;<a href=3D"mailto:jpewhacke=
r@gmail.com" target=3D"_blank" rel=3D"noreferrer">jpewhacker@gmail.com</a>&=
gt; wrote:<br>
&gt;<br>
&gt; Diffoscope is the universal diff tool, capable of comparing many<br>
&gt; different formats.<br>
&gt;<br>
&gt; Signed-off-by: Joshua Watt &lt;<a href=3D"mailto:JPEWhacker@gmail.com"=
 target=3D"_blank" rel=3D"noreferrer">JPEWhacker@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/maintainers.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 meta/recipes-support/diffoscope/<a href=3D"http://diffoscope_136=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">diffoscope_136.bb</a> =
| 15 +++++++++++++++<br>
&gt;=C2=A0 2 files changed, 16 insertions(+)<br>
&gt;=C2=A0 create mode 100644 meta/recipes-support/diffoscope/<a href=3D"ht=
tp://diffoscope_136.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">dif=
foscope_136.bb</a><br>
&gt;<br>
&gt; diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/dist=
ro/include/maintainers.inc<br>
&gt; index 171a43615e3..4a267faabce 100644<br>
&gt; --- a/meta/conf/distro/include/maintainers.inc<br>
&gt; +++ b/meta/conf/distro/include/maintainers.inc<br>
&gt; @@ -146,6 +146,7 @@ RECIPE_MAINTAINER_pn-dejagnu =3D &quot;Nathan Ross=
i &lt;<a href=3D"mailto:nathan@nathanrossi.com" target=3D"_blank" rel=3D"no=
referrer">nathan@nathanrossi.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-depmodwrapper-cross =3D &quot;Mark Hatle &l=
t;<a href=3D"mailto:mark.hatle@windriver.com" target=3D"_blank" rel=3D"nore=
ferrer">mark.hatle@windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-desktop-file-utils =3D &quot;Alexander Kana=
vin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank" rel=3D"=
noreferrer">alex.kanavin@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-dhcp =3D &quot;Hongxu Jia &lt;<a href=3D"ma=
ilto:hongxu.jia@windriver.com" target=3D"_blank" rel=3D"noreferrer">hongxu.=
jia@windriver.com</a>&gt;&quot;<br>
&gt; +RECIPE_MAINTAINER_pn-diffoscope =3D &quot;Joshua Watt &lt;<a href=3D"=
mailto:JPEWhacker@gmail.com" target=3D"_blank" rel=3D"noreferrer">JPEWhacke=
r@gmail.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-diffstat =3D &quot;Chen Qi &lt;<a href=3D"m=
ailto:Qi.Chen@windriver.com" target=3D"_blank" rel=3D"noreferrer">Qi.Chen@w=
indriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-diffutils =3D &quot;Chen Qi &lt;<a href=3D"=
mailto:Qi.Chen@windriver.com" target=3D"_blank" rel=3D"noreferrer">Qi.Chen@=
windriver.com</a>&gt;&quot;<br>
&gt;=C2=A0 RECIPE_MAINTAINER_pn-distcc =3D &quot;Hongxu Jia &lt;<a href=3D"=
mailto:hongxu.jia@windriver.com" target=3D"_blank" rel=3D"noreferrer">hongx=
u.jia@windriver.com</a>&gt;&quot;<br>
&gt; diff --git a/meta/recipes-support/diffoscope/<a href=3D"http://diffosc=
ope_136.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">diffoscope_136.=
bb</a> b/meta/recipes-support/diffoscope/<a href=3D"http://diffoscope_136.b=
b" rel=3D"noreferrer noreferrer" target=3D"_blank">diffoscope_136.bb</a><br=
>
&gt; new file mode 100644<br>
&gt; index 00000000000..a00f281deb0<br>
&gt; --- /dev/null<br>
&gt; +++ b/meta/recipes-support/diffoscope/<a href=3D"http://diffoscope_136=
.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">diffoscope_136.bb</a><=
br>
&gt; @@ -0,0 +1,15 @@<br>
&gt; +SUMMARY =3D &quot;in-depth comparison of files, archives, and directo=
ries&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"https://diffoscope.org/" rel=3D"norefer=
rer noreferrer" target=3D"_blank">https://diffoscope.org/</a>&quot;<br>
&gt; +LICENSE =3D &quot;GPL-3.0+&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd32239bcb673463ab874e=
80d47fae504&quot;<br>
&gt; +<br>
&gt; +PYPI_PACKAGE =3D &quot;diffoscope&quot;<br>
&gt; +<br>
&gt; +inherit pypi setuptools3<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;c84d8d308a40176ba2f5dc4abdbf6f73&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;0d6486d6eb6e0445ba21fee2e8bdd3a366ce786b=
fac98e00e5a95038b7815f15&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} +=3D &quot;binutils vim squashfs-tools python3-libarch=
ive-c python3-magic&quot;<br>
&gt; +<br>
&gt; +BBCLASSEXTEND =3D &quot;native&quot;<br>
&gt; --<br>
&gt; 2.23.0<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank" rel=3D"noreferrer">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer noreferrer" target=3D"_blank">http://lists.openemb=
edded.org/mailman/listinfo/openembedded-core</a><br>
</blockquote></div></div></div>

--00000000000045a31c059e88ff62--
