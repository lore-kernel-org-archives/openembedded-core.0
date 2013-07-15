Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D3FD66A463
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 10:15:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2013 03:13:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,668,1367996400"; d="scan'208";a="345734111"
Received: from unknown (HELO helios.localnet) ([10.252.122.64])
	by orsmga001.jf.intel.com with ESMTP; 15 Jul 2013 03:15:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jul 2013 11:15:46 +0100
Message-ID: <2367199.H1kLtvBBbA@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.4 (Linux/3.8.0-26-generic; KDE/4.10.4; i686; ; )
In-Reply-To: <CAJTo0LZcqo1ND1CTE91MU4jr0ovBggdhE2iXab1faCC+C1fROA@mail.gmail.com>
References: <cover.1373872671.git.sgw@linux.intel.com>
	<1510613.ezlYfIjzn1@helios>
	<CAJTo0LZcqo1ND1CTE91MU4jr0ovBggdhE2iXab1faCC+C1fROA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/18] Final Review Pending
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
X-List-Received-Date: Mon, 15 Jul 2013 10:15:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 15 July 2013 10:57:23 Burton, Ross wrote:
> On 15 July 2013 10:24, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> >> Hongxu Jia (5):
> >>   pmount: add version 0.9.23
> >>   udev-extraconf:fix xuser write to usb storage failed
> >>   udev: fix invoking pmount failed based on sysvinit
> >>   pmount: allow users in disk group to perform pmount/pumount
> >>   xuser-account: add xuser to disk group
> > 
> > I have some reservations about these changes. pmount is obsolete
> > according to its author:
> > 
> > https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2011-February/01242
> > 1.html
> > 
> > I appreciate it may solve the problem we're trying to solve but we need
> > to be pretty confident about pulling this in before we do so since we'll
> > likely be supporting it ourselves.
> 
> Agreed.  pmount solves a problem but it's unmaintained and going
> forwards we need to sort out our at_console/polkit/etc story, and this
> is part of it.  I'd been meaning to take a good look at this series
> today, can we pull it for now?

Depends what you mean by "pull"... ?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

