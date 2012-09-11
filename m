Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TBXm5-0002RC-F0 for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 23:13:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BL14h3013530;
	Tue, 11 Sep 2012 22:01:04 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 13257-02; Tue, 11 Sep 2012 22:00:59 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q8BL0u7M013524
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Tue, 11 Sep 2012 22:00:58 +0100
Message-ID: <1347397258.2122.55.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Scott Garman <scott.a.garman@intel.com>
Date: Tue, 11 Sep 2012 22:00:58 +0100
In-Reply-To: <504F92B2.6000304@intel.com>
References: <504F8D62.8010508@intel.com>
	<CAJTo0LYf2C0PmrpMf3-RsUub1pQmN=G3f6Tt8ou6UNJ-8NoJKA@mail.gmail.com>
	<504F8EB5.30503@intel.com>
	<CAJTo0LbTe4462EVa6u30FrYHh96oUXnksKkpWy8hVFbM=dz_9A@mail.gmail.com>
	<504F92B2.6000304@intel.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: the oe-core layer <openembedded-core@lists.openembedded.org>, Patches
Subject: Re: Sato virtual keyboard - how to close it?
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
X-List-Received-Date: Tue, 11 Sep 2012 21:13:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-09-11 at 12:36 -0700, Scott Garman wrote:
> On 09/11/2012 12:23 PM, Burton, Ross wrote:
> > On 11 September 2012 20:19, Scott Garman <scott.a.garman@intel.com> wrote:
> >> Negatory on both counts. Sounds like a bug?
> >
> > Certainly does.  Not sure how that regressed or how QA didn't notice.
> > So clicking on a button or check box doesn't make the keyboard hide?
> > Eek.
> 
> Eek, indeed! I just tested with the last bernard point-release, and it 
> too has the same issue. I understand Sato may be going by the wayside, 
> but in case anyone wants to fix this, I've filed bug #3093 for it:
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3093

There has been a bug open for this for years :(

https://bugzilla.yoctoproject.org/show_bug.cgi?id=149

Ross appears to have recently closed it as NOTABUG but I think he
misunderstood the problem.

Cheers,

Richard





