Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1RWIoF-00058K-KR
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 03:25:07 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 01 Dec 2011 18:18:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="82002624"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by orsmga001.jf.intel.com with ESMTP; 01 Dec 2011 18:18:24 -0800
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Fri, 2 Dec 2011 10:18:23 +0800
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.355.2; Fri, 2 Dec 2011 10:18:23 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi; Fri, 2 Dec 2011
	10:18:22 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 2 Dec 2011 10:18:21 +0800
Thread-Topic: [OE-core] [PATCH 6/8] xcb-util: upgrade from 0.3.6 to 0.3.8
Thread-Index: Acyv/6vValFAFH0sSR+66k9/OU8SdwAmJ4ow
Message-ID: <1865303E0DED764181A9D882DEF65FB6E8EDF3A79C@shsmsx502.ccr.corp.intel.com>
References: <cover.1322662245.git.dexuan.cui@intel.com>
	<05e28e6a8cd5c930a0c538121ced79d008f0fdf3.1322662245.git.dexuan.cui@intel.com>
	<20111201080213.GE29875@jama.jama.net>
In-Reply-To: <20111201080213.GE29875@jama.jama.net>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: Re: [PATCH 6/8] xcb-util: upgrade from 0.3.6 to 0.3.8
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
X-List-Received-Date: Fri, 02 Dec 2011 02:25:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Martin Jansa wrote on 2011-12-01:
> On Wed, Nov 30, 2011 at 10:12:32PM +0800, Dexuan Cui wrote:
>> updated LIC_FILES_CHKSUM since the code was re-organized, but the=20
>> license remains the same.
>>=20
>>  meta/recipes-graphics/xcb/xcb-util_0.3.6.bb |   18 ------------------
>>  meta/recipes-graphics/xcb/xcb-util_0.3.8.bb |    9 +++++++++ 2 files
>>  changed, 9 insertions(+), 18 deletions(-)  delete mode 100644 =20
>> meta/recipes-graphics/xcb/xcb-util_0.3.6.bb create mode 100644 =20
>> meta/recipes-graphics/xcb/xcb-util_0.3.8.bb
>=20
> Because there is only one .so lib now after:
> http://cgit.freedesktop.org/xcb/util/commit/?id=3D118a3c86b3d3b2fab20f36
> 5e4a5703e40ad2e1b1
>=20
> the resulting package is renamed from Package xcb-util (0.3.6-r0) is=20
> installed on root and has the following files:=20
> /usr/lib/libxcb-aux.so.0
> /usr/lib/libxcb-keysyms.so.1 /usr/lib/libxcb-icccm.so.1=20
> /usr/lib/libxcb-image.so.0.0.0 /usr/lib/libxcb-atom.so.1.0.0=20
> /usr/lib/libxcb-icccm.so.1.0.0 /usr/lib/libxcb-event.so.1=20
> /usr/lib/libxcb-reply.so.1.0.0 /usr/lib/libxcb-property.so.1.0.0=20
> /usr/lib/libxcb-render-util.so.0.0.0 /usr/lib/libxcb-property.so.1
> /usr/lib/libxcb-reply.so.1 /usr/lib/libxcb-image.so.0
> /usr/lib/libxcb-atom.so.1 /usr/lib/libxcb-event.so.1.0.0=20
> /usr/lib/libxcb-render-util.so.0 /usr/lib/libxcb-aux.so.0.0.0=20
> /usr/lib/libxcb-keysyms.so.1.0.0
>=20
> Now it's libxcb-util0, because of only one .so packages-split/xcb-util=20
> packages-split/xcb-util/usr packages-split/xcb-util/usr/lib=20
> packages-split/xcb-util/usr/lib/libxcb-util.so.0.0.0
> packages-split/xcb-util/usr/lib/libxcb-util.so.0
>=20
> So we need at least PR bumps for recipes which were RDEPENDing on=20
> xcb-util (ie because of shlibs). I'll send patches later for recipes=20
> which are failing for me now..
Hi Martin, thanks very much for helping on this! :-)

Thanks,
-- Dexuan




