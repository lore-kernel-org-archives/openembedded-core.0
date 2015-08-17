Return-Path: <prvs=664fe6b1a=Mikko.Rapeli@bmw.de>
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 56D9965CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 06:14:29 +0000 (UTC)
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 17 Aug 2015 08:14:29 +0200
Received: from unknown (HELO esabb2.muc) ([160.50.100.34]) by esagw3.muc with
	ESMTP/TLS; 17 Aug 2015 08:14:27 +0200
Received: from smuch57a.muc (HELO SMUCH57A.europe.bmw.corp) ([160.46.137.109])
	by esabb2.muc with ESMTP/TLS; 17 Aug 2015 08:14:26 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH57A.europe.bmw.corp ([160.46.137.109]) with mapi id 14.03.0248.002;
	Mon, 17 Aug 2015 08:14:26 +0200
From: <Mikko.Rapeli@bmw.de>
To: <clarson@kergoth.com>
Thread-Topic: [OE-core] shell script guidelines in oe-core? (was Re: [PATCH
	v4] create-pull-request: cleanup bashisms)
Thread-Index: AQHQ1R/1Iwsy18FzQ0CjaLPM7oWRhZ4IgduAgAABYgCAANNMAIAClyCAgAHPAwCAAd97gA==
Date: Mon, 17 Aug 2015 06:14:25 +0000
Message-ID: <20150817061425.GA6102@loska>
References: <1439303596-18965-1-git-send-email-ed.bartosh@linux.intel.com>
	<1439372011-26268-1-git-send-email-ed.bartosh@linux.intel.com>
	<20150812094953.GL6102@loska>
	<CAMKF1squ7h9gzvrX8u3m2_K_BeO7gto_ji5f4UBdJxnuNMyLZA@mail.gmail.com>
	<CABcZANmtCK18u2m2R51SmZN3Xrq7+FxY8PXMXJ4Y6-WVA3tGMQ@mail.gmail.com>
	<CABcZANkHBUNH5Zo3opKT-uwfneMYghTBTJCV8awOm-6D_0SK1w@mail.gmail.com>
	<20150813062742.GN6102@loska>
	<CABcZANkKkXbb+5BFYBARLOTGKBdaon_+4cvQDGDZw8WWqSmt_g@mail.gmail.com>
	<CABcZANkBfrtA86wHOEnXY=2vKb6QLerR8OG7njcQRbVqsDV+-g@mail.gmail.com>
In-Reply-To: <CABcZANkBfrtA86wHOEnXY=2vKb6QLerR8OG7njcQRbVqsDV+-g@mail.gmail.com>
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
X-List-Received-Date: Mon, 17 Aug 2015 06:14:34 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <DFBB999EC271574DB6B913FCD772EA5A@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 15, 2015 at 06:38:18PM -0700, Christopher Larson wrote:
> Update: checkbashisms and shellcheck both check for this now.

This is great! How about formulating that oe-core shell scripts should
pass shellcheck and checkbashisms checks without warnings?

-Mikko=

