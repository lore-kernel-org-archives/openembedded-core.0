Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7FBDF7BD64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 14:19:24 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id d13so19277018qth.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 07:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ICkz/5Jj6JwK7N6yRV5+G/NaaYwOxWwUnUHhJky0RjU=;
	b=rhacvfOYhLp5FvpytPs1zgD05mTK6OTrZddGjayD5JK6G4bbi34VK9L1z0mSEnyC0V
	fKCRwGw26PVv4X2CTFt9HLQE8KGdOScuGylGGB/K7ZGjb5wooier/8rJGkCZUcjyRzOv
	gL05rlOcTL4W57ljU4w+xtVkCc35Gh60pNDWUT3/vwaq3hM6znnYBkby1mZTuBE0OeNj
	DFjSsNE06SR5qINqoYPT5vKgpi30/hP6m0nFAaGBTT4bFDGK+2eKGLrwnEn/qSCnbJQX
	SD2fGWES0/2fcRS7RMtlFdYxlglwj9UJ9M0Pkq5592xBfExJOzKHaV/oU39R9Elp5DVM
	NMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ICkz/5Jj6JwK7N6yRV5+G/NaaYwOxWwUnUHhJky0RjU=;
	b=aBS0KJxOFKt784M3Y64tR8tpWe0AU2Zle2K/qwxjBhxMfjEd27k4Iaw1pPp0c9Eqlf
	p6djqoZbdehZknna/I4FD3wHbzg5V+ldfTNhZYNNHzjUQq41Go563JDm6xQefUWZhS9N
	F9JmntFpT/rXk6Mb1Q8sNyQ1PXMRmvH6/7Gfl3YFXfEW3Jmt8QRRB8zE6hnBNtdbaOcU
	5ffU/ZFZVZmGUit80OK8ssnOg4eQY8vqU1eGHzGlFYVN0ZbMWCItSONzX8lOJNH0bGfn
	moUP/Wppq5gv4rw3TB8PPPCu6+67TpZq1v0kSwkYJt7mCjhLfchfVqzMhhaQOou7z4gC
	PaLw==
X-Gm-Message-State: APjAAAWJk31Gf6UuqXPS/uYIe6WrfkcYzwPg279l+Gk/5nYo9zxtoMWq
	FIA1tcoDqnkdVYshzN6EHWFw9qRTxi31XlbQVQQ=
X-Google-Smtp-Source: APXvYqwbZsTsLqrvI6AjVJyIc2TB/gvR4/2pb0gmOAwajtfweN2DgctE3G+VVlbUG0zDiBQPjgAAg86rd1MZ9dg/97k=
X-Received: by 2002:ac8:f86:: with SMTP id b6mr60102747qtk.330.1555337964795; 
	Mon, 15 Apr 2019 07:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1soKYZj6fKjFdNzAjhgtwaFKcw7iwyCU_kPq_QxmgCivng@mail.gmail.com>
	<1554777170-58044-1-git-send-email-mingli.yu@windriver.com>
	<CAMKF1sq0wYPvJg1G5+cnY-6owi1K=Nc4bctXm3pcsbh1R5gpFA@mail.gmail.com>
	<20190415093825.GB4317@localhost>
In-Reply-To: <20190415093825.GB4317@localhost>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 15 Apr 2019 07:19:13 -0700
Message-ID: <CAMKF1sps-k6m=ZrpuMmhj23ZkmF8C=17hGPscRH-V0cagV-2rw@mail.gmail.com>
To: Adrian Bunk <bunk@stusta.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] gcc-sanitizers: fix -Werror=maybe-uninitialized issue
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
X-List-Received-Date: Mon, 15 Apr 2019 14:19:24 -0000
Content-Type: multipart/alternative; boundary="000000000000e5c63d05869256df"

--000000000000e5c63d05869256df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 2:38 AM Adrian Bunk <bunk@stusta.de> wrote:

> On Mon, Apr 08, 2019 at 08:53:49PM -0700, Khem Raj wrote:
> > On Mon, Apr 8, 2019 at 7:32 PM <mingli.yu@windriver.com> wrote:
> > >
> > > From: Mingli Yu <Mingli.Yu@windriver.com>
> > >
> > > When DEBUG_BUILD =3D "1" added in local.conf, there
> > > comes below build error when "bitbake gcc-sanitizers":
> > > |
> ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitizer=
/libbacktrace/../../libbacktrace/elf.c:
> In function 'elf_is_symlink':
> > > |
> ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/libsanitize=
r/libbacktrace/../../libbacktrace/elf.c:772:21:
> error: 'st.st_mode' may be used uninitialized in this function
> [-Werror=3Dmaybe-uninitialized]
> > > |   return S_ISLNK (st.st_mode);
> > >
> > > Per https://gcc.gnu.org/ml/gcc-patches/2019-04/msg00315.html,
> > > the gcc upstream thinks the warning is a false
> > > positive and suggests to use -O2 rather than -Og
> > > or -O1 when compiling that file, so pass -Wno-error
> > > to compiler when -Og is used to silence the error.
> > >
> >
> > Not particular to this change but in general if a package says that it
> > does not support -Og
> > then we are just going to get into more and more untested grounds
> > especially during runtime
> > so I wonder how useful it will be to use -Og for such packages or any
> > other non supported
> > combination for that matter.
>
> This has nothing to do with specific packages not supporting -Og
> or any other combination, it is just about how to best workaround
> a compiler bug temporarily.
>
> gcc has bug(s) emitting bogus warnings with -Og, and these are build
> failures with some packages that build with -Werror.
>
> None of this is related to whether or not the packages will work
> at runtime with -Og.


