Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id CF1C6786BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 14:58:42 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id u62so16510984ita.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 06:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=24BfktHDKrT41Z3KvqI6dktLxuXva1zt5dy6KE4mlwU=;
	b=I96GQkC3i1pri3eCdjKv+9+DHEoprfwVe+w2nGFEnwlCScXoG+GdM7aIQqJsnrZOu9
	8XDRpE5ujNqiYvWT4r//WHCfOob0LAmjptvJqz7UdFOYd1AYA69OnamE2+pjjQ8fGhoJ
	ewq3qwa956fK5seR1+bXDEcSgnr0eV8m4LHMmNPfBSCOCx26dimGJsKQD5Agu7lNW/rt
	SGKv5Tu20T7qJftd6xKanjDweQK4dCZXC+RRjHqnI9FT0N6ItylVL0tP03P64pWFzzsz
	oUVw1vzFOrM8chpD3mnHUkaBwfuHttWzqjkEFVRt6isptXSUKfYbTBbBVN+fhfd37EPM
	4X4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=24BfktHDKrT41Z3KvqI6dktLxuXva1zt5dy6KE4mlwU=;
	b=duCUtdpWakg1MoWTk5uxl1oz+JzwWO9U9KoXsVhJmtKi+Xu6dKU5ZAg5f1qmR9IXFw
	nSs3iQT8pSdLEv1Fyj0eR7shXGyDozQEBTmNY2Cmq2+4xw+JIFk06yD/N8m505R27/ZT
	czAK/n66jqieTqYNNSDpapSydf9oBzmscYiSKRt8xjqSzyKuL+RRrTPU0D/Pt3weKdG9
	f1zgkjw1atu4wiIvLe+HGQ/zlYfB0WBKNWLSYzbEARPwC6H7RyPOhrb2zWjMMoU1Bw6Y
	9drMUvnLmdcNduCiWipc+pvPc0W7LNgvIlzkQ7dJzOqQ2K+HXYyLzfrtBlNgedsmzY0N
	6w0Q==
X-Gm-Message-State: AKGB3mIRJnW6zbrdIKOBZ2G9REIIcvW5+h/tYJCJbPkD+tOOHEddlKqR
	ndZ9HJLH3q5AGDPzLfnQH815IczneqYtAMfvuRO84w==
X-Google-Smtp-Source: ACJfBouMdb5fDxzsustZiZsAF3vFdbp1ga8ORWeCAFC+QwIa+Zk/qGGHYb/558DG6AD05/POAr4hZXYFxqOeQ+qioGg=
X-Received: by 10.107.146.195 with SMTP id u186mr881415iod.37.1513004323857;
	Mon, 11 Dec 2017 06:58:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Mon, 11 Dec 2017 06:58:23 -0800 (PST)
In-Reply-To: <1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
	<1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Dec 2017 14:58:23 +0000
Message-ID: <CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] waf.bbclass: explicitly pass libdir
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
X-List-Received-Date: Mon, 11 Dec 2017 14:58:43 -0000
Content-Type: multipart/alternative; boundary="94eb2c0553b2448604056011c5bd"

--94eb2c0553b2448604056011c5bd
Content-Type: text/plain; charset="UTF-8"

On 11 December 2017 at 14:16, Stefan Agner <stefan@agner.ch> wrote:

> Hm, isn't this a "base" option which is always supported?


No idea. :)


> There are a bunch of others. But most seem to derive from PREFIX, which
> we set...
>
>   Installation prefix:
>
>     By default, "waf install" will put the files in "/usr/local/bin",
> "/usr/local/lib" etc. An installation prefix other than
>     "/usr/local" can be given using "--prefix", for example
> "--prefix=$HOME"
>
>
>
>     --prefix=PREFIX     installation prefix [default: '/usr/local/']
>     --destdir=DESTDIR   installation root [default: '']
>     --exec-prefix=EXEC_PREFIX
>                         installation prefix for binaries [PREFIX]
>
>   Installation directories:
>     --bindir=BINDIR     user commands [EXEC_PREFIX/bin]
>     --sbindir=SBINDIR   system binaries [EXEC_PREFIX/sbin]
>     --libexecdir=LIBEXECDIR
>                         program-specific binaries [EXEC_PREFIX/libexec]
>
>     --sysconfdir=SYSCONFDIR
>                         host-specific configuration [PREFIX/etc]
>     --sharedstatedir=SHAREDSTATEDIR
>                         architecture-independent variable data
> [PREFIX/com]
>
>     --localstatedir=LOCALSTATEDIR
>                         variable data [PREFIX/var]
>     --libdir=LIBDIR     object code libraries [EXEC_PREFIX/lib64]
>     --includedir=INCLUDEDIR
>                         header files [PREFIX/include]
>     --oldincludedir=OLDINCLUDEDIR
>                         header files for non-GCC compilers
> [/usr/include]
>
>     --datarootdir=DATAROOTDIR
>                         architecture-independent data root
> [PREFIX/share]
>
>     --datadir=DATADIR   architecture-independent data [DATAROOTDIR]
>     --infodir=INFODIR   GNU "info" documentation [DATAROOTDIR/info]
>     --localedir=LOCALEDIR
>                         locale-dependent data [DATAROOTDIR/locale]
>     --mandir=MANDIR     manual pages [DATAROOTDIR/man]
>     --docdir=DOCDIR     documentation root [DATAROOTDIR/doc/PACKAGE]
>     --htmldir=HTMLDIR   HTML documentation [DOCDIR]
>     --dvidir=DVIDIR     DVI documentation [DOCDIR]
>     --pdfdir=PDFDIR     PDF documentation [DOCDIR]
>     --psdir=PSDIR       PostScript documentation [DOCDIR]
>

