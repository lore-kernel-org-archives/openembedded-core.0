Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by mail.openembedded.org (Postfix) with ESMTP id EA9EE73115
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:47:12 +0000 (UTC)
Received: by mail-qt0-f171.google.com with SMTP id r30so93063698qtc.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=b1MMwZ85+cKnLQb10/AEOzlqZDG8FY+evEZwAG2pQn8=;
	b=DhABjBcEfQauMW8QCAK5+dRmxjZ5ZoPFtfv71ktqbrZ/sfJ0NzXMTjvRNm6r76f9Ji
	y9wHAPuTb31oi5yK7UN7bbSiw3+J38HFPWSu/IklK5P/aZD6W6+xTHhCCaZTjKKX289r
	o0R33g6LdbWY219q/xPmhc+5sHkG52mN0+p2GME83jvKAMYCpZpJ4E0rUlHf0SQFSAKu
	fowe2ws6xOuI2otWjY/pVJa6exrGY+IquS1Ff7CGSZ0CmSDCQJScH7v+np+Kgx6wfNIE
	OVD8/LvJGqbbj9hc1Y4pHogZoSQGXc/8D55Rd0b2LrK4n9VtknJ2Gkp2gm/jGbNzRR0k
	n+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=b1MMwZ85+cKnLQb10/AEOzlqZDG8FY+evEZwAG2pQn8=;
	b=ELU+DGn/khiImxdc8+5mdnoddwPYjpm5IoKxCr5v3jlcNmAFIMi/gCcp/1naRNCyVd
	ek1lqyiflHoQzOjLzWILedv2aRxcwg0VHP1CXrBmNZl+ZbTqIzaDYrUjCAL7QbUN40JI
	vsAwPzX8QILdq0fah7eWW9VmBoGZ7fvUsSUuk3W99x/IrSTdnHMtxjcExz8ew6NnjfWL
	MEXfOEq5EGoReUzxn9mEiIXIIKkQBUeuRygX/OVNt2iMFx+Iv7tGojtRdUjqgn1j5sDQ
	71ViSgSCiVOWyNO0V5gvj9vrxFEqQRwp7VMg+Hh8949esN9/gCrE6Z5nKS+Sj7sm3mlM
	HaWw==
X-Gm-Message-State: AIVw1128gbB7A2BbAwqbkEI3WHs3nZttfG25psDJ6NgJNbx96YtRPi6A
	HhQ+b46xrczO9aaJFfRPT7+6eXuGCKot
X-Received: by 10.200.44.186 with SMTP id 55mr9101874qtw.173.1499762833717;
	Tue, 11 Jul 2017 01:47:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 01:46:53 -0700 (PDT)
In-Reply-To: <CALatG=7jXymLWW-KsqMv-RXGVxtOMC6gXjEv_ANDWryigXemag@mail.gmail.com>
References: <1499352038-27144-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LZaTP--5JmZN6=0Of5W3Cepx3HDT=+3WrjyuUBUvhmC8w@mail.gmail.com>
	<CALatG=7jXymLWW-KsqMv-RXGVxtOMC6gXjEv_ANDWryigXemag@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 09:46:53 +0100
Message-ID: <CAJTo0Lb=8yL7M=OSeXxn5m0vcNv-a70JSeaN1c5_5WDQvyo7TQ@mail.gmail.com>
To: Ming Liu <liu.ming50@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image-mklibs.bbclass: add a missing dependency
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
X-List-Received-Date: Tue, 11 Jul 2017 08:47:13 -0000
Content-Type: multipart/alternative; boundary="001a1135977cf39d1e055406beab"

--001a1135977cf39d1e055406beab
Content-Type: text/plain; charset="UTF-8"

Ah, thanks.

Ross

On 11 July 2017 at 09:45, Ming Liu <liu.ming50@gmail.com> wrote:

> Hi, Burton:
>
> This patch is relying on another one I sent several days ago: "[OE-core]
> [PATCH V2] meta: move image-mklibs image-prelink to IMAGE_CLASSES"
>
> Maybe I should send them together in one mail.
>
> the best,
> thank you
>
> 2017-07-11 10:36 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
>
>>
>> On 6 July 2017 at 15:40, <liu.ming50@gmail.com> wrote:
>>
>>> ${HOST_PREFIX}readelf is being called in mklibs_optimize_image_doit, so
>>> do_rootfs should depend on
>>> virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot.
>>>
>>
>> I think this was responsible for my latest autobuilder run failing:
>>
>> ERROR: Nothing PROVIDES 'virtual/none-poky-none-binutils'. Close matches:
>>   virtual/aarch64-poky-linux-binutils
>> Missing or unbuildable dependency chain was: ['core-image-minimal',
>> 'uninative-tarball', 'virtual/none-poky-none-binutils']
>>
>> Ross
>>
>
>

--001a1135977cf39d1e055406beab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, thanks.<div><br></div><div>Ross</div></div><div class=
=3D"gmail_extra"><br><div class=3D"gmail_quote">On 11 July 2017 at 09:45, M=
ing Liu <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" targe=
t=3D"_blank">liu.ming50@gmail.com</a>&gt;</span> wrote:<br><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr">Hi, Burton:<div><br></div><div>This patch i=
s relying on another one I sent several days ago: &quot;<span style=3D"colo=
r:rgb(51,51,51);font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;S=
egoe WP&quot;,Tahoma,Arial,sans-serif;font-size:21px">[OE-core] [PATCH V2] =
meta: move image-mklibs image-prelink to IMAGE_CLASSES</span>&quot;</div><d=
iv><br></div><div>Maybe I should send them together in one mail.</div><div>=
<br></div><div>the best,</div><div>thank you</div></div><div class=3D"HOEnZ=
b"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">2017-07-11 10:36 GMT+02:00 Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div clas=
s=3D"gmail_extra"><span><br><div class=3D"gmail_quote">On 6 July 2017 at 15=
:40,  <span dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;bo=
rder-left-style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">=
<div id=3D"m_-4019622463400724112m_-146361217003745936gmail-:2wv" class=3D"=
m_-4019622463400724112m_-146361217003745936gmail-a3s m_-4019622463400724112=
m_-146361217003745936gmail-aXjCH m_-4019622463400724112m_-14636121700374593=
6gmail-m15d1858eafd27439">${HOST_PREFIX}readelf is being called in mklibs_o=
ptimize_image_doit, so<br>
do_rootfs should depend on<br>
virtual/${MLPREFIX}${TARGET_PR<wbr>EFIX}binutils:do_populate_sysr<wbr>oot.<=
br></div></blockquote></div><br></span>I think=C2=A0this was responsible fo=
r my latest autobuilder run failing:<br><br>ERROR: Nothing PROVIDES &#39;vi=
rtual/none-poky-none-binuti<wbr>ls&#39;. Close matches:<br>=C2=A0 virtual/a=
arch64-poky-linux-bin<wbr>utils<br>Missing or unbuildable dependency chain =
was: [&#39;core-image-minimal&#39;, &#39;uninative-tarball&#39;, &#39;virtu=
al/none-poky-none-binuti<wbr>ls&#39;]</div><span class=3D"m_-40196224634007=
24112HOEnZb"><font color=3D"#888888"><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra">Ross</div></font></span></div>
</blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--001a1135977cf39d1e055406beab--
