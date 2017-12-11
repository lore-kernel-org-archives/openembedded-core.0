Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id A6B0F71A72
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 15:32:18 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id f190so16620444ita.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Dec 2017 07:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:subject:to:cc:date:in-reply-to:references
	:mime-version; bh=Ka9fmkgA5CmDmeRsKEZfOqj4LzydLOhsJwzDaiMFpNs=;
	b=DWhccMZzKM3DbUCL53mJ1SE9HyXKOkD5Cd6wvHkWpVqHrOvWxNkhscMvlbn2+hRNQP
	VEttQ5u/1MRjZc7vecsbKDZKqRlwUtdT2pD7ztU2ormsf7Zksn8vIUhqf1nMfagn9RiP
	r7YkM8jVJieHipasxYLPe8IyMy0XxjwcJn7qxgsjET0BMk2Ux22hFC9VdjdXhtNpyLBB
	xxocMnQLC+A1PvkvNm8JH3ce+7m+JM4N7yfO+9a8NanAmBxIZYxJOfnoDfJz4XEL0YhL
	SwcyS18jG5qdSSDYgQI2/c7CBwvHA0rKnWAMn9qYgbzlxk8BWHjHkHkVOs312p++4nfL
	dPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:subject:to:cc:date:in-reply-to
	:references:mime-version;
	bh=Ka9fmkgA5CmDmeRsKEZfOqj4LzydLOhsJwzDaiMFpNs=;
	b=llq33MQ8ED8jAMgpUd0lSoQtxByvHYuxCLTScwDdFp2815gVMGr2cluURYU+M/rzwF
	d6NKfR7ZtJ1DyMVLembzlj/Tp/5njnmoZsJH3o9RE4v0xS2LYNSZ4vE7b+mWzACqjTCT
	qknlkt6iAouyCPI7o0DD4bmFIWDagmOPwTSt4bYZXOqS4dNz/U20Cc0XpLphuCSrBosp
	iRXnlpgCZxgO/8IR+yWBO5nb3fFfSHeGlw7gMihYCg2Jib/e2sfg0mKSwcg9IVcMzpId
	H7NURyupV2hvsQNHIKMXhofSY0/YX1yKkmofDfVVAU2nDMnvEyxIgMLyDSaBFxdRbo9E
	ddQg==
X-Gm-Message-State: AKGB3mKzXe6fxvJ4Nmy4HPScNXzVQ8StgNHZ4I0ArOU/EHkPdSNvTmC4
	nVjUQBux/swx7BMEkaxNXeE=
X-Google-Smtp-Source: ACJfBoulpb4bRK9+DP77yEUMp4VnHqKdHVNeWOE1PgvsYvUQeo7NGqSS9Oq0dU1RVvYWnAjK7ex/jQ==
X-Received: by 10.107.89.12 with SMTP id n12mr1080414iob.298.1513006339581;
	Mon, 11 Dec 2017 07:32:19 -0800 (PST)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.googlemail.com with ESMTPSA id
	a69sm3976134itc.18.2017.12.11.07.32.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Dec 2017 07:32:18 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <1513006338.9676.5.camel@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Stefan Agner <stefan@agner.ch>
Date: Mon, 11 Dec 2017 09:32:18 -0600
In-Reply-To: <CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
References: <20171211135720.38714-1-stefan@agner.ch>
	<CAJTo0LbSDm6j6yPUavimgqegidvZMQ6eY=VV2=P2oERUtU-1qA@mail.gmail.com>
	<1b5588ed9cdad157c4129eb45d2a0fe0@agner.ch>
	<CAJTo0LY5BR=kgukiW6LAjonzidsC-h0gerwxKcA-3Qqvydniuw@mail.gmail.com>
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
X-List-Received-Date: Mon, 11 Dec 2017 15:32:18 -0000
Content-Type: multipart/alternative; boundary="=-E3RFYhFHEOvd0uzIBngA"

