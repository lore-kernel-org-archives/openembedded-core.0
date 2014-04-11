Return-Path: <darren.hart@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F2FEF65DD5
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 17:19:19 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2014 10:19:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="491460278"
Received: from fmsmsx105.amr.corp.intel.com ([10.19.9.36])
	by orsmga001.jf.intel.com with ESMTP; 11 Apr 2014 10:19:01 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.19.17.221) by
	FMSMSX105.amr.corp.intel.com (10.19.9.36) with Microsoft SMTP Server
	(TLS) id 14.3.123.3; Fri, 11 Apr 2014 10:18:58 -0700
Received: from fmsmsx111.amr.corp.intel.com ([169.254.2.9]) by
	fmsmsx152.amr.corp.intel.com ([169.254.6.229]) with mapi id
	14.03.0123.003; Fri, 11 Apr 2014 10:18:58 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>, "Ashfield, Bruce (Wind River)"
	<bruce.ashfield@windriver.com>, "richard.purdie@linuxfoundation.org"
	<richard.purdie@linuxfoundation.org>
Thread-Topic: [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb: use machine
	overrides
Thread-Index: AQHPVad1D4gulqqWU0KLBbvIitT08JsMqZOA
Date: Fri, 11 Apr 2014 17:18:57 +0000
Message-ID: <CF6D724D.830D1%darren.hart@intel.com>
References: <cover.1397235602.git.nitin.a.kamble@intel.com>
	<f1c400fe717177e267c91a497143bc0267b5fe17.1397235602.git.nitin.a.kamble@intel.com>
In-Reply-To: <f1c400fe717177e267c91a497143bc0267b5fe17.1397235602.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.7.196.58]
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Fri, 11 Apr 2014 17:19:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <48B864F367232A439537F1E314497C59@intel.com>
Content-Transfer-Encoding: quoted-printable

On 4/11/14, 10:05, "Kamble, Nitin A" <nitin.a.kamble@intel.com> wrote:

>From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
>Use machine overrides for variables for this skeleton recipe so that
>people following skeleton do it right at the beginning.
>
>The machine overrides for the variables reduces pollution of name space
>and avoid unintentional influences on other layers.
>
>Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>---
> meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 8 ++++----
> 1 file changed, 4 insertions(+), 4 deletions(-)
>
>diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>index c329106..76457ca 100644
>--- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>+++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
>@@ -46,10 +46,10 @@ require recipes-kernel/linux/linux-yocto.inc
>=20
> # Override SRC_URI in a bbappend file to point at a different source
> # tree if you do not want to build from Linus' tree.
>-SRC_URI =3D=20
>"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol
>=3Dgit;nocheckout=3D1;name=3Dmachine"
>+SRC_URI_machine =3D
>"git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git;protocol
>=3Dgit;nocheckout=3D1;name=3Dmachine"
>=20
>-LINUX_VERSION ?=3D "3.4"
>-LINUX_VERSION_EXTENSION ?=3D "-custom"
>+LINUX_VERSION_machine ?=3D "3.4"
>+LINUX_VERSION_EXTENSION_machine ?=3D "-custom"
>=20
> # Override SRCREV to point to a different commit in a bbappend file to
> # build a different release of the Linux kernel.
>@@ -61,4 +61,4 @@ PV =3D "${LINUX_VERSION}+git${SRCPV}"
>=20
> # Override COMPATIBLE_MACHINE to include your machine in a bbappend
> # file. Leaving it empty here ensures an early explicit build failure.
>-COMPATIBLE_MACHINE =3D "(^$)"
>+COMPATIBLE_MACHINE_machine =3D "(^$)"


Might as well change this to:

COMPATIBLE_MACHINE_machine =3D "machine"

And then add a comment at the top to remind people to replace "machine"
with their BSP name.

--=20
Darren Hart					Open Source Technology Center
darren.hart@intel.com				            Intel Corporation



