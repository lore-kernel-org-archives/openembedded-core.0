Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4EB4077E9A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 01:51:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga105.jf.intel.com with ESMTP; 10 Jul 2017 18:51:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,343,1496127600"; d="scan'208";a="1193804790"
Received: from pgsmsx106.gar.corp.intel.com ([10.221.44.98])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2017 18:51:05 -0700
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.148]) by
	PGSMSX106.gar.corp.intel.com ([10.221.44.98]) with mapi id
	14.03.0319.002; Tue, 11 Jul 2017 09:50:45 +0800
From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH 0/3] Enhancement on devtool edit-recipe
Thread-Index: AQHS77IvepBx4DGemUOwM2DlSJghZqJN8GyA
Date: Tue, 11 Jul 2017 01:50:44 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D1F11FF60@PGSMSX103.gar.corp.intel.com>
References: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
In-Reply-To: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] Enhancement on devtool edit-recipe
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
X-List-Received-Date: Tue, 11 Jul 2017 01:51:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping in case maintainer has missed this series.
Please let me know if there are any concern to merge this enhancement on de=
vtool edit-recipe and I would rework it asap for 2.4M2.
Thank you very much.

Rebecca

> -----Original Message-----
> From: Chang, Rebecca Swee Fun
> Sent: Wednesday, June 28, 2017 9:59 AM
> To: OpenEmbedded Core Mailing List <openembedded-
> core@lists.openembedded.org>
> Cc: Chang, Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
> Subject: [PATCH 0/3] Enhancement on devtool edit-recipe
>=20
> Hi,
>=20
> The patches in this series are to enhance devtool edit-recipe as a reques=
t from
> Bugzilla #11434.
>=20
> This first enhancement I did was to ensure devtool edit-recipe not to pri=
nt out
> ugly tracebacks that is not informative by catching the exception.
>=20
> However, this has introduced new tracebacks where python complaints about
> NameError: name 'logger' is not defined in run_editor definition. We coul=
d pass
> in logger as a parameter from run_editor function call. This was fixed in=
 the
> second patch in this series.
>=20
> Lastly, I have enable additional subcommand 'find-recipe' for devtool. Th=
is will
> help users to find the path to the recipes in workspace and it can be ext=
ended
> to find recipe outside of workspace using '-a/--any-recipe' option.
>=20
> Regards,
> Rebecca
>=20
> Chang Rebecca Swee Fun (3):
>   scriptutils: exit politely when no text editor available
>   scriptutils: pass in logger as parameter
>   devtool: find-recipe: enable new subcommand for devtool
>=20
>  scripts/lib/devtool/utilcmds.py     | 18 ++++++++++++++----
>  scripts/lib/recipetool/newappend.py |  2 +-
>  scripts/lib/scriptutils.py          |  6 +++---
>  3 files changed, 18 insertions(+), 8 deletions(-)
>=20
> --
> 2.7.4


