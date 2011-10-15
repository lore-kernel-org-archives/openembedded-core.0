Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RF4uf-0003Sg-Du
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Oct 2011 16:08:33 +0200
Received: by bkat8 with SMTP id t8so3295748bka.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Oct 2011 07:02:43 -0700 (PDT)
Received: by 10.223.85.134 with SMTP id o6mr11083949fal.8.1318687363267;
	Sat, 15 Oct 2011 07:02:43 -0700 (PDT)
Received: from [172.20.2.72] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm10550241fai.16.2011.10.15.07.02.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Oct 2011 07:02:42 -0700 (PDT)
References: <F17AC24E-C897-4BF3-990D-F9EE0A97E99E@dominion.thruhere.net>
	<201110151452.31950.schnitzeltony@gmx.de>
	<20111015130007.GB12684@jama.jama.net>
In-Reply-To: <20111015130007.GB12684@jama.jama.net>
Mime-Version: 1.0 (1.0)
Message-Id: <BFB012E8-D9BB-4FD9-A03F-C72751EE50CD@dominion.thruhere.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A334)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 15 Oct 2011 16:02:32 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: missing mesa-dri dependency?
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
X-List-Received-Date: Sat, 15 Oct 2011 14:08:33 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



Op 15 okt. 2011 om 15:00 heeft Martin Jansa <martin.jansa@gmail.com> het vol=
gende geschreven:

> On Sat, Oct 15, 2011 at 02:52:31PM +0200, Andreas M=C3=BCller wrote:
>> On Thursday, October 13, 2011 10:24:19 AM Koen Kooi wrote:
>>> Hi,
>>>=20
>>> I remember fixing this in meta-oe, but now exactly how. IIRC both mesa-x=
lib and mesa-dri needed to get built.
>>>=20
>>> configure: error: Package requirements (glproto >=3D 1.4.14 dri >=3D 7.8=
.0) were not met:
>>> |=20
>>> | No package 'dri' found
>>> |=20
>>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>>> | installed software in a non-standard prefix.
>>> |=20
>>> | Alternatively, you may set the environment variables DRI_CFLAGS
>>> | and DRI_LIBS to avoid the need to call pkg-config.
>>> | See the pkg-config man page for more details.
>>> | + bbfatal 'oe_runconf failed'
>>> | + echo 'ERROR: oe_runconf failed'
>>> | ERROR: oe_runconf failed
>>> | + exit 1
>>> | ERROR: Function 'do_configure' failed (see /OE/tentacle/build/tmp-angs=
trom_2010_x-eglibc/work/armv7a-angstrom-linux-gnueabi/xserver-xorg-1_1.11.1-=
r0/temp/log.do_configure.3602 for further information)
>>> NOTE: package xserver-xorg-1_1.11.1-r0: task do_configure: Failed
>>> ERROR: Task 1842 (/OE/tentacle/sources/openembedded-core/meta/recipes-gr=
aphics/xorg-xserver/xserver-xorg_1.11.1.bb, do_configure) failed with exit c=
ode '1'
>>>=20
>>> regards,
>>>=20
>>> Koen
>> ping - or how do you workaround this for machines not supporting mesa-dri=
?
>=20
> use mesa-dri (with swrast) or mesa-xlib with xserver-xorg-lite

Switching to the -lite would troublesome from an upgrade path of view. As fo=
r TI chips I need to figure out how to enable using our new powervr dri modu=
le in this new setup.

regards,

koen



>>=20
>> Andreas
>>=20
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


