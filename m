Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E26D477203
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 18:34:51 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 04 Feb 2016 10:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,396,1449561600"; d="scan'208";a="42544284"
Received: from rravin1x-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.111])
	by fmsmga004.fm.intel.com with ESMTP; 04 Feb 2016 10:34:49 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: =?ISO-8859-1?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>
Date: Fri, 05 Feb 2016 07:34:47 +1300
Message-ID: <6962182.mWZCD3Ya9n@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.3.4-300.fc23.x86_64; KDE/4.14.16; x86_64; ;
	)
In-Reply-To: <bda52d72f2448b404f7973ff4d9425ae4da4067e.1454459362.git.anibal.limon@linux.intel.com>
References: <cover.1454459362.git.anibal.limon@linux.intel.com>
	<bda52d72f2448b404f7973ff4d9425ae4da4067e.1454459362.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 27/28] classes/testimage: exportTests simple improvment to use list instead of test expresions.
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
X-List-Received-Date: Thu, 04 Feb 2016 18:34:52 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Tue, 02 Feb 2016 18:30:39 An=EDbal Lim=F3n wrote:
> It's better to use a list instead if variable isn't match some value.=

>=20
> Signed-off-by: An=EDbal Lim=F3n <anibal.limon@linux.intel.com>
> ---
>  meta/classes/testimage.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.=
bbclass
> index 57858e6..7fff29f 100644
> --- a/meta/classes/testimage.bbclass
> +++ b/meta/classes/testimage.bbclass
> @@ -112,7 +112,7 @@ def exportTests(d,tc):
>      savedata["host_dumper"] =3D {}
>      for key in tc.__dict__:
>          # special cases
> -        if key !=3D "d" and key !=3D "target" and key !=3D "host_dum=
per" and key
> !=3D "suite": +        if key not in ['d', 'target', 'host_dumper', '=
suite']:
>              savedata[key] =3D getattr(tc, key)
>      savedata["target"]["ip"] =3D tc.target.ip or d.getVar("TEST_TARG=
ET_IP",
> True) savedata["target"]["server_ip"] =3D tc.target.server_ip or
> d.getVar("TEST_SERVER_IP", True)

Please squash this into the commit where you're adding the "suite" item=
.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

