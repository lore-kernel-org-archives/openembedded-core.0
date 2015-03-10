Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5934173A08
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2015 12:02:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2AC2M7h004253; Tue, 10 Mar 2015 12:02:22 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id r48uX1ZJooxU; Tue, 10 Mar 2015 12:02:22 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2AC25n6004190
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 10 Mar 2015 12:02:16 GMT
Message-ID: <1425988925.9114.6.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 10 Mar 2015 12:02:05 +0000
In-Reply-To: <20150303070532.GA2337@jama>
References: <cover.1423484647.git.Martin.Jansa@gmail.com>
	<1b8369849e9c3f271231c88e9303e9cbba261a94.1423484647.git.Martin.Jansa@gmail.com>
	<20150227092322.GK2309@jama> <20150303070532.GA2337@jama>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: Re: [PATCHv6 1/1] recipes: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Tue, 10 Mar 2015 12:02:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-03-03 at 08:05 +0100, Martin Jansa wrote:
> On Fri, Feb 27, 2015 at 10:23:22AM +0100, Martin Jansa wrote:
> > On Mon, Feb 09, 2015 at 01:25:15PM +0100, Martin Jansa wrote:
> > > * it's not complete, but recipes depending on virtual/libx11 are easiest
> > >   to spot, I've long list of PNBLACKLIST for all recipes which cannot
> > >   be built in distro without x11 in DISTRO_FEATURES
> > 
> > PING
> > 
> > This was first sent 8 months ago, it's trivial change, please merge it
> > in 1.8.
> 
> Ping!
> 
> This is very disappointing and probably one of my last patches to
> oe-core.

I did already talk and apologise to Martin about this, and there is a
thread about this on the TSC list. This kind of delay is unacceptable,
there were some reasons for it related to wanting to ideally do this
better in bitbake. No such work has been forthcoming, nor is it likely
to any time soon so I've taken this patch.

Sorry about the delay. Hopefully this is an exception rather than the
way things tend to work.

I also do realise patches have been slow over the past week or two.
Feature freeze caused a stampede of build breaking patches and its taken
us a while to weed out the problematic ones and fix various bits of
breakage :(. Hopefully we're back to "normal" now (keeping in mind this
is now bug fixing for release in April). There are some upgrades that
won't make it in, there was just too much too late to get everything in
and maintain quality.

Cheers,

Richard



