Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 20828731CA;
	Mon,  4 Jan 2016 19:01:53 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25] helo=e130.local)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1aGAO9-0005bw-GB; Mon, 04 Jan 2016 20:01:53 +0100
Message-ID: <1451934106.2002.99.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 04 Jan 2016 19:01:46 +0000
In-Reply-To: <CAJTo0LY-O9ee3jGoSPOPjqpu=u9zCEo2vfh3jfyxvgC15MWxbQ@mail.gmail.com>
References: <CAJTo0LayEjj9moB9xgup=vB+C9Sn2-WX+s97UWRt9tg=HYFnag@mail.gmail.com>
	<CAJTo0LY-O9ee3jGoSPOPjqpu=u9zCEo2vfh3jfyxvgC15MWxbQ@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [RFC] Delete all .la files?
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
X-List-Received-Date: Mon, 04 Jan 2016 19:01:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-01-04 at 17:28 +0000, Burton, Ross wrote:
> Technicalities time: should this be a new class that is in the default
> INHERIT_DISTRO?  Or directly integrated into base.bbclass?  Does anyone
> have a strong opinion either way?

I think I'd still be inclined to put it in autotools.bbclass, on the
basis that very few non-autotools recipes use libtool.  Second
preference, probably a new class as you suggest, following the argument
that we'd be better off with less rather than more "stuff" in
base.bbclass.  But I don't have a very strong opinion either way. 

p.



