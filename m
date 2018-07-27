Return-Path: <christopher.w.clark@gmail.com>
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
	[209.85.208.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6071C78CDC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 18:46:07 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id p6-v6so5247417ljc.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lxeMNM0e31In3eRw/ol3UV4fITHz7xqQHs8aw7t7PH4=;
	b=qV5c+S56UbGVyjkOOv/pCJgAQZGWaXXAZaPid0HIcI2xnxQVMHWhZeZB7TrGg6IqWA
	laeTgtpqZ92tvS9IFFER/aCnnSSxlIohfPssxAPQ37FE1rb+Ccm+Zuv5y02It9FQwM8X
	uu/T4dXMB2NECoLZWNCWHn8EA5Fx+/Jh3D07hWnoNs1iYlFUiNWe35s9PfmXCcHOn6A3
	MTK3Fd5DROlNiCVwTDTcFQTB4lbTJDsL6FqbdvHgXP6wwJJrFNLOJP+FvfCLPmgijZ+U
	mW2xoBXT8Ftw5hgvgQbR/E4QN6xaBgklpcD5QwFGmE0ItvG2zRJqz3DrazaGIDHY4Hw5
	ksoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lxeMNM0e31In3eRw/ol3UV4fITHz7xqQHs8aw7t7PH4=;
	b=Cfc5+vlpznlPLOo77TJAFXpbR+ZCs3+Syl/cqXHOqgZLC8Meeb21wAXZ/GM5GTIZMV
	4xqEENTwWYGesklGwAx6WtoFkxrMCqLxwaHWtu+uyA04FDxRgmmvMVHuaBj0oZHwFy8S
	npXLxCNPGSGjjT2z7ikY7Gke0OtfNiAYaWhznn06JyxbtBai+CdZ13fmz1j5PmmV4FBN
	bwebB/Pr3quqJHm/uUUbpuugkPvVcrD+xGveIvVZJA46mBo7CJWhJvLjeedgMsSe2ZQM
	ePMb3+OtYr8SpbecJHAXlAvUFd6CG0R5c1Sd38zCeuDReXvdIHObDbIOzerKzkP3ohiQ
	of0Q==
X-Gm-Message-State: AOUpUlFhBru4CfZyD0RT89XQjQq7BKa5jSEFODJZkFI+ebBx8CWqhkgm
	GBtiFNnYUL2VEhBzEPgZw2NVpf7N8wON5Pkz22k=
X-Google-Smtp-Source: AAOMgpclKWzOaj5U9EUtLJy9OOQPUCr8IkjMW9hA+UZN6EolTv3i+NVRlC7DHL1U1vdtdi6lXcBRMM5mL4urp5rDKas=
X-Received: by 2002:a2e:2d2:: with SMTP id
	y79-v6mr5576404lje.100.1532717167951; 
	Fri, 27 Jul 2018 11:46:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:1955:0:0:0:0:0 with HTTP; Fri, 27 Jul 2018 11:46:07
	-0700 (PDT)
In-Reply-To: <CAJTo0Law7B8kDgXd=beUoCzG1KWr5Lgzq_H_yxow9V11dWTuJA@mail.gmail.com>
References: <1532649082-32531-1-git-send-email-christopher.w.clark@gmail.com>
	<CAJTo0Law7B8kDgXd=beUoCzG1KWr5Lgzq_H_yxow9V11dWTuJA@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Fri, 27 Jul 2018 11:46:07 -0700
Message-ID: <CACMJ4GY-+5N-oWHgUVV94G115cDKRnQczd9Ji1MrjZDD7EnRjw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] binutils : enable x86_64-pep for producing EFI binaries on x86/x86-64
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
X-List-Received-Date: Fri, 27 Jul 2018 18:46:07 -0000
Content-Type: multipart/alternative; boundary="0000000000005643b00571ff8689"

--0000000000005643b00571ff8689
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 27, 2018 at 10:31 AM, Burton, Ross <ross.burton@intel.com>
wrote:

