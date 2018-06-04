Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 591386FFD8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jun 2018 07:37:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id D7B46182D3;
	Mon,  4 Jun 2018 09:37:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 53dpztxVR4VO; Mon,  4 Jun 2018 09:37:40 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 36024182C7;
	Mon,  4 Jun 2018 09:37:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 205501E072;
	Mon,  4 Jun 2018 09:37:40 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13FDA1E070;
	Mon,  4 Jun 2018 09:37:40 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Mon,  4 Jun 2018 09:37:40 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by thoth.se.axis.com (Postfix) with ESMTP id 0779127C0;
	Mon,  4 Jun 2018 09:37:40 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Mon, 4 Jun 2018 09:37:39 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1365.000; Mon, 4 Jun 2018 09:37:39 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCHv2 1/2] oe-pkgdata-util: Make
	parse_pkgdatafile() support package suffixed vars
Thread-Index: AQHT+1X+Wc623TeWHEyRQpCE+2G66qRPtV1w
Date: Mon, 4 Jun 2018 07:37:39 +0000
Message-ID: <9f10f38974f049d48f6956fd362b2250@XBOX02.axis.com>
References: <20180602193033.14641-1-pkj@axis.com>
	<91de2ba7b196087a5914e1693ff86c3937b50eee.camel@linuxfoundation.org>
In-Reply-To: <91de2ba7b196087a5914e1693ff86c3937b50eee.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCHv2 1/2] oe-pkgdata-util: Make parse_pkgdatafile() support package suffixed vars
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
X-List-Received-Date: Mon, 04 Jun 2018 07:37:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 3 juni 2018 18:14
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCHv2 1/2] oe-pkgdata-util: Make
> parse_pkgdatafile() support package suffixed vars
>=20
> On Sat, 2018-06-02 at 21:30 +0200, Peter Kjellerstedt wrote:
> > Support for variables suffixed with package names, e.g., PKGV_foo, was
> > removed in commit 3d2c87c4, which broke support for recipes that set
> > other versions on their packages than what is in ${PV}.
>=20
> Would it be possible to write some simple tests for oe-pkgdata-util to
> make sure we don't break it again?

It probably would. However, I am not the one to do the first ones (I=20
generally suck at anything related to unit tests). But I can probably=20
help add some to cover our use cases once there is a precedence for=20
how to do it.

> Cheers,
>=20
> Richard

//Peter


