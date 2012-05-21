Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SWVHE-0004dO-4V for openembedded-core@lists.openembedded.org;
	Mon, 21 May 2012 18:16:08 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4LG61kI026712
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 17:06:01 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25816-09 for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 17:05:56 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q4LG5pmZ026704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 May 2012 17:05:52 +0100
Message-ID: <1337616350.22747.19.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 21 May 2012 17:05:50 +0100
In-Reply-To: <CABcZAN=0JDHip7=E99Dh_mNUgkmtny5z0HbyEq0uh2_+-ehsUg@mail.gmail.com>
References: <cover.1337581961.git.sgw@linux.intel.com>
	<4FBA63A2.9090005@windriver.com>
	<CABcZAN=0JDHip7=E99Dh_mNUgkmtny5z0HbyEq0uh2_+-ehsUg@mail.gmail.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC v1 0/1] Reorder ${PN} and ${PN}-dev
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
X-List-Received-Date: Mon, 21 May 2012 16:16:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-05-21 at 08:54 -0700, Chris Larson wrote:
> On Mon, May 21, 2012 at 8:47 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> > On 5/21/12 1:42 AM, Saul Wold wrote:
> >>
> >> This RFC is the first pass at reordering the above 2 items in
> >> the PACKAGES list. This is in part an out cropping of the bug
> >> #2367 (https://bugzilla.yoctoproject.org/show_bug.cgi?id=2367),
> >> which show the miss packaged pcap-config file.
> >
> >
> > I've often wondered why the order is the way it is.  If I were to do this
> > from scratch, I'd move the ${PN} item to last in the default order.  Have
> > you considered this more radical approach, that would then allow all of the
> > default splits to occur before the ${PN} processing.  (It might also allow
> > the ${PN} to simply be a "/*" instead of more complex rules.)
> 
> This would be quite nice, if we could pull it off without breaking
> anything horribly.

-dev is likely the nastiest to move, the other two defaults aafter PN
are -locale and -doc, neither of which should present as much of a
challenge so we can probably move those. Its not likely to gain much
either though as we don't split the files in those directories like we
do with -dev files.

I'm not sure a '*' matching for PN is the most desirable default though,
in some ways I like the fact we have to specifically think about the
exceptions to the default rules...

Cheers,

Richard



