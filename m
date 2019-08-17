Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id A7C617D048
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 05:47:58 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id w18so5824768qki.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 22:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vfjeVSVV+8mBkLvg/2+EfhPXRLlRYXHuQtT42PTessM=;
	b=OEUgFZ5pKBgYuPuBAizZkAzkm+9xSSALM0utvdk9U20DfZzVJd7XL1goqFksM7S1OW
	p/vEqEJ0PW5K+3FsL1XBbsiFRb5Ye8TK9vmZFwhSbeV36DiVWGIPhEkQyB+65z4Gi8yi
	NUYp15mdYxz1yU42cVJJ9NsPZhncyREx+vBdPxDV2Ul6JkxYTfZFKYPt7a01vIMIdcq5
	74Ze+9BHHsWKDK0BEJJOJ5rgB76B9bKXEs6YlLoH9L94+ZaD5ARut2HqGBdx/lGpFB/Y
	FwFdKLVL3qBzwz31EOFKFH6p1+/4JpghmaUNYs15rjPr8NlxXP354Bt3240Q2ZbZV36i
	5p/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vfjeVSVV+8mBkLvg/2+EfhPXRLlRYXHuQtT42PTessM=;
	b=fIseA5vxhaSCJw7F83JcvaCMH/Q1pkNE1l09KLYbBKm+7m/nKqNqKLWvGcYSVTcUI5
	Ng/s3nMoyh2ushhQlb3t6f7mXtdcd4Pv0bWRW4lnhf2Q6qh1g88G9kzEq7oSamO9TcUy
	Sf/ImERbgLPJxW1Dmv3Mix9zFg8rQl4z7CGXVZLqnLgX+88ENwb5wXSddjytBggSAWTl
	oVAq4AAcUbTkA86pSmONdhhnmuq4oThLdb3Q6HZZpmAzIGx10WqEC0NNwTYzLKE4Mflf
	2BCoVXOmhEcscHDTEXPmuo9Vfo38V2Upp/AW0EbGLx0e1gwr8Zc549Gulxn+llyhDjzH
	L+/A==
X-Gm-Message-State: APjAAAWcxY0vNDxY8E/CeRIw/9We3W4tCgXnBV09BeTkVmOqaNNPwKU0
	0/4wgLmMlzDYCNO9iCKPA6RHqleNCTjESi7/Wag=
X-Google-Smtp-Source: APXvYqwr5BXnePSCxWUKfWVexke8BdftnpzN+FuZij/Qb+sfpRQegXfQkM/TpWgWpoTvhhNpo4V59lS50ElHMuXYZDY=
X-Received: by 2002:a37:a20f:: with SMTP id l15mr12405141qke.212.1566020879143;
	Fri, 16 Aug 2019 22:47:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190816210605.62377-1-jason.wessel@windriver.com>
	<CAMKF1sqc4M-0ykKNhAao+sQk9WXwetqX4P6VLh44ypCv1LZKtA@mail.gmail.com>
	<283ea4a282885878d26308925690e3428a08c841.camel@linuxfoundation.org>
	<CAMKF1sqMA37YFn4QRC7-60aKNoADsU7D8asW8Cmzu0zZhCe5iA@mail.gmail.com>
	<4c57097b88e7267dbe2123a844dfe4f014b48342.camel@linuxfoundation.org>
	<03ecd668-28cb-bd79-0a66-ba8deedacba0@windriver.com>
In-Reply-To: <03ecd668-28cb-bd79-0a66-ba8deedacba0@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 16 Aug 2019 22:47:47 -0700
Message-ID: <CAMKF1srNUBaCacVi6Fg9mFhXvvDQe16t2EoGc58ci_Kbi3-yvw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] cross-localedef-native: Add hardlink resolver from util-linux
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
X-List-Received-Date: Sat, 17 Aug 2019 05:47:58 -0000
Content-Type: multipart/alternative; boundary="00000000000036584d059049a6df"

