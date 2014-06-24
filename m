Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 71FA765D32;
	Tue, 24 Jun 2014 09:08:14 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5O97jiT027668; Tue, 24 Jun 2014 10:07:45 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id MyZamiv-L8H9; Tue, 24 Jun 2014 10:07:45 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5O97cDW027660
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 24 Jun 2014 10:07:39 +0100
Message-ID: <1403600852.2104.125.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 24 Jun 2014 10:07:32 +0100
In-Reply-To: <20140621080922.GE2117@jama>
References: <20140621080922.GE2117@jama>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: State of bitbake world, Failed tasks 2014-06-21
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
X-List-Received-Date: Tue, 24 Jun 2014 09:08:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-06-21 at 10:09 +0200, Martin Jansa wrote:
> On Wed, Jun 11, 2014 at 12:57:59PM +0200, Martin Jansa wrote:
> > On Tue, Jun 10, 2014 at 12:07:22PM +0200, Martin Jansa wrote:
> > > On Mon, Jun 02, 2014 at 10:49:50AM +0200, Martin Jansa wrote:
> > > > This build still contains huge patch setting B = S or inherit for
> > > > autotools-brokensep for all recipes which were failing in earlier
> > > > master builds.
> > 
> > I've removed this patch for this build to see how bad it is. And it's BAD.
> 
> Now it doesn't have the big B=S patch, but long patchset of PNBLACKLISTs I've sent
> earlier this week.
> 
> http://www.openembedded.org/wiki/Bitbake_World_Status
> 
> == Failed tasks 2014-06-21 ==
> 
> I have a fix for python-cython. This doesn't include the big patch from RP.
> 
> === common (28) ===
[...]
>     * openembedded-core/meta/recipes-multimedia/gstreamer/gst-ffmpeg_0.10.13.bb, do_configure

The gst-ffmpeg failure is somewhat strange. Both libav and libpostproc
can provide libpostproc but at least in my tests, it builds just fine
regardless of which one(s) I've previously built (both in OE-Core and
with meta-oe added).

So I'm not sure why its happening or therefore how to fix it :/.

Cheers,

Richard




