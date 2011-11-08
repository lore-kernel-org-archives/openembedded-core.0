Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RNp6o-0004kK-HK for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 18:05:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8Gx0ld002602
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 16:59:00 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02088-06 for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Nov 2011 16:58:55 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA8GwrVX002596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Nov 2011 16:58:54 GMT
Message-ID: <1320771534.10843.65.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 16:58:54 +0000
In-Reply-To: <4EB957A3.50203@intel.com>
References: <cover.1320708905.git.scott.a.garman@intel.com>
	<5a66d5c0a8546166f76fb41cb48c033f8d6ed61f.1320708905.git.scott.a.garman@intel.com>
	<1320761372.10843.36.camel@ted> <4EB957A3.50203@intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] useradd.bbclass: fix how RDEPENDS is setup
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
X-List-Received-Date: Tue, 08 Nov 2011 17:05:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 08:24 -0800, Scott Garman wrote:
> On 11/08/2011 06:09 AM, Richard Purdie wrote:
> > On Mon, 2011-11-07 at 15:36 -0800, Scott Garman wrote:
> >> Fix bug where only packages named PN included base-passwd in
> >> RDEPENDS.
> >>
> >> This fixes [YOCTO #1727]
> >>
> >> Signed-off-by: Scott Garman<scott.a.garman@intel.com>
> >> ---
> >>   meta/classes/useradd.bbclass |    6 +++++-
> >>   1 files changed, 5 insertions(+), 1 deletions(-)
> >
> > Merged to master, thanks.
> >
> > As an aside, does the USERADDPN variable serve any purpose now or can we
> > remove it?
> 
> Indeed it does. I'll prepare a patch for that and also to remove the 
> temporary workaround USERADDPN entry Koen added to the avahi recipe once 
> you've accepted Eric's other patch.

Its in and thanks :)

Cheers,

Richard



