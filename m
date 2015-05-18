Return-Path: <kergoth@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id DBB9E741E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 15:15:25 +0000 (UTC)
Received: by qcbgu10 with SMTP id gu10so90627865qcb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 May 2015 08:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=GK1+/RDytLPPzFA7JhnCcVTZGE7DVNThq88x/qq4tzU=;
	b=eD0IzISyJwHMkbcls4+8kUQQ1ycM6bG6W0nbRUXHn7Wr4oe6jiIjIIJ4ghNqpYQf4J
	P/xkYjP2OdpiTZHwqItyMLw67/J0M1LwQlmdajRe/jJJUM0M2krcEaVR6G6Ypk4QVoXs
	COfLA6aASrH+JbeBOZJYiaJvrwdA4yEXlafBR6A5RvdQP4EBzNoNIIbK+Mnf0sYL5s1e
	G9MGjvqAxx/DhBZdQ+NOkjabX9Z1NNH79y5J5DimiXIEhUBGAQF3o0F8+kMXkHnduTA+
	3Jbw0hdeDQUCnKIAtCqHfdwzlNoa4U6Z6nkH6FlJSU00J1/r4OlQCPqBrMY5Py4RIUmB
	kiEA==
X-Received: by 10.55.16.67 with SMTP id a64mr48924584qkh.31.1431962126239;
	Mon, 18 May 2015 08:15:26 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.140.108.117 with HTTP; Mon, 18 May 2015 08:15:05 -0700 (PDT)
In-Reply-To: <1616768.92EeT3bkJG@peggleto-mobl.ger.corp.intel.com>
References: <55555B65.80600@windriver.com>
	<2117516.tkUI32xNOp@peggleto-mobl.ger.corp.intel.com>
	<CAP9ODKqzPP=wSQFxO+0E1XFjbd6rZfqo_GZbQYzNgYEFpAzKuw@mail.gmail.com>
	<1616768.92EeT3bkJG@peggleto-mobl.ger.corp.intel.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Mon, 18 May 2015 08:15:05 -0700
X-Google-Sender-Auth: tt8w8O0Ei8LxxRKtgv82BpvTJgk
Message-ID: <CABcZAN=iM=U1F01=Gpt_vCdksSht8LPU5mAYHBvq_qn4pdt8mQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Add something like bitbake -cmenuconfig <recipe> ?
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
X-List-Received-Date: Mon, 18 May 2015 15:15:26 -0000
Content-Type: multipart/alternative; boundary=001a1146f2c2ddce7905165ca9cc

--001a1146f2c2ddce7905165ca9cc
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2015 at 5:04 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Monday 18 May 2015 08:52:04 Otavio Salvador wrote:
> > On Mon, May 18, 2015 at 5:45 AM, Paul Eggleton
> >
> > <paul.eggleton@linux.intel.com> wrote:
> > > Hi Robert,
> > >
> > > On Monday 18 May 2015 09:52:50 Robert Yang wrote:
> > >> On 05/17/2015 05:34 AM, Richard Purdie wrote:
> > >> > On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:
> > >> >> Is is useful/possible if we add something like bitbake <recipe>
> > >> >> -cmenuconfig, just like kernel's make menuconfig ?
> > >> >>
> > >> >> We can use the menuconfig to config the vars such as MACHINE,
> DL_DIR,
> > >> >> DISTRO_FEATURES, MACHINE_FEATURES and all the variables which are
> > >> >> configurable, I think that this would help the newbie a lot.
> > >> >>
> > >> >> I think that we can add a menuconfig.bbclass (or other names) to =
do
> > >> >> this,
> > >> >> and I'd like to work on it.
> > >> >
> > >> > Why would you want to specify a <recipe> when configuring MACHINE?=
 I
> > >> > understand why you're thinking this but it isn't well thought out
> and
> > >> > in
> > >> > this form would confuse users more than help them.
> > >> >
> > >> > I don't think the system will even parse without a valid MACHINE,
> let
> > >> > alone execute tasks.
> > >>
> > >> I meant that we need something to help configure the build easier, i=
t
> > >> can generate something like local.conf.append, not configure the
> recipe.
> > >>
> > >> The example "bitbake <recipe> -cmenuconfig" wasn't right enough, it'=
s
> > >> just a rough thought, we can use the current default local.conf
> > >> (MACHINE =3D qemux86) to make system parse.
> > >>
> > >> The problem is that we have many bbclasses in oe-core, a lot of them
> > >> has specify configurations, and also a lot of vars in the conf file
> such
> > >> as bitbake.conf, it's not easy to know how and what to config,
> > >> especially,
> > >> for newbies. The "bitbake -cmenuconfig" maybe not a good idea, I thi=
nk
> > >> that
> > >> we need something to help config the build (generate local.conf)
> easier,
> > >> do you have any suggestions, please ?
> > >
> > > This is likely the direction we will be going in with the Toaster web
> UI -
> > > with a web-based tool we can present a much friendlier interface and
> have
> > > the chance to link to other information, for example we can link to t=
he
> > > appropriate manual section for individual variables (and in future
> error
> > > messages, classes, etc.), analyse the output of the build, manage
> > > multiple sets of configuration, etc. These are things that would be
> > > difficult to do practically from the command line.
> >
> > Toaster is nice but we shouldn't stop improving cmdline use as the
> > first won't work for some use-cases.
>
> Sure, I'm pointing out that this kind of thing is being worked on in a
> slightly different context, it's not that nothing is being done in this
> area.


A good first step for both may be to add more typing information to the
metadata, so the UI can present something more intelligent than a bunch of
text boxes for text input. I expect that would be useful for any
configuration UI, whether toaster or console.

