Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 86EC3621B1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Aug 2013 14:14:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2013 07:11:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,818,1367996400"; d="scan'208";a="357739022"
Received: from unknown (HELO helios.localnet) ([10.252.122.196])
	by orsmga001.jf.intel.com with ESMTP; 05 Aug 2013 07:13:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 05 Aug 2013 15:13:43 +0100
Message-ID: <3845418.BXzYRjkcFy@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAJTo0LYTjnD32wbx2HUEQuXNiJGnjhZWYmQ3PGvfEaYjACr1fQ@mail.gmail.com>
References: <cover.1375457906.git.cristian.iorga@intel.com>
	<CAJTo0LYTjnD32wbx2HUEQuXNiJGnjhZWYmQ3PGvfEaYjACr1fQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/7] PUs for telepathy and gstreamer1.0
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
X-List-Received-Date: Mon, 05 Aug 2013 14:14:10 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 05 August 2013 12:45:02 Burton, Ross wrote:
> On 2 August 2013 16:39, Cristian Iorga <cristian.iorga@intel.com> wrote:
> > Cristian Iorga (7):
> >   telepathy-mission-control: upgrade to v5.15.0
> >   telepathy-idle: upgrade to v0.1.16
> >   gstreamer1.0: upgrade to v1.0.9
> >   gstreamer1.0-plugins-base: upgrade to v1.0.9
> >   gstreamer1.0-plugins-good: upgrade to v1.0.9
> >   gstreamer1.0-libav: upgrade to v1.0.9
> >   gstreamer1.0-plugins-bad: upgrade to v1.0.9
> 
> Build tested and verified buildhistory.
> 
> In another commit can you add an INSANE_SKIP for the text-rel warnings
> in gstreamer1.0-libav?  That's a known issue with libav afaik.

Are you sure about this? Coincidentally I have been looking at bringing in 
libav from meta-oe, and I can see in the configure script explicitly disables 
PIC for x86 (32-bit) but not other architectures, so I guess you'd need to 
append " textrel" to INSANE_SKIP only for i586, which is what I'm going to be 
doing there. However I'll admit I haven't done a build for another arch yet to 
check if the warnings are not present there.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

