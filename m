Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYf0N-0000tS-6a
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 16:35:56 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so250396bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 07:21:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=izK6vQwz2xdzqfy/d+EOdS4yLkxcTeYRIh0tghXNPCI=;
	b=B6KgSRT9fwPBDyBYcRIhGz1I0JSP72htrYWxisXVYpC8ZCl0HqCemUXMeeM2/XfQ3d
	s19QoJ9pwU/43JU6L/kH9cJGHgm7A+7uzu2DF8TpVxxgbSAQdHdJ3C/nu50FjxBNSBEZ
	LfKSTypzoQ46bDRQSh7RrKIO2XoKmaf6vRGnijM31u4Ny5r7CdKd75524tVeDxy1P/J/
	6MAncBQETP9/vhUO8XqebkeEdkN47mUG5gbkvBkwYLrZwQQ9ysmo076y6A5S3uO3Geen
	WNKl35QeFHrBq3q7USQmr9K1gpq39y7IdDfN2QXEgwZgPgaeWpAUg6TLFhwMQHgiCaXy
	7h9Q==
Received: by 10.204.147.18 with SMTP id j18mr1237214bkv.79.1352906519475;
	Wed, 14 Nov 2012 07:21:59 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g8sm8296516bkv.6.2012.11.14.07.21.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 14 Nov 2012 07:21:54 -0800 (PST)
Date: Wed, 14 Nov 2012 16:22:06 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20121114152206.GO3928@jama.jama.net>
References: <1352815500.24487.123.camel@ted>
	<20121114150945.GN3928@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20121114150945.GN3928@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes: Be consistent about sstate-inputdirs/outputdirs ending with '/'
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
X-List-Received-Date: Wed, 14 Nov 2012 15:35:56 -0000
X-Groupsio-MsgNum: 31363
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="m46qSNjkc66Ye11q"
Content-Disposition: inline

