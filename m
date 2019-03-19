Return-Path: <prvs=9743c004c=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 430 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 Mar 2019 07:59:17 UTC
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 670DC6C497
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 07:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1552982359; x=1584518359;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=coor041tNEWgtfFJzK+vEaEqI82Px7BD2M5fWFXS6rE=;
	b=gUTCHaov8glVOau7dGnRHgy0c6HFAouiFtC5CNgFBMkNdU9I6uFmY4x+
	AVWYAT3AmsDJhHGfpfJewP+EPYKwcj/MGYDqyWSR60eqelzw+Y4ohOG5z
	Gh+2/Rcu5/PYN5sbirTBVcyCmS757O2f/XpOeMVHqczqIhDdlXiexs3GM E=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 19 Mar 2019 08:52:08 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw3.muc with ESMTP/TLS;
	19 Mar 2019 08:52:06 +0100
Received: from smucm10j.bmwgroup.net (HELO smucm10j.europe.bmw.corp)
	([160.48.96.46])
	by esabb6.muc with ESMTP/TLS; 19 Mar 2019 08:52:06 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10j.europe.bmw.corp
	(160.48.96.46) with Microsoft SMTP Server (TLS;
	Tue, 19 Mar 2019 08:52:06 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.003;
	Tue, 19 Mar 2019 08:52:06 +0100
From: <Mikko.Rapeli@bmw.de>
To: <schnitzeltony@gmail.com>
Thread-Topic: [OE-core] [thud][PATCH] Revert "boost: update to 1.69.0"
Thread-Index: AQHU3aoZZ5BtVjOVYEiPB1+kpTMzZKYRjNCAgAD4YwA=
Date: Tue, 19 Mar 2019 07:52:06 +0000
Message-ID: <20190319075206.GK20077@hiutale>
References: <1552927535-19740-1-git-send-email-akuster808@gmail.com>
	<CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
In-Reply-To: <CALbNGRT1_qD8LYEP7X7JexnEOW7AsC84ceatZ3BLgECoo7vixQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.39]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [thud][PATCH] Revert "boost: update to 1.69.0"
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
X-List-Received-Date: Tue, 19 Mar 2019 07:59:17 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B1C4F50412554F4D96CE8A8F03B9791D@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 18, 2019 at 06:03:05PM +0100, Andreas M=FCller wrote:
> On Mon, Mar 18, 2019 at 5:45 PM Armin Kuster <akuster808@gmail.com> wrote=
:
> >
> > This reverts commit a384248938ea9db096866bf4ec8678d35ca62a12.
> >
> > This package update slipped in doing the maint process. Removing it.
<snip>
> Just my opinion - don't consider this as NAK.
>=20
> * I already fixed the recipes that failed for me. For at least one the
> change is no more compatible to 1.68.0.
> * This makes PV going backwards
>=20
> Thanks for addressing - what do others think?

I'm not using thud yet, but updating boost in stable branch would break
too many things and I would have to revert that change in our trees. Some b=
oost
updates are in the end quite trivial and just require recompiling
everything but still, I would prefer that boost is not updated in stable
branches unless there is a huge security/stability issue with the old versi=
on.

Hope this helps,

-Mikko=

