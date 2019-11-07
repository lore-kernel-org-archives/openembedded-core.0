Return-Path: <prvs=20756b77e=Mikko.Rapeli@bmw.de>
Received: from esa1.bmw.c3s2.iphmx.com (esa1.bmw.c3s2.iphmx.com
	[68.232.133.201])
	by mail.openembedded.org (Postfix) with ESMTP id 830D17F7BA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 07:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1573113580; x=1604649580;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=jKOIVNTq4oqjaf9IGJqPSe0BBfF2Fp+1hAOulZLkTCA=;
	b=a7UrtkEGbblhDEZaGpuwf6BT/ut95/IKg3KnrSRZ8jr8ccj37Sp1c7F9
	evsC7rmhGziCNnSl9rboE49pYiDkvANNsKIe4HAs2sQCKSWFrEuXzQmqL
	wyelg9bgZKDT+LeyyklczOdcPpoc322RRpz5OX16Lb7WJn+CnoLj46t1J 8=;
IronPort-SDR: PFIA3x25t/D6xN2Zo62Iv8DAzNY0HcheGNcRum4hzXP8fhsH1xWC+oEj4QoifStre11Sk+owr+
	O41yoRFw/mEZAaNy7PQJYz9OFF9/mb/pTgbYjo6hg6kEjrtwF9jF5F6zNYsAPHbaOz8vgxanE1
	dg3ZoAQbVQRzwjeMvFdY3lFjj9c3kiyFH9ztN14p71WNyvP6tSyUTzBZ0aIhdEI27UuP1xssUY
	zelIowbi1cdHyiqudE9Ou+mujPnqKfNGicNDP2tmt79tlXjSInX4zAd6sBYQPESuH5Jl4Tf/cF
	x9k=
Received: from esagw5.bmwgroup.com (HELO esagw5.muc) ([160.46.252.46]) by
	esa1.bmw.c3s2.iphmx.com with ESMTP/TLS; 07 Nov 2019 08:59:33 +0100
Received: from esabb1.muc ([160.50.100.31])  by esagw5.muc with ESMTP/TLS;
	07 Nov 2019 08:59:32 +0100
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb1.muc with ESMTP/TLS; 07 Nov 2019 08:59:31 +0100
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Thu, 7 Nov 2019 08:59:31 +0100
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1473.005;
	Thu, 7 Nov 2019 08:59:31 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
Thread-Topic: maintaining sumo (was Re: [OE-core] [PATCH][thud] cve-check:
	backport rewrite from master)
Thread-Index: AQHVlUFJlw35RjLUSUubI3ndnQ+70g==
Date: Thu, 7 Nov 2019 07:59:31 +0000
Message-ID: <20191107075931.GD2398@hiutale>
References: <20190925122349.14872-1-ross.burton@intel.com>
	<CAD0U-hJLV7F3K4VdX0GUKO9LRazWLz1rvp1xmWh6fzgzP3gcFQ@mail.gmail.com>
	<20191106160618.GC2398@hiutale>
	<e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
In-Reply-To: <e3de40a47b9b208f08c3123ad59c8caf25d581d6.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: maintaining sumo (was Re: [PATCH][thud] cve-check: backport rewrite from master)
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
X-List-Received-Date: Thu, 07 Nov 2019 07:59:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3A70E7050E605843A780E333432878D8@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Nov 06, 2019 at 05:53:27PM +0000, Richard Purdie wrote:
> On Wed, 2019-11-06 at 16:06 +0000, Mikko.Rapeli@bmw.de wrote:
> > Hi,
> >=20
> > On Wed, Nov 06, 2019 at 02:59:16PM +0000, Ryan Harkin wrote:
> > > Hi Ross/Richard,
> > >=20
> > > I'd like this applied to Sumo also. Should I create a new patch and
> > > send it
> > > to the list, or is there a process for requesting this is cherry-
> > > picked
> > > across?
> >=20
> > I just posted the port of this and all other CVE scan related changes
> > to sumo
> > http://lists.openembedded.org/pipermail/openembedded-core/2019-November=
/288817.html
> >=20
> > But the question is valid :)
>=20
> Support for sumo officially ended. I can see a case that the broken CVE
> tools there are a good reason we could consider merging the patch
> series but we do need to be able to test it to merge it to the main
> branch. If we can't test, we're merging blind and the quality the
> project tries to deliver could be compromised.
>=20
> I have made some tweaks to the autobuilder which bring us closer to
> being able to test sumo using the workers still around from that
> release.
>=20
> The things that make me nervous are questions like:
>=20
> Which releases do we "open" for such patches? How far back do we go?
> Which kinds of patches are acceptable?
>=20
> Note that sumo (and earlier) doesn't have much of the QA automation
> which we've now built our processes around so we don't get test
> reports.
>=20
> You mention wanting to change gcc. That means we really do need a full
> retest of it to merge that (which is why it never happened originally
> from what I remember).
>=20
> Also, the LTS proposal stated we needed someone to handle this work. We
> have no such person, even if we do somehow find them, they can't be
> expected to cover all the old releases and effectively turn all of them
> into LTS releases. How can we get the funding to try and get some help
> with handling this workload?
>=20
> I am probably going to try and make a case for sorting the CVE tooling
> on sumo as I agree its bad and we should do something. Where do we draw
> the line though.
>=20
> Basically, this looks like it could create a lot of extra work without
> helping the core project under-resourcing we currently struggle with.
> You can therefore see why I might be nervous :/.

All this is understood.

I need to maintain sumo in a project for a while longer so I can publish th=
at work.
The CVE checker patches are just a start.

Providing funding for Yocto Project LTS work is possible but a lot harder f=
or me to do.
Testing and publishing patches is much easier.

Could you clarify Yocto Project side answers to these questions:

If I continue to publish patches for sumo, can I continue doing so on oe-co=
re mailing list?

If I continue to collect patches for sumo, can I do so using Yocto Project =
infrastructure, e.g.
a sumo-contrib-lts or similar branch in poky git tree?

If I continue to test patches, what would be the patch acceptance criteria =
and required testing?
I would assume same as stable release rules, but maybe these need to be eve=
n stricter, e.g.
only support building on Debian stable, following the LTS proposal. I'm tes=
ting in my own project
trees and CI with target HW, and doing world builds on pure poky with qemu =
target. I could some
kind of ptest execution to plain poky as well.

Would any testing of patches be possible in Yocto Project infrastructure?

All of these things I can do also completely outside of Yocto Project, e.g.=
 publish a sumo
git tree on github, and rely only on my own testing. But I'd like to see
some co-operation here from other users who are stuck with sumo.

-Mikko=