--m46qSNjkc66Ye11q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 14, 2012 at 04:09:45PM +0100, Martin Jansa wrote:
> On Tue, Nov 13, 2012 at 02:05:00PM +0000, Richard Purdie wrote:
> > If sstate-inputdirs and sstate-outputdirs don't match with ending '/'
> > characters, the manifest file can end up corrupted. This change
> > ensures the metadata is consistent in ending do_populate_root tasks
> > with this character to avoid manifest file corruption.
> >=20
> > diff --git a/meta/recipes-devtools/gcc/gcc-cross-initial.inc b/meta/rec=
ipes-devtools/gcc/gcc-cross-initial.inc
> > index ff6556c..1ac1db6 100644
> > --- a/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> > +++ b/meta/recipes-devtools/gcc/gcc-cross-initial.inc
> > @@ -74,6 +74,6 @@ sysroot_stage_all() {
> >  	mv ${SYSROOT_DESTDIR}${target_libdir}/* ${SYSROOT_DESTDIR}${STAGING_D=
IR_TARGET}${target_libdir}/ || true
> >  }
> > =20
> > -do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGIN=
G_DIR_HOST} ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}"
> > -do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST} ${STAG=
ING_DIR_TCBOOTSTRAP}/${target_base_libdir}"
> > +do_populate_sysroot[sstate-inputdirs] =3D "${SYSROOT_DESTDIR}/${STAGIN=
G_DIR_HOST}/ ${SYSROOT_DESTDIR}/${STAGING_DIR_TARGET}/${target_base_libdir}=
/"
> > +do_populate_sysroot[sstate-outputdirs] =3D "${STAGING_DIR_HOST}/ ${STA=
GING_DIR_TCBOOTSTRAP}/${target_base_libdir}/"
>=20
> Not sure if it can be caused by this, but building from scratch fails
> today with:
>=20

with some added debug output it looks like trying to move the same director=
y twice:
WARNING: Moving
/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sst=
ate-install-populate-sysroot/
to
/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sys=
root-destdir///OE/oe-core/tmp-eglibc/sysroots/x86_64-linux/
WARNING: Moving
/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sst=
ate-install-populate-sysroot/
to
/OE/oe-core/tmp-eglibc/work/x86_64-oe-linux/gcc-cross-initial-4.7.2-r13/sys=
root-destdir///OE/oe-core/tmp-eglibc/sysroots/qemux86-64//lib/
ERROR: Error executing a python function in
/OE/oe-core/openembedded-core/meta/recipes-devtools/gcc/gcc-cross-initial_4=
=2E7.bb:

Cheers,

> NOTE: Running setscene task 430 of 457 (/OE/oe-core/openembedded-core/met=
a/recipes-kernel/linux-libc-headers/linux-libc-headers_3.4.3.bb, do_populat=
e_sysroot_setscene)
> ERROR: Error executing a python function in /OE/oe-core/openembedded-core=
/meta/recipes-devtools/gcc/gcc-cross-initial_4.7.bb:
> OSError: [Errno 2] No such file or directory
>=20
> ERROR: The stack trace of python calls that resulted in this exception/fa=
ilure was:
> ERROR:   File "do_populate_sysroot_setscene", line 6, in <module>
> ERROR:
> ERROR:   File "do_populate_sysroot_setscene", line 3, in do_populate_sysr=
oot_setscene
> ERROR:
> ERROR:   File "sstate.bbclass", line 3, in sstate_setscene
> ERROR:
> ERROR:   File "sstate.bbclass", line 63, in sstate_installpkg
> ERROR:
> ERROR: The code that was being executed was:
> ERROR:      0002:def do_populate_sysroot_setscene(d):
> ERROR:      0003:    sstate_setscene(d)
> ERROR:      0004:
> ERROR:      0005:
> ERROR:  *** 0006:do_populate_sysroot_setscene(d)
> ERROR:      0007:
> ERROR: [From file: 'do_populate_sysroot_setscene', lineno: 6, function: <=
module>]
> ERROR:      0001:
> ERROR:      0002:def do_populate_sysroot_setscene(d):
> ERROR:  *** 0003:    sstate_setscene(d)
> ERROR:      0004:
> ERROR:      0005:
> ERROR:      0006:do_populate_sysroot_setscene(d)
> ERROR:      0007:
> ERROR: [From file: 'do_populate_sysroot_setscene', lineno: 3, function: d=
o_populate_sysroot_setscene]
> ERROR:      0001:def sstate_setscene(d):
> ERROR:      0002:    shared_state =3D sstate_state_fromvars(d)
> ERROR:  *** 0003:    accelerate =3D sstate_installpkg(shared_state, d)
> ERROR:      0004:    if not accelerate:
> ERROR:      0005:        raise bb.build.FuncFailed("No suitable staging p=
ackage found")
> ERROR:      0006:
> ERROR: [From file: 'sstate.bbclass', lineno: 3, function: sstate_setscene]
> ERROR:      0059:        os.remove(fixmefn)
> ERROR:      0060:
> ERROR:      0061:    for state in ss['dirs']:
> ERROR:      0062:        prepdir(state[1])
> ERROR:  *** 0063:        os.rename(sstateinst + state[0], state[1])
> ERROR:      0064:    sstate_install(ss, d)
> ERROR:      0065:
> ERROR:      0066:    for plain in ss['plaindirs']:
> ERROR:      0067:        workdir =3D d.getVar('WORKDIR', True)
> ERROR: [From file: 'sstate.bbclass', lineno: 63, function: sstate_install=
pkg]
> NOTE: recipe gcc-cross-initial-4.7.2-r13: task do_populate_sysroot_setsce=
ne: Failed
> WARNING: Setscene task 92 (/OE/oe-core/openembedded-core/meta/recipes-dev=
tools/gcc/gcc-cross-initial_4.7.bb, do_populate_sysroot_setscene) failed wi=
th exit co
> de '1' - real task will be run instead
>=20
> It's not fatal, but it wasn't there yesterday AFAIK.
>=20
> Cheers,
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--m46qSNjkc66Ye11q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlCjtx4ACgkQN1Ujt2V2gBw6/gCfSXehfMZRq3C7RpB5SrlJWqyp
ks4An1okuMQtLSq8StQyyWAFaJ1/Isw/
=ozEr
-----END PGP SIGNATURE-----

--m46qSNjkc66Ye11q--
