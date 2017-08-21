Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id E73017830D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 15:03:16 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id n29so2499582uai.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=T4haxTGAYIYldtpyd9yAxJ0On0PjlIUG7YWyIMQ0jH4=;
	b=DE+QqoM5aaLATz6KTqzrqKNQD7Bz84RG0vPvEmn3fwMkL9BD226YiVZ76CTNljojjN
	2TtP0Sl6dv3pmyI/eefryXH2ANDUtBFKt+Zb/pBqCR9zHasNlc/SN5xdlpypJyB+5RNx
	CQdsVO527jiyTmlMvdnGhoHL2XX2IMqbnoD+310HUcqryrpCTiv5bWOMf/ebf0LpvHMI
	I4RPDGv0rO3sWnQbr5VDhjJKIaRq8D0mH+53bmOaQU/NUZL4cBsfvYXecoO2FqM2YWqr
	kqjNAd0u6qN4mytTCrAPRX8XnMauDPVI4V4031e4U2o2/BjyGavx3XrIlHbt3vEBjIHZ
	FRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=T4haxTGAYIYldtpyd9yAxJ0On0PjlIUG7YWyIMQ0jH4=;
	b=mr7LF57PdL5O6iL1hidaQ68lmU9UzPq0s/BIhqnuswvWoKdMT3gyBPQz7S/zmL6R5A
	wHvSe+0CD/TsFtTsiTWONw5UvNGhuejePR0VmgZ+UFWWvPKQMv4PDQDDP53EWCcvHFIi
	PbC/qAGSYl64TEua4n47dc+SI6SsU1CsV4QdI/WQN6S9g4TJoiZeyGELOUtK+zMywAUl
	FWjRN2qXtjUtVTdOKqyyeo5rIrvzjP95wQh8FioWHrUhFgQD+QQaxMLTxCEt97jAo9OV
	SGCZJDbdB+zG+HXqOdui7bS+z00A8DZQSInjeo8DEZ7GdQ9KtbtsdQg+9LmVfTOzaQB/
	l+OA==
X-Gm-Message-State: AHYfb5gSThPZ11pd03111Y2TeTcDQw7QsLZRwM4U4NohCxfXEr4fP22e
	+tCChq5ED97qGRYuOKzS9PrL40HZqw==
X-Received: by 10.176.70.96 with SMTP id z32mr10566066uab.37.1503327797342;
	Mon, 21 Aug 2017 08:03:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.66.130 with HTTP; Mon, 21 Aug 2017 08:03:16 -0700 (PDT)
In-Reply-To: <1503326861.7168.6.camel@linux.intel.com>
References: <1503315952-28377-1-git-send-email-liu.ming50@gmail.com>
	<1503326861.7168.6.camel@linux.intel.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Mon, 21 Aug 2017 17:03:16 +0200
Message-ID: <CALatG=7TB=3xGZV6d5UcFL8uBhmqh-9cmiogxcF523w1VpyNJw@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta: move some text from oe-setup-builddir to conf-notes.txt
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
X-List-Received-Date: Mon, 21 Aug 2017 15:03:17 -0000
Content-Type: multipart/alternative; boundary="f403045f008e5776c3055744c7ae"

--f403045f008e5776c3055744c7ae
Content-Type: text/plain; charset="UTF-8"

Hi, Leonardo:

I would like to explain our scenario: we want to show our costumers the
following tips:
...
### Shell environment set up for AtlasCopco builds. ###

You can now start a build with:
F=<features> D=<distro> M=<machine> bitbake <target> [-c task]
...

and they are duplicated with the header in oe-setup-buildir, I could not
find a way to override them without this patch. Or maybe you have any other
suggestions?

//Ming Liu


2017-08-21 16:47 GMT+02:00 Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com>:

> On Mon, 2017-08-21 at 13:45 +0200, liu.ming50@gmail.com wrote:
> > From: Ming Liu <peter.x.liu@external.atlascopco.com>
> >
> > This allows the end users to be able to override the entire notes
> > showing on the shell console. For instance, Our company uses a
> > external conf-notes.txt, and we run bitbake with some extra variables,
> > looks like: F=xxx D=xxx M=xxx bitbake <target>, so we want to show
> > exactly these texts on the shell console, that's why we need this
> > change.
> >
>
> I do not clearly spot the real gain. oe-setup-buildir just plots the
> header and you can include what you specific stuff into conf-notes. The
> header string does not strictly belongs to conf-notes, at least not
> semantically.
>
>
> > Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> > ---
> >  meta/conf/conf-notes.txt  | 5 +++++
> >  scripts/oe-setup-builddir | 7 -------
> >  2 files changed, 5 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt
> > index 2f2932b..f1a4f4d 100644
> > --- a/meta/conf/conf-notes.txt
> > +++ b/meta/conf/conf-notes.txt
> > @@ -1,3 +1,8 @@
> > +
> > +### Shell environment set up for builds. ###
> > +
> > +You can now run 'bitbake <target>'
> > +
> >  Common targets are:
> >      core-image-minimal
> >      core-image-sato
> > diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
> > index ef49551..55d73ca 100755
> > --- a/scripts/oe-setup-builddir
> > +++ b/scripts/oe-setup-builddir
> > @@ -133,13 +133,6 @@ EOM
> >  #    unset SHOWYPDOC
> >  fi
> >
> > -cat <<EOM
> > -
> > -### Shell environment set up for builds. ###
> > -
> > -You can now run 'bitbake <target>'
> > -
> > -EOM
> >  if [ -z "$OECORENOTESCONF" ]; then
> >      OECORENOTESCONF="$OEROOT/meta/conf/conf-notes.txt"
> >  fi
> > --
> > 2.7.4
> >
>
>
>

