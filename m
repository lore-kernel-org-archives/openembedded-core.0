Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TxJzt-0007zt-9o for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 17:13:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LFvoX1017650;
	Mon, 21 Jan 2013 15:57:50 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16855-01; Mon, 21 Jan 2013 15:57:45 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id r0LFvdQ0017643
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Mon, 21 Jan 2013 15:57:40 GMT
Message-ID: <1358783859.14265.66.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 15:57:39 +0000
In-Reply-To: <cover.1358782098.git.ross.burton@intel.com>
References: <cover.1358782098.git.ross.burton@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] Remove GUPnP
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
X-List-Received-Date: Mon, 21 Jan 2013 16:13:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-01-21 at 15:29 +0000, Ross Burton wrote:
> GUPnP is great, but it's untested in oe-core.  It's now in meta-multimedia where
> it's been upgraded and live alongside companion projects such as dLeyna and
> Rygel.

There is a trend at the moment to remove things from OE-Core. That is
well and good but the question is where to draw the line. I do want to
ensure we keep at least some cross section of software in the core so
that the core can be stressed in a variety of environments.

I'm not saying gupnp shouldn't move out however I do want to figure out
what is going to stay in the core that we can test with. Obviously
things remaining the core really do need end user apps that we can
stress them with.

I was a little sad to see gthumb being removed for example as we now
have no image viewer in the core. It was also a larger gtk app so
stressed more of that side of the apis. I took the patches as it
probably does belong in meta-gnome. How do we test the various image
decoding libraries are in fact working though?

Food for thought...

Cheers,

Richard





