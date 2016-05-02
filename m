Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 292FB605BA
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 08:02:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 02 May 2016 01:02:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,566,1455004800"; d="scan'208";a="695437722"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 02 May 2016 01:02:52 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.51])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 9A4C06A4007;
	Mon,  2 May 2016 01:50:25 -0700 (PDT)
Date: Mon, 2 May 2016 08:43:00 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Alexander Kanevskiy <kad@kad.name>
Message-ID: <20160502054300.GA6563@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <cover.1461749328.git.ed.bartosh@linux.intel.com>
	<c32880f5e89776d3515079d6c8ebe86111cb10ed.1461749328.git.ed.bartosh@linux.intel.com>
	<CANFkWpnEAFoBRf=oAnKLUasuVhxDgoYswk_o0s3HFT-4W8yiMw@mail.gmail.com>
	<9947705.d0hNahSzfP@peggleto-mobl.ger.corp.intel.com>
	<CANFkWpkNKn84OYakUYmD7piyyK=9TLbf=+yM+Zy2mJnqg=wdjA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANFkWpkNKn84OYakUYmD7piyyK=9TLbf=+yM+Zy2mJnqg=wdjA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] bmap-tools: initial commit, version 3.2
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
X-List-Received-Date: Mon, 02 May 2016 08:02:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 29, 2016 at 11:38:38AM +0300, Alexander Kanevskiy wrote:
> On Fri, Apr 29, 2016 at 7:55 AM, Paul Eggleton <
> paul.eggleton@linux.intel.com> wrote:
> 
> > On Fri, 29 Apr 2016 01:07:56 Alexander Kanevskiy wrote:
> > > On Wed, Apr 27, 2016 at 12:36 PM, Ed Bartosh <ed.bartosh@linux.intel.com
> > >
> > >
> > > wrote:
> > > > Bmap-tools - tools to generate block map (AKA bmap) and flash images
> > > > using bmap. Bmaptool is a generic tool for creating the block map
> > > > (bmap) for a file and copying files using the block map.
> > > >
> > > > The idea is that large file containing unused blocks, like raw system
> > > > image files, can be copied or flashed a lot faster with bmaptool than
> > > > with traditional tools like "dd" or "cp".
> > > >
> > > > [YOCTO #9414]
> > > >
> > > > Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> > >
> > > better to use recipe that would create in deploy/tools standalone version
> > > of the tool.
> > > Otherwise, there is no easy way for user to utilize generated bmap files.
> >
> > You both probably have had notification already, but just to close the
> > loop I
> > found the issue with the do_deploy version, see the comments on bug 9414:
> >
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=9414
> >
> >
> Thank you Paul for your help! Your fix mentioned in the bug for do_depoly
> is indeed the best solution.
>

OK. I'll add this functionality back in a separate patch.

--
Regards,
Ed

