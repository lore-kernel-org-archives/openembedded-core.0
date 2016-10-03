Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DC2FB719D3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 19:25:48 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 03 Oct 2016 12:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,291,1473145200"; d="scan'208";a="15851787"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.185.151])
	by orsmga005.jf.intel.com with ESMTP; 03 Oct 2016 12:25:48 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 04 Oct 2016 08:25:45 +1300
Message-ID: <10109248.sKfs07qT7T@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <1475522247-9924-1-git-send-email-anibal.limon@linux.intel.com>
References: <1475522247-9924-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [PATCH] db: Remove unneeded PR
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
X-List-Received-Date: Mon, 03 Oct 2016 19:25:49 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Mon, 03 Oct 2016 14:17:27 An=EDbal Lim=F3n wrote:
> The PR is not need so remove it after upgrade to 6.0.35.
>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/recipes-support/db/db_6.0.35.bb | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/meta/recipes-support/db/db_6.0.35.bb
> b/meta/recipes-support/db/db_6.0.35.bb index 32afbe8..ecb1bee 100644
> --- a/meta/recipes-support/db/db_6.0.35.bb
> +++ b/meta/recipes-support/db/db_6.0.35.bb
> @@ -15,8 +15,6 @@ LICENSE =3D "AGPL-3.0"
>  VIRTUAL_NAME ?=3D "virtual/db"
>  RCONFLICTS_${PN} =3D "db3"
>=20
> -PR =3D "r1"
> -
>  # Note, when upgraded to 6.1.x, a patch in RPM will need to be remov=
ed to
> activate db 6.1 support. SRC_URI =3D
> "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
> file://arm-thumb-mutex_db5.patch \

I think it's too late to do this unfortunately - it needs to be done at=
 the=20
same time as the upgrade.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

