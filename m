Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by mail.openembedded.org (Postfix) with ESMTP id 175157E730
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 07:31:08 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id c11so10106244iom.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Oct 2019 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=c+432AzdDSNB9HhMXj/vx6dsn2OXr31Cll+qQ8L/wlY=;
	b=YcyiUu5tHrleBwgmoK/MV8oEVdBEZPwfCGehz5hmijX1a7PSx7AEEsUawr5wwzQTqm
	d5SgvM+BoZouJkE2xOFk1xC2tQ8LPU/3zIAMqZ2+jhdSELwzFQyeXilC/lGvs6l9UUIX
	NUWmyRgc0KFW3ldGippWxpSucULRf2CsoV9VBCc5sdvko2k4C6AslVx4EmQQOhQgGzPF
	10dQBonQR9siM2SuiSy2f0+jn8C9Qr0w7COjyLvh0WDKO880iI6JJev8vOxIF3N3rfPu
	PCrLdyrqdr66V5hk+WKKxPwRV1LPu5OVYjFy3iNy9nc+qDaK1ttWOzHAgwZLZ/PA+wdq
	BggA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=c+432AzdDSNB9HhMXj/vx6dsn2OXr31Cll+qQ8L/wlY=;
	b=Y0YqpIMuW92oIBtGFIKmTFU+t5SPAVsS2HLth0OcPCMAvWPOjB9nhm4/vV90Sw9Vd1
	qO3DYMsrGGcImfTCTMVSpcNKdkJ3erHY5NVGIqQVV1FRKXDQqbsF4T7q2g0G2+eEHyhM
	r4R8OYitSCEAWDK1996+R3KO9fpF/8UYZ6Vtf4O7I4B20IFKfkZiTGb2slM3r23brVcL
	Phr2+XlyqQC9Qj0O/f/pgL+tF30juKw4XR+jIPpIK+qjfMT8LW12ZMlirfi7esciTRhK
	fDp6h3po3Zp6tdWfD0KwKK5OCAL1vgQ6D9Hzh9Lgz06fJdE5q2108Cz1aQN0z79RMqQo
	zOsw==
X-Gm-Message-State: APjAAAVXaxCvsrR8AI5zC9o3p7ki9ZwEMNZIb66RL5sA/W6b98OHgEMK
	aymL0sK0kskuGXMPWgTo/v9PeLB9xChVWPF8BfM=
X-Google-Smtp-Source: APXvYqwDhaucBhlCFeEZHtQm+E1nVOwYnILr/OTsA4wsHynWoWDAVWy4fGZO3OSJ3IjqSwYmDtdc56zrbQdmvfaZees=
X-Received: by 2002:a5d:884f:: with SMTP id t15mr2556391ios.224.1571729470097; 
	Tue, 22 Oct 2019 00:31:10 -0700 (PDT)
MIME-Version: 1.0
References: <20191011114754.91740-1-alex.kanavin@gmail.com>
	<20191011114754.91740-16-alex.kanavin@gmail.com>
	<dbf128cd95ea3d8017274ea57dda52a72ad727cb.camel@gmail.com>
	<CAMKF1srnabEcWqWYa80uoCe1H=iw-wDPNut4hu4eRwuSQ1HaoQ@mail.gmail.com>
	<CANNYZj8J-wr1V1+aNfbRGyQ+Lk+sofRX4rT1xudaCm67gVev3Q@mail.gmail.com>
	<da2fa30bb8fed7f991ef14a4955a67ec15bc94a6.camel@linuxfoundation.org>
	<CAMKF1sr8xy+bW_UL_=B-nt7MG58bJj=WmB9VVZf5hxBqpXwPiQ@mail.gmail.com>
	<311c58c4bbfdd575f4b0c3123d8f833482f580d1.camel@linuxfoundation.org>
	<CALbNGRR7rL5TcRGiDgjW4-v8UrL7j3tcT86jio8_qTmZ2fBL-Q@mail.gmail.com>
	<CALbNGRQFKf8CEqHpsfLMie=SZ4KBpsZ1kEL+R9kB6kAcE4C_+w@mail.gmail.com>
In-Reply-To: <CALbNGRQFKf8CEqHpsfLMie=SZ4KBpsZ1kEL+R9kB6kAcE4C_+w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Tue, 22 Oct 2019 09:30:58 +0200
Message-ID: <CALbNGRQVZOFLjpsqDS8M3Yr3N0WrVTnCm3EmCMtVV5y5JT9sjw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/19] meson: update to 0.52.0
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
X-List-Received-Date: Tue, 22 Oct 2019 07:31:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 20, 2019 at 5:53 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
> >
> > As soon as I finished bisecting do_rootfs issue (reported) I will try
> >
> > * dconf-patch
> > * dconf+meson patch
> >
> > and report.
> >
> > Thanks for taking care
> >
> Had to adjust the dconf-patch:
>
> * Here (and in master-next) we moved dconf 0.32 -> 0.34
> * The SRC_URI has to go below inherit gnomebase otherwise it does not
> cause effect.
>
> But very important result: dconf-patch only fixes dconf build!
>
> Will send out reworked version to meta-oe list
>
15K build tasks later:

Have build my images with both patches (meson/dconf): No fallout but
more interesting: The do_rootfs [1] issue is gone and the meson patch
was the only change I applied. Have no idea how meson affects qemu
(did not build from scratch and qemu-native was rebuild due to
dependencies). Whatever: Have a full build again \o/

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-October/=
288091.html

Andreas

