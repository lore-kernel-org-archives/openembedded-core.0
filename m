Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDM7h-0001qh-8Z
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 22:06:53 +0200
Received: by ggnq1 with SMTP id q1so4881453ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 13:01:11 -0700 (PDT)
Received: by 10.223.75.137 with SMTP id y9mr34294273faj.14.1318276871177;
	Mon, 10 Oct 2011 13:01:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm33396496fai.16.2011.10.10.13.01.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 13:01:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKq+9Bhu9A8jZhYH-uBVSWcncsNQvAxyNxLnG133J237iA@mail.gmail.com>
Date: Mon, 10 Oct 2011 22:01:07 +0200
Message-Id: <CDD7988D-2486-484F-B1A5-347A38D64F01@dominion.thruhere.net>
References: <678AE8F3-DBF3-4315-83A5-AA2CA040C5D8@dominion.thruhere.net>
	<CAP9ODKq+9Bhu9A8jZhYH-uBVSWcncsNQvAxyNxLnG133J237iA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: Multiple git repos in SRC_URI and/or git submodules support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 10 Oct 2011 20:06:53 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 10 okt. 2011, om 21:40 heeft Otavio Salvador het volgende geschreven:

> On Mon, Oct 10, 2011 at 15:19, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
> ...
>> I'm not going to do 1), 3) is unlikely, so I want to ask if 2) is =
already supported. I've seen various patches that add an 'unpackdir' or =
similar, but I can't find any docs on it. Can someone enlighten me on =
the current status of that?
> ...
>=20
> Yes, this works. I have added support to SRCREV_FORMAT into gitpkgv =
too ;-)

So what's the magic param I need to pass to the fetcher to make this =
work?=


