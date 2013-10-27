Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8128B6D1CD;
	Sun, 27 Oct 2013 19:17:31 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so3975573eek.1
	for <multiple recipients>; Sun, 27 Oct 2013 12:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Cb2UH+SA4kbrvM9DhYAtzHQZJnnWp59PM6TQsubVGeo=;
	b=zBcGEhStu7ibcWK2PW56+Mpaev54/tdSyL2wFpcV3JB9R+VSR8//I5g9yjkmaO7cRc
	Gig5trbu6JlfGOMr56SP+o46C+OA8ldck+9kcPjnb3vOmKIxatYwZyiwrB3T6NIa82a1
	LiXZKBCGzF0wErt9Axe9wswLalUiYi+9FshsRh75dsMIT5gsDLvAtGQuwtdLLvP3VijU
	nOG4q+I5AFMVv4j//btL+ED1fvqud3d1sLekMzmBeDxIG+HO3/sxgYVR5qKiZAb1ZRlV
	EL/QYmJSW/kZROzJbFBNuTNvimJhvppk4CB4Z/BAqMh8aki3nV0e0Sx1JEeh9Kv9CYqY
	8U0g==
X-Received: by 10.15.74.197 with SMTP id j45mr17868695eey.40.1382901452758;
	Sun, 27 Oct 2013 12:17:32 -0700 (PDT)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id j7sm47500008eeo.15.2013.10.27.12.17.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Oct 2013 12:17:31 -0700 (PDT)
Date: Sun, 27 Oct 2013 20:17:43 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Muhammad Shakeel <muhammad_shakeel@mentor.com>
Message-ID: <20131027191743.GA3704@jama>
References: <20130910220329.45CB15043D@opal> <20131002231105.GA6240@jama>
	<20131018102205.GH3930@jama> <5268F419.2000805@mentor.com>
MIME-Version: 1.0
In-Reply-To: <5268F419.2000805@mentor.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe-commits] Muhammad Shakeel : openssh: Add systemd support
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
X-List-Received-Date: Sun, 27 Oct 2013 19:17:32 -0000
X-Groupsio-MsgNum: 46250
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/nzBZO5zC0uMSeA"
Content-Disposition: inline

