Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f52.google.com (mail-pg0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id E374A60191
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 19:22:17 +0000 (UTC)
Received: by mail-pg0-f52.google.com with SMTP id g6so2305696pgn.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 12:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bohOAWfX/DxZpbleU8tzt8oo2bDFQaGhO0VGMiKPB3E=;
	b=O1GxQzVr0WPBmaKLbMywqt/AXyDd+YVSY8XRr/rUasrW8Vmzy1qG8NQ4xrYeAUgYY7
	F38obGoUz85/blXAky6pHAvt6O2g5+f5f+sBj27FiT8rgkrr427m6RNtp0suEo2Tl0lg
	LjHjQnr55keRokM/SniYwWZ7Y7KyyItWStH7GVozjBGwaL8dzAK1Z89uM0hg7cVHkHtt
	TWS2mvipICDlvIYE2gf40c0rgCYSU/XUlnarjPQgCIWlEWO7kpDw69TZs2s+8DoRjsLw
	7b5IH3rmvZtF4iVuzpRLCVlLgTAiQ42VU7FwZHWu9gREy+5pW8CRQK11kl1cz8xRb5vO
	pXhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bohOAWfX/DxZpbleU8tzt8oo2bDFQaGhO0VGMiKPB3E=;
	b=dBwt+8BA4ujQgCs6Hl2d7fePaw7inEAFvaveLcGRzOP6dr7GQuXD0CVj56/8f6tVpV
	u1vemoagDl+SzCy75MG14KsKwy6nb5fEMjonAp+LxtuTcicPqilLmIumzCbQPbyR58xj
	KbqNi9kN1I5/tvd0KPyypmir02sny8s5kRj4tJz9HHUDd7XkdKhMh8k2S4sM3MBjBsHK
	5tdbQZxOyeIO1uG9Q2hl/+5h3IkJAX8pdp2FisZz2B5ozmnjOQXai7IxwYOg+9WM6jwy
	SNLSriifz976G9Bp5rlK2vyA2ODcqmDHjLW5iGLuejEIakxkgoF+lROZDac1yBbN7n8/
	8L2A==
X-Gm-Message-State: AMCzsaVbPdpYoOO7joHZ+pxO/ibVVMZcDNQlEAHXgBadBbuMOKMiAFos
	/wuuOdeCZtMdHpoVMbBrHyTbDM7J94j9gPzbKMM=
X-Google-Smtp-Source: AOwi7QDNGLqBsJYETn0zCqf/zsZDw5NJ19aJZjOkE+S8oftq+6I2a7l2kBXJ6oAYvPDNDIO4DqVN2/xw9oT4YKCka1w=
X-Received: by 10.84.138.1 with SMTP id 1mr4724009plo.404.1508008938881; Sat,
	14 Oct 2017 12:22:18 -0700 (PDT)
MIME-Version: 1.0
References: <1507922729-17240-1-git-send-email-pbarker@toganlabs.com>
	<1507922729-17240-2-git-send-email-pbarker@toganlabs.com>
	<CAMKF1sqZrYbJ6MgLdQ5gJ=ZZhx1Gn=uYUD-_3S__E8OiDrLXiw@mail.gmail.com>
	<CAPyrkgx9fCua34-6h=1zJ0FsP4Hjgy7-3n+xnkuREWw2+xQmhw@mail.gmail.com>
In-Reply-To: <CAPyrkgx9fCua34-6h=1zJ0FsP4Hjgy7-3n+xnkuREWw2+xQmhw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 14 Oct 2017 19:22:07 +0000
Message-ID: <CAMKF1sq-Dd3Bp87q09yaXqvN5cae=C88uqJb_nMd++-W9OzX2Q@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] goarch.bbclass: Define HOST_GO386 and TARGET_GO386
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
X-List-Received-Date: Sat, 14 Oct 2017 19:22:18 -0000
Content-Type: multipart/alternative; boundary="94eb2c1169501ec77f055b86b189"

--94eb2c1169501ec77f055b86b189
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 14, 2017 at 11:46 AM Paul Barker <pbarker@toganlabs.com> wrote:

