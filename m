Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RGbmD-00012u-7m
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Oct 2011 21:26:09 +0200
Received: by eyd9 with SMTP id 9so2018183eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 12:20:18 -0700 (PDT)
Received: by 10.213.108.133 with SMTP id f5mr1093345ebp.39.1319052014386;
	Wed, 19 Oct 2011 12:20:14 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id a10sm18459698een.6.2011.10.19.12.20.12
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 12:20:13 -0700 (PDT)
References: <CAMKF1spgu+h2_LD3Qp6129QCxb5XHKSru0ggOHt3vCqG=8s7Jw@mail.gmail.com>
	<201110192102.50043.schnitzeltony@gmx.de>
In-Reply-To: <201110192102.50043.schnitzeltony@gmx.de>
Mime-Version: 1.0 (1.0)
Message-Id: <19517CE2-2C1A-4FE7-9656-20BD83826DFC@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A334)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 19 Oct 2011 21:19:59 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: xerver-xorg build problem
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Oct 2011 19:26:09 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

add mesa-dri to DEPENDS in the xorg .bb, not the .inc

Op 19 okt. 2011 om 21:02 heeft Andreas M=C3=BCller <schnitzeltony@gmx.de> he=
t volgende geschreven:

> On Wednesday, October 19, 2011 08:22:27 PM Khem Raj wrote:
>> Hi
>>=20
>> I am seeing this error today
>>=20
>>=20
>> | checking for GL... yes
>> | checking for DRIPROTO... yes
>> | checking for DRI... no
>> | configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D
>> 7.8.0) were not met:
>> |
>> | No package 'dri' found
>> |
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>> |
>> | Alternatively, you may set the environment variables DRI_CFLAGS
>> | and DRI_LIBS to avoid the need to call pkg-config.
>> | See the pkg-config man page for more details.
>> | + bbfatal 'oe_runconf failed'
>> | + echo 'ERROR: oe_runconf failed'
>> | ERROR: oe_runconf failed
>> | + exit 1
>> | ERROR: Function 'do_configure' failed (see
>> /home/kraj/work/angstrom/build/tmp-angstrom_2010_x-eglibc/work/ppc603e-an=
gstrom-linux/xserver-xorg-2_1.11.1-r1/temp/log.do_configure.21621
>> for further information)
>> NOTE: package xserver-xorg-2_1.11.1-r1: task do_configure: Failed
>> ERROR: Task 1518
>> (/home/kraj/work/angstrom/sources/openembedded-core/meta/recipes-graphics=
/xorg-xserver/xserver-xorg_1.11.1.bb,
>> do_configure) failed with exit code '1'
>> Waiting for 2 active tasks to finish:
>>=20
>>=20
>> any hints ?
>>=20
> I think it is this one [1]: manually build mesa-xlib and mesa-dri. What co=
uld be a proper solution on that?
>=20
> Andreas
>=20
> [1] http://lists.linuxtogo.org/pipermail/openembedded-core/2011-October/01=
1281.html
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


