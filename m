Return-Path: <prvs=582f76665=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 601 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 27 May 2015 07:02:15 UTC
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id 12EE865D6E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 May 2015 07:02:15 +0000 (UTC)
Authentication-Results: esa5.bmw.c3s2.iphmx.com;
	dkim=neutral (message not signed) header.i=none
Received-SPF: None (esa5.bmw.c3s2.iphmx.com: no sender
	authenticity information available from domain of
	Mikko.Rapeli@bmw.de) identity=pra; client-ip=160.46.252.49;
	receiver=esa5.bmw.c3s2.iphmx.com;
	envelope-from="Mikko.Rapeli@bmw.de";
	x-sender="Mikko.Rapeli@bmw.de"; x-conformance=sidf_compatible
Received-SPF: None (esa5.bmw.c3s2.iphmx.com: no sender
	authenticity information available from domain of
	Mikko.Rapeli@bmw.de) identity=mailfrom;
	client-ip=160.46.252.49; receiver=esa5.bmw.c3s2.iphmx.com;
	envelope-from="Mikko.Rapeli@bmw.de";
	x-sender="Mikko.Rapeli@bmw.de"; x-conformance=sidf_compatible
Received-SPF: None (esa5.bmw.c3s2.iphmx.com: no sender
	authenticity information available from domain of
	postmaster@esagw6.muc) identity=helo;
	client-ip=160.46.252.49; receiver=esa5.bmw.c3s2.iphmx.com;
	envelope-from="Mikko.Rapeli@bmw.de";
	x-sender="postmaster@esagw6.muc"; x-conformance=sidf_compatible
X-IronPort-AV: E=Sophos;i="5.13,502,1427752800"; 
   d="scan'208";a="6408147"
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49])
	by esa5.bmw.c3s2.iphmx.com with ESMTP/TLS/DHE-RSA-CAMELLIA256-SHA;
	27 May 2015 08:52:15 +0200
Received: from unknown (HELO esabb2.muc) ([160.50.100.34])
	by esagw6.muc with ESMTP/TLS/DHE-RSA-CAMELLIA256-SHA;
	27 May 2015 08:52:14 +0200
X-IronPort-AV: E=Sophos;i="5.13,502,1427752800"; d="scan'208";a="11702354"
Received: from smuch55a.muc (HELO SMUCH55A.europe.bmw.corp) ([160.46.137.111])
	by esabb2.muc with ESMTP/TLS/AES128-SHA; 27 May 2015 08:52:14 +0200
Received: from SMUCM65A.europe.bmw.corp ([160.46.134.155]) by
	SMUCH55A.europe.bmw.corp ([160.46.137.111]) with mapi id 14.03.0224.002;
	Wed, 27 May 2015 08:52:14 +0200
From: <Mikko.Rapeli@bmw.de>
To: <paul.eggleton@linux.intel.com>
Thread-Topic: [OE-core] [PATCH] buildhistory: set commit user name and email
	for the new git repo
Thread-Index: AQHQksih4WI/vOwVykCmcGf7GX9A8Z2OQaKAgAAtDQCAAN2GgA==
Date: Wed, 27 May 2015 06:52:13 +0000
Message-ID: <20150527065209.GG12838@loska>
References: <1432104329-6352-1-git-send-email-mikko.rapeli@bmw.de>
	<20150526145803.GD12838@loska>
	<14638698.5EJEmMHEkv@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <14638698.5EJEmMHEkv@peggleto-mobl.ger.corp.intel.com>
Accept-Language: en-US, de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.44.101]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory: set commit user name and email for the new git repo
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
X-List-Received-Date: Wed, 27 May 2015 07:02:20 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <09D5FA816C56E84CBD226A190504046F@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 06:39:18PM +0100, Paul Eggleton wrote:
> Hi Mikko,
>=20
> On Tuesday 26 May 2015 14:58:02 Mikko.Rapeli@bmw.de wrote:
> > Already fixed by merged commit:
> >=20
> > http://git.openembedded.org/openembedded-core/commit/?id=3Df62255bfa6c5=
a322c86
> > 7b7c4ea5686ea7bfab3fe
> >=20
> > -Mikko
>=20
> My apologies for basically duplicating your patch - by coincidence I was=
=20
> talking to our QA team about resolving what turned out to be the same iss=
ue at=20
> around the same time.

No problem. In my patch I set the git user.name and user.email every time
to allow changing settings in local.conf without rebuilding from scratch
but if that really becomes a problem then I'll send a new patch.

-Mikko=

