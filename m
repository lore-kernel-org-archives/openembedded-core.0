Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id EAD7C60125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 12:22:09 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id r6so23785382itr.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 04:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RXFlR1brucB45ZYZCKp0OjrrMh9FXQrTdKdR7ARrdc0=;
	b=DsjkN98NvSLdELZqGvXYSR6tXoM6E+klSCQOO26LDdqzAoSDEPt8gBQ4ZTgTYD4+OE
	ZzCwbvTC2uRH3XpleNGice5c28siKH8HuxxekeKEFuQDnnMm+oVjhmMsSYCmuFB1b163
	KI32bh1pUSAkn3iwjPGq1dDHjYHtN5RV/y6BGtFQpZkGBaTPiVqQNQxDuO9gXeyYsdmt
	FNVUqXHmBhYz0sGOXtxkPxnXYtdwj1J7phba4dCNVLsRRvK/0sk4+keizEXbwAjcfAQX
	DntZRXDfLqywZCHfwOfSBgBuemjdQggbyI2vmQt+UHeHv7VWd0lAIFWwtq7j//sAHOCe
	HQoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RXFlR1brucB45ZYZCKp0OjrrMh9FXQrTdKdR7ARrdc0=;
	b=qjf7ZmLDxvAed9s3k19UjbZSGG56shZ8II58uuwFUsV+ogG/j4aTNZlRYndqDNGyC8
	3fNYN2d+jaE4F9t0Uq6Fv/liMCxbtyrqDVeE1antbK0oYX8FDiba6LZrywuv/Y2XU+cK
	CjHHvnBugk78nqz/6/xtDBvMT8phnAViWDW1g/kpIOdMAs1VlEGtQ1L5BZYNrnBUOQMK
	T1scNipa1EuzbeBgglcSdOA18DLdn9fT2t7mJu2ZAeq5896tNP6YKH1Vvqi6dh3cjbIl
	UeqsOyqm3suiC6w49Kfz3+moXQObW8IeqPVuGKkMvvPrneotOC5v+CbA8l4gNjyzQYA0
	95MA==
X-Gm-Message-State: AKGB3mKzO1j6R/9Vb5+xGYuSWckluwYp+b6De8V46xBY9f2mWhr3ZXiE
	J3NAGSBUmla27Vjt+XJkLk5MaTM4TjTLA/nBxbXV3A==
X-Google-Smtp-Source: ACJfBousH3WdZ3BnZP5HIRHqmRZm3oOcd02RCnlMA5L8ryZAE6FDsEv75JhHePXWREYEUbt+LBXUBZQj07mMVV6/H2c=
X-Received: by 10.107.32.18 with SMTP id g18mr4955714iog.227.1513081331180;
	Tue, 12 Dec 2017 04:22:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.137.195 with HTTP; Tue, 12 Dec 2017 04:21:50 -0800 (PST)
In-Reply-To: <20171206220037.32335-1-limon.anibal@gmail.com>
References: <20171206220037.32335-1-limon.anibal@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Dec 2017 12:21:50 +0000
Message-ID: <CAJTo0LZur9EO7Fsnn_Fw_8qwNeLJZnJ5iapggESW_d29P1yQhQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <limon.anibal@gmail.com>
Cc: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2] recipes-multimedia/gstreamer: Add gst-validate recipe
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
X-List-Received-Date: Tue, 12 Dec 2017 12:22:10 -0000
Content-Type: multipart/alternative; boundary="001a1141b498431d90056023b3c2"

--001a1141b498431d90056023b3c2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On 6 December 2017 at 22:00, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmail.com=
> wrote:

> +# to use non display mode in gst-validate-launcher
> +RDEPENDS_${PN} =3D "xserver-xorg-xvfb"
>

Don't enforce behaviour.  This forces the xvfb server into images which
have a proper server, and gst-validate refuses to build if the X11 distro
feature is disabled.

Ross

--001a1141b498431d90056023b3c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 6 December 2017 at 22:00, An=C3=ADbal Lim=C3=B3n <span =
dir=3D"ltr">&lt;<a href=3D"mailto:limon.anibal@gmail.com" target=3D"_blank"=
>limon.anibal@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">+# to use non di=
splay mode in gst-validate-launcher<br>
+RDEPENDS_${PN} =3D &quot;xserver-xorg-xvfb&quot;<br></blockquote><div><br>=
</div><div>Don&#39;t enforce behaviour.=C2=A0 This forces the xvfb server i=
nto images which have a proper server, and gst-validate refuses to build if=
 the X11 distro feature is disabled.</div><div><br></div><div>Ross</div></d=
iv></div></div>

--001a1141b498431d90056023b3c2--