> On Sat, Oct 14, 2017 at 2:22 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On Fri, Oct 13, 2017 at 12:25 PM, Paul Barker <pbarker@toganlabs.com>
> wrote:
> >> These variables are used to control the floating-point instructions
> emitted by
> >> the go compiler for x86 architectures.
> >>
> >> The default is '387' which disables the use of sse/sse2 instructions
> and is safe
> >> to use on all x86 processors from the i486 onwards.
> >>
> >> If TUNE_FEATURES contains a feature set which is known to support
> sse/sse2
> >> instructions then they are set to 'sse2' to enable the use of these
> >> instructions. This is suitable for most processors from Pentium 4
> onwards.
> >>
> >> Only the 'core2' and 'corei7' TUNE_FEATURES are defined in the oe-core
> layer and
> >> are known to support ss2 instructions. Other layers may introduce
> additional
> >> tunings which support sse2 instructions and for these layers,
> TARGET_GO386
> >> or go_map_386 should be overridden as needed.
> >>
> >> Signed-off-by: Paul Barker <pbarker@toganlabs.com>
> >> ---
> >>  meta/classes/goarch.bbclass | 11 +++++++++++
> >>  1 file changed, 11 insertions(+)
> >>
> >> diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbclass
> >> index 659b26a..653f035 100644
> >> --- a/meta/classes/goarch.bbclass
> >> +++ b/meta/classes/goarch.bbclass
> >> @@ -4,10 +4,12 @@ BUILD_GOTUPLE =3D "${BUILD_GOOS}_${BUILD_GOARCH}"
> >>  HOST_GOOS =3D "${@go_map_os(d.getVar('HOST_OS'), d)}"
> >>  HOST_GOARCH =3D "${@go_map_arch(d.getVar('HOST_ARCH'), d)}"
> >>  HOST_GOARM =3D "${@go_map_arm(d.getVar('HOST_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
> >> +HOST_GO386 =3D "${@go_map_386(d.getVar('HOST_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
> >>  HOST_GOTUPLE =3D "${HOST_GOOS}_${HOST_GOARCH}"
> >>  TARGET_GOOS =3D "${@go_map_os(d.getVar('TARGET_OS'), d)}"
> >>  TARGET_GOARCH =3D "${@go_map_arch(d.getVar('TARGET_ARCH'), d)}"
> >>  TARGET_GOARM =3D "${@go_map_arm(d.getVar('TARGET_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
> >> +TARGET_GO386 =3D "${@go_map_386(d.getVar('TARGET_ARCH'),
> d.getVar('TUNE_FEATURES'), d)}"
> >>  TARGET_GOTUPLE =3D "${TARGET_GOOS}_${TARGET_GOARCH}"
> >>  GO_BUILD_BINDIR =3D
> "${@['bin/${HOST_GOTUPLE}','bin'][d.getVar('BUILD_GOTUPLE') =3D=3D
> d.getVar('HOST_GOTUPLE')]}"
> >>
> >> @@ -66,6 +68,15 @@ def go_map_arm(a, f, d):
> >>              return '5'
> >>      return ''
> >>
> >> +def go_map_386(a, f, d):
> >> +    import re
> >> +    if re.match('i.86', a):
> >> +        if ('core2' in f) or ('corei7' in f):
> >> +            return 'sse2'
> >> +        else:
> >> +            return '387'
> >> +    return ''
> >> +
> >
> >
> > This is too conservative IMO, e.g. anything above i586 is able to handl=
e
> sse2
> > with this patch i686 will use x87 for FPU,
> >
>
> The Go documentation says "Pentium 4/Opteron/Athlon 64 or later"


Ok if it needs p4 then lets keep it so

