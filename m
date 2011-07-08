Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Qf4vu-00061N-J5
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 08:53:02 +0200
Received: by yxi19 with SMTP id 19so736305yxi.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 23:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=72RbkGlo2xixKQ9c6+33AFwjoSIQG2xbOTWLZcgj2Us=;
	b=wQQzx9PySWMW53DaX/cItAWFtIzslXfnkkJQwQFr8zFEow1o3jTGv/nFhjyO6N9jj+
	n8v1Q/2weMEi7N/UNyCWRwUc0JaACI4YcSlGf8lAQ+R7a6D1lEPlhOuuItlBtD/Pw17d
	zsItbn3+pdHEf/ll+oT5dw1ebzdVlpVOQ5Sr8=
MIME-Version: 1.0
Received: by 10.91.56.10 with SMTP id i10mr1766490agk.9.1310107747696; Thu, 07
	Jul 2011 23:49:07 -0700 (PDT)
Received: by 10.91.220.7 with HTTP; Thu, 7 Jul 2011 23:49:07 -0700 (PDT)
In-Reply-To: <cover.1310081443.git.sgw@linux.intel.com>
References: <cover.1310081443.git.sgw@linux.intel.com>
Date: Fri, 8 Jul 2011 08:49:07 +0200
Message-ID: <CACW_hTYVtGGGFcpQ1=50ARjX5Efmj8sxPGnBCWwpToANhfMAWw@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Bug Fixes for M2 Rc2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Jul 2011 06:53:03 -0000
Content-Type: multipart/alternative; boundary=001485f92bcaeb41a804a7893a0d

--001485f92bcaeb41a804a7893a0d
Content-Type: text/plain; charset=ISO-8859-1

2011/7/8 Saul Wold <sgw@linux.intel.com>

> Richard,
>
> This address the bash, xcb missing from libx11, locale issue and
> the lack of space due to zypper eating space.
>

I don't think all the dependencies on bash are needed.

E.g:  eglibc: Add RDEPENDS on bash
eglibc itself does not need bash to be present at runtime (or maybe only in
some eglibc configurations).
I am currently happily running an eglibc system with busybox sh without any
problem at all.
Footprintwise for embedded systems that is desirable and as such it is quite
a common setup.

Frans.



>
> Sau!
>
>
> The following changes since commit
> f1fc6d084b079dea21ff1a30b815496452042490:
>
>  pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)
>
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib sgw/fix
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix
>
> Saul Wold (8):
>  rootfs_rpm: Add 50Meg to image size for zypper
>  image.bbclass: add LINGUAS_INSTALL to depends list
>  gnome-doc-utils: Add RDEPENDS on bash
>  quilt: Add RDEPENDS on bash
>  console-tools: Add RDEPENDS on bash
>  usbutils: Add RDEPENDS on bash
>  eglibc: Add RDEPENDS on bash
>  libx11: enable xcb support
>
>  meta/classes/image.bbclass                         |    2 +-
>  meta/classes/image_types.bbclass                   |    2 +-
>  meta/classes/rootfs_rpm.bbclass                    |    5 +++++
>  meta/recipes-bsp/usbutils/usbutils_0.91.bb         |    5 +++--
>  .../console-tools/console-tools_0.3.2.bb           |    3 ++-
>  meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
>  meta/recipes-core/eglibc/eglibc.inc                |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
>  meta/recipes-core/eglibc/eglibc_2.13.bb            |    2 +-
>  meta/recipes-devtools/quilt/quilt.inc              |    2 ++
>  meta/recipes-devtools/quilt/quilt_0.48.bb          |    2 +-
>  meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 ++
>  meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
>  meta/recipes-graphics/xorg-lib/libx11_1.3.4.bb     |   11 ++++++++---
>  14 files changed, 30 insertions(+), 14 deletions(-)
>
> --
> 1.7.3.4
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--001485f92bcaeb41a804a7893a0d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">2011/7/8 Saul Wold <span dir=3D"ltr">&lt=
;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a>&gt;</span><=
br><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; bo=
rder-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
Richard,<br>
<br>
This address the bash, xcb missing from libx11, locale issue and<br>
the lack of space due to zypper eating space.<br></blockquote><div><br>I do=
n&#39;t think all the dependencies on bash are needed.<br><br>E.g:=A0 eglib=
c: Add RDEPENDS on bash<br>eglibc itself does not need bash to be present a=
t runtime (or maybe only in some eglibc configurations).<br>
I am currently happily running an eglibc system with busybox sh without any=
 problem at all.<br>Footprintwise for embedded systems that is desirable an=
