Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SuPX1-0002jf-Jx
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 16:59:15 +0200
Received: by wibhm11 with SMTP id hm11so1706258wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 07:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=7tDwZCO+qMvsOr3O38nRUjAYxBfXmK52Yaug7Icrn1c=;
	b=Be8cCIL0C3R4BEcCb/r0kvm6AK/5/CR8sjx17CE3jBUA7HOkHBrCQNW8ET2R6Dc+Mj
	bNS6bPHM0ZkB1O9QlV6lq+Ltf8tF9xisPPdHL/wL7jCjUBifux0d85irq6nuCdp/1CIM
	spcjePh0BL7SHVxr++9thHuhQbbe0DhsRdI0OjgEI4OiB/oORyEXzrd/xPpTSX99Obsq
	ks32tnWC3fLLBMw6aNJywyvqQct9G8qFjaUHjDzbSdxlGK2ZJn61ZPc/312M+u0apRQN
	acQvSJV4gnc2zEZafUznqG60qVo6l5ro0gzeAM2kxjOPQZ+XPEmDcJ+z4o/3wKSmCKL/
	FeGg==
Received: by 10.216.181.195 with SMTP id l45mr6936953wem.52.1343314064771;
	Thu, 26 Jul 2012 07:47:44 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b7sm13020230wiz.9.2012.07.26.07.47.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 07:47:43 -0700 (PDT)
Date: Thu, 26 Jul 2012 16:47:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120726144748.GD3621@jama.jama.net>
References: <CALbNGRS3ZaawmC1+pt_ja2+90qyan1XC3V-9s8gsKyr-PsHWwQ@mail.gmail.com>
	<CALbNGRSztH9aBbW7BeLm0YwdGZ-mEvbVMUJJNUa5bLweCXCbmg@mail.gmail.com>
	<1343308890.29991.30.camel@ted>
	<CALbNGRSSkQKgys-2u=dJ4TmYmnwyV6XTsTQ6HFDSACX5hzWYYw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSSkQKgys-2u=dJ4TmYmnwyV6XTsTQ6HFDSACX5hzWYYw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: autoconf broken? (was [oe] gtk+-native configure fails)
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
X-List-Received-Date: Thu, 26 Jul 2012 14:59:15 -0000
X-Groupsio-MsgNum: 26260
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3Pql8miugIZX0722"
Content-Disposition: inline

--3Pql8miugIZX0722
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2012 at 04:22:02PM +0200, Andreas M=FCller wrote:
> On Thu, Jul 26, 2012 at 3:21 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2012-07-26 at 14:59 +0200, Andreas M=FCller wrote:
> >> On Thu, Jul 26, 2012 at 1:24 PM, Andreas M=FCller
> >> <schnitzeltony@googlemail.com> wrote:
> >> > I think it is not gtk+-native specific but some autoconf trouble. I
> >> > tried a build from scratch and get:
> >> >
> >> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in l=
ibrary
> >> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found i=
n library
> >> > | autoreconf: running:
> >> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoc=
onf
> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-n=
ative-2.2.0-r3/atk-2.2.0/m4/
> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/u=
sr/share/aclocal-1.12
> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-n=
ative-2.2.0-r3/atk-2.2.0/aclocal-copy/
> >> > --force --warnings=3Dcross
> >> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
> >> > |       If this token and others are legitimate, please use m4_patte=
rn_allow.
> >> > |       See the Autoconf documentation.
> >> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GET=
TEXT
> >> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux=
/usr/bin/autoconf
> >> > failed with exit status: 1
> >> > | ERROR: autoreconf execution failed.
> >> > | ERROR: Function failed: do_configure (see
> >> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-=
r3/temp/log.do_configure.24422
> >> > for further information)
> >> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
> >> >
> >> > | configure.ac:171: warning: macro 'AM_PATH_GLIB_2_0' not found in l=
ibrary
> >> > | configure.ac:195: warning: macro 'AM_GLIB_GNU_GETTEXT' not found i=
n library
> >> > | autoreconf: running:
> >> > /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/usr/bin/autoc=
onf
> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-n=
ative-2.2.0-r3/atk-2.2.0/m4/
> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux/u=
sr/share/aclocal-1.12
> >> > --include=3D/home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-n=
ative-2.2.0-r3/atk-2.2.0/aclocal-copy/
> >> > --force --warnings=3Dcross
> >> > | configure.ac:171: error: possibly undefined macro: AM_PATH_GLIB_2_0
> >> > |       If this token and others are legitimate, please use m4_patte=
rn_allow.
> >> > |       See the Autoconf documentation.
> >> > | configure.ac:195: error: possibly undefined macro: AM_GLIB_GNU_GET=
TEXT
> >> > | autoreconf: /home/andreas/tmp/oe-core-eglibc/sysroots/x86_64-linux=
/usr/bin/autoconf
> >> > failed with exit status: 1
> >> > | ERROR: autoreconf execution failed.
> >> > | ERROR: Function failed: do_configure (see
> >> > /home/andreas/tmp/oe-core-eglibc/work/x86_64-linux/atk-native-2.2.0-=
r3/temp/log.do_configure.24422
> >> > for further information)
> >> > NOTE: package atk-native-2.2.0-r3: task do_configure: Failed
> >> >
> >> > Suggestions?
> >> >
> >> > Andreas
> >>
> >> FYI I reverted the autoconf 2.68 -> 2.69 patch
> >> (effb75d42098b3e367d393215fd5d52a0191e954) / start build from scratch
> >> but the error is still same.
> >
> > A missing glib-2-0-native dependency for atk-native?
> >
> I built glib-2.0-native manually and can now build atk-native.
> meta-oe's gtk+-native complained
> | No package 'pango' found
> | No package 'cairo' found
> | No package 'gdk-pixbuf-2.0' found
>=20
> What makes me wonder (atk depends on glib-2.0):
> AFAIK there were times when a recipe 'zzz' depending on 'foo' and
> having BBCLASSEXTEND =3D "native", then 'zzz-native' depended on
> 'foo-native'. Is that (still true) true? If not is it a bug or a
> feature?

Maybe you're refering to this issue:
http://git.openembedded.org/openembedded-core/commit/?id=3D46db11c4a789034b=
7040faf127ab865148bedad8

which was together with PACKAGECONF and resulted in similar errors from
gtk+-native.

But I haven't seen this issue in my last rebuild from scratch (about
week ago) maybe it got broken after that.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--3Pql8miugIZX0722
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlARWJQACgkQN1Ujt2V2gBzMtACgqQopFeBvFEn0DzkNWYjympTH
OAMAoKZFmxuta70wvGJlIn+TJC+uHRrq
=1j9o
-----END PGP SIGNATURE-----

--3Pql8miugIZX0722--
