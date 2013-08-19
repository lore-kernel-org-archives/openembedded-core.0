Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 3050869686
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2013 16:58:15 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 19 Aug 2013 09:58:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,914,1367996400"; d="scan'208";a="283920124"
Received: from unknown (HELO helios.localnet) ([10.252.122.215])
	by AZSMGA002.ch.intel.com with ESMTP; 19 Aug 2013 09:58:14 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Simon Busch <morphis@gravedo.de>
Date: Mon, 19 Aug 2013 17:58:13 +0100
Message-ID: <8886217.PuVShUglzT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <52124792.6030604@gravedo.de>
References: <1376928263-9092-1-git-send-email-morphis@gravedo.de>
	<1376928588.17787.64.camel@phil-desktop.brightsign>
	<52124792.6030604@gravedo.de>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: add PACKAGECONFIG_DISTRO variable for distro specific options
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
X-List-Received-Date: Mon, 19 Aug 2013 16:58:16 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 19 August 2013 18:28:02 Simon Busch wrote:
> Am 19.08.2013 18:09, schrieb Phil Blundell:
> > On Mon, 2013-08-19 at 18:04 +0200, Simon Busch wrote:
> >> In some cases as distribution just wants to extend the default
> >> PACKAGECONFIG instead of rewriting it completely. Therefor having a
> >> PACKAGECONFIG_DISTRO variable which is empty by default and included in
> >> PACKAGECONFIG helps a lot.
> > 
> > Can't those distros just use PACKAGECONFIG_append?
> 
> They can. I tried with PACKAGECONFIG += which didn't worked and I
> thought it would be the same with PACKAGECONFIG_append cause of
> PACKAGECONFIG being weak assignment in mesa.inc. But as it seems +=
> takes higher than the weak assignment and overrides PACKAGECONFIG where
> _append only appends.

It's being set in the recipe with ??= which is the weakest form of assignment, 
so this behaviour is expected. I just tested this in local.conf and it works:

PACKAGECONFIG_append_pn-mesa = " something"

BTW, outside of a recipe (or bbappend) you should always use a pn- override 
with PACKAGECONFIG or you'll be affecting more than just the recipe you intend 
to.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

