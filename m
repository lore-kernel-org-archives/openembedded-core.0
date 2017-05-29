Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id DA69C780AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 16:15:46 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga104.jf.intel.com with ESMTP; 29 May 2017 09:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,415,1491289200"; 
	d="asc'?scan'208";a="107923191"
Received: from unknown (HELO [10.219.128.117]) ([10.219.128.117])
	by fmsmga005.fm.intel.com with ESMTP; 29 May 2017 09:15:47 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <592C4930.3080600@linux.intel.com>
Date: Mon, 29 May 2017 11:15:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: Re: [PATCH 0/6] yocto-compat-layer.py: various enhancements
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
X-List-Received-Date: Mon, 29 May 2017 16:15:47 -0000
X-Groupsio-MsgNum: 97887
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="Ws3QRT0A5DSk5gbfhp6FibGH8whNO3Dtt"

--Ws3QRT0A5DSk5gbfhp6FibGH8whNO3Dtt
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Most of the patches looks good, i only have comments on:

- yocto-compat-layer.py: apply test_signatures to all layers

For the rest:

Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>

Cheers,
Anibal

On 05/29/2017 10:32 AM, Patrick Ohly wrote:
> While enhancing the layer structure in intel-iot-refkit I ran into
> various cases where enhancements to the tool were
> necessary. intel-iot-refkit now has oe-selftests that check all layers
> using this tool. In addition, the signature checking utility code is
> imported into a custom test that also covers a refkit specific case
> (including refkit-config.inc must not change signatures).
>=20
> Patrick Ohly (6):
>   yocto-compat-layer.py: avoid adding layers more than once
>   yocto-compat-layer.py: tolerate broken world builds during signature =
diff
>   yocto-compat-layer.py: apply test_signatures to all layers
>   yocto-compat-layer.py: add test_world
>   yocto-compat-layer.py: allow README with suffix
>   yocto-compat-layer.py: make signature check code reusable
>=20
>  scripts/lib/compatlayer/__init__.py     | 90 +++++++++++++++++++++++++=
-
>  scripts/lib/compatlayer/cases/common.py | 91 ++++++-------------------=
-
>  2 files changed, 111 insertions(+), 70 deletions(-)
>=20
> base-commit: 598e5da5a2af2bd93ad890687dd32009e348fc85
>=20


--Ws3QRT0A5DSk5gbfhp6FibGH8whNO3Dtt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJZLEk4AAoJEGJqcE9h3glgbuMP/A0KXyJ7jzCWMothiFEBSUdo
vRUMqV0rbqSDkwv3NYVo2LAParyp3Ar7lfjdSqwy2KOebl7J8qVugqere25i5IKs
5T508nJwr6O2BxxLb3PWmUZLeM5sj+sC81zhloJb/9iSabvf4Yp/uW9yGee470EF
YSCrPBzgr0z+uP+lBvmaX5sJ1vpp65Oca1KHpIcvG7GaRKitsjpYbFmLMf8/DTTT
+QSGQTsJjIMHbZ5zu2dGqMfAbXM0y9xvA0zrPPdNfS8sr5zWaNuVvKhyfK2LlFok
qvmG+DxjpajNLQAc9tZciAvOruDXDdSXhwVXeHqemxrNXxn0EOd7EQygWsHu01Ds
znlWCfqAeRg//tAZKpwUW4dfHY+nHwN2xiK6m6TudMsGq91I9VWQylF1IUnFgFlg
LE6cVcduph02J3Xz+oC0/MyKhr+K3vkOxg9it9zIgRin88ODcMzetFlsddd86otv
QBBwMU07ZrQisNyNz+Syeu1c+o+l0YtQ1CSaRpLuyb20E4DcJ7eXXG6v8XKkjM7P
PZJQ5KMR9QA12claDQHkPwWv8NcT3yFOU82E6xTjvGY8cN/YtlqHs+bxOeB7YMQG
1MCuD6wsWItJf0p2j7Cr6cwrLrZtoOWjCMeNDomkg9Zg2qL6rpwnV+kzUPBm588a
qWNd+/aAGYM/368LLCY4
=nQJS
-----END PGP SIGNATURE-----

--Ws3QRT0A5DSk5gbfhp6FibGH8whNO3Dtt--
