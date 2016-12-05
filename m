Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f169.google.com (mail-qk0-f169.google.com
	[209.85.220.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2D0AB7198F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Dec 2016 22:52:01 +0000 (UTC)
Received: by mail-qk0-f169.google.com with SMTP id n204so362594647qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Dec 2016 14:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IlVYXee6xKmHSGDSr/1kqs4ZD63oz/P5sZHk2UHYunY=;
	b=jgHdRLmaxdhmLiXn9Kwo7QWMxmgD5X3nUlzG3e+6AdCfpp8aQxgj4IfHSsgn08AZHT
	7Cyt9FSJuXicwudysDnyU3ADGnYNPQyxKMyQGF+TQ3cH2lUOru7+/AIOOd3cLX6RBDKs
	DHD4Xbt2b9FN0mvBWOn9Pmr+yKgOcVeL1ON7IwBJ5sGXXqv7AvZ7rlTQ2TM8fP00AXNx
	Ls/fintbyXS/t/iPa840HwaAXCd4L8F3yxPswUgK2DJ6bDO3DKoVr/MWMc6HBZEFW+Yu
	D10vbO+9GNTlyyXu0x09ojfRYWmU5pA2V7pz6PGpbwS4BxwANgPjBukgXLhgvnFp/0HM
	LnXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IlVYXee6xKmHSGDSr/1kqs4ZD63oz/P5sZHk2UHYunY=;
	b=g0MGOc5JL5eILwyl90onteO6SZn3aJKYNVoC75idUZQHSI8aRnk3b96ACXpS77C/0+
	t/vc1z8UkI9ypCtZAHBfJ7VtcAocJD9fugub34fn4uOkBHiGdj3nt5j23vzc9Za6JINU
	3A4TNn/JU+T5ZUOyKL14ateU5I6k55WTBvoJOjg1Bu1z2F0crDPeqcM76UfwhaHToFDe
	hyvJ74aNkS0QhZ2syGNA5zRrPeLyeqbWGMUUtYbjQcu8AMS0D56mpYZhF20tHdNjIoa8
	SZBEZWyp7XbWy3tvLSOcZ9E8s4cwDtBkvCgIS1+UFDekmsVeXQ0enncUawM50IBr/dew
	Va7w==
X-Gm-Message-State: AKaTC02/Qjz7eJGAXixlij6h2D8Xok3IRvtycXL98l/hVnowyOxnmCwudLPGoiim7QCDJzqqQwfNN6qMv6BPM4LD
X-Received: by 10.55.31.157 with SMTP id n29mr50126188qkh.221.1480978323067;
	Mon, 05 Dec 2016 14:52:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Mon, 5 Dec 2016 14:51:42 -0800 (PST)
In-Reply-To: <20161205214818.13342-1-haris.okanovic@ni.com>
References: <20161205214818.13342-1-haris.okanovic@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 5 Dec 2016 22:51:42 +0000
Message-ID: <CAJTo0La+W7qJikWqjHh6f90M_Cr_v2EUwegE+CGRLYCR5D6K8A@mail.gmail.com>
To: Haris Okanovic <haris.okanovic@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] run-postinsts: Print message before running deferred postinst scripts
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
X-List-Received-Date: Mon, 05 Dec 2016 22:52:02 -0000
Content-Type: multipart/alternative; boundary=001a1147f228ddf5000542f12255

--001a1147f228ddf5000542f12255
Content-Type: text/plain; charset=UTF-8

On 5 December 2016 at 21:48, Haris Okanovic <haris.okanovic@ni.com> wrote:

> Opkg can defer running postinst scripts to first boot, which can take
> a while on some systems. The output of `opkg configure` (or whatever pm
> is used) is redirected to a file when logging is enabled
> (I.e. $POSTINST_LOGGING == 1), making the machine appear hung during
> this process. This change simply prints a wait message on the console
> to inform the user of this potentially long and silent operation so
> that they do not mistakenly reboot their machine.
>

This isn't opkg specific, all backends can do it.


> Why not simply `tee` the output instead?
> Tee might be provided by BusyBox in some distros, which may need to run
> update-alternatives in the very postinst scripts being executed by this
> process. It's therefore not safe to assume Tee (or any other packaged
> util) is available until the configure process finishes.
>

Are the alternatives not configured at rootfs time, so it should be fine to
run tee?  (as if tee isn't safe, then neither is sed).

Ross

--001a1147f228ddf5000542f12255
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 December 2016 at 21:48, Haris Okanovic <span dir=3D"ltr">&lt;<a href=
=3D"mailto:haris.okanovic@ni.com" target=3D"_blank">haris.okanovic@ni.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17u" cla=
ss=3D"a3s aXjCH m158d11760704c566">Opkg can defer running postinst scripts =
to first boot, which can take<br>
a while on some systems. The output of `opkg configure` (or whatever pm<br>
is used) is redirected to a file when logging is enabled<br>
(I.e. $POSTINST_LOGGING =3D=3D 1), making the machine appear hung during<br=
>
this process. This change simply prints a wait message on the console<br>
to inform the user of this potentially long and silent operation so<br>
that they do not mistakenly reboot their machine.<br></div></blockquote><di=
v><br></div><div>This isn&#39;t opkg specific, all backends can do it.</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":17u" class=3D"=
a3s aXjCH m158d11760704c566">
Why not simply `tee` the output instead?<br>
Tee might be provided by BusyBox in some distros, which may need to run<br>
update-alternatives in the very postinst scripts being executed by this<br>
process. It&#39;s therefore not safe to assume Tee (or any other packaged<b=
r>
util) is available until the configure process finishes.</div></blockquote>=
</div><br>Are the alternatives not configured at rootfs time, so it should =
be fine to run tee? =C2=A0(as if tee isn&#39;t safe, then neither is sed).<=
/div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</=
div></div>

--001a1147f228ddf5000542f12255--
