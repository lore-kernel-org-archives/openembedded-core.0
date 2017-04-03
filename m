Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4392577A2E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Apr 2017 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491245974; x=1522781974;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=aJIKoCgVufyRXk9CWpbtSdf3dxc2VwbhirLm6sudYQI=;
	b=VAhuOju3H/wLifezkP025rWKe+cszOUlFtsIo3beO/l+PJTTx1lSFLQm
	E8Ae5HFON3dAc4Zq04e41Bh5ogv8AQ==;
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Apr 2017 11:59:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,271,1486454400"; 
	d="asc'?scan'208";a="1130416600"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.124])
	([10.219.128.124])
	by fmsmga001.fm.intel.com with ESMTP; 03 Apr 2017 11:59:31 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58E29C81.4010607@linux.intel.com>
Date: Mon, 3 Apr 2017 14:03:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1490927429-48266-1-git-send-email-mark.hatle@windriver.com>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 0/4] yocto-compat-layer.py updates
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
X-List-Received-Date: Mon, 03 Apr 2017 18:59:32 -0000
X-Groupsio-MsgNum: 95721
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="a8hXacj7Jgl2xQkTgBw4Hqm9qIqGK7XQs"

--a8hXacj7Jgl2xQkTgBw4Hqm9qIqGK7XQs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>

On 03/30/2017 08:30 PM, Mark Hatle wrote:
> The changes in this series fix a number of issues with the yocto-compat=
-layer
> script.
>=20
> - When a layer is skipped due to missing dependencies, it was difficult=
 to
>   see this without inspecting the whole log.
>=20
> - There needs to be a way to pass in a list of layers that can be used
>   for dependencies, but should not be evaluated in this pass.  The over=
all
>   evaluation is very time consuming and having to parse/validate 15
>   dependent layers to see if the layer you are working on passes is not=

>   useful!
>=20
> - The dependency processing was not working properly.  It was only proc=
essing
>   dependencies at one level.  Move this to a recursive process so we're=

>   sure that all needed dependencies are present.
>=20
> - Change how the initial signatures are stored to be compared to the la=
yers
>   signatures for distro/BSP checks.  Before the signatures were stored =
very
>   early (before any dependencies were calculated), causing the dependen=
cies
>   for a BSP layer to trigger a failure in signature validation.
>=20
> Mark Hatle (4):
>   yocto-compat-layer.py: Add status for skipped items
>   yocto-compat-layer.py: Add --dependency argument
>   compatlayer/__init__.py: Allow add_layer to process recursive deps
>   yocto-compat-layer.py: Fix the signature validation
>=20
>  scripts/lib/compatlayer/__init__.py | 47 +++++++++++++++++++++++++++++=
+-------
>  scripts/yocto-compat-layer.py       | 47 +++++++++++++++++++++++++++--=
--------
>  2 files changed, 73 insertions(+), 21 deletions(-)
>=20


--a8hXacj7Jgl2xQkTgBw4Hqm9qIqGK7XQs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJY4pyIAAoJEGJqcE9h3glgEfYP/0o8Qq7PIe16Y7ojny9lEzeV
OJPXezKamU9EQLHI/inMPWfyCUPP7rK37M6YDXNVtJFRYbYooeGqYlWUsjEn16pS
3NQlhDHXbu+xkz8f+Fx8zwJu1niZOWaokoQYqPKJlQP8JoRFxRkX2F6uGRuYbbx1
jAjvrTpwwr3WuakAWHW3n6iQY8Jwjt5LjaLV4aCAgetAIfcfU6MZLikzWIKqBAIH
gKilKn99LaOIAyTZybCfPlaWIFtRUy37QFLc6LfCIirkbvBjKaMefXtrfJS1UeYv
3ZNcIjWfKlBml5oKrWdaAJExF3Ko5McY7x3BnA9X+fkZVXrrtshHWke8gk2oVCjN
HmN07e+Fhq9tFNnhBWtY8OQsA40/psR8zE56giwWoWt1OD6N/CiJ2oQ/UcuLbF3a
qiZcg7CG3/9kUSwPJudMgKlLE9P9ErE2AogOXrMo0a8zo+vb/SAY8G7jACy0wBoe
JC27ZplmF8WQ8rlxH+QoTkhG4DlBXX8y/3piwPo+i+39WUGeDj5p/uHGY3sXCtyR
RC/t1ZrCc6pE8gxVmb+HGt8JOhpPjD+HJ8+3w1w5sid61FdmiCeaJuzN8FfR/T9g
l1P9ymZJ0a7v4UjHjr6ofvDYwCrNtzU8CgBjz46i1MEWw5j+FeG0kzC/SUTkxGpP
uHryjz12a6EwV8EmSn7s
=nrxb
-----END PGP SIGNATURE-----

--a8hXacj7Jgl2xQkTgBw4Hqm9qIqGK7XQs--
