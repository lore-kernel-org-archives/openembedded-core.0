Return-Path: <prvs=068970028=Mikko.Rapeli@bmw.de>
Received: from esa9.bmw.c3s2.iphmx.com (esa9.bmw.c3s2.iphmx.com
	[68.232.133.110])
	by mail.openembedded.org (Postfix) with ESMTP id CEFAE7E71D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 12:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1561119353; x=1592655353;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=pgP68z9K4wfmtDVog2zAOL2sRvv3GEQ6meN/ZMy1vuQ=;
	b=T7rET3bAL3XzfUg+4aah2X0VxrijvHoCXHYsmQC1mpMxF+D5NkPQSC7x
	9ceiPC9nCTox8Uvmt+rJqBhSMrx8tLOxKUZN5SsGb9JPSxK3mm5AXgvIA
	7ppidweNOVN//hwCr4ON4obMFf0Wt2Yv1dvC2uNrRnCF6cvGQ0KgNQXJ7 c=;
IronPort-SDR: NBhYBEPgsl6qg6tU5HLQ2c0ZWi54wprK8Hx779uelMd6e3wcwqBfCbZvl5KVfrjV0DtVQbG4mZ
	c1ltGZsJWgQrmATqRTounW3OtuJ+5j4DVC4UvJVzeIO6EB/t1t3z2iUHtfroSwx8gMG1bk1thH
	Vjs6h5oOcnwYWbAwRg7kmi2nmHKrou0V8PXPHkcQc4CDWG2osLYaJuXR1ylBYB4lN0EZBd9XQa
	/W/0B5agJNMSEYTOLZjpRo/grmFToQbsQoUK+0ZGtTyUFHdzwtJtQWG4WKdsYswqoqMMn99tDy
	aqA=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa9.bmw.c3s2.iphmx.com with ESMTP/TLS; 21 Jun 2019 14:15:37 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw5.muc with ESMTP/TLS;
	21 Jun 2019 14:15:36 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb3.muc with ESMTP/TLS; 21 Jun 2019 14:15:36 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Fri, 21 Jun 2019 14:15:36 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.004;
	Fri, 21 Jun 2019 14:15:36 +0200
From: <Mikko.Rapeli@bmw.de>
To: <alex.kanavin@gmail.com>
Thread-Topic: [OE-core] [PATCH 1/4] cve-update-db: New recipe to update CVE
	database
Thread-Index: AQHVKCEF/7FR1WB9kkiS/l8PQE4K9Kal2vCAgAABzICAAAQwAIAAA1mA
Date: Fri, 21 Jun 2019 12:15:36 +0000
Message-ID: <20190621121535.GT3459@hiutale>
References: <20190619135940.18544-1-lemagoup@gmail.com>
	<20190619202149.GA12516@localhost>
	<CAEz4NHp3y=GOXUBSb1K3Gv+fEW-5HD9A9nWRsgTvxdToMT0GJQ@mail.gmail.com>
	<20190621110356.GO3459@hiutale>
	<CANNYZj8wEidRKDJtqPHMTQxNtYSD1_btOOfgR5TyoF2zL=KEkg@mail.gmail.com>
	<20190621114837.GQ3459@hiutale>
	<CANNYZj-8OLPyDoo3xOtBVKctMnbaM2+G8zwNLCvfJHe4K8G21Q@mail.gmail.com>
In-Reply-To: <CANNYZj-8OLPyDoo3xOtBVKctMnbaM2+G8zwNLCvfJHe4K8G21Q@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.33]
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
X-List-Received-Date: Fri, 21 Jun 2019 12:15:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <2E141DB983C3364D883BB0E4C7013930@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2019 at 02:03:36PM +0200, Alexander Kanavin wrote:
> On Fri, 21 Jun 2019 at 13:48, <Mikko.Rapeli@bmw.de> wrote:
>
> >
> > Hmm, possibly? I cherry-picked the patches to sumo and saw this missing
> > dependency in my container.
> >
> > Did poky master switch from using host python to native after sumo?
> >
>=20
> poky uses host python for some things and native python for other things.
> Generally where 'core python' is enough then we use the host python, but
> when additional libraries are needed, then native python plus those
> libraries is a better choice, as this doesn't require adding to the
> required host packages list, and allows better control over how they're
> built.

Currently do_populate_cve_db is executed using host python, and
the DEPENDS field is empty, and INHIBIT_DEFAULT_DEPS =3D "1". python-urllib=
3
is also not available in poky, but only in meta-openembedded.

I'm fine with additional python3-urllib3 dependency to bitbake build host
tools when running CVE check builds. Just wanted to document it.

-Mikko=

