Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 487FB6007C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2014 17:09:07 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 20 Jan 2014 09:09:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,691,1384329600"; d="scan'208";a="467835115"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.122.239])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2014 09:09:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 20 Jan 2014 17:09:05 +0000
Message-ID: <1888336.GIvbbx0Ozl@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.11.5 (Linux/3.12.7-300.fc20.x86_64; KDE/4.11.5; x86_64; ; )
In-Reply-To: <20140120165727.GI5565@jama>
References: <1390236004-18570-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LZ2HFJ1QAyRYW9XXOrkttW5UOenkuFK29Z_R9si4sJCRA@mail.gmail.com>
	<20140120165727.GI5565@jama>
MIME-Version: 1.0
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] kdbus: add git version
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
X-List-Received-Date: Mon, 20 Jan 2014 17:09:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 20 January 2014 17:57:27 Martin Jansa wrote:
> On Mon, Jan 20, 2014 at 04:49:29PM +0000, Burton, Ross wrote:
> > On 20 January 2014 16:40, Koen Kooi <koen@dominion.thruhere.net> wrote:
> > > This builds the kernel portion of the kdbus implementation. Userspace
> > > support needs systemd git and/or a special glib-2.0 branch.> 
> > As awesome as kdbus could be it's very much fresh code, can this live
> > outside of oe-core for now?
> 
> FWIW: it will be welcome with new systemd version in
> meta-openembedded/meta-systemd
> 
> Only disadvantage of it will be that current DEFAULT_PREFERENCE behavior
> doesn't allow to demote this "experimental" version. So people using
> meta-systemd will always get this one unless they set PREFERRED_VERSION
> to version in oe-core.
> 
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=2964

Surely then the better answer would be to use a different layer, rather than 
mixing all three of "legacy" RPROVIDES/RREPLACES/RCONFLICTS, additional 
systemd support not yet integrated into OE-Core (WIP) and the bleeding edge 
components we're now discussing?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

