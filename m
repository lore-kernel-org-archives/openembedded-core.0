Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f49.google.com (mail-it0-f49.google.com
	[209.85.214.49])
	by mail.openembedded.org (Postfix) with ESMTP id D386F78870
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 14:14:17 +0000 (UTC)
Received: by mail-it0-f49.google.com with SMTP id x28so24852646ita.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 06:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CkYku0ERc0GtlQFG2BbCkpytxjnSD5NMScUQ1OW1TqQ=;
	b=z2TBmV57tYLs37blmLHGK9TkaVqyDVUmbIxZhGF2ab2GL54m6dqHCTytIGYLfYvkWl
	wDQgGXvyPA1ahFA58tI1S7CjcFt+r+QaQDp73aj6uJX159gX34mcavcAlREANXgnapgG
	BQ44lAtW2mFRgHVihQUsVfRWj4BsRLkIflWZHdAzKxPiQbb3yiaUwibODwlazrNSftiP
	6fYEs2pU2x6KtAO7J+9t0x8qhIiHkTeWSUGQV5JZF8u5LwC0j2Yeji03LWRouad8jIBs
	TwBtUmCBnq6nqAl5/jEv1QlHfmQFqSwpgdL3kyhpNa9oApS3ai4phPuBgN/fKGXXMvYo
	sV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CkYku0ERc0GtlQFG2BbCkpytxjnSD5NMScUQ1OW1TqQ=;
	b=aGabCgI0J+ddqWAnGP4AY1DGvFmimxUvZE8N8FgWgIZ8AF8UboONb6UnFOOKahKUdc
	9aaoudqUHFEIcHeurbrWX85VrQLmihUr5l6of/Js9pg3x0oUAOan0xxDssT6KBIrkPyU
	H+FbsKDJ/wEm+xVeS8JCh+OV1WfJRRv+tSr0xCW62Yv/Z1AR4FMnGL9e4jlrxp/LmKde
	P9ehKxUlL9m7blzi+vx1ErhMLeFlTEPJWOOoTtrV4+nmPF/faJ+4hAa89IWA7OKRQHri
	dd35uNaN5p5XRucjSIjAJO9Lvgt8holqCvKycvAr6+h3O3rJ3NAjja/BqZjAVdYi0H5Z
	A/Xw==
X-Gm-Message-State: AKGB3mKZpv+If6StpgD47563cG8VBk9gMMY5P6ZxfEKaNsYHR81XJnKh
	TVFSur/H8lLLVn7tCzTJX76GzMV/zQ1HFaC8M2GLSQ==
X-Google-Smtp-Source: ACJfBotaYkVBS5hU67lD2urE/LdGNLjbbejMa3fDy7QCH7TS6vE39D03Nrib7NovDtA+YVX1aEwXuykZmZoLbiePHJw=
X-Received: by 10.36.93.5 with SMTP id w5mr2821815ita.124.1513088058984; Tue,
	12 Dec 2017 06:14:18 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 06:13:58 -0800 (PST)
In-Reply-To: <abb98b6343d1fe28ec45a0243cc5ec1d@agner.ch>
References: <20171212132755.30556-1-stefan@agner.ch>
	<CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
	<abb98b6343d1fe28ec45a0243cc5ec1d@agner.ch>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 14:13:58 +0000
Message-ID: <CAJTo0LYBEhgD6vc07pVk_QMCkHjLXGFP9RazatMM_nOL-8RjVw@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Stefan Agner <stefan.agner@toradex.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] waf.bbclass: explicitly pass bindir and libdir
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
X-List-Received-Date: Tue, 12 Dec 2017 14:14:18 -0000
Content-Type: multipart/alternative; boundary="001a1143f14c45240f05602544a4"

--001a1143f14c45240f05602544a4
Content-Type: text/plain; charset="UTF-8"

On 12 December 2017 at 14:03, Stefan Agner <stefan@agner.ch> wrote:

> On 2017-12-12 15:00, Burton, Ross wrote:
>
> > On 12 December 2017 at 13:27, Stefan Agner <stefan@agner.ch> wrote:
> >
> >> On some build hosts distros (e.g. Fedora 26) waf tries to be
> >> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
> >> This obviously is not what we want for 32-bit targets and usually
> >> fails in the do_package phase:
> >> WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue:
> gstreamer1.0-plugins-imx: Files/directories were installed but not shipped
> in any package:
> >> /usr/lib64/libgstimxcommon.so.0
> >>
> >> Waf knows prefix, bindir and libdir as default options. Explicitly
> >> pass those three.
> >
> > Obviously not.
> >
> > ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed: do_configure
> (log file is located at /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.
> do_configure.17278)
> > ERROR: Logfile of failure stored in: /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278
> > Log data follows:
> > | DEBUG: Executing shell function do_configure
> > | waf [commands] [options]
> > |
> > | Main commands (example: ./waf build -j4)
> > |   build    : executes the build
> > |   clean    : cleans the project
> > |   configure: configures the project
> > |   dist     : makes a tarball for redistributing the sources
> > |   distcheck: checks if the project compiles (tarball from 'dist')
> > |   distclean: removes the build directory
> > |   install  : installs the targets on the system
> > |   list     : lists the targets to execute
> > |   step     : executes tasks in a step-by-step fashion, for debugging
> > |   uninstall: removes the targets installed
> > |   update   : updates the plugins from the *waflib/extras* directory
> > |
> > | waf: error: no such option: --bindir
> >
>
> Hm, eglinfo seems to come with a old waf version, 1.7.8 to be specific.
>
> It seems bindir/libdir got added in 1.8 series:
> https://github.com/waf-project/waf/blob/waf-1.8/waflib/Options.py
>
> Make version specific variables?
>

