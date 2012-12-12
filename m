Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Tiu45-00012O-IJ
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 22:42:06 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so796830eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 13:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Fojd5VpZbYwwLqUY5YNIBjh1R2PAvSiodf3GPa0ZGUM=;
	b=ifn+X7uOzjk2WcBJ6EDP7AktAgz8kXE7UrWOTd7FysOqve1hSYVQZd0k0mPFk+L1UW
	7hjLnPjJcG1RnK6UUycV5VBGS13dttp3MeH5TBDBYpZr1QGGoZQFK1OOiiAd0zKJ4VX1
	nPuj6iZ+xt8D3L90qLNdpOI+Vyc07/nE//GQ0nR7WHG7S7fbIsvnot8Ne88T60ReCm8G
	NPobxPpOw3r14D3QWzscNqzHH9Gn8D792D/WMwel+zEpcctWaiOXObhlzGrm8GROND4k
	zDcphCG1IMjFrDnR80AwXREPrnj2lJDDl+GDS1WGz9UlOeT4QOprXey26CQqFVJR9vT+
	kZgA==
Received: by 10.14.223.200 with SMTP id v48mr6150432eep.24.1355347651748;
	Wed, 12 Dec 2012 13:27:31 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id e2sm58380567eeo.8.2012.12.12.13.27.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 13:27:30 -0800 (PST)
Date: Wed, 12 Dec 2012 22:27:45 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121212212745.GD1756@jama.jama.net>
References: <1355224219-16454-1-git-send-email-Martin.Jansa@gmail.com>
	<1355224219-16454-2-git-send-email-Martin.Jansa@gmail.com>
	<50C7E2C9.3010100@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <50C7E2C9.3010100@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] autotools: copy also remove-potcdate.sin from ${STAGING_DATADIR_NATIVE}/gettext/po
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
X-List-Received-Date: Wed, 12 Dec 2012 21:42:06 -0000
X-Groupsio-MsgNum: 32585
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pQhZXvAqiZgbeUkD"
Content-Disposition: inline

--pQhZXvAqiZgbeUkD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 11, 2012 at 05:50:01PM -0800, Saul Wold wrote:
> On 12/11/2012 03:10 AM, Martin Jansa wrote:
> > * some packages (e.g. uptime, cpu, forecasts, news from meta-efl)
> >    don't have remove-potcdate.sin in po subdirectory, but Makefile.in.in
> >    supplied by autotools.bbclass depends on it and fails without like t=
his:
> >    | make[3]: Entering directory `/OE/shr-core/tmp-eglibc/work/x86_64-o=
e-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
> >    | make[3]: *** No rule to make target `remove-potcdate.sin', needed =
by `remove-potcdate.sed'.  Stop.
> >    | make[3]: Leaving directory `/OE/shr-core/tmp-eglibc/work/x86_64-oe=
-linux/uptime/0.0.2+svnr80477-r0.0/E-MODULES-EXTRA/uptime/po'
> >    | make[2]: *** [uptime.pot] Error 2
> >
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >   meta/classes/autotools.bbclass | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bb=
class
> > index ca981ec..3154435 100644
> > --- a/meta/classes/autotools.bbclass
> > +++ b/meta/classes/autotools.bbclass
> > @@ -193,6 +193,7 @@ autotools_do_configure() {
> >   				cp ${STAGING_DATADIR_NATIVE}/gettext/config.rpath ${AUTOTOOLS_AUX=
DIR}/
> >   				if [ -d ${S}/po/ ]; then
> >   					cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po/
> > +					cp ${STAGING_DATADIR_NATIVE}/gettext/po/remove-potcdate.sin ${S}/=
po/
> >   				fi
> >   				for i in gettext.m4 iconv.m4 lib-ld.m4 lib-link.m4 lib-prefix.m4 =
nls.m4 po.m4 progtest.m4; do
> >   					for j in `find ${S} -name $i | grep -v aclocal-copy`; do
> >
> This patch seems to have an adverse affect on a number of other packages=
=20
> some how. I saw a number patch failures and configure failures with this=
=20
> patch.
>=20
> See the Autobuilder for examples.
>=20
> http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/830/=
steps/shell_29/logs/stdio

I got only one error caused by this in whole world build (with 19
layers) and that was in bash:

NOTE: Running task 4203 of 22403 (ID: 11399, /OE/jansa-test/shr-core/openem=
bedded-core/meta/recipes-extended/bash/bash_4.2.bb, do_configure)
NOTE: recipe bash-4.2-r6: task do_configure: Started
ERROR: Function failed: do_configure (see /OE/jansa-test/shr-core/tmp-eglib=
c/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4=
923 for=20
further information)
ERROR: Logfile of failure stored in: /OE/jansa-test/shr-core/tmp-eglibc/wor=
k/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure.4923
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux=
', 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing shell function do_configure
| automake (GNU automake) 1.12.5
| Copyright (C) 2012 Free Software Foundation, Inc.
| License GPLv2+: GNU GPL version 2 or later <http://gnu.org/licenses/gpl-2=
=2E0.html>
| This is free software: you are free to change and redistribute it.
| There is NO WARRANTY, to the extent permitted by law.
|
| Written by Tom Tromey <tromey@redhat.com>
|        and Alexandre Duret-Lutz <adl@gnu.org>.
| AUTOV is 1.12
| cp: cannot create regular file '/OE/jansa-test/shr-core/tmp-eglibc/work/a=
rmv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin=
': Permission denied
| ERROR: Function failed: do_configure (see /OE/jansa-test/shr-core/tmp-egl=
ibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/temp/log.do_configure=
=2E4923 for further information)
NOTE: recipe bash-4.2-r6: task do_configure: Failed

$ ls -lah /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-=
gnueabi/bash/4.2-r6/bash-4.2/po/remove-potcdate.sin
-r--r--r-- 1 bitbake bitbake 432 Dec  9  2003 /OE/jansa-test/shr-core/tmp-e=
glibc/work/armv7a-vfp-neon-oe-linux-gnueabi/bash/4.2-r6/bash-4.2/po/remove-=
potcdate.sin

This can be fixed in bash itself or I can add if to copy remove-potcdate.si=
n only if it doesn't exist.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pQhZXvAqiZgbeUkD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDI9tEACgkQN1Ujt2V2gBzuEwCgjFDHOFROrA7I7w21dWCmEFF3
z80An2oFHmneE+Iz4403RmMf//GmDz22
=jdEd
-----END PGP SIGNATURE-----

--pQhZXvAqiZgbeUkD--
