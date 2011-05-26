Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QPZxI-0001dK-3C
	for openembedded-core@lists.openembedded.org;
	Thu, 26 May 2011 14:46:24 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2011 05:43:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,272,1304319600"; 
   d="scan'208";a="9309121"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2011 05:43:17 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 26 May 2011 20:43:17 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Thu, 26 May 2011 20:43:17 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Thu, 26 May 2011 20:43:16 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Thu, 26 May 2011 20:43:14 +0800
Thread-Topic: [OE-core] [PATCH 2/5] conf/bitbake.conf: Added variables for
	PR service.
Thread-Index: AcwbnGKi9T0rivMGQgSgjUWJ0QMwnQABFonA
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F232DBFB10B@shsmsx502.ccr.corp.intel.com>
References: <82b5b89412bfcac2d4586d183a3b6a516b5a0f35.1306401007.git.lianhao.lu@intel.com>
	<a24e8ddae8f503f60c9151aab0f35627393ed285.1306401007.git.lianhao.lu@intel.com>
	<1306411147.2525.326.camel@phil-desktop>
In-Reply-To: <1306411147.2525.326.camel@phil-desktop>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 2/5] conf/bitbake.conf: Added variables for PR service.
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
X-List-Received-Date: Thu, 26 May 2011 12:46:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Phil Blundell wrote on 2011-05-26:
> On Thu, 2011-05-26 at 19:55 +0800, Lianhao Lu wrote:
>> -EXTENDPV =3D "${EXTENDPEVER}${PV}-${PR}"
>> +EXTENDPV =3D "${EXTENDPEVER}${PV}-${PKGR}"
>=20
> That looks a bit weird.  Is it really correct to be mixing PV and PKGR li=
ke that?
>=20
> FWIW, oe master has:
>=20
> EXTENDPE =3D "${@int('${PE}') and '${PE}_' or ''}"
> EXTENDPEVER =3D "${@int('${PE}') and '${PE}:' or ''}"
> EXTENDPV =3D "${EXTENDPEVER}${PV}-${PR}${DISTRO_PR}"
>=20
> PKGV	?=3D "${PV}"
> PKGR	?=3D "${PR}${DISTRO_PR}"
>=20
> EXTENDPKGEVER =3D "${@['','${PKGE\x7d:'][bb.data.getVar('PKGE',d,1) > 0]}=
"
> EXTENDPKGV ?=3D "${EXTENDPKGEVER}${PKGV}-${PKGR}"
>=20
> and, although there are a couple of uses of ${EXTENDPV} that should
> perhaps be ${EXTENDPKGV}, this arrangement seems sensible otherwise.
>=20

The problem is that in OE-core the default -deb/-dbg packages are all using=
 EXTENDPV, as well as some other recipes. Do you mean we should make them a=
ll using EXTENDPKGV instead of EXTENDPV? If this is the way, I think PKGE s=
hould be used instead of PE in package_xxx.bbclass, though currently I don'=
t see any recipe in OE using PKGE, but some of them do use PE.

Best Regards,
Lianhao




