Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QfEDn-0003jF-GL for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 18:48:07 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68GiDPU021956
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:44:13 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 21561-08 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 17:44:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p68Gi6O7021950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 17:44:06 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <AAA99274-8387-49A8-9DD1-0AA9FC18D344@dominion.thruhere.net>
References: <cover.1310027619.git.dexuan.cui@intel.com>
	<cb76f021571c5f35239192ff05eb89cab4713d04.1310027619.git.dexuan.cui@intel.com>
	<4E15D389.9040906@mentor.com>
	<1865303E0DED764181A9D882DEF65FB6A6B2A2650F@shsmsx502.ccr.corp.intel.com>
	<27ED3419-C3F8-40B4-AF21-D7BEDC631813@dominion.thruhere.net>
	<1310137217.20015.874.camel@rex>
	<AAA99274-8387-49A8-9DD1-0AA9FC18D344@dominion.thruhere.net>
Date: Fri, 08 Jul 2011 17:43:27 +0100
Message-ID: <1310143407.20015.910.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 1/1] powertop: inherit update-alternatives and use	a higher priority than busybox
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
X-List-Received-Date: Fri, 08 Jul 2011 16:48:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-07-08 at 16:57 +0100, Koen Kooi wrote:
> 
> Op 8 jul. 2011 om 16:00 heeft Richard Purdie <richard.purdie@linuxfoundation.org> het volgende geschreven:
> 
> > On Fri, 2011-07-08 at 08:25 +0100, Koen Kooi wrote:
> >> 
> >> Op 8 jul. 2011 om 02:40 heeft "Cui, Dexuan" <dexuan.cui@intel.com> het volgende geschreven:
> >> 
> >>> Tom Rini wrote:
> >>>> On 07/07/2011 01:39 AM, Dexuan Cui wrote:
> >>>>> busybox-1.18.4 installs /bin/powertop and the powertop recipe
> >>>>> installs /usr/bin/powertop. So, in PATH, if /bin appears before
> >>>>> /usr/bin, we would run the version offered by busybox, which has a
> >>>>> very limited function (e.g., no parameter is accepted) and this
> >>>>> causes trouble to eclipse plugin. 
> >>>>> 
> >>>>> We can use update-alternatives for powertop with higher priority to
> >>>>> resolve the issue. 
> >>>>> 
> >>>>> Fixes [YOCTO #1208]
> >>>>> 
> >>>>> Signed-off-by: Dexuan Cui <dexuan.cui@intel.com>
> >>>> 
> >>>> This fix seems a bit incomplete.  Why is busybox putting powertop into
> >>>> /bin when it almost certainly belongs in /usr/bin like the real recipe
> >>>> was placing it.  busybox needs a fix here too.
> >>> Thanks for the comment! 
> >>> I was hesitant about fixing busybox as I wasn't sure if it's worthy
> >> to make a patch to only fix the path for busybox. I don't know why
> >> busybox puts it into /bin. I think the best place may be /usr/sbin/. 
> >>> A little unluckily this patch to powertop has been already in poky
> >> master... So maybe we could try to fix the recipes in future, e.g.,
> >> when upgrading them.
> >> 
> >> we should do the right thing in oe-core,  the poky people can clean up on their own. 
> > 
> > I don't think anyone is suggesting we shouldn't do the right thing in
> > OE-Core? :)
> > 
> > I merged the original patch on the grounds that its was an improvement
> > to the situation. We've identified a better improvement so can someone
> > please send me the patch and I'll likely merge that too.
> 
> the email makes it seem that the patch was merged into poky, but not
> oe-core.  When reading it like that the proposal involved merging the
> 'incomplete' patch for the sake of keeping poky and oe-core in sync

The OE-Core component of Poky always stays in sync now...

Cheers,

Richard




