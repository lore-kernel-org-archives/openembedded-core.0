Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 70C7C6612D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 00:00:21 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id u48so2169295wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Mar 2017 16:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4XHPRKPnI6U0bT8RG7ATv1UOTkH4GX3o4dJCd6nT04s=;
	b=jkx3uvFl0kQs0Diqzts2lfcNWeoVfXYUmVvH426PN9PaVO0E40Onm6ldIe1kfzPdEY
	g8K6Obhu4Mpa7kwFjsUgY9lsVn3Z2kkTWJK3A1YKN375BNza32ZPJGqSay8dEgY022e+
	a6BkCsrz7Abt2lXu9net0h60Y439bEWbYmLCVMjAwvz1Wyt+IwuH8BWOnvBN9T9G4hmj
	iOeDHhkZDs6WqKvUxefzSqi1daAQMOsr5CKe/UlRyqp2kud2OAd7Qv8NuCLIRlgL6gvg
	lT2fDFEfQ8Xp2lv8Di5baq79udUdjfdkNH3KDu0Vrp/C4wuUXRSTxn4p0Nhrhb1b57vG
	Xx9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4XHPRKPnI6U0bT8RG7ATv1UOTkH4GX3o4dJCd6nT04s=;
	b=d2Y1KzhlG04dyQQ5ffh6w7Hv0OyH1w8KQjaIgJfgyVQApMk/L2lVmGbNqvUVt3TW3c
	f/HFJsEkinJr5UpHpDOVSHk69iGjJjMaJVkDl4PXOeJwkYWsmmTblHfGi8FtIX5JKaSm
	b3Ox8VVuuEVPW3/sYHZB9RcWNg/PTZA90s4bcNd9Z0UBfjxep3RawLq8i4AvrKudC3Ck
	w364eUsFgPIVmh99UWiI93HXU3AUVGkWtI2nA2WM5TQ8THU1MEdyfI9BGyw7ttM9as1F
	cM1WPwRrZ7s99RbnXr04Xp2lpQEArzkTjqQufJat6sEIJQQqdashtaOSL6/vnYRRZon6
	Yviw==
X-Gm-Message-State: AMke39l7HpBg/pAdMAEMu/TF3xutzMCX6gnH2Yrpdwi4sQSeXUDAzFGEbeOKS8mSjYm9dJ2tT0TLDfj2clny/A==
X-Received: by 10.223.136.66 with SMTP id e2mr2571924wre.14.1488931223123;
	Tue, 07 Mar 2017 16:00:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Tue, 7 Mar 2017 16:00:22 -0800 (PST)
In-Reply-To: <CAMKF1sqth8gmzS6k13EA2Sz6r-mfextxWXxB=2rfCHw6-gfFQQ@mail.gmail.com>
References: <1488542096-23389-1-git-send-email-richard.purdie@linuxfoundation.org>
	<CAMKF1soCXsibCK37Az9MV1HMUpAK2dtWoijOxoBW25RoMhU+8g@mail.gmail.com>
	<CAJTo0LYPwxx18CtjJ_Rng28UhQAmJbMCw5=ebW2WkZmcALznUQ@mail.gmail.com>
	<CAMKF1sqB7A9m2osnv9bwywRF5hT4-oNgKU+rLNyA8SD70n8Mbg@mail.gmail.com>
	<1488624869.22968.8.camel@linuxfoundation.org>
	<CAMKF1sqth8gmzS6k13EA2Sz6r-mfextxWXxB=2rfCHw6-gfFQQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 8 Mar 2017 01:00:22 +0100
Message-ID: <CA+chaQeHLtqAW3mK1-Y_yQZYBwrtDfEcsHocz8fMW8e8W4OCjg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-runtime: Add libmpx supprt for x86
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
X-List-Received-Date: Wed, 08 Mar 2017 00:00:22 -0000
Content-Type: multipart/alternative; boundary=001a1147be96a63df1054a2cd0ea

--001a1147be96a63df1054a2cd0ea
Content-Type: text/plain; charset=UTF-8

Seems to cause following QA issue for DISTROs which don't
inherit remove-libtool.bbclass

ERROR: gcc-runtime-6.3.0-r0 do_package: QA Issue: gcc-runtime:
Files/directories were installed but not shipped in any package:
  /usr/lib/libmpxwrappers.la
