Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2466E6011C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 14:03:24 +0000 (UTC)
Received: by iouu10 with SMTP id u10so21087090iou.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 06:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=asaFjGsCkDxe9K5rdeUas8oVQGJgZeZrmuidRfePriQ=;
	b=RVK4IuilVyV28AdN1xXixlVpPWlPngEo+HauCvzB/yFoCixQTjNOngXrEdvX4LEcUL
	hrqO3JBWEeXCwZJdXpsiqaB1Of+rkyagD0zBb6j83v5y+LL1bSJL0cJDTNi8zDhS8b3T
	qgsldiXDQZ9/1NZvxuH4Fq93tmDG7MI2Bx0rt6lbF96Faj++P/vx5S2ZP0MDu+dqfmBo
	xs0s0oMsUTpYegNhP2IxnC89zOcb0KfBNDP3vxZ7+U8Jse8Q6l/E1pslW6fG6JTmHzcD
	te7FqtL8ANqNZ0kk38sKq30ivdDb6Z3KHk3xOaAoJ/GH3sJHOXgSHBxZ3tvgCwuCHji+
	xYzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=asaFjGsCkDxe9K5rdeUas8oVQGJgZeZrmuidRfePriQ=;
	b=Rks1ZPAPnxS+0tKOm+R+L7H/gN1RQ/8p3Xn/gVeDuwJg7PI9JS1fC5XrrL/M2ONhR2
	7fhbmJdRnXB7UCciVEVp0SaLMmqZmW7GxEd6+2eb3jNAxYeRqRoeHPlPUhc8t5EVGc4h
	+pvCx8Y83fy4z6ADEQzvgweJ+HYPHMO39wdx3M93Snvs3Mls2K3oRVWp0PRAvBRClT89
	VV9koqabUVxcAUX2ZsKEsVvP0g9IDQKv4W8Ae870/NBplt6sxcGcOKRXbkmshC2KIZT6
	nkSiS+zwTRodvPDdXzYVdRMPEHSmwmRUpZyt2Wdu/OzA2aEfEQicuDAR9ccf0+8gAy/Y
	QRzg==
X-Gm-Message-State: ALoCoQm1xIFi8NUvMbUYM7Lst4RAkBD2gPeS/cxWdlPwvIy9L/a5V/gh5QOBJWweAPTwFDZ0wZkl
X-Received: by 10.107.135.30 with SMTP id j30mr27654444iod.148.1448373804237; 
	Tue, 24 Nov 2015 06:03:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 24 Nov 2015 06:03:04 -0800 (PST)
In-Reply-To: <73c4db7e6c63768735002961feb9c95815d352ea.1448030272.git.andrew.shadura@collabora.co.uk>
References: <ef26757c2c56efbd37d8577432a8e451399ad245.1448030272.git.andrew.shadura@collabora.co.uk>
	<73c4db7e6c63768735002961feb9c95815d352ea.1448030272.git.andrew.shadura@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Nov 2015 14:03:04 +0000
Message-ID: <CAJTo0LYHDtBX6SaQvaOe61Fwwbcw=o4wubQ3s5wDa9ds7dD6bw@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] dbus: add user sessions support
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
X-List-Received-Date: Tue, 24 Nov 2015 14:03:25 -0000
Content-Type: multipart/alternative; boundary=001a113ec64a1aa9c4052549ceb4

--001a113ec64a1aa9c4052549ceb4
Content-Type: text/plain; charset=UTF-8

On 20 November 2015 at 14:38, Andrew Shadura <andrew.shadura@collabora.co.uk
> wrote:

> Enable the user-sessions support with a PACKAGECONFIG flag.
>

What is the impact on this if someone is using systemd but doesn't want
user sessions?  Should we enable it if the DISTRO_FEATURES contains systemd
by default?

Ross

--001a113ec64a1aa9c4052549ceb4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 November 2015 at 14:38, Andrew Shadura <span dir=3D"ltr">&lt;<a href=
=3D"mailto:andrew.shadura@collabora.co.uk" target=3D"_blank">andrew.shadura=
@collabora.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv id=3D":iy" class=3D"a3s" style=3D"overflow:hidden">Enable the user-sessi=
ons support with a PACKAGECONFIG flag.<br></div></blockquote></div><br>What=
 is the impact on this if someone is using systemd but doesn&#39;t want use=
r sessions?=C2=A0 Should we enable it if the DISTRO_FEATURES contains syste=
md by default?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">Ross</div></div>

--001a113ec64a1aa9c4052549ceb4--
