Return-Path: <paul@paulbarker.me.uk>
X-Greylist: delayed 602 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 May 2016 08:19:07 UTC
Received: from 10.mo4.mail-out.ovh.net (10.mo4.mail-out.ovh.net
	[188.165.33.109])
	by mail.openembedded.org (Postfix) with ESMTP id D35D47713A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 08:19:07 +0000 (UTC)
Received: from player773.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id ED6E31000E58
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 May 2016 10:02:51 +0200 (CEST)
Received: from nuc.betafive.co.uk
	(cpc11-shep11-2-0-cust130.8-3.cable.virginm.net [86.27.96.131])
	(Authenticated sender: paul@betafive.co.uk)
	by player773.ha.ovh.net (Postfix) with ESMTPSA id 84347600076;
	Mon, 30 May 2016 10:02:49 +0200 (CEST)
Date: Mon, 30 May 2016 09:04:28 +0100
From: Paul Barker <paul@paulbarker.me.uk>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20160530090428.4b070d61@nuc.betafive.co.uk>
In-Reply-To: <17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
References: <1464054649898.9b34c448@Nodemailer>
	<3785754.gtfDI8MhLU@peggleto-mobl.ger.corp.intel.com>
	<CALbNGRTBcwNx0SMYjQ2GbRJviekG8h734t0yH24zeyiQEG367Q@mail.gmail.com>
	<17859297.OlYCXzWKo0@peggleto-mobl.ger.corp.intel.com>
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.25; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Ovh-Tracer-Id: 17558127575192013244
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeekledrhedvgddufeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
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
X-List-Received-Date: Mon, 30 May 2016 08:19:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 27 May 2016 08:25:23 +1200
Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> On Thu, 26 May 2016 22:18:34 Andreas M=C3=BCller wrote:
> >=20
> > Maybe a bit off-topic but layer index should have some mechanism of
> > removing rotten layers.
>=20
> We've discussed this on-and-off at OE developer meetings for a while
> now. FWIW I can remove them manually - actually I just got around to
> deleting meta- picosam9 which has been unmaintained for years.
>=20
> Part of the problem though is determining what "rotten" actually
> means. Additionally, there's an element of leaving things around in
> case someone comes to fork/revive them again. We do show a "last
> updated" date but it would be good to figure out some other way of
> determining and indicating "layer health" - to date I don't think
> we've managed to figure out anything practical for that.
>=20
> Cheers,
> Paul
>=20

meta-mmmpi can go, I haven't updated it in over 2 years, SRC_URI links
are out-of-date and it almost certainly won't compile against recent
releases.

Perhaps "last updated" could be used to nudge layer maintainers when a
layer looks stale. An automated email could tell them to check in to
confirm that the layer is still valid or let you know that it can be
removed.

Thanks,
Paul Barker

