Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qr03D-0005tw-MN
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 06:05:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 09 Aug 2011 21:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,348,1309762800"; d="scan'208";a="36990548"
Received: from pgsmsx603.gar.corp.intel.com ([10.221.43.87])
	by orsmga001.jf.intel.com with ESMTP; 09 Aug 2011 21:01:20 -0700
Received: from pgsmsx104.gar.corp.intel.com (10.221.44.91) by
	pgsmsx603.gar.corp.intel.com (10.221.43.87) with Microsoft SMTP Server
	(TLS) id 8.2.255.0; Wed, 10 Aug 2011 12:00:24 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX104.gar.corp.intel.com (10.221.44.91) with Microsoft SMTP Server
	(TLS) id 14.1.323.3; Wed, 10 Aug 2011 12:00:23 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Wed, 10 Aug 2011 12:00:23 +0800
From: "Lu, Lianhao" <lianhao.lu@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2011 12:00:22 +0800
Thread-Topic: [OE-core] populate_sdk: We need to ensure that the SDK sysroot
	reflects PACKAGE_ARCH
Thread-Index: AcxWvegMnEqojjCGSGWGR3WA8nrGNwAU6WRw
Message-ID: <C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>
References: <1312912632.14274.312.camel@rex>
In-Reply-To: <1312912632.14274.312.camel@rex>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: zh-CN, en-US
MIME-Version: 1.0
Subject: Re: populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
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
X-List-Received-Date: Wed, 10 Aug 2011 04:05:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote on 2011-08-10:
> If we don't do this, the SDK target sysroot is named generically even
> when it contains package architecture specific optimisations.
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org> ---
> diff --git a/meta/classes/populate_sdk.bbclass
> b/meta/classes/populate_sdk.bbclass index 0f3591b..8c19e83 100644 ---
> a/meta/classes/populate_sdk.bbclass +++
> b/meta/classes/populate_sdk.bbclass @@ -5,7 +5,7 @@ SDK_DIR =3D
> "${WORKDIR}/sdk"
>  SDK_OUTPUT =3D "${SDK_DIR}/image"
>  SDK_DEPLOY =3D "${TMPDIR}/deploy/sdk"
> -SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${TARGET_SYS}"
> +SDKTARGETSYSROOT =3D "${SDKPATH}/sysroots/${MULTIMACH_TARGET_SYS}"

In gcc-configure-sdk.inc, it is set "--with-sysroot=3D${SDKPATH}/sysroots/$=
{TARGET_SYS}".=20
Is there any inconsistency?

Best Regards,
Lianhao

>  TOOLCHAIN_HOST_TASK ?=3D "task-sdk-host-nativesdk
>  task-cross-canadian-${TRANSLATED_TARGET_ARCH}" TOOLCHAIN_TARGET_TASK ?=
=3D
>  "task-core-standalone-sdk-target
> task-core-standalone-sdk-target-dbg"





