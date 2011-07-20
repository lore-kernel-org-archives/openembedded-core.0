Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heinold@mi.fu-berlin.de>) id 1QjT6F-0005nf-1F
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 11:29:51 +0200
Received: from relay1.zedat.fu-berlin.de ([130.133.4.67])
	by outpost1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1QjSm4-00040S-4Q>; Wed, 20 Jul 2011 11:09:00 +0200
Received: from andorra.imp.fu-berlin.de ([160.45.42.84])
	by relay1.zedat.fu-berlin.de (Exim 4.69)
	for openembedded-core@lists.openembedded.org with esmtp
	(envelope-from <heinold@mi.fu-berlin.de>)
	id <1QjSm4-0003bF-1r>; Wed, 20 Jul 2011 11:09:00 +0200
Received: from heinold by internal andorra.imp.fu-berlin.de with local (Exim
	4.72) id 1QjSm3-0001h0-VK
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 11:08:59 +0200
Date: Wed, 20 Jul 2011 11:08:59 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20110720090859.GB3173@mi.fu-berlin.de>
References: <1311100227-8624-1-git-send-email-raj.khem@gmail.com>
	<1311100227-8624-2-git-send-email-raj.khem@gmail.com>
	<1311118009.2344.33.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1311118009.2344.33.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
Sender: Heinold <heinold@mi.fu-berlin.de>
X-Originating-IP: 160.45.42.84
Subject: Re: [PATCH 2/2] libiconv: Add recipes for 1.13.1
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
X-List-Received-Date: Wed, 20 Jul 2011 09:29:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 20, 2011 at 12:26:49AM +0100, Richard Purdie wrote:
> On Tue, 2011-07-19 at 11:30 -0700, Khem Raj wrote:
> > Import 1.13.1 recipes from meta-oe
> > share common code through libiconv.inc
> 
> The big question this triggers for me is "why"?
> 
> Deleting libtool.m4 certainly looks neater than this version of patching
> it out. Is that do_configure hack still needed with libtool 2.4?
> 
> Cheers,
> 
> Richard

Hi,

we maybee should consider deleting the libtool m4-stuff as default in the autotools-class.
There maybee a libtool 2.8 can be released which produces the same problems as the
libtool 1.x -> 2.2 and 2.2 -> 2.4 transition.

Bye Henning


