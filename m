Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TFOJm-0003VE-4m for openembedded-core@lists.openembedded.org;
	Sat, 22 Sep 2012 13:56:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MBhS7j005176;
	Sat, 22 Sep 2012 12:43:28 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01781-03; Sat, 22 Sep 2012 12:43:24 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8MBhIms005169
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Sat, 22 Sep 2012 12:43:20 +0100
Message-ID: <1348314198.10108.197.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>, Mark Hatle
	<mark.hatle@windriver.com>
Date: Sat, 22 Sep 2012 12:43:18 +0100
In-Reply-To: <20120921151817.GG10268@jama.jama.net>
References: <1348237488.10108.83.camel@ted>
	<1348237670.15074.234.camel@phil-desktop>
	<20120921151817.GG10268@jama.jama.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Phil Blundell <philb@gnu.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH] bitbake.conf: Change WORKDIR to split by PN and version into seperate directories
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Sep 2012 11:56:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2012-09-21 at 17:18 +0200, Martin Jansa wrote:
> On Fri, Sep 21, 2012 at 03:27:48PM +0100, Phil Blundell wrote:
> > On Fri, 2012-09-21 at 15:24 +0100, Richard Purdie wrote:
> > > As per the previous patch, this is really a request for comments, I can
> > > see pros and cons...
> > 
> > I've been using this configuration locally for quite some time (it's
> > needed for rm_old_works in particular) and it seems to be an improvement
> > in general.
> 
> Last time I was using rm_old_works without this change
> https://github.com/shr-distribution/meta-smartphone/commit/0d4c17de1ba7343d82bb10c311754e29d573c485
> 
> I've seen a lot of /usr/src/debug/${EXTENDPE}${PV}-${PR}" on target from
> -dbg packages, which doesn't look right, was this fixed in whatever packs 
> source code to -dbg packages?

Probably from the way splitfile2 works in package.bbclass. I think this
should be using ${PF} explicitly if that is what it wants...

Cheers,

Richard




