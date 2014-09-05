Return-Path: <nitin.a.kamble@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E55E37147C
	for <Openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 01:20:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 04 Sep 2014 18:20:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,470,1406617200"; d="scan'208";a="586551990"
Received: from orsmsx110.amr.corp.intel.com ([10.22.240.8])
	by fmsmga001.fm.intel.com with ESMTP; 04 Sep 2014 18:20:38 -0700
Received: from orsmsx115.amr.corp.intel.com (10.22.240.11) by
	ORSMSX110.amr.corp.intel.com (10.22.240.8) with Microsoft SMTP Server
	(TLS) id 14.3.195.1; Thu, 4 Sep 2014 18:20:37 -0700
Received: from orsmsx103.amr.corp.intel.com ([169.254.2.252]) by
	ORSMSX115.amr.corp.intel.com ([10.22.240.11]) with mapi id
	14.03.0195.001; Thu, 4 Sep 2014 18:20:37 -0700
From: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
To: "Hart, Darren" <darren.hart@intel.com>,
	"richard.purdie@linuxfoundation.org" <richard.purdie@linuxfoundation.org>, 
	"Wold, Saul" <saul.wold@intel.com>,
	"Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 0/1] A tool for boottime image configuration
Thread-Index: AQHPwvAyPWLn0SINOkqFSg2ss6adaZvxyGhw
Date: Fri, 5 Sep 2014 01:20:37 +0000
Message-ID: <ADD6A3980E8C39419A432FF422031B4C7CEBD359@ORSMSX103.amr.corp.intel.com>
References: <cover.1409251282.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1409251282.git.nitin.a.kamble@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.22.254.139]
MIME-Version: 1.0
Subject: Re: [PATCH 0/1] A tool for boottime image configuration
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
X-List-Received-Date: Fri, 05 Sep 2014 01:20:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I have changed name of the "Image Configurator" tool to "Machine Setup Tool=
". Also we have decided to host the recipe in the meta-intel layer instead =
of the oecore layer for the upcoming Yocto Project 1.7 release. And after f=
urther stabilization the recipe will be migrated to oecore layer before the=
 YP 1.8 release.

Nitin
=20


> -----Original Message-----
> From: Kamble, Nitin A
> Sent: Thursday, August 28, 2014 11:47 AM
> To: Hart, Darren; richard.purdie@linuxfoundation.org; Wold, Saul;
> Openembedded-core@lists.openembedded.org
> Cc: Kamble, Nitin A
> Subject: [PATCH 0/1] A tool for boottime image configuration
>=20
> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>=20
> This pull request provides the base recipe for the Image Configurator too=
l,
> which provides ability to configure the BSP images for a particular hardw=
are
> at boot time.
>=20
>   The recipe needs machine configuration files, which are to be provided =
in
> the individual BSP layers. The meta-intel layer will be using this recipe=
 to
> support multiple machines with common BSPs. There is nothing architecture
> specific here, and it can also be used by any other layer to consolidate
> multiple BSPs.
>=20
> Thanks,
> Nitin
>=20
> The following changes since commit
> 669c07d6022174d01fe5a95b7b0faa9ef86da1e2:
>=20
>   bitbake: build/data: Write out more complete python run files (2014-08-=
28
> 15:12:45 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib nitin/misc
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Dnitin/misc
>=20
> Nitin A Kamble (1):
>   imageconfigurator: a new recipe for boottime image configuration
>=20
>  .../imageconfigurator/imageconfigurator_git.bb     | 50
> ++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
>  create mode 100644 meta/recipes-
> bsp/imageconfigurator/imageconfigurator_git.bb
>=20
> --
> 1.8.1.4


