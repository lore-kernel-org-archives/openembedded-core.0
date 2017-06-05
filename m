Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 336EC60107
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 01:15:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jun 2017 18:15:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,298,1493708400"; d="scan'208";a="270153178"
Received: from kmsmsx155.gar.corp.intel.com ([172.21.73.106])
	by fmsmga004.fm.intel.com with ESMTP; 04 Jun 2017 18:15:42 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.82]) by
	KMSMSX155.gar.corp.intel.com ([169.254.15.19]) with mapi id
	14.03.0319.002; Mon, 5 Jun 2017 09:15:40 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>, 
	"Purdie, Richard" <richard.purdie@intel.com>, "Burton, Ross"
	<ross.burton@intel.com>
Thread-Topic: [PATCHv3 0/2] devshell: make sure toolchains are populated in
	sysroot
Thread-Index: AQHS2OYAxRK2vm7kfE6wZApanpOHg6IRPx1Q
Date: Mon, 5 Jun 2017 01:15:40 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D1F050F18@PGSMSX103.gar.corp.intel.com>
References: <cover.1496107463.git.rebecca.swee.fun.chang@intel.com>
In-Reply-To: <cover.1496107463.git.rebecca.swee.fun.chang@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Cc: Internal Core dev Mailing List <core-dev@eclists.intel.com>, "Eggleton,
	Paul" <paul.eggleton@intel.com>
Subject: Re: [PATCHv3 0/2] devshell: make sure toolchains are populated in sysroot
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
X-List-Received-Date: Mon, 05 Jun 2017 01:15:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

May I know is this patch in queue for merging? This fix was planned for 2.4=
M1.
Thank you very much.

Regards,
Rebecca

> -----Original Message-----
> From: Chang, Rebecca Swee Fun
> Sent: Tuesday, May 30, 2017 9:43 AM
> To: OpenEmbedded Core Mailing List <openembedded-
> core@lists.openembedded.org>
> Cc: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>; Internal
> Core dev Mailing List <core-dev@eclists.intel.com>
> Subject: [PATCHv3 0/2] devshell: make sure toolchains are populated in sy=
sroot
>=20
> From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
>=20
> Rework on PATCHv2.
> addtask do_prepare_recipe_sysroot is having the same effect on building m=
ore
> dependencies for devshell.
>=20
> The 2nd patch in series is to clean up some trailing whitespaces within
> devshell.bbclass.
>=20
> I have done some tests on random recipe to ensure this change is having t=
he
> same behavior as the previous implementation.
>=20
> Thanks.
>=20
> Regards,
> Rebecca
>=20
> The following changes since commit
> 27200a3afd606df7f8e592439a8dd403d714ea6f:
>=20
>   bind: build with threads and update configure options (2017-05-29 15:15=
:20
> +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.yoctoproject.org/poky-contrib rebeccas/11464-devshell
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=3Drebeccas/114=
64-
> devshell
>=20
> Chang Rebecca Swee Fun (2):
>   devshell.bbclass: ensure toolchains available for do_devshell
>   devshell.bbclass: clean up trailing whitespaces
>=20
>  meta/classes/devshell.bbclass | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> --
> 2.7.4


