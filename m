Return-Path: <prvs=7981aab84=Mikko.Rapeli@bmw.de>
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id BC4AC75477
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 14:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537798796; x=1569334796;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=0BvnYiL3bvFw0OpZ144247mIgF+TzYHLi+DT4PZfCc8=;
	b=n+s8OTJYzw6kXM31qYHvvJnVn19BT/Jn/gphnOnk0PU9zfhHlpZ/V77L
	hlGNfGRFeOFhEsCg2oRIoxip2G+xxOkoBrBN4mYdQpft5zhqOrCSBFGwl
	FR8VRkFDxHSseVg/PVSvcia7d9tmvq9XhJEO0LB63uGYfw4XV6tVGPFJS g=;
Received: from esagw3.bmwgroup.com (HELO esagw3.muc) ([160.46.252.35]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Sep 2018 16:19:55 +0200
Received: from esabb2.muc ([160.50.100.34])  by esagw3.muc with ESMTP/TLS;
	24 Sep 2018 16:19:54 +0200
Received: from smucm10m.bmwgroup.net (HELO smucm10m.europe.bmw.corp)
	([160.48.96.49])
	by esabb2.muc with ESMTP/TLS; 24 Sep 2018 16:19:54 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10m.europe.bmw.corp
	(160.48.96.49) with Microsoft SMTP Server (TLS;
	Mon, 24 Sep 2018 16:19:54 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 24 Sep 2018 16:19:54 +0200
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: allow exporting files from
	kernel recipes to sysroot
Thread-Index: AQHUUaE9h/4Az64dPkO/QKSNq++KT6T+6syAgABQQYCAAAHVgIAADneAgAAChICAAAUiAIAAAUcAgAAD0ICAAAZygA==
Date: Mon, 24 Sep 2018 14:19:54 +0000
Message-ID: <20180924141953.GM9430@hiutale>
References: <1537530567-8604-1-git-send-email-mikko.rapeli@bmw.de>
	<20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<CADkTA4OOvw7xqYs0Pd9eOwY3pmELhnk8ThnyuhdermCrhpmRGw@mail.gmail.com>
	<6e907abfede0cad4292c4c44ea74f4f8bbe90093.camel@linuxfoundation.org>
In-Reply-To: <6e907abfede0cad4292c4c44ea74f4f8bbe90093.camel@linuxfoundation.org>
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
X-List-Received-Date: Mon, 24 Sep 2018 14:19:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <1E1F928586FA03469C350EB3CC1B628A@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 02:56:49PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Mon, 2018-09-24 at 09:43 -0400, Bruce Ashfield wrote:
> > > On Mon, 2018-09-24 at 13:20 +0000, Mikko.Rapeli@bmw.de wrote:
> > > > On Mon, Sep 24, 2018 at 02:11:13PM +0100, Richard Purdie wrote:
> > > > > On Mon, 2018-09-24 at 12:19 +0000, Mikko.Rapeli@bmw.de wrote:
> > > > > > > That was one old way, but not the only. And not for
> > > > > > > exposing
> > > > > > > non
> > > > > > > uapi
> > > > > > > headers.
> > > > > >=20
> > > > > > What other ways exist?
> > > > > >=20
> > > > > > I don't care how, but I must export custom kernel specific
> > > > > > headers
> > > > > > and
> > > > > > other files to other recipes in a build in ways which are
> > > > > > compatible
> > > > > > with
> > > > > > yocto upstream.
> > > > > >=20
> > > > > > I have not seen any documented ways for this.
> > > > >=20
> > > > > It may not be documented, perhaps because its actually very
> > > > > simple.
> > > > >=20
> > > > > Any recipe can expose headers into the recipe sysroot, they
> > > > > simply
> > > > > install them where needed in do_install as normal.
> > > > >=20
> > > > > So all you need is a recipe which installs the right headers
> > > > > and
> > > > > then
> > > > > you DEPEND on that recipe. Where that recipe gets the headers
> > > > > isn't
> > > > > relevant.
> > > >=20
> > > > No, this does not work on sumo. My patch is needed for this to
> > > > work.
> > > >=20
> > > > Without my patch, users of kernel.bbclass have zero files in
> > > > tmp/sysroot-components even if they install extra files and extra
> > > > header only binary packages.
> > > >=20
> > > > A generated image or SDK will have the files if the binary
> > > > package is
> > > > installed but sysroot not.
> > >=20
> > > I was replying from the perspective of how this should work in
> > > general.
> > > I agree that for this to work with a kernel recipe we do need the
> > > change that started this thread and that is probably a reasonable
> > > thing
> > > to do.
> >=20
> > We have a Yocto bugzilla that can be closed if you are ok with the
> > approach.
> >=20
> > To answer the other question about what I've done (and proposed
> > before) was
> > to maintain the kernel.bbclass protections, all call the staging
> > routines myself.
> >=20
> > i.e.
> >=20
> > do_install_append() {
> >         make headers_install
> > INSTALL_HDR_PATH=3D${D}${KERNEL_ALT_HEADER_DIR}
> >=20
> >         # remove export artifacts
> >         find ${D}${KERNEL_ALT_HEADER_DIR} -name .install -exec rm {}
> > \;
> >         find ${D}${KERNEL_ALT_HEADER_DIR} -name ..install.cmd -exec
> > rm {} \;
> > }
> >=20
> > sysroot_stage_all_append() {
> >     sysroot_stage_dir ${D}${KERNEL_ALT_HEADER_DIR}
> > ${SYSROOT_DESTDIR}${KERNEL_ALT_HEADER_DIR}
> > }
> >=20
> > And that works to get things exported.
>=20
> I'm fine with this approach, I'm kind of surprised anyone thinks
> otherwise as I've always assumed this was what people were doing!
>=20
> I'd propose that:
>=20
> a) We document the above approach. I prefer it to Mikko's patch since
> it doesn't mess with the blacklist and installs exactly what the recipe
> wants to install which is how we normally write recipes.
> b) To document it, I suggest a comment/reference in kernel.bbclass and
> we add something somewhere in the manual. Adding Scott Rifenbark to cc
> so he can help us sort this out.
> c) Close out the bug Bruce mentions with this documentation as a
> reference.
>=20
> I think this means we probably don't need Mikko's patch and it is
> mainly a documentation issue?

My only complaint is that it's not obvious in a kernel recipe that
more than do_install() is needed to export files to sysroot.
It's easy to miss the sysroot_stage_all_append() step.

Overwriting files from kernel recipe fails when they are used to prepare
sysroots for user recipes, but not when the kernel recipe is build:

ERROR: linux-image-1.0.0-r21 do_prepare_recipe_sysroot: The file /usr/inclu=
de/scsi/scsi_bsg_fc.h is installed by both linux-libc-headers and linux, ab=
orting
ERROR: linux-image-1.0.0-r21 do_prepare_recipe_sysroot: Function failed: ex=
tend_recipe_sysroot

In this case linux recipe added kernel specific headers to /usr/include
which conflict with linux-libc-headers and this was only cought when buildi=
ng
the kernel image.

-Mikko=

