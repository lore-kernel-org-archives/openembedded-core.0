Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QbuhH-0002sd-Ny
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Jun 2011 15:20:51 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 29 Jun 2011 06:17:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,443,1304319600"; d="scan'208";a="19675391"
Received: from pgsmsx601.gar.corp.intel.com ([10.221.43.69])
	by orsmga002.jf.intel.com with ESMTP; 29 Jun 2011 06:17:07 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx601.gar.corp.intel.com (10.221.43.69) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 21:17:07 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 29 Jun 2011 21:17:06 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 29 Jun 2011 21:17:06 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Wed, 29 Jun 2011 21:17:05 +0800
Thread-Topic: [PATCH 1/3] grub: add -fno-reorder-functions into STAGE2_COMPILE
Thread-Index: Acw2XdM3a+e9O0ZsSouOrgPJDHH9mQAAIyvg
Message-ID: <1865303E0DED764181A9D882DEF65FB6A167F0C71D@shsmsx502.ccr.corp.intel.com>
References: <cover.1309352791.git.dexuan.cui@intel.com>
	<c572d4f39bc61df11a8e5a344b88c7b3fe8e476f.1309352791.git.dexuan.cui@intel.com>
In-Reply-To: <c572d4f39bc61df11a8e5a344b88c7b3fe8e476f.1309352791.git.dexuan.cui@intel.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] grub: add -fno-reorder-functions into STAGE2_COMPILE
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
X-List-Received-Date: Wed, 29 Jun 2011 13:20:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Cui, Dexuan wrote:
> This is used to work around a gcc-4.6's bug about the option.
>=20
> [YOCTO #1099]
>=20
> diff --git a/meta/recipes-bsp/grub/grub_0.97.bb
> b/meta/recipes-bsp/grub/grub_0.97.bb=20
> index 131d942..ffacb61 100644
> --- a/meta/recipes-bsp/grub/grub_0.97.bb
> +++ b/meta/recipes-bsp/grub/grub_0.97.bb
>  RDEPENDS_${PN} =3D "diffutils"
> -PR =3D "r3"
> +PR =3D "r6"
Sorry, PR should be "r4" here... I used "r6" in my debugging.
I forgot to clean this up when I sent the patch.

I've re-pushed my branch.
Please use the new commit:
http://git.pokylinux.org/cgit.cgi/poky-contrib/commit/?h=3Ddcui/master&id=
=3D5c670ef29d828e76ae101fcfe9234732af759dfa

Thanks,
-- Dexuan


