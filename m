Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id C898062176
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 11:02:28 +0000 (UTC)
Received: by mail-ea0-f178.google.com with SMTP id d10so2040071eaj.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jan 2014 03:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=e0FDRYnK9KhaONjrboFTNXpOgLj7jrDaJlucZBdf7IU=;
	b=nMzLabWvBqa4bojTe6C5zHFW/YkzwaEnbKuFnBHseytBirUpDaaKLumc9cyivyc4UZ
	lj7RzwYakN8WV10JMHraG7ML63FlmLKfLL2A45t4wRlS8kOXSsACRyns2bJT745kGZGK
	C8EAb3d73GV8CsZdsVApFftVEXSND2hnFcQaUhMRteFJ6+J1tTh5p+2x5fUZjyU02n2Z
	VOU4iWW0aN093ZjeUSU0KP0QFuwEk8K4aF/c5hY+/1Y0opAvID3v2tKwICwqLF4Eh/dJ
	97osIe0xw9cZ2sdDDns8Tr1ti311hNd495WT21QCOhgXdqYwqLkdQh56WIcblyNkz5Vu
	w9Uw==
X-Received: by 10.15.26.200 with SMTP id n48mr9189478eeu.46.1389351749418;
	Fri, 10 Jan 2014 03:02:29 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id p45sm13555368eeg.1.2014.01.10.03.02.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 10 Jan 2014 03:02:28 -0800 (PST)
Date: Fri, 10 Jan 2014 12:02:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <20140110110241.GP3709@jama>
References: <cover.1389003637.git.Martin.Jansa@gmail.com>
	<52CF90CB.3010300@windriver.com>
MIME-Version: 1.0
In-Reply-To: <52CF90CB.3010300@windriver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dora][PATCH 0/2] Dora backports
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
X-List-Received-Date: Fri, 10 Jan 2014 11:02:30 -0000
X-Groupsio-MsgNum: 48819
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h3DE4SGaK/gJt4Z8"
Content-Disposition: inline

--h3DE4SGaK/gJt4Z8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2014 at 02:18:51PM +0800, Robert Yang wrote:
>=20
> Hi Martin,
>=20
> Thanks, please see my comments in line.
>=20
> On 01/06/2014 06:21 PM, Martin Jansa wrote:
> > The following changes since commit e86622a932bbd0acdea67ecfb15c8b06c273=
53d8:
> >
> >    libsoup-2.4: add intltool-native to DEPENDS (2013-12-19 14:59:47 +00=
00)
> >
> > are available in the git repository at:
> >
> >    git://git.openembedded.org/openembedded-core-contrib jansa/dora-back=
ports2
> >    http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/=
?h=3Djansa/dora-backports2
> >
> > Martin Jansa (1):
> >    ltp: set PREFERRED_PROVIDER and rename runtests_noltp.sh script
> >
>=20
> I will take this.
>=20
> > Richard Purdie (1):
> >    eglibc-initial.inc: Drop duplicate include
> >
>=20
>=20
> It seems that this is a trivial fix, I don't think it's a good idea to me=
rge
> it to dora.

And the warning shown in every dora build since
http://git.openembedded.org/bitbake/commit/?h=3D1.20&id=3D22e6b1c4c4afb2705=
7689bbc94cbdf1f19f93e3d
isn't important enough reason to merge it?

>=20
> // Robert
>=20
> >   meta/conf/distro/include/default-providers.inc     |   2 +
> >   meta/recipes-core/eglibc/eglibc-initial.inc        |   2 -
> >   ...tests_noltp.sh-script-so-have-unique-name.patch | 202 ++++++++++++=
+++++++++
> >   meta/recipes-extended/ltp/ltp_20130503.bb          |   4 +-
> >   4 files changed, 207 insertions(+), 3 deletions(-)
> >   create mode 100644 meta/recipes-extended/ltp/ltp/0001-Rename-runtests=
_noltp.sh-script-so-have-unique-name.patch
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--h3DE4SGaK/gJt4Z8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLP01EACgkQN1Ujt2V2gBx7CgCfazum4B/56G1q1hHvdTVmNh6z
HQ8AnjAwSGl316vfJv2ezBTtPrm/OhLs
=eQwM
-----END PGP SIGNATURE-----

--h3DE4SGaK/gJt4Z8--
