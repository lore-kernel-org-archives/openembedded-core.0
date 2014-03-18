Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 265F56F904
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 14:39:01 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id hr17so4812404lab.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=/VwOmOwGosrfKpfV+JhJ7PRlfnF6i9/UmPs4zpl9GvA=;
	b=FuJjbXLKedeeps/lXcXAza1UlBNUbnIKDeEg4kg/pxkSzhg3Hfpqn8m4yFk/wwKK6Q
	MaJyWXv/7omOlJmei5q0UyCbC5WfW2LssmN/gaLjqq3bkdJ/N7SZ2DEFibdS39v1xhm3
	QldsVQlFRQ0QfaquYQnSDLG1uLJ/RUc6aTiu1gKZYXZ3uc4D4gYli/1f4NHRyJ6b+ctN
	v6JSXurJj38lMnWtuIOfw3ccpL8wygAtRzz9+jmjsGwR4oWnHAeBeyOoNaYMzCCpGcf1
	t+R6RV95Ahhadm15SzQWGALQqhCJVs9+IC2VzslPtbM5XsDYrEzx/Rh+v4I8+azs1e0u
	t9/A==
X-Received: by 10.112.235.229 with SMTP id up5mr388226lbc.62.1395153540998;
	Tue, 18 Mar 2014 07:39:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.35.200 with HTTP; Tue, 18 Mar 2014 07:38:40 -0700 (PDT)
In-Reply-To: <1667020.PzS0jxAa6O@peggleto-mobl5.ger.corp.intel.com>
References: <1394849186-25396-1-git-send-email-kergoth@gmail.com>
	<1667020.PzS0jxAa6O@peggleto-mobl5.ger.corp.intel.com>
From: Chris Larson <kergoth@gmail.com>
Date: Tue, 18 Mar 2014 07:38:40 -0700
Message-ID: <CABcZANnY5ni7nShC0mXJP0kndowTeTet4qb0nCRvEe2V=1_pXQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe: turn oe into a namespace package
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
X-List-Received-Date: Tue, 18 Mar 2014 14:39:07 -0000
Content-Type: multipart/alternative; boundary=001a11c3d9d437ee1a04f4e27fac

--001a11c3d9d437ee1a04f4e27fac
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 18, 2014 at 6:48 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Friday 14 March 2014 19:06:26 Christopher Larson wrote:
> > This will let folks extend the oe package with modules from other layers.
> > Given openembedded consists of more than just oe-core, I think this makes
> > sense, and adds some useful flexibility.
> >
> > Signed-off-by: Christopher Larson <kergoth@gmail.com>
> > ---
> >  meta/lib/oe/__init__.py | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py
> > index e69de29..3ad9513 100644
> > --- a/meta/lib/oe/__init__.py
> > +++ b/meta/lib/oe/__init__.py
> > @@ -0,0 +1,2 @@
> > +from pkgutil import extend_path
> > +__path__ = extend_path(__path__, __name__)
>
> FWIW, this broke builds on my CentOS build machine that uses a slightly
> older
> buildtools install from 1.4. I hope we have pkgutil in our more current
> buildtools - if not could you please send a fix for that as well?


Ah, interesting, sorry about the hassle there. I'm 90% certain it's in the
current buildtools tarball, as I do all my build testing with a CentOS 6
chroot using a buildtools tarball, and didn't hit that problem, but I'll
double check.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3d9d437ee1a04f4e27fac
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Mar 18, 2014 at 6:48 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"HOEnZb adM"><div class=3D"h5">=
On Friday 14 March 2014 19:06:26 Christopher Larson wrote:<br>
&gt; This will let folks extend the oe package with modules from other laye=
rs.<br>
&gt; Given openembedded consists of more than just oe-core, I think this ma=
kes<br>
&gt; sense, and adds some useful flexibility.<br>
&gt;<br>
&gt; Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:kergoth@gmail.=
com">kergoth@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; =C2=A0meta/lib/oe/__init__.py | 2 ++<br>
&gt; =C2=A01 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta/lib/oe/__init__.py b/meta/lib/oe/__init__.py<br>
&gt; index e69de29..3ad9513 100644<br>
&gt; --- a/meta/lib/oe/__init__.py<br>
&gt; +++ b/meta/lib/oe/__init__.py<br>
&gt; @@ -0,0 +1,2 @@<br>
&gt; +from pkgutil import extend_path<br>
&gt; +__path__ =3D extend_path(__path__, __name__)<br>
<br>
</div></div>FWIW, this broke builds on my CentOS build machine that uses a =
slightly older<br>
buildtools install from 1.4. I hope we have pkgutil in our more current<br>
buildtools - if not could you please send a fix for that as well?</blockquo=
te></div><br></div><div class=3D"gmail_extra">Ah, interesting, sorry about =
the hassle there. I&#39;m 90% certain it&#39;s in the current buildtools ta=
rball, as I do all my build testing with a CentOS 6 chroot using a buildtoo=
ls tarball, and didn&#39;t hit that problem, but I&#39;ll double check.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c3d9d437ee1a04f4e27fac--
