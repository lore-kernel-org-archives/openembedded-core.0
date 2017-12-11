Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 17F6671A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 15:37:05 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id r6so16683749itr.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 07:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=hu10b8vLNjGy9l4t7YSSdGHYR5N4u4YCzAwkd8zktdE=;
	b=Xq6toBiksZLQ1pQYizy4TmDQsW+x2vpXTwr4p8OaPmysM5xXgDtOZbm6P0XEDvNXEh
	J3250uIqIG3s0w1n+BF0ZN6IKjQFPLfbrbU67HvqIlRRP9q7jwVHy1ELXMeTQ62Kukwq
	hl8WhIfk6R4hl64itROJT4YcLQ+9tFSqpXo9dODGYxFVwmVUmnKUIDBH3o8VPIFk2uwH
	wx3jFqPNMNj3bpAcuzBW2aVFwKlUg4N5vEQI22/Y6zYzHtpwrPHKjBK6M7G+4sLQ6vLs
	1vP0QOHWYi6C+OixPwkrJXmj1y9KipmVGKhTB0b4ufu5GD06yVgubE3TVTZVvtCaleT/
	s7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=hu10b8vLNjGy9l4t7YSSdGHYR5N4u4YCzAwkd8zktdE=;
	b=C26To8GxYa6/HDN1iheB79AFz80R59BgnwY9YEvcJKfpFBrYkfGsNTSMU4xJ1Nbrvk
	JhXhB9JJ0bhZy8cIaOJ7NJJZSbfybxjZjL8vUqXwB+7WDHh8d2ggW+a66152fMp1bPDW
	TefbYTMzU8iDbw2nScTM9t6o+FF5eOzFwwqq1WqrouSfyYu9yn6EGyxGJeNfgrdqKWN9
	/Oob9FVpB/tajiSbBPNMekfU0TRjpYrdQBqIMTdU+7vq1PzJlb870wlW/oOKdeb8yKBB
	6Ue/nPYVgSILINDvhpMF3nGwfdOBsPWiSEdyyG83qaJgobETc/RbrZybgqT17PspC8x4
	5aMQ==
X-Gm-Message-State: AKGB3mIAYoaNfY+Z0KMs3+hhPt5vTHSwg+rv2+E35ykUWd8Mr0IbyuZt
	OwPQnwhQejCVzm+jaqFoR9yxwvBQ
X-Google-Smtp-Source: ACJfBosWKeXq16Jqnt49jrm1TJ0adq1q2ChQtd5IyeEH4P/gnjiKxWNg4qWuFyIx57f2lFO0+MRQbA==
X-Received: by 10.36.40.206 with SMTP id h197mr1396496ith.12.1513006627239;
	Mon, 11 Dec 2017 07:37:07 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	c36sm6479733iod.11.2017.12.11.07.37.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 07:37:06 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513006625.9676.9.camel@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Stefan Agner <stefan@agner.ch>
Date: Mon, 11 Dec 2017 09:37:05 -0600
In-Reply-To: <1513006338.9676.5.camel@gmail.com>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
	<1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
	<CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
	<1513006338.9676.5.camel@gmail.com>
X-Mailer: Evolution 3.26.2 (3.26.2-1.fc27) 
Mime-Version: 1.0
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Otavio Salvador <otavio@ossystems.com.br>,
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
X-List-Received-Date: Mon, 11 Dec 2017 15:37:06 -0000
Content-Type: multipart/alternative; boundary="=-6r9ZujrzbviOFh3vl8b5"

