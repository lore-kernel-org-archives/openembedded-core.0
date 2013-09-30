Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6DBEB60EA7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2013 08:26:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 Sep 2013 01:26:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1006,1371106800"; d="scan'208";a="409164712"
Received: from mmckenna-mobl1.ger.corp.intel.com (HELO helios.localnet)
	([10.252.120.71])
	by fmsmga002.fm.intel.com with ESMTP; 30 Sep 2013 01:26:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Date: Mon, 30 Sep 2013 09:26:38 +0100
Message-ID: <2097746.hRm7Rg6kXR@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-30-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52493149.3030403@pseudoterminal.org>
References: <5248A04E.3060804@pseudoterminal.org>
	<969F26A8BAB325438E7EB80D3C3134FB16C43C69@IRSMSX105.ger.corp.intel.com>
	<52493149.3030403@pseudoterminal.org>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Questions about Orc and GStreamer
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
X-List-Received-Date: Mon, 30 Sep 2013 08:26:40 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Carlos,

On Monday 30 September 2013 10:07:37 Carlos Rafael Giani wrote:
> Yes, thats Orc. It is part of meta-oe , but really should be in OE-core.
> I think there was a discussion about this in OE-core months ago, and I
> didn't see an opinion against it.
> Can the GStreamer upgrade be included in the dora branch after release?
> I remember seeing package upgrades in the dylan happening after its
> release. In other words, package upgrades aren't just restricted to the
> master branch, correct?

The answer is we generally don't do upgrades on stable branches unless there 
is a very good reason (for example, a security bug where it is more practical 
to just upgrade to a new version for the recipe instead of trying to backport 
patches to the existing version).

Specifically regarding gstreamer 1.2, I'm not too keen on the idea of upgrading 
it in a stable branch - I've been told that there have been backwards-
incompatible changes since 1.0; if that is the case it wouldn't really be 
appropriate. FWIW, the option as always is open to add the new version as a 
separate layer on top of dylan.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

