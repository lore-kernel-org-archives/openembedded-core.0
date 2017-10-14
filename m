Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7A96076F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 06:11:01 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Oct 2017 23:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,374,1503385200"; d="scan'208";a="146373769"
Received: from opatki-mobl.amr.corp.intel.com ([10.254.56.3])
	by orsmga002.jf.intel.com with ESMTP; 13 Oct 2017 23:11:02 -0700
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
From: Tim Orling <timothy.t.orling@linux.intel.com>
In-Reply-To: <1507893281-22628-1-git-send-email-pascal.bach@siemens.com>
Date: Fri, 13 Oct 2017 23:11:02 -0700
Message-Id: <3800C28F-F649-4710-9B5B-B38E3E63CB53@linux.intel.com>
References: <1507893281-22628-1-git-send-email-pascal.bach@siemens.com>
To: Pascal Bach <pascal.bach@siemens.com>
X-Mailer: Apple Mail (2.3273)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bmap-tools: add missing runtime dependencies
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
X-List-Received-Date: Sat, 14 Oct 2017 06:11:02 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Oct 13, 2017, at 4:14 AM, Pascal Bach <pascal.bach@siemens.com> =
wrote:
>=20
> When running bmap on a target device the added dependncies are =
required.
>=20
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
> meta/recipes-support/bmap-tools/bmap-tools_3.4.bb | 12 +++++++++++-
> 1 file changed, 11 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb =
b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
> index 7454f9d..348c9e8 100644
> --- a/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
> +++ b/meta/recipes-support/bmap-tools/bmap-tools_3.4.bb
> @@ -14,7 +14,17 @@ SRCREV =3D =
"9dad724104df265442226972a1e310813f9ffcba"
>=20
> S =3D "${WORKDIR}/git"
>=20
> -RDEPENDS_${PN} =3D "python-core python-compression python-mmap"
> +RDEPENDS_${PN} =3D "\
> +    python-core \
> +    python-compression \
> +    python-argparse \
> +    python-shell \
> +    python-fcntl \
> +    python-threading \
> +    python-xml \
> +    python-subprocess \
> +    python-mmap \
> +    =E2=80=9C
>=20

These should all be the python3- version or ${PYTHON_PN}- (e.g. =
python3-core) should they not? Or is that an artifact of how the python =
module splitting is happening in oe-core?

> inherit python3native
> inherit setuptools3
> --=20
> 2.1.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


