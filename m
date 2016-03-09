Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C82E360043
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 20:47:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 12:47:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,312,1455004800"; 
	d="asc'?scan'208";a="930414080"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by orsmga002.jf.intel.com with ESMTP; 09 Mar 2016 12:47:34 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56E08BEB.1000501@linux.intel.com>
Date: Wed, 9 Mar 2016 14:47:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 20:47:36 -0000
X-Groupsio-MsgNum: 79342
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="vMIpr6pvtP22nLcdDlBtqBt65bjHndt50"

--vMIpr6pvtP22nLcdDlBtqBt65bjHndt50
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 03/09/2016 02:33 PM, Burton, Ross wrote:
> On 9 March 2016 at 18:19, Ricardo Ribalda Delgado <ricardo.ribalda@gmai=
l.com
>> wrote:
>=20
>> +                        bb.warn("Package %s rdepends on itself. Ignor=
ing
>> this dependency" % pkg)
>>
>=20
> Depending on yourself seems wrong no matter what packaging backend you'=
re
> using, even if it isn't fatal.  Maybe this should be added to the gener=
al
> sanity checks in insane.bbclass?

I agree that this situation could happen in other package management
backends, i don't now if at insane class level we could access the
dependency tree of the recipes/packages, i like the idea for more
general mechanism.

    alimon


>=20
> Ross
>=20


--vMIpr6pvtP22nLcdDlBtqBt65bjHndt50
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJW4IvyAAoJEGJqcE9h3glgGRYP/1VVPl0S4WvT2ZT4QSJSEEDb
p2U7XgduyKFJapNlwlGv4PgvZFDncWFmobGBbArNssoeD2vgat7my0MMT1KLrlzU
/iIW8r20L32ANaF4ohz5qaJjJN9x7OuZCyM3W/j/q/WZnSGWPQ6cP0jwNxm5PeBX
iAg7j+fEnsZPpYz8y96Yw3vPsZGGHVOmqNOImoZH/whDKvt5jvqfJeCn/+g6IohL
q/lu9qBYSZO+WOPy78Cq3GNdh38F8bWh2wqAe1SDFxXhaZ0iFK7je/0w/olGfjbB
1mk/x2kZBKcFajpt1CAWHzJ2NJ7Z6NCxG1G/Qm2cdVtHmF6G1qZRieBqdCzIVe7w
Aiorvm9NWN0y9oDKYdfGkkDh1cOd1zdZUZmj1gJF6PSpxTTc6wzwab1R9YmZe7S3
nWjOOU/023EXVrUQWBwKrfm7nXgroD4NQloLmq/8YocJpmJPt78krZoXhlHV/KpC
DC4s3WXn5fBGLsaw8zs7v7+OaGFxXhdILb/C9LyBXF+uT00bI7xarGYkTGFgNtxg
GJoX0shC1LIAIGjfbhfIjFPLmlSXTRWi6gI+mFp3yKqYAyFqhS2D5Toixe8i4QxU
3CttRcXv+HkxsYUMHT9+npB4VIKmSfVe5+pOK+aRDZAQikBPVFXP8Ygsfv6G7+mQ
f1/1mS4TQQCJG2qLs2dP
=/GJp
-----END PGP SIGNATURE-----

--vMIpr6pvtP22nLcdDlBtqBt65bjHndt50--
