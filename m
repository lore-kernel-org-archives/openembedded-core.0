Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QbXbv-0004bv-02 for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 14:41:47 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SCc6OD022800
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:38:06 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 22538-05 for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:38:02 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p5SCc0iO022794
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 13:38:01 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <4E09C426.1020904@intel.com>
References: <cover.1309246787.git.edwin.zhai@intel.com>
	<7bf8a7025dddd0b251ff9c37a55f28b7e099fad7.1309246787.git.edwin.zhai@intel.com>
	<E91A85C8-4484-4C15-A75D-3A87EB475B4F@dominion.thruhere.net>
	<4E098D41.4060808@intel.com>
	<D552A863-6204-4F54-9B5A-07DC755B830E@dominion.thruhere.net>
	<4E09C426.1020904@intel.com>
Date: Tue, 28 Jun 2011 13:37:47 +0100
Message-ID: <1309264667.20015.279.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 2/3] webkit-gtk: recommends glib-networking to access https web page
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 12:41:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-06-28 at 20:08 +0800, Zhai, Edwin wrote:
> 
> Koen Kooi wrote:
> >
> > Op 28 jun 2011, om 10:13 heeft Zhai, Edwin het volgende geschreven:
> >
> > >
> > > In future, other recipes besides webkit-gtk may ask for 
> > glib-networking, maybe we can change it that time?
> > > What's your opinion?
> >
> > I'd either put it in the lib that uses it (soup) or the app that needs 
> > it (web-webkit), something in between is just confusing.
> >
> 
> Reasonable. I'd like to put it in libsoup.

Actually, I think this sounds like a strong case to put it in
web-webkit. My reasoning is that none of the other packages have the
dependency, its really the use webkit makes of the libraries that is the
requirement for the package...

Cheers,

Richard



