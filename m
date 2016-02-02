Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6109A7728F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:30:17 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 02 Feb 2016 14:30:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,386,1449561600"; d="scan'208";a="904230178"
Received: from kng2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.178.194])
	by orsmga002.jf.intel.com with ESMTP; 02 Feb 2016 14:30:12 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Wed, 03 Feb 2016 11:30:09 +1300
Message-ID: <1500430.HvkegzEm32@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.3-303.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <01b550d016c48dd518dfdcd8ffb4e1c3255abbbb.1454436558.git.anibal.limon@linux.intel.com>
References: <cover.1454436558.git.anibal.limon@linux.intel.com>
	<01b550d016c48dd518dfdcd8ffb4e1c3255abbbb.1454436558.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 21/21] classes/testimage: Fix exportTests function.
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
X-List-Received-Date: Tue, 02 Feb 2016 22:30:19 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 12:09:37 An=EDbal Lim=F3n wrote:
> With new structure of TestContext now holds suite and variable
> that contains unittest instances,  it can't be exported using
> JSON causing and exception.
>=20
> Adds the suite variable for avoid export it.
>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/classes/testimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.=
bbclass
> index 5fafda1..57858e6 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -112,7 +112,7 @@ def exportTests(d,tc):
>      savedata["host_dumper"] =3D {}
>      for key in tc.__dict__:
>          # special cases
> -        if key !=3D "d" and key !=3D "target" and key !=3D "host_dum=
per":
> +        if key !=3D "d" and key !=3D "target" and key !=3D "host_dum=
per" and key
> !=3D "suite": savedata[key] =3D getattr(tc, key)

Given how long this is getting we might want to change to:

  if key not in ['d', 'target', 'host_dumper', 'suite']:

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

