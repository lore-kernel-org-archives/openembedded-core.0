Return-Path: <prvs=7981aab84=Mikko.Rapeli@bmw.de>
Received: from esa4.bmw.c3s2.iphmx.com (esa4.bmw.c3s2.iphmx.com
	[68.232.139.62])
	by mail.openembedded.org (Postfix) with ESMTP id F11C479017
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537796560; x=1569332560;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=GdGYAW53VGyt8+lvWOnBWbcE9rT6z0k/sWsP8o6yEAU=;
	b=jJmfu+jV1lahBby38p3LGAqT6KDdGXfA9YoNVPT2p9VsBjF+L6NU9L7P
	zOpJDN3C7GXWrusoISL0OX3cwUG/so+M/uALSlfUqGEcnC9dGuwq8hPBw
	oqy5080YpffpHIfbyBZZoCLAwqJzxZFh+0G1wuS6PAtlHt5NmM69q7WFW w=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa4.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Sep 2018 15:42:37 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw1.muc with ESMTP/TLS;
	24 Sep 2018 15:42:36 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb5.muc with ESMTP/TLS; 24 Sep 2018 15:42:35 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Mon, 24 Sep 2018 15:42:35 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 24 Sep 2018 15:42:35 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: allow exporting files from
	kernel recipes to sysroot
Thread-Index: AQHUUaE9h/4Az64dPkO/QKSNq++KT6T+6syAgABQQYCAAAHVgIAADneAgAAChICAAAUiAIAAARwA
Date: Mon, 24 Sep 2018 13:42:35 +0000
Message-ID: <20180924134234.GK9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
In-Reply-To: <36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.46]
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: allow exporting files from kernel recipes to sysroot
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
X-List-Received-Date: Mon, 24 Sep 2018 13:42:37 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <7726F2B485732D4F933B3C805275EE8D@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 02:38:36PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Mon, 2018-09-24 at 13:20 +0000, Mikko.Rapeli@bmw.de wrote:
> > On Mon, Sep 24, 2018 at 02:11:13PM +0100, Richard Purdie wrote:
> > > On Mon, 2018-09-24 at 12:19 +0000, Mikko.Rapeli@bmw.de wrote:
> > > > > That was one old way, but not the only. And not for exposing
> > > > > non
> > > > > uapi
> > > > > headers.
> > > >=20
> > > > What other ways exist?
> > > >=20
> > > > I don't care how, but I must export custom kernel specific
> > > > headers
> > > > and
> > > > other files to other recipes in a build in ways which are
> > > > compatible
> > > > with
> > > > yocto upstream.
> > > >=20
> > > > I have not seen any documented ways for this.
> > >=20
> > > It may not be documented, perhaps because its actually very simple.
> > >=20
> > > Any recipe can expose headers into the recipe sysroot, they simply
> > > install them where needed in do_install as normal.
> > >=20
> > > So all you need is a recipe which installs the right headers and
> > > then
> > > you DEPEND on that recipe. Where that recipe gets the headers isn't
> > > relevant.
> >=20
> > No, this does not work on sumo. My patch is needed for this to work.
> >=20
> > Without my patch, users of kernel.bbclass have zero files in
> > tmp/sysroot-components even if they install extra files and extra
> > header only binary packages.
> >=20
> > A generated image or SDK will have the files if the binary package is
> > installed but sysroot not.
>=20
> I was replying from the perspective of how this should work in general.
> I agree that for this to work with a kernel recipe we do need the
> change that started this thread and that is probably a reasonable thing
> to do.

Good, then my patch is not going in the wrong direction.

Remaining problem is if file overwrites will be detected or not so that
accidental overrides of files in linux-libc-headers from kernel recipes
should not be possible...

-Mikko=

