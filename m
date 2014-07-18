Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 70D8B6FA41;
	Fri, 18 Jul 2014 08:38:49 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id x13so3075219wgg.31
	for <multiple recipients>; Fri, 18 Jul 2014 01:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ro8d9OglbpuIDYNzzJ2fW1wGZ0FWBGGV736iJvNSL8I=;
	b=fc7OsoXQkU9YpisasBFbSce7ee8NaA1XzU+o74hRPqXnJalmCrmxA7+2++Ae6yvI+C
	OrJtpf1JZcmYfI1ppeRWuktU2GG2zXOChoyNPXlB0v8/Fx01+3fLWu+HVGP1LOVs2tA9
	TPTbSUV8WyAHbKBWAZacSE3E73akbsjDbOFdRyQJ3K7k4077jp3A1PHXzfdL6+xjvhv3
	crPRI+CMV+49ZCTfOqVXH5St6u81Ob0bL+G6dThLMtGp31S/aTmDRFxk+2S3MpemWPIE
	IpaCij1kuMelwIeGnTUFXIHK62vhclihffRUDKazMLKcADVHB26lCZi4/kpSKb4r8647
	5ctw==
X-Received: by 10.194.57.132 with SMTP id i4mr4376620wjq.6.1405672730256;
	Fri, 18 Jul 2014 01:38:50 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g8sm4166489wib.18.2014.07.18.01.38.48 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 18 Jul 2014 01:38:49 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 18 Jul 2014 10:39:01 +0200
To: openembedded-core@lists.openembedded.org, Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20140718083901.GN2433@jama>
References: <20140717113633.324A3504D4@opal.openembedded.org>
MIME-Version: 1.0
In-Reply-To: <20140717113633.324A3504D4@opal.openembedded.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Chen Qi : shadow: upgrade from 4.1.4.3 to 4.2.1
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
X-List-Received-Date: Fri, 18 Jul 2014 08:38:55 -0000
X-Groupsio-MsgNum: 55206
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Eclf2LUqbhpvYoNt"
Content-Disposition: inline

--Eclf2LUqbhpvYoNt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 17, 2014 at 11:36:33AM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: b73e5cd51551556f9e6a4f7d9e7deec4d9d661bd
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3Db73e5cd51551556f9e6a4f7d9e7deec4d9d661bd
>=20
> Author: Chen Qi <Qi.Chen@windriver.com>
> Date:   Thu Jul 17 15:53:34 2014 +0800
>=20
> shadow: upgrade from 4.1.4.3 to 4.2.1
>=20
> Upgrade shadow from 4.1.4.3 to 4.2.1.
>=20
> Changes during this upgrade are as following.

This seems to trigger ICE in some configurations, this was detected in qemu=
arm world build:

| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/world/shr-core/tmp-eglibc/sysroots/qemuarm -DHAVE_CO=
NFIG_H -I. -I/home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-lin=
ux-gnueabi/shadow/4.2.1-r0/shadow-4.2.1/libmisc -I.. -I/home/jenkins/oe/wor=
ld/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/shadow/4.2.1-r0/shadow=
-4.2.1/lib    -O2 -pipe -g -feliminate-unused-debug-types -c -o cleanup_gro=
up.o /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnuea=
bi/shadow/4.2.1-r0/shadow-4.2.1/libmisc/cleanup_group.c
| /home/jenkins/oe/world/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/=
shadow/4.2.1-r0/shadow-4.2.1/libmisc/cleanup.c:1:0: internal compiler error=
: in default_addr_space_address_mode, at targhooks.c:1161
|  /*
|  ^
| Please submit a full bug report,
| with preprocessed source if appropriate.
| See <http://gcc.gnu.org/bugs.html> for instructions.
| make[2]: *** [cleanup.o] Error 1


--Eclf2LUqbhpvYoNt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlPI3SUACgkQN1Ujt2V2gBxl1ACeNqpmjUuRTRjuuS7bF+4eZeBP
L9gAni3qhkLK+L6z7yH3Bmf+bCWn/rGU
=Qtug
-----END PGP SIGNATURE-----

--Eclf2LUqbhpvYoNt--
