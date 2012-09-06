Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T9lqz-0005Qj-Ug
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 01:51:22 +0200
Received: by wgbdr1 with SMTP id dr1so1725613wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 16:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=resent-from:resent-date:resent-message-id:resent-to:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=r678nnjgtusrukQHvcYKc/RslqIcMK5hedw/69/wJ6w=;
	b=Fh0bKT+Va4xiCiBijH2DlXgN40NQpmDtB5iI64N4gwpyDmEYpWRIEnDR+lrR9MgzLu
	FHe23xqqqK8ZObtnC3BVbkb81GCv4jnrRN2MKfpcukjYWzMrFebPcnyRbsglxMVKuwQy
	/PsWm6RfCcTJnrjvIrAv3EaAzmPt1NBOuB7awCqAATBRWGTtojQ1bS2Ut4pz25hDYJco
	cCOSkIG5OlKlMBtBgu5w0ZmESRWLb3bZIq8FHU1YCzPhpA4CVgFmAlNyWBiISrGEGmZE
	nuYcHDNKjaJ087CSBkfJTfZsbMqh5ToO2RRFScEBxYY/BwgitqLue2iRlb0jQz6Us2P4
	S+Bw==
Received: by 10.216.241.198 with SMTP id g48mr2193977wer.153.1346974737235;
	Thu, 06 Sep 2012 16:38:57 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id h9sm6648201wiz.1.2012.09.06.16.38.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 16:38:56 -0700 (PDT)
Resent-From: Martin Jansa <Martin.Jansa@gmail.com>
Resent-Date: Fri, 7 Sep 2012 01:39:28 +0200
Resent-Message-ID: <20120906233928.GD3487@jama.jama.net>
Resent-To: openembedded-core@lists.openembedded.org
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm6636366wiz.4.2012.09.06.16.37.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Sep 2012 16:37:31 -0700 (PDT)
Date: Fri, 7 Sep 2012 01:38:03 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120906233803.GC3487@jama.jama.net>
References: <20120906231235.2BFB3103D3@opal>
MIME-Version: 1.0
In-Reply-To: <20120906231235.2BFB3103D3@opal>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Richard Purdie : gcc-cross-initial: Reinstate limits.h generation fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2012 23:51:22 -0000
X-Groupsio-MsgNum: 28846
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="aT9PWwzfKXlsBJM1"
Content-Disposition: inline

--aT9PWwzfKXlsBJM1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 06, 2012 at 11:12:35PM +0000, git@git.openembedded.org wrote:
> Module: openembedded-core.git
> Branch: master
> Commit: 71854f5c8c6850ed37777cad21acc92fdbea32fc
> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit=
;h=3D71854f5c8c6850ed37777cad21acc92fdbea32fc
>=20
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Sep  6 16:50:10 2012 +0100
>=20
> gcc-cross-initial: Reinstate limits.h generation fix
>=20
> The removal of gcc-cross-intermediate inadvertently reintroduced a
> problem with the limits.h file being incorrectly/inconsistently
> generated.
>=20
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Db0faebd1f07e161600=
4bd19664395932e7c2c48f
> reverted part of:
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=3Dc8815d2f21849deb93=
59706f54dc71490773415e
>=20
> This reintroduces the protected sysroot ensuring the limits.h file is
> always correctly generated. To reproduce the bug, build gcc-cross, then
> rebuild gcc-cross-initial and it will reference the limits.h file from
> gcc-cross in the sysroot.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Not sure if PR bump would help for gcc-cross-initial, but now incremental=
=20
build fails with:=20

| Configuring in arm-oe-linux-gnueabi/libgcc
| configure: loading cache ./config.cache
| configure: error: `CC' has changed since the previous run:
| configure:   former value:  ` /OE/build/tmp-eglibc/work/armv7a-vfp-neon-o=
e-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795=
349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./g=
cc/xgcc -B/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gcc-cr=
oss-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r11/gcc-4=
_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-a -=
fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
-mtune=3Dcortex-a8 -isystem/OE/build/tmp-eglibc/sysroots/tuna/usr/include -=
B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin/ -=
B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/lib/ -=
isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi=
/include -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-lin=
ux-gnueabi/sys-include --sysroot=3D/OE/build/tmp-eglibc/sysroots/tuna  '
| configure:   current value: ` /OE/build/tmp-eglibc/work/armv7a-vfp-neon-o=
e-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795=
349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./g=
cc/xgcc -B/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/gcc-cr=
oss-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5dede-r11/gcc-4=
_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/./gcc/ -march=3Darmv7-a -=
fno-tree-vectorize     -mthumb-interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon =
-mtune=3Dcortex-a8 -isystem/OE/build/tmp-eglibc/sysroots/tuna/usr/include -=
B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/bin/ -=
B/OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi/lib/ -=
isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-linux-gnueabi=
/include -isystem /OE/build/tmp-eglibc/sysroots/x86_64-linux/usr/arm-oe-lin=
ux-gnueabi/sys-include --sysroot=3D/OE/build/tmp-eglibc/work/armv7a-vfp-neo=
n-oe-linux-gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838=
795349faab5dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/=
tmpsysroot  '
| configure: error: in `/OE/build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-=
gnueabi/gcc-cross-initial-4.7.1.0+git1+d07e24f4ab59f264d68d21838795349faab5=
dede-r11/gcc-4_7-branch/build.x86_64-linux.arm-oe-linux-gnueabi/arm-oe-linu=
x-gnueabi/libgcc':
| configure: error: changes in the environment can compromise the build
| configure: error: run `make distclean' and/or `rm ./config.cache' and sta=
rt over
| make: *** [configure-target-libgcc] Error 1
| ERROR: oe_runmake failed

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--aT9PWwzfKXlsBJM1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBJM9sACgkQN1Ujt2V2gBzuSACfeGmdNR92W1cv6GbNVnv0lEQm
7JsAmwWZgBKxMBsbZY6rURePDj4Qe8Yf
=KfEH
-----END PGP SIGNATURE-----

--aT9PWwzfKXlsBJM1--
