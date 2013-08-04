Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id D9492605F3
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 07:11:25 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so1028618eei.35
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 Aug 2013 00:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Qcu9uKg6UpJMfW3nFaeNZ0+JSI8Bp2MnMd9TG6nx8Mg=;
	b=w9F1ggElpWH8+uMmAQ1jMCPg4VNtN9fVA1jD+ELB1Olx+639R+tNWgs35Tj/hORjGC
	CtOWnrUSPsk1D03ymWDlEoEoCw1uH2hAymzQVUNvSuPWnwjIJvM0oYyMTwl3+f2RJKmX
	sKYZN7uWkqicpOsRhZdjo/g8w58ZjcXJ0WlWdCMtYRtOzCHvOpD51csNARECZsQ81nSi
	e4etPgyUYkL0dzQZBPIEjXyCt+tp1YdWveCXGSZwZu08X7PTBroJY9ip2LGG3tKgAU/5
	y5peaa9UZpnn0ZEwBev9tOknTThZjRvqOs7yXBit0xFuGixthHE5LgabU1fFXdbvyV+y
	GrpQ==
X-Received: by 10.15.68.198 with SMTP id w46mr11907649eex.144.1375600285800;
	Sun, 04 Aug 2013 00:11:25 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	n42sm24257979eeh.15.2013.08.04.00.11.24 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 04 Aug 2013 00:11:25 -0700 (PDT)
Date: Sun, 4 Aug 2013 09:12:05 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20130804071205.GB3280@jama>
References: <20130731055134.2BD98504B3@opal> <20130803232303.GA3280@jama>
	<51FDE708.2080005@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <51FDE708.2080005@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Muhammad Shakeel : systemd: Remove init. d dir if systemd unit file is present and sysvinit not a distro feature
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
X-List-Received-Date: Sun, 04 Aug 2013 07:11:26 -0000
X-Groupsio-MsgNum: 42943
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="VcZjVMblxkg0/8Ur"
Content-Disposition: inline

--VcZjVMblxkg0/8Ur
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 03, 2013 at 10:30:48PM -0700, Saul Wold wrote:
> On 08/03/2013 04:23 PM, Martin Jansa wrote:
> > On Wed, Jul 31, 2013 at 05:51:34AM +0000, git@git.openembedded.org wrot=
e:
> >> Module: openembedded-core.git
> >> Branch: master
> >> Commit: 823c90ad344ca2205f3055e2dcae08c6616f29b7
> >> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcom=
mit;h=3D823c90ad344ca2205f3055e2dcae08c6616f29b7
> >>
> >> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> >> Date:   Mon Jul 29 13:09:51 2013 +0500
> >>
> >> systemd: Remove init.d dir if systemd unit file is present and sysvini=
t not a distro feature
> >>
> >> If systemd is supported DISTRO_FEATURE and sysvinit is not and also if
> >> systemd_unitdir contains anything then no need to keep init.d scripts
> >> for sysvinit compatibility.
> >>
> >> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> >> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >
> > There is small issue with this patch applied:
> >
> > do_rootfs failing:
> > | Collected errors:
> > |  * satisfy_dependencies_for: Cannot satisfy the following dependencies
> > for packagegroup-core-boot:
> > |  *    busybox-hwclock *
> > |  * opkg_install_cmd: Cannot install package packagegroup-core-boot.
> >
> > Systemd images with packagegroup-core-boot RDEPEND on busybox-hwclock:
> > meta/recipes-core/packagegroups/packagegroup-core-boot.bb:
> > ${@base_contains("MACHINE_FEATURES", "rtc", "busybox-hwclock", "", d)} \
> >
> > Which is created only when there is /etc/init.d/hwclock.sh file:
> > FILES_${PN}-hwclock =3D "${sysconfdir}/init.d/hwclock.sh"
> >
> > There are at least 3 options
> > 1) ALLOW_EMPTY_${PN}-hwclock =3D "1"
> > in busybox.inc
> > 2) add hwclock.service to the same package
> > 3) change packagegroup-core-boot to depend on busybox-hwclock only with
> > sysvinit enabled
> >
> > I think the best way to resolve this is 2), any volunteer?
> >
> I think my patch from Friday, which I needed to correct the commit=20
> message should address this in packagegroup-boot-core, which is #3 on=20
> your list.
>=20
> This was discussed in Bug # 4969=20
> (https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4969) and systemd=20
> uses timedatectl.
>=20
> If you have more details or other thoughts, please comment here or on=20
> that bug.

Works fine with that patch applied, thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--VcZjVMblxkg0/8Ur
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlH9/sUACgkQN1Ujt2V2gBxr2wCfYSNTCUDLSdWOOh6vYK5Kx7vx
3JoAnRHkTCaOFqGaf0XY786Vq6XY8Fm6
=LytQ
-----END PGP SIGNATURE-----

--VcZjVMblxkg0/8Ur--
