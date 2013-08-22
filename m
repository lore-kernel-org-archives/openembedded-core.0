Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f181.google.com (mail-pd0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id 71C896B3B1
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:24:22 +0000 (UTC)
Received: by mail-pd0-f181.google.com with SMTP id g10so2396799pdj.40
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:content-transfer-encoding:subject:message-id:date
	:to:mime-version;
	bh=fdkP3EBl+2CDUkTbEXfxQ2vcwgZxG6Cw4oO6TFRr45I=;
	b=HeZvxWXMeNiUV73k3HEhSkEG8Md1DBqZo1PvxWwfC+QRX8mZe+7L9dcNhpn0fKIhbD
	QSHBERLrpbancodT0ZAv0K/BA/uQcEZqDMd9y6CB4H3OuR/JYU6MLphRmGglSKUdujO4
	AJ5vC+DFpgIMBzfgIOBLGTRIym/7WStjKHYYjwCxLv3zxQpcpcHT5LsJm6LaqXgqv8Mo
	1TSFZ6Lf+i0B+DNDVZAFdVaIihiphFDuOxivV6nEwlOAziT6peqzbcHkI1UASW3anqx9
	Xrdp7a5SAFltcKU53Wh2c/BfTLeMS/Q31NEu7OquxSwdNzFiQqPtJtTNzXDebEAoeyQW
	rA7g==
X-Received: by 10.66.218.198 with SMTP id pi6mr7672847pac.107.1377206662601;
	Thu, 22 Aug 2013 14:24:22 -0700 (PDT)
Received: from sa-nc-finance-109.static.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id sz3sm16978281pbc.5.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 14:24:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <739A9EF8-4ABD-419C-978B-29006E185238@gmail.com>
Date: Thu, 22 Aug 2013 14:24:20 -0700
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
X-Mailer: Apple Mail (2.1508)
Subject: World build on OE-Core
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
X-List-Received-Date: Thu, 22 Aug 2013 21:24:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi

In spare cycles my box ran world build for all eglibc/qemus, arm, ppc, =
mips looks all fine however I see errors on mips64,x86 and x86_64
I am looking into the mips64 one.

x86_64
=3D=3D=3D=3D=3D=3D

Summary: 17 tasks failed:
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-lib=
/libxft_2.3.1.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/cairo/ca=
iro_1.12.14.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstrea=
mer/gst-plugins-base_0.10.36.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/blue=
z/bluez4_4.101.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/curl/curl=
_7.32.0.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/beecrypt/=
beecrypt_4.2.1.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-xse=
rver/xserver-xorg_1.14.0.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/mesa/mes=
a_9.1.6.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-core/glib-network=
ing/glib-networking_2.36.2.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/enchant/e=
nchant_1.6.0.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/neon/neon=
_0.30.0.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-multimedia/gstrea=
mer/gstreamer1.0-plugins-base_1.0.9.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-support/taglib/ta=
glib_1.8.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-extended/parted/p=
arted_3.1.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-extended/libuser/=
libuser_0.59.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/near=
d/neard_0.10.bb, do_compile
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-connectivity/blue=
z5/bluez5_5.7.bb, do_compile


x86
=3D=3D=3D=3D

Summary: 1 task failed:
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-graphics/xorg-dri=
ver/xf86-video-intel_2.21.13.bb, do_compile


mips64
=3D=3D=3D=3D=3D=3D

Summary: 1 task failed:
  =
/builds1/angstrom/sources/openembedded-core/meta/recipes-devtools/dpkg/dpk=
g_1.17.1.bb, do_configure



