Return-Path: <prvs=068970028=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 21 Jun 2019 11:55:48 UTC
Received: from esa3.bmw.c3s2.iphmx.com (esa3.bmw.c3s2.iphmx.com
	[68.232.133.150])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA6F7D5C4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 11:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1561118151; x=1592654151;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=m1IeqJnJCYERoJKHWZ0mkNBzL+3chdTdlR2wCW9ttwA=;
	b=rNgcf4MtbXe9Ecn9T+62iRExOnUb8S3hkUCeh7dk0wFkcAtFi6HY2aQS
	yMKKBcSlUwPMG0w76WZlUYBg0gaGhM2NG8hJueXNv9334ZOY5wVlIKHZX
	cKDCcEI81ep9k8vVe34+076ok4n9iVt2RfFoANEcPsN7qC6RKJHK/Wf3s k=;
IronPort-SDR: srO45eeS2EN9A6Iv6OXRvNQpeE0eUejGxCCeq4NLJQvDZbCHx395W28HKGun8NjZ5YHW0L/Seu
	wMK2yU5q8P66D1Fq2kPuObadbha3pz6Q/B+WczweSg0v/1jm5aHhwm3JKW5pTkLizLy6JQWbqa
	P+WBkNuFDIIRtvAP8vd71Sci99Iyg1eHq+laGYwJaTMcL+RmnINEc+6fmlHZbW2AytuoYR3i7b
	Z0CYOvLkpJ/Qbu4coHBPRloAAicIaMN1vBDIQZrSz6VSYTxKMaPU4qQyAl3BRY3amA0Ji32FmS
	r3c=
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa3.bmw.c3s2.iphmx.com with ESMTP/TLS; 21 Jun 2019 13:48:39 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw3.muc with ESMTP/TLS;
	21 Jun 2019 13:48:38 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb5.muc with ESMTP/TLS; 21 Jun 2019 13:48:38 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Fri, 21 Jun 2019 13:48:38 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Fri, 21 Jun 2019 13:48:38 +0200
From: <Mikko.Rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/4] cve-update-db: New recipe to update CVE
	database
Thread-Index: AQHVKCEF/7FR1WB9kkiS/l8PQE4K9Kal2vCAgAABzIA=
Date: Fri, 21 Jun 2019 11:48:38 +0000
Message-ID: <20190621114837.GQ3459@hiutale>
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CANNYZj8wEidRKDJtqPHMTQxNtYSD1_btOOfgR5TyoF2zL=KEkg@mail.gmail.com>
In-Reply-To: <CANNYZj8wEidRKDJtqPHMTQxNtYSD1_btOOfgR5TyoF2zL=KEkg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.45]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] cve-update-db: New recipe to update CVE database
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
X-List-Received-Date: Fri, 21 Jun 2019 11:55:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <FBF49C95EDECE54CB752D664E788FF74@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 01:42:11PM +0200, Alexander Kanavin wrote:
> On Fri, 21 Jun 2019 at 13:11, <Mikko.Rapeli@bmw.de> wrote:
>=20
> > This adds python3 urllib3 (python3-urllib3 in Debian) to build environm=
ent
> > dependencies. It's the first user of urllib3 in poky, AFAIK. Maybe
> > documentation could be updated too, e.g.
> >
> > https://www.yoctoproject.org/docs/latest/mega-manual/mega-manual.html#b=
rief-build-system-packages
> >
> > On my Debian 9 build container python3-urllib3 wasn't installed by defa=
ult
> > or via other dependencies.
> >
>=20
> Should this rather be provided via python3-native?

Hmm, possibly? I cherry-picked the patches to sumo and saw this missing
dependency in my container.

Did poky master switch from using host python to native after sumo?

-Mikko=

