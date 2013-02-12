Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>)
	id 1U5JLv-0005Vs-Vu; Tue, 12 Feb 2013 18:09:09 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Feb 2013 08:51:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,650,1355126400"; d="scan'208";a="261589139"
Received: from unknown (HELO helios.localnet) ([10.252.120.87])
	by orsmga001.jf.intel.com with ESMTP; 12 Feb 2013 08:53:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 12 Feb 2013 16:53:04 +0000
Message-ID: <1595049.kBrd3spHgv@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10 (Linux/3.5.0-23-generic; KDE/4.10.0; i686; ; )
In-Reply-To: <CAP9ODKoX7NLK_MYKEFXVCrk-FDg5RKnfZCxpOxXhP52et2jgjg@mail.gmail.com>
References: <2760168.9kFd94gL1F@helios>
	<42BE8E82E93F46829E80D29E6DF4934B@intel.com>
	<CAP9ODKoX7NLK_MYKEFXVCrk-FDg5RKnfZCxpOxXhP52et2jgjg@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] RFC: meta-oe appends and overlayed recipes
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
X-List-Received-Date: Tue, 12 Feb 2013 17:09:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 12 February 2013 14:44:58 Otavio Salvador wrote:
> On Tue, Feb 12, 2013 at 1:50 PM, Ross Burton <ross.burton@intel.com> wrote:
> > On Tuesday, 12 February 2013 at 10:24, Burton, Ross wrote:
> >> > * meta-oe/recipes-extended/polkit/polkit_0.104.bbappend
> >> > Another bbappend apparently for systemd support. Again, this should
> >> > have been moved to meta-systemd; do we now need to merge it into
> >> > OE-Core?
> >> 
> >> Yes, half of it has been merged to master already. The rest should be
> >> in Radu's branch, we can sort that today.
> > 
> > I take that back - polkit in oe-core supports systemd if enabled, so this
> > append can be removed.
>
> In fact we cannot drop the bbappend or we break the upgrade path
> (except if we bump PR in OE-Core to keep it).

These do need to be dropped; if bumping PR in OE-Core is what has to happen to 
achieve that then so be it.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


