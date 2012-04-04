Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFUPi-0005ho-8t
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 19:54:34 +0200
Received: by wera1 with SMTP id a1so337340wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 10:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=+X/2Liy7l4vs6+gWGaBoXqAQ3nYOYPIFDetHTa3Fv5Y=;
	b=QxaLWjXdaHR0+KpmilzDD4+QMEzcxgBK1tDZ7DxzUQqNR1adOjEPLrkbJyyhmSlNaU
	ylDTF8KmOJtOwmnLdTvOH6BP9Wtx85tnRWMAK9xUGZI7eWGVdhxFh4jhvypNOdAkNKzt
	oDnAn7Gi27CTAirIF0a3INx63f3yCCFUua9+wMv/u+QSfkerV9uJ/lGmb39BoAypxrEW
	uJYYXiiUApqVMQ5CNR0K3flvw9Kq7E5SBgfvpt2zC7IqNgSlAuhEQU42C0ZOg3pWzxpH
	TGkIURx+xTa4lsdyeo/Zh/p+ez7FJ+1nhXtHehtD7n1IX1lZkcpp+YwR5U8nXkpQPeHd
	mTGA==
Received: by 10.216.138.142 with SMTP id a14mr2199586wej.58.1333561523504;
	Wed, 04 Apr 2012 10:45:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ff2sm5330075wib.9.2012.04.04.10.45.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 10:45:22 -0700 (PDT)
Date: Wed, 4 Apr 2012 19:45:21 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120404174521.GF4181@jama.jama.net>
References: <20120403131537.5CE3310218@opal>
	<20120404165943.GE4181@jama.jama.net>
	<4F7C8796.9070705@opendreambox.org>
MIME-Version: 1.0
In-Reply-To: <4F7C8796.9070705@opendreambox.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-commits] Andreas Oberritter : gdb: build with expat, add missing RRECOMMENDS_gdbserver
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
X-List-Received-Date: Wed, 04 Apr 2012 17:54:34 -0000
X-Groupsio-MsgNum: 20278
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y1L3PTX8QE8cb2T+"
Content-Disposition: inline

--Y1L3PTX8QE8cb2T+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 04, 2012 at 07:40:38PM +0200, Andreas Oberritter wrote:
> On 04.04.2012 18:59, Martin Jansa wrote:
> > On Tue, Apr 03, 2012 at 01:15:37PM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
> >>
> >> Author: Andreas Oberritter <obi@opendreambox.org>
> >> Date:   Tue Apr  3 00:23:55 2012 +0200
> >>
> >> gdb: build with expat, add missing RRECOMMENDS_gdbserver
> >>
> >> * Fixes communication between gdbserver and gdb-cross
> >>   by using the same expat settings for both recipes.
> >> * Adds missing build dependencies for expat/expat-native.
> >> * Adds missing glibc-thread-db runtime recommendation
> >>   to gdbserver, which was set only for gdb.
> >>
> >> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> >> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >=20
> > Here it's trying to use host's expat when building target gdb and fails=
=2E..
> >=20
> > | checking for libexpat... no
> > | configure: error: expat is missing or unusable
> > | make[1]: *** [configure-gdb] Error 1
> > | make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-vfp-n=
eon-oe-linux-gnueabi/gdb/gdb-7.4-r7.0/build-arm-oe-linux-gnueabi'
> > | make: *** [all] Error 2
> > | ERROR: oe_runmake failed
> > NOTE: package gdb-7.4-r7.0: task do_compile: Failed
> > ERROR: Task 3561 (/OE/shr-core/openembedded-core/meta/recipes-devtools/=
gdb/gdb_7.4.bb, do_compile) failed with exit code '1'
> >=20
> > from config.log:
> > configure:10704: checking for libexpat
> > configure:10723: arm-oe-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tree-v=
ectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dc=
ortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta04 -o conftest =
-O2 -pipe -g -feliminate-unused-debug-types    -Wl,-O1 -Wl,--hash-style=3Dg=
nu -Wl,--as-needed conftest.c -ldl -lncurses -lz -lm    /usr/lib/libexpat.s=
o >&5
> > /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vfp-ne=
on-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.4/ld: error: /usr/lib/libe=
xpat.so: incompatible target
> > conftest.c:98: error: undefined reference to 'XML_ParserCreate'
> > collect2: ld returned 1 exit status
>=20
> Does "bitbake expat" help? Here I have:

expat was built already, so no doesn't help.


-EXPAT =3D "--with-expat"
+EXPAT =3D "--with-expat --with-libexpat-prefix=3D${STAGING_DIR_HOST}"

helps..

>=20
> configure:10704: checking for libexpat
> configure:10723: mipsel-oe-linux-gcc  -mel -mabi=3D32   -mhard-float -mar=
ch=3Dmips32 --sysroot=3D/home/obi/src/git/opendreambox-2.1/tmp/sysroots/dm7=
020hd -o conftest -Os -pipe -g -feliminate-unused-debug-types    -Wl,-O1  -=
Wl,--as-needed conftest.c -ldl -lncurses -lz -lm    -lexpat >&5
> configure:10723: $? =3D 0
> configure:10733: result: yes
>=20
> Regards,
> Andreas
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Y1L3PTX8QE8cb2T+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk98iLEACgkQN1Ujt2V2gBxriACfUX8lO10NrKuG4zmhALoC0ZUw
n8cAn3R0kcU05DWJg+jM9UFAy5BA4AHU
=weCs
-----END PGP SIGNATURE-----

--Y1L3PTX8QE8cb2T+--
