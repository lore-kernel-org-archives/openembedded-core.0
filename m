Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>)
	id 1QKvkR-0002Iz-0J; Fri, 13 May 2011 19:01:55 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009))
	with ESMTPA id <0LL500B0H8IBMVAY@vms173005.mailsrvcs.net>; Fri,
	13 May 2011 11:59:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7660814AF5B; Fri,
	13 May 2011 12:58:59 -0400 (EDT)
Date: Fri, 13 May 2011 12:58:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110513165859.GT25606@denix.org>
References: <BANLkTinm-YXGM0z1CFJamQG7N0Em442VHw@mail.gmail.com>
	<1305280030.2421.57.camel@phil-desktop>
MIME-version: 1.0
In-reply-to: <1305280030.2421.57.camel@phil-desktop>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Where to host new layers
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
X-List-Received-Date: Fri, 13 May 2011 17:01:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, May 13, 2011 at 10:47:10AM +0100, Phil Blundell wrote:
> On Fri, 2011-05-13 at 02:10 -0700, Khem Raj wrote:
> > I have created couple of layers namely meta-slugos (distro layer) and
> > meta-nslu ( machine layer). I was  looking for place to host those
> > layers. Would they be good under meta-openembedded ? I dont think
> > http://www.nslu2-linux.org/
> > has git infrastructure otherwise that would be one place to put it.
> 
> In the longer term I don't think there's any reason we couldn't host
> those kinds of distro layers on openembedded.org, either in separate
> repositories or a single shared one.  I know there was some board
> discussion a few months ago about whether or not oe.org should be in the
> business of hosting third party BSPs but I'm not quite sure what the
> outcome of that was.

The outcome for the short term was to allow community-developed layers on 
openembedded.org (where slugos/nslu should fall into that category, AFAICS) 
and not yet the commercial layers/BSPs from manufacturers (those should be 
directed to Yocto or asked to provide own hosting).

One of the reasons named was infrastructure limitations on openembedded.org as 
of now. There were several possible solutions to hosting limitations discussed 
few weeks ago by the board and involved parties...

-- 
Denys


