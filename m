Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C31976067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 22:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6CMRKiK029255; Tue, 12 Jul 2016 23:27:20 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id IS1TjEbeubGC; Tue, 12 Jul 2016 23:27:20 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u6CMRFYh029251
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 12 Jul 2016 23:27:16 +0100
Message-ID: <1468362435.28829.118.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: akuster808 <akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jul 2016 23:27:15 +0100
In-Reply-To: <5785627D.9080800@gmail.com>
References: <5784A2D0.9030902@mlbassoc.com>
	<CAJTo0LbByAsem7asRmieaeVvLHarr8D9zynCUncEqt0J2JvmfQ@mail.gmail.com>
	<57855DCA.1080807@gmail.com>
	<CAJTo0LbJfZSNr5U9G8rBLXfqWfjf3R7uSatEwuQFSA9SfWh+xQ@mail.gmail.com>
	<5785627D.9080800@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Gary Thomas <gary@mlbassoc.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Future of GCC
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
X-List-Received-Date: Tue, 12 Jul 2016 22:27:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2016-07-12 at 14:34 -0700, akuster808 wrote:
> 
> On 07/12/2016 02:24 PM, Burton, Ross wrote:
> > On 12 July 2016 at 22:14, akuster808 <akuster808@gmail.com> wrote:
> > 
> > > > Personally I was thinking that gcc 5.x and 6.x should stay in
> > > > oe-core for
> > > > this cycle, and then drop 5.x after the release.
> > > 
> > > 
> > > Wouldn't that be dropped iff GCC 7.0 is release? or are you
> > > saying we
> > > should only have one GCC version?
> > > 
> > 
> > Well, depends on the adoption and migration problems.  I don't
> > think we
> > should carry three versions,
> 
> I agree. 3 is too many.
> 
>  and ideally one, but two is acceptable to ease
> > migration.
> 
> One makes Stable maintenance less costly in time.

I'm personally a fan of one if we can do it. We've taken a bit of an
"easier" path recently but it might be time to change that. Right now
I'm not aware of any of our core usecases which need 5.x, all work with
6.x. I am aware of some BSPs on older kernels which would however have
issues.

I did nearly send a 5.x removal patch but wasn't sure it would be
accepted by people quite yet...

Cheers,

Richard


