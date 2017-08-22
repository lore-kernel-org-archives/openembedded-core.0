Return-Path: <martin.jansa@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC8778229;
	Tue, 22 Aug 2017 15:50:08 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id j189so60548098vka.0;
	Tue, 22 Aug 2017 08:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=g/yQZ9/Y/X3883lCYgql5TbdKtkmg3C0SJYAipARkKk=;
	b=I1W4UgESLSu4YkUy1fpf8oEvJ6SewMZqP3L0v8rFXk7G+gDhF61mHssHrv6z+DchCE
	diZtzchWYgQ/FMGhaYSGGqA0AyiUgojzItl6obLLrYvS6evwjT8ZTqIoyqWdUyDdd0nr
	lyY7MGmHzNVaHTC+E1mr/MFTOh5QGUnblT4a182SL0G9T5Qy4cFegB8x8FkC7UfJeIT5
	EEfIQOsmuEvXHGInuDP8ny0hkiRO3mRTMQTwhA1x6fA6+gTIJj95NQiYH7l6XcFvHDOz
	8trv4Jui9BenGuW3klS2dCUEYM4HPU7sbOmRmQ98hNifbfM813bdmpGnNJWBHyD2Gw6e
	Jblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=g/yQZ9/Y/X3883lCYgql5TbdKtkmg3C0SJYAipARkKk=;
	b=Xq7Iru5I+sjAVfCWa6H8nN2tYOy3zt4Pn+DDYcoFHfQhWT4PDWAKPVQF4KJydHjcKb
	I8WDJWD2Zoac3gGA6NlRJ5KZVbfjhldFVkOc0qW4+RtNIHg4ol4QXgVkQvvEU7GHwCSS
	VivcXp/iRyywolSIRNPyPBAMmOQUkvnS2uGfHnYMzPcoJlrtTtM7ScfZTfIeR5PPYCdG
	tN+mSLIuD6kPCZr/WaVNsbNoVxJuCSOK0m6E2Zz5mK2VUzfEBvEuryV0MYbzFqIEqY8V
	MocoiEPoTprYi7oY5dEHhZKXekaV3fQ5LPdEnkzXVTbIDtwHpy6A7o5L3qze0BVWpk0/
	OkHg==
X-Gm-Message-State: AHYfb5g4J67ghb1tFvxcFQcyvnCGYSW9yHTk/322kG59mnwVtvdh7/Js
	X17OoPgdPl/jyfbHueg7fF6dikCSYQ==
X-Received: by 10.31.184.66 with SMTP id i63mr667230vkf.122.1503417009836;
	Tue, 22 Aug 2017 08:50:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Tue, 22 Aug 2017 08:50:09 -0700 (PDT)
In-Reply-To: <77D41A06-7D48-4CFE-948E-5C3D36118CA0@linux.intel.com>
References: <20170822132022.GA3308@jama>
	<77D41A06-7D48-4CFE-948E-5C3D36118CA0@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 22 Aug 2017 17:50:09 +0200
Message-ID: <CA+chaQfr4EzLQqBsLT628qSJt8wiDH+Kf5MxhJBtLewWkHJ-uQ@mail.gmail.com>
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2017-08-19
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
X-List-Received-Date: Tue, 22 Aug 2017 15:50:09 -0000
Content-Type: multipart/alternative; boundary="001a1143a716d2194a0557598c05"

--001a1143a716d2194a0557598c05
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Tim!

Check this thread:
http://lists.openembedded.org/pipermail/openembedded-core/2017-August/14108=
7.html
about python-matplotlib.

On Tue, Aug 22, 2017 at 4:29 PM, Tim Orling <
timothy.t.orling@linux.intel.com> wrote:

