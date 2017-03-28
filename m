Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2764777B20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Mar 2017 14:25:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 1B69F2E08A;
	Tue, 28 Mar 2017 16:25:52 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id TbU79teuVQGb; Tue, 28 Mar 2017 16:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bes.se.axis.com (Postfix) with ESMTPS id 222622E5CA;
	Tue, 28 Mar 2017 16:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 115031A06D;
	Tue, 28 Mar 2017 16:25:51 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 065961A06B;
	Tue, 28 Mar 2017 16:25:51 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Tue, 28 Mar 2017 16:25:50 +0200 (CEST)
Received: from XBOX01.axis.com (xbox01.axis.com [10.0.5.15])
	by seth.se.axis.com (Postfix) with ESMTP id EEFBB2070;
	Tue, 28 Mar 2017 16:25:50 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX01.axis.com (10.0.5.15) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Tue, 28 Mar 2017 16:25:50 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Tue, 28 Mar 2017 16:25:50 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>, OE Core mailing list
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] classes: Standardize strings tests, and join
	some if/then/while/do lines
Thread-Index: AQHSp7EztGFvCHKPLU2Sq9OvyykwmqGqSSjw
Date: Tue, 28 Mar 2017 14:25:50 +0000
Message-ID: <01f71a47963847fbb79bf376b814d551@XBOX02.axis.com>
References: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
In-Reply-To: <alpine.LFD.2.20.1703280641380.4243@uk63952.mitel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] classes: Standardize strings tests, and join some if/then/while/do lines
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
X-List-Received-Date: Tue, 28 Mar 2017 14:25:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> Robert P. J. Day
> Sent: den 28 mars 2017 12:51
> To: OE Core mailing list
> Subject: [OE-core] [PATCH] classes: Standardize strings tests, and join
> some if/then/while/do lines
>=20
>=20
> For better or worse, two types of cleanup in meta/classes directory:
>=20
> * Replace old-style 'x${VAR} =3D x' tests with -n/-z string tests
> * Unsplit lines to keep if/then, while/do on same line
>=20
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>=20
> ---
>=20
>   i realize there are two types of tidying here -- if that offends
> people, i can split it into two separate submissions. nothing here
> should affect execution, but it's always possible i screwed something
> up, not sure how to rigourously test these changes.
>=20
>   also, when i did change a shell string test, i added {} around the
> variable name, it's just a standard i like for visual clarity. apply
> all or part of what seems useful.

You should absolutely not do this, especially if you want visual clarity=20
in a BitBake recipe. This makes the variable look like a BitBake variable=20
instead of a shell variable,  and not just to us humans, but to bitbake=20
as well. It will cause bitbake to put an unnecessary dependency on the=20
(typically non-existent) BitBake variable ${VAR} in the state signature=20
for the shell function. Which, as Ross pointed out, will cause problems=20
in the case where there actually are both a BitBake variable and a shell=20
variable with the same name.

In addition to that, you would throw at least our company's shell expert=20
into a fit if you tried to do that in any shell code at all. ;)

//Peter


