Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 08438606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 00:16:16 +0000 (UTC)
Received: by mail-qk0-f171.google.com with SMTP id n21so127285556qka.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2016 16:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tii3jfB8Caq5JPTYVtnTwJ3xS/Od+/NWeAwzkecTjHg=;
	b=UVsxBpJ+36QWR7cD8+ii7BQjDmQoo+WJO+Tw56tRuEiVf9npL8OYuz7vSX4X1wNtcM
	+oYrsR3PZpDAx8va3jnLermviuZEtdXmGAFhScdW2abkSx6bEeX/g9su/tZrIoN3CIdn
	RU5fC1DgUGXSrtrL5IzWE/3V0ZUpBtPxGPkCgUIvcsrxPh3wriNbQG44mZb5Ne22uJln
	rHVfvzoJz/tGxlLTJy+DGn+wH0OKvRtxzlNUx/jgeSTcPpQna0ziZC1uToQs1XEVFw7I
	cELFXRvtHP7a3nUYlk38XWeEx8AmmsI5lucLgee/KmLASyFPzHtikOHPMT9kb1v0yyKt
	Hchg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tii3jfB8Caq5JPTYVtnTwJ3xS/Od+/NWeAwzkecTjHg=;
	b=BTu3dzCxxvhH7VvgKhgf6tKVHz67RzyeRgfd8CpGr+AmuwRJk4RD4zGKF1lKWug5BE
	aTOrXjrD03+DEL0plI/27Q5El+74WMyJQl8dAB84+gaWq4K4jMz7q5h3RaYhUQfzHCcx
	jVhgwMx6pif0esPP7zVS50owlAH8tGCa51eJKmvnc9aA2s/v5i5dUPg7XPk1kzB/qVl3
	WHzT8O4WeNccROAkwPIxzQQIpjs4UeHCDGQR6hjDRWEPpX/T7CAVIrc5oiWRFCya2WMM
	WNblpBU/+2YAvDEp/DAnp99rVxHFgaZ0pa1aEz4D931J7XlS4z1a//AllU2swvuaaedm
	hmdA==
X-Gm-Message-State: ABUngvdyL0p7kt3XM1TY4iVYKX7/24xSVGjiXe1DfLZZUW6LMAW9giPwzdLhFk2P1KaFhNcGV//7cFps4BKgOH3w
X-Received: by 10.55.215.6 with SMTP id m6mr14993623qki.244.1478650577732;
	Tue, 08 Nov 2016 16:16:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 8 Nov 2016 16:15:57 -0800 (PST)
In-Reply-To: <20161107182006.4207-1-marex@denx.de>
References: <20161107182006.4207-1-marex@denx.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 00:15:57 +0000
Message-ID: <CAJTo0LaSLN1eVRH1ju1w5Ba3PLh6d+E0ZwmRimxcN1DjKRk6iQ@mail.gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: mkimage: Fix build of u-boot-mkimage
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
X-List-Received-Date: Wed, 09 Nov 2016 00:16:17 -0000
Content-Type: multipart/alternative; boundary=001a1149dcbc6edb6c0540d32ab7

--001a1149dcbc6edb6c0540d32ab7
Content-Type: text/plain; charset=UTF-8

On 7 November 2016 at 18:20, Marek Vasut <marex@denx.de> wrote:

> -EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS}
> ${LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE = 'HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}"'
> +EXTRA_OEMAKE_append_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}"
> CC="${CC} ${CFLAGS} ${LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_append_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_append_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS}
> ${BUILD_LDFLAGS}" STRIP=true V=1'
>

You're going to start hating u-boot...

Fails on the autobuilder if you're building for a 32-bit x86 target on a
64-bit x86 host:

ERROR: QA Issue: Architecture did not match (x86-64, expected x86) on
/work/i586-poky-linux-musl/u-boot-mkimage/1_2016.09.01-r0/packages-split/u-boot-mkimage/usr/bin/uboot-mkimage
[arch]

I'm guessing that it is using the host compiler instead of the cross
compiler.

Ross

--001a1149dcbc6edb6c0540d32ab7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 7 November 2016 at 18:20, Marek Vasut <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:marex@denx.de" target=3D"_blank">marex@denx.de</a>&gt;</span> wrote:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex"><div id=3D"gmail-:22m" class=3D"gmail-a3s gmail-aXjCH g=
mail-m158400582b1a1c80">-EXTRA_OEMAKE =3D &#39;CROSS_COMPILE=3D&quot;${TARG=
ET_<wbr>PREFIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; STRIP=3Dt=
rue V=3D1&#39;<br>
+EXTRA_OEMAKE =3D &#39;HOSTCC=3D&quot;${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_L=
DFLAGS}&quot;&#39;<br>
+EXTRA_OEMAKE_append_class-<wbr>target =3D &#39;CROSS_COMPILE=3D&quot;${TAR=
GET_<wbr>PREFIX}&quot; CC=3D&quot;${CC} ${CFLAGS} ${LDFLAGS}&quot; STRIP=3D=
true V=3D1&#39;<br>
+EXTRA_OEMAKE_append_class-<wbr>native =3D &#39;CC=3D&quot;${BUILD_CC} ${BU=
ILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;<br>
+EXTRA_OEMAKE_append_class-<wbr>nativesdk =3D &#39;CC=3D&quot;${BUILD_CC} $=
{BUILD_CFLAGS} ${BUILD_LDFLAGS}&quot; STRIP=3Dtrue V=3D1&#39;</div></blockq=
uote></div><br>You&#39;re going to start hating u-boot...</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Fails on the autobuil=
der if you&#39;re building for a 32-bit x86 target on a 64-bit x86 host:</d=
iv><br>ERROR: QA Issue: Architecture did not match (x86-64, expected x86) o=
n /work/i586-poky-linux-musl/u-boot-mkimage/1_2016.09.01-r0/packages-split/=
u-boot-mkimage/usr/bin/uboot-mkimage [arch]<div><br></div><div>I&#39;m gues=
sing that it is using the host compiler instead of the cross compiler.</div=
><div><br></div><div>Ross</div></div>

--001a1149dcbc6edb6c0540d32ab7--
