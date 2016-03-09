Return-Path: <anibal.limon@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 587BE60721
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 20:54:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 09 Mar 2016 12:54:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,312,1455004800"; 
	d="asc'?scan'208";a="761174680"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.54]) ([10.219.5.54])
	by orsmga003.jf.intel.com with ESMTP; 09 Mar 2016 12:54:31 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
	<CAJTo0LYeOMKtvdZb2_Nc55Ti+mrbsjFdOEem-mAC+5N5gVt0fQ@mail.gmail.com>
	<56E08BEB.1000501@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <56E08D90.1090802@linux.intel.com>
Date: Wed, 9 Mar 2016 14:54:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <56E08BEB.1000501@linux.intel.com>
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
X-List-Received-Date: Wed, 09 Mar 2016 20:54:31 -0000
X-Groupsio-MsgNum: 79343
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="D0ejLBLHN0hQo7ljwdS2INQlDu0cI1jGk"

--D0ejLBLHN0hQo7ljwdS2INQlDu0cI1jGk
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 03/09/2016 02:47 PM, An=EDbal Lim=F3n wrote:
>=20
>=20
> On 03/09/2016 02:33 PM, Burton, Ross wrote:
>> On 9 March 2016 at 18:19, Ricardo Ribalda Delgado <ricardo.ribalda@gma=
il.com
>>> wrote:
>>
>>> +                        bb.warn("Package %s rdepends on itself. Igno=
ring
>>> this dependency" % pkg)
>>>
>>
>> Depending on yourself seems wrong no matter what packaging backend you=
're
>> using, even if it isn't fatal.  Maybe this should be added to the gene=
ral
>> sanity checks in insane.bbclass?
>=20
> I agree that this situation could happen in other package management
> backends, i don't now if at insane class level we could access the
> dependency tree of the recipes/packages, i like the idea for more
> general mechanism.

I forget to mention will be good if also handle circular dependencies
between recipe/packages. A time ago i added this support on postinst
scripts in package_{deb,ipk} [1].

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/meta/lib/oe?id=3Db2=
c9e7347acdfd0efe1c3dabb853d609233b61b6



>=20
>     alimon
>=20
>=20
>>
>> Ross
>>
>=20
>=20
>=20


--D0ejLBLHN0hQo7ljwdS2INQlDu0cI1jGk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJW4I2TAAoJEGJqcE9h3glg3uwP/AhmsROagsHnC9I2ihw2yGxH
diheCdqaAfhb1I4vBXgEL+zWVk6xyRPHX4sYCSYdOyw2y5D/FQJPBfubNAVrxMkR
3iODxf6SZXBrJ9LjkHl6IxNT0xXF6pboR0Py9JtOa2lu01vXlU0dnxbKbEUOKtqH
H++hLyhAWRGI0yQ7B9tH4TyvJL55LAnzieCfFONNgF5ytX46C23d/Nt0XHTLw+DL
7Gpx9hJeeIfGbZV8g/ZBjVJYJmCGummHz9WlbmTEk6+aQb8N3/bU43PAcd2j16JA
2pZ9iOreBcnJv+s1EnghUUI6bJC7paDEdQsthOP3KkEsnCgq52zXOtC+5i/8lgiy
uPTtT+ji/hXTLq2lBjmOBvQ5eg384U10+PT3ReVtErkDBcS7lWuQtSpzawQk0zH2
QafzoYUTy5qsYqN83tZ03/J+fp/qjvrDy3SSz//5cGYmu+jkNLiKI+bKIRGtmBAO
NDg9kbPrldjerYbTvhykxRSoDG/NXoN/hO55kaGAFvC4CJqbYJri8bWYs55zcrsQ
kcAn5xAHLBrn/QhgwKT0YfmG9qNx8ulhK9HDdLThMFHM6HMpIjjufx82lA9WcK4u
3uXQCSrPiWEZdEm6qRsI8N16KsDpmOxCHxO8CAt9jqTwVH/LdLM6z72NgBvbDHnw
lTjcKtBVb/Z7UOFORM28
=YXRG
-----END PGP SIGNATURE-----

--D0ejLBLHN0hQo7ljwdS2INQlDu0cI1jGk--
