Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jeffrey.honig@windriver.com>) id 1UBTmj-0004Bi-Po
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 18:30:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r21HDqlr026484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Mar 2013 09:13:52 -0800 (PST)
Received: from jch-schlepp.wrs.com (172.25.32.253) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Fri, 1 Mar 2013 09:13:51 -0800
Received: from schlepp.honig.net (schlepp.honig.net [127.0.0.1])	by
	jch-schlepp.wrs.com (8.14.4/8.14.4/Debian-2ubuntu2) with ESMTP id
	r21HDm2w002360	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256
	verify=NOT);	Fri, 1 Mar 2013 12:13:49 -0500
Received: from schlepp.honig.net (jch@localhost)	by schlepp.honig.net
	(8.14.4/8.14.4/Submit) with ESMTP id r21HDmUL002356;
	Fri, 1 Mar 2013 12:13:48 -0500
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: Message from Martin Jansa <martin.jansa@gmail.com> on
	Fri, 01 Mar 2013 10:20:51 +0100.<20130301092051.GG3279@jama>
References: <3796.1362104349@schlepp.honig.net> <20130301092051.GG3279@jama>
From: Jeffrey Honig <jeffrey.honig@windriver.com>
Organization: Wind River Systems, Inc.; Trumansburg, NY  USA
X-Mailer: MH-E 8.4+bzr; nmh 1.3; GNU Emacs 24.3.50
Face: iVBORw0KGgoAAAANSUhEUgAAADAAAAAwBAMAAAClLOS0AAAAGFBMVEXMnHK1jHX257A2GQY+
	AQD2yp+TalXrsYfLpNnfAAACHUlEQVR4nG3TwYrbMBAG4NFCrKu1UO+1FZhc1zioD+DSc2oY
	fLUJq16VgDKv31+W5aTtKoFl9WVGM2OZfvy/Ons2hsp/w+kzGPq0CrgHpO1HhBv/gkfIzx2G
	3nn/OfiaQKchn3gr0LtaJJDfzhledpi1YEEyvG7QO5LIiKkua8zw8nWDRQszRPm1gHL44Gbh
	0UJCc1mBc8TgSdjalqeg1vPdmKH3Om5AHiFDZ48FtgihBqf4jxX6k1sQkRZANZduGjP0gLRt
	J8JS/rdFtFrB5FR09zNRMz9AEWlrj/FIwagn6Crv52gnTGtStVp2mCvM9jAKfoyCpXqKaMjc
	ONRX4jNxNUIyNJWfOQqJAMYmAWVoMEVNMkk8a/a3Au9UaQkIQIdBi99TfQ9BYgBxix7F7fCO
	fQ5x0jE1Hx7gzjoiPb7IJdcVwgoBgFSoCnB3tkBPAKUpPS+enqFGUUYTmTe2XBUwBsOVatE6
	qDcM495t4DFBZoVnMlF8BqRyI58rQan8L9xaDoSEuERttezl9v2rZUFl+FhufJINPvCUJM1W
	J/Bfdug4YD+2ARUAzGivGRxjC90F3Z4BixkLHEKdrrU6MG4poFYZljrgNtg0YswAnS0FFqmj
	bSfBqyDXBCb3YZb05qQFegKPP7ilyIWDRuWXxuS7q4w5IMK2ggZbkxfhjb0a85Y6TEH2WwG3
	pNHXSB/TkKwpgHOQymB33f9V4A+X8QoMXFv/KAAAAABJRU5ErkJggg==
MIME-Version: 1.0
Date: Fri, 1 Mar 2013 12:13:48 -0500
Message-ID: <2354.1362158028@schlepp.honig.net>
Sender: <Jeffrey.Honig@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe] [PATCH]: Resolve sysvinit and util-linux conflicting man pages.
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
X-List-Received-Date: Fri, 01 Mar 2013 17:30:28 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Martin Jansa <martin.jansa@gmail.com> wrote:

> On Thu, Feb 28, 2013 at 09:19:09PM -0500, Jeffrey Honig wrote:
> > From: Jeffrey C Honig <jeffrey.honig@windriver.com>
> >=20
> > [ CQID: WIND00404316 ]
> >=20
> > Use alternatives mechanism to prevent sysvlinux and util-linux
> > man pages from causing conflicts.
>=20
> It would be better to set higher then default priority in one of them,
> otherwise last installed/upgraded wins (at least with opkg u-a=20
> implementation).

As I understand it, this is already present:

sysvinit_2.88dsf.bb:

ALTERNATIVE_PRIORITY =3D "200"

util-linux.inc:

ALTERNATIVE_PRIORITY =3D "100"

Thanks!

Jeff

