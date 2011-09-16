Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R4bj3-0000sX-Me for openembedded-core@lists.openembedded.org;
	Fri, 16 Sep 2011 18:57:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGw9Tx031732 for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:58:09 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6hXisXRSQX3a
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:58:09 +0100 (BST)
Received: from [192.168.1.36] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p8GGw6IU031718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2011 17:58:07 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 16 Sep 2011 17:51:53 +0100
In-Reply-To: <CAP9ODKor_37hXUvXv3GOYkF1ugkC_sWK4i4SW7tiU8ekJYu6Dw@mail.gmail.com>
References: <1316177653.20858.23.camel@ted>
	<CAP9ODKor_37hXUvXv3GOYkF1ugkC_sWK4i4SW7tiU8ekJYu6Dw@mail.gmail.com>
X-Mailer: Evolution 3.1.91- 
Message-ID: <1316191921.20858.43.camel@ted>
Mime-Version: 1.0
Subject: Re: OE-Core release process
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
X-List-Received-Date: Fri, 16 Sep 2011 16:57:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-09-16 at 10:29 -0300, Otavio Salvador wrote:
> On Fri, Sep 16, 2011 at 09:54, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > Its been mentioned to me that we perhaps haven't made it really clear
> > what is happening with OE-Core at the moment. When we started this off,
> > we agreed to try and get on a roughly six month release cadence so
> > people had some idea of what to expect from the project and when. We
> > decided to put that in sync with what Yocto was doing since it was felt
> > OE-Core would equally benefit from the QA and bug fixing Yocto does as
> > part of its release process.
> 
> I fully agree on that and I do think this will gonna be good for both
> projects; what I dislike is that Yocto people keep using Poky to their
> development instead of OE-Core and this it is quite boring to share
> patches between both until you have  cherry-pick them.
> 
> This should be change in my point of view and people ought to use
> oe-core for hacking so we all share same base tree.

The shr people keep using their shr scripts and tree and angstrom do the
same to pick two examples. No, we're not all going to use OE-Core alone,
that was never the point. So why should we single out poky either? Ok, a
lot of patches are coming from there but that's good, right? :)

I've yet to refuse a bug report on the grounds of "not OE-Core alone"
and don't plan to start :)

The patches do translate easily, if they didn't I'd be going (more)
insane!

Cheers,

Richard



