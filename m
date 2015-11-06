Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id B4AD873D46
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 20:38:36 +0000 (UTC)
Received: by qkcn129 with SMTP id n129so50162701qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 12:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=LxqJbF21aGvivktjizz581x1DUnqB2QhXtL046lKQ6k=;
	b=IudTbXMV39aibkP9SN1MnB6YeFLtilLzeJhOI6oxX5IRw0J+GN257RivWmNSxuP2Tm
	ptTOVgbH5R71w37Xf4hRQHOoNx8Piey0k8KcVVZd7ZoXb8lSEgbNMw4Z3TiaKM63tkXs
	LOkhTP99NDm7wBNfJEB55K7giQHu85mvfAfBzbJZztPhWoVHPUWiK0NFkAXGZguvJ7xn
	bJy2v+ddeV0w/ZMNTTlIgQWr9eKza4GgvVm9+d2xx3O8EAqwQ7HrHPANhYMoWw+JT5A9
	cBD9Sd7CMf3LBS8O42IMf3fJQbYY+xI0XicfumjE9N3yol8+jdE9e+Jr3DmIqGmaBas8
	SZoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LxqJbF21aGvivktjizz581x1DUnqB2QhXtL046lKQ6k=;
	b=OOJlvpHGqWXSp2qz0zYXVzaJxoer7c3KA/yz4MeAn5ZhfISPuh5DgrPGec/KKQ2CvM
	CLpyi2ijj0IoXHOEsQgba8weOOfpGwLjejq8hLHoocQ/6fuVRs8fRb1X0W2d0DQJgo0q
	Qw9qDdumKfSPeo+VGkHaeb+UEPfGyuNKHee7TxcFRbW4KYdxHIbOwlLBSyeFZk3Jx5xV
	hYkxfP8MftVr7OJGkACoIPzJ8m5cR9QyKt8fWEfPZwa7X4brCaI/mZzcaNok9vS2PMeC
	JC90KS+Q/TE+69g7/MN7vb7XrGW1vHROlBkjShuUtHPb6Du7++zsOikAqISnrBtGVJdp
	IzSA==
X-Gm-Message-State: ALoCoQkIswpwyvLj0c4PJw4SUd5J9REhL6tQmJ/5kwqrl/mmrIeK78wCP0icnb/u6dxpIOVcwKbI
X-Received: by 10.55.79.207 with SMTP id d198mr14867639qkb.49.1446842316158;
	Fri, 06 Nov 2015 12:38:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.94.110 with HTTP; Fri, 6 Nov 2015 12:38:16 -0800 (PST)
In-Reply-To: <cover.1446729162.git.jussi.kukkonen@intel.com>
References: <cover.1446729162.git.jussi.kukkonen@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 6 Nov 2015 20:38:16 +0000
Message-ID: <CAJTo0LZbx2rXSyvqED6Mi2aJ37tPFXuK2UggiyKCmmk7sAt_8w@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Upgrades: GLib & friends
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
X-List-Received-Date: Fri, 06 Nov 2015 20:38:37 -0000
Content-Type: multipart/alternative; boundary=001a114a9ada4d14840523e53a0b

--001a114a9ada4d14840523e53a0b
Content-Type: text/plain; charset=UTF-8

On 5 November 2015 at 13:27, Jussi Kukkonen <jussi.kukkonen@intel.com>
wrote:

> This should be a cosmetic issue (as custom allocators didn't
> really work before either) and is already fixed in upstream Qemu.
>

As this is pretty ugly, can we backport the fix to our qemu?

Ross

--001a114a9ada4d14840523e53a0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 5 November 2015 at 13:27, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=
=3D"mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel=
.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":3h=
n" class=3D"a3s" style=3D"overflow:hidden"> This should be a cosmetic issue=
 (as custom allocators didn&#39;t<br>
really work before either) and is already fixed in upstream Qemu.<br></div>=
</blockquote></div><br>As this is pretty ugly, can we backport the fix to o=
ur qemu?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extr=
a">Ross</div></div>

--001a114a9ada4d14840523e53a0b--
