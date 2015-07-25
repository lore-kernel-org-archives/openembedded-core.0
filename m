Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 63D6B76294
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 19:18:29 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so56351193igb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jul 2015 12:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AbUnMIR9P/fPFfellXjDxNyqC+XPi0bmjp1uOHYBHWs=;
	b=DMda8uQP3huqJvZflnEKie4uG+RpKrUv6DZ9WMSU/DjYq6FFDzyVQZQKyKRmXuiqLP
	UH93UXed14VZEk789DOdXTMPwBt2qLFsFcGe4v4/7Ygj6YVEzFoI7slQxW5xHATmrkj3
	ksQ2S8FPLZ69gv1IrMC0ZSvgwUhIihoJQ1lrwq/h3oetyGMBpIpQkasHbMF7QYgXQXMV
	/wSXsTXTfqlA91Q/DaQAgeBdUDYbCWrXXeE6trPxYTXr7wGlprmkGh0pf/7gJMLzgisp
	oNc8luK2f6K0RIhNxofgek+1Ug+2FU+v/D04gi+rsZc9/yAAWG2O4Qk4VF25XK+CiREU
	OPyg==
X-Received: by 10.107.25.18 with SMTP id 18mr32733375ioz.39.1437851909811;
	Sat, 25 Jul 2015 12:18:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.79.100.199 with HTTP; Sat, 25 Jul 2015 12:18:10 -0700 (PDT)
In-Reply-To: <1437840549.821.171.camel@linuxfoundation.org>
References: <cover.1437663603.git.chris_larson@mentor.com>
	<1437840549.821.171.camel@linuxfoundation.org>
From: Christopher Larson <kergoth@gmail.com>
Date: Sat, 25 Jul 2015 12:18:10 -0700
Message-ID: <CABcZANnnqTczLS4B=663mrPOG7i3WoKXdkPONu0wScxgHdSMGw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv3 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Sat, 25 Jul 2015 19:18:32 -0000
Content-Type: multipart/alternative; boundary=001a113ff1e852f4bf051bb7fcef

--001a113ff1e852f4bf051bb7fcef
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2015 at 9:09 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2015-07-23 at 12:57 -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Ensures that recipetool and devtool pull plugins from layers, and
> > oe-selftest will pull tests from layers.
> >
> > Unrelated to that, also prevents a traceback on parsing failure, and ad=
ds
> > a tiny feature to appendsrc to facilitate reuse by other sub-commands.
> >
> > [v3 Update] Fixed the commit message for `devtool: also load plugins fr=
om
> > BBPATH` to match the implementation. Split up `recipetool: also load
> plugins
> > from BBPATH` into two commits with clear commit messages.
> >
> > [v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it n=
o
> longer
> > breaks the devtool selftests.
>
> I know there are some issues with oe-selftest on the autobuilder at the
> moment, specifically master results in things like:
>
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/bu=
ilds/93
>
> however when I apply this and your other series, the autobuilder
> oe-selftest does this:
>
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-oe-selftest/bu=
ilds/92/steps/Running%20oe-selftest/logs/stdio
>
> which is substantially worse. I can't immediately see what the issue is
> but the two runs above pretty much bisect this down to the patch series.
> I'm therefore reluctant to merge these until we can figure out what is
> going on...


Given that both failures have nothing to do with devtool, recipetool, or
oe-selftest and are simply bitbake build failures as called by tests, I
don=E2=80=99t really see how these could have anything to do with that, but
understood.
--=20
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a113ff1e852f4bf051bb7fcef
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Sat, Jul 25, 2015 at 9:09 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.=
purdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><span class=3D"">On Thu, 2015-07-23 at 12:57 -0700, Christopher Lar=
son wrote:<br>
&gt; From: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor.com=
">chris_larson@mentor.com</a>&gt;<br>
&gt;<br>
&gt; Ensures that recipetool and devtool pull plugins from layers, and<br>
&gt; oe-selftest will pull tests from layers.<br>
&gt;<br>
&gt; Unrelated to that, also prevents a traceback on parsing failure, and a=
dds<br>
&gt; a tiny feature to appendsrc to facilitate reuse by other sub-commands.=
<br>
&gt;<br>
&gt; [v3 Update] Fixed the commit message for `devtool: also load plugins f=
rom<br>
&gt; BBPATH` to match the implementation. Split up `recipetool: also load p=
lugins<br>
&gt; from BBPATH` into two commits with clear commit messages.<br>
&gt;<br>
&gt; [v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it =
no longer<br>
&gt; breaks the devtool selftests.<br>
<br>
</span>I know there are some issues with oe-selftest on the autobuilder at =
the<br>
moment, specifically master results in things like:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-oe-se=
lftest/builds/93" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.=
yoctoproject.org/main/builders/nightly-oe-selftest/builds/93</a><br>
<br>
however when I apply this and your other series, the autobuilder<br>
oe-selftest does this:<br>
<br>
<a href=3D"https://autobuilder.yoctoproject.org/main/builders/nightly-oe-se=
lftest/builds/92/steps/Running%20oe-selftest/logs/stdio" rel=3D"noreferrer"=
 target=3D"_blank">https://autobuilder.yoctoproject.org/main/builders/night=
ly-oe-selftest/builds/92/steps/Running%20oe-selftest/logs/stdio</a><br>
<br>
which is substantially worse. I can&#39;t immediately see what the issue is=
<br>
but the two runs above pretty much bisect this down to the patch series.<br=
>
I&#39;m therefore reluctant to merge these until we can figure out what is<=
br>
going on...</blockquote></div><br>Given that both failures have nothing to =
do with devtool, recipetool, or oe-selftest and are simply bitbake build fa=
ilures as called by tests, I don=E2=80=99t really see how these could have =
anything to do with that, but understood.<br>-- <br><div class=3D"gmail_sig=
nature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>=
Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior=
 Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a113ff1e852f4bf051bb7fcef--
