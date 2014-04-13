Return-Path: <darren.hart@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C20D365D07
	for <Openembedded-core@lists.openembedded.org>;
	Sun, 13 Apr 2014 15:43:57 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 13 Apr 2014 08:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,851,1389772800"; d="scan'208";a="520051512"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga002.jf.intel.com with ESMTP; 13 Apr 2014 08:43:58 -0700
Received: from orsmsx157.amr.corp.intel.com ([169.254.9.184]) by
	ORSMSX104.amr.corp.intel.com ([169.254.3.180]) with mapi id
	14.03.0123.003; Sun, 13 Apr 2014 08:43:58 -0700
From: "Hart, Darren" <darren.hart@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Thread-Topic: [Patch v2 1/1] meta-skeleton: linux-yocto-custom.bb: use
	machine overrides
Thread-Index: AQHPVa8J0CT72A15cEO8OHKfWDYY/ZsQJrwA//+MQzM=
Date: Sun, 13 Apr 2014 15:43:58 +0000
Message-ID: <79661426AB6B40478E52EE7F511CC90515676E5D@ORSMSX157.amr.corp.intel.com>
References: <cover.1397238371.git.nitin.a.kamble@intel.com>
	<12b191e0f58ed7954477dab64bb89d7e94b95039.1397238371.git.nitin.a.kamble@intel.com>,
	<1397403492.15843.52.camel@ted>
In-Reply-To: <1397403492.15843.52.camel@ted>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2 1/1] meta-skeleton: linux-yocto-custom.bb: use machine overrides
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
X-List-Received-Date: Sun, 13 Apr 2014 15:43:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Indeed, because the SRCURI was made machine specific. In the case of Linux =
Yocto custom... Their is no namespace pollution to worry about, as there is=
 with Linux Yocto... Should we perhaps drop all the overrides and provide c=
omented examples instead?

On Apr 13, 2014 8:39 AM, Richard Purdie <richard.purdie@linuxfoundation.org=
> wrote:
On Fri, 2014-04-11 at 10:59 -0700, nitin.a.kamble@intel.com wrote:
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>
> Use machine overrides for variables for this skeleton kernel recipe
> so that people following skeleton do it right at the beginning.
>
> The machine overrides for the variables reduces  variable name-space
> pollution and avoids unintentional influences on other layers.
>
> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
> ---
>  meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb | 16 +++++++++-=
------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb b/m=
eta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> index c329106..16db4a3 100644
> --- a/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> +++ b/meta-skeleton/recipes-kernel/linux/linux-yocto-custom.bb
> @@ -44,21 +44,23 @@
>  inherit kernel
>  require recipes-kernel/linux/linux-yocto.inc
>
> +#Note: Replace the yourmachine string with your actual machine name here
> +
>  # Override SRC_URI in a bbappend file to point at a different source
>  # tree if you do not want to build from Linus' tree.
> -SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git;protocol=3Dgit;nocheckout=3D1;name=3Dmachine"
> +SRC_URI_yourmachine =3D "git://git.kernel.org/pub/scm/linux/kernel/git/t=
orvalds/linux.git;protocol=3Dgit;nocheckout=3D1;name=3Dyourmachine"
>
> -LINUX_VERSION ?=3D "3.4"
> -LINUX_VERSION_EXTENSION ?=3D "-custom"
> +LINUX_VERSION_yourmachine ?=3D "3.4"
> +LINUX_VERSION_EXTENSION_yourmachine ?=3D "-custom"
>
>  # Override SRCREV to point to a different commit in a bbappend file to
>  # build a different release of the Linux kernel.
>  # tag: v3.4 76e10d158efb6d4516018846f60c2ab5501900bc
> -SRCREV_machine=3D"76e10d158efb6d4516018846f60c2ab5501900bc"
> +SRCREV_yourmachine=3D"76e10d158efb6d4516018846f60c2ab5501900bc"
>
>  PR =3D "r1"
>  PV =3D "${LINUX_VERSION}+git${SRCPV}"
>
> -# Override COMPATIBLE_MACHINE to include your machine in a bbappend
> -# file. Leaving it empty here ensures an early explicit build failure.
> -COMPATIBLE_MACHINE =3D "(^$)"
> +# Override COMPATIBLE_MACHINE to include your yourmachine in a bbappend
> +# file.
> +COMPATIBLE_MACHINE_yourmachine =3D "yourmachine"

This breaks the autobuilder:

http://autobuilder.yoctoproject.org/main/builders/nightly-qa-skeleton/build=
s/43/steps/BuildImages/logs/stdio

Cheers,

Richard


