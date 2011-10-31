Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RKuSf-0007Gm-Da
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Oct 2011 17:11:45 +0100
Received: by wyh5 with SMTP id 5so1329021wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2011 09:05:37 -0700 (PDT)
Received: by 10.227.58.18 with SMTP id e18mr18767786wbh.23.1320077137050;
	Mon, 31 Oct 2011 09:05:37 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fy21sm15837203wbb.5.2011.10.31.09.05.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 31 Oct 2011 09:05:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EAEC2CE.400@intel.com>
Date: Mon, 31 Oct 2011 17:05:24 +0100
Message-Id: <246C79CF-C5FA-4F86-AEEA-7734181C0594@dominion.thruhere.net>
References: <cover.1319576293.git.scott.a.garman@intel.com>
	<62b3eae763911554ab01754726ed7adacad1a8a4.1319576293.git.scott.a.garman@intel.com>
	<4EA86F93.4080407@intel.com>
	<201110310908.45138.paul.eggleton@linux.intel.com>
	<4EAEC2CE.400@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH 5/5] distro_tracking_fields: updates for sudo, mtools, grep, and openssh
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
X-List-Received-Date: Mon, 31 Oct 2011 16:11:45 -0000
X-Groupsio-MsgNum: 11694
Content-Type: multipart/signed;
	boundary="Apple-Mail=_C0E4FC82-6AA5-4C84-A691-B1453AE2AB04";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_C0E4FC82-6AA5-4C84-A691-B1453AE2AB04
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 31 okt. 2011, om 16:46 heeft Saul Wold het volgende geschreven:

> On 10/31/2011 02:08 AM, Paul Eggleton wrote:
>> On Wednesday 26 October 2011 21:37:39 Saul Wold wrote:
>>>> -RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo =3D "1 month"
>>>> -RECIPE_LATEST_RELEASE_DATE_pn-sudo =3D "2011/05/16"
>>>> +RECIPE_TIME_BETWEEN_LAST_TWO_RELEASES_pn-sudo =3D "2 months"
>>>> +RECIPE_LATEST_RELEASE_DATE_pn-sudo =3D "2011/10/21"
>>>=20
>>> These date formats should be MMM DD, YYYY also, for all the data =
listed
>>> below also.
>>=20
>> I'd been meaning to ask this before - is there a good reason for not =
being
>> consistent and using the same format for all date fields in this =
file?
>>=20
> Maybe I am missing your comment, is that what I not suggested in my =
comment above?  All date formats in the distro_tracking_fields should be =
in the MMM DD, YYY format.

Can we please use a format that makes sense for non-americans as well? =
E.g. YYYY/MM/DD or DD/MM/YYYY or plain ISO (2011-10-31T17:04:31+01:00) =
without the hours? Anything that doesn't put days in between months and =
year.

regards,

KOen=

--Apple-Mail=_C0E4FC82-6AA5-4C84-A691-B1453AE2AB04
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6ux0oACgkQMkyGM64RGpG61wCfe69UhJWXSHoH98YmMNdjwqFO
7rEAoKLhUodL3XV3pY2jqpk0tmCJiOhT
=P8zn
-----END PGP SIGNATURE-----

--Apple-Mail=_C0E4FC82-6AA5-4C84-A691-B1453AE2AB04--
