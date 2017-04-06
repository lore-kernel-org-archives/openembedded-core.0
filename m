Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4176977A36
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Apr 2017 16:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491495695; x=1523031695;
	h=subject:to:references:cc:from:message-id:date:
	mime-version:in-reply-to;
	bh=A/Tyn13yKNrSU5s13nLlCahAvlGnQCBgwSbHC3Wk8kM=;
	b=jW2swDmIZ6vzgkM6m0/+fWTiaIsXafNq5dcMG3tPgLAI+8c+byxDSAKv
	NtvHZ8piTPddbAsyGy3wtxLvmRRVCA==;
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Apr 2017 09:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,160,1488873600"; 
	d="asc'?scan'208";a="85826454"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.124])
	([10.219.128.124])
	by fmsmga006.fm.intel.com with ESMTP; 06 Apr 2017 09:21:33 -0700
To: Patrick Ohly <patrick.ohly@intel.com>,
	openembedded-core@lists.openembedded.org
References: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <58E66C01.6010005@linux.intel.com>
Date: Thu, 6 Apr 2017 11:25:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <cover.3970fab18c2598adf378d62e8fcba4ca004fbd13.1491399200.git-series.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: Re: [PATCH 0/3] yocto-compat-layer: various enhancements + bitbake-diffsigs support
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
X-List-Received-Date: Thu, 06 Apr 2017 16:21:33 -0000
X-Groupsio-MsgNum: 95903
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="As9R95eAabOoglSnGX5B7D6LBk7Jd93m6"

--As9R95eAabOoglSnGX5B7D6LBk7Jd93m6
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Acked-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>

On 04/05/2017 08:36 AM, Patrick Ohly wrote:
> I started applying yocto-compat-layer to some real BSP layers and ran
> into some usability issues with the tool.
>=20
> I also didn't want to do the root cause analysis manually, so I
> automated the dependency analysis and the running of
> bitbake-diffsigs.
>=20
> This patch series is based on Mark's "yocto-compat-layer.py updates"
> series. The last commit depends on Paul's "bitbake-diffsigs: add an
> option to find and compare specific signatures" patch from
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/commit/?h=3Dpaul=
e/sigstuff&id=3D5bb69edfb4bbaa7373061daeb4f233a7e2f43a43
>=20
> Regarding the BSP example that I ended up using: it actually was one
> of the better BSP layers and only had one problem in a "bitbake world"
> build instead of several as in other BSP layers. Nevertheless I
> obscured the name to protect the (not so) guilty in the commit
> messages ;-}
>=20
> The two changes that show up in test_signatures look harmless at first
> glance, but probably would need to be done differently to avoid a
> false positive when doing the signature check.
>=20
> Patrick Ohly (3):
>   yocto-compat-layer: fix also other command invocations
>   yocto-compat-layer: limit report of signature changes
>   yocto-compat-layer: include bitbake-diffsigs output
>=20
>  scripts/lib/compatlayer/__init__.py     | 55 +++++++++++++---
>  scripts/lib/compatlayer/cases/common.py | 87 ++++++++++++++++---------=
-
>  2 files changed, 103 insertions(+), 39 deletions(-)
>=20
> base-commit: f6b68a87a11a84c7baf7784fc71e07c6595d598b
>=20


--As9R95eAabOoglSnGX5B7D6LBk7Jd93m6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJY5mwDAAoJEGJqcE9h3glgZfcP/iHPlvSJrDLe2NMsGvW3GMp4
NiMrJ2WdtPqCIgeaVY4mtJ2ZvYDAPwoKHO1GIbo9fKak5CEjeO4No7UdIZPymA6W
UUCyu3dgyKcz1BhKYIpxlyvzL3XEp8E1KnPeWV/4JHplS4HMD8PMJFCF+fN/9Rck
sM9/JQAn6drQP7VycTjTzEQ4+ijwxeKwLLWnbfnSarIc0MLIWCiczKaaG6Sa3P24
m2Y39ZcP317g4QNFivs5Gy5gS2DjvB5bH/N/WKKaH+uxfV550z2dlb5JngUtsihk
+PDKaY8XySfOi/bkGrntDe6KquBdibOy4jgi33ZnrYnlMn1aak17kyiBWtddHydO
ptjQdb1bdMbxX54KUiviG6qW9MnDyV9qbtOuDMYx50xuqyRDIpYOimK937lqdDJf
DcteOEWQzrn9JNLOFxcg/l6cRsmIJv4nHMMQ5ef19XJDeDkDnWsTgeKBMaXFdyPI
5vshMAvXB4G7fq8/2Rli1vN5G0uTDFYcpLlb2JhTvWbeXuIDx/2oG9tcGJ+ieBnk
ISo6d7nSMyyW/LU2adcONv6/vVcjkqSVvYY15Ib3bEtmHVdSJhAwunzS4t2AyZgr
SU8zoZeJojb+4PUCbIOUzhgWxOap+Itgv64umcInvXACxWzU66jK3llrp89G0XkF
aWzpAqbX9r4G7ZKGOs+y
=T6VS
-----END PGP SIGNATURE-----

--As9R95eAabOoglSnGX5B7D6LBk7Jd93m6--
