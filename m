Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 038BD7197B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 15:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9JFENcQ017641; Wed, 19 Oct 2016 16:14:23 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id uuuJ9T4Y4Mpa; Wed, 19 Oct 2016 16:14:23 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u9JFEL75017628
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 19 Oct 2016 16:14:22 +0100
Message-ID: <1476890061.2166.75.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>, "Burton, Ross"
	<ross.burton@intel.com>, Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Wed, 19 Oct 2016 16:14:21 +0100
In-Reply-To: <c80b8055-3c0c-4047-ebfd-4c94f41f95ba@topic.nl>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
	<0464acab-69a2-715d-5a3d-61e3961e8ccb@windriver.com>
	<1570516.F2oa9eZtAN@peggleto-mobl.ger.corp.intel.com>
	<CAJTo0LZ=q+030y70h7=sq9c-9_mOm5K6sNRcV7xhBO1PEYAhow@mail.gmail.com>
	<c80b8055-3c0c-4047-ebfd-4c94f41f95ba@topic.nl>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Re-add piglit to sdk images
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
X-List-Received-Date: Wed, 19 Oct 2016 15:14:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2016-10-19 at 16:02 +0200, Mike Looijmans wrote:
> ﻿On 19-10-16 14:53, Burton, Ross wrote:
> > 
> > 
> > On 18 October 2016 at 22:21, Paul Eggleton <paul.eggleton@linux.int
> > el.com
> > <mailto:paul.eggleton@linux.intel.com>> wrote:
> > 
> >     > > Q: Do I need to declare a runtime dependency that typically
> > comes
> >     > > from busybox (tar)?
> >     >
> >     > Yes, because some people try to eliminate busybox from their
> > image.
> > 
> >     How would one express such a dependency though, given that it
> > could come from
> >     tar or busybox? "Virtual" runtime dependencies aren't allowed
> > except through
> >     our somewhat awkward VIRTUAL-RUNTIME convention, but that
> > probably isn't
> >     warranted here.
> > 
> > busybox could RRPOVIDE tar?
> If we go down that road, we'd end up with a busybox that RPROVIDES a
> hundred 
> and one utilities. I doubt anyone will be happy with that...

We've come across this problem before. It is something which is
probably worth looking at to see what options we have but it is
probably a tangential issue to the patch at hand.

Cheers,

Richard

