Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D993A785CC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 23:37:15 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 15:37:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,430,1505804400"; 
   d="scan'208";a="4588976"
Received: from ttorling-mac01.jf.intel.com ([10.24.15.25])
	by orsmga003.jf.intel.com with ESMTP; 20 Nov 2017 15:37:17 -0800
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <d84f38f0603080318e5ad61926da813be90d25ba.1511179969.git.markus.lehtonen@linux.intel.com>
Date: Mon, 20 Nov 2017 15:37:18 -0800
Message-Id: <1340244A-99EC-41D5-B6DB-4D1805583B3B@linux.intel.com>
References: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
	<cover.1509094533.git.markus.lehtonen@linux.intel.com>
	<cover.1511179969.git.markus.lehtonen@linux.intel.com>
	<d84f38f0603080318e5ad61926da813be90d25ba.1511179969.git.markus.lehtonen@linux.intel.com>
To: Markus Lehtonen <markus.lehtonen@linux.intel.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v6 02/15] python3: fix depends of python3-tests
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
X-List-Received-Date: Mon, 20 Nov 2017 23:37:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

The top of the manifest file says that it is auto generated [1], this =
change must also be done in =
scripts/contrib/python/generate-manifest-3.5.py [2]:

[1] =
http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/p=
ython/python-3.5-manifest.inc#n1
[2] =
http://git.openembedded.org/openembedded-core/tree/scripts/contrib/python/=
generate-manifest-3.5.py

Nacked-by: Tim Orling <timothy.t.orling@linux.intel.com>

> On Nov 20, 2017, at 4:15 AM, Markus Lehtonen =
<markus.lehtonen@linux.intel.com> wrote:
>=20
> Similar to an earlier fix for Python 2.7. Make the tests subpackage
> depend on all modules as test.regrtest uses most (if not all) of them.
>=20
> Some tests also depend on libgcc so add that as a runtime dependency =
as
> well.
>=20
> [YOCTO #9338]
>=20
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
> meta/recipes-devtools/python/python-3.5-manifest.inc | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/python/python-3.5-manifest.inc =
b/meta/recipes-devtools/python/python-3.5-manifest.inc
> index 0260e87e75..067f6c58c5 100644
> --- a/meta/recipes-devtools/python/python-3.5-manifest.inc
> +++ b/meta/recipes-devtools/python/python-3.5-manifest.inc
> @@ -241,7 +241,7 @@ RDEPENDS_${PN}-terminal=3D"${PN}-core ${PN}-io"
> FILES_${PN}-terminal=3D"${libdir}/python3.5/pty.* =
${libdir}/python3.5/__pycache__/pty.* ${libdir}/python3.5/tty.* =
${libdir}/python3.5/__pycache__/tty.* "
>=20
> SUMMARY_${PN}-tests=3D"Python tests"
> -RDEPENDS_${PN}-tests=3D"${PN}-core ${PN}-compression"
> +RDEPENDS_${PN}-tests=3D"${PN}-core ${PN}-modules libgcc"
> FILES_${PN}-tests=3D"${libdir}/python3.5/test =
${libdir}/python3.5/test/__pycache__ "
>=20
> SUMMARY_${PN}-textutils=3D"Python option parsing, text wrapping and =
CSV support"
> --=20
> 2.13.6
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


