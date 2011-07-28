Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QmRkg-0001kb-F3
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jul 2011 16:39:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 28 Jul 2011 07:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,282,1309762800"; d="scan'208";a="35531399"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jul 2011 07:35:37 -0700
Received: from pgsmsx103.gar.corp.intel.com (10.221.44.82) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 28 Jul 2011 22:35:13 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX103.gar.corp.intel.com (10.221.44.82) with Microsoft SMTP Server
	(TLS) id 14.1.289.1; Thu, 28 Jul 2011 22:35:13 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 28 Jul 2011 22:35:12 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 28 Jul 2011 22:35:11 +0800
Thread-Topic: [OE-core] [PATCH 2/4] gcc: Drop part of the 64bithack patch
	which	is no longer used
Thread-Index: AcxMaZ6Y2oSPLSsASXSaJxkp2IRLUgAyCwaQ
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2C40DBAFF4@shsmsx502.ccr.corp.intel.com>
References: <cover.1311776363.git.richard.purdie@linuxfoundation.org>
	<fe78c19406d856cb9473e062f1c2905dfe063c2a.1311776363.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <fe78c19406d856cb9473e062f1c2905dfe063c2a.1311776363.git.richard.purdie@linuxfoundation.org>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/4] gcc: Drop part of the 64bithack patch which	is no longer used
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
X-List-Received-Date: Thu, 28 Jul 2011 14:39:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-07-27:
> Since we now handle GLIBC_DYNAMIC_LINKER in gcc-configure-common.inc:
>=20
> 's#\(GLIBC_DYNAMIC_LINKER[^ ]*\)\( *"/lib.*\)#\1 SYSTEMLIBS_DIR\2#'
>=20

It seems to me that this patch may not be removed. The above code in gcc-co=
nfigure-common.inc said it only useful for SDK. For gcc-cross, it doesn't c=
hange /lib64/ld-linux-x86-64.so.2 to /lib/ld-linux-x86-64.so.2 as what the =
64bithack.patch does.

-Lianhao

> we can drop the patch which changes a hardcoded value for this.
>=20
> No PR bump since there is no code change resulting from this, its just
> a cleanup.
>=20
> There is still a valid question over the remainder of this patch and
> its interaction with multilib configurations.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../recipes-devtools/gcc/gcc-4.5.1/64bithack.patch |   13 -------------
>  meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   13 -------------
>  2 files changed, 0 insertions(+), 26 deletions(-)




