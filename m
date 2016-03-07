Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2ECB871951
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 12:11:19 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id ir4so46078616igb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Mar 2016 04:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K9FyaQibANeVvgEDgC1qsSKfYBMOYczdlZH0AbApiFw=;
	b=rlWIwcZkpHoZQGfjEBhkPSxRCGcRi11QSV+3o1ncEwVwO9xV+PxOTmjMEHw+6k4ubk
	I3vNiCaABTY1ym+ekbJ0siSMBeMB9UEdi3U/Eoz+mZOaljwDFFrk+QTHv8OCVVvkd6aP
	IuUhMDCJ2SadGWAifQ2JMOpABfH7gYc9BPpz08uT+44ESej1D5j0mt+N/ExMtCxUcI1W
	C9oYrfnlVtQNHUuWh6R4X6PHVk6ElPV7AOYPIEnA32PgeB30bmRiBEzOgl+7LC/Z3tzE
	QjI7hT+JcS22SzQreb3+JOTpBnqNzZunrKCF0dnKwESFflQ+BjXc3JOgXuSX9qnkr2sH
	ztmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K9FyaQibANeVvgEDgC1qsSKfYBMOYczdlZH0AbApiFw=;
	b=jMOUjdo64pQF4WUDPMdsQNW3RRUB+DXHNjMg+4loK2b+k11QF4owO95KLXuI0vWZbj
	jepGjxjdKNSlEoDTBAc0HPCKRK8u1RXPrjHgokBEutnnXtLwmI4oUAoxL7W8xJKqAnDj
	I55YsU9Vtlp41XXWrH81CXTnEPJ+BoF7KOQGa9RF30NTS42EQonzDN8fCQNhRI3YAqf5
	m4Vcizp7vxWRd3KLUAKrcVyN7mKsLwK3Lt2sEClQATc583K1Y+jAK1qqa67VFfYscHyJ
	8w/yGvIXPdHE5b1vCFSe+EDBJj+3bjZZn/xly4xm+l691Q9GoZ8iuOoyMxKdK2OGTdIU
	Y6Bw==
X-Gm-Message-State: AD7BkJIxVoa2+7Rx2WLjnkvDasnOSu30IapabL1x71nmzvqT38NhRzPwpldW0erQhVVV3nJqa8nF1N2xTChWAT9f
X-Received: by 10.50.43.226 with SMTP id z2mr11947668igl.78.1457352680663;
	Mon, 07 Mar 2016 04:11:20 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Mon, 7 Mar 2016 04:11:01 -0800 (PST)
In-Reply-To: <008501d17869$0d5be340$2813a9c0$@neuf.fr>
References: <004901d1785c$fb27d0f0$f17772d0$@neuf.fr>
	<005801d1785e$07915900$16b40b00$@neuf.fr>
	<20160307114709.GD6004@ad.chargestorm.se>
	<008501d17869$0d5be340$2813a9c0$@neuf.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Mar 2016 12:11:01 +0000
Message-ID: <CAJTo0LZOX2gzWBRF6Wf-EAGZ4uUR-bCA-NVG+oS+zr2sFPStCA@mail.gmail.com>
To: Herve Jourdain <herve.jourdain@neuf.fr>
Cc: Anders Darander <anders@chargestorm.se>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [systemd][PATCH] some dependencies in systemd seem not to be taken into account in systemd_229.bb
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
X-List-Received-Date: Mon, 07 Mar 2016 12:11:21 -0000
Content-Type: multipart/alternative; boundary=047d7bfea0f4d80780052d745c0a

--047d7bfea0f4d80780052d745c0a
Content-Type: text/plain; charset=UTF-8

On 7 March 2016 at 12:01, Herve Jourdain <herve.jourdain@neuf.fr> wrote:

> For the gcrypt/resolved patch, I will rework it.
> One thing, though, the idea was to add the --disable-gcrypt in the
> EXTRA_OECONF, if neither gcrypt nor resolved are enabled.
> Hence the removal of "--disable-gcrypt" in the PACKAGECONFIG[gcrypt]
> line...
> That seemed easier at the time, but I'll try to find a different way to
> achieve this.
>

Personally I prefer less magic in recipes, and if there are dependencies
between PACKAGECONFIG flags then ensure that the default options actually
build and that any dependencies are clearly commented.

Ross

--047d7bfea0f4d80780052d745c0a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 March 2016 at 12:01, Herve Jourdain <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:herve.jourdain@neuf.fr" target=3D"_blank">herve.jourdain@neuf.fr</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":38" class=
=3D"a3s" style=3D"overflow:hidden">For the gcrypt/resolved patch, I will re=
work it.<br>
One thing, though, the idea was to add the --disable-gcrypt in the<br>
EXTRA_OECONF, if neither gcrypt nor resolved are enabled.<br>
Hence the removal of &quot;--disable-gcrypt&quot; in the PACKAGECONFIG[gcry=
pt] line...<br>
That seemed easier at the time, but I&#39;ll try to find a different way to=
<br>
achieve this.</div></blockquote></div><br>Personally I prefer less magic in=
 recipes, and if there are dependencies between PACKAGECONFIG flags then en=
sure that the default options actually build and that any dependencies are =
clearly commented.</div><div class=3D"gmail_extra"><br></div><div class=3D"=
gmail_extra">Ross</div></div>

--047d7bfea0f4d80780052d745c0a--
