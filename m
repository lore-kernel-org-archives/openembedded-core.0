Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id DBAF278371
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 10:20:42 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id h199so31919982ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 03:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+KmLXCNyMJfiN2vihf03bAmdgVCxHCuCy4K9oUkmsLQ=;
	b=neirKOvSxyyABMN9EzYnQjPlwj5qOahsJopu+pZJbp4Hu3Rnfe3i9bQCONQr9gui9T
	0ikPEff36cwJXSQly2kHUsVPfmyiFLYj8otyEUwK8vX0y6NQ+f2fa5NHqLgdjoAwBSO1
	n5oXlP617g+sxAoG/n4r2j2Mn0mJ+bNwCQj+SjSflWbOuRjpy+2R5d6+KYxaQYISvprk
	o6mFY3mJnD6gHUy2PtE0twudQGyq0k1+Q2WleAzXAuM0DK2Y/cQptsVtVuOy6gupOaIh
	hWmEQyL+7dgzhmBU4B/Nh5ATHxS+gwpLyUCAeWhB/KWxff/8iA8BpQV9NVkXliZ8DLaH
	27ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+KmLXCNyMJfiN2vihf03bAmdgVCxHCuCy4K9oUkmsLQ=;
	b=rrotsxIMPNsuqauePKjsHiZUbQAAhJ6Mtgs7FgZYL/jZF2qgg/756Bbm4flentKq2o
	bwKna3ssVYIcO6bYaRcnyms7kRoXGNIBsE9FbdECCVS4jNUs5XBdwaD/W5IyBcdQiW+Y
	yCH78MvC4oq2/KjgOKN/JS3V8PWXtCEvCnauxwmOgmVFwetzrsMwOO6EUYLuQlKLgY3M
	5NchAznZnUC7fUiPVie2xS489eWlBA1IFghZAq0hmuP7AIueKJB51tlInl2uHo63BrRi
	KuUS5y7+7j9saHSDSkoLHq/ai6GkmcQhU4bBEcPDsm7u6o//P/yWHEMVJ6W1von7ZFgN
	dK2g==
X-Gm-Message-State: AIVw113xPpJe6xnezbV6FI1lDHUEYX/ZVK4O9UJV6JWX3AixzhD8mH1S
	+5PMiFEDNrRooSzhaB5KKD1pshXseoVK
X-Received: by 10.36.26.13 with SMTP id 13mr6071583iti.87.1500891643883; Mon,
	24 Jul 2017 03:20:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 24 Jul 2017 03:20:23 -0700 (PDT)
In-Reply-To: <CAMKF1soL-B5ryhSUD9twYD6BUwSQOpRN37uxd=OkC9HNLQaC1Q@mail.gmail.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
	<dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
	<CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
	<CAMKF1soL-B5ryhSUD9twYD6BUwSQOpRN37uxd=OkC9HNLQaC1Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jul 2017 11:20:23 +0100
Message-ID: <CAJTo0Lb0YdjLaVyLqHxfztCuYyrvEVAzXSZt5wZ7o=c_PXMh3g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] expat: upgrade to 2.2.2
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
X-List-Received-Date: Mon, 24 Jul 2017 10:20:43 -0000
Content-Type: multipart/alternative; boundary="001a11441b5c47cb2405550d91fe"

--001a11441b5c47cb2405550d91fe
Content-Type: text/plain; charset="UTF-8"

I didn't see that upgrade, but yes it will.