--f403045f008e5776c3055744c7ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Leonardo:<div><br></div><div>I would like to explain o=
ur scenario: we want to show our costumers the following tips:</div><div>..=
.</div><div><div>### Shell environment set up for AtlasCopco builds. ###</d=
iv><div><br></div><div>You can now start a build with:</div><div>F=3D&lt;fe=
atures&gt; D=3D&lt;distro&gt; M=3D&lt;machine&gt; bitbake &lt;target&gt; [-=
c task]</div></div><div>...</div><div><br></div><div>and they are duplicate=
d with the header in=C2=A0<span style=3D"font-size:14px">oe-setup-buildir, =
I could not find a way to override them without this patch. Or maybe you ha=
ve any other suggestions?</span></div><div><span style=3D"font-size:14px"><=
br></span></div><div><span style=3D"font-size:14px">//Ming Liu</span></div>=
<div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-08-21 16:47 GMT+02:00 Leonardo Sandoval <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank"=
>leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span>:<br><blockquote =
class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid=
;padding-left:1ex"><span class=3D"">On Mon, 2017-08-21 at 13:45 +0200, <a h=
ref=3D"mailto:liu.ming50@gmail.com">liu.ming50@gmail.com</a> wrote:<br>
&gt; From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.c=
om">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt;<br>
&gt; This allows the end users to be able to override the entire notes<br>
&gt; showing on the shell console. For instance, Our company uses a<br>
&gt; external conf-notes.txt, and we run bitbake with some extra variables,=
<br>
&gt; looks like: F=3Dxxx D=3Dxxx M=3Dxxx bitbake &lt;target&gt;, so we want=
 to show<br>
&gt; exactly these texts on the shell console, that&#39;s why we need this<=
br>
&gt; change.<br>
&gt;<br>
<br>
</span>I do not clearly spot the real gain. oe-setup-buildir just plots the=
<br>
header and you can include what you specific stuff into conf-notes. The<br>
header string does not strictly belongs to conf-notes, at least not<br>
semantically.<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
<br>
&gt; Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atl=
ascopco.com">peter.x.liu@external.<wbr>atlascopco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/conf-notes.txt=C2=A0 | 5 +++++<br>
&gt;=C2=A0 scripts/oe-setup-builddir | 7 -------<br>
&gt;=C2=A0 2 files changed, 5 insertions(+), 7 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/conf/conf-notes.txt b/meta/conf/conf-notes.txt<br>
&gt; index 2f2932b..f1a4f4d 100644<br>
&gt; --- a/meta/conf/conf-notes.txt<br>
&gt; +++ b/meta/conf/conf-notes.txt<br>
&gt; @@ -1,3 +1,8 @@<br>
&gt; +<br>
&gt; +### Shell environment set up for builds. ###<br>
&gt; +<br>
&gt; +You can now run &#39;bitbake &lt;target&gt;&#39;<br>
&gt; +<br>
&gt;=C2=A0 Common targets are:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 core-image-minimal<br>
&gt;=C2=A0 =C2=A0 =C2=A0 core-image-sato<br>
&gt; diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir<br>
&gt; index ef49551..55d73ca 100755<br>
&gt; --- a/scripts/oe-setup-builddir<br>
&gt; +++ b/scripts/oe-setup-builddir<br>
&gt; @@ -133,13 +133,6 @@ EOM<br>
&gt;=C2=A0 #=C2=A0 =C2=A0 unset SHOWYPDOC<br>
&gt;=C2=A0 fi<br>
&gt;<br>
&gt; -cat &lt;&lt;EOM<br>
&gt; -<br>
&gt; -### Shell environment set up for builds. ###<br>
&gt; -<br>
&gt; -You can now run &#39;bitbake &lt;target&gt;&#39;<br>
&gt; -<br>
&gt; -EOM<br>
&gt;=C2=A0 if [ -z &quot;$OECORENOTESCONF&quot; ]; then<br>
&gt;=C2=A0 =C2=A0 =C2=A0 OECORENOTESCONF=3D&quot;$OEROOT/meta/<wbr>conf/con=
f-notes.txt&quot;<br>
&gt;=C2=A0 fi<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
<br>
<br>
</div></div></blockquote></div><br></div>

--f403045f008e5776c3055744c7ae--