--=-E3RFYhFHEOvd0uzIBngA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-12-11 at 14:58 +0000, Burton, Ross wrote:
> On 11 December 2017 at 14:16, Stefan Agner <stefan@agner.ch> wrote:
> > Hm, isn't this a "base" option which is always supported?
> 
> No idea. :)
>  
> > There are a bunch of others. But most seem to derive from PREFIX,
> > which
> > 
> > we set...
> > 
> > 
> > 
> >   Installation prefix:
> > 
> > 
> > 
> >     By default, "waf install" will put the files in
> > "/usr/local/bin",
> > 
> > "/usr/local/lib" etc. An installation prefix other than
> > 
> >     "/usr/local" can be given using "--prefix", for example
> > 
> > "--prefix=$HOME"
> > 
> > 
> > 
> > 
> > 
> > 
> > 
> >     --prefix=PREFIX     installation prefix [default:
> > '/usr/local/']
> > 
> >     --destdir=DESTDIR   installation root [default: '']
> > 
> >     --exec-prefix=EXEC_PREFIX
> > 
> >                         installation prefix for binaries [PREFIX]
> > 
> > 
> > 
> >   Installation directories:
> > 
> >     --bindir=BINDIR     user commands [EXEC_PREFIX/bin]
> > 
> >     --sbindir=SBINDIR   system binaries [EXEC_PREFIX/sbin]
> > 
> >     --libexecdir=LIBEXECDIR
> > 
> >                         program-specific binaries
> > [EXEC_PREFIX/libexec]
> > 
> > 
> > 
> >     --sysconfdir=SYSCONFDIR
> > 
> >                         host-specific configuration [PREFIX/etc]
> > 
> >     --sharedstatedir=SHAREDSTATEDIR
> > 
> >                         architecture-independent variable data
> > 
> > [PREFIX/com]
> > 
> > 
> > 
> >     --localstatedir=LOCALSTATEDIR
> > 
> >                         variable data [PREFIX/var]
> > 
> >     --libdir=LIBDIR     object code libraries [EXEC_PREFIX/lib64]
> > 
> >     --includedir=INCLUDEDIR
> > 
> >                         header files [PREFIX/include]
> > 
> >     --oldincludedir=OLDINCLUDEDIR
> > 
> >                         header files for non-GCC compilers
> > 
> > [/usr/include]
> > 
> > 
> > 
> >     --datarootdir=DATAROOTDIR
> > 
> >                         architecture-independent data root
> > 
> > [PREFIX/share]
> > 
> > 
> > 
> >     --datadir=DATADIR   architecture-independent data [DATAROOTDIR]
> > 
> >     --infodir=INFODIR   GNU "info" documentation [DATAROOTDIR/info]
> > 
> >     --localedir=LOCALEDIR
> > 
> >                         locale-dependent data [DATAROOTDIR/locale]
> > 
> >     --mandir=MANDIR     manual pages [DATAROOTDIR/man]
> > 
> >     --docdir=DOCDIR     documentation root
> > [DATAROOTDIR/doc/PACKAGE]
> > 
> >     --htmldir=HTMLDIR   HTML documentation [DOCDIR]
> > 
> >     --dvidir=DVIDIR     DVI documentation [DOCDIR]
> > 
> >     --pdfdir=PDFDIR     PDF documentation [DOCDIR]
> > 
> >     --psdir=PSDIR       PostScript documentation [DOCDIR]
> 
> But we do allow distros to override those, so passing the on

Vanilla waf only supports --prefix, --libdir, and --bindir. Anything
else is a result of loading the gnu_dirs tool, which not all projects
are required to do.
> es that we can is good.  bitbake.conf has the canonical list of
> prefix variables that we expose.
> 
> Ross 
> 

