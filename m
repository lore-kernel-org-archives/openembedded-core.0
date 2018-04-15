Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 99512744BD;
	Sun, 15 Apr 2018 21:12:34 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w3FLCTYD023186
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 15 Apr 2018 22:12:30 +0100
Message-ID: <1523826749.2942.358.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Trevor Woerner <twoerner@gmail.com>
Date: Sun, 15 Apr 2018 22:12:29 +0100
In-Reply-To: <20180414214812.GA25986@linux-uys3>
References: <1523011021.2942.6.camel@linuxfoundation.org>
	<20180406141647.GA19068@linux-uys3>
	<1523028587.2942.13.camel@linuxfoundation.org>
	<a04373f5-cb03-25a3-36fa-da92b0cdd71d@gmail.com>
	<1523051813.2942.36.camel@linuxfoundation.org>
	<20180414214812.GA25986@linux-uys3>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.4 at dan
X-Virus-Status: Clean
Cc: Alexander Kanavin <alexander.kanavin@intel.com>, openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] LAYERSERIES
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
X-List-Received-Date: Sun, 15 Apr 2018 21:12:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2018-04-14 at 17:48 -0400, Trevor Woerner wrote:
> On Fri 2018-04-06 @ 10:56:53 PM, Richard Purdie wrote:
> > 
> > To be really clear, "master" is never a value that would appear in
> > LAYERSERIES. That would let everyone be lazy and master would match
> > everywhere, then this would all be pointless.
> So what happens when the master branch of a BSP layer doesn't work
> with the
> last release, but bitbake hasn't been updated with the next release's
> name?
> 
> I.e. the sumo branch of meta-bsp has
> 
> 	LAYERSERIES_COMPAT_bsp = "sumo"
> 
> but what am I supposed to put as the value when meta-bsp's master
> branch
> becomes incompatible with sumo? "master" is not allowed, and "thud"
> fails too.
> 
> At some point between one release and the next something might/will
> break. In
> which case the only thing a BSP's master branch will work with is
> openembedded-core's master.

Post release of sumo we'll add thud as a possible option to OE-Core and
things should be ok?

Cheers,

Richard

