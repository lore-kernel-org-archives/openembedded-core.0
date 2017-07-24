Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id B77B57837E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 10:23:23 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g13so41159511ioj.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 03:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5H1rjxmGs9s5A8jOQbYTuMuV4Wb8JNV6a/gtwSFDEnI=;
	b=v7lEIRGXqZ3SM4JOf3NhDZKalAAsSwk9AYpa4BO8NeSK3LXXQ28R7fCgWr/lkwpzbo
	b8vwQmhfbKLebApyHjfb82QA2BTa9OC7yvs4rj7A/oER4lJ8w4eNqrWjaDyba8T4tO7P
	SzY+qcLM90FF7xUS7BWo7YH05iaENhhVhxy9dJPiN5L9yU+foh1QUq+1aoOrYpQkCP6Z
	o4eJMIKaYSlQ3JO8vUAvdVJ3AMS73gxK+JUttAXNVjRr3OPbwuqvvxjNmcJ8uKi/5Jci
	AR13cgHsZKX7o9ugf7xLOQLJlpJj9KwnPdBr9OlPwdQq2Im4k4k9s76PoZUJaOKLHLXy
	L0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5H1rjxmGs9s5A8jOQbYTuMuV4Wb8JNV6a/gtwSFDEnI=;
	b=O9OoUIjVZaGGtlFDqa9KftX7A9PJzX46rre1gatnyPlfAiCx9CO6X3bFMzerizeRbo
	0ie2tcOnZksrCRp6R14amysKCxngRToPBWlKdD41qGpe3hkEXPv8WLuZyc+2ud/ablXF
	jb/9uPfJ8fIFelL/BJ7w871EwGHPQohNRQ7vK73h4K6W+zksvfwcU2pax23r4ABCrx4t
	Wog3zPt2JH3dTDRmoJZQS5bnB5Gk5fxqFB40IIk0iw/dhxIft7tOvAs/Sq5vl4v5CWPY
	Rfma+83HQJ+10gS2nWex0uZGH5j9ii93BAkjwc+vjkpH6zg8VxHC8WhDLRe2UV9hmFE4
	6hzg==
X-Gm-Message-State: AIVw1132bms1D2x09I8IwaIRIVNAuoWrylwTFHn+Tm1XcpXbKgn+Z3ns
	DMl4qrCcXB5uwDZHkh21ZhxJEJacRQTI
X-Received: by 10.107.132.33 with SMTP id g33mr14263328iod.300.1500891804723; 
	Mon, 24 Jul 2017 03:23:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Mon, 24 Jul 2017 03:23:04 -0700 (PDT)
In-Reply-To: <CAJTo0Lb0YdjLaVyLqHxfztCuYyrvEVAzXSZt5wZ7o=c_PXMh3g@mail.gmail.com>
References: <cover.1500357604.git.dengke.du@windriver.com>
	<dd968ff528a0928627a3bb12b4b1e8d77a1ff829.1500357604.git.dengke.du@windriver.com>
	<CAJTo0Lac01Ny9N5D0p8Qv+GCFXRNv0qF_BjGdXx4Q3zvc+1How@mail.gmail.com>
	<CAMKF1soL-B5ryhSUD9twYD6BUwSQOpRN37uxd=OkC9HNLQaC1Q@mail.gmail.com>
	<CAJTo0Lb0YdjLaVyLqHxfztCuYyrvEVAzXSZt5wZ7o=c_PXMh3g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Jul 2017 11:23:04 +0100
Message-ID: <CAJTo0La48UP4m0NRFM+TwrrpmTm1jR222yRaBfD=Nq7fNehg6Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Jul 2017 10:23:23 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e8de078905550d9a0b"

--001a113ed2e8de078905550d9a0b
Content-Type: text/plain; charset="UTF-8"

I've filed a bug upstream about the failure on Debian 8:
https://github.com/libexpat/libexpat/issues/97

Defining XML_POOR_ENTROPY will allow expat to fall back to weak entropy on
hosts that don't have direct support for getrandom().

Ross

On 24 July 2017 at 11:20, Burton, Ross <ross.burton@intel.com> wrote:

