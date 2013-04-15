Received: from ch1ehsobe005.messaging.microsoft.com ([216.32.181.185]
	helo=ch1outboundpool.messaging.microsoft.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B28495@freescale.com>) id 1URgpz-0002e2-5H
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:40:54 +0200
Received: from mail61-ch1-R.bigfish.com (10.43.68.240) by
	CH1EHSOBE009.bigfish.com (10.43.70.59) with Microsoft SMTP Server id
	14.1.225.23; Mon, 15 Apr 2013 09:52:57 +0000
Received: from mail61-ch1 (localhost [127.0.0.1])	by mail61-ch1-R.bigfish.com
	(Postfix) with ESMTP id C7F202001A5;
	Mon, 15 Apr 2013 09:52:57 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: -4
X-BigFish: VS-4(zzbb2dI98dI9371I542I1432Izz1f42h1fc6h1ee6h1de0h1fdah1202h1e76h1d1ah1d2ahzz17326ah8275bh8275dh8275chz2dh2a8h668h839h8e2h8e3h944hd25hf0ah1220h1288h12a5h12a9h12bdh137ah13b6h1441h1504h1537h153bh15d0h162dh1631h1758h18e1h1946h19b5h1ad9h1b0ahbe9i1155h)
Received: from mail61-ch1 (localhost.localdomain [127.0.0.1]) by mail61-ch1
	(MessageSwitch) id 1366019575934265_23164;
	Mon, 15 Apr 2013 09:52:55 +0000 (UTC)
Received: from CH1EHSMHS035.bigfish.com (snatpool3.int.messaging.microsoft.com
	[10.43.68.225])	by mail61-ch1.bigfish.com (Postfix) with ESMTP id
	D78472A0892;	Mon, 15 Apr 2013 09:52:55 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CH1EHSMHS035.bigfish.com
	(10.43.70.35) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Mon, 15 Apr 2013 09:52:55 +0000
Received: from 039-SN2MPN1-013.039d.mgd.msft.net ([169.254.3.24]) by
	039-SN1MMR1-002.039d.mgd.msft.net ([10.84.1.15]) with mapi id
	14.02.0328.011; Mon, 15 Apr 2013 09:52:55 +0000
From: Liu Ting-B28495 <B28495@freescale.com>
To: Saul Wold <sgw@linux.intel.com>
Thread-Topic: [OE-core] [oe-core][PATCH 1/2] busybox: detects customized
	configs when do_install
Thread-Index: AQHOHw+/PclxKTLBkk6W33/KghKkd5iu2++AgChjicA=
Date: Mon, 15 Apr 2013 09:52:55 +0000
Message-ID: <AF604684617F454390621992F367F16901C79D2F@039-SN2MPN1-013.039d.mgd.msft.net>
References: <1363085567-5474-1-git-send-email-b28495@freescale.com>
	<5149EC31.3080209@linux.intel.com>
In-Reply-To: <5149EC31.3080209@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.192.208.72]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: Luo Zhenhua-B19537 <B19537@freescale.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] busybox: detects customized configs when do_install
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
X-List-Received-Date: Mon, 15 Apr 2013 10:40:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Saul Wold [mailto:sgw@linux.intel.com]
> Sent: Thursday, March 21, 2013 1:05 AM
> To: Liu Ting-B28495
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [oe-core][PATCH 1/2] busybox: detects customized
> configs when do_install
>=20
> On 03/12/2013 03:52 AM, b28495@freescale.com wrote:
> > From: Ting Liu <b28495@freescale.com>
> >
> > After using 'bitbake -c menuconfig busybox' to customize defconfig,
> > do_install fail to detect the changes. Grep configs in ${S}/.config
> > instead of defconfig.
> >
> With the recent changes from Richard to move towards using a separate ${B=
}
> directory for build vs ${S} directory for source (marked read-only in the
> future), this change should be updated to use ${B} instead of ${S} for
> checking the .config file.
>=20
> The overall change is good, we just need to use the right directory for
> checking the build related changes to the .config file.
>=20
>=20

Patch v2 sent out. Please review.