--00000000000036584d059049a6df
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think it=E2=80=99s ok to have it in Glibc/localedef not all distros have =
this
version of util Linux yet and perhaps we should start creating a buildtools
tarballs which is a prerequisite for building OE and collect these
dependencies in there instead
Of sticking them in unusual places

On Fri, Aug 16, 2019 at 7:59 PM Jason Wessel <jason.wessel@windriver.com>
wrote:

> On 8/16/19 4:50 PM, richard.purdie@linuxfoundation.org wrote:
> > On Fri, 2019-08-16 at 14:29 -0700, Khem Raj wrote:
> >> On Fri, Aug 16, 2019 at 2:25 PM Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >>> This was discussed on IRC. We really really want to avoid that as a
> >>> dependency if we care about build performance. Its really easy to
> >>> just
> >>> add that in but the implications are significant :(
> >>>
> >> A captured version of this utility would also mean that we have to
> >> keep this in sync for bug fixes and security fixes etc. which could
> >> also be considered as expense, so how much do we lose if util-linux-
> >> native is brought early into dependency chain?
> > The tool is being used for a specific purpose at build time. Its not
> > exposed on target and its use is extremely constrained to a specific
> > set of files where its behaviour should be deterministic.
> >
> > As such, yes there are questions about bug fixes and about security but
> > I don't think its going to be a serious burden. We'd need to carry this
> > until such times as the host systems we support have hardlink which is
> > probably a few years out but will arrive.
> >
> > The impact of having util-linux-native in the dependency graph at this
> > point is significant. I say that as someone who has done a lot of work
> > in trimming down the times of our bootstrap process. This is exactly
> > the kind of dependency I've removed and avoided.
> >
> > glibc is special in that its the worst choke point on the dependency
> > graph. Nothing to do with target binaries happens until it is ready and
> > then gcc-runtime can build. Whilst the locales are split from glibc,
> > they are still connected in the task graph for packaging purposes so
> > this is important.
> >
> > Its been pointed out there are other places where util-linux-native has
> > crept in, in particular python3-native. My preference would be to
> > minimise these dependencies rather than use them as a way to justify
> > adding it here too.
>
>
> So what is the consensus here?   Can we require the host system to have
> hardlink?   It is available as a stand alone binary on Ubuntu 14.04 and u=
p
> and on Fedora systems, but isn't installed by default, and we'd have to
> check the version because the arguments sadly are slightly different.   W=
e
> could certainly make util-linux a dependency, but that is why this patch
> existed, in order to avoid the dependency.
>
> I did find a python version at
> https://raw.githubusercontent.com/akaihola/hardlinkpy/master/hardlink.py.
> I made a one line modification to it and it works, but it isn't nearly as
> efficient.  The proof is below, using the same locale-tree each time.  It
> is important to look at both the real and user time.  The difference gets
> more significant when you run it under pseudo, where we expect it to run
> 100% of the time.  It is roughly 10x slower to do this in python.
>
>
> time recipe-sysroot-native/usr/bin/cross-localedef-hardlink -c -v
> locale-tree
> Directories:         982
> Objects:            7441
> Regular files:      6441
> Comparisons:        3331
> Linked:             3109
> Saved:         754675712
>
> real    0m0.641s
> user    0m0.120s
> sys     0m0.518s
>
> time python3 hardlink.py -v 0 -c locale-tree
>
>
> Hard linking Statistics:
> Directories           : 982
> Regular files         : 6441
> Comparisons           : 31884
> Hardlinked this run   : 3109
> Total hardlinks       : 3109
> Bytes saved this run  : 744089843 (709.619 mebibytes)
> Total bytes saved     : 744089843 (709.619 mebibytes)
> Total run time        : 2.124422073364258 seconds
>
> real    0m2.180s
> user    0m1.220s
> sys     0m0.953s
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DNow lets run it under pseudo =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> time recipe-sysroot-native/usr/bin/cross-localedef-hardlink -c -v
> locale-tree
> Directories:         982
> Objects:            7441
> Regular files:      6441
> Comparisons:        3331
> Linked:             3109
> Saved:         754675712
>
> real    0m2.505s
> user    0m0.373s
> sys     0m1.286s
>
> time python3 hardlink.py -v 0 -c locale-tree
>
>
> Hard linking Statistics:
> Directories           : 982
> Regular files         : 6441
> Comparisons           : 31884
> Hardlinked this run   : 3109
> Total hardlinks       : 3109
> Bytes saved this run  : 744089843 (709.619 mebibytes)
> Total bytes saved     : 744089843 (709.619 mebibytes)
> Total run time        : 12.971824884414673 seconds
>
> real    0m13.046s
> user    0m3.633s
> sys     0m5.192s
>
>
>

--00000000000036584d059049a6df
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I think it=E2=80=99s ok to have it in Glibc/localede=
f not all distros have this version of util Linux yet and perhaps we should=
 start creating a buildtools tarballs which is a prerequisite for building =
OE and collect these dependencies in there instead</div></div><div dir=3D"a=
uto">Of sticking them in unusual places=C2=A0</div><div><br><div class=3D"g=
mail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Aug 16, 2019 at 7=
:59 PM Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.com">jason=
.wessel@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">On 8/16/19 4:50 PM, <a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a> wrote:<br>
&gt; On Fri, 2019-08-16 at 14:29 -0700, Khem Raj wrote:<br>
&gt;&gt; On Fri, Aug 16, 2019 at 2:25 PM Richard Purdie<br>
&gt;&gt; &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=
=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;&gt;&gt; This was discussed on IRC. We really really want to avoid that=
 as a<br>
&gt;&gt;&gt; dependency if we care about build performance. Its really easy=
 to<br>
&gt;&gt;&gt; just<br>
&gt;&gt;&gt; add that in but the implications are significant :(<br>
&gt;&gt;&gt;<br>
&gt;&gt; A captured version of this utility would also mean that we have to=
<br>
&gt;&gt; keep this in sync for bug fixes and security fixes etc. which coul=
d<br>
&gt;&gt; also be considered as expense, so how much do we lose if util-linu=
x-<br>
&gt;&gt; native is brought early into dependency chain?<br>
&gt; The tool is being used for a specific purpose at build time. Its not<b=
r>
&gt; exposed on target and its use is extremely constrained to a specific<b=
r>
&gt; set of files where its behaviour should be deterministic.<br>
&gt;<br>
&gt; As such, yes there are questions about bug fixes and about security bu=
t<br>
&gt; I don&#39;t think its going to be a serious burden. We&#39;d need to c=
arry this<br>
&gt; until such times as the host systems we support have hardlink which is=
<br>
&gt; probably a few years out but will arrive.<br>
&gt;<br>
&gt; The impact of having util-linux-native in the dependency graph at this=
<br>
&gt; point is significant. I say that as someone who has done a lot of work=
<br>
&gt; in trimming down the times of our bootstrap process. This is exactly<b=
r>
&gt; the kind of dependency I&#39;ve removed and avoided.<br>
&gt;<br>
&gt; glibc is special in that its the worst choke point on the dependency<b=
r>
&gt; graph. Nothing to do with target binaries happens until it is ready an=
d<br>
&gt; then gcc-runtime can build. Whilst the locales are split from glibc,<b=
r>
&gt; they are still connected in the task graph for packaging purposes so<b=
r>
&gt; this is important.<br>
&gt;<br>
&gt; Its been pointed out there are other places where util-linux-native ha=
s<br>
&gt; crept in, in particular python3-native. My preference would be to<br>
&gt; minimise these dependencies rather than use them as a way to justify<b=
r>
&gt; adding it here too.<br>
<br>
<br>
So what is the consensus here?=C2=A0=C2=A0 Can we require the host system t=
o have hardlink?=C2=A0=C2=A0 It is available as a stand alone binary on Ubu=
ntu 14.04 and up and on Fedora systems, but isn&#39;t installed by default,=
 and we&#39;d have to check the version because the arguments sadly are sli=
ghtly different. =C2=A0 We could certainly make util-linux a dependency, bu=
t that is why this patch existed, in order to avoid the dependency.<br>
<br>
I did find a python version at <a href=3D"https://raw.githubusercontent.com=
/akaihola/hardlinkpy/master/hardlink.py" rel=3D"noreferrer" target=3D"_blan=
k">https://raw.githubusercontent.com/akaihola/hardlinkpy/master/hardlink.py=
</a>. I made a one line modification to it and it works, but it isn&#39;t n=
early as efficient.=C2=A0 The proof is below, using the same locale-tree ea=
ch time.=C2=A0 It is important to look at both the real and user time.=C2=
=A0 The difference gets more significant when you run it under pseudo, wher=
e we expect it to run 100% of the time.=C2=A0 It is roughly 10x slower to d=
o this in python.<br>
<br>
<br>
time recipe-sysroot-native/usr/bin/cross-localedef-hardlink -c -v locale-tr=
ee<br>
Directories:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 982<br>
Objects:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
7441<br>
Regular files:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6441<br>
Comparisons:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3331<br>
Linked:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 3109<br>
Saved:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 754675712<br>
<br>
real=C2=A0=C2=A0=C2=A0 0m0.641s<br>
user=C2=A0=C2=A0=C2=A0 0m0.120s<br>
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m0.518s<br>
<br>
time python3 hardlink.py -v 0 -c locale-tree<br>
<br>
<br>
Hard linking Statistics:<br>
Directories=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 9=
82<br>
Regular files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 6441<br>
Comparisons=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 3=
1884<br>
Hardlinked this run=C2=A0=C2=A0 : 3109<br>
Total hardlinks=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 3109<br>
Bytes saved this run=C2=A0 : 744089843 (709.619 mebibytes)<br>
Total bytes saved=C2=A0=C2=A0=C2=A0=C2=A0 : 744089843 (709.619 mebibytes)<b=
r>
Total run time=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 2.12442207336425=
8 seconds<br>
<br>
real=C2=A0=C2=A0=C2=A0 0m2.180s<br>
user=C2=A0=C2=A0=C2=A0 0m1.220s<br>
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m0.953s<br>
<br>
<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DNow lets run it under pseudo =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<br>
time recipe-sysroot-native/usr/bin/cross-localedef-hardlink -c -v locale-tr=
ee<br>
Directories:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 982<br>
Objects:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
7441<br>
Regular files:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6441<br>
Comparisons:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3331<br>
Linked:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 3109<br>
Saved:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 754675712<br>
<br>
real=C2=A0=C2=A0=C2=A0 0m2.505s<br>
user=C2=A0=C2=A0=C2=A0 0m0.373s<br>
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m1.286s<br>
<br>
time python3 hardlink.py -v 0 -c locale-tree<br>
<br>
<br>
Hard linking Statistics:<br>
Directories=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 9=
82<br>
Regular files=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 6441<br>
Comparisons=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 3=
1884<br>
Hardlinked this run=C2=A0=C2=A0 : 3109<br>
Total hardlinks=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 3109<br>
Bytes saved this run=C2=A0 : 744089843 (709.619 mebibytes)<br>
Total bytes saved=C2=A0=C2=A0=C2=A0=C2=A0 : 744089843 (709.619 mebibytes)<b=
r>
Total run time=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : 12.9718248844146=
73 seconds<br>
<br>
real=C2=A0=C2=A0=C2=A0 0m13.046s<br>
user=C2=A0=C2=A0=C2=A0 0m3.633s<br>
sys=C2=A0=C2=A0=C2=A0=C2=A0 0m5.192s<br>
<br>
<br>
</blockquote></div></div>

--00000000000036584d059049a6df--
