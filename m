Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0BE177849D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Jun 2017 13:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id A100D1852A;
	Fri, 16 Jun 2017 15:17:41 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id tJ0sif10xdRS; Fri, 16 Jun 2017 15:17:40 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 4755B18525;
	Fri, 16 Jun 2017 15:17:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 21EFE1E07B;
	Fri, 16 Jun 2017 15:17:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15C9C1E079;
	Fri, 16 Jun 2017 15:17:40 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 16 Jun 2017 15:17:40 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 0972421B;
	Fri, 16 Jun 2017 15:17:40 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 16 Jun 2017 15:17:40 +0200
Received: from XBOX02.axis.com ([fe80::d00f:cb52:1b56:20d]) by XBOX02.axis.com
	([fe80::d00f:cb52:1b56:20d%21]) with mapi id 15.00.1210.000;
	Fri, 16 Jun 2017 15:17:40 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 3/4] kconfig-frontends: Remove as only needed
	for eglibc
Thread-Index: AQHS5qDVJYsehOjbikKJ0oGWyOAuQaIneH3w
Date: Fri, 16 Jun 2017 13:17:39 +0000
Message-ID: <d9c463b9eac74d80a38f5a1a15e3029d@XBOX02.axis.com>
References: <1497602550-1491-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1497602550-1491-3-git-send-email-richard.purdie@linuxfoundation.org>
	<867deeaf462e453b8de99a2fa9f609ec@XBOX02.axis.com>
	<ca0a4fe0-c6ad-32f5-7d12-4ddf918ea295@linux.intel.com>
In-Reply-To: <ca0a4fe0-c6ad-32f5-7d12-4ddf918ea295@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 3/4] kconfig-frontends: Remove as only needed for eglibc
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
X-List-Received-Date: Fri, 16 Jun 2017 13:17:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Alexander Kanavin [mailto:alexander.kanavin@linux.intel.com]
> Sent: den 16 juni 2017 15:03
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; Richard Purdie
> <richard.purdie@linuxfoundation.org>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 3/4] kconfig-frontends: Remove as only
> needed for eglibc
>=20
> On 06/16/2017 03:36 PM, Peter Kjellerstedt wrote:
>=20
> > Please move it to meta-oe if you remove it from OE-core. We rely on
> > it.
>=20
> Peter, may I suggest that you create this patch? It's trivial to do,
> and sets a better precedent, in my opinion.
>=20
> Alex

Hmm, ok. Will do...

//Peter