> Thanks
>      Sau!
>=20
> > Change-Id: I958c232eb9f8096e4113a1c3a2748f5f2eccdeb5
> > Signed-off-by: Ting Liu <b28495@freescale.com>
> > ---
> >   meta/recipes-core/busybox/busybox.inc       |   22 +++++++++++-------
> ----
> >   meta/recipes-core/busybox/busybox_1.20.2.bb |    3 ++-
> >   2 files changed, 13 insertions(+), 12 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-
> core/busybox/busybox.inc
> > index fc6ca91..093bf2e 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -149,11 +149,11 @@ do_install () {
> >
> >   	install -d ${D}${sysconfdir}/init.d
> >
> > -	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=3Dy" ${WORKDIR}/defconfig;
> then
> > +	if ! grep -q "CONFIG_FEATURE_INDIVIDUAL=3Dy" ${S}/.config; then
> >   		# Install /bin/busybox, and the /bin/sh link so the postinst
> script
> >   		# can run. Let update-alternatives handle the rest.
> >   		install -d ${D}${base_bindir}
> > -		if grep -q "CONFIG_FEATURE_SUID=3Dy" ${WORKDIR}/defconfig; then
> > +		if grep -q "CONFIG_FEATURE_SUID=3Dy" ${S}/.config; then
> >   			install -m 4755 ${S}/busybox ${D}${base_bindir}
> >   		else
> >   			install -m 0755 ${S}/busybox ${D}${base_bindir}
> > @@ -179,36 +179,36 @@ do_install () {
> >   		fi
> >   	fi
> >
> > -	if grep -q "CONFIG_SYSLOGD=3Dy" ${WORKDIR}/defconfig; then
> > +	if grep -q "CONFIG_SYSLOGD=3Dy" ${S}/.config; then
> >   		install -m 0755 ${WORKDIR}/syslog
> ${D}${sysconfdir}/init.d/syslog.${BPN}
> >   		install -m 644 ${WORKDIR}/syslog-startup.conf
> ${D}${sysconfdir}/syslog-startup.conf.${BPN}
> >   	fi
> > -	if grep "CONFIG_CROND=3Dy" ${WORKDIR}/defconfig; then
> > +	if grep "CONFIG_CROND=3Dy" ${S}/.config; then
> >   		install -m 0755 ${WORKDIR}/busybox-cron
> ${D}${sysconfdir}/init.d/
> >   	fi
> > -	if grep "CONFIG_HTTPD=3Dy" ${WORKDIR}/defconfig; then
> > +	if grep "CONFIG_HTTPD=3Dy" ${S}/.config; then
> >   		install -m 0755 ${WORKDIR}/busybox-httpd
> ${D}${sysconfdir}/init.d/
> >   		install -d ${D}/srv/www
> >   	fi
> > -	if grep "CONFIG_UDHCPD=3Dy" ${WORKDIR}/defconfig; then
> > +	if grep "CONFIG_UDHCPD=3Dy" ${S}/.config; then
> >   		install -m 0755 ${WORKDIR}/busybox-udhcpd
> ${D}${sysconfdir}/init.d/
> >   	fi
> > -	if grep "CONFIG_HWCLOCK=3Dy" ${WORKDIR}/defconfig; then
> > +	if grep "CONFIG_HWCLOCK=3Dy" ${S}/.config; then
> >   		install -m 0755 ${WORKDIR}/hwclock.sh
> ${D}${sysconfdir}/init.d/
> >   	fi
> > -	if grep "CONFIG_UDHCPC=3Dy" ${WORKDIR}/defconfig; then
> > +	if grep "CONFIG_UDHCPC=3Dy" ${S}/.config; then
> >   		install -d ${D}${sysconfdir}/udhcpc.d
> >   		install -d ${D}${datadir}/udhcpc
> >                   install -m 0755 ${WORKDIR}/simple.script
> ${D}${sysconfdir}/udhcpc.d/50default
> >   		install -m 0755 ${WORKDIR}/default.script
> ${D}${datadir}/udhcpc/default.script
> >   	fi
> > -	if grep "CONFIG_INETD=3Dy" ${WORKDIR}/defconfig; then
> > +	if grep "CONFIG_INETD=3Dy" ${S}/.config; then
> >   		install -m 0755 ${WORKDIR}/inetd
> ${D}${sysconfdir}/init.d/inetd.${BPN}
> >   		install -m 0644 ${WORKDIR}/inetd.conf ${D}${sysconfdir}/
> >   	fi
> > -        if grep "CONFIG_MDEV=3Dy" ${WORKDIR}/defconfig; then
> > +        if grep "CONFIG_MDEV=3Dy" ${S}/.config; then
> >                  install -m 0755 ${WORKDIR}/mdev
> ${D}${sysconfdir}/init.d/mdev
> > -               if grep "CONFIG_FEATURE_MDEV_CONF=3Dy"
> ${WORKDIR}/defconfig; then
> > +               if grep "CONFIG_FEATURE_MDEV_CONF=3Dy" ${S}/.config; th=
en
> >                          install -m 644 ${WORKDIR}/mdev.conf
> ${D}${sysconfdir}/mdev.conf
> >                  fi
> >   	fi
> > diff --git a/meta/recipes-core/busybox/busybox_1.20.2.bb
> b/meta/recipes-core/busybox/busybox_1.20.2.bb
> > index 783261e..255d56c 100644
> > --- a/meta/recipes-core/busybox/busybox_1.20.2.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.20.2.bb
> > @@ -1,5 +1,5 @@
> >   require busybox.inc
> > -PR =3D "r5"
> > +PR =3D "r6"
> >
> >   SRC_URI =3D "http://www.busybox.net/downloads/busybox-
> ${PV}.tar.bz2;name=3Dtarball \
> >              file://B921600.patch \
> > @@ -30,6 +30,7 @@ SRC_URI =3D "http://www.busybox.net/downloads/busybox=
-
> ${PV}.tar.bz2;name=3Dtarball \
> >              file://stat-usr-bin.patch \
> >              file://testsuite-du-du-k-works-fix-false-positive.patch"
> >
> > +
> >   SRC_URI[tarball.md5sum] =3D "e025414bc6cd79579cc7a32a45d3ae1c"
> >   SRC_URI[tarball.sha256sum] =3D
> "eb13ff01dae5618ead2ef6f92ba879e9e0390f9583bd545d8789d27cf39b6882"
> >
> >




