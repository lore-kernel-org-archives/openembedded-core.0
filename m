Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE1136EE66
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Feb 2014 17:42:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 20 Feb 2014 09:42:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,513,1389772800"; d="scan'208";a="478600149"
Received: from pmckerno-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.159])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2014 09:42:27 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Feb 2014 17:42:18 +0000
Message-ID: <2221142.EAVKtIV4p9@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.3-201.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CAJTo0LaeE+oqgU=U+eHvJ-X+ceNQnonV_Xcx0Y2ASes2JHe-wA@mail.gmail.com>
References: <CAOMwXhP68XUd-6ZSa3+t_OBMgr=mim0_9-yz0q1sNf1i90hgvA@mail.gmail.com>
	<CANyK_8d2i15W5s9-uAGWcG9kBcb1WMZDJovC-HAhzVwKuqUk4Q@mail.gmail.com>
	<CAJTo0LaeE+oqgU=U+eHvJ-X+ceNQnonV_Xcx0Y2ASes2JHe-wA@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Removal of poky-feed-config-opkg_1.0.bb
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
X-List-Received-Date: Thu, 20 Feb 2014 17:42:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 20 February 2014 16:59:17 Burton, Ross wrote:
> On 20 February 2014 16:41, Paul Barker <paul@paulbarker.me.uk> wrote:
> > It does duplicate the creation of "${sysconfdir}/opkg/arch.conf" and
> > so that bit should go. I think it should probably be replaced by a
> > template recipe in meta-skeleton which shows a developer how to create
> > their own feed config in a recipe.
> 
> Note that rootfs_ipk also has a way of constructing a feed config, and
> there's a recipe in meta-oe that constructs a feed config.
> 
> All but one of these need to go. As far as I'm aware they all only
> work for opkg too, so they should all go and be replaced with one
> cross-packaging recipe.

Agreed - FYI there is an enhancement bug open for this:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=5407

It's assigned to me but anyone would be welcome to take it if they felt so 
inclined ;)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

