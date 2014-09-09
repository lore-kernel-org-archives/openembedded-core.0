Return-Path: <ola.x.nilsson@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 06A586A9D4
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 11:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 55D012E32F;
	Tue,  9 Sep 2014 13:48:50 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 7mATRv9nNomV; Tue,  9 Sep 2014 13:48:46 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 8C0FC2E2EA;
	Tue,  9 Sep 2014 13:48:46 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 44838E81;
	Tue,  9 Sep 2014 13:48:46 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 37D9C7E9;
	Tue,  9 Sep 2014 13:48:46 +0200 (CEST)
Received: from xmail2.se.axis.com (xmail2.se.axis.com [10.0.5.74])
	by thoth.se.axis.com (Postfix) with ESMTP id 3574D34005;
	Tue,  9 Sep 2014 13:48:46 +0200 (CEST)
Received: from xmail3.se.axis.com ([10.0.5.75]) by xmail2.se.axis.com
	([10.0.5.74]) with mapi; Tue, 9 Sep 2014 13:48:46 +0200
From: Ola X Nilsson <ola.x.nilsson@axis.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 13:48:41 +0200
Thread-Topic: [OE-core] [PATCH 15/35] wic: Remove 3rdparty/urlgrabber
Thread-Index: Ac+zVaodCHMH3WQARRi6UEWU4t+Q6AYzk+3Q
Message-ID: <4BEA3FF3CAA35E408EA55C7BE2E61D058A282B7855@xmail3.se.axis.com>
References: <cover.1407533201.git.tom.zanussi@linux.intel.com>
	<c1491f211598384c7c659589da2c2bd90232e0af.1407533201.git.tom.zanussi@linux.intel.com>
In-Reply-To: <c1491f211598384c7c659589da2c2bd90232e0af.1407533201.git.tom.zanussi@linux.intel.com>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US, sv-SE
MIME-Version: 1.0
Subject: Re: [PATCH 15/35] wic: Remove 3rdparty/urlgrabber
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
X-List-Received-Date: Tue, 09 Sep 2014 11:48:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

This commit breaks wic for me.=20
Urlgrabber is imported from pykickstart/version.py and pykickstart/parser.p=
y.

Having python-urlgrabber installed in your distro hides this problem.

--=20
Ola Nilsson

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
> Of Tom Zanussi
> Sent: den 9 augusti 2014 00:06
> To: openembedded-core@lists.openembedded.org
> Cc: Tom Zanussi
> Subject: [OE-core] [PATCH 15/35] wic: Remove 3rdparty/urlgrabber
>=20
> wic doesn't use it, so remove it.
>=20
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
> ---
>  .../3rdparty/pykickstart/urlgrabber/__init__.py    |   53 -
>  .../3rdparty/pykickstart/urlgrabber/byterange.py   |  463 ------
>  .../mic/3rdparty/pykickstart/urlgrabber/grabber.py | 1477 --------------=
------
>  .../3rdparty/pykickstart/urlgrabber/keepalive.py   |  617 --------
>  .../mic/3rdparty/pykickstart/urlgrabber/mirror.py  |  458 ------
>  .../3rdparty/pykickstart/urlgrabber/progress.py    |  530 -------
>  .../3rdparty/pykickstart/urlgrabber/sslfactory.py  |   90 --
>  7 files changed, 3688 deletions(-)
>  delete mode 100644
> scripts/lib/mic/3rdparty/pykickstart/urlgrabber/__init__.py
>  delete mode 100644
> scripts/lib/mic/3rdparty/pykickstart/urlgrabber/byterange.py
>  delete mode 100644
> scripts/lib/mic/3rdparty/pykickstart/urlgrabber/grabber.py
>  delete mode 100644
> scripts/lib/mic/3rdparty/pykickstart/urlgrabber/keepalive.py
>  delete mode 100644
> scripts/lib/mic/3rdparty/pykickstart/urlgrabber/mirror.py
>  delete mode 100644
> scripts/lib/mic/3rdparty/pykickstart/urlgrabber/progress.py
>  delete mode 100644
> scripts/lib/mic/3rdparty/pykickstart/urlgrabber/sslfactory.py
>=20
> Patch too large to post - see git repository.
>=20
> --
> 1.8.3.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

