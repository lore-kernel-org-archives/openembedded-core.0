Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TgI3S-0000bT-Lm for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 17:42:38 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5GSArP019897;
	Wed, 5 Dec 2012 16:28:10 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 19735-01; Wed,  5 Dec 2012 16:28:05 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id qB5GS3Mh019891
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 5 Dec 2012 16:28:04 GMT
Message-ID: <1354724873.25268.119.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Tom Zanussi <tom.zanussi@intel.com>
Date: Wed, 05 Dec 2012 16:27:53 +0000
In-Reply-To: <1354723571.1715.17.camel@empanada>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
	<CAJTo0LYjTzrvDgDXA-r1f4B8+-TSfv1tUkC-Hyw_J-2toHEQkQ@mail.gmail.com>
	<1354723571.1715.17.camel@empanada>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: dvhart@linux.intel.com, linux-yocto@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] linux-yocto: consolidated pull request
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
X-List-Received-Date: Wed, 05 Dec 2012 16:42:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-05 at 10:06 -0600, Tom Zanussi wrote:
> On Wed, 2012-12-05 at 15:48 +0000, Burton, Ross wrote:
> > On 21 November 2012 21:32, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> > > atom-pc should probably be using the 3.4 kernel, but that's a
> > > question for Darren/Tom/Nitin (so I've added them to the cc), since
> > > there may be a reason (with respect to graphics) as to why it is on
> > > 3.0.
> > 
> > Ping Darren/Tom/Nitin.
> > 
> > atom-pc is certainly lagging behind by still being on 3.0, and I can't
> > see any reason why we'd want to stick with 3.0 for graphics.  In fact
> > as the most common graphics driver used on atom-pc is a i965 we want a
> > modern kernel as that is where the development is.
> > 
> 
> I don't know of any technical reason for it to still be at 3.0.
> 
> Until recently all of the 'core machines' were at 3.0 and probably the
> assumption was that whoever upgraded those in the past would also be
> upgrading atom-pc - has that changed?.
> 
> So who does own the core machines and if that doesn't cover atom-pc,
> then who owns that?

As I understood it, WR owns the non-IA core machines, you (as in the
Intel team) own the IA ones, namely atom-pc.

Cheers,

Richard