What are you trying to convey ? That=E2=80=99s what I mentioned before I be=
gan my
reply however to reiterate my point was if a package is not usually built
and tested with this combination which is evident because it fails to build
then how good would it be if we fix this error especially complex packages
like compilers so is it worth to fix them or disable Og for them

>
>
> cu
> Adrian
>
> --
>
>        "Is there not promise of rain?" Ling Tan asked suddenly out
>         of the darkness. There had been need of rain for many days.
>        "Only a promise," Lao Er said.
>                                        Pearl S. Buck - Dragon Seed
>
>

--000000000000e5c63d05869256df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Apr 15, 2019 at 2:38 AM Adrian Bunk &lt;<a href=3D"=
mailto:bunk@stusta.de">bunk@stusta.de</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On Mon, Apr 08, 2019 at 08:53:49PM -0700, Khem Raj wrote:=
<br>
&gt; On Mon, Apr 8, 2019 at 7:32 PM &lt;<a href=3D"mailto:mingli.yu@windriv=
er.com" target=3D"_blank">mingli.yu@windriver.com</a>&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; From: Mingli Yu &lt;<a href=3D"mailto:Mingli.Yu@windriver.com" ta=
rget=3D"_blank">Mingli.Yu@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; When DEBUG_BUILD =3D &quot;1&quot; added in local.conf, there<br>
&gt; &gt; comes below build error when &quot;bitbake gcc-sanitizers&quot;:<=
br>
&gt; &gt; | ./../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/li=
bsanitizer/libbacktrace/../../libbacktrace/elf.c: In function &#39;elf_is_s=
ymlink&#39;:<br>
&gt; &gt; | ../../../../../../../../../work-shared/gcc-8.3.0-r0/gcc-8.3.0/l=
ibsanitizer/libbacktrace/../../libbacktrace/elf.c:772:21: error: &#39;st.st=
_mode&#39; may be used uninitialized in this function [-Werror=3Dmaybe-unin=
itialized]<br>
&gt; &gt; |=C2=A0 =C2=A0return S_ISLNK (st.st_mode);<br>
&gt; &gt;<br>
&gt; &gt; Per <a href=3D"https://gcc.gnu.org/ml/gcc-patches/2019-04/msg0031=
5.html" rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/ml/gcc-pat=
ches/2019-04/msg00315.html</a>,<br>
&gt; &gt; the gcc upstream thinks the warning is a false<br>
&gt; &gt; positive and suggests to use -O2 rather than -Og<br>
&gt; &gt; or -O1 when compiling that file, so pass -Wno-error<br>
&gt; &gt; to compiler when -Og is used to silence the error.<br>
&gt; &gt;<br>
&gt; <br>
&gt; Not particular to this change but in general if a package says that it=
<br>
&gt; does not support -Og<br>
&gt; then we are just going to get into more and more untested grounds<br>
&gt; especially during runtime<br>
&gt; so I wonder how useful it will be to use -Og for such packages or any<=
br>
&gt; other non supported<br>
&gt; combination for that matter.<br>
<br>
This has nothing to do with specific packages not supporting -Og<br>
or any other combination, it is just about how to best workaround<br>
a compiler bug temporarily.<br>
<br>
gcc has bug(s) emitting bogus warnings with -Og, and these are build<br>
failures with some packages that build with -Werror.<br>
<br>
None of this is related to whether or not the packages will work<br>
at runtime with -Og.</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">What are you trying to convey ? That=E2=80=99s what I mentioned before =
I began my reply however to reiterate my point was if a package is not usua=
lly built and tested with this combination which is evident because it fail=
s to build then how good would it be if we fix this error especially comple=
x packages like compilers so is it worth to fix them or disable Og for them=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><br>
<br>
cu<br>
Adrian<br>
<br>
-- <br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Is there not promise of rain?&quot; Ling T=
an asked suddenly out<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 of the darkness. There had been need of rain fo=
r many days.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Only a promise,&quot; Lao Er said.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Pearl S. =
Buck - Dragon Seed<br>
<br>
</blockquote></div></div>

--000000000000e5c63d05869256df--
