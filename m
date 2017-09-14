Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4A31D78594
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 22:44:04 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id g32so4294271ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 15:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0nLv2SN9P6+fQjlihbkNcZrAqFgP1Sn/abdgLkyKaCw=;
	b=SOgRhhwr3iUztZXw9VTCO2EVaAvpJ91HxSkKkZKm+MuzqWDEUltR0NDI9482x7T/AP
	2sPHN+9heYBkPRbyfGpZkVCgWbItgkVb8Yo3C4BCoVJq6TBAptvC/fUn6Aed+zfZnCA2
	oDD4XxUpKmtbkXZyz9anG623IgvviLtEL9GYzrRRCu37tVtGvyu7+ey4MstiyAFDSa+F
	kSSiaqg6jDZ/ifkKZJl95VBiLG6uJWqoASYqJSRc0m+2CadS5cZc8HUTbDa3HDBbLRKn
	ao0kUHbs+mtxjAO/gfJZWhlUB1lZza+HxAk0cE+JaZija/z27aC8Pm5rBAZcMm+yghwn
	tJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0nLv2SN9P6+fQjlihbkNcZrAqFgP1Sn/abdgLkyKaCw=;
	b=j2hrZDopuK+fvl4lxy2i9SJlsBeAISagt/SwtAAYFnNLLLGDYurnddKVNo7YOPeaxc
	CVugl85LutxECM38/XRrDFudYL0KEYJRc5d9aCqYOlyEnQAI8ZKAG8/ajhNgH6dCKHwn
	c8X8aRkyCksltQw2GncDcEftvJg/1htPpIKB79zfuIvVErGyXlXWqKF9gXSzw6krETkX
	eX0Rh9EXgd+8CGs/wb3yG3twh+rHGGXDV1H8S+J119vJf3ey4LHAhkJyS90WPJD+5tsG
	dowTmEx9QRqz4BL+wM13FMFw+UPqVrH3LI8uE+aNhWMlK63Qay+clTdLpbxzoHalhvkP
	95mQ==
X-Gm-Message-State: AHPjjUiNB4XxCYbCr9Vr0YzD4mECKPvweSh+qIsa8D6DuIFeeslkIVFn
	zIWYMT9XeL++kpBwRioOOshv5gEyAaE3zigMa80MFQ==
X-Google-Smtp-Source: AOwi7QCncdtJFQL8JjsL1vGLNYo4+9+L7ijQiYfgwO4gJMKON5BtW9HGc8T1JuHKteeYpwkuCRxHbtXEX85j1HIop7c=
X-Received: by 10.107.135.72 with SMTP id j69mr5479422iod.210.1505429046420;
	Thu, 14 Sep 2017 15:44:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.19.68 with HTTP; Thu, 14 Sep 2017 15:43:45 -0700 (PDT)
In-Reply-To: <CA+chaQcYogKgtn-fgxXJg7rCEmi_vE3A+MipLX5znx-uR5VPzg@mail.gmail.com>
References: <CA+chaQcYogKgtn-fgxXJg7rCEmi_vE3A+MipLX5znx-uR5VPzg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Sep 2017 23:43:45 +0100
Message-ID: <CAJTo0La2D0M5cHikDULcKPSauOVJSr76XWwNDPDkS6KNs7CZ2Q@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: QEmu + Spice + Virglrenderer Was: [PATCH] qemu: upgrade to version 2.10.0
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
X-List-Received-Date: Thu, 14 Sep 2017 22:44:06 -0000
Content-Type: multipart/alternative; boundary="001a113f8e708bfcd005592e0366"

--001a113f8e708bfcd005592e0366
Content-Type: text/plain; charset="UTF-8"

On 14 September 2017 at 22:11, Martin Jansa <martin.jansa@gmail.com> wrote:

> As of today qemu, qemu-native and nativesdk-qemu can be built with
> virglrenderer, sdl2 and spice support.
>
> I've tested core-image-sato running in qemu-native from headless Gentoo
> chroot, with spicy client on normal Gentoo host as shown in screenshot.
>
> Now I need to find out how to connect virt-viewer to spice running in
> chroot over unix socket instead of tcp socket (mandatory for passing
> dma-buf file descriptor).
>
> Next step is to benchmark graphics with and without virglrenderer and with
> and without spice.
>

That is awesome, good work.  Very interested to see how well graphics work.

Ross

--001a113f8e708bfcd005592e0366
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 14 September 2017 at 22:11, Martin Jansa <span dir=3D"l=
tr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.=
jansa@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">As of t=
oday qemu, qemu-native and nativesdk-qemu can be built with virglrenderer, =
sdl2 and spice support.<br><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">I&#39;ve tested core-image-sato running in qemu-native fro=
m headless Gentoo chroot, with spicy client on normal Gentoo host as shown =
in screenshot.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Now I need to find out how to connect virt-viewer to spice running=
 in chroot over unix socket instead of tcp socket (mandatory for passing dm=
a-buf file descriptor).</div><div class=3D"gmail_extra"><br></div><div clas=
s=3D"gmail_extra">Next step is to benchmark graphics with and without virgl=
renderer and with and without spice.</div></div>
</blockquote></div><br></div><div class=3D"gmail_extra">That is awesome, go=
od work.=C2=A0 Very interested to see how well graphics work.</div><div cla=
ss=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f8e708bfcd005592e0366--
