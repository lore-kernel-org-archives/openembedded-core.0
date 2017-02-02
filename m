Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 88939600E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Feb 2017 14:17:38 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id w20so29990390qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2017 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6KHyhnU993M91lgBLXKK0566e8kKIhoUVrswridOyBU=;
	b=aM6eQPhRPa3ukUWneKvDWanCQHBUyfSaMIU84J4mVDI0uO4ex0L/kmElmwkQpKITBe
	WvIx58gSLjU3HPnliJnPxx7jeTUucefYsgxIcpCEvJClr63ziKBftk7982rBG7CZIrN+
	HRbkToBtnD42B7EpZqCjN9xQC+XOwrEERs4Xz02W4hJRvOdOEqFT1ujbHyCSjokXc+I5
	A2h8JNil8lvifnLW3dCAPXoWQa+pC6rQGsEmll3COvN8zJjplP0dfQYT1mIoA2zVwYkE
	rBOsGyxTn5pxw1BVVJODNBX6QmprvzGWAkci4RVHdn2a/VkzPM8iAAyh3y/QtdoaTxFY
	u3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6KHyhnU993M91lgBLXKK0566e8kKIhoUVrswridOyBU=;
	b=bQqkfGkytuGJTV2YKRXPH+IBZXM0UNcd7V0aftfmDzyj4ZW9lxGuUE7qNW6aYWZsr1
	AOR8M7s3y3sFhM9iRL3OgPGp4iv7sPcfOtKHQjKE3lKT+wRq5NcGedBHsb7lr13cIO/b
	nkezBf0diLSgdWMVGv3/dugujcGzSz8xLanLsCsFGMtZpxiiBKyJmGqyTIUiNicrFETH
	aVxEe7p6bvlqDDJOdUz+E7sx1MJhI14/sXbEr2ieAF7z/AtARZFsGJMyf86w6QCRpGp6
	9yrGuCPl+6ljTgZgWuxKKWaKQqFI/Bljb7d2AOAtS7oW9QMPYGdlS4r+JIPiik+GZ9be
	0+EA==
X-Gm-Message-State: AIkVDXLtJcHOhQfkMAzgl0uC43mxCdiIXeCTLchhnGTlXRe07gvq87mdwWAHYlRAmOUO7tub9FwkeVgicK+zL4bT
X-Received: by 10.200.53.247 with SMTP id l52mr8193675qtb.144.1486045057140;
	Thu, 02 Feb 2017 06:17:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Thu, 2 Feb 2017 06:17:16 -0800 (PST)
In-Reply-To: <20170130074745.584-4-nathan@nathanrossi.com>
References: <20170130074745.584-0-nathan@nathanrossi.com>
	<20170130074745.584-4-nathan@nathanrossi.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 2 Feb 2017 14:17:16 +0000
Message-ID: <CAJTo0LZtjvhJrFBGipL7XmOmaVzy84bxX=etWVgRHa7t-BERNg@mail.gmail.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: Alistair Francis <alistai@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] libgcrypt.inc: Enable use of binconfig
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
X-List-Received-Date: Thu, 02 Feb 2017 14:17:39 -0000
Content-Type: multipart/alternative; boundary=001a1142ba20c0a07005478cd32c

--001a1142ba20c0a07005478cd32c
Content-Type: text/plain; charset=UTF-8

On 30 January 2017 at 07:47, Nathan Rossi <nathan@nathanrossi.com> wrote:

> Due to pkg-config support for libgcrypt being un-available for upstream
> libgcrypt, some packages that depend on libgcrypt rely on the use of
> libgcrypt-config (e.g. QEMU).
>

We disable those scripts for a good reason: they're generally either broken
entirely in a cross-environment, or fail badly if sstate is used.    A
better solution really is to just patch qemu's configure (yes, I know this
sucks).

Ross

--001a1142ba20c0a07005478cd32c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 30 January 2017 at 07:47, Nathan Rossi <span dir=3D"ltr">&lt;<a href=3D"=
mailto:nathan@nathanrossi.com" target=3D"_blank">nathan@nathanrossi.com</a>=
&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0=
 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3j1" class=
=3D"a3s aXjCH m159ee67551c38e78">Due to pkg-config support for libgcrypt be=
ing un-available for upstream<br>
libgcrypt, some packages that depend on libgcrypt rely on the use of<br>
libgcrypt-config (e.g. QEMU).<br></div></blockquote></div><br>We disable th=
ose scripts for a good reason: they&#39;re generally either broken entirely=
 in a cross-environment, or fail badly if sstate is used. =C2=A0 =C2=A0A be=
tter solution really is to just patch qemu&#39;s configure (yes, I know thi=
s sucks).</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_ext=
ra">Ross</div></div>

--001a1142ba20c0a07005478cd32c--
