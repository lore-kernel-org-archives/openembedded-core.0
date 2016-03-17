Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5FDDD6011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:31:44 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id vf5so2284017igb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tbbeJhax0EMa71e+aoT1PXin8a4qLoulWE9ajYyS2mM=;
	b=qGMZFaNFZFJrnJ0FIkXzyf6Ca9tUupTitCVQ99GJhVO2vZPBzjZxHEGrsj0Rdyotp7
	GblTX0WQVUtnKodWxWHGlsT32S/2755nzfZF+DWiEGi9kIE8PCT4VqoxZgFxCcjShGVr
	OzrubwbbrFOZ4WRbgDWmFcLCNQqoVc4okpA59+hACecnBG92Xx9YYeaVCd0PWX3fyY3I
	x4Asg20C1JKp+8ycRGHTYc+pNRlOAfeZSrDWgMaXzl//ck1xGYcqn/zBD6jbgmpNVrYy
	HiUR1S8E3FvtloOZ+12jU3U70X90thtXNvsOYRx2A8Tq73FLZvLbQ7kGf3+v0AdtRtLy
	h4TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tbbeJhax0EMa71e+aoT1PXin8a4qLoulWE9ajYyS2mM=;
	b=JnrEPBDPUDw8DzFDd/rLQoojHfAot5XITW6+BmZ0iKP5F9t0oNcA/gd6NpopErum1E
	bemyx0CG9x7IeODAUKDHJT8K6My6Hop3y8MQlQ9T/r3IM2/eCV6G16ITFJQrXvZlZB8o
	6gA1H3nzBxesMz1DFzs/FWMzzZz3UXgRTliJsNxnoe5f+pR4iEIFj9tRkkQd7V6tTJFN
	PwKO83JLt6DqBg+dSuQKqJ9h5r5ujCtOt6/R46qBcXDwarihD3sbLfwbwGY5ToW21GO5
	VJ2xd7JzM+1uv6gQD6MNmuTEtfRlDbAVyQ2/k/NxUESf1onrlPnn3KWYQfaimTKlH3dc
	+BgQ==
X-Gm-Message-State: AD7BkJLnmxdnUqwkFzb24NDw7MoBe0G8chINM7VdCdjaM0gXzlCiGHmS594ZbEjFnlyopSyecOsC0QiL7yIfG2kI
X-Received: by 10.50.150.41 with SMTP id uf9mr7888053igb.64.1458235904638;
	Thu, 17 Mar 2016 10:31:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Thu, 17 Mar 2016 10:31:25 -0700 (PDT)
In-Reply-To: <1458235169-9267-2-git-send-email-armccurdy@gmail.com>
References: <1458235169-9267-1-git-send-email-armccurdy@gmail.com>
	<1458235169-9267-2-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 17 Mar 2016 17:31:25 +0000
Message-ID: <CAJTo0LZ_9NTAMLo9eYGKYa+W4L_QQWQXrROog2Bwn89pbxmRng@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] bitbake.conf: remove 'gobject-introspection-data' from DISTRO/MACHINE_FEATURES_BACKFILL
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
X-List-Received-Date: Thu, 17 Mar 2016 17:31:45 -0000
Content-Type: multipart/alternative; boundary=001a11345c0c185e79052e420173

--001a11345c0c185e79052e420173
Content-Type: text/plain; charset=UTF-8

On 17 March 2016 at 17:19, Andre McCurdy <armccurdy@gmail.com> wrote:

> -DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5
> gobject-introspection-data"
> -MACHINE_FEATURES_BACKFILL = "rtc gobject-introspection-data"
> +DISTRO_FEATURES_BACKFILL = "pulseaudio sysvinit bluez5"
> +MACHINE_FEATURES_BACKFILL = "rtc"
>

So every BSP (apart from the qemu ones) would need to add the feature to
MACHINE_FEATURES?

Maybe we should remove from DISTRO backfill but keep backfilling for
MACHINE features?

Ross

--001a11345c0c185e79052e420173
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2016 at 17:19, Andre McCurdy <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3ai" class=3D"a3s=
" style=3D"overflow:hidden">-DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio =
sysvinit bluez5 gobject-introspection-data&quot;<br>
-MACHINE_FEATURES_BACKFILL =3D &quot;rtc gobject-introspection-data&quot;<b=
r>
+DISTRO_FEATURES_BACKFILL =3D &quot;pulseaudio sysvinit bluez5&quot;<br>
+MACHINE_FEATURES_BACKFILL =3D &quot;rtc&quot;</div></blockquote></div><br>=
So every BSP (apart from the qemu ones) would need to add the feature to MA=
CHINE_FEATURES?</div><div class=3D"gmail_extra"><br></div><div class=3D"gma=
il_extra">Maybe we should remove from DISTRO backfill but keep backfilling =
for MACHINE features?</div><div class=3D"gmail_extra"><br></div><div class=
=3D"gmail_extra">Ross</div></div>

--001a11345c0c185e79052e420173--
