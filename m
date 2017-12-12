Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 8428C7869B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 16:04:23 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id t1so25623680ite.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 08:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HXBCJIc+gZT1iCYu9b5O9nNJtzKCC6EIPByxArwagvw=;
	b=PqtbV/4SnoIFs0QdQgr0nEEAhmbV8WUrvyuD/h+vo7nrd/MzY/IcyuxYvqdmZMnJ2x
	4PTbFYNIboVCcLNTTqEwX2ZtDWTl+pjxvhQF+WflqUinw89PFWOHhAS9uGImDkcifd4G
	4yGr63gjOp0cE4bipK0Xi66x7RHlcPj4W0UXVN7p2hHbUhvfIREdBg9MxshMj3nQMpjq
	zWHolXwJpK7CQ41n7p0sC1HzzSjAOmJoXdAu8ZoUrb4t7XNyYIexxLap1gUFKyVUaIkK
	mfabiUg1eHA/mSGdzqTLBKDdiccwlT8x7PxMuy1L94OIR90oy9bEmPCGNu0bgdjfuTII
	9vXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HXBCJIc+gZT1iCYu9b5O9nNJtzKCC6EIPByxArwagvw=;
	b=DOt7XGVSJRqRPm6TCH7b0ZXrm4gjFUR43QsfLmhG65z8XA+S+hw0ESziiIB+IC+x1f
	Nw22jlEp3wHl4pWc2lKVUxIZRF7VjOht1qF7mWPvVkgX4ojnJ9kRKT3pGX4mOqZPPvqy
	NvnFweYQtGL2lym9iFNKDlnqQ/HSS6htnCWoORzk7fJvnWORuojAOjlrkU4MCOVBPW8M
	5zA3SM3xRdPfPaTe2zpvTlnnPSnen/3KwR23RRdf2KZ2uupFVNmLFVZQ1ur6LNUWfZbV
	GqbeNOnWU8BEfyhBF8T2H0+Z5pO6egr4OBSpMSaFl726+Qnh5fwSrYZb6RkowKzmWXKN
	BOUg==
X-Gm-Message-State: AKGB3mKQnE8kUrQCtgVRWUmap/ZQbXSnanIkp7nCLUoyHy8/n2+TtwXS
	VGyv8TLjQM0u+ViV/+uFxKdpPOqpTGmAsmwKAnI=
X-Google-Smtp-Source: ACJfBotfYSyo0F4qikR+4+c4VHbBBmfDqWiOtnh/J7s3RAUMBLvppckRFpQPT5uARjPxpxzT0iqNgwL3Bfgu1gl+ezs=
X-Received: by 10.107.30.81 with SMTP id e78mr5588117ioe.130.1513094664367;
	Tue, 12 Dec 2017 08:04:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.2.90.200 with HTTP; Tue, 12 Dec 2017 08:04:03 -0800 (PST)
In-Reply-To: <773c1d79355fe916a4b41cb79ff89b72@agner.ch>
References: <20171212132755.30556-1-stefan@agner.ch>
	<CAJTo0LaPCqFQ9asGmRUpEZ4G146GT42j0xQvMVpsW3xOeddN4Q@mail.gmail.com>
	<abb98b6343d1fe28ec45a0243cc5ec1d@agner.ch>
	<CAJTo0LYBEhgD6vc07pVk_QMCkHjLXGFP9RazatMM_nOL-8RjVw@mail.gmail.com>
	<370cbd8d94d10bbb85e12e08b742f060@agner.ch>
	<CAP9ODKrZ+5JKO-KkF88LcL8aE+DY5svJ5to8_XfDyeA7hxY-ig@mail.gmail.com>
	<773c1d79355fe916a4b41cb79ff89b72@agner.ch>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Tue, 12 Dec 2017 17:04:03 +0100
