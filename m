Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9839C762B3;
	Thu, 26 May 2016 21:02:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 26 May 2016 13:57:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,370,1459839600"; d="scan'208";a="975287645"
Received: from ktan57-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.96])
	by fmsmga001.fm.intel.com with ESMTP; 26 May 2016 13:57:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 27 May 2016 08:57:10 +1200
Message-ID: <1614711.s4bvBbSZBc@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CALbNGRTxYZ-+ZFmxOCguBMbO5X4m6KTaM+jXVqmSBQ8pHuR9UA@mail.gmail.com>
References: <1464054649898.9b34c448@Nodemailer>
	<17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTxYZ-+ZFmxOCguBMbO5X4m6KTaM+jXVqmSBQ8pHuR9UA@mail.gmail.com>
MIME-Version: 1.0
Cc: Cliff Brake <cbrake@bec-systems.com>, e8johan@gmail.com,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Unmaintained layers
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
X-List-Received-Date: Thu, 26 May 2016 21:02:38 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thu, 26 May 2016 22:42:35 Andreas M=FCller wrote:
> On Thu, May 26, 2016 at 10:25 PM, Paul Eggleton
>=20
> <paul.eggleton@linux.intel.com> wrote:
> > On Thu, 26 May 2016 22:18:34 Andreas M=FCller wrote:
> >> On Thu, May 26, 2016 at 10:14 PM, Paul Eggleton
> >>=20
> >> <paul.eggleton@linux.intel.com> wrote:
> >> > On Thu, 26 May 2016 13:46:21 Cliff Brake wrote:
> >> >> On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@inte=
l.com>
> >=20
> > wrote:
> >> >> > meta-java repo was moved to:
> >> >> > git://git.yoctoproject.org/meta-java
> >> >> >=20
> >> >> > Is it possible to update the list with that info?
> >> >>=20
> >> >> Done, thanks!
> >> >>=20
> >> >> https://github.com/cbrake/openembedded-admin/commit/51604da79ed=
5a02341
> >> >> 562
> >> >> a9b f254b3dd9dc71704
> >> >=20
> >> > At some point it would be great if this script could be driven f=
rom the
> >> > OE
> >> > layer index rather than being a separate entity - then updates w=
ould
> >> > largely be self-service for the maintainers, or at least they wo=
uld
> >> > only
> >> > need to be done in one place.
> >>=20
> >> Maybe a bit off-topic but layer index should have some mechanism o=
f
> >> removing rotten layers.
> >=20
> > We've discussed this on-and-off at OE developer meetings for a whil=
e now.
> > FWIW I can remove them manually - actually I just got around to del=
eting
> > meta- picosam9 which has been unmaintained for years.
> >=20
> > Part of the problem though is determining what "rotten" actually me=
ans.
> > Additionally, there's an element of leaving things around in case s=
omeone
> > comes to fork/revive them again. We do show a "last updated" date b=
ut it
> > would be good to figure out some other way of determining and indic=
ating
> > "layer health" - to date I don't think we've managed to figure out
> > anything practical for that.
>=20
> At least meta-kf5 is a candidate. I think it has never worked and
> meta-qt5-extra is (try give my best) - maintained.

Interesting - I hadn't seen that you're covering KDE in meta-qt5-extra.=
 Johan,=20
would you be OK with meta-kf5 being dropped in favour of what's in meta=
-qt5-
extra?

> What about meta-kde4?

It seems Samuel has switched himself to "Inactive" - we probably need s=
ome=20
kind of alert when the last active maintainer of a layer does that. For=
 now=20
I've at least added a note to the entry. Samuel, do you have any opinio=
ns on=20
what we should do with the listing? Or anyone else?

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

