Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SZqDn-0002hJ-2q
	for openembedded-core@lists.openembedded.org;
	Wed, 30 May 2012 23:14:23 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 May 2012 14:04:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="146373013"
Received: from unknown (HELO helios.localnet) ([10.255.12.128])
	by orsmga001.jf.intel.com with ESMTP; 30 May 2012 14:04:01 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Brandon Stafford <brandon@rascalmicro.com>
Date: Wed, 30 May 2012 22:04 +0100
Message-ID: <1958256.11pGnIIT8O@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.2.0-24-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <CA+b4E8ySAPZM7c4g5ZVqG-5L0ZtE1nbWRN7zy1mg+RYzxC4nzw@mail.gmail.com>
References: <CA+b4E8yzmANrQE43Ck_DZwW-2o1rAAC3rwGeQ96Uy0M9OS2pdw@mail.gmail.com>
	<4FBFFFBE.5000907@windriver.com>
	<CA+b4E8ySAPZM7c4g5ZVqG-5L0ZtE1nbWRN7zy1mg+RYzxC4nzw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: /sbin/init not found in oe-core
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
X-List-Received-Date: Wed, 30 May 2012 21:14:23 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 May 2012 16:48:00 Brandon Stafford wrote:
> On Fri, May 25, 2012 at 5:55 PM, Mark Hatle <mark.hatle@windriver.com> 
wrote:
> > On 5/25/12 3:52 PM, Brandon Stafford wrote:
> >> On Fri, May 25, 2012 at 4:30 PM, Mark Hatle<mark.hatle@windriver.com> 
 wrote:
> >>>> >>  Has the boot process changed? What should I be doing instead of
> >>>> >>  calling /sbin/init?
> >>> > 
> >>> >  You should check your new rootfs.  is there anything called init on
> >>> > it, even in a different directory?
> >> 
> >> So far as I can tell, there is no file named init in the filesystem.
> >> 
> >>> >  Are you using meta-oe and systemd?
> >> 
> >> meta-oe: yes
> >> systemd: only if it is enabled by default, so I don't think so. I can
> >> still see /etc/rc[0-5].d, so I think that means Sys V is still in
> >> place.
> > 
> > meta-oe may have systemd enabled by default, but I'm not sure.  I haven't
> > used it recently enough to know for sure.> 
> >>> >  You should have some type of an init in the new filesystem.. if not,
> >>> > then
> >>> >  something is wrong with your image and you'll need to diagnose that
> >>> > first.
> >> 
> >> Sounds like I have something amiss with my filesystem.
> 
> Just to wrap this up for the sake of future googlers: in my image
> recipe, I was doing this:
> 
>     inherit image
> 
> instead of:
> 
>     inherit core-image
> 
> I had also omitted task-core-basic from my IMAGE_INSTALL list. I'm not
> certain which solved the problem, but /sbin/init definitely now
> exists.

Almost certainly the latter rather than the former - inheriting image rather 
than core-image is perfectly OK, but without task-core-basic there's a whole 
heap of things you won't get including task-core-initscripts which includes 
sysvinit.

Sorry you had to go through pain here but glad you solved it in the end :)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


