Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 797B1606BF;
	Thu, 10 Mar 2016 21:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2AL1ngj030360; Thu, 10 Mar 2016 21:01:49 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id rUnR_EUJfXWN; Thu, 10 Mar 2016 21:01:49 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2AL1jSh030357
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 10 Mar 2016 21:01:46 GMT
Message-ID: <1457643705.2804.229.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org, Alexander Kanavin
	<alexander.kanavin@linux.intel.com>
Date: Thu, 10 Mar 2016 21:01:45 +0000
In-Reply-To: <20160310115851.GD2573@jama>
References: <20150904153710.BBCFA50436@opal.openembedded.org>
	<20160310115851.GD2573@jama>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] Alexander Kanavin : remake: update to 4.1+dbg-1.1
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
X-List-Received-Date: Thu, 10 Mar 2016 21:01:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2016-03-10 at 12:58 +0100, Martin Jansa wrote:
> On Fri, Sep 04, 2015 at 03:37:10PM +0000, git@git.openembedded.org wr
> ote:
> > Module: openembedded-core.git
> > Branch: master
> > Commit: fb781bee39e312eef1d89c2d7f5ab27e8da1ee32
> > URL:    http://git.openembedded.org/?p=openembedded-core.git&a=comm
> > it;h=fb781bee39e312eef1d89c2d7f5ab27e8da1ee32
> > 
> > Author: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> > Date:   Thu Sep  3 18:34:18 2015 +0300
> > 
> > remake: update to 4.1+dbg-1.1
> > 
> > remake-remove-errors-about-colophon-and-cygnus-comma.patch has been
> > merged upstream
> 
> Fails to build after make was built. Shouldn't it be at least
> blacklisted
> by default so that potential user will need to explicitly decide
> between
> make and remake (and unmerge the other one from sysroot first)?

I think (but can't remember for sure) that if you make both recipes
PROVIDE virtual/make, the right things should happen?

Cheers,

Richard

