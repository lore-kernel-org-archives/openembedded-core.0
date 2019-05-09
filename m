Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by mail.openembedded.org (Postfix) with ESMTP id 52BDA7E01F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 May 2019 20:34:53 +0000 (UTC)
Received: by mail-qk1-f194.google.com with SMTP id a64so2339895qkg.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 May 2019 13:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iBagKAIGGyk8xG/JKMLhvMmFZDVCn+nD5AIBQiYQzrk=;
	b=PGe3/UNMjGXa+4Bit2FYAYhhiyZjm/n8fkmz+IhrOWjxHhcWmVqtI7o232zWgyHVCO
	qYOZgzTfINwetzZ4UA1uf+SNdzmubFw+ierM5SxJpz/Mi9si2ILd3ZZ+Lvz8wiyl5o+K
	hzpj5SjKZ+dtere2tMPuRc/9G2lXh32DdEO2IfHBE0c6c3NKaBHyzY5VzNLcqY5xdguq
	Ah0oyDSXStaVnX/Zexa2PCbWoQ5WjexyzNE9W+aeaYSB4UBD1Ndc0+mfCL8VnpGafqV+
	TFpvVsXq13zYA1echGUXyJMnHo55hWqi0gImuS2XlxYNjcj8wN9xHDxHT+k2hzz6GvN+
	Px1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iBagKAIGGyk8xG/JKMLhvMmFZDVCn+nD5AIBQiYQzrk=;
	b=ND9bTfG9dnMUN8BKjtHl4fNp6qGpxAgZS5FP4CClZk4EDvDHx9PtUOWuDwtTRRs3Ca
	QKxaV8gq+B5lVURjejzRiayYDQrnqoSAbaVcMlCaNUb2DUtM+CTI5SV/XWBU4NNetUUk
	knyqQqPl4vGNsN/zYkGRJ8N+xjzDNV29ik3drvCuLDgFV8XnwNYsbPJfqMfoSLlt2luN
	guAYjG7kfnF1+6Z80oyN5W7KaQhE5KZXYG2urfSztHAXfUrYpMnGFEJS7gXBCvnCn1RQ
	4v4f1RDJXSc1RdnRi0mZEagMgPhcmK2xAlZDODW5X2ktENpienAXBCzuhI+NWwMO6v1V
	V+1w==
X-Gm-Message-State: APjAAAXN4y3xN4yuk+g6nBDNKABYB9/X4RwDGjzhCCdpjSzxt05bs4GL
	kEPKllRfMAISj6U9VVUDCvDiw1Giun5wwC98tk4=
X-Google-Smtp-Source: APXvYqyqIZqKKssBz51kXZlLhv0kMmmPd2WxgoAzSvU93zfhB7knSnpVuXbj+cyqqfLMDnmbl9V4dbMPZV9sAxjcGd4=
X-Received: by 2002:a37:8d06:: with SMTP id p6mr5322824qkd.315.1557434093793; 
	Thu, 09 May 2019 13:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190507210338.17788-1-raj.khem@gmail.com>
	<4fba9588af56d66a633fde9dba8e1a4176ed234e.camel@intel.com>
	<CAMKF1sqcCNx6M8Ve8YTzMDCGaZdvBU4LQYhxKgEcH2Q6FyeeCA@mail.gmail.com>
	<047c54ca3988760cad94a11a511219887edc8980.camel@linuxfoundation.org>
In-Reply-To: <047c54ca3988760cad94a11a511219887edc8980.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 9 May 2019 13:34:42 -0700
Message-ID: <CAMKF1spJZF6C0jFrKdO=YN2h1DXOPf-Lvpxe=S0twHQh9PY1zA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-9: Add recipes for gcc 9.1 release
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
X-List-Received-Date: Thu, 09 May 2019 20:34:53 -0000
Content-Type: multipart/alternative; boundary="000000000000ebf81805887a61fc"

--000000000000ebf81805887a61fc
Content-Type: text/plain; charset="UTF-8"

