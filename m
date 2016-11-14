Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6B060103
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 13:34:22 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id x190so95152928qkb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 05:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HmfCUFLlV08RmMvAKcz7WvBIupBD/YRxSFWkA8TDpkE=;
	b=mnc/iZB4InKFewHw9E+T6wwAr78irUQBDPT7MbI5XohGJnig9j1HKbFSGDCDtYPRD+
	GEfHeO0362Q2tPneaLpO4Cxgf1fvxnvwoi77ozP6jY0eTkTlwq/jhIeI2RjWDsl1EjoJ
	Ug3DLSyBpxwDWIetnJ302W+I2VEfqeP+eXL/18hWBi/REhwiLM0CHEf07+VgTnyr6qNI
	gMX1TeQAsaAGsYkfFGXE37SiMM/MUuFVj2KF2eFa+i0X4ap6juEgczESMxitPqUMYPgk
	tIqqkuJhBGx9jsPvdj626hHqCrOx5amM2+6R+KW4+qaLRs8mOhrPcC9y9CtMAckAUXCz
	ufFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HmfCUFLlV08RmMvAKcz7WvBIupBD/YRxSFWkA8TDpkE=;
	b=b6lcJpW3VDBCovrjvU3AZ3T/8LRr3tvAIB2hzZMUims+VT6i5Veoq8Iu4uwya7sXAw
	E1GMvKt4+sXiq9X0E4nd16UXWEd5liBLuBD1oSmFJu9N2QIRTqYr72TTBbMp9+SsvNMi
	aR4LZDH7cxCDEsKgD5DV7GCpSNqdJ4d09UrgJADpml8reKQ3vDh5l1XjdxLeNPGT/Gwr
	r4BCsexKzU5QPnmgREIRqGj1G9oiaMPAMJiX70tAcmmsU9h5IK4CMlUbNZHx8a7OuaGD
	1SFfSGwiCnbSo/uxLNSsu1hkLyLh3KyrTv1gDqdHtKO5U6EGaRqahKxCvIxY4W8ickYl
	Nrsg==
X-Gm-Message-State: ABUngvffmKTajJE5Jj4KHmV3KyKrIt+Vesbv66OlYtEdhS6CW7TK9PertIGQZuZIgb92SlQVVhsiwrMc4D74mcfg
X-Received: by 10.55.39.88 with SMTP id n85mr15877359qkn.244.1479130463194;
	Mon, 14 Nov 2016 05:34:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Mon, 14 Nov 2016 05:34:02 -0800 (PST)
In-Reply-To: <CAD4b0_LBO_WbaGdaYne7U8KT0QiBb=P5_Th0MjzR24F6px-vXA@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
	<CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
	<CAJTo0LaLwE+VOJwa3vad2XOc0FmwPpcGOxUvev=7RbnatnOKRg@mail.gmail.com>
	<CAD4b0_LBO_WbaGdaYne7U8KT0QiBb=P5_Th0MjzR24F6px-vXA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 14 Nov 2016 13:34:02 +0000
Message-ID: <CAJTo0LZ+JpE8G-qvLOQburPb+vFCJ-GB6HnGpKZD80tnLpv86A@mail.gmail.com>
To: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 13:34:23 -0000
Content-Type: multipart/alternative; boundary=94eb2c094b16d5eba0054142e567

--94eb2c094b16d5eba0054142e567
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 14 November 2016 at 10:35, Maciej Borz=C4=99cki <maciej.borzecki@rndity.=
com>
wrote:

> Do you think it makes sense to replace TARGET_ARCH check with something
> like this instead:
>
>         arch =3D get_bb_var('HOST_ARCH', 'core-image-minimal')
>
>         is_x86 =3D arch in ['i586', 'i686', 'x86-64']
>         if is_x86:
>             self.write_config('IMAGE_FSTYPES +=3D " hddimg"\n'
>                               'MACHINE_FEATURES_append =3D " efi"\n')
>
> Basically, I do not want to build syslinux or set config options that
> are usable on x86 target when building for other targets.
>

That expression is more likely to work, yeah, though woudn't TARGET_ be
more suitable than HOST_?

Ross

--94eb2c094b16d5eba0054142e567
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 November 2016 at 10:35, Maciej Borz=C4=99cki <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:maciej.borzecki@rndity.com" target=3D"_blank">maciej.borzec=
ki@rndity.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div =
id=3D":1th" class=3D"a3s aXjCH m15862683c3928210">Do you think it makes sen=
se to replace TARGET_ARCH check with something<br>
like this instead:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 arch =3D get_bb_var(&#39;HOST_ARCH&#39;, &#39;c=
ore-image-minimal&#39;)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 is_x86 =3D arch in [&#39;i586&#39;, &#39;i686&#=
39;, &#39;x86-64&#39;]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if is_x86:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(&#39;IMAGE_<wbr=
>FSTYPES +=3D &quot; hddimg&quot;\n&#39;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &#39;MACHINE_FEATURES_append =3D &quot; efi=
&quot;\n&#39;)<br>
<br>
Basically, I do not want to build syslinux or set config options that<br>
are usable on x86 target when building for other targets.</div></blockquote=
></div><br>That expression is more likely to work, yeah, though woudn&#39;t=
 TARGET_ be more suitable than HOST_?</div><div class=3D"gmail_extra"><br><=
/div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c094b16d5eba0054142e567--
