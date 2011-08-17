Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1QtWCa-0002ah-LY
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 04:49:56 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Aug 2011 19:45:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,236,1312182000"; d="scan'208";a="40341534"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 16 Aug 2011 19:45:17 -0700
Received: from shsmsx602.ccr.corp.intel.com (10.239.4.104) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 17 Aug 2011 10:44:22 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	SHSMSX602.ccr.corp.intel.com ([10.239.4.104]) with mapi;
	Wed, 17 Aug 2011 10:44:21 +0800
From: "Cui, Dexuan" <dexuan.cui@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 10:44:19 +0800
Thread-Topic: [OE-core] [PATCH 5/5] tcf-agent: Add openssl to DEPENDS
Thread-Index: AcxcZPbQyRiUWufqRsi1mOgs7aNf/AAIlAsg
Message-ID: <1865303E0DED764181A9D882DEF65FB6B884EF8590@shsmsx502.ccr.corp.intel.com>
References: <cover.1313533911.git.raj.khem@gmail.com>
	<ded8261127515a76b256d6c8dcbcbae156a19cff.1313533911.git.raj.khem@gmail.com>
In-Reply-To: <ded8261127515a76b256d6c8dcbcbae156a19cff.1313533911.git.raj.khem@gmail.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] tcf-agent: Add openssl to DEPENDS
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
X-List-Received-Date: Wed, 17 Aug 2011 02:49:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Khem Raj wrote on 2011-08-17:
> It ends in errors like below otherwise
>=20
> | framework/channel_tcp.c:34:27: fatal error: openssl/ssl.h: No such
> file or directory
> | compilation terminated.
> | make: *** [obj/GNU/Linux/arm/Debug/framework/channel_tcp.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | + die 'oe_runmake failed'
> | + bbfatal 'oe_runmake failed'
> | + echo 'ERROR: oe_runmake failed'
> | ERROR: oe_runmake failed
> | + exit 1
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
> b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb index
> 3f97f69..37591c2 100644 ---
> a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb +++
> b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb @@ -8,7 +8,7 @@
> LIC_FILES_CHKSUM =3D
> "file://../epl-v10.html;md5=3D7aa4215a330a0a4f6a1cbf8da1a0879f
>=20
>  SRCREV =3D "1855"
>  PV =3D "0.0+svnr${SRCPV}"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
>  SRC_URI =3D
> "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=3Dag
> ent;p roto=3Dhttp \
>=20
> http://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk/epl-v10.h
> tml;na me=3Depl \ @@ -19,7 +19,7 @@ SRC_URI =3D
> "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=3Dag
>  SRC_URI[epl.md5sum] =3D "7aa4215a330a0a4f6a1cbf8da1a0879f"
>  SRC_URI[epl.sha256sum] =3D
> "4fd64aeed340d62a64a8da4b371efe0f6d0d745f4d2dbefacba86c646d36bc7 2"
>=20
> -DEPENDS =3D "util-linux"
> +DEPENDS =3D "util-linux openssl"
>  RDEPENDS_${PN} =3D "bash"
> =20
>  S =3D "${WORKDIR}/agent"
Hi, I have sent out the same patch 8+ hours ago. :-)

Thanks,
-- Dexuan




