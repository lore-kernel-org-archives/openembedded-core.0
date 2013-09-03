Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 426A16BE53
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 10:25:47 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Sep 2013 03:25:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,1013,1367996400"; d="scan'208";a="355184197"
Received: from unknown (HELO helios.localnet) ([10.252.123.86])
	by azsmga001.ch.intel.com with ESMTP; 03 Sep 2013 03:25:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 03 Sep 2013 11:25:43 +0100
Message-ID: <3896060.ZzyEfkrHt7@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <CAJTo0LYOH6_QV_R2Y=BLKE-NLMEdPpU4T9kxCc4BPvJWwia34Q@mail.gmail.com>
References: <1377672247-16456-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYOH6_QV_R2Y=BLKE-NLMEdPpU4T9kxCc4BPvJWwia34Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: Cover for udev-systemd
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
X-List-Received-Date: Tue, 03 Sep 2013 10:25:48 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 03 September 2013 11:20:18 Burton, Ross wrote:
> On 28 August 2013 07:44, Khem Raj <raj.khem@gmail.com> wrote:
> > meta-systemd currently has a bbappend which provides just a cover
> > for udev-systemd, if we move this to the recipe proper then the
> > bbappend can be removed from that layer
> 
> If we do this for systemd we should do it for all recipes that were
> part of meta-systemd.  I thought we'd previously agreed that
> meta-systemd would contain the "compatibility" provides for people
> that had previously used meta-systemd, not oe-core.

I concur with this. The bbappend should remain in meta-systemd, IMO.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