--=-6r9ZujrzbviOFh3vl8b5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-12-11 at 09:32 -0600, Joshua Watt wrote:
> On Mon, 2017-12-11 at 14:58 +0000, Burton, Ross wrote:
> > On 11 December 2017 at 14:16, Stefan Agner <stefan@agner.ch> wrote:
> > > Hm, isn't this a "base" option which is always supported?
> > 
> > No idea. :)
> >  
> > > There are a bunch of others. But most seem to derive from PREFIX,
> > > which
> > > 
> > > we set...
> > > 
> > > 
> > > 
> > >   Installation prefix:
> > > 
> > > 
> > > 
> > >     By default, "waf install" will put the files in
> > > "/usr/local/bin",
> > > 
> > > "/usr/local/lib" etc. An installation prefix other than
> > > 
> > >     "/usr/local" can be given using "--prefix", for example
> > > 
> > > "--prefix=$HOME"
> > > 
> > > 
> > > 
> > > 
> > > 
> > > 
> > > 
> > >     --prefix=PREFIX     installation prefix [default:
> > > '/usr/local/']
> > > 
> > >     --destdir=DESTDIR   installation root [default: '']
> > > 
> > >     --exec-prefix=EXEC_PREFIX
> > > 
> > >                         installation prefix for binaries [PREFIX]
> > > 
> > > 
> > > 
> > >   Installation directories:
> > > 
> > >     --bindir=BINDIR     user commands [EXEC_PREFIX/bin]
> > > 
> > >     --sbindir=SBINDIR   system binaries [EXEC_PREFIX/sbin]
> > > 
> > >     --libexecdir=LIBEXECDIR
> > > 
> > >                         program-specific binaries
> > > [EXEC_PREFIX/libexec]
> > > 
> > > 
> > > 
> > >     --sysconfdir=SYSCONFDIR
> > > 
> > >                         host-specific configuration [PREFIX/etc]
> > > 
> > >     --sharedstatedir=SHAREDSTATEDIR
> > > 
> > >                         architecture-independent variable data
> > > 
> > > [PREFIX/com]
> > > 
> > > 
> > > 
> > >     --localstatedir=LOCALSTATEDIR
> > > 
> > >                         variable data [PREFIX/var]
> > > 
> > >     --libdir=LIBDIR     object code libraries [EXEC_PREFIX/lib64]
> > > 
> > >     --includedir=INCLUDEDIR
> > > 
> > >                         header files [PREFIX/include]
> > > 
> > >     --oldincludedir=OLDINCLUDEDIR
> > > 
> > >                         header files for non-GCC compilers
> > > 
> > > [/usr/include]
> > > 
> > > 
> > > 
> > >     --datarootdir=DATAROOTDIR
> > > 
> > >                         architecture-independent data root
> > > 
> > > [PREFIX/share]
> > > 
> > > 
> > > 
> > >     --datadir=DATADIR   architecture-independent data
> > > [DATAROOTDIR]
> > > 
> > >     --infodir=INFODIR   GNU "info" documentation
> > > [DATAROOTDIR/info]
> > > 
> > >     --localedir=LOCALEDIR
> > > 
> > >                         locale-dependent data
> > > [DATAROOTDIR/locale]
> > > 
> > >     --mandir=MANDIR     manual pages [DATAROOTDIR/man]
> > > 
> > >     --docdir=DOCDIR     documentation root
> > > [DATAROOTDIR/doc/PACKAGE]
> > > 
> > >     --htmldir=HTMLDIR   HTML documentation [DOCDIR]
> > > 
> > >     --dvidir=DVIDIR     DVI documentation [DOCDIR]
> > > 
> > >     --pdfdir=PDFDIR     PDF documentation [DOCDIR]
> > > 
> > >     --psdir=PSDIR       PostScript documentation [DOCDIR]
> > 
> > But we do allow distros to override those, so passing the on
> 
> Vanilla waf only supports --prefix, --libdir, and --bindir. Anything
> else is a result of loading the gnu_dirs tool, which not all projects
> are required to do.

Sorry, hit send too soo: waf (at least version 2.0) also errors out on
unknown options. I think the three I listed are the only ones we can do
generically. There might be some way to easily adding the rest if you
know waf is loading gnu_dirs
> > es that we can is good.  bitbake.conf has the canonical list of
> > prefix variables that we expose.
> > 
> > Ross 
> > 