>
> (https://golang.org/doc/install/source). GCC documentation also
> suggests that i686 is too early to support SSE2:
> https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html#x86-Options. So I
> think i686 should be using the old-style FPU instructions.
>
> Cheers,
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd
>

--94eb2c1169501ec77f055b86b189
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Sat, Oct 14, 2017 =
at 11:46 AM Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs.com">pbarke=
r@toganlabs.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On S=
at, Oct 14, 2017 at 2:22 AM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.=
com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt; On Fri, Oct 13, 2017 at 12:25 PM, Paul Barker &lt;<a href=3D"mailto:pb=
arker@toganlabs.com" target=3D"_blank">pbarker@toganlabs.com</a>&gt; wrote:=
<br>
&gt;&gt; These variables are used to control the floating-point instruction=
s emitted by<br>
&gt;&gt; the go compiler for x86 architectures.<br>
&gt;&gt;<br>
&gt;&gt; The default is &#39;387&#39; which disables the use of sse/sse2 in=
structions and is safe<br>
&gt;&gt; to use on all x86 processors from the i486 onwards.<br>
&gt;&gt;<br>
&gt;&gt; If TUNE_FEATURES contains a feature set which is known to support =
sse/sse2<br>
&gt;&gt; instructions then they are set to &#39;sse2&#39; to enable the use=
 of these<br>
&gt;&gt; instructions. This is suitable for most processors from Pentium 4 =
onwards.<br>
&gt;&gt;<br>
&gt;&gt; Only the &#39;core2&#39; and &#39;corei7&#39; TUNE_FEATURES are de=
fined in the oe-core layer and<br>
&gt;&gt; are known to support ss2 instructions. Other layers may introduce =
additional<br>
&gt;&gt; tunings which support sse2 instructions and for these layers, TARG=
ET_GO386<br>
&gt;&gt; or go_map_386 should be overridden as needed.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Paul Barker &lt;<a href=3D"mailto:pbarker@toganlabs=
.com" target=3D"_blank">pbarker@toganlabs.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/classes/goarch.bbclass | 11 +++++++++++<br>
&gt;&gt;=C2=A0 1 file changed, 11 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/classes/goarch.bbclass b/meta/classes/goarch.bbc=
lass<br>
&gt;&gt; index 659b26a..653f035 100644<br>
&gt;&gt; --- a/meta/classes/goarch.bbclass<br>
&gt;&gt; +++ b/meta/classes/goarch.bbclass<br>
&gt;&gt; @@ -4,10 +4,12 @@ BUILD_GOTUPLE =3D &quot;${BUILD_GOOS}_${BUILD_GO=
ARCH}&quot;<br>
&gt;&gt;=C2=A0 HOST_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;HOST_OS&#39;)=
, d)}&quot;<br>
&gt;&gt;=C2=A0 HOST_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;HOST_ARCH=
&#39;), d)}&quot;<br>
&gt;&gt;=C2=A0 HOST_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;HOST_ARCH&#=
39;), d.getVar(&#39;TUNE_FEATURES&#39;), d)}&quot;<br>
&gt;&gt; +HOST_GO386 =3D &quot;${@go_map_386(d.getVar(&#39;HOST_ARCH&#39;),=
 d.getVar(&#39;TUNE_FEATURES&#39;), d)}&quot;<br>
&gt;&gt;=C2=A0 HOST_GOTUPLE =3D &quot;${HOST_GOOS}_${HOST_GOARCH}&quot;<br>
&gt;&gt;=C2=A0 TARGET_GOOS =3D &quot;${@go_map_os(d.getVar(&#39;TARGET_OS&#=
39;), d)}&quot;<br>
&gt;&gt;=C2=A0 TARGET_GOARCH =3D &quot;${@go_map_arch(d.getVar(&#39;TARGET_=
ARCH&#39;), d)}&quot;<br>
&gt;&gt;=C2=A0 TARGET_GOARM =3D &quot;${@go_map_arm(d.getVar(&#39;TARGET_AR=
CH&#39;), d.getVar(&#39;TUNE_FEATURES&#39;), d)}&quot;<br>
&gt;&gt; +TARGET_GO386 =3D &quot;${@go_map_386(d.getVar(&#39;TARGET_ARCH&#3=
9;), d.getVar(&#39;TUNE_FEATURES&#39;), d)}&quot;<br>
&gt;&gt;=C2=A0 TARGET_GOTUPLE =3D &quot;${TARGET_GOOS}_${TARGET_GOARCH}&quo=
t;<br>
&gt;&gt;=C2=A0 GO_BUILD_BINDIR =3D &quot;${@[&#39;bin/${HOST_GOTUPLE}&#39;,=
&#39;bin&#39;][d.getVar(&#39;BUILD_GOTUPLE&#39;) =3D=3D d.getVar(&#39;HOST_=
GOTUPLE&#39;)]}&quot;<br>
&gt;&gt;<br>
&gt;&gt; @@ -66,6 +68,15 @@ def go_map_arm(a, f, d):<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;5&#39;=
<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 return &#39;&#39;<br>
&gt;&gt;<br>
&gt;&gt; +def go_map_386(a, f, d):<br>
&gt;&gt; +=C2=A0 =C2=A0 import re<br>
&gt;&gt; +=C2=A0 =C2=A0 if re.match(&#39;i.86&#39;, a):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (&#39;core2&#39; in f) or (&#39;co=
rei7&#39; in f):<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;sse2&#39;<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return &#39;387&#39;<br=
>
&gt;&gt; +=C2=A0 =C2=A0 return &#39;&#39;<br>
&gt;&gt; +<br>
&gt;<br>
&gt;<br>
&gt; This is too conservative IMO, e.g. anything above i586 is able to hand=
le sse2<br>
&gt; with this patch i686 will use x87 for FPU,<br>
&gt;<br>
<br>
The Go documentation says &quot;Pentium 4/Opteron/Athlon 64 or later&quot;<=
/blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Ok if it needs p4=
 then lets keep it so</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
(<a href=3D"https://golang.org/doc/install/source" rel=3D"noreferrer" targe=
t=3D"_blank">https://golang.org/doc/install/source</a>). GCC documentation =
also<br>
suggests that i686 is too early to support SSE2:<br>
<a href=3D"https://gcc.gnu.org/onlinedocs/gcc/x86-Options.html#x86-Options"=
 rel=3D"noreferrer" target=3D"_blank">https://gcc.gnu.org/onlinedocs/gcc/x8=
6-Options.html#x86-Options</a>. So I<br>
think i686 should be using the old-style FPU instructions.<br>
<br>
Cheers,<br>
<br>
--<br>
Paul Barker<br>
Tog=C3=A1n Labs Ltd<br>
</blockquote></div></div>

--94eb2c1169501ec77f055b86b189--