>
> > On Aug 22, 2017, at 6:20 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Openssl was reverted back to 1.0 version being default, so there is
> > fewer errors now, but there was also a fix for package.bbclass:
> > http://lists.openembedded.org/pipermail/openembedded-core/
> 2017-August/141127.html
> > which causes many do_package_qa tasks to fail.
> >
> > Please help by sending fixes for issues it found.
> >
> > <snip>
> >
> > =3D=3D Failed tasks 2017-08-19 =3D=3D
> >
> > INFO: jenkins-job.sh-1.8.25 Complete log available at
> http://logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.
> report.20170822_023550.log
> >
> > =3D=3D=3D common (15) =3D=3D=3D
> > <snip>
> >    * meta-openembedded/meta-perl/recipes-perl/libmodule/
> libmodule-build-perl_0.31.bb:do_package_qa
>
> I=E2=80=99ll take a shot at this one, especially since this recipe versio=
n is very
> old. Latest is 0.4224.
>
> >    * meta-openembedded/meta-python/recipes-devtools/python/
> python3-pylint_1.6.5.bb:do_package_qa
> >    * meta-openembedded/meta-python/recipes-devtools/python/
> python-matplotlib_1.1.0.bb:do_compile
>
> I=E2=80=99ll take a shot at these two. pylint version is a bit old, lates=
t is
> 1.7.2. matplotlib latest version is 2.0.2, so this recipe is very old; al=
so
> needs python3 version.
>
> > <snip>
>
>

--001a1143a716d2194a0557598c05
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Tim!<div><br></div><div>Check this thread:</div><di=
v><a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2017=
-August/141087.html">http://lists.openembedded.org/pipermail/openembedded-c=
ore/2017-August/141087.html</a><br></div><div>about python-matplotlib.</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Au=
g 22, 2017 at 4:29 PM, Tim Orling <span dir=3D"ltr">&lt;<a href=3D"mailto:t=
imothy.t.orling@linux.intel.com" target=3D"_blank">timothy.t.orling@linux.i=
ntel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D""><br>
&gt; On Aug 22, 2017, at 6:20 AM, Martin Jansa &lt;<a href=3D"mailto:martin=
.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Openssl was reverted back to 1.0 version being default, so there is<br=
>
&gt; fewer errors now, but there was also a fix for package.bbclass:<br>
&gt; <a href=3D"http://lists.openembedded.org/pipermail/openembedded-core/2=
017-August/141127.html" rel=3D"noreferrer" target=3D"_blank">http://lists.o=
penembedded.org/<wbr>pipermail/openembedded-core/<wbr>2017-August/141127.ht=
ml</a><br>
&gt; which causes many do_package_qa tasks to fail.<br>
&gt;<br>
&gt; Please help by sending fixes for issues it found.<br>
&gt;<br>
</span>&gt; &lt;snip&gt;<br>
<span class=3D"">&gt;<br>
&gt; =3D=3D Failed tasks 2017-08-19 =3D=3D<br>
&gt;<br>
&gt; INFO: jenkins-job.sh-1.8.25 Complete log available at <a href=3D"http:=
//logs.nslu2-linux.org/buildlogs/oe/world/rocko/log.report.20170822_023550.=
log" rel=3D"noreferrer" target=3D"_blank">http://logs.nslu2-linux.org/<wbr>=
buildlogs/oe/world/rocko/log.<wbr>report.20170822_023550.log</a><br>
&gt;<br>
&gt; =3D=3D=3D common (15) =3D=3D=3D<br>
</span>&gt; &lt;snip&gt;<br>
&gt;=C2=A0 =C2=A0 * meta-openembedded/meta-perl/<wbr>recipes-perl/libmodule=
/<wbr>libmodule-build-perl_0.31.bb:d<wbr>o_package_qa<br>
<br>
I=E2=80=99ll take a shot at this one, especially since this recipe version =
is very old. Latest is 0.4224.<br>
<span class=3D""><br>
&gt;=C2=A0 =C2=A0 * meta-openembedded/meta-python/<wbr>recipes-devtools/pyt=
hon/<wbr>python3-pylint_1.6.5.bb:do_<wbr>package_qa<br>
&gt;=C2=A0 =C2=A0 * meta-openembedded/meta-python/<wbr>recipes-devtools/pyt=
hon/<wbr>python-matplotlib_1.1.0.bb:do_<wbr>compile<br>
<br>
</span>I=E2=80=99ll take a shot at these two. pylint version is a bit old, =
latest is 1.7.2. matplotlib latest version is 2.0.2, so this recipe is very=
 old; also needs python3 version.<br>
<br>
&gt; &lt;snip&gt;<br>
<br>
</blockquote></div><br></div>

--001a1143a716d2194a0557598c05--
