Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2EB4B607A5;
	Tue, 15 Mar 2016 16:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2FGIbZO022452; Tue, 15 Mar 2016 16:18:37 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XTM7pqzA7ToA; Tue, 15 Mar 2016 16:18:37 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u2FGIYwd022446
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 15 Mar 2016 16:18:35 GMT
Message-ID: <1458058714.7615.3.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, Martin Jansa
	<martin.jansa@gmail.com>, openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2016 16:18:34 +0000
In-Reply-To: <56E82EBA.10008@linux.intel.com>
References: <20150904153710.BBCFA50436@opal.openembedded.org>
	<20160310115851.GD2573@jama>
	<1457643705.2804.229.camel@linuxfoundation.org>
	<56E82EBA.10008@linux.intel.com>
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
X-List-Received-Date: Tue, 15 Mar 2016 16:18:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-03-15 at 17:48 +0200, Alexander Kanavin wrote:
> On 03/10/2016 11:01 PM, Richard Purdie wrote:
> 
> > > Fails to build after make was built. Shouldn't it be at least
> > > blacklisted
> > > by default so that potential user will need to explicitly decide
> > > between
> > > make and remake (and unmerge the other one from sysroot first)?
> > 
> > I think (but can't remember for sure) that if you make both recipes
> > PROVIDE virtual/make, the right things should happen?
> 
> remake recipe already includes this line:
> PROVIDES += "make"
> 
> And we also have this in distro config:
> PREFERRED_PROVIDER_make ?= "make"
> 
> And yet, if you try to build remake after make, the right thing 
> (clearing out the sysroot files installed by make) does not happen.
> Any 
> suggestions?

I think virtual/make would make more "magic" happen...

I think "make" would have made some of that happen though, hmm.

Cheers,

Richard

