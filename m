Return-Path: <trini@konsulko.com>
Received: from mail-qt0-f169.google.com (mail-qt0-f169.google.com
	[209.85.216.169])
	by mail.openembedded.org (Postfix) with ESMTP id DD5DB6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 13:20:08 +0000 (UTC)
Received: by mail-qt0-f169.google.com with SMTP id 52so47925023qtq.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=X9LzmCT9tHZARh61axmYqlUsFxNITTp0MVlKyzN7mgY=;
	b=FXOUpJVGf5iWs+d9thaE4V5pnoN0HOLUCbnYLs5sh7cvXQgOC9eHc57OW5Rw4w+x/J
	6CDD9lHCBL++4p5zdgsR/dida0guucFnhClcbEHWyMMmqVG2csogW/fSW+KSNaLh7V2a
	fZF8G66cYGrbyzydjfA/lVrPpTb/qUqIUlAd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=X9LzmCT9tHZARh61axmYqlUsFxNITTp0MVlKyzN7mgY=;
	b=CvHi7Wk33qKLVBdpe758FNnKeMk8dnqL0kR2Hu0E1KSJ7y8IWawg53wE7RrgTxNw2V
	KFfztaeQ7Q0o94TJMbgqhgFCc0tGpLefZj8vngo12XDVULbuRD38E6JVMAxijIVysd6q
	BED/bOSOnAKdz2r6FrpHe7u4Rkfn+3zZiwHXlKwZrJoxm6uiuldVUvIB6lHZACnJF4Vm
	hJmyDGZV9cShX+i32NAysV4ZO0YTQ3CrbklMf+Ag009wNxtMflfRY4nefa9sN5nAIPwm
	IsDvQ/Ob/dAUj2uGOmuljjlQbJJ/AQsmMw9Q6Mf/vVYlBEDjDW/SKGLuedLpWhCrp6qs
	qDJA==
X-Gm-Message-State: AEkoouu0etCt8cAYqyPTZ0ID9jk7P1Na3p/SIUC/ha31rzW8mlFwWimbhPjOZEQZqPMjJQ==
X-Received: by 10.237.55.65 with SMTP id i59mr59118737qtb.62.1469712007480;
	Thu, 28 Jul 2016 06:20:07 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1407-C0E8-3C46-B3D1-EDB5-DA82.dyn6.twc.com.
	[2606:a000:1407:c0e8:3c46:b3d1:edb5:da82])
	by smtp.gmail.com with ESMTPSA id
	y67sm7205224qka.45.2016.07.28.06.20.06
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Thu, 28 Jul 2016 06:20:06 -0700 (PDT)
Date: Thu, 28 Jul 2016 09:20:14 -0400
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20160728132014.GH5926@bill-the-cat>
References: <1469658069-20128-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYiDZb676r+kC-CupWhAqLFJvNZv+rMXP7tTcGT2jNu_g@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot.inc: Enable EXTERNALSRC build
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
X-List-Received-Date: Thu, 28 Jul 2016 13:20:09 -0000
X-Groupsio-MsgNum: 85053
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
Content-Disposition: inline

--ewQ5hdP4CtoTt3oD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 28, 2016 at 02:02:20PM +0100, Burton, Ross wrote:

> On 27 July 2016 at 23:21, Manjukumar Matha <
> manjukumar.harthikote-matha@xilinx.com> wrote:
>=20
> > This patch enables building u-boot using externalsrc
> >
>=20
> The commit summary should mention that it's enabling out-of-tree builds, =
of
> which supporting externalsrc is a side effect.
[snip]
> -I/data/poky-master/tmp-glibc/work/beaglebone-poky-linux-gnueabi/u-boot/v=
2016.03+gitAUTOINC+df61a74e68-r0/git/arch//include

So ARCH and a bunch of other stuff isn't set and things blow up.  Just
how large of a -j value are you using here as I would have sworn we had
gotten this problem fixed.

--=20
Tom

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXmgaOAAoJEIf59jXTHXZSQvEQALw+9bwYwbTgzSelHwEFy8m+
9aICWW0HcYD0ZpLYNvwzNak5Qnsq57ZKudhg4hvBIXsXXEXhXY7cn3G5PgQzWB2Q
fV9jNaj9oohpANHLrvNWP5w3I8A9eleBOSlL341MYX2H4QZXG3UsOMRRi4Mg4NEU
/NnG3Dk6/eKDl0nsVztDVtP0BmRc/eecwV/nYgkNKjwVJuS4x/fnad6O3c1/f5Kn
8IJjVeu38MwFx0cF0dmx8uh02m+I+vhQoWNxvFVCLt2l9zCrQmyYE8rnP58+DrbY
gIinitNuWY+oI4MdwST2MQtJlxd4+/tUFNK9NRGHrQX9zJY3TuwnBFnL051xTBDQ
7Eabqx6bj2eOS6OYTv2XZxLpqJjJByA2qhrOEgAwCS74bAB/1q7eRfaDA8VCQvml
4OcM13jEWL9gmtRBK7JCf5Nu5apnv0b5Tc71Zahnqi6J7KDdYUiczpESqbk2e5RT
/yO71FTgCIw+39sbscQqPK1hi6bU0dVJ11jMSt7DCRB18LtTyUXMPYabTf6daSrl
8AkmMaxrak0ZRlVwdsgeqMlfT0gFdsfOrzRJjkgCpWM8hjZBj/IIhk6m/WQb2tRU
AHPWFVjx1RzMEuaQEpf8yNWJ3+UBku8wykyBF32DesAZfLTtwxiZ83jI3HkeDQ+V
aWCOTZbv2x04nrOsXALZ
=BuAk
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
