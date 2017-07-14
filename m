Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 4A56E72F60
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 18:46:59 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id h134so18992585iof.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 11:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Cw0/k4Yk5fD8tyKkz94w5wB9pAJdZ9NjuSHF7m6HCK8=;
	b=e6LNkR9faB3mHFoGCv233mfCrYR4mxHmI+Yf57MFNyVttPzzr/IFRjXagWqX7xOonR
	7d2URih3tuqFov0rVQEBAbrq+YKsoFRxVnmU0vE/CCHItXGvF1F+SyIaEY0M4eXHA0jc
	LLZiIY2RKRsvCLo/2CNbhOOY+kV5eE6m1LEiZZJS1BwVySbcz3fDTJpzHlpLSvVp7NHB
	V0vME71q0lcIwCz6brCJCIF1E9VC9lN+Flo7Qo8mEnJUUEWJz2k7+VySBZw9iBeK4miB
	cD2M3qa5aGoFkJpldFM3zeRMXxrjLm3KTuW2lsFZCCviYEBf0OdhdJvHov1mhqYlS+Fy
	n5Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Cw0/k4Yk5fD8tyKkz94w5wB9pAJdZ9NjuSHF7m6HCK8=;
	b=NLE+I6ho60Ixz/a4TRLPMxBwX+91i+auo4vOOd46KfNbcRGlXh25ISPB8LyRFx5ArT
	PRe400NrDUSJ78GeVOwIiTCJFS/5lZGwnSSp+VsALefUBvDJum0n3vZA0W6whU4DmTPv
	sacCxB7cxyvOXfJKIvmA4Arei44QTcgNIaceCBrjrJiIryzju7syhfMC11mggsAuly0C
	lSzqdKaqw5COOpuTD2MmJzE0wIPH3IbDdVnoFBw6SjwugvEb2fHXWfbbnnmDpAlB6lFf
	RAaBGxCY9/Imke+QxdkBMiL9C/TUC1RVfm9DXppGqfyMVdmWTRVj+oYJzQK4r2cCwQWb
	PzIw==
X-Gm-Message-State: AIVw110QjdbvdqkToLLf5A9cTmcjE/PAMHU/YerNlManQ5Ljus4kNzbS
	uezn1W8SkP55JWwHj+uFHobgCnR8GlgGn4M=
X-Received: by 10.107.169.80 with SMTP id s77mr9543731ioe.219.1500058020754;
	Fri, 14 Jul 2017 11:47:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.9.161 with HTTP; Fri, 14 Jul 2017 11:46:40 -0700 (PDT)
In-Reply-To: <CAP9ODKrKoTvH5ddakeOkWSa9Wh2jb75yM8mP97sr0OUYEgC+XQ@mail.gmail.com>
References: <20170712161907.13526-1-ross.burton@intel.com>
	<CAP9ODKrKoTvH5ddakeOkWSa9Wh2jb75yM8mP97sr0OUYEgC+XQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Jul 2017 19:46:40 +0100
Message-ID: <CAJTo0LZED099gSrkAO59bQx0CPas0xEDakD5uB0r-tPBCqvX9w@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: fix build race on src/intel/vulkan
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
X-List-Received-Date: Fri, 14 Jul 2017 18:47:00 -0000
Content-Type: multipart/alternative; boundary="001a1141006c78520e05544b79b4"

--001a1141006c78520e05544b79b4
Content-Type: text/plain; charset="UTF-8"

The second sob is from the patch I sent upstream.  The first two lines of
the patch header are the OE ones:

+++ b/meta/recipes-graphics/mesa/files/vulkan-mkdir.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Submitted
+Signed-off-by: Ross Burton <ross.burton@intel.com>

Ross

On 14 July 2017 at 18:19, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> On Wed, Jul 12, 2017 at 1:19 PM, Ross Burton <ross.burton@intel.com>
> wrote:
> > It's possible that src/intel/vulkcan can be written into by sed before
> it has
> > been created, so add the required mkdir calls.
> >
> > Signed-off-by: Ross Burton <ross.burton@intel.com>
>
> Has this been send to upstream? Upstream-Status?
>
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
>

--001a1141006c78520e05544b79b4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The second sob is from the patch I sent upstream.=C2=A0 Th=
e first two lines of the patch header are the OE ones:<div><br></div><div><=
span style=3D"font-size:12.800000190734863px">+++ b/meta/recipes-graphics/m=
esa/</span><wbr style=3D"font-size:12.800000190734863px"><span style=3D"fon=
t-size:12.800000190734863px">files/vulkan-mkdir.patch</span><br style=3D"fo=
nt-size:12.800000190734863px"><span style=3D"font-size:12.800000190734863px=
">@@ -0,0 +1,37 @@</span><br style=3D"font-size:12.800000190734863px"><span=
 style=3D"font-size:12.800000190734863px">+Upstream-Status: Submitted</span=
><br style=3D"font-size:12.800000190734863px"><span style=3D"font-size:12.8=
00000190734863px">+Signed-off-by: Ross Burton &lt;</span><a href=3D"mailto:=
ross.burton@intel.com" style=3D"font-size:12.800000190734863px">ross.burton=
@intel.com</a><span style=3D"font-size:12.800000190734863px">&gt;</span><br=
></div><div><span style=3D"font-size:12.800000190734863px"><br></span></div=
><div><span style=3D"font-size:12.800000190734863px">Ross</span></div></div=
><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 14 July 2017 =
at 18:19, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"mailto:otavio.sa=
lvador@ossystems.com.br" target=3D"_blank">otavio.salvador@ossystems.com.br=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n Wed, Jul 12, 2017 at 1:19 PM, Ross Burton &lt;<a href=3D"mailto:ross.burt=
on@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt; It&#39;s possible that src/intel/vulkcan can be written into by sed be=
fore it has<br>
&gt; been created, so add the required mkdir calls.<br>
&gt;<br>
&gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com=
">ross.burton@intel.com</a>&gt;<br>
<br>
</span>Has this been send to upstream? Upstream-Status?<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
Otavio Salvador=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0O.S. Systems<br>
<a href=3D"http://www.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank=
">http://www.ossystems.com.br</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"htt=
p://code.ossystems.com.br" rel=3D"noreferrer" target=3D"_blank">http://code=
.ossystems.com.br</a><br>
Mobile: <a href=3D"tel:%2B55%20%2853%29%209981-7854" value=3D"+555399817854=
">+55 (53) 9981-7854</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Mobile: <=
a href=3D"tel:%2B1%20%28347%29%20903-9750" value=3D"+13479039750">+1 (347) =
903-9750</a><br>
</font></span></blockquote></div><br></div>

--001a1141006c78520e05544b79b4--