Message-ID: <CAB2nKc82-gQODkcCW4ErhqzDJdf3RFPOQHFxju6AyAqB1xW8+w@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
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
X-List-Received-Date: Tue, 12 Dec 2017 16:04:23 -0000
Content-Type: multipart/alternative; boundary="001a11418b8cfb3b88056026cd75"

--001a11418b8cfb3b88056026cd75
Content-Type: text/plain; charset="UTF-8"

As waf_do_configure takes care of EXTRA_OECONF, maybe we can only fix
gstreamer1.0-plugins-imx_0.13.0.bb by adding libdir ?
It is much a bug fix than a longterm solution, but if any waf version
breaks options, it can be a nightmare to handle...

2017-12-12 16:56 GMT+01:00 Stefan Agner <stefan@agner.ch>:

> On 2017-12-12 16:47, Otavio Salvador wrote:
> > On Tue, Dec 12, 2017 at 12:38 PM, Stefan Agner <stefan@agner.ch> wrote:
> >> On 2017-12-12 15:13, Burton, Ross wrote:
> >>
> >>> On 12 December 2017 at 14:03, Stefan Agner <stefan@agner.ch> wrote:
> >>>
> >>>> On 2017-12-12 15:00, Burton, Ross wrote:
> >>>>
> >>>>> On 12 December 2017 at 13:27, Stefan Agner <stefan@agner.ch> wrote:
> >>>>>
> >>>>>> On some build hosts distros (e.g. Fedora 26) waf tries to be
> >>>>>> smart about libdir detection and defaults to [EXEC_PREFIX/lib64].
> >>>>>> This obviously is not what we want for 32-bit targets and usually
> >>>>>> fails in the do_package phase:
> >>>>>> WARNING: gstreamer1.0-plugins-imx-0.13.0-r0 do_package: QA Issue:
> gstreamer1.0-plugins-imx: Files/directories were installed but not shipped
> in any package:
> >>>>>> /usr/lib64/libgstimxcommon.so.0
> >>>>>>
> >>>>>> Waf knows prefix, bindir and libdir as default options. Explicitly
> >>>>>> pass those three.
> >>>>>
> >>>>> Obviously not.
> >>>>>
> >>>>> ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function failed:
> do_configure (log file is located at /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.
> do_configure.17278)
> >>>>> ERROR: Logfile of failure stored in: /data/poky-tmp/master/build/
> work/corei7-64-poky-linux/eglinfo-x11/1.0.0-r0/temp/log.do_configure.17278
> >>>>> Log data follows:
> >>>>> | DEBUG: Executing shell function do_configure
> >>>>> | waf [commands] [options]
> >>>>> |
> >>>>> | Main commands (example: ./waf build -j4)
> >>>>> |   build    : executes the build
> >>>>> |   clean    : cleans the project
> >>>>> |   configure: configures the project
> >>>>> |   dist     : makes a tarball for redistributing the sources
> >>>>> |   distcheck: checks if the project compiles (tarball from 'dist')
> >>>>> |   distclean: removes the build directory
> >>>>> |   install  : installs the targets on the system
> >>>>> |   list     : lists the targets to execute
> >>>>> |   step     : executes tasks in a step-by-step fashion, for
> debugging
> >>>>> |   uninstall: removes the targets installed
> >>>>> |   update   : updates the plugins from the *waflib/extras* directory
> >>>>> |
> >>>>> | waf: error: no such option: --bindir
> >>>>>
> >>>> Hm, eglinfo seems to come with a old waf version, 1.7.8 to be
> specific.
> >>>>
> >>>> It seems bindir/libdir got added in 1.8 series:
> >>>> https://github.com/waf-project/waf/blob/waf-1.8/waflib/Options.py
> >>>>
> >>>> Make version specific variables?
> >>>
> >>> That neatly shows where the "clever code" that was breaking libdir
> earlier is:
> >>>
> >>> https://github.com/waf-project/waf/commit/
> 823b4cd2dc03d06a81e0ab003606067da03d8745#diff-
> b44b0c8f383b2fd1b19f2ba039d30237
> >>>
> >>
> >> Yeah that seems to be it.
> >>
> >> That go added in the 1.8.6 dev cycle afaik.
> >>
> >> I am thinking about adding some kind of version autodetection
> >>
> >> WAFMINOR=$(${S}/waf --version | sed -e '1{s/waf [0-9]\.//;s/\.[0-9]*
> >> (.*//};q')
> >>
> >> if [ $WAFMINOR -gt "7" ] ...
> >>
> >> Maybe there is a nicer way of doing this?
> >
> > What about we provide a package waf version and replace the binaries
> > prior building? So we know what version we'd be using. Kinda
> > autoreconf run in autotools class.
>
> Waf seems to be extensible using wscript. I don't know how exactly
> wscript depends on waf (version) and whether the API is considered
> stable...
>
> I'd rather prefer not taking chances...
>
> --
> Stefan
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11418b8cfb3b88056026cd75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">As waf_do_configure takes care of EXTRA_OECONF, maybe we c=
an only fix=C2=A0<a href=3D"http://gstreamer1.0-plugins-imx_0.13.0.bb">gstr=
eamer1.0-plugins-imx_0.13.0.bb</a> by adding libdir ?=C2=A0<div>It is much =
a bug fix than a longterm solution, but if any waf version breaks options, =
it can be a nightmare to handle...</div></div><div class=3D"gmail_extra"><b=
r><div class=3D"gmail_quote">2017-12-12 16:56 GMT+01:00 Stefan Agner <span =
dir=3D"ltr">&lt;<a href=3D"mailto:stefan@agner.ch" target=3D"_blank">stefan=
@agner.ch</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"H=
OEnZb"><div class=3D"h5">On 2017-12-12 16:47, Otavio Salvador wrote:<br>
&gt; On Tue, Dec 12, 2017 at 12:38 PM, Stefan Agner &lt;<a href=3D"mailto:s=
tefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br>
&gt;&gt; On 2017-12-12 15:13, Burton, Ross wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; On 12 December 2017 at 14:03, Stefan Agner &lt;<a href=3D"mail=
to:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On 2017-12-12 15:00, Burton, Ross wrote:<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; On 12 December 2017 at 13:27, Stefan Agner &lt;<a href=
=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On some build hosts distros (e.g. Fedora 26) waf t=
ries to be<br>
&gt;&gt;&gt;&gt;&gt;&gt; smart about libdir detection and defaults to [EXEC=
_PREFIX/lib64].<br>
&gt;&gt;&gt;&gt;&gt;&gt; This obviously is not what we want for 32-bit targ=
ets and usually<br>
&gt;&gt;&gt;&gt;&gt;&gt; fails in the do_package phase:<br>
&gt;&gt;&gt;&gt;&gt;&gt; WARNING: gstreamer1.0-plugins-imx-0.13.<wbr>0-r0 d=
o_package: QA Issue: gstreamer1.0-plugins-imx: Files/directories were insta=
lled but not shipped in any package:<br>
&gt;&gt;&gt;&gt;&gt;&gt; /usr/lib64/libgstimxcommon.so.<wbr>0<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; Waf knows prefix, bindir and libdir as default opt=
ions. Explicitly<br>
&gt;&gt;&gt;&gt;&gt;&gt; pass those three.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; Obviously not.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; ERROR: eglinfo-x11-1.0.0-r0 do_configure: Function fai=
led: do_configure (log file is located at /data/poky-tmp/master/build/<wbr>=
work/corei7-64-poky-linux/<wbr>eglinfo-x11/1.0.0-r0/temp/log.<wbr>do_config=
ure.17278)<br>
&gt;&gt;&gt;&gt;&gt; ERROR: Logfile of failure stored in: /data/poky-tmp/ma=
ster/build/<wbr>work/corei7-64-poky-linux/<wbr>eglinfo-x11/1.0.0-r0/temp/lo=
g.<wbr>do_configure.17278<br>
&gt;&gt;&gt;&gt;&gt; Log data follows:<br>
&gt;&gt;&gt;&gt;&gt; | DEBUG: Executing shell function do_configure<br>
&gt;&gt;&gt;&gt;&gt; | waf [commands] [options]<br>
&gt;&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt;&gt; | Main commands (example: ./waf build -j4)<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0build=C2=A0 =C2=A0 : executes the build<=
br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0clean=C2=A0 =C2=A0 : cleans the project<=
br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0configure: configures the project<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0dist=C2=A0 =C2=A0 =C2=A0: makes a tarbal=
l for redistributing the sources<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0distcheck: checks if the project compile=
s (tarball from &#39;dist&#39;)<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0distclean: removes the build directory<b=
r>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0install=C2=A0 : installs the targets on =
the system<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0list=C2=A0 =C2=A0 =C2=A0: lists the targ=
ets to execute<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0step=C2=A0 =C2=A0 =C2=A0: executes tasks=
 in a step-by-step fashion, for debugging<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0uninstall: removes the targets installed=
<br>
&gt;&gt;&gt;&gt;&gt; |=C2=A0 =C2=A0update=C2=A0 =C2=A0: updates the plugins=
 from the *waflib/extras* directory<br>
&gt;&gt;&gt;&gt;&gt; |<br>
&gt;&gt;&gt;&gt;&gt; | waf: error: no such option: --bindir<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Hm, eglinfo seems to come with a old waf version, 1.7.8 to=
 be specific.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; It seems bindir/libdir got added in 1.8 series:<br>
&gt;&gt;&gt;&gt; <a href=3D"https://github.com/waf-project/waf/blob/waf-1.8=
/waflib/Options.py" rel=3D"noreferrer" target=3D"_blank">https://github.com=
/waf-<wbr>project/waf/blob/waf-1.8/<wbr>waflib/Options.py</a><br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Make version specific variables?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; That neatly shows where the &quot;clever code&quot; that was b=
reaking libdir earlier is:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; <a href=3D"https://github.com/waf-project/waf/commit/823b4cd2d=
c03d06a81e0ab003606067da03d8745#diff-b44b0c8f383b2fd1b19f2ba039d30237" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/waf-<wbr>project/waf/c=
ommit/<wbr>823b4cd2dc03d06a81e0ab00360606<wbr>7da03d8745#diff-<wbr>b44b0c8f=
383b2fd1b19f2ba039d302<wbr>37</a><br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yeah that seems to be it.<br>
&gt;&gt;<br>
&gt;&gt; That go added in the 1.8.6 dev cycle afaik.<br>
&gt;&gt;<br>
&gt;&gt; I am thinking about adding some kind of version autodetection<br>
&gt;&gt;<br>
&gt;&gt; WAFMINOR=3D$(${S}/waf --version | sed -e &#39;1{s/waf [0-9]\.//;s/=
\.[0-9]*<br>
&gt;&gt; (.*//};q&#39;)<br>
&gt;&gt;<br>
&gt;&gt; if [ $WAFMINOR -gt &quot;7&quot; ] ...<br>
&gt;&gt;<br>
&gt;&gt; Maybe there is a nicer way of doing this?<br>
&gt;<br>
&gt; What about we provide a package waf version and replace the binaries<b=
r>
&gt; prior building? So we know what version we&#39;d be using. Kinda<br>
&gt; autoreconf run in autotools class.<br>
<br>
</div></div>Waf seems to be extensible using wscript. I don&#39;t know how =
exactly<br>
wscript depends on waf (version) and whether the API is considered<br>
stable...<br>
<br>
I&#39;d rather prefer not taking chances...<br>
<br>
--<br>
Stefan<br>
<div class=3D"HOEnZb"><div class=3D"h5">--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a11418b8cfb3b88056026cd75--