> > Signed-off-by: Jeffrey C Honig <jeffrey.honig@windriver.com>
> > ---
> >  meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb    |   11 ++++++++++-
> >  meta/recipes-core/util-linux/util-linux.inc       |    9 +++++++++
> >  meta/recipes-core/util-linux/util-linux_2.22.2.bb |    2 +-
> >  3 files changed, 20 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/reci=
pes-core/sysvinit/sysvinit_2.88dsf.bb
> > index 0a11139..e64b67a 100644
> > --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> > +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> > @@ -5,7 +5,7 @@ SECTION =3D "base"
> >  LICENSE =3D "GPLv2+"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa8=
82bbe \
> >                      file://COPYRIGHT;endline=3D15;md5=3D349c872e006615=
5e1818b786938876a4"
> > -PR =3D "r10"
> > +PR =3D "r11"
> >=20=20
> >  RDEPENDS_${PN} =3D "${PN}-inittab"
> >=20=20
> > @@ -45,6 +45,15 @@ ALTERNATIVE_LINK_NAME[poweroff] =3D "${base_sbindir}=
/poweroff"
> >  ALTERNATIVE_${PN}-pidof =3D "pidof"
> >  ALTERNATIVE_LINK_NAME[pidof] =3D "${base_bindir}/pidof"
> >=20=20
> > +ALTERNATIVE_${PN}-doc =3D "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8=
 utmpdump.1"
> > +
> > +ALTERNATIVE_LINK_NAME[last.1] =3D "${mandir}/man1/last.1"
> > +ALTERNATIVE_LINK_NAME[mesg.1] =3D "${mandir}/man1/mesg.1"
> > +ALTERNATIVE_LINK_NAME[mountpoint.1] =3D "${mandir}/man1/mountpoint.1"
> > +ALTERNATIVE_LINK_NAME[sulogin.8] =3D "${mandir}/man8/sulogin.8"
> > +ALTERNATIVE_LINK_NAME[utmpdump.1] =3D "${mandir}/man1/utmpdump.1"
> > +ALTERNATIVE_LINK_NAME[wall.1] =3D "${mandir}/man1/wall.1"
> > +
> >  PACKAGES =3D+ "sysvinit-pidof sysvinit-sulogin"
> >  FILES_${PN} +=3D "${base_sbindir}/* ${base_bindir}/*"
> >  FILES_sysvinit-pidof =3D "${base_bindir}/pidof.sysvinit ${base_sbindir=
}/killall5"
> > diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes=
-core/util-linux/util-linux.inc
> > index 10439c0..c91f4a3 100644
> > --- a/meta/recipes-core/util-linux/util-linux.inc
> > +++ b/meta/recipes-core/util-linux/util-linux.inc
> > @@ -154,6 +154,15 @@ ALTERNATIVE_LINK_NAME[pivot_root] =3D "${base_sbin=
dir}/pivot_root"
> >  ALTERNATIVE_LINK_NAME[mkfs.minix] =3D "${base_sbindir}/mkfs.minix"
> >  ALTERNATIVE_LINK_NAME[eject] =3D "${bindir}/eject"
> >=20=20
> > +ALTERNATIVE_${PN}-doc =3D "mountpoint.1 last.1 mesg.1 wall.1 sulogin.8=
 utmpdump.1"
> > +
> > +ALTERNATIVE_LINK_NAME[last.1] =3D "${mandir}/man1/last.1"
> > +ALTERNATIVE_LINK_NAME[mesg.1] =3D "${mandir}/man1/mesg.1"
> > +ALTERNATIVE_LINK_NAME[mountpoint.1] =3D "${mandir}/man1/mountpoint.1"
> > +ALTERNATIVE_LINK_NAME[sulogin.8] =3D "${mandir}/man8/sulogin.8"
> > +ALTERNATIVE_LINK_NAME[utmpdump.1] =3D "${mandir}/man1/utmpdump.1"
> > +ALTERNATIVE_LINK_NAME[wall.1] =3D "${mandir}/man1/wall.1"
> > +
> >  # There seems to be problem, atleast on nslu2, with these, untill they=
 are
> >  # fixed the busybox ones have higher priority
> >  ALTERNATIVE_PRIORITY[hwclock] =3D "10"
> > diff --git a/meta/recipes-core/util-linux/util-linux_2.22.2.bb b/meta/r=
ecipes-core/util-linux/util-linux_2.22.2.bb
> > index dd95573..f91784b 100644
> > --- a/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> > +++ b/meta/recipes-core/util-linux/util-linux_2.22.2.bb
> > @@ -1,5 +1,5 @@
> >  MAJOR_VERSION =3D "2.22"
> > -PR =3D "r0"
> > +PR =3D "r1"
> >  require util-linux.inc
> >=20=20
> >  # note that `lscpu' is under GPLv3+
> > --=20
> > 1.7.9.5
> >=20
> >=20
> >=20
> >=20
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--=20
Jeffrey C. Honig
Manager of Linux Products Division / SDT
Wind River (=E9=A3=8E=E6=B2=B3)
+1.607.216.8613
http://www.windriver.com


