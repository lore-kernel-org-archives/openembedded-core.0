Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A8313738AE;
	Thu, 26 May 2016 20:25:28 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 26 May 2016 13:25:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,370,1459839600"; d="scan'208";a="963105799"
Received: from ktan57-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.172.96])
	by orsmga001.jf.intel.com with ESMTP; 26 May 2016 13:25:27 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas =?ISO-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Date: Fri, 27 May 2016 08:25:23 +1200
Message-ID: <17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.4.9-300.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <CALbNGRTBcwNx0SMYjQ2GbRJviekG8h734t0yH24zeyiQEG367Q@mail.gmail.com>
References: <1464054649898.9b34c448@Nodemailer>
	<3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTBcwNx0SMYjQ2GbRJviekG8h734t0yH24zeyiQEG367Q@mail.gmail.com>
MIME-Version: 1.0
Cc: Cliff Brake <cbrake@bec-systems.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] OE Changelog since 2016-05-15 until 2016-05-22
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
X-List-Received-Date: Thu, 26 May 2016 20:25:29 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Thu, 26 May 2016 22:18:34 Andreas M=FCller wrote:
> On Thu, May 26, 2016 at 10:14 PM, Paul Eggleton
>=20
> <paul.eggleton@linux.intel.com> wrote:
> > On Thu, 26 May 2016 13:46:21 Cliff Brake wrote:
> >> On Tue, May 24, 2016 at 5:23 AM, Maxin B. John <maxin.john@intel.c=
om>=20
wrote:
> >> > meta-java repo was moved to:
> >> > git://git.yoctoproject.org/meta-java
> >> >=20
> >> > Is it possible to update the list with that info?
> >>=20
> >> Done, thanks!
> >>=20
> >> https://github.com/cbrake/openembedded-admin/commit/51604da79ed5a0=
2341562
> >> a9b f254b3dd9dc71704
> >=20
> > At some point it would be great if this script could be driven from=
 the OE
> > layer index rather than being a separate entity - then updates woul=
d
> > largely be self-service for the maintainers, or at least they would=
 only
> > need to be done in one place.
>=20
> Maybe a bit off-topic but layer index should have some mechanism of
> removing rotten layers.

We've discussed this on-and-off at OE developer meetings for a while no=
w. FWIW=20
I can remove them manually - actually I just got around to deleting met=
a-
picosam9 which has been unmaintained for years.

Part of the problem though is determining what "rotten" actually means.=
=20
Additionally, there's an element of leaving things around in case someo=
ne=20
comes to fork/revive them again. We do show a "last updated" date but i=
t would=20
be good to figure out some other way of determining and indicating "lay=
er=20
health" - to date I don't think we've managed to figure out anything pr=
actical=20
for that.

Cheers,
Paul

--=20

Paul Eggleton
Intel Open Source Technology Centre

