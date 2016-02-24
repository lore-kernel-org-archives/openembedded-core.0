Return-Path: <maciej.borzecki@open-rnd.pl>
Received: from akt59.rev.netart.pl (akt59.rev.netart.pl [85.128.150.59])
	by mail.openembedded.org (Postfix) with ESMTP id 0405D772E8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 18:36:14 +0000 (UTC)
Received: from poczta.nazwa.pl (unknown [10.252.0.18])
	by open-rnd.nazwa.pl (Postfix) with ESMTP id 2FC222DA112;
	Wed, 24 Feb 2016 19:36:13 +0100 (CET)
Date: Wed, 24 Feb 2016 19:36:13 +0100 (CET)
From: Maciej Borzecki <maciej.borzecki@open-rnd.pl>
To: Trevor Woerner <twoerner@gmail.com>, 
	Philip Balister <philip@balister.org>, 
	openembedded-core@lists.openembedded.org, 
	Joshua Lock <joshua.g.lock@intel.com>
Message-ID: <2004047530.280482.ea828785-f98d-49f8-b462-023ff7545478.open-xchange@poczta.nazwa.pl>
In-Reply-To: <56CDDBCD.6090303@balister.org>
References: <cover.1456325292.git.joshua.g.lock@intel.com>
	<56CDD519.9050109@gmail.com> <56CDDBCD.6090303@balister.org>
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.0-Rev20
X-Originating-Client: com.openexchange.ox.gui.dhtml
Subject: Re: [PATCH 00/10] Integrate swupd software updater
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
X-List-Received-Date: Wed, 24 Feb 2016 18:36:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

> Dnia 24 luty 2016 o 17:35 Philip Balister <philip@balister.org> napisa=C5=
=82(a):
>
>
> On 02/24/2016 11:06 AM, Trevor Woerner wrote:
> > Ideally the work done here and the work done on meta-swupdate[1] would
> > be somehow merged so people creating images/distros would only have to
> > learn and integrate one software update solution, instead of having to
> > evaluate and choose between the two (or more?).
> >
> >
> > [1] https://github.com/sbabic/meta-swupdate
>
> Amen. I had the same thoughts reading the patch set intro.
>
> Maybe the swupd should go in a seperate layer so we can see which
> project works best for oe users before moving something directly into
> oe-core?
>

Frankly, swupdate is more embedded oriented. If I was to choose which
one fits better into OE, I would say that swupdate does. However, in the
end, both projects have their uses.

`swupd` is a new thing and I'm not aware of it being used in any other
project than ClearLinux.  From what I've seen[1] there are some nice
concepts that might prove useful in embedded (maybe even automotive
applications?), but I have not tried it personally.

`swupdate` on the other hand is very much embedded oriented. It's aware
of u-boot, ubifs volumes, MTD, and is capable of updating firmware. I've
used it, even contributed some code, and so far I've had a rather
positive experience using it. There are some quirks in meta-swupdate
that might need fixing, for ex. the actual process of building of update
images is a bit convoluted, lack of systemd awareness, and certain
assumptions about the update method that I don't agree with. I have some
patches queued up, but they're more like shameful hacks than something
worth upstreaming at this point.

[1]. https://lists.clearlinux.org/pipermail/dev/2016-January/000159.html

--
Maciej Borz=C4=99cki
Senior Software Engineer at Open-RnD Sp. z o.o.
www.open-rnd.pl, Facebook, Twitter