> On 27 July 2018 at 00:51, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
> > @@ -74,12 +74,17 @@ EXTRA_OECONF = "--program-prefix=${TARGET_PREFIX} \
> >                  --enable-deterministic-archives \
> >                  --enable-plugins \
> >                  ${LDGOLD} \
> > -                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch',
> '--enable-64-bit-bfd', '', d)}"
> > +                ${@bb.utils.contains('DISTRO_FEATURES', 'multiarch',
> '--enable-64-bit-bfd', '', d)} \
> > +                ${ENABLE_EXTRA_TARGETS}"
> >
> >  LDGOLD_class-native = ""
> >  LDGOLD_class-crosssdk = ""
> >  LDGOLD ?= "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold',
> '--enable-gold=default --enable-threads', '--enable-gold
> --enable-ld=default --enable-threads', d)}"
> >
> > +ARCH_EFI_EMULATION_x86-64 = "x86_64-pep"
> > +ARCH_EFI_EMULATION_x86 = "x86_64-pep"
> > +ENABLE_EXTRA_TARGETS ?= "--enable-targets=${ARCH_EFI_EMULATION}"
>
> Can't believe I didn't spot this when reviewing by hand but:
>
> | checking for archiver @FILE support... configure: error:
> --enable-targets option must specify target names or 'all'
>
>
> Under non-x86, this passes --enable-targets=
>

Groan, oops - that makes sense. Will repin with a fix.

thanks

Christopher

--0000000000005643b00571ff8689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
On Fri, Jul 27, 2018 at 10:31 AM, Burton, Ross <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com<=
/a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On 27 July 2018 at =
00:51, Christopher Clark<br>
<span class=3D"">&lt;<a href=3D"mailto:christopher.w.clark@gmail.com">chris=
topher.w.clark@gmail.com</a><wbr>&gt; wrote:<br>
&gt; @@ -74,12 +74,17 @@ EXTRA_OECONF =3D &quot;--program-prefix=3D${TARGET=
_<wbr>PREFIX} \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable=
-deterministic-<wbr>archives \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 --enable=
-plugins \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${LDGOLD=
} \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.c=
ontains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;multiarch&#39;, &#39;--enable-=
64-bit-bfd&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${@bb.utils.c=
ontains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;multiarch&#39;, &#39;--enable-=
64-bit-bfd&#39;, &#39;&#39;, d)} \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${ENABLE_EXTR=
A_TARGETS}&quot;<br>
&gt;<br>
&gt;=C2=A0 LDGOLD_class-native =3D &quot;&quot;<br>
&gt;=C2=A0 LDGOLD_class-crosssdk =3D &quot;&quot;<br>
&gt;=C2=A0 LDGOLD ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES=
&#39;, &#39;ld-is-gold&#39;, &#39;--enable-gold=3Ddefault --enable-threads&=
#39;, &#39;--enable-gold --enable-ld=3Ddefault --enable-threads&#39;, d)}&q=
uot;<br>
&gt;<br>
&gt; +ARCH_EFI_EMULATION_x86-64 =3D &quot;x86_64-pep&quot;<br>
&gt; +ARCH_EFI_EMULATION_x86 =3D &quot;x86_64-pep&quot;<br>
&gt; +ENABLE_EXTRA_TARGETS ?=3D &quot;--enable-targets=3D${ARCH_EFI_<wbr>EM=
ULATION}&quot;<br>
<br>
</span>Can&#39;t believe I didn&#39;t spot this when reviewing by hand but:=
<br>
<br>
| checking for archiver @FILE support... configure: error:<br>
--enable-targets option must specify target names or &#39;all&#39;<br>
<br>
<br>
Under non-x86, this passes --enable-targets=3D<br>
<span class=3D"HOEnZb"></span></blockquote><div><br></div><div>Groan, oops =
- that makes sense. Will repin with a fix.</div><div><br></div><div>thanks<=
br></div><div><br></div><div>Christopher<br></div></div></div></div>

--0000000000005643b00571ff8689--
