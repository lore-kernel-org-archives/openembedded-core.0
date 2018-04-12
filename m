Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f193.google.com (mail-ot0-f193.google.com
	[74.125.82.193])
	by mail.openembedded.org (Postfix) with ESMTP id 554F9746DD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 20:28:12 +0000 (UTC)
Received: by mail-ot0-f193.google.com with SMTP id p33-v6so7475694otp.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 13:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=O5O6k+z+8zykG7L7iG0rIHFEwC+hle6THnzDSiEEi6s=;
	b=dYnljAazlkJoFHZGzRFSAXOQ0EGLlFOUWx953Ragl0Kq+chXMo1WpHhDR+Xfm3jPrW
	GjFYbHE1ri2MHXHhwC+lfbe4edA5urDjfC6e0FC9R502wB5uxSavfbPsOloOZm8VHTHV
	YLqDuWQKAEvQdUZWxXcW28qvFKAtXfSAdrlRw2I63s7Z+X5Q1sH/i56K0nLwlOlsS2Iq
	KJz8v8Ehq50W6JZLpt5fw1YvVLCO2xgtE3C7lRbemr5fTJu3tm+CD9HBi2qCV76u7yiT
	thk3oJuJw7OLA2mVqdoS7vBvW1NCoxsZEI8nNVhGWYugvIwJYoBeWt/72mAheTKGtpXD
	K4Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=O5O6k+z+8zykG7L7iG0rIHFEwC+hle6THnzDSiEEi6s=;
	b=Asf/h6JIWTo5gDu4NuwjeMjRBBZRKvI9nQBD3XwAozsVpIIq+lsdwIqzV+kiiRWI2U
	iY2EuxakrYm9oOPe8xydcWxNo7QVzDTfLdZfmMF+h2p7SuYB88Wz01M8Q1bO/alf4u1c
	cSafzHWf6d1WZAmJDyO17+tE8mtbXxCwGJeFPytKtNAh7o+WDMritUQ3t84H/K7PjR5H
	5XCgpiG2V1Ew2Ym+bye/ZCqgy88V9LctGuZSr9UXudron8kNko85DaUG8YzJgmAGbbgB
	/RMgOi53SyaymYock+RKJiXjd4UmW42jc/5ThuJceupZL0dcJlYxEgCc7E8sA7tJYSI8
	+y5Q==
X-Gm-Message-State: ALQs6tA34EJRkN0FGf8QkMHNwn8Q7DYW5xoI3PxtD5QaaxgjmMoWIjmu
	2+3fXJXrv/W/HB5ts6dCcnASVLaXC2+Oi+k8JqQ=
X-Google-Smtp-Source: AIpwx48eqDcBG5WgywJUxF2yAyz95zG/cMA2DijNRqFzakkKXXHOcHRwJSyRkZ6vpdOrGZBURZ/9p6SiR4MojdISPdY=
X-Received: by 2002:a9d:34b6:: with SMTP id
	g51-v6mr1760859otc.180.1523564894014; 
	Thu, 12 Apr 2018 13:28:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Thu, 12 Apr 2018 13:28:13 -0700 (PDT)
In-Reply-To: <20180402215705.GA25121@linux-uys3>
References: <CALbNGRTAbsa9CzzXqtq7mpiknFzUB_=9eHcFHnD5W--HEM8bPw@mail.gmail.com>
	<20180402215705.GA25121@linux-uys3>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 12 Apr 2018 22:28:13 +0200
Message-ID: <CALbNGRThT8S5bfJH=zXMkQzCMMasQ=yUoEXTjsfPXtncig3yFA@mail.gmail.com>
To: Trevor Woerner <twoerner@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: kernel menuconfig broken?
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
X-List-Received-Date: Thu, 12 Apr 2018 20:28:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 2, 2018 at 11:57 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> On Sun 2018-04-01 @ 11:49:58 PM, Andreas M=C3=BCller wrote:
>> When running bitbake -cmenuconfig virtual/kernel I get a flood of
>> undefined reference errors. Am I alone here?
>
> Sadly, I think you might be.
>
>         $ bitbake virtual/kernel -c menuconfig
>
> works fine for me.
>
> I assume you're doing this for something RaspberryPi-ish?
>
>         Build Configuration:
>         BB_VERSION           =3D "1.37.0"
>         BUILD_SYS            =3D "x86_64-linux"
>         NATIVELSBSTRING      =3D "opensuse-42.3"
>         TARGET_SYS           =3D "arm-oe-linux-gnueabi"
>         MACHINE              =3D "raspberrypi3"
>         DISTRO               =3D "nodistro"
>         DISTRO_VERSION       =3D "nodistro.0"
>         TUNE_FEATURES        =3D "arm armv7ve vfp thumb neon vfpv4 callco=
nvention-hard cortexa7"
>         TARGET_FPU           =3D "hard"
>         meta-raspberrypi     =3D "master:63e53f919089027259a513dc2cd4b140=
789bf1a3"
>         meta                 =3D "master:4cedddb83623c79980b354642dfeaf78=
218ca4b7"
>         meta-oe
>         meta-gnome
>         meta-python
>         meta-networking
>         meta-multimedia      =3D "master:b9d1d8718834f7287e5a65373b952cbf=
e9ce83fe"
>         meta-qt5             =3D "master:e60e849de1158c879bd2c150fe79b207=
cdac031a"
>         meta-qt5-extra       =3D "master:a0cf057b2f335e8d2be9180f20770773=
334ec209"
>         meta-realtime        =3D "master:250bc6eaa47e550c1db5e2b0ebd42d86=
ee43650e"
>         meta-browser         =3D "master:d1c902440cba26a9d1271cfb914633c6=
8ee3791c"
OK I found that I am not alone [1] and followed the suggestion to
install ncurses-devel. Strange: it install ncurses-libs x86_64. Now I
have back menuconfig but it looks horrible: All framing chars are
displayed as '@'. If I remember correct there was such an issue long
lime ago.

However it is not beautiful but I can work with it.

[1] https://github.com/crops/poky-container/issues/17

Andreas

