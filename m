Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 1712E6BD79
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 16:28:04 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8KGgRDk028899; Fri, 20 Sep 2013 17:42:27 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id yBMsz1nTfmgx; Fri, 20 Sep 2013 17:42:26 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r8KGgNvY028894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 20 Sep 2013 17:42:25 +0100
Message-ID: <1379694466.18603.154.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Colin Walters <walters@verbum.org>
Date: Fri, 20 Sep 2013 17:27:46 +0100
In-Reply-To: <1379693965.1665.13.camel@localhost>
References: <1379688225-29241-1-git-send-email-paul.eggleton@linux.intel.com>
	<1379693055.1665.9.camel@localhost>  <4037078.8vkzREKUPL@helios>
	<1379693965.1665.13.camel@localhost>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] glib-2.0: fix broken python script header on machines using buildtools
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
X-List-Received-Date: Fri, 20 Sep 2013 16:28:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2013-09-20 at 12:19 -0400, Colin Walters wrote:
> On Fri, 2013-09-20 at 17:14 +0100, Paul Eggleton wrote:
> > Hi Colin,
> > 
> > On Friday 20 September 2013 12:04:15 Colin Walters wrote:
> > > On Fri, 2013-09-20 at 15:43 +0100, Paul Eggleton wrote:
> > > >  it also seems sensible to do
> > > > this for native as well instead of explicitly trying to exclude that
> > > > case.
> > > 
> > > But someone presumably introduced the explicit special case for native
> > > for a reason, I'd expect some blame analysis to be done here to
> > > determine whether those reasons were bogus or not.
> > 
> > I already did that as a matter of course; there is no clue in the message
> > for the commit that added it:
> > 
> > http://cgit.openembedded.org/openembedded-core/commit/?id=08fd9740b9359425ec6ee9810fab1152e9737b0c
> 
> Ok, well then I'd expect something in your commit message similar to
> "There was no original rationale for why native was special cased, and I
> think it should be safe to remove."
> 
> It might be still cached in Richard's brain of course...let's see =)

That particular expression would have at best been a null operation for
the -native case. Its around release time so I probably fixed the thing
that was broken, no more, no less.

I'm fine with replacing it with something better.

Cheers,

Richard




