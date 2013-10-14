Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 861466CF07
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:19:31 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 14 Oct 2013 09:16:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,493,1378882800"; d="scan'208";a="410700485"
Received: from unknown (HELO helios.localnet) ([10.252.120.188])
	by fmsmga001.fm.intel.com with ESMTP; 14 Oct 2013 09:19:17 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>, Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 14 Oct 2013 17:19:16 +0100
Message-ID: <3717106.1OZfuUGn9i@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <525C152E.1040604@linux.intel.com>
References: <1381761079-8709-1-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED101597AC445@DLEE11.ent.ti.com>
	<525C152E.1040604@linux.intel.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: update local rules for new touchscreen device
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
X-List-Received-Date: Mon, 14 Oct 2013 16:19:31 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Saul,

On Monday 14 October 2013 09:00:46 Saul Wold wrote:
> > Andrea Adami wrote:
> >> I noticed it some time ago but the patch is still on hold....
> >> http://patchwork.openembedded.org/patch/25093/
> > 
> > Thanks.  I missed this.  I can confirm this works for my TS device as
> > well.
> 
> There was some discussion about this back then also, I would ask that
> Paul verifies that this patch is OK.

I wasn't against the original patch though; meta-handheld has had a udev 
bbappend to sed this rule to exactly what the patch gives for a long time now. 
Frankly I don't understand the objections in the original discussion; just 
because the driver for the touchscreen doesn't provide pressure events - 
either because the driver is deficient or the hardware doesn't support it - it 
does not mean the device isn't a touchscreen and shouldn't be recognised as 
such by udev. 

Unless it is possible that the weaker rule will pick up some other non-
touchscreen device as a touchscreen as a result of this change (and I doubt 
that is the case) then this patch should be applied.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

