Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SFUzz-0007QB-Rj
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Apr 2012 20:32:03 +0200
Received: by wera1 with SMTP id a1so359682wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2012 11:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=axgEgbt6vCmR2KQ9S5yCEMN99UPuSurPnHSU08Oqf98=;
	b=YQanQb02Sbe3iFmlEPtOFQhh9YrdmydF+WaQSSSPRzscMtXSOtzYeeTA2HHmvBqOTF
	kOsiqlvtESYLUqBXvzbaWUC6pHfB2RsTYBLCcSwH44kHDbH2DCHlxqyDSnQ82h3gcLpf
	USiDObjjMogF6lMnfABMd3rrqgnoFy9xuYVfQW/sfZ49lLLMBikbIYBdhMnfqIyK3rPG
	7dAH+2is7q9xWdaN8ba5uMFht1LFgSJP5qvqeBKzdbpK8OvuyQdNUjv84BZnbIRIiZnz
	KEugrdS/WShZbQjuSgPT2CevNXdfKQeE5v36jshu0Z9DL/nM2tvG4mWzBZ0AqHkhzlKy
	fKjg==
Received: by 10.180.88.164 with SMTP id bh4mr7547711wib.22.1333563773206;
	Wed, 04 Apr 2012 11:22:53 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id w10sm5743365wiy.3.2012.04.04.11.22.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 04 Apr 2012 11:22:52 -0700 (PDT)
Date: Wed, 4 Apr 2012 20:22:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120404182250.GH4181@jama.jama.net>
References: <20120403131537.5CE3310218@opal>
	<20120404165943.GE4181@jama.jama.net>
	<4F7C8796.9070705@opendreambox.org>
	<20120404174521.GF4181@jama.jama.net>
	<4F7C8B6A.1000008@opendreambox.org>
	<20120404180615.GG4181@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120404180615.GG4181@jama.jama.net>
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
X-List-Received-Date: Wed, 04 Apr 2012 18:32:04 -0000
X-Groupsio-MsgNum: 20283
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="a8sldprk+5E/pDEv"
Content-Disposition: inline

--a8sldprk+5E/pDEv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 04, 2012 at 08:06:15PM +0200, Martin Jansa wrote:
> On Wed, Apr 04, 2012 at 07:56:58PM +0200, Andreas Oberritter wrote:
> > On 04.04.2012 19:45, Martin Jansa wrote:
> > > On Wed, Apr 04, 2012 at 07:40:38PM +0200, Andreas Oberritter wrote:
> > >> On 04.04.2012 18:59, Martin Jansa wrote:
> > >>> On Tue, Apr 03, 2012 at 01:15:37PM +0000, git@git.openembedded.org =
wrote:
> > >>>> Module: openembedded-core.git
> > >>>> Branch: master
> > >>>> Commit: 38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
> > >>>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=
=3Dcommit;h=3D38ee88e3b32b7444d7f1eb64f1b4f69a48fe0458
> > >>>>
> > >>>> Author: Andreas Oberritter <obi@opendreambox.org>
> > >>>> Date:   Tue Apr  3 00:23:55 2012 +0200
> > >>>>
> > >>>> gdb: build with expat, add missing RRECOMMENDS_gdbserver
> > >>>>
> > >>>> * Fixes communication between gdbserver and gdb-cross
> > >>>>   by using the same expat settings for both recipes.
> > >>>> * Adds missing build dependencies for expat/expat-native.
> > >>>> * Adds missing glibc-thread-db runtime recommendation
> > >>>>   to gdbserver, which was set only for gdb.
> > >>>>
> > >>>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
> > >>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > >>>
> > >>> Here it's trying to use host's expat when building target gdb and f=
ails...
> > >>>
> > >>> | checking for libexpat... no
> > >>> | configure: error: expat is missing or unusable
> > >>> | make[1]: *** [configure-gdb] Error 1
> > >>> | make[1]: Leaving directory `/OE/shr-core/tmp-eglibc/work/armv7a-v=
fp-neon-oe-linux-gnueabi/gdb/gdb-7.4-r7.0/build-arm-oe-linux-gnueabi'
> > >>> | make: *** [all] Error 2
> > >>> | ERROR: oe_runmake failed
> > >>> NOTE: package gdb-7.4-r7.0: task do_compile: Failed
> > >>> ERROR: Task 3561 (/OE/shr-core/openembedded-core/meta/recipes-devto=
ols/gdb/gdb_7.4.bb, do_compile) failed with exit code '1'
> > >>>
> > >>> from config.log:
> > >>> configure:10704: checking for libexpat
> > >>> configure:10723: arm-oe-linux-gnueabi-gcc  -march=3Darmv7-a -fno-tr=
ee-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=
=3Dcortex-a8 --sysroot=3D/OE/shr-core/tmp-eglibc/sysroots/om-gta04 -o conft=
est -O2 -pipe -g -feliminate-unused-debug-types    -Wl,-O1 -Wl,--hash-style=
=3Dgnu -Wl,--as-needed conftest.c -ldl -lncurses -lz -lm    /usr/lib/libexp=
at.so >&5
> > >>> /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/armv7a-vf=
p-neon-oe-linux-gnueabi/gcc/arm-oe-linux-gnueabi/4.6.4/ld: error: /usr/lib/=
libexpat.so: incompatible target
> > >>> conftest.c:98: error: undefined reference to 'XML_ParserCreate'
> > >>> collect2: ld returned 1 exit status
> > >>
> > >> Does "bitbake expat" help? Here I have:
> > >=20
> > > expat was built already, so no doesn't help.
> > >=20
> > >=20
> > > -EXPAT =3D "--with-expat"
> > > +EXPAT =3D "--with-expat --with-libexpat-prefix=3D${STAGING_DIR_HOST}"
> > >=20
> > > helps..
> >=20
> > OK. Can you please submit an incremental patch? I wonder why it didn't
> > happen on my system, although I have libexpat-dev installed (Ubuntu).
>=20
> I've tested it only with target gdb (so I don't feel comfortable to send
> patch before testing -cross-canadian and -cross, but I don't have time
> for it now).
>=20
> > Which Linux distribution are you using?
>=20
> Gentoo minimal chroot
> http://git.shr-project.org/git/?p=3Dshr-chroot.git;a=3Dsummary

confirmed on other host also using shr-chroot.. if you want to test it
yourself, here is patch (or somewhere there if reabased already)
http://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dshr&id=3D=
ef16c225a564d465ebab800204434b0d684c4069

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--a8sldprk+5E/pDEv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk98kXoACgkQN1Ujt2V2gBxGOwCeM5BK0+P+LSq9+0DLX2onpBoB
Hi0An1K4gvAWuK6oS7BUabEr1X3p2oxt
=+k7b
-----END PGP SIGNATURE-----

--a8sldprk+5E/pDEv--