d as such it is quite a common setup.<br><br>Frans.<br><br>=A0<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.8ex; border-l=
eft: 1px solid rgb(204, 204, 204); padding-left: 1ex;">

<br>
Sau!<br>
<br>
<br>
The following changes since commit f1fc6d084b079dea21ff1a30b815496452042490=
:<br>
<br>
 =A0pulseaudio: add 0.9.23 (2011-07-07 13:44:36 +0100)<br>
<br>
are available in the git repository at:<br>
 =A0git://<a href=3D"http://git.openembedded.org/openembedded-core-contrib"=
 target=3D"_blank">git.openembedded.org/openembedded-core-contrib</a> sgw/f=
ix<br>
 =A0<a href=3D"http://cgit.openembedded.org/cgit.cgi/openembedded-core-cont=
rib/log/?h=3Dsgw/fix" target=3D"_blank">http://cgit.openembedded.org/cgit.c=
gi/openembedded-core-contrib/log/?h=3Dsgw/fix</a><br>
<br>
Saul Wold (8):<br>
 =A0rootfs_rpm: Add 50Meg to image size for zypper<br>
 =A0image.bbclass: add LINGUAS_INSTALL to depends list<br>
 =A0gnome-doc-utils: Add RDEPENDS on bash<br>
 =A0quilt: Add RDEPENDS on bash<br>
 =A0console-tools: Add RDEPENDS on bash<br>
 =A0usbutils: Add RDEPENDS on bash<br>
 =A0eglibc: Add RDEPENDS on bash<br>
 =A0libx11: enable xcb support<br>
<br>
=A0meta/classes/image.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A02 +-<br>
=A0meta/classes/image_types.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-<br>
=A0meta/classes/rootfs_rpm.bbclass =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A05 +++++<br>
=A0meta/recipes-bsp/usbutils/<a href=3D"http://usbutils_0.91.bb" target=3D"=
_blank">usbutils_0.91.bb</a> =A0 =A0 =A0 =A0 | =A0 =A05 +++--<br>
=A0.../console-tools/<a href=3D"http://console-tools_0.3.2.bb" target=3D"_b=
lank">console-tools_0.3.2.bb</a> =A0 =A0 =A0 =A0 =A0 | =A0 =A03 ++-<br>
=A0meta/recipes-core/eglibc/eglibc-package.inc =A0 =A0 =A0 =A0| =A0 =A02 +-=
<br>
=A0meta/recipes-core/eglibc/eglibc.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-<br>
=A0meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.12.bb" target=3D"_bl=
ank">eglibc_2.12.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>
=A0meta/recipes-core/eglibc/<a href=3D"http://eglibc_2.13.bb" target=3D"_bl=
ank">eglibc_2.13.bb</a> =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>
=A0meta/recipes-devtools/quilt/quilt.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 ++<br>
=A0meta/recipes-devtools/quilt/<a href=3D"http://quilt_0.48.bb" target=3D"_=
blank">quilt_0.48.bb</a> =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>
=A0meta/recipes-gnome/gnome/gnome-doc-utils.inc =A0 =A0 =A0 | =A0 =A02 ++<b=
r>
=A0meta/recipes-gnome/gnome/<a href=3D"http://gnome-doc-utils_0.20.6.bb" ta=
rget=3D"_blank">gnome-doc-utils_0.20.6.bb</a> | =A0 =A02 +-<br>
=A0meta/recipes-graphics/xorg-lib/<a href=3D"http://libx11_1.3.4.bb" target=
=3D"_blank">libx11_1.3.4.bb</a> =A0 =A0 | =A0 11 ++++++++---<br>
=A014 files changed, 30 insertions(+), 14 deletions(-)<br>
<font color=3D"#888888"><br>
--<br>
1.7.3.4<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></blockquote></div><br>

--001485f92bcaeb41a804a7893a0d--
