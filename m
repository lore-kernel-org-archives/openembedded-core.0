Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0966E719A9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 19:51:45 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 03 Oct 2016 12:51:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,291,1473145200"; d="scan'208";a="1039817440"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.185.151])
	by orsmga001.jf.intel.com with ESMTP; 03 Oct 2016 12:51:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Tue, 04 Oct 2016 08:51:41 +1300
Message-ID: <36891035.aKHUtvPbzX@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.5-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <57F2B1C7.4070305@linux.intel.com>
References: <1475522247-9924-1-git-send-email-anibal.limon@linux.intel.com>
	<10109248.sKfs07qT7T@peggleto-mobl.ger.corp.intel.com>
	<57F2B1C7.4070305@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 03 Oct 2016 19:51:46 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Mon, 03 Oct 2016 14:30:15 An=EDbal Lim=F3n wrote:
> On 10/03/2016 02:25 PM, Paul Eggleton wrote:
> > On Mon, 03 Oct 2016 14:17:27 An=EDbal Lim=F3n wrote:
> >> The PR is not need so remove it after upgrade to 6.0.35.
> >>=20
> >> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> >> ---
> >>=20
> >>  meta/recipes-support/db/db_6.0.35.bb | 2 --
> >>  1 file changed, 2 deletions(-)
> >>=20
> >> diff --git a/meta/recipes-support/db/db_6.0.35.bb
> >> b/meta/recipes-support/db/db_6.0.35.bb index 32afbe8..ecb1bee 1006=
44
> >> --- a/meta/recipes-support/db/db_6.0.35.bb
> >> +++ b/meta/recipes-support/db/db_6.0.35.bb
> >> @@ -15,8 +15,6 @@ LICENSE =3D "AGPL-3.0"
> >>=20
> >>  VIRTUAL_NAME ?=3D "virtual/db"
> >>  RCONFLICTS_${PN} =3D "db3"
> >>=20
> >> -PR =3D "r1"
> >> -
> >>=20
> >>  # Note, when upgraded to 6.1.x, a patch in RPM will need to be re=
moved
> >>  to
> >>=20
> >> activate db 6.1 support. SRC_URI =3D
> >> "http://distfiles.gentoo.org/distfiles/db-${PV}.tar.gz \
> >> file://arm-thumb-mutex_db5.patch \
> >=20
> > I think it's too late to do this unfortunately - it needs to be don=
e at
> > the
> > same time as the upgrade.
>=20
> I sent a PATCHv3 [1] removing the PR but unfortunately was not integr=
ated.
>=20
> [1]
> http://lists.openembedded.org/pipermail/openembedded-core/2016-Septem=
ber/127
> 027.html

Understood - for most other changes we'd want to have a follow-up patch=
 to=20
apply what's missing, but for PR it's still too late - the r1 value is =
already=20
merged and packages could have been built from it. Decreasing PR now wi=
ll make=20
the version number go backwards which we want to avoid.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