expat 2.2.2 demands either getrandom() from glibc (2.25 onwards) or
SYS_getrandom (not sure what glibc added this, but its not in Debian 8's
2.19.

Ross

On 22 July 2017 at 16:19, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Jul 22, 2017 at 2:24 AM, Burton, Ross <ross.burton@intel.com>
> wrote:
> >
> > On 18 July 2017 at 07:01, Dengke Du <dengke.du@windriver.com> wrote:
> >>
> >>     using getrandom syscall on linux 3.17+, so when we compiling
> >> expat-native
> >>     on the kernel older than 3.17, that would be failed.
> >
> >
> > It's failing on Debian 8, which is kernel 4.9.0:
> >
> > | ../expat-2.2.2/lib/xmlparse.c:56:3: error: #error You do not have
> support
> > for any sources of high quality entropy enabled. For end user security,
> that
> > is probably not what you want. Your options include: * Linux + glibc
> >=2.25
> > (getrandom): HAVE_GETRANDOM, * Linux + glibc <2.25 (syscall
> SYS_getrandom):
> > HAVE_SYSCALL_GETRANDOM, * BSD / macOS (arc4random_buf):
> HAVE_ARC4RANDOM_BUF,
> > * libbsd (arc4random_buf): HAVE_ARC4RANDOM_BUF + HAVE_LIBBSD, * Windows
> > (RtlGenRandom): _WIN32. If insist on not using any of these, bypass this
> > error by defining XML_POOR_ENTROPY; you have been warned. For CMake, one
> way
> > to pass the define is: cmake -DCMAKE_C_FLAGS="-pipe -O2
> > -DHAVE_SYSCALL_GETRANDOM" . If you have reasons to patch this detection
> code
> > away or need changes to the build system, please open a bug. Thank you!
> >
> > (https://autobuilder.yocto.io/builders/nightly-ppc/builds/
> 379/steps/BuildImages/logs/stdio)
> >
> > I suspect the detection code is well and truly broken.
> >
>
> I posted another patch doing this upgrade. I wonder if it has same
> issue. it works on my 3.12 kernel based host.
>
> > Ross
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> >
>

--001a11441b5c47cb2405550d91fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I didn&#39;t see that upgrade, but yes it will.<div><br></=
div><div>expat 2.2.2 demands either getrandom() from glibc (2.25 onwards) o=
r SYS_getrandom (not sure what glibc added this, but its not in Debian 8&#3=
9;s 2.19.</div><div><br></div><div>Ross</div></div><div class=3D"gmail_extr=
a"><br><div class=3D"gmail_quote">On 22 July 2017 at 16:19, Khem Raj <span =
dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj=
.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><sp=
an class=3D"">On Sat, Jul 22, 2017 at 2:24 AM, Burton, Ross &lt;<a href=3D"=
mailto:ross.burton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 18 July 2017 at 07:01, Dengke Du &lt;<a href=3D"mailto:dengke.du@wi=
ndriver.com">dengke.du@windriver.com</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0using getrandom syscall on linux 3.17+, so when=
 we compiling<br>
&gt;&gt; expat-native<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0on the kernel older than 3.17, that would be fa=
iled.<br>
&gt;<br>
&gt;<br>
&gt; It&#39;s failing on Debian 8, which is kernel 4.9.0:<br>
&gt;<br>
&gt; | ../expat-2.2.2/lib/xmlparse.c:<wbr>56:3: error: #error You do not ha=
ve support<br>
&gt; for any sources of high quality entropy enabled. For end user security=
, that<br>
&gt; is probably not what you want. Your options include: * Linux + glibc &=
gt;=3D2.25<br>
&gt; (getrandom): HAVE_GETRANDOM, * Linux + glibc &lt;2.25 (syscall SYS_get=
random):<br>
&gt; HAVE_SYSCALL_GETRANDOM, * BSD / macOS (arc4random_buf): HAVE_ARC4RANDO=
M_BUF,<br>
&gt; * libbsd (arc4random_buf): HAVE_ARC4RANDOM_BUF + HAVE_LIBBSD, * Window=
s<br>
&gt; (RtlGenRandom): _WIN32. If insist on not using any of these, bypass th=
is<br>
&gt; error by defining XML_POOR_ENTROPY; you have been warned. For CMake, o=
ne way<br>
&gt; to pass the define is: cmake -DCMAKE_C_FLAGS=3D&quot;-pipe -O2<br>
&gt; -DHAVE_SYSCALL_GETRANDOM&quot; . If you have reasons to patch this det=
ection code<br>
&gt; away or need changes to the build system, please open a bug. Thank you=
!<br>
&gt;<br>
&gt; (<a href=3D"https://autobuilder.yocto.io/builders/nightly-ppc/builds/3=
79/steps/BuildImages/logs/stdio" rel=3D"noreferrer" target=3D"_blank">https=
://autobuilder.yocto.io/<wbr>builders/nightly-ppc/builds/<wbr>379/steps/Bui=
ldImages/logs/<wbr>stdio</a>)<br>
&gt;<br>
&gt; I suspect the detection code is well and truly broken.<br>
&gt;<br>
<br>
</span>I posted another patch doing this upgrade. I wonder if it has same<b=
r>
issue. it works on my 3.12 kernel based host.<br>
<br>
&gt; Ross<br>
<div class=3D"HOEnZb"><div class=3D"h5">&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedd=
ed-core@lists.<wbr>openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</div></div></blockquote></div><br></div>

--001a11441b5c47cb2405550d91fe--
