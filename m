Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 09C9C6AE73
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 10:20:00 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id e53so2036598eek.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Jan 2014 02:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=ZKB3vgayL2uApb0+lLISuSv5y2ZTBX0sfx1E/+xqdRA=;
	b=Ypf7AxdjPvfmDJZR8tFCEADdT7AVa9UGENnhxpGyzevgbjW1VpYSh21oZi81EQWykZ
	DHINFnIcd6JUIpTHEi6pK7MRF2XCY5AzSSOX0CxMIaIX2nt/4jiX/JijxdCpNEqqXz2m
	AdhPp6gd+VJafjjvKsEtGtwwClqB9os8+aKt7++OexS0/qtSdTPnFX6fpjXwL8bDJHa9
	RSPY4LEAoxZrtaYRm+MY6nd65haIO4v4CHmxLFfxIFHgWrc4cQBKTbUllN2azliCYfAi
	DpMxUaf8e88jmg9ZiKtW02jB8uoNlXwECoQgmM2k7xO6wQPQfxlNZhF479wgYn8dkOsr
	8QYg==
X-Received: by 10.15.49.193 with SMTP id j41mr1476918eew.10.1389954001300;
	Fri, 17 Jan 2014 02:20:01 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id l4sm25516258een.13.2014.01.17.02.19.59
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Jan 2014 02:20:00 -0800 (PST)
Date: Fri, 17 Jan 2014 11:20:23 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Message-ID: <20140117102023.GL3742@jama>
References: <cover.1389941136.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1389941136.git.Qi.Chen@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] systemd misc fixes
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
X-List-Received-Date: Fri, 17 Jan 2014 10:20:01 -0000
X-Groupsio-MsgNum: 49110
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="00sTfE/IIAT5d2r5"
Content-Disposition: inline

--00sTfE/IIAT5d2r5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 17, 2014 at 02:46:33PM +0800, Chen Qi wrote:
> The following changes since commit cfd1520b4b492ab27b2900ba3510abe6f28809=
7e:
>=20
>   oe-selftest: separated the SStateBase and SStateTests in different modu=
les (2014-01-16 12:18:52 +0000)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib ChenQi/systemd-misc-fixes
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3DChenQi/systemd-=
misc-fixes

Can you send pull-request from oe-core?

> Chen Qi (5):
>   systemd: add 'less' to its RDEPENDS
>   dropbear: add systemd unit files
>   openssh: fixes for systemd
>   distcc: add systemd support
>   at: add systemd support

Thank you, openssh fix for sshd@.service in SYSTEMD_SERVICE was
requested since it was introduced, good to see the fix now.

Can you please send cleanup patches for meta-systemd after this patchset
is merged? Thanks

>  .../openssh/openssh-6.4p1/sshd.socket              |    1 -
>  .../openssh/openssh-6.4p1/sshd@.service            |    1 +
>  .../openssh/openssh-6.4p1/sshdgenkeys.service      |    8 ++++----
>  meta/recipes-connectivity/openssh/openssh_6.4p1.bb |    4 ++--
>  meta/recipes-core/dropbear/dropbear.inc            |   17 ++++++++++++++=
++-
>  .../recipes-core/dropbear/dropbear/dropbear.socket |   10 ++++++++++
>  .../dropbear/dropbear/dropbear@.service            |   11 +++++++++++
>  .../dropbear/dropbear/dropbearkey.service          |    8 ++++++++
>  meta/recipes-core/systemd/systemd_208.bb           |    3 ++-
>  meta/recipes-devtools/distcc/distcc_3.1.bb         |   14 +++++++++++---
>  meta/recipes-devtools/distcc/files/default         |    5 +++++
>  meta/recipes-devtools/distcc/files/distccd.service |   11 +++++++++++
>  meta/recipes-extended/at/at_3.1.14.bb              |   10 +++++++++-
>  meta/recipes-extended/at/files/atd.service         |    9 +++++++++
>  14 files changed, 99 insertions(+), 13 deletions(-)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear.socket
>  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbear@.service
>  create mode 100644 meta/recipes-core/dropbear/dropbear/dropbearkey.servi=
ce
>  create mode 100644 meta/recipes-devtools/distcc/files/distccd.service
>  create mode 100644 meta/recipes-extended/at/files/atd.service
>=20
> --=20
> 1.7.9.5
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--00sTfE/IIAT5d2r5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLZA+cACgkQN1Ujt2V2gBzTVQCfTV/abVWNUWT1VbBaktoYZpIb
+3oAnRgY0vO7XayhWIiQzXGtI8kN5VPC
=c+8J
-----END PGP SIGNATURE-----

--00sTfE/IIAT5d2r5--
