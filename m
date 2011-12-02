Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RWQ4T-00035L-Qa
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 11:10:21 +0100
Received: by eekc1 with SMTP id c1so1823623eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 02:03:39 -0800 (PST)
Received: by 10.14.9.164 with SMTP id 36mr1400682eet.33.1322820219010;
	Fri, 02 Dec 2011 02:03:39 -0800 (PST)
Received: from [172.20.1.19] (ip5451781a.direct-adsl.nl. [84.81.120.26])
	by mx.google.com with ESMTPS id z54sm26444154eeh.5.2011.12.02.02.03.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 02 Dec 2011 02:03:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Fri, 2 Dec 2011 11:03:34 +0100
In-Reply-To: <8cc5f124fb791a762bf6aace3a9bf8c1d1c39dd1.1322782677.git.paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322782677.git.paul.eggleton@linux.intel.com>
	<8cc5f124fb791a762bf6aace3a9bf8c1d1c39dd1.1322782677.git.paul.eggleton@linux.intel.com>
Message-Id: <7F3E05BB-DED9-441F-B557-4076C78DB63B@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [RFC PATCH 1/2] classes/buildhistory: add new output history collection class
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
X-List-Received-Date: Fri, 02 Dec 2011 10:10:22 -0000
X-Groupsio-MsgNum: 13547
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E8380C45-3A2B-4103-A7FC-92B40784B985";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E8380C45-3A2B-4103-A7FC-92B40784B985
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 2 dec. 2011, om 00:56 heeft Paul Eggleton het volgende geschreven:

> Create a new build output history reporting class, using =
testlab.bbclass
> from meta-oe as a base. This records information from images produced =
by
> the build process in text files structured suitably for tracking =
within
> a git repository, thus enabling monitoring of changes over time.
>=20
> Build history collection can be enabled simply by adding the following
> to your local.conf:
>=20
> INHERIT +=3D "buildhistory"
>=20
> The output after a build can then be found in BUILDHISTORY_DIR =
(defaults to
> TMPDIR/buildhistory). If you set up this directory as a git repository =
and
> set BUILDHISTORY_COMMIT to "1" in local.conf, the build history data =
will
> be committed on every build.
>=20
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/buildhistory.bbclass |  105 =
+++++++++++++++++++++++++++++++++++++
> meta/classes/rootfs_ipk.bbclass   |   27 +++++++++-
> meta/classes/rootfs_rpm.bbclass   |   41 +++++++++++++--
> 3 files changed, 167 insertions(+), 6 deletions(-)
> create mode 100644 meta/classes/buildhistory.bbclass
>=20
> diff --git a/meta/classes/buildhistory.bbclass =
b/meta/classes/buildhistory.bbclass
> new file mode 100644
> index 0000000..79a074c
> --- /dev/null
> +++ b/meta/classes/buildhistory.bbclass
> @@ -0,0 +1,105 @@
> +#
> +# Records history of build output in order to detect regressions
> +#
> +# Based in part on testlab.bbclass
> +#
> +# Copyright (C) 2011 Intel Corporation
> +# Copyright (C) 2007, 2008 Koen Kooi <koen@openembedded.org>

I know I forgot to update it, but that should be: 2007 - 2011

regards,

Koen=

--Apple-Mail=_E8380C45-3A2B-4103-A7FC-92B40784B985
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7YongACgkQMkyGM64RGpEuuACeKvCqU4cTOtKjh0dcypM7AyzP
BNwAn3uns2Wuceuty2Qn9iZphv6Gu7+N
=NeSD
-----END PGP SIGNATURE-----

--Apple-Mail=_E8380C45-3A2B-4103-A7FC-92B40784B985--
