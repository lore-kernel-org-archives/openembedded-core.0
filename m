Return-Path: <liu.ming50@gmail.com>
Received: from mail-ua0-f173.google.com (mail-ua0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6860873115
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 08:45:51 +0000 (UTC)
Received: by mail-ua0-f173.google.com with SMTP id g40so69783345uaa.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=VKUQeHfjTjj/lgJAXgfooSxUpivHXi5EOwdT/u27flU=;
	b=Rg4ZEcZC7CfJ1WJDd9GSnvO/s1daisl1IiDAlS4rE4UpFG4ZcEC65k6HBeS6ZLHEC1
	9EFWcsTCT4HmwgIuOhxUfzTTs6fgO1N7f71FXyhHgVOuQtC6GoEGCsT5Ejn9lGK8rm2j
	FxyIpxc7WGFwQ3rKcnxF2Tp/FLlWxh1ZzEEB2/v6Qihqq+5524nSAqiDqMUOG2hLf8yH
	lGwdGJR7HoNZchWDYxhIHhuzkczpL+NkVEEKjI0XeNjmZO+MHJMGAIzd70JnaerQt8J3
	49RbkHCZNtXI9WI9J7KEb4Aa9HvXrrfDX2mEbYUzYDXFp2B1TLG2TfgquT9Jsgiw+j6A
	sgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=VKUQeHfjTjj/lgJAXgfooSxUpivHXi5EOwdT/u27flU=;
	b=qssTWQ1LyBkrzy2kedd3bQS4jV44au7Tfji/5/KWLJUCbYCNJxfIu872rt6b6RfXVj
	UMx/hebzoKtUBaCSuL5v9kMyWKlHuTQ7k6W/AW+z2OOQlaQSqCX2xvzZN6MYN8gg3f6d
	5rt7h+8SOFLr0m5Ijq2s60m2O7VqVxHfbjQvWwozvsnMx5eecavwCM3YnkSnFn3fiHRR
	bsrpxcHJExRXkefWzKw/L3y3o+YOpaTdmgSKbw8dUppgkoprzGcHBru29anU+x5R9fDQ
	OGcH8+zj2E9P6jR2+Vewyi4Ndbr5PKWPXRGktCCLw/K6gf1HZb/V+XjTnsziv7bbrb8z
	dRqg==
X-Gm-Message-State: AIVw113rGixbnTE8J+79WQRBMHD8Cdamj+5mKs0ohgwYq1g1s3gRbL42
	EolmW9piovcCIewkdiJsgjWumcB52w==
X-Received: by 10.159.49.77 with SMTP id n13mr11920443uab.117.1499762752268;
	Tue, 11 Jul 2017 01:45:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.78.91 with HTTP; Tue, 11 Jul 2017 01:45:51 -0700 (PDT)
In-Reply-To: <CAJTo0LZaTP--5JmZN6=0Of5W3Cepx3HDT=+3WrjyuUBUvhmC8w@mail.gmail.com>
References: <1499352038-27144-1-git-send-email-liu.ming50@gmail.com>
	<CAJTo0LZaTP--5JmZN6=0Of5W3Cepx3HDT=+3WrjyuUBUvhmC8w@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 11 Jul 2017 10:45:51 +0200
Message-ID: <CALatG=7jXymLWW-KsqMv-RXGVxtOMC6gXjEv_ANDWryigXemag@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Tue, 11 Jul 2017 08:45:51 -0000
Content-Type: multipart/alternative; boundary="f403045e262c18b855055406bace"

--f403045e262c18b855055406bace
Content-Type: text/plain; charset="UTF-8"

Hi, Burton:

This patch is relying on another one I sent several days ago: "[OE-core]
[PATCH V2] meta: move image-mklibs image-prelink to IMAGE_CLASSES"

Maybe I should send them together in one mail.

the best,
thank you

2017-07-11 10:36 GMT+02:00 Burton, Ross <ross.burton@intel.com>:

>
> On 6 July 2017 at 15:40, <liu.ming50@gmail.com> wrote:
>
>> ${HOST_PREFIX}readelf is being called in mklibs_optimize_image_doit, so
>> do_rootfs should depend on
>> virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot.
>>
>
> I think this was responsible for my latest autobuilder run failing:
>
> ERROR: Nothing PROVIDES 'virtual/none-poky-none-binutils'. Close matches:
>   virtual/aarch64-poky-linux-binutils
> Missing or unbuildable dependency chain was: ['core-image-minimal',
> 'uninative-tarball', 'virtual/none-poky-none-binutils']
>
> Ross
>

--f403045e262c18b855055406bace
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Burton:<div><br></div><div>This patch is relying on an=
other one I sent several days ago: &quot;<span style=3D"color:rgb(51,51,51)=
;font-family:wf_segoe-ui_normal,&quot;Segoe UI&quot;,&quot;Segoe WP&quot;,T=
ahoma,Arial,sans-serif;font-size:21px">[OE-core] [PATCH V2] meta: move imag=
e-mklibs image-prelink to IMAGE_CLASSES</span>&quot;</div><div><br></div><d=
iv>Maybe I should send them together in one mail.</div><div><br></div><div>=
the best,</div><div>thank you</div></div><div class=3D"gmail_extra"><br><di=
v class=3D"gmail_quote">2017-07-11 10:36 GMT+02:00 Burton, Ross <span dir=
=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ros=
s.burton@intel.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div d=
ir=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gm=
ail_quote">On 6 July 2017 at 15:40,  <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:liu.ming50@gmail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(2=
04,204,204);padding-left:1ex"><div id=3D"m_-146361217003745936gmail-:2wv" c=
lass=3D"m_-146361217003745936gmail-a3s m_-146361217003745936gmail-aXjCH m_-=
146361217003745936gmail-m15d1858eafd27439">${HOST_PREFIX}readelf is being c=
alled in mklibs_optimize_image_doit, so<br>
do_rootfs should depend on<br>
virtual/${MLPREFIX}${TARGET_PR<wbr>EFIX}binutils:do_populate_sysr<wbr>oot.<=
br></div></blockquote></div><br></span>I think=C2=A0this was responsible fo=
r my latest autobuilder run failing:<br><br>ERROR: Nothing PROVIDES &#39;vi=
rtual/none-poky-none-<wbr>binutils&#39;. Close matches:<br>=C2=A0 virtual/a=
arch64-poky-linux-<wbr>binutils<br>Missing or unbuildable dependency chain =
was: [&#39;core-image-minimal&#39;, &#39;uninative-tarball&#39;, &#39;virtu=
al/none-poky-none-<wbr>binutils&#39;]</div><span class=3D"HOEnZb"><font col=
or=3D"#888888"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></font></span></div>
</blockquote></div><br></div>

--f403045e262c18b855055406bace--