That neatly shows where the "clever code" that was breaking libdir earlier
is:

https://github.com/waf-project/waf/commit/823b4cd2dc03d06a81e0ab003606067da03d8745#diff-b44b0c8f383b2fd1b19f2ba039d30237

Ross

--001a1143f14c45240f05602544a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 December 2017 at 14:03, Stefan Agner <span dir=3D"lt=
r">&lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan@agner.ch=
</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_qu=
ote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,2=
04);padding-left:1ex"><div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5">O=
n 2017-12-12 15:00, Burton, Ross wrote:<br>
<br>
&gt; On 12 December 2017 at 13:27, Stefan Agner &lt;<a href=3D"mailto:stefa=
n@agner.ch">stefan@agner.ch</a>&gt; wrote:<br>
&gt;<br>
&gt;&gt; On some build hosts distros (e.g. Fedora 26) waf tries to be<br>
&gt;&gt; smart about libdir detection and defaults to [EXEC_PREFIX/lib64].<=
br>
&gt;&gt; This obviously is not what we want for 32-bit targets and usually<=
br>
&gt;&gt; fails in the do_package phase:<br>
&gt;&gt; WARNING: gstreamer1.0-plugins-imx-0.13.<wbr>0-r0 do_package: QA Is=
sue: gstreamer1.0-plugins-imx: Files/directories were installed but not shi=
pped in any package:<br>
&gt;&gt; /usr/lib64/libgstimxcommon.so.<wbr>0<br>
&gt;&gt;<br>
&gt;&gt; Waf knows prefix, bindir and libdir as default options. Explicitly=
<br>
&gt;&gt; pass those three.<br>
&gt;<br>
&gt; Obviously not.<br>
&gt;<br>
&gt; ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed: do_configur=
e (log file is located at /data/poky-tmp/master/build/<wbr>work/corei7-64-p=
oky-linux/<wbr>eglinfo-x11/1.0.0-r0/temp/log.<wbr>do_configure.17278)<br>
&gt; ERROR: Logfile of failure stored in: /data/poky-tmp/master/build/<wbr>=
work/corei7-64-poky-linux/<wbr>eglinfo-x11/1.0.0-r0/temp/log.<wbr>do_config=
ure.17278<br>
&gt; Log data follows:<br>
&gt; | DEBUG: Executing shell function do_configure<br>
&gt; | waf [commands] [options]<br>
&gt; |<br>
&gt; | Main commands (example: ./waf build -j4)<br>
&gt; |=C2=A0 =C2=A0build=C2=A0 =C2=A0 : executes the build<br>
&gt; |=C2=A0 =C2=A0clean=C2=A0 =C2=A0 : cleans the project<br>
&gt; |=C2=A0 =C2=A0configure: configures the project<br>
&gt; |=C2=A0 =C2=A0dist=C2=A0 =C2=A0 =C2=A0: makes a tarball for redistribu=
ting the sources<br>
&gt; |=C2=A0 =C2=A0distcheck: checks if the project compiles (tarball from =
&#39;dist&#39;)<br>
&gt; |=C2=A0 =C2=A0distclean: removes the build directory<br>
&gt; |=C2=A0 =C2=A0install=C2=A0 : installs the targets on the system<br>
&gt; |=C2=A0 =C2=A0list=C2=A0 =C2=A0 =C2=A0: lists the targets to execute<b=
r>
&gt; |=C2=A0 =C2=A0step=C2=A0 =C2=A0 =C2=A0: executes tasks in a step-by-st=
ep fashion, for debugging<br>
&gt; |=C2=A0 =C2=A0uninstall: removes the targets installed<br>
&gt; |=C2=A0 =C2=A0update=C2=A0 =C2=A0: updates the plugins from the *wafli=
b/extras* directory<br>
&gt; |<br>
&gt; | waf: error: no such option: --bindir<br>
&gt;<br>
<br>
</div></div>Hm, eglinfo seems to come with a old waf version, 1.7.8 to be s=
pecific.<br>
<br>
It seems bindir/libdir got added in 1.8 series:<br>
<a href=3D"https://github.com/waf-project/waf/blob/waf-1.8/waflib/Options.p=
y" rel=3D"noreferrer" target=3D"_blank">https://github.com/waf-<wbr>project=
/waf/blob/waf-1.8/<wbr>waflib/Options.py</a><br>
<br>
Make version specific variables?<br></blockquote><div><br></div><div>That n=
eatly shows where the &quot;clever code&quot; that was breaking libdir earl=
ier is:</div><div><br></div><div><a href=3D"https://github.com/waf-project/=
waf/commit/823b4cd2dc03d06a81e0ab003606067da03d8745#diff-b44b0c8f383b2fd1b1=
9f2ba039d30237">https://github.com/waf-project/waf/commit/823b4cd2dc03d06a8=
1e0ab003606067da03d8745#diff-b44b0c8f383b2fd1b19f2ba039d30237</a></div><div=
><br></div><div>Ross</div></div></div></div>

--001a1143f14c45240f05602544a4--