> I didn't see that upgrade, but yes it will.
>
> expat 2.2.2 demands either getrandom() from glibc (2.25 onwards) or
> SYS_getrandom (not sure what glibc added this, but its not in Debian 8's
> 2.19.
>
> Ross
>
> On 22 July 2017 at 16:19, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Sat, Jul 22, 2017 at 2:24 AM, Burton, Ross <ross.burton@intel.com>
>> wrote:
>> >
>> > On 18 July 2017 at 07:01, Dengke Du <dengke.du@windriver.com> wrote:
>> >>
>> >>     using getrandom syscall on linux 3.17+, so when we compiling
>> >> expat-native
>> >>     on the kernel older than 3.17, that would be failed.
>> >
>> >
>> > It's failing on Debian 8, which is kernel 4.9.0:
>> >
>> > | ../expat-2.2.2/lib/xmlparse.c:56:3: error: #error You do not have
>> support
>> > for any sources of high quality entropy enabled. For end user security,
>> that
>> > is probably not what you want. Your options include: * Linux + glibc
>> >=2.25
>> > (getrandom): HAVE_GETRANDOM, * Linux + glibc <2.25 (syscall
>> SYS_getrandom):
>> > HAVE_SYSCALL_GETRANDOM, * BSD / macOS (arc4random_buf):
>> HAVE_ARC4RANDOM_BUF,
>> > * libbsd (arc4random_buf): HAVE_ARC4RANDOM_BUF + HAVE_LIBBSD, * Windows
>> > (RtlGenRandom): _WIN32. If insist on not using any of these, bypass this
>> > error by defining XML_POOR_ENTROPY; you have been warned. For CMake,
>> one way
>> > to pass the define is: cmake -DCMAKE_C_FLAGS="-pipe -O2
>> > -DHAVE_SYSCALL_GETRANDOM" . If you have reasons to patch this detection
>> code
>> > away or need changes to the build system, please open a bug. Thank you!
>> >
>> > (https://autobuilder.yocto.io/builders/nightly-ppc/builds/37
>> 9/steps/BuildImages/logs/stdio)
>> >
>> > I suspect the detection code is well and truly broken.
>> >
>>
>> I posted another patch doing this upgrade. I wonder if it has same
>> issue. it works on my 3.12 kernel based host.
>>
>> > Ross
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> >
>>
>
>

--001a113ed2e8de078905550d9a0b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve filed a bug upstream about the failure on Debian =
8:=C2=A0<a href=3D"https://github.com/libexpat/libexpat/issues/97">https://=
github.com/libexpat/libexpat/issues/97</a><div><br></div><div>Defining=C2=
=A0<span style=3D"color:rgb(80,0,80);font-size:12.800000190734863px">XML_PO=
OR_ENTROPY will allow expat to fall back to weak entropy on hosts that don&=
#39;t have direct support for getrandom().</span></div><div><span style=3D"=
color:rgb(80,0,80);font-size:12.800000190734863px"><br></span></div><div><s=
pan style=3D"color:rgb(80,0,80);font-size:12.800000190734863px">Ross</span>=
</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On 24=
 July 2017 at 11:20, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">I didn&#39;t se=
e that upgrade, but yes it will.<div><br></div><div>expat 2.2.2 demands eit=
her getrandom() from glibc (2.25 onwards) or SYS_getrandom (not sure what g=
libc added this, but its not in Debian 8&#39;s 2.19.</div><span class=3D"HO=
EnZb"><font color=3D"#888888"><div><br></div><div>Ross</div></font></span><=
/div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 22 July 2017 at 16:19, Khem Raj <span dir=3D=
"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@=
gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span>On=
 Sat, Jul 22, 2017 at 2:24 AM, Burton, Ross &lt;<a href=3D"mailto:ross.burt=
on@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 18 July 2017 at 07:01, Dengke Du &lt;<a href=3D"mailto:dengke.du@wi=
ndriver.com" target=3D"_blank">dengke.du@windriver.com</a>&gt; wrote:<br>
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
://autobuilder.yocto.io/<wbr>builders/nightly-ppc/builds/37<wbr>9/steps/Bui=
ldImages/logs/stdio</a><wbr>)<br>
&gt;<br>
&gt; I suspect the detection code is well and truly broken.<br>
&gt;<br>
<br>
</span>I posted another patch doing this upgrade. I wonder if it has same<b=
r>
issue. it works on my 3.12 kernel based host.<br>
<br>
&gt; Ross<br>
<div class=3D"m_6787301692248884067HOEnZb"><div class=3D"m_6787301692248884=
067h5">&gt;<br>
&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<=
wbr>mailman/listinfo/openembedded-<wbr>core</a><br>
&gt;<br>
</div></div></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a113ed2e8de078905550d9a0b--