--=-E3RFYhFHEOvd0uzIBngA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Mon, 2017-12-11 at 14:58 +0000, Burton, Ross wrote:</div><blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir="ltr">On 11 December 2017 at 14:16, Stefan Agner <span dir="ltr">&lt;<a href="mailto:stefan@agner.ch" target="_blank">stefan@agner.ch</a>&gt;</span> wrote:<br><div class="gmail_extra"><div class="gmail_quote"><blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">Hm, isn't this a "base" option which is always supported?<br></blockquote><div><br></div><div>No idea. :)</div><div>&nbsp;</div><blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">There are a bunch of others. But most seem to derive from PREFIX, which<br>
we set...<br>
<br>
&nbsp; Installation prefix:<br>
<br>
&nbsp; &nbsp; By default, "waf install" will put the files in "/usr/local/bin",<br>
"/usr/local/lib" etc. An installation prefix other than<br>
&nbsp; &nbsp; "/usr/local" can be given using "--prefix", for example<br>
"--prefix=$HOME"<br>
<br>
<br>
<br>
&nbsp; &nbsp; --prefix=PREFIX&nbsp; &nbsp; &nbsp;installation prefix [default: '/usr/local/']<br>
&nbsp; &nbsp; --destdir=DESTDIR&nbsp; &nbsp;installation root [default: '']<br>
&nbsp; &nbsp; --exec-prefix=EXEC_PREFIX<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; installation prefix for binaries [PREFIX]<br>
<br>
&nbsp; Installation directories:<br>
&nbsp; &nbsp; --bindir=BINDIR&nbsp; &nbsp; &nbsp;user commands [EXEC_PREFIX/bin]<br>
&nbsp; &nbsp; --sbindir=SBINDIR&nbsp; &nbsp;system binaries [EXEC_PREFIX/sbin]<br>
&nbsp; &nbsp; --libexecdir=LIBEXECDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; program-specific binaries [EXEC_PREFIX/libexec]<br>
<br>
&nbsp; &nbsp; --sysconfdir=SYSCONFDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; host-specific configuration [PREFIX/etc]<br>
&nbsp; &nbsp; --sharedstatedir=<wbr>SHAREDSTATEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; architecture-independent variable data<br>
[PREFIX/com]<br>
<br>
&nbsp; &nbsp; --localstatedir=LOCALSTATEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; variable data [PREFIX/var]<br>
&nbsp; &nbsp; --libdir=LIBDIR&nbsp; &nbsp; &nbsp;object code libraries [EXEC_PREFIX/lib64]<br>
&nbsp; &nbsp; --includedir=INCLUDEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; header files [PREFIX/include]<br>
&nbsp; &nbsp; --oldincludedir=OLDINCLUDEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; header files for non-GCC compilers<br>
[/usr/include]<br>
<br>
&nbsp; &nbsp; --datarootdir=DATAROOTDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; architecture-independent data root<br>
[PREFIX/share]<br>
<br>
&nbsp; &nbsp; --datadir=DATADIR&nbsp; &nbsp;architecture-independent data [DATAROOTDIR]<br>
&nbsp; &nbsp; --infodir=INFODIR&nbsp; &nbsp;GNU "info" documentation [DATAROOTDIR/info]<br>
&nbsp; &nbsp; --localedir=LOCALEDIR<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; locale-dependent data [DATAROOTDIR/locale]<br>
&nbsp; &nbsp; --mandir=MANDIR&nbsp; &nbsp; &nbsp;manual pages [DATAROOTDIR/man]<br>
&nbsp; &nbsp; --docdir=DOCDIR&nbsp; &nbsp; &nbsp;documentation root [DATAROOTDIR/doc/PACKAGE]<br>
&nbsp; &nbsp; --htmldir=HTMLDIR&nbsp; &nbsp;HTML documentation [DOCDIR]<br>
&nbsp; &nbsp; --dvidir=DVIDIR&nbsp; &nbsp; &nbsp;DVI documentation [DOCDIR]<br>
&nbsp; &nbsp; --pdfdir=PDFDIR&nbsp; &nbsp; &nbsp;PDF documentation [DOCDIR]<br>
&nbsp; &nbsp; --psdir=PSDIR&nbsp; &nbsp; &nbsp; &nbsp;PostScript documentation [DOCDIR]<br></blockquote><div><br></div><div>But we do allow distros to override those, so passing the on</div></div></div></div></blockquote><div><br></div><div>Vanilla waf only supports --prefix, --libdir, and --bindir. Anything else is a result of loading the gnu_dirs tool, which not all projects are required to do.</div><div><br></div><blockquote type="cite" style="margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex"><div dir="ltr"><div class="gmail_extra"><div class="gmail_quote"><div>es that we can is good. &nbsp;bitbake.conf has the canonical list of prefix variables that we expose.</div><div><br></div><div>Ross&nbsp;<br></div></div></div></div>
</blockquote></body></html>

--=-E3RFYhFHEOvd0uzIBngA--
