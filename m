Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5D53071D9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 15:26:08 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id n204so119456436qke.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:26:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=It6++NrTWBt1ceMh9aXvM9Q4aSRFfgiC45GG/L9ktbU=;
	b=dKGG/1S5lZmWDAmX2WhyUv1qNlmdVDQB5MRdU/IIy1684AhduT8oISKFxe8q+QwuZH
	xWNFeu0wX0htBDoKMevvJ1TW5u6Rmyd5TyJmjBRvdx+dsa40rsbj/4DeLSJGQEPjxE7p
	qAtCmXVG7KtRCsfIyBvmj9LeQ9t2T03s7Zwi3hYx/zh0y/OIrFqhSd6ukT+OzTwx1P5B
	ev0QPoKX3vjIvS8pgjnY619rPzaTlGi/3Z2OYQLqYUfrPBd5UZP3hRoAhlRiqpy6oLut
	jreqqnn15nhbSLZ0o619zZIOs3nF6a2fwm/KMIyt/HMaUdJPuq4Didkz21fiuqbp3ebn
	Xn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=It6++NrTWBt1ceMh9aXvM9Q4aSRFfgiC45GG/L9ktbU=;
	b=FnN9Z9t7+xqr9l8q4ph3Ufu6lRFMZC0SVEnwbX+uDILnZaRSgOZxpyNMiz1Ey5UjYc
	onvgT+SP7IaCeFWo2Gu/e3u8WPeAigrtLDGX9s+oVs/OcLxPaThOIDZeor2rWOBeqduh
	wWaCjyz4ailktcJBWbU3e453hX73O+sFhCsadukAP8hELXNXXQwUIaelBSECGXxhiLPV
	bWn/Sd7arIkYvtHfd7n8iUmqYZaXc5r1FJZZn1DSTzcGv+zKytxS6nUpKaBQVChLSsmq
	lq/z0k13tEY9GD26rySVn+Apu70Tr08yeJuxYAO5FhQWQvdGBY5+15SHgrhbT53AZZ1z
	WIRQ==
X-Gm-Message-State: AKaTC00LEho7FfFvCJS7rmnpdlZDXta3E0bttMegCQo/pZoUeHsvrlnNL3WGHqWiSovLpZqfMtt+2xDAG/EVF831
X-Received: by 10.55.8.20 with SMTP id 20mr95017692qki.3.1481642769500; Tue,
	13 Dec 2016 07:26:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Tue, 13 Dec 2016 07:25:49 -0800 (PST)
In-Reply-To: <2ecee254e60279af29f86073837fe8bd25998766.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<2ecee254e60279af29f86073837fe8bd25998766.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 13 Dec 2016 15:25:49 +0000
Message-ID: <CAJTo0LY6xCfxisFKFmeMuHEVayv28W7-1FiLDaUwT96YmTDWdg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 11/13] selftest: sstatetests: skip methods in case of poky-tiny or opengl is missing
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
X-List-Received-Date: Tue, 13 Dec 2016 15:26:12 -0000
Content-Type: multipart/alternative; boundary=001a114c9d60f5eb7f05438bd643

--001a114c9d60f5eb7f05438bd643
Content-Type: text/plain; charset=UTF-8

On 24 November 2016 at 20:58, <leonardo.sandoval.gonzalez@linux.intel.com>
wrote:

