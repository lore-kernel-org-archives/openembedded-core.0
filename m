Return-Path: <kergoth@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 053CE73CF2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 15:29:41 +0000 (UTC)
Received: by qkdl129 with SMTP id l129so155454566qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jul 2015 08:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=MJzvVJ8GruVh+XstnMPJdQCFJx7ts+WrETplwHLyABo=;
	b=cvaMwz5Up5x9yOI1gOjS34zh1V7Q5OXTcXYUowBmCHub341BVECqzXriElsd/Sh0HV
	ig8QuXl0gBESM6V6mlhwZaERrOZeCFbfTjw5AoEh/hquwPzWxmA1cYFR/4G1whFZLMb0
	f6YTyJBCUDkS7MBiM+TMYBfnJ/2t5PFfRRXapvZekfV2MvAZp/5zXxEtcUSapqSL4kQN
	FBZ4OTDnjXLct0FfN9XdAaXbC+KlBnmeywEONSwpNAwmDqnovLcTln/oFPYdjp5eVNeV
	aj/4y8QTxZ3CS9UxvSMZJegFMBQLlztaCZ9fpf6/xS9w53Nx7HvpuFSHgyS7fGcR4dti
	v8/A==
X-Received: by 10.140.231.8 with SMTP id b8mr4778214qhc.55.1437578981401; Wed,
	22 Jul 2015 08:29:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.108.55 with HTTP; Wed, 22 Jul 2015 08:29:22 -0700 (PDT)
In-Reply-To: <2606699.EhWc0CorW2@peggleto-mobl.ger.corp.intel.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
	<2606699.EhWc0CorW2@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <kergoth@gmail.com>
Date: Wed, 22 Jul 2015 08:29:22 -0700
Message-ID: <CABcZAN=i4h656sKf2OuAeeA0any2ZNL_pM=FZAsB2-QsxchDZg@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 0/6] recipetool/devtool/oe-selftest: pull from BBPATH
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
X-List-Received-Date: Wed, 22 Jul 2015 15:29:43 -0000
Content-Type: multipart/alternative; boundary=001a1135cb748606ab051b787042

--001a1135cb748606ab051b787042
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 22, 2015 at 4:02 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 20 July 2015 15:15:38 Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Ensures that recipetool and devtool pull plugins from layers, and
> > oe-selftest will pull tests from layers.
> >
> > Unrelated to that, also prevents a traceback on parsing failure, and adds
> > a tiny feature to appendsrc to facilitate reuse by other sub-commands.
> >
> > [v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it no
> > longer breaks the devtool selftests.
> >
> >
> > The following changes since commit
> b283b82ec59a2137cf717811172765848fa813fa:
> >
> >   core-image-lsb-sdk: use kernel-devsrc to ensure kernel module builds
> work
> > (2015-07-20 10:39:02 +0100)
> >
> > are available in the git repository at:
> >
> >   git@github.com:kergoth/openembedded-core yocto-bug-7625
> >
> > for you to fetch changes up to 35a9ce57747248192dc5c0dd7916e15e58a5835e:
> >
> >   oe-selftest: add libdirs from BBPATH to sys.path (2015-07-20 15:11:59
> > -0700)
> >
> > ----------------------------------------------------------------
> > Christopher Larson (6):
> >       recipetool: catch BBHandledException from parsing
> >       recipetool.append: add extralines arg to appendsrc
> >       recipetool: also load plugins from BBPATH
> >       devtool: also load plugins from BBPATH
> >       oe-selftest: obey oeqa.selftest.__path__
> >       oe-selftest: add libdirs from BBPATH to sys.path
> >
> >  scripts/devtool                  | 57
> > +++++++++++++++++++++++++---------------
> scripts/lib/devtool/__init__.py  |
> >  4 +--
> >  scripts/lib/recipetool/append.py |  4 +--
> >  scripts/oe-selftest              | 18 +++++++++----
> >  scripts/recipetool               | 56
> > ++++++++++++++++++++++++--------------- 5 files changed, 88
> insertions(+),
> > 51 deletions(-)
>
> Overall I'm happy with this set of changes apart from the commit messages
> for
> the devtool and recipetool plugin loading commits as separately noted. (The
> other changes could conceivably go in ahead).


Thanks for the feedback, will get a v3 out today.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1135cb748606ab051b787042
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jul 22, 2015 at 4:02 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v class=3D"HOEnZb adM"><div class=3D"h5">On Monday 20 July 2015 15:15:38 Ch=
ristopher Larson wrote:<br>
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
&gt; [v2 Update] `devtool: also load plugins from BBPATH` was fixed, so it =
no<br>
&gt; longer breaks the devtool selftests.<br>
&gt;<br>
&gt;<br>
&gt; The following changes since commit b283b82ec59a2137cf717811172765848fa=
813fa:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0core-image-lsb-sdk: use kernel-devsrc to ensure kernel mod=
ule builds work<br>
&gt; (2015-07-20 10:39:02 +0100)<br>
&gt;<br>
&gt; are available in the git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0git@github.com:kergoth/openembedded-core yocto-bug-7625<br=
>
&gt;<br>
&gt; for you to fetch changes up to 35a9ce57747248192dc5c0dd7916e15e58a5835=
e:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0oe-selftest: add libdirs from BBPATH to sys.path (2015-07-=
20 15:11:59<br>
&gt; -0700)<br>
&gt;<br>
&gt; ----------------------------------------------------------------<br>
&gt; Christopher Larson (6):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0recipetool: catch BBHandledException from pa=
rsing<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0recipetool.append: add extralines arg to app=
endsrc<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0recipetool: also load plugins from BBPATH<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0devtool: also load plugins from BBPATH<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe-selftest: obey oeqa.selftest.__path__<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0oe-selftest: add libdirs from BBPATH to sys.=
path<br>
&gt;<br>
&gt;=C2=A0 scripts/devtool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 57<br>
&gt; +++++++++++++++++++++++++--------------- scripts/lib/devtool/__init__.=
py=C2=A0 |<br>
&gt;=C2=A0 4 +--<br>
&gt;=C2=A0 scripts/lib/recipetool/append.py |=C2=A0 4 +--<br>
&gt;=C2=A0 scripts/oe-selftest=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 18 +++++++++----<br>
&gt;=C2=A0 scripts/recipetool=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 56<br>
&gt; ++++++++++++++++++++++++--------------- 5 files changed, 88 insertions=
(+),<br>
&gt; 51 deletions(-)<br>
<br>
</div></div>Overall I&#39;m happy with this set of changes apart from the c=
ommit messages for<br>
the devtool and recipetool plugin loading commits as separately noted. (The=
<br>
other changes could conceivably go in ahead).</blockquote></div><br>Thanks =
for the feedback, will get a v3 out today.<br>-- <br><div class=3D"gmail_si=
gnature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br=
>Founder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senio=
r Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1135cb748606ab051b787042--
