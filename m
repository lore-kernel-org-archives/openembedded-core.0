Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TgIVh-00032o-A7
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 18:11:49 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Dec 2012 08:56:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,223,1355126400"; d="scan'208";a="252441814"
Received: from unknown (HELO [10.255.13.91]) ([10.255.13.91])
	by orsmga002.jf.intel.com with ESMTP; 05 Dec 2012 08:57:14 -0800
Message-ID: <1354726634.1715.30.camel@empanada>
From: Tom Zanussi <tom.zanussi@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 05 Dec 2012 10:57:14 -0600
In-Reply-To: <1354724873.25268.119.camel@ted>
References: <cover.1353532567.git.bruce.ashfield@windriver.com>
	<CAJTo0LYjTzrvDgDXA-r1f4B8+-TSfv1tUkC-Hyw_J-2toHEQkQ@mail.gmail.com>
	<1354723571.1715.17.camel@empanada> <1354724873.25268.119.camel@ted>
X-Mailer: Evolution 3.4.1 (3.4.1-2.fc17) 
Mime-Version: 1.0
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
X-List-Received-Date: Wed, 05 Dec 2012 17:11:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-12-05 at 16:27 +0000, Richard Purdie wrote:
> On Wed, 2012-12-05 at 10:06 -0600, Tom Zanussi wrote:
> > On Wed, 2012-12-05 at 15:48 +0000, Burton, Ross wrote:
> > > On 21 November 2012 21:32, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> > > > atom-pc should probably be using the 3.4 kernel, but that's a
> > > > question for Darren/Tom/Nitin (so I've added them to the cc), since
> > > > there may be a reason (with respect to graphics) as to why it is on
> > > > 3.0.
> > > 
> > > Ping Darren/Tom/Nitin.
> > > 
> > > atom-pc is certainly lagging behind by still being on 3.0, and I can't
> > > see any reason why we'd want to stick with 3.0 for graphics.  In fact
> > > as the most common graphics driver used on atom-pc is a i965 we want a
> > > modern kernel as that is where the development is.
> > > 
> > 
> > I don't know of any technical reason for it to still be at 3.0.
> > 
> > Until recently all of the 'core machines' were at 3.0 and probably the
> > assumption was that whoever upgraded those in the past would also be
> > upgrading atom-pc - has that changed?.
> > 
> > So who does own the core machines and if that doesn't cover atom-pc,
> > then who owns that?
> 
> As I understood it, WR owns the non-IA core machines, you (as in the
> Intel team) own the IA ones, namely atom-pc.
> 

OK, yeah, I anyway had just assumed it was WR for the core machines:

 commit f08b8c96402cd2b1e939f1babbc002d630fbf274 
 Author: Bruce Ashfield <bruce.ashfield@windriver.com>
 Date:   Fri Aug 19 00:37:08 2011 -0400

    meta-yocto: atom-pc/mpc8315e-rdb change preferred version to 3.0
    
    Updating two more yocto hardware reference platforms to use the
    3.0 kernel by default.

But I see that Darren had done the previous upgrade:

 commit 622fb696a6fc9eab991a5f412eb28e2ff949a32b
 Author: Darren Hart <dvhart@linux.intel.com>
 Date:   Fri May 6 12:12:50 2011 -0700

    atom-pc: use linux-yocto (2.6.37) kernel
    
    Tested boot, network, sato desktop, amixer, and audio playback on a
Toshiba
    NB305 netbook.

And it does make sense for Intel to own the atom-pc, it's just never
been clearly stated unless I missed the discussion.

Tom

> Cheers,
> 
> Richard
> 