Please set FILES such that these items are packaged. Alternatively if they
are unneeded, avoid installing them or delete them within do_install.
gcc-runtime: 1 installed and not shipped files. [installed-vs-shipped]


On Sat, Mar 4, 2017 at 7:58 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Mar 4, 2017 at 2:54 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Fri, 2017-03-03 at 14:58 -0800, Khem Raj wrote:
> >> On Fri, Mar 3, 2017 at 2:54 PM, Burton, Ross <ross.burton@intel.com>
> >> wrote:
> >> >
> >> >
> >> > On 3 March 2017 at 21:39, Khem Raj <raj.khem@gmail.com> wrote:
> >> > >
> >> > >
> >> > > >
> >> > > > Enabling building the Intel Memory Protection Extension library
> >> > > > for x86.
> >> > > >
> >> > > hope this works on amd chips as well ?
> >> >
> >> > https://en.wikipedia.org/wiki/Intel_MPX
> >> >
> >> > It depends on new instructions, so you'll have to ask AMD. :)
> >> OK if its not so then perhaps a bbappend in meta-intel is more
> >> appropriate.
> >
> > Well, its part of gcc, not something meta-intel is patching in and its
> > a standard which other arches can implement, maybe in their own library
> > so I believe the recipe is the better place for this to live. I just
> > copied the description from the code iirc.
> >
>
> I think its ok on second thought if its the case where it will be used
> more often then probably a provision to be able to remove it from a
> soc layer
> would be enough
>
> > Incidentally, this fails to build on musl so I've just disabled it on
> > musl for now.
> >
>
> OK
>
> > Cheers,
> >
> > Richard
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a1147be96a63df1054a2cd0ea
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Seems to cause following QA issue for DISTROs which d=
on&#39;t inherit=C2=A0remove-libtool.bbclass</div><div><br></div><div>ERROR=
: gcc-runtime-6.3.0-r0 do_package: QA Issue: gcc-runtime: Files/directories=
 were installed but not shipped in any package:</div><div>=C2=A0 /usr/lib/<=
a href=3D"http://libmpxwrappers.la">libmpxwrappers.la</a></div><div>Please =
set FILES such that these items are packaged. Alternatively if they are unn=
eeded, avoid installing them or delete them within do_install.</div><div>gc=
c-runtime: 1 installed and not shipped files. [installed-vs-shipped]</div><=
div><br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quot=
e">On Sat, Mar 4, 2017 at 7:58 PM, Khem Raj <span dir=3D"ltr">&lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Sat, M=
ar 4, 2017 at 2:54 AM, Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@<w=
br>linuxfoundation.org</a>&gt; wrote:<br>
&gt; On Fri, 2017-03-03 at 14:58 -0800, Khem Raj wrote:<br>
&gt;&gt; On Fri, Mar 3, 2017 at 2:54 PM, Burton, Ross &lt;<a href=3D"mailto=
:ross.burton@intel.com">ross.burton@intel.com</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; On 3 March 2017 at 21:39, Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; &gt; Enabling building the Intel Memory Protection Exten=
sion library<br>
&gt;&gt; &gt; &gt; &gt; for x86.<br>
&gt;&gt; &gt; &gt; &gt;<br>
&gt;&gt; &gt; &gt; hope this works on amd chips as well ?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; <a href=3D"https://en.wikipedia.org/wiki/Intel_MPX" rel=3D"no=
referrer" target=3D"_blank">https://en.wikipedia.org/wiki/<wbr>Intel_MPX</a=
><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; It depends on new instructions, so you&#39;ll have to ask AMD=
. :)<br>
&gt;&gt; OK if its not so then perhaps a bbappend in meta-intel is more<br>
&gt;&gt; appropriate.<br>
&gt;<br>
&gt; Well, its part of gcc, not something meta-intel is patching in and its=
<br>
&gt; a standard which other arches can implement, maybe in their own librar=
y<br>
&gt; so I believe the recipe is the better place for this to live. I just<b=
r>
&gt; copied the description from the code iirc.<br>
&gt;<br>
<br>
</span>I think its ok on second thought if its the case where it will be us=
ed<br>
more often then probably a provision to be able to remove it from a<br>
soc layer<br>
would be enough<br>
<span class=3D""><br>
&gt; Incidentally, this fails to build on musl so I&#39;ve just disabled it=
 on<br>
&gt; musl for now.<br>
&gt;<br>
<br>
</span>OK<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br></div>

--001a1147be96a63df1054a2cd0ea--