> diff --git a/meta/lib/oeqa/selftest/sstatetests.py
> b/meta/lib/oeqa/selftest/sstatetests.py
> index 6642539..8ea3932 100644
> --- a/meta/lib/oeqa/selftest/sstatetests.py
> +++ b/meta/lib/oeqa/selftest/sstatetests.py
> @@ -42,20 +42,36 @@ class SStateTests(SStateBase):
>      @testcase(975)
>      def test_sstate_creation_distro_specific_pass(self):
>          targetarch = get_bb_var('TUNE_ARCH')
> -        self.run_test_sstate_creation(['binutils-cross-'+ targetarch,
> 'binutils-native'], distro_specific=True, distro_nonspecific=False,
> temp_sstate_location=True)
> +        # Execute the test in all distros expect poky-tiny where
> glibc-initial is not provided
> +        targets = ['binutils-cross-'+ targetarch, 'binutils-native']
> +        if self.distro == 'poky-tiny':
> +            self.skipTest('Distro %s does not support building the
> following targets %s' % (self.distro, ','.join(targets)))
> +        self.run_test_sstate_creation(targets, distro_specific=True,
> distro_nonspecific=False, temp_sstate_location=True)
>

Sounds like it would be easier to just remove glibc-initial from that list,
and either remove it entirely or replace it with a virtual name that both
glibc and musl provide.


> @@ -228,6 +255,8 @@ class SStateTests(SStateBase):
>          build machines and running a builds, override the variables
> calling uname()
>          manually and check using bitbake -S.
>          """
> +        if self.distro == 'poky-tiny':
> +            self.skipTest('core-image-sato not buildable for poky-tiny')
>
>          topdir = get_bb_var('TOPDIR')
>          targetvendor = get_bb_var('TARGET_VENDOR')
>

For all of these tests that just do bitbake -S core-image-sato, if world
works then that is more flexible and more comprehensive.

Ross

--001a114c9d60f5eb7f05438bd643
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 24 November 2016 at 20:58,  <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">=
leonardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_quote"><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">diff --git a/meta/lib/oeqa/selftest/<wbr>sstatetests.py b/meta/lib/oeqa/=
selftest/<wbr>sstatetests.py<br>
index 6642539..8ea3932 100644<br>
--- a/meta/lib/oeqa/selftest/<wbr>sstatetests.py<br>
+++ b/meta/lib/oeqa/selftest/<wbr>sstatetests.py<br>
@@ -42,20 +42,36 @@ class SStateTests(SStateBase):<br>
=C2=A0 =C2=A0 =C2=A0@testcase(975)<br>
=C2=A0 =C2=A0 =C2=A0def test_sstate_creation_distro_<wbr>specific_pass(self=
):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targetarch =3D get_bb_var(&#39;TUNE_ARCH&=
#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_sstate_creation(<wbr>[&#39;binut=
ils-cross-&#39;+ targetarch, &#39;binutils-native&#39;], distro_specific=3D=
True, distro_nonspecific=3DFalse, temp_sstate_location=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Execute the test in all distros expect poky-=
tiny where glibc-initial is not provided<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D [&#39;binutils-cross-&#39;+ target=
arch, &#39;binutils-native&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.distro =3D=3D &#39;poky-tiny&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;Distro %s doe=
s not support building the following targets %s&#39; % (self.distro, &#39;,=
&#39;.join(targets)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.run_test_sstate_creation(<wbr>targets, di=
stro_specific=3DTrue, distro_nonspecific=3DFalse, temp_sstate_location=3DTr=
ue)<br></blockquote><div><br></div><div>Sounds like it would be easier to j=
ust remove glibc-initial from that list, and either remove it entirely or r=
eplace it with a virtual name that both glibc and musl provide.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">@@ -228,6 +255,8 @@ class SS=
tateTests(SStateBase):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0build machines and running a builds, over=
ride the variables calling uname()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0manually and check using bitbake -S.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if self.distro =3D=3D &#39;poky-tiny&#39;:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.skipTest(&#39;core-image-sa=
to not buildable for poky-tiny&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0topdir =3D get_bb_var(&#39;TOPDIR&#39;)<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0targetvendor =3D get_bb_var(&#39;TARGET_V=
ENDOR&#39;)<br></blockquote><div><br></div><div>For all of these tests that=
 just do bitbake -S core-image-sato, if world works then that is more flexi=
ble and more comprehensive.</div><div><br></div><div>Ross</div></div></div>=
</div>

--001a114c9d60f5eb7f05438bd643--
