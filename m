Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RVpUX-0000cJ-Bf
	for openembedded-core@lists.openembedded.org;
	Wed, 30 Nov 2011 20:06:49 +0100
Received: by eaad13 with SMTP id d13so1103391eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 11:00:09 -0800 (PST)
Received: by 10.213.25.218 with SMTP id a26mr38414ebc.118.1322679608826;
	Wed, 30 Nov 2011 11:00:08 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q28sm9027537eea.6.2011.11.30.11.00.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 11:00:07 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Wed, 30 Nov 2011 20:00:04 +0100
In-Reply-To: <f4875734cee458b3cd8b5bd49f66d48a71848c8f.1322607016.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1322607016.git.sgw@linux.intel.com>
	<f4875734cee458b3cd8b5bd49f66d48a71848c8f.1322607016.git.sgw@linux.intel.com>
Message-Id: <4A8511FE-FB52-4494-BB8D-96E81A8CD8B0@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 17/26] gdbm: Update to 1.10
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
X-List-Received-Date: Wed, 30 Nov 2011 19:06:49 -0000
X-Groupsio-MsgNum: 13313
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7021BC7B-53D0-4E63-814F-9FADD6CB99C8";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7021BC7B-53D0-4E63-814F-9FADD6CB99C8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 30 nov. 2011, om 00:00 heeft Saul Wold het volgende geschreven:

> * This version is now GPLv3, so keep older version
> * The patches are not needed for this version
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

This triggers:

|  * satisfy_dependencies_for: Cannot satisfy the following dependencies =
for task-sdk-target:
|  *    libgdbm3 (>=3D 1.8.3) *

in deploy:

koen@dominion:/OE/tentacle$ ls =
build/tmp-angstrom_2010_x-eglibc/deploy/ipk/armv7a/ | grep gdbm
gdbm_1.10-r0_armv7a.ipk
gdbm-dbg_1.10-r0_armv7a.ipk
gdbm-dev_1.10-r0_armv7a.ipk
gdbm-doc_1.10-r0_armv7a.ipk
gdbm-locale-de_1.10-r0_armv7a.ipk
gdbm-locale-fi_1.10-r0_armv7a.ipk
gdbm-locale-ja_1.10-r0_armv7a.ipk
gdbm-locale-pl_1.10-r0_armv7a.ipk
gdbm-locale-uk_1.10-r0_armv7a.ipk
gdbm-staticdev_1.10-r0_armv7a.ipk
perl-module-gdbm-file_5.14.2-r0_armv7a.ipk
python-gdbm_2.7.2-r0.3_armv7a.ipk

I'll have a look and hopefully send a patch shortly=

--Apple-Mail=_7021BC7B-53D0-4E63-814F-9FADD6CB99C8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7WfTcACgkQMkyGM64RGpF5NgCgkGSM4+qiflC8z7WchwKtwKQC
GLIAn1wuvsZrMYff36pTCdMHx01UGFt/
=kBCb
-----END PGP SIGNATURE-----

--Apple-Mail=_7021BC7B-53D0-4E63-814F-9FADD6CB99C8--
