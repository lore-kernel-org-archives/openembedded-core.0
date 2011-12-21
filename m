Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RdMBX-00017s-2c
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Dec 2011 14:26:19 +0100
Received: by wibhq7 with SMTP id hq7so1969823wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Dec 2011 05:19:13 -0800 (PST)
Received: by 10.180.88.10 with SMTP id bc10mr14324859wib.13.1324473553579;
	Wed, 21 Dec 2011 05:19:13 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 1sm13418571wiz.11.2011.12.21.05.19.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 21 Dec 2011 05:19:12 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111221100909.GD12791@jama.jama.net>
Date: Wed, 21 Dec 2011 14:19:08 +0100
Message-Id: <F499A5D5-2BC5-45CC-8DF0-ABD5146E1897@dominion.thruhere.net>
References: <cover.1324456294.git.dvhart@linux.intel.com>
	<2ad76233b10f9e4a61a6ecb5490f92fecdc1f1e1.1324456294.git.dvhart@linux.intel.com>
	<20111221100909.GD12791@jama.jama.net>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: Yocto Project <yocto@yoctoproject.org>,
	Darren Hart <dvhart@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [PATCH 5/9] task-core-boot: Allow DISTRO to disable keymaps
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
X-List-Received-Date: Wed, 21 Dec 2011 13:26:19 -0000
X-Groupsio-MsgNum: 14574
Content-Type: multipart/signed;
	boundary="Apple-Mail=_42064903-0414-4CB0-A829-73ECA91E422A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_42064903-0414-4CB0-A829-73ECA91E422A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 21 dec. 2011, om 11:09 heeft Martin Jansa het volgende geschreven:

> On Wed, Dec 21, 2011 at 01:02:51AM -0800, Darren Hart wrote:
>> NOTE: I'm looking for a better way to do this.
>>=20
>> keymaps pulls in gettext, which can't build without wide character =
support.
>>=20
>> Rather than have to add a -tiny variant of every MACHINE to drop =
"keyboard" from
>> the MACHINE_FEATURES, just enable the DISTRO to define what gets =
added to
>> RDEPENDS_task-core-boot when MACHINE_FEATURES includes keyboard. By =
default,
>> keep "keymaps", but use DISTRO_KEYMAPS if it is set (to "" for =
example).
>>=20
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> ---
>> meta/recipes-core/tasks/task-core-boot.bb |    7 ++++++-
>> 1 files changed, 6 insertions(+), 1 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/tasks/task-core-boot.bb =
b/meta/recipes-core/tasks/task-core-boot.bb
>> index 05c280d..e097836 100644
>> --- a/meta/recipes-core/tasks/task-core-boot.bb
>> +++ b/meta/recipes-core/tasks/task-core-boot.bb
>> @@ -17,6 +17,11 @@ PR =3D "r9"
>> MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?=3D ""
>> MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS ?=3D ""
>>=20
>> +#
>> +# Set by the distro configuration to empty if not supported
>> +#
>> +DISTRO_KEYMAPS ?=3D "keymaps"
>=20
> Why not VIRTUAL-RUNTIME_keymaps like everywhere else?

Why not just create a proper task for -tiny instead of making the =
already horrible task-core-boot even more horrible?

Besided that: this patch needs to go to the oe-core list

regards,

Koen=

--Apple-Mail=_42064903-0414-4CB0-A829-73ECA91E422A
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7x3M4ACgkQMkyGM64RGpGFzwCfcFktO3ieJUryhkrJobmB96rS
4b0Anjv2L3BIMg/F94/UbHh+G/4qKMKb
=RYRi
-----END PGP SIGNATURE-----

--Apple-Mail=_42064903-0414-4CB0-A829-73ECA91E422A--