I=E2=80=99d certainly find a curses / menuconfig style interface to be inte=
resting,
I=E2=80=99m sure there are folks who would find it useful, as long as it=E2=
=80=99s done
well.

My question would be, how does the UI determine what variables to present?
Do we hardcode the list of variables they might want to edit, or provide
that information in the metadata in some fashion?
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1146f2c2ddce7905165ca9cc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, May 18, 2015 at 5:04 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D=
"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linu=
x.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div cl=
ass=3D"HOEnZb"><div class=3D"h5">On Monday 18 May 2015 08:52:04 Otavio Salv=
ador wrote:<br>
&gt; On Mon, May 18, 2015 at 5:45 AM, Paul Eggleton<br>
&gt;<br>
&gt; &lt;<a href=3D"mailto:paul.eggleton@linux.intel.com">paul.eggleton@lin=
ux.intel.com</a>&gt; wrote:<br>
&gt; &gt; Hi Robert,<br>
&gt; &gt;<br>
&gt; &gt; On Monday 18 May 2015 09:52:50 Robert Yang wrote:<br>
&gt; &gt;&gt; On 05/17/2015 05:34 AM, Richard Purdie wrote:<br>
&gt; &gt;&gt; &gt; On Fri, 2015-05-15 at 10:35 +0800, Robert Yang wrote:<br=
>
&gt; &gt;&gt; &gt;&gt; Is is useful/possible if we add something like bitba=
ke &lt;recipe&gt;<br>
&gt; &gt;&gt; &gt;&gt; -cmenuconfig, just like kernel&#39;s make menuconfig=
 ?<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; We can use the menuconfig to config the vars such as=
 MACHINE, DL_DIR,<br>
&gt; &gt;&gt; &gt;&gt; DISTRO_FEATURES, MACHINE_FEATURES and all the variab=
les which are<br>
&gt; &gt;&gt; &gt;&gt; configurable, I think that this would help the newbi=
e a lot.<br>
&gt; &gt;&gt; &gt;&gt;<br>
&gt; &gt;&gt; &gt;&gt; I think that we can add a menuconfig.bbclass (or oth=
er names) to do<br>
&gt; &gt;&gt; &gt;&gt; this,<br>
&gt; &gt;&gt; &gt;&gt; and I&#39;d like to work on it.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; Why would you want to specify a &lt;recipe&gt; when conf=
iguring MACHINE? I<br>
&gt; &gt;&gt; &gt; understand why you&#39;re thinking this but it isn&#39;t=
 well thought out and<br>
&gt; &gt;&gt; &gt; in<br>
&gt; &gt;&gt; &gt; this form would confuse users more than help them.<br>
&gt; &gt;&gt; &gt;<br>
&gt; &gt;&gt; &gt; I don&#39;t think the system will even parse without a v=
alid MACHINE, let<br>
&gt; &gt;&gt; &gt; alone execute tasks.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I meant that we need something to help configure the build ea=
sier, it<br>
&gt; &gt;&gt; can generate something like local.conf.append, not configure =
the recipe.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The example &quot;bitbake &lt;recipe&gt; -cmenuconfig&quot; w=
asn&#39;t right enough, it&#39;s<br>
&gt; &gt;&gt; just a rough thought, we can use the current default local.co=
nf<br>
&gt; &gt;&gt; (MACHINE =3D qemux86) to make system parse.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; The problem is that we have many bbclasses in oe-core, a lot =
of them<br>
&gt; &gt;&gt; has specify configurations, and also a lot of vars in the con=
f file such<br>
&gt; &gt;&gt; as bitbake.conf, it&#39;s not easy to know how and what to co=
nfig,<br>
&gt; &gt;&gt; especially,<br>
&gt; &gt;&gt; for newbies. The &quot;bitbake -cmenuconfig&quot; maybe not a=
 good idea, I think<br>
&gt; &gt;&gt; that<br>
&gt; &gt;&gt; we need something to help config the build (generate local.co=
nf) easier,<br>
&gt; &gt;&gt; do you have any suggestions, please ?<br>
&gt; &gt;<br>
&gt; &gt; This is likely the direction we will be going in with the Toaster=
 web UI -<br>
&gt; &gt; with a web-based tool we can present a much friendlier interface =
and have<br>
&gt; &gt; the chance to link to other information, for example we can link =
to the<br>
&gt; &gt; appropriate manual section for individual variables (and in futur=
e error<br>
&gt; &gt; messages, classes, etc.), analyse the output of the build, manage=
<br>
&gt; &gt; multiple sets of configuration, etc. These are things that would =
be<br>
&gt; &gt; difficult to do practically from the command line.<br>
&gt;<br>
&gt; Toaster is nice but we shouldn&#39;t stop improving cmdline use as the=
<br>
&gt; first won&#39;t work for some use-cases.<br>
<br>
</div></div>Sure, I&#39;m pointing out that this kind of thing is being wor=
ked on in a<br>
slightly different context, it&#39;s not that nothing is being done in this=
 area.</blockquote><div><br></div><div>A good first step for both may be to=
 add more typing information to the metadata, so the UI can present somethi=
ng more intelligent than a bunch of text boxes for text input. I expect tha=
t would be useful for any configuration UI, whether toaster or console.</di=
v><div><br></div><div>I=E2=80=99d certainly find a curses / menuconfig styl=
e interface to be interesting, I=E2=80=99m sure there are folks who would f=
ind it useful, as long as it=E2=80=99s done well.</div><div><br></div><div>=
My question would be, how does the UI determine what variables to present? =
Do we hardcode the list of variables they might want to edit, or provide th=
at information in the metadata in some fashion?</div></div>-- <br><div clas=
s=3D"gmail_signature">Christopher Larson<br>clarson at kergoth dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics</div>
</div></div>

--001a1146f2c2ddce7905165ca9cc--
