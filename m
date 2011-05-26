Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1QPVTm-00022a-4s
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 09:59:38 +0200
Received: by gyf1 with SMTP id 1so193447gyf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 00:56:34 -0700 (PDT)
Received: by 10.236.153.130 with SMTP id f2mr686730yhk.281.1306396594049;
	Thu, 26 May 2011 00:56:34 -0700 (PDT)
Received: from [10.0.0.8] (ppp-69-148-48-26.dsl.hstntx.swbell.net
	[69.148.48.26])
	by mx.google.com with ESMTPS id s46sm718591yhm.39.2011.05.26.00.56.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 May 2011 00:56:33 -0700 (PDT)
References: <c83bebea4e1c4dd15422ad2cb75eab977cea4a59.1306385875.git.dvhart@linux.intel.com>
	<f29f5f7343d2b8b23b8ad25245efe9c205c8ca6e.1306385875.git.dvhart@linux.intel.com>
In-Reply-To: <f29f5f7343d2b8b23b8ad25245efe9c205c8ca6e.1306385875.git.dvhart@linux.intel.com>
Mime-Version: 1.0 (iPad Mail 8C148)
Message-Id: <6EC98D6A-BEF1-468A-A69B-7CBF4EAB28BA@beagleboard.org>
X-Mailer: iPad Mail (8C148)
From: Jason Kridner <jkridner@beagleboard.org>
Date: Thu, 26 May 2011 02:58:53 -0500
To: Darren Hart <dvhart@linux.intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [pull-oe-uboot 2/2] u-boot: rename u-boot_git.bb to u-boot_${PV}.bb
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
X-List-Received-Date: Thu, 26 May 2011 07:59:38 -0000
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On May 26, 2011, at 12:02 AM, Darren Hart <dvhart@linux.intel.com> wrote:

> In order to facilitate reuse of the oe-core u-boot recipe, there needs to b=
e
> some assurance that the oe-core version won't change without a clear indic=
ator
> to people extending it.
>=20
> By renaming the recipe to include its version string instead of "git", BSP=

> layers can extend a specific base version of u-boot, ie.
> u-boot_2011.03.bbappend. When 2011.06 becomes available, we can create tha=
t file
> without instantly breaking all the BSPs depending on oe-core version of th=
e
> recipe.
>=20
> As a matter of policy I would recommend we not carry more than 2 versioned=

> u-boot recipess at any given time. This will provide BSP layers time to mi=
grate
> to the newer version, without cluttering oe-core with numerous stale versi=
ons of
> u-boot. We may decide later to resurrect u-boot_git.bb as an AUTOREV recip=
e to
> faciliate upstream development on u-boot in the oe environment.

This sounds especially useful for automated testing of upstream. I'd be inte=
rested in setting up a public daily build and test report in such a configur=
ation. Let me know if it would be redundant.=20

>=20
> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Jason Kridner <jkridner@beagleboard.org>
> ---
> .../uboot/{u-boot_git.bb =3D> u-boot_2011.03.bb}     |    0
> 1 files changed, 0 insertions(+), 0 deletions(-)
> rename meta/recipes-bsp/uboot/{u-boot_git.bb =3D> u-boot_2011.03.bb} (100%=
)
>=20
> diff --git a/meta/recipes-bsp/uboot/u-boot_git.bb b/meta/recipes-bsp/uboot=
/u-boot_2011.03.bb
> similarity index 100%
> rename from meta/recipes-bsp/uboot/u-boot_git.bb
> rename to meta/recipes-bsp/uboot/u-boot_2011.03.bb
> --=20
> 1.7.1
>=20


