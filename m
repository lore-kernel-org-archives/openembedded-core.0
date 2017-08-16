Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4B627835E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Aug 2017 20:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C540D183ED;
	Wed, 16 Aug 2017 22:43:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id v0aA9ayfh7ea; Wed, 16 Aug 2017 22:43:29 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 24886183E6;
	Wed, 16 Aug 2017 22:43:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 120B51A066;
	Wed, 16 Aug 2017 22:43:29 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0662F1A058;
	Wed, 16 Aug 2017 22:43:29 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Wed, 16 Aug 2017 22:43:28 +0200 (CEST)
Received: from XBOX02.axis.com (xbox02.axis.com [10.0.5.16])
	by seth.se.axis.com (Postfix) with ESMTP id EECE0305E;
	Wed, 16 Aug 2017 22:43:28 +0200 (CEST)
Received: from xbox12.axis.com (10.0.5.26) by XBOX02.axis.com (10.0.5.16) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 16 Aug 2017 22:43:28 +0200
Received: from XBOX02.axis.com (10.0.5.16) by xbox12.axis.com (10.0.5.26) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 16 Aug 2017 22:43:28 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 16 Aug 2017 22:43:28 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, akuster808
	<akuster808@gmail.com>, Mark Hatle <mark.hatle@windriver.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
Thread-Index: AQHTFg+QOKQVwGn4wkKD2SyipOoWWKKGUPQAgACMzYCAAJEAEA==
Date: Wed, 16 Aug 2017 20:43:28 +0000
Message-ID: <a1f52142b9d047cfb6bb85d02dec3b47@XBOX02.axis.com>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<e7e48185-35fe-d230-df54-70b70b3a1bd1@gmail.com>
	<1502891035.13978.130.camel@linuxfoundation.org>
In-Reply-To: <1502891035.13978.130.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Wed, 16 Aug 2017 20:43:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Richard Purdie
> Sent: den 16 augusti 2017 15:44
> To: akuster808 <akuster808@gmail.com>; Mark Hatle
> <mark.hatle@windriver.com>; openembedded-core@lists.openembedded.org
> Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Subject: Re: [OE-core] [PATCH 0/6 v2] Fix RPM4 regressions based on
> Pyro
>=20
> On Tue, 2017-08-15 at 22:19 -0700, akuster808 wrote:
> >
> > On 08/15/2017 02:41 PM, Mark Hatle wrote:
> >
> > Are these meant for Pyro?
>=20
> Some of the initial pieces may be ok for pyro, the actual enablement of
> the rpm deps piece cannot be taken back though as the world will likely
> break.
>=20
> Cheers,
>=20
> Richard

Getting the fixes into Pyro has been my intention from the beginning,=20
as I otherwise need to carry a number of backported bbclasses and other=20
files in our layers, which is always a maintenance burden. The lack of=20
of these fixes in Pyro is the main reason we have not been able to=20
upgrade our distribution to Pyro yet.

I believe it will be possible to get all the changes into Pyro. The=20
only thing that cannot be done by default is to enable it. However,=20
it should be easy to make that conditional (basically the only thing=20
needed is to determine whether --alldeps is passed to rpmdeps or not).
Once all the changes have landed in master, I can prepare a version=20
for Pyro that does that.

//Peter


