Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 63CF460D37
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 22:36:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s02Ma9R6032617; Thu, 2 Jan 2014 22:36:09 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id GqVRp6Htskmw; Thu,  2 Jan 2014 22:36:09 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s02Ma4eM032613
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 2 Jan 2014 22:36:05 GMT
Message-ID: <1388702160.11527.135.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Thu, 02 Jan 2014 22:36:00 +0000
In-Reply-To: <5263086.KLRCisNdLW@helios>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
	<5263086.KLRCisNdLW@helios>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/38] Cleanup series
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
X-List-Received-Date: Thu, 02 Jan 2014 22:36:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2014-01-02 at 20:56 +0000, Paul Eggleton wrote:
> On Saturday 28 December 2013 22:28:56 Paul Eggleton wrote:
> > I got a bit tired of seeing poor SUMMARY and DESCRIPTION values in our
> > recipes, so I went on a bit of a quest to clean them up, and ended up
> > tidying up a few other things in the process.
> > 
> > This touches quite a few recipes, so I've tried to split the series into
> > logical patches to aid review. I built all of the affected recipes and
> > skimmed over the changes in pkgdata and they looked reasonable.
> > Hopefully all of the changes make sense; I'm happy to have feedback as
> > always.
> > 
> > 
> > The following changes since commit 421e927bd453259f4b3cdbd1676f6e12f97bf34f:
> > 
> >   openssl: use PACKAGECONFIG to disable perl bits (2013-12-21 09:09:22
> > +0000)
> > 
> > are available in the git repository at:
> > 
> >   git://git.openembedded.org/openembedded-core-contrib paule/cleanup3
> >  
> > http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paul
> > e/cleanup3
> 
> Richard, which branch did you merge for these? It doesn't look like it was 
> this one...

I picked up poky-contrib paule/cleanup3, I reused a line from bash
history, pasted the branchname in and it worked showing a set of patches
which looked about right :( I missed the fact it was a pull request
against oecore-contrib, sorry.

Cheers,

Richard