But we do allow distros to override those, so passing the ones that we can
is good.  bitbake.conf has the canonical list of prefix variables that we
expose.

Ross

--94eb2c0553b2448604056011c5bd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 11 December 2017 at 14:16, Stefan Agner <span dir=3D"lt=
r">&lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hm, isn&#39;t this a &quot;base&quot; o=
ption which is always supported?</blockquote><div><br></div><div>No idea. :=
)</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">There are a bunch of=
 others. But most seem to derive from PREFIX, which<br>
we set...<br>
<br>
=C2=A0 Installation prefix:<br>
<br>
=C2=A0 =C2=A0 By default, &quot;waf install&quot; will put the files in &qu=
ot;/usr/local/bin&quot;,<br>
&quot;/usr/local/lib&quot; etc. An installation prefix other than<br>
=C2=A0 =C2=A0 &quot;/usr/local&quot; can be given using &quot;--prefix&quot=
;, for example<br>
&quot;--prefix=3D$HOME&quot;<br>
<br>
<br>
<br>
=C2=A0 =C2=A0 --prefix=3DPREFIX=C2=A0 =C2=A0 =C2=A0installation prefix [def=
ault: &#39;/usr/local/&#39;]<br>
=C2=A0 =C2=A0 --destdir=3DDESTDIR=C2=A0 =C2=A0installation root [default: &=
#39;&#39;]<br>
=C2=A0 =C2=A0 --exec-prefix=3DEXEC_PREFIX<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 installation prefix for binaries [PREFIX]<br>
<br>
=C2=A0 Installation directories:<br>
=C2=A0 =C2=A0 --bindir=3DBINDIR=C2=A0 =C2=A0 =C2=A0user commands [EXEC_PREF=
IX/bin]<br>
=C2=A0 =C2=A0 --sbindir=3DSBINDIR=C2=A0 =C2=A0system binaries [EXEC_PREFIX/=
sbin]<br>
=C2=A0 =C2=A0 --libexecdir=3DLIBEXECDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 program-specific binaries [EXEC_PREFIX/libexec]<br>
<br>
=C2=A0 =C2=A0 --sysconfdir=3DSYSCONFDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 host-specific configuration [PREFIX/etc]<br>
=C2=A0 =C2=A0 --sharedstatedir=3D<wbr>SHAREDSTATEDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 architecture-independent variable data<br>
[PREFIX/com]<br>
<br>
=C2=A0 =C2=A0 --localstatedir=3DLOCALSTATEDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 variable data [PREFIX/var]<br>
=C2=A0 =C2=A0 --libdir=3DLIBDIR=C2=A0 =C2=A0 =C2=A0object code libraries [E=
XEC_PREFIX/lib64]<br>
=C2=A0 =C2=A0 --includedir=3DINCLUDEDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 header files [PREFIX/include]<br>
=C2=A0 =C2=A0 --oldincludedir=3DOLDINCLUDEDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 header files for non-GCC compilers<br>
[/usr/include]<br>
<br>
=C2=A0 =C2=A0 --datarootdir=3DDATAROOTDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 architecture-independent data root<br>
[PREFIX/share]<br>
<br>
=C2=A0 =C2=A0 --datadir=3DDATADIR=C2=A0 =C2=A0architecture-independent data=
 [DATAROOTDIR]<br>
=C2=A0 =C2=A0 --infodir=3DINFODIR=C2=A0 =C2=A0GNU &quot;info&quot; document=
ation [DATAROOTDIR/info]<br>
=C2=A0 =C2=A0 --localedir=3DLOCALEDIR<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 locale-dependent data [DATAROOTDIR/locale]<br>
=C2=A0 =C2=A0 --mandir=3DMANDIR=C2=A0 =C2=A0 =C2=A0manual pages [DATAROOTDI=
R/man]<br>
=C2=A0 =C2=A0 --docdir=3DDOCDIR=C2=A0 =C2=A0 =C2=A0documentation root [DATA=
ROOTDIR/doc/PACKAGE]<br>
=C2=A0 =C2=A0 --htmldir=3DHTMLDIR=C2=A0 =C2=A0HTML documentation [DOCDIR]<b=
r>
=C2=A0 =C2=A0 --dvidir=3DDVIDIR=C2=A0 =C2=A0 =C2=A0DVI documentation [DOCDI=
R]<br>
=C2=A0 =C2=A0 --pdfdir=3DPDFDIR=C2=A0 =C2=A0 =C2=A0PDF documentation [DOCDI=
R]<br>
=C2=A0 =C2=A0 --psdir=3DPSDIR=C2=A0 =C2=A0 =C2=A0 =C2=A0PostScript document=
ation [DOCDIR]<br></blockquote><div><br></div><div>But we do allow distros =
to override those, so passing the ones that we can is good. =C2=A0bitbake.c=
onf has the canonical list of prefix variables that we expose.</div><div><b=
r></div><div>Ross=C2=A0<br></div></div></div></div>

--94eb2c0553b2448604056011c5bd--
