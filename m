Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 61B197701D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Sep 2015 09:40:51 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 18 Sep 2015 02:40:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,552,1437462000"; d="scan'208";a="771742811"
Received: from thomasda-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.18])
	by orsmga001.jf.intel.com with ESMTP; 18 Sep 2015 02:40:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 18 Sep 2015 10:40:48 +0100
Message-ID: <1946459.lWlg709rPu@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <20150918075241.GA23863@bang.betafive.co.uk>
References: <20150918075241.GA23863@bang.betafive.co.uk>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [dylan] Backport Request
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
X-List-Received-Date: Fri, 18 Sep 2015 09:40:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Paul,

On Friday 18 September 2015 08:52:41 Paul Barker wrote:
> I'm not sure if there are many other poor souls still using dylan, but if
> there are I'd like to request a backport of the following commit. In our
> case it is needed to ensure that a package is rebuilt when INITSCRIPT_NAME
> or INITSCRIPT_PARAMS is changed in a recipe.

Sure, whilst dylan is nominally no longer maintained in this case the change 
is fairly self-contained and straightforward so in theory it should be OK.

> Hopefully we'll be able to upgrade soon, but if so it will probably be only
> as far as daisy...

I'd urge you to consider upgrading further than that; daisy is already out of 
support (and will be one release further out by October). If there are things 
that prevent you from doing that we should discuss them as it might be 
something we need to address in terms of making upgrades easier.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

