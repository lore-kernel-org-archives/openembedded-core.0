Return-Path: <prvs=7981aab84=Mikko.Rapeli@bmw.de>
Received: from esa8.bmw.c3s2.iphmx.com (esa8.bmw.c3s2.iphmx.com
	[68.232.139.97])
	by mail.openembedded.org (Postfix) with ESMTP id B235F601D4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1537797332; x=1569333332;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=zlgVssdq56XB9tfbc/iUV7eqcFIoITSpAcrfp9RJnKw=;
	b=j7v7uF5J47Xh+/8hV5kVWlVSLQI4VUcxoCEjcTUjVfqjERlSC1n/yYhE
	V5Doi08fDqbzUpsf+Vdw8s5fd82QCXvgTfTQcp6VNAvcOLGd12kM5i7ns
	5XSGiAhHRIzW3UcSJXGEDeVagWMQVqjg5Jp8px9WyEo9Rb9iP8LiVGG5C E=;
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa8.bmw.c3s2.iphmx.com with ESMTP/TLS; 24 Sep 2018 15:55:30 +0200
Received: from esabb5.muc ([160.50.100.47])  by esagw5.muc with ESMTP/TLS;
	24 Sep 2018 15:55:29 +0200
Received: from smucm10k.bmwgroup.net (HELO smucm10k.europe.bmw.corp)
	([160.48.96.47])
	by esabb5.muc with ESMTP/TLS; 24 Sep 2018 15:55:29 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10k.europe.bmw.corp
	(160.48.96.47) with Microsoft SMTP Server (TLS;
	Mon, 24 Sep 2018 15:55:29 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 24 Sep 2018 15:55:29 +0200
From: <Mikko.Rapeli@bmw.de>
To: <bruce.ashfield@gmail.com>
Thread-Topic: [OE-core] [PATCH] kernel.bbclass: allow exporting files from
	kernel recipes to sysroot
Thread-Index: AQHUUaE9h/4Az64dPkO/QKSNq++KT6T+6syAgABQQYCAAAHVgIAADneAgAAChICAAAUiAIAAARwAgAAAdwCAAACHgIAAAKYAgAAB9oA=
Date: Mon, 24 Sep 2018 13:55:28 +0000
Message-ID: <20180924135527.GL9430@hiutale>
References: <20180924072539.GE9430@hiutale>
	<CADkTA4MBwLt_7AHDqVfh79KNB_sG58+gGWLz=4KqMg1Qpk1Ngg@mail.gmail.com>
	<20180924121927.GI9430@hiutale>
	<045ad825c6999fe4876a7aa90cb427ca2d0d8c87.camel@linuxfoundation.org>
	<20180924132013.GJ9430@hiutale>
	<36b0c47b199a55e4c385f437aad964980c20dd61.camel@linuxfoundation.org>
	<20180924134234.GK9430@hiutale>
	<aeea3a8ffd2dac5f295e4357a3058505546fa1dd.camel@linuxfoundation.org>
	<CADkTA4MfAESbzUV99QR8gCWLaC-R18wuR8fTbS7aWaZWzhttYA@mail.gmail.com>
	<CADkTA4O_nCQTD-3UrCqk95HYj=XvjqduaCkUR5d6FKeUyBNPmw@mail.gmail.com>
In-Reply-To: <CADkTA4O_nCQTD-3UrCqk95HYj=XvjqduaCkUR5d6FKeUyBNPmw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.35]
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
X-List-Received-Date: Mon, 24 Sep 2018 13:55:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B50F97797D36CB419CF78366A965E620@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 24, 2018 at 09:48:26AM -0400, Bruce Ashfield wrote:
> On Mon, Sep 24, 2018 at 9:46 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> > On Mon, Sep 24, 2018 at 9:44 AM,  <richard.purdie@linuxfoundation.org> =
wrote:
> >> On Mon, 2018-09-24 at 13:42 +0000, Mikko.Rapeli@bmw.de wrote:
> >>> On Mon, Sep 24, 2018 at 02:38:36PM +0100, richard.purdie@linuxfoundat
> >>> ion.org wrote:
> >>> > I was replying from the perspective of how this should work in
> >>> > general.
> >>> > I agree that for this to work with a kernel recipe we do need the
> >>> > change that started this thread and that is probably a reasonable
> >>> > thing
> >>> > to do.
> >>>
> >>> Good, then my patch is not going in the wrong direction.
> >>>
> >>> Remaining problem is if file overwrites will be detected or not so
> >>> that
> >>> accidental overrides of files in linux-libc-headers from kernel
> >>> recipes
> >>> should not be possible...
> >>
> >> That is a general problem and the core sstate code shouldn't let that
> >> happen these days so I think that is already covered?
> >
> > Yep, it should be covered. I was just looking for confirmation.
> >
> > Can everyone have a look at:
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D5305
> >
> > And confirm that it can be closed by this .. ? I suggested my approach
> > in that bug, but it
> > never went anywhere at the time.
>=20
> Sorry for all the email, I hit send a bit too soon.
>=20
> The only issue that would remain for that bug is that there's no
> standard/default location for those exported extra headers, and it
> is up to the kernel recipe packager to make sure that their recipes
> know where to look for them.
>=20
> I'm not convinced there has to be a standard location for them, so
> I'll all for closing that old bug.

It would be nice for kernel.bbclass to help creating the custom kernel spec=
ific
-dev package with headers, and it would be nice to have a kernel-headers.bb=
class
to help users to find them by adding the path to default include paths for
the recipe. And while writing wishlists, would be nice to support multiple
kernel recipes per machine. We forced a second recipe by cloning the
kernel and other bbclasses and added a different prefix...

But I'm ok with my patch and doing other things per recipe for now.

-Mikko=

