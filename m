Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 677EB60557
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 16:03:22 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id d62so71047436iof.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 09:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TZHNR/O2xqGl3gVK9wCVYNX3IjDAtEJLsj5CWNz12YE=;
	b=1iq0CDjXpePjFtCLNFB2ZOUcpGC23GF2JMxStI7GKa/GXgICugk/wwNPRX+IQtaey0
	hqRUJMJhVVvdkXt44vDJF7e9Z46/pWOAZmS34HDBzlSt+zvyZjjIoZlPhRL4cKTvb3Aj
	e2lOwL+7wyFnOV1ZvZjn8C3r12z2ro2L7sn82Ykqx3TfKYryUj9p6e4v8BmcXQw6MIsx
	QIPjwl+N/FLBDWTXRkHF7wA54Ogsfk+mXTjUP2ZBMJ7aqI3uBIIAPMfAPFpv3e/LJN6n
	kCcHiSYksWgwkeqEAhK0LUVRrJDAcbNAMvaXKplpzVqskEp6iUWpTulw4UQIMQ59qR1V
	oUuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TZHNR/O2xqGl3gVK9wCVYNX3IjDAtEJLsj5CWNz12YE=;
	b=Zr7eReJa1vMuCh7W5A4UGQtndxYAaiSVsk3+Bm7GIsbgxZ76PKbyzqPcOoa5pRAYSc
	SxJd3eOIA1r7AIAXQkVGiQWKkVqnmEj/JblQnpCrW/KzwOxEjEDoUkynIgVkeMo2vlwM
	mEjymwKN3Iv6RBmpe2O3DnnaflD4WY5FrVGl4cz+CHiuJyXYkV9dpNQMr7I2rA8hI9n6
	pu4o5iwe10LDzXcWhNyEenJjRhrn4rlhtXudU7cw2DsEAdLU3w9hdV6xQM53NwNryr1+
	qMuomx8yS0XrQBnDRoOtzhNQipUgrtiBSwel/8ppSRuzSO1NJXVGRbVUswhmOXNRI0kK
	qJNQ==
X-Gm-Message-State: AOPr4FVjVjZ+KsAPyfVM2IXj7JAFfgpM9ZRxaTvwLq7OhbLluvXNaDxMZKkt7xIj0bIoVVUL7V/SH/s42e6VmIJe
X-Received: by 10.107.51.213 with SMTP id z204mr5440203ioz.148.1463587403651; 
	Wed, 18 May 2016 09:03:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 09:03:04 -0700 (PDT)
In-Reply-To: <1463502985-5428-5-git-send-email-otavio@ossystems.com.br>
References: <1463502985-5428-1-git-send-email-otavio@ossystems.com.br>
	<1463502985-5428-5-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 17:03:04 +0100
Message-ID: <CAJTo0LZv_VVm8dnS_nMcPSRJJS8z1t9C4daGnC5=OA3Y9UmqDw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: prabhu.sundararaj@nxp.com,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>,
	meta-freescale Mailing List <meta-freescale@yoctoproject.org>
Subject: Re: [oe-core PATCH v7 04/13] weston: Enable XWayland when X11 and Wayland support are available
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
X-List-Received-Date: Wed, 18 May 2016 16:03:23 -0000
Content-Type: multipart/alternative; boundary=001a11440cd04b0b2e05331fff2c

--001a11440cd04b0b2e05331fff2c
Content-Type: text/plain; charset=UTF-8

On 17 May 2016 at 17:36, Otavio Salvador <otavio@ossystems.com.br> wrote:

> When the DISTRO has X11 and Wayland support enabled, XWayland ought to
> be enabled by default.
>

Can this also split xwayland into a separate package so its still possible
to build a core-image-weston with the x11 DISTRO_FEATURE but without
pulling in all the X libraries?

Ross

--001a11440cd04b0b2e05331fff2c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 May 2016 at 17:36, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.br</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":4h0" clas=
s=3D"a3s aXjCH">When the DISTRO has X11 and Wayland support enabled, XWayla=
nd ought to<br>
be enabled by default.<br></div></blockquote></div><br>Can this also split =
xwayland into a separate package so its still possible to build a core-imag=
e-weston with the x11 DISTRO_FEATURE but without pulling in all the X libra=
ries?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">=
Ross</div></div>

--001a11440cd04b0b2e05331fff2c--