--=-6r9ZujrzbviOFh3vl8b5
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head></head><body><div>On Mon, 2017-12-11 at 09:32 -0600, Joshua Wat=
t wrote:</div><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-=
left:2px #729fcf solid;padding-left:1ex"><div>On Mon, 2017-12-11 at 14:58 +=
0000, Burton, Ross wrote:</div><blockquote type=3D"cite" style=3D"margin:0 =
0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir=3D"ltr">=
On 11 December 2017 at 14:16, Stefan Agner <span dir=3D"ltr">&lt;<a href=3D=
"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch</a>&gt;</span> w=
rote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote =
type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;pad=
ding-left:1ex">Hm, isn't this a "base" option which is always supported?<br=
></blockquote><div><br></div><div>No idea. :)</div><div>&nbsp;</div><blockq=
uote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf soli=
d;padding-left:1ex">There are a bunch of others. But most seem to derive fr=
om PREFIX, which<br>
we set...<br>
<br>
&nbsp; Installation prefix:<br>
<br>
&nbsp; &nbsp; By default, "waf install" will put the files in "/usr/local/b=
in",<br>
"/usr/local/lib" etc. An installation prefix other than<br>
&nbsp; &nbsp; "/usr/local" can be given using "--prefix", for example<br>
"--prefix=3D$HOME"<br>
<br>
<br>
<br>
&nbsp; &nbsp; --prefix=3DPREFIX&nbsp; &nbsp; &nbsp;installation prefix [def=
ault: '/usr/local/']<br>
&nbsp; &nbsp; --destdir=3DDESTDIR&nbsp; &nbsp;installation root [default: '=
']<br>
&nbsp; &nbsp; --exec-prefix=3DEXEC_PREFIX<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; installation prefix for binaries [PREFIX]<br>
<br>
&nbsp; Installation directories:<br>
&nbsp; &nbsp; --bindir=3DBINDIR&nbsp; &nbsp; &nbsp;user commands [EXEC_PREF=
IX/bin]<br>
&nbsp; &nbsp; --sbindir=3DSBINDIR&nbsp; &nbsp;system binaries [EXEC_PREFIX/=
sbin]<br>
&nbsp; &nbsp; --libexecdir=3DLIBEXECDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; program-specific binaries [EXEC_PREFIX/libexec]<br>
<br>
&nbsp; &nbsp; --sysconfdir=3DSYSCONFDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; host-specific configuration [PREFIX/etc]<br>
&nbsp; &nbsp; --sharedstatedir=3D<wbr>SHAREDSTATEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; architecture-independent variable data<br>
[PREFIX/com]<br>
<br>
&nbsp; &nbsp; --localstatedir=3DLOCALSTATEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; variable data [PREFIX/var]<br>
&nbsp; &nbsp; --libdir=3DLIBDIR&nbsp; &nbsp; &nbsp;object code libraries [E=
XEC_PREFIX/lib64]<br>
&nbsp; &nbsp; --includedir=3DINCLUDEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; header files [PREFIX/include]<br>
&nbsp; &nbsp; --oldincludedir=3DOLDINCLUDEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; header files for non-GCC compilers<br>
[/usr/include]<br>
<br>
&nbsp; &nbsp; --datarootdir=3DDATAROOTDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; architecture-independent data root<br>
[PREFIX/share]<br>
<br>
&nbsp; &nbsp; --datadir=3DDATADIR&nbsp; &nbsp;architecture-independent data=
 [DATAROOTDIR]<br>
&nbsp; &nbsp; --infodir=3DINFODIR&nbsp; &nbsp;GNU "info" documentation [DAT=
AROOTDIR/info]<br>
&nbsp; &nbsp; --localedir=3DLOCALEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; locale-dependent data [DATAROOTDIR/locale]<br>
&nbsp; &nbsp; --mandir=3DMANDIR&nbsp; &nbsp; &nbsp;manual pages [DATAROOTDI=
R/man]<br>
&nbsp; &nbsp; --docdir=3DDOCDIR&nbsp; &nbsp; &nbsp;documentation root [DATA=
ROOTDIR/doc/PACKAGE]<br>
&nbsp; &nbsp; --htmldir=3DHTMLDIR&nbsp; &nbsp;HTML documentation [DOCDIR]<b=
r>
&nbsp; &nbsp; --dvidir=3DDVIDIR&nbsp; &nbsp; &nbsp;DVI documentation [DOCDI=
R]<br>
&nbsp; &nbsp; --pdfdir=3DPDFDIR&nbsp; &nbsp; &nbsp;PDF documentation [DOCDI=
R]<br>
&nbsp; &nbsp; --psdir=3DPSDIR&nbsp; &nbsp; &nbsp; &nbsp;PostScript document=
ation [DOCDIR]<br></blockquote><div><br></div><div>But we do allow distros =
to override those, so passing the on</div></div></div></div></blockquote><d=
iv><br></div><div>Vanilla waf only supports --prefix, --libdir, and --bindi=
r. Anything else is a result of loading the gnu_dirs tool, which not all pr=
ojects are required to do.</div></blockquote><div><br></div><div>Sorry, hit=
 send too soo: waf (at least version 2.0) also errors out on unknown option=
s. I think the three I listed are the only ones we can do generically. Ther=
e might be some way to easily adding the rest if you know waf is loading gn=
u_dirs</div><div><br></div><blockquote type=3D"cite" style=3D"margin:0 0 0 =
.8ex; border-left:2px #729fcf solid;padding-left:1ex"><div><br></div><block=
quote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fcf sol=
id;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=
=3D"gmail_quote"><div>es that we can is good. &nbsp;bitbake.conf has the ca=
nonical list of prefix variables that we expose.</div><div><br></div><div>R=
oss&nbsp;<br></div></div></div></div>
</blockquote></blockquote></body></html>

--=-6r9ZujrzbviOFh3vl8b5--
