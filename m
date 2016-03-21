Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA7B7017D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 11:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 0116A18092;
	Mon, 21 Mar 2016 12:55:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 869GrJeA8eDE; Mon, 21 Mar 2016 12:55:22 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 346031808E;
	Mon, 21 Mar 2016 12:55:22 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id E403A1537;
	Mon, 21 Mar 2016 12:55:21 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id D91BA121D;
	Mon, 21 Mar 2016 12:55:21 +0100 (CET)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id D6E71FE4;
	Mon, 21 Mar 2016 12:55:21 +0100 (CET)
Received: from xbox11.axis.com (10.0.5.25) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Mon, 21 Mar 2016 12:55:21 +0100
Received: from XBOX02.axis.com (10.0.5.16) by xbox11.axis.com (10.0.5.25) with
	Microsoft SMTP Server (TLS) id 15.0.1156.6;
	Mon, 21 Mar 2016 12:55:21 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%22]) with mapi id
	15.00.1156.000; Mon, 21 Mar 2016 12:55:21 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Richard Purdie (richard.purdie@linuxfoundation.org)"
	<richard.purdie@linuxfoundation.org>, Robert Yang
	<liezhi.yang@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 0/7] Improve oe-init-build-env/-memres
Thread-Index: AQHRgD4/0OH0vUy5QUyp49lfvJfQaZ9jojwAgAAqnyA=
Date: Mon, 21 Mar 2016 11:55:21 +0000
Message-ID: <7dd870238d7a4ae0b4c02d3d91eb530a@XBOX02.axis.com>
References: <cover.1458213205.git.pkj@axis.com>
	<56EFC854.2020605@windriver.com>
In-Reply-To: <56EFC854.2020605@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.55]
MIME-Version: 1.0
Subject: Re: [PATCHv2 0/7] Improve oe-init-build-env/-memres
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
X-List-Received-Date: Mon, 21 Mar 2016 11:55:25 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Robert Yang
> Sent: den 21 mars 2016 11:09
> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCHv2 0/7] Improve oe-init-build-env/-memres
>=20
>=20
> I got strange errors, I think that it is caused by one of these
> patches:
>=20
> $ . ../poky/oe-init-build-env .
> $ bitbake core-image-minimal
> ERROR:  OE-core's config sanity checker detected a potential
> misconfiguration.
>      Either fix the cause of this error or at your own risk disable the
> checker
> (see sanity.conf).
>      Following is the list of potential problems / advisories:
>=20
>      PATH contains '.', './' or '' (empty element), which will break
> the build,
> please remove this.
>=20
> $ echo $PATH
> /buildarea/lyang1/poky/scripts:/buildarea/lyang1/poky/bitbake/bin:/folk
> /lyang1/bin:/folk/lyang1/gbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:
> /usr/bin:/sbin:/bin:/usr/games:/opt/dell/srvadmin/bin:
>=20
>=20
> Without running oe-init-build-env:
> $ echo $PATH
> /folk/lyang1/bin:/folk/lyang1/gbin:/usr/local/sbin:/usr/local/bin:/usr/
> sbin:/usr/bin:/sbin:/bin:/usr/games:/opt/dell/srvadmin/bin:/buildarea/l
> yang1/poky/bitbake/bin
>=20
> // Robert

Bah, sorry about that. A colleague recommended a change to the code=20
that adds paths to $PATH in oe-buildenv-internal, which I implemented=20
just before sending my second patch set last week. Unfortunately I=20
missed changing a \1 to a \2 in the sed-expression after introducing=20
another capture group.

I have now sent a fix for this.

//Peter


