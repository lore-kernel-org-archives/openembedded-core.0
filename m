Return-Path: <prvs=6607d1ab7=Mikko.Rapeli@bmw.de>
Received: from esa10.bmw.c3s2.iphmx.com (esa10.bmw.c3s2.iphmx.com
	[68.232.139.98])
	by mail.openembedded.org (Postfix) with ESMTP id 4783876312
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 06:27:47 +0000 (UTC)
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
	esa10.bmw.c3s2.iphmx.com with ESMTP/TLS; 13 Aug 2015 08:27:39 +0200
Received: from unknown (HELO esabb2.muc) ([160.50.100.34]) by esagw4.muc with
	ESMTP/TLS; 13 Aug 2015 08:27:39 +0200
Received: from smuch55a.muc (HELO SMUCH55A.europe.bmw.corp) ([160.46.137.111])
	by esabb2.muc with ESMTP/TLS; 13 Aug 2015 08:27:38 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH55A.europe.bmw.corp ([160.46.137.111]) with mapi id 14.03.0248.002;
	Thu, 13 Aug 2015 08:27:38 +0200
From: <Mikko.Rapeli@bmw.de>
To: <clarson@kergoth.com>
Thread-Topic: [OE-core] shell script guidelines in oe-core? (was Re: [PATCH
	v4] create-pull-request: cleanup bashisms)
Thread-Index: AQHQ1R/1Iwsy18FzQ0CjaLPM7oWRhZ4IgduAgAABYgCAANNMAA==
Date: Thu, 13 Aug 2015 06:27:38 +0000
Message-ID: <20150813062742.GN6102@loska>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
	<20150812094953.GL6102@loska>
	<CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
	<CABcZANmtCK18u2m2R51SmZN3Xrq7+FxY8PXMXJ4Y6-WVA3tGMQ@mail.gmail.com>
	<CABcZANkHBUNH5Zo3opKT-uwfneMYghTBTJCV8awOm-6D_0SK1w@mail.gmail.com>
In-Reply-To: <CABcZANkHBUNH5Zo3opKT-uwfneMYghTBTJCV8awOm-6D_0SK1w@mail.gmail.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: shell script guidelines in oe-core? (was Re: [PATCH v4] create-pull-request: cleanup bashisms)
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
X-List-Received-Date: Thu, 13 Aug 2015 06:27:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <145E5AA63424C146A6E191838C21023E@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 12, 2015 at 10:51:26AM -0700, Christopher Larson wrote:
> That reminds me, there's a shell portability issue / standards-complaince
> issue that's not identified by shellcheck. Typically, to negate a  bracke=
t
> expression in a regular expression, one uses ^, e.g. [^a-z] is everything
> that isn't in the range a to z, but that's not the case in shell, e.g. at=
 a
> prompt or in a ${foo#<pattern>}:
>=20
>     "[...]a bracket expression as in XBD *RE Bracket Expression* , except
> that the <exclamation-mark> character ( '!' ) shall replace the
> <circumflex> character ( '^' ) in its role in a non-matching list in the
> regular expression notation"
>=20
> So in shell, you'd want [!a-z] rather than [^a-z]. Nearly all shells hand=
le
> both, but the behavior of the latter is actually unspecified according to
> the standard:
>=20
>     "A bracket expression starting with an unquoted <circumflex> characte=
r
> produces unspecified results."
>=20
> I recently got bitten by this with one of my shell scripts on a system
> running dash.

Does checkbashisms warn about this?

-Mikko=