On Thu, May 9, 2019 at 1:19 PM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2019-05-09 at 11:05 -0700, Khem Raj wrote:
> > On Wed, May 8, 2019 at 11:55 PM Mittal, Anuj <anuj.mittal@intel.com>
> > wrote:
> > > This is probably causing selftest failure for fortran
> > > (test_toolchain_fortran):
> > >
> > > ERROR: libgfortran-9.1.0-r0 do_package: QA Issue: libgfortran:
> > > Files/directories were installed but not shipped in any package:
> > >   /usr/lib/gcc/x86_64-poky-linux/9.1.0/include
> > >   /usr/lib/gcc/x86_64-poky-
> > > linux/9.1.0/include/ISO_Fortran_binding.h
> > >
> > >
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/162/steps/7/logs/step2d
> > >
> >
> > fortran is not in default set of languages to build so sent a
> > separate
> > patch for this here.
> > https://patchwork.openembedded.org/patch/161101/
>
>
> There is a second issue which is why was this mixing gcc 8 and 9 in the
> same build. I've sent a patch to add a missing PREFERRED_VERSION.
>
> We've not run another gcc 9 test, I'll likely merge the gcc 9 version
> as non-default and then we can keep testing until it works and we can
> make it the default.


Yes I have left switching  the default for another day intentionally

Doing that as a separate patch is right approach I think here and we can
push it once all is good


>
> Cheers,
>
> Richard
>
>

--000000000000ebf81805887a61fc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, May 9, 2019 at 1:19 PM Richard Purdie &lt;<a href=
=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundati=
on.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, 2019-=
05-09 at 11:05 -0700, Khem Raj wrote:<br>
&gt; On Wed, May 8, 2019 at 11:55 PM Mittal, Anuj &lt;<a href=3D"mailto:anu=
j.mittal@intel.com" target=3D"_blank">anuj.mittal@intel.com</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt; This is probably causing selftest failure for fortran<br>
&gt; &gt; (test_toolchain_fortran):<br>
&gt; &gt; <br>
&gt; &gt; ERROR: libgfortran-9.1.0-r0 do_package: QA Issue: libgfortran:<br=
>
&gt; &gt; Files/directories were installed but not shipped in any package:<=
br>
&gt; &gt;=C2=A0 =C2=A0/usr/lib/gcc/x86_64-poky-linux/9.1.0/include<br>
&gt; &gt;=C2=A0 =C2=A0/usr/lib/gcc/x86_64-poky-<br>
&gt; &gt; linux/9.1.0/include/ISO_Fortran_binding.h<br>
&gt; &gt; <br>
&gt; &gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builder=
s/79/builds/162/steps/7/logs/step2d" rel=3D"noreferrer" target=3D"_blank">h=
ttps://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/162/steps/=
7/logs/step2d</a><br>
&gt; &gt; <br>
&gt; <br>
&gt; fortran is not in default set of languages to build so sent a<br>
&gt; separate<br>
&gt; patch for this here.<br>
&gt; <a href=3D"https://patchwork.openembedded.org/patch/161101/" rel=3D"no=
referrer" target=3D"_blank">https://patchwork.openembedded.org/patch/161101=
/</a><br>
<br>
<br>
There is a second issue which is why was this mixing gcc 8 and 9 in the<br>
same build. I&#39;ve sent a patch to add a missing PREFERRED_VERSION.<br>
<br>
We&#39;ve not run another gcc 9 test, I&#39;ll likely merge the gcc 9 versi=
on<br>
as non-default and then we can keep testing until it works and we can<br>
make it the default.</blockquote><div dir=3D"auto"><br></div><div dir=3D"au=
to">Yes I have left switching =C2=A0the default for another day intentional=
ly</div><div dir=3D"auto"><br></div><div dir=3D"auto">Doing that as a separ=
ate patch is right approach I think here and we can push it once all is goo=
d=C2=A0</div><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br=
>
<br>
Cheers,<br>
<br>
Richard<br>
<br>
</blockquote></div></div>

--000000000000ebf81805887a61fc--
