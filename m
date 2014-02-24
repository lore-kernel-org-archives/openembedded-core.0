Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 49AC76028A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 23:02:02 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1ON1e0B005956; Mon, 24 Feb 2014 23:01:41 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 14v4jyHDg_5Q; Mon, 24 Feb 2014 23:01:40 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1ON1WR9005951
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Mon, 24 Feb 2014 23:01:34 GMT
Message-ID: <1393282885.31769.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Mon, 24 Feb 2014 23:01:25 +0000
In-Reply-To: <1393261200.31769.17.camel@ted>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<52C0CDD6.4030904@windriver.com> <5014991.yOqVctVWSl@helios>
	<19353110.0dHagEzKPJ@peggleto-mobl5.ger.corp.intel.com>
	<1393261200.31769.17.camel@ted>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org, Saul Wold <saul.wold@intel.com>
Subject: Re: [PATCH 01/38] *-basic: rename to *-standardlinux
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
X-List-Received-Date: Mon, 24 Feb 2014 23:02:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2014-02-24 at 17:00 +0000, Richard Purdie wrote:
> On Mon, 2014-02-24 at 16:38 +0000, Paul Eggleton wrote:
> > On Monday 30 December 2013 12:59:26 Paul Eggleton wrote:
> > > On Monday 30 December 2013 09:35:18 Robert Yang wrote:
> > > > I'm afraid that the standardlinux maybe a little confused with
> > > > linuxstdbase, bu I don't have any better idea about it.
> > > 
> > > You could be right. I've thought for a long time about renaming this and
> > > haven't been able to come up with anything better. On the other hand, in our
> > > current configuration we are actually using the basic/standardlinux
> > > packagegroup as part of our LSB images; although that might not be the
> > > right thing to continue doing - LSB probably ought to be independent.
> > > 
> > > FWIW, let's consider this particular patch as RFC, maybe someone else has a
> > > better idea of what to name it. I am very much convinced that "basic" is not
> > > the right name though.
> > 
> > So, has anyone got any better ideas for the name of core-image-basic and 
> > packagegroup-core-basic?
> > 
> > The idea is that these are meant to contain things that you might have on a 
> > more traditional or full-featured Linux system. Somehow "-traditionallinux" 
> > doesn't really work either.
> 
> "fulllinux"?
> 
> "linuxcmdline"?

I think I'm starting to lean to simply "cmdline"...

Cheers,

Richard


