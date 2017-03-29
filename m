Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7CE77BEB;
	Wed, 29 Mar 2017 22:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTP id v2TMG9sJ014032; 
	Wed, 29 Mar 2017 23:16:09 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id BG6iTSJsT7V6; Wed, 29 Mar 2017 23:16:09 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v2TMG7lS014010
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 29 Mar 2017 23:16:08 +0100
Message-ID: <1490825767.13980.333.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denis@denix.org>, Marek Vasut <marex@denx.de>
Date: Wed, 29 Mar 2017 23:16:07 +0100
In-Reply-To: <20170329215658.GP15664@denix.org>
References: <20170327142231.21807-1-marex@denx.de>
	<1490624701.13980.267.camel@linuxfoundation.org>
	<5c037512-7bf1-8a3c-cb76-fda7230781a0@denx.de>
	<20170329215658.GP15664@denix.org>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] u-boot: Update to 2017.03 release
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
X-List-Received-Date: Wed, 29 Mar 2017 22:16:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-03-29 at 17:56 -0400, Denys Dmytriyenko wrote:
> On Mon, Mar 27, 2017 at 04:31:16PM +0200, Marek Vasut wrote:
> > 
> > On 03/27/2017 04:25 PM, Richard Purdie wrote:
> > > 
> > > On Mon, 2017-03-27 at 16:22 +0200, Marek Vasut wrote:
> > > > 
> > > > Upgrade U-Boot to the latest version.
> > > Wrong list and how does this compare to Ovatio's patch?
> > I was not CCed on Otavio's patch :(
> Yeah, me neither, unfortunately - people just ignore maintainers file
> now.
> 
> Good thing Ross copied me on the other discussion!

This raises a very valid point which is what any maintainers file is
and what it is not.

The one that exists in meta-yocto today has a very specific meaning. I
know there is discussion about moving it to OE-Core however if we do so
I want to by *really* *really* clear about what being listed there
means and does not mean.

As things stand right now, there is no requirement or advice in any of
our guides to cc "maintainers". People struggle to send patches as it
is and giving them more hoops to jump through doesn't seem like a
brilliant idea to me. I know we can create a file with all kinds of
path matching for files people care/don't care about but I worry this
will descend into complicated scripts and people still getting upset
when they were cc'd needlessly or weren't cc'd etc.

I also quite strongly dislike the "I own X, so only I can change it"
type view, to be the maintainers are people who help look after
specific areas in the absence of anyone else and help review patches
that come in. They certainly get significant influence on things but
the price for that is they also have to help fix issues and figure out
ways of helping others with issues in that area.

So please think very carefully about what you want this "maintainers"
file to be/not be as I worry its a huge can of worms we once tried in
OE before...

Cheers,

Richard


