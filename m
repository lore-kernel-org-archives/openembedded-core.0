Return-Path: <nitin.a.kamble@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 24EA96110C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 16:57:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Sep 2013 09:54:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,872,1371106800"; d="scan'208";a="400711899"
Received: from orsmsx107.amr.corp.intel.com ([10.22.240.5])
	by orsmga002.jf.intel.com with ESMTP; 09 Sep 2013 09:57:41 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.161]) by
	ORSMSX107.amr.corp.intel.com ([169.254.1.193]) with mapi id
	14.03.0123.003; Mon, 9 Sep 2013 09:57:41 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
Thread-Index: AQHOrVfn4qnFo/lz+k+5cqfakFWZAJm9npjQ
Date: Mon, 9 Sep 2013 16:57:40 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C704914C3@ORSMSX103.amr.corp.intel.com>
References: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1378729614-11794-1-git-send-email-ross.burton@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.138]
MIME-Version: 1.0
Subject: Re: [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
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
X-List-Received-Date: Mon, 09 Sep 2013 16:57:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,
  This is a clever way to deal with unnecessary rebuilding of mesa we were =
seeing earlier. With this mesa-gl,
the mesa also need modification to remove gl from the default recipe.

Also looks like there is a need from community for mesa-gl-lib and mesa-gl-=
headers, as some
platforms need just the mesa-gl-headers and not the libs.

Nitin



> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Ross Burton
> Sent: Monday, September 09, 2013 5:27 AM
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [RFC][PATCH] mesa-gl: add GL-only Mesa recipe
>=20
> Some machines have hardware-specific GL drivers that do EGL and GLES
> (many ARM boards).  Others have their own EGL/GLES drivers and provide a
> Mesa DRI driver (EMGD).  Previously adding Mesa, for software GL/GLX
> rendering in the first case and hardware GLX in the second, involved
> bbappends and changing Mesa to be machine-specific.
>=20
> By adding a just-GL Mesa the machine definition can combine it with the
> hardware drivers cleanly.
>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb |    5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
>=20
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb b/meta/recipes-
> graphics/mesa/mesa-gl_9.1.6.bb
> new file mode 100644
> index 0000000..521a830
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa-gl_9.1.6.bb
> @@ -0,0 +1,5 @@
> +require mesa_${PV}.bb
> +
> +FILESPATH =3D "${FILE_DIRNAME}/mesa-${PV}:${FILE_DIRNAME}/mesa"
> +
> +PACKAGECONFIG ??=3D "dri gl"
> --
> 1.7.10.4
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