--W/nzBZO5zC0uMSeA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2013 at 03:19:05PM +0500, Muhammad Shakeel wrote:
> On 10/18/2013 03:22 PM, Martin Jansa wrote:
> > On Thu, Oct 03, 2013 at 01:11:05AM +0200, Martin Jansa wrote:
> >> On Tue, Sep 10, 2013 at 10:03:29PM +0000, git@git.openembedded.org wro=
te:
> >>> Module: openembedded-core.git
> >>> Branch: master
> >>> Commit: 6e6445d487c033913a29763f8e3a7a339d5b612d
> >>> URL:    http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dco=
mmit;h=3D6e6445d487c033913a29763f8e3a7a339d5b612d
> >>>
> >>> Author: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> >>> Date:   Wed Sep  4 11:04:59 2013 +0000
> >>>
> >>> openssh: Add systemd support
> >>>
> >>> -Remove dependency on meta-systemd
> >>>
> >>> Signed-off-by: Muhammad Shakeel <muhammad_shakeel@mentor.com>
> >>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> >>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> >>>
> >>> ---
> >>>
> >>>   .../openssh/openssh-6.2p2/sshd.socket              |   11 +++++++++=
++
> >>>   .../openssh/openssh-6.2p2/sshd@.service            |    9 +++++++++
> >>>   .../openssh/openssh-6.2p2/sshdgenkeys.service      |   10 ++++++++++
> >>>   meta/recipes-connectivity/openssh/openssh_6.2p2.bb |   19 +++++++++=
++++++++--
> >>>   4 files changed, 47 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb b/met=
a/recipes-connectivity/openssh/openssh_6.2p2.bb
> >>> index c76f9ac..3a7f50d 100644
> >>> --- a/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> >>> +++ b/meta/recipes-connectivity/openssh/openssh_6.2p2.bb
> >>> @@ -26,14 +26,17 @@ SRC_URI =3D "ftp://ftp.openbsd.org/pub/OpenBSD/Op=
enSSH/portable/openssh-${PV}.tar.
> >>>              file://init \
> >>>              file://openssh-CVE-2011-4327.patch \
> >>>              file://mac.patch \
> >>> -           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI=
}', '', d)}"
> >>> +           ${@base_contains('DISTRO_FEATURES', 'pam', '${PAM_SRC_URI=
}', '', d)} \
> >>> +           file://sshd.socket \
> >>> +           file://sshd@.service \
> >>> +           file://sshdgenkeys.service "
> >>>  =20
> >>>   PAM_SRC_URI =3D "file://sshd"
> >>>  =20
> >>>   SRC_URI[md5sum] =3D "be46174dcbb77ebb4ea88ef140685de1"
> >>>   SRC_URI[sha256sum] =3D "7f29b9d2ad672ae0f9e1dcbff871fc5c2e60a194e90=
c766432e32161b842313b"
> >>>  =20
> >>> -inherit useradd update-rc.d update-alternatives
> >>> +inherit useradd update-rc.d update-alternatives systemd
> >>>  =20
> >>>   USERADD_PACKAGES =3D "${PN}-sshd"
> >>>   USERADD_PARAM_${PN}-sshd =3D "--system --no-create-home --home-dir =
/var/run/sshd --shell /bin/false --user-group sshd"
> >>> @@ -41,6 +44,9 @@ INITSCRIPT_PACKAGES =3D "${PN}-sshd"
> >>>   INITSCRIPT_NAME_${PN}-sshd =3D "sshd"
> >>>   INITSCRIPT_PARAMS_${PN}-sshd =3D "defaults 9"
> >>>  =20
> >>> +SYSTEMD_PACKAGES =3D "${PN}-sshd"
> >>> +SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket sshd@.service sshdgenkey=
s.service"
> >> Is it correct to use sshd@.service here?
> >>
> >> meta-systemd .bbappend had only sshd.socket:
> >> -SYSTEMD_PACKAGES =3D "${PN}-sshd"
> >> -SYSTEMD_SERVICE_${PN}-sshd =3D "sshd.socket"
> (Sorry for not replying earlier, your message was moved into a filtered d=
ir)
>=20
> sshd.service was running a single SSH server for all incoming=20
> connections, suitable only for systems with a large amount of SSH=20
> traffic. In almost all other cases it is a better idea to use=20
> sshd.socket + sshd@.service (i.e. the on-demand spawning version for one=
=20
> instance per connection).
>=20
> sshd@.service should not be start/restart by systemctl by postinst and=20
> to achieve this, IMO, it should be removed from SYSTEMD_SERVICE_${PN}-ssh=
d.

Can you please send patch for it?

Thanks

> >> (re)starting sshd@service from postinst is failing with:
> >> SHR root@pjama /etc $ bash -x /var/lib/opkg/info/openssh-sshd.postinst
> >> + OPTS=3D
> >> + '[' -n '' ']'
> >> + type systemctl
> >> + systemctl enable sshd.socket sshd@.service sshdgenkeys.service
> >> + '[' -z '' -a enable =3D enable ']'
> >> + systemctl restart sshd.socket sshd@.service sshdgenkeys.service
> >> Failed to issue method call: Unit name sshd@.service is not valid.
> > ping
> >
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/nzBZO5zC0uMSeA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJtZtcACgkQN1Ujt2V2gBwgxwCeLG4YiPAC9WH+wmNIYD+n9GF4
MigAoK9+E12MmRv9tl58j62ba5XGNy1n
=9j5m
-----END PGP SIGNATURE-----

--W/nzBZO5zC0uMSeA--
