Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id D8B776D959
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 16:34:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKGY0Ln004659; Wed, 20 Nov 2013 16:34:00 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id gISxgP1T9RtH; Wed, 20 Nov 2013 16:34:00 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rAKGXrTD004656
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 20 Nov 2013 16:33:55 GMT
Message-ID: <1384965230.16887.71.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 20 Nov 2013 16:33:50 +0000
In-Reply-To: <CANyK_8eftL8mQWsB5BZx3U5A0KF1wrWhUrBqTimys5ogA=pdhw@mail.gmail.com>
References: <CANyK_8c67C4NL7mNf3LTDwurtfpeU+S5ts4+O2t+HiDv84YgaQ@mail.gmail.com>
	<52898177.5000303@windriver.com> <20131118114000.GB3727@jama>
	<1384775852.6460.214.camel@ted>
	<CANyK_8eR05HauKBOd3AoTMjibYBgZEhBSv5pN5Yt_+s2CavsNA@mail.gmail.com>
	<20131118162014.GH3727@jama>
	<CANyK_8eftL8mQWsB5BZx3U5A0KF1wrWhUrBqTimys5ogA=pdhw@mail.gmail.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg dependencies and update-alternatives
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
X-List-Received-Date: Wed, 20 Nov 2013 16:34:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-11-20 at 16:24 +0000, Paul Barker wrote:
> On 18 November 2013 16:20, Martin Jansa <martin.jansa@gmail.com> wrote:
> > On Mon, Nov 18, 2013 at 03:31:09PM +0000, Paul Barker wrote:
> >> On 18 November 2013 11:57, Richard Purdie
> >> <richard.purdie@linuxfoundation.org> wrote:
> >> >
> >> > Paul: Have you any opinion of moving update-alternatives to its own
> >> > repository separate from opkg? or just check it into OE-Core as its just
> >> > a single script? Its not as if it really needs much from opkg at this
> >> > point?
> >>
> >> I'd be quite happy to break it out into a separate repo. I think
> >> that's better than direct inclusion into oe-core so that it remains
> >> easily usable by non-oe systems.
> >
> > What about including it in opkg-utils repo? And maybe even providing u-a
> > by opkg-utils.bb?
> >
> > opkg-utils.bb doesn't have any DEPENDS (Only python RDEPENDS) so it
> > would be good compromise between opkg and completely new recipe.
> >
> 
> I think this is the most sensible option. If u-a is put into a
> separate package it shouldn't need any RDEPENDS either.
> 
> I'll send in the patches I have for oe-core, they'll need a little
> more testing before they're ready to be pushed to the mainline though.

Having a python RDEPENDS means that will turn into python-native and
that is a pretty heavy dependency in its own right :(

Cheers,

Richard






