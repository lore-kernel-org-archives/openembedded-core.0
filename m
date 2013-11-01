Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4AE48615AB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 13:37:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 01 Nov 2013 06:34:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="428274145"
Received: from unknown (HELO helios.localnet) ([10.252.121.84])
	by orsmga002.jf.intel.com with ESMTP; 01 Nov 2013 06:37:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 01 Nov 2013 13:37:44 +0000
Message-ID: <3227290.SyHHWdF4KT@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-31-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
References: <1383307932-4041-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] packagegroup.bbclass: Drop build-time dependencies
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
X-List-Received-Date: Fri, 01 Nov 2013 13:37:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Martin,

On Friday 01 November 2013 13:12:12 Martin Jansa wrote:
> * RFC because:
>   packagegroup.bbclass inherits allarch and by default sets
>   PACKAGE_ARCH = "all", but then it has runtime-dependency on
>   TUNE_PKGARCH packages and different signatures, so instead
>   of setting INHIBIT_DEFAULT_DEPS in addition to inherit allarch
>   I would like to drop default allarch completely.

The fix looks OK, but I don't think we should be going further and removing the 
inherit. To my mind, the question of dependencies comes down to whether or not 
the packagegroup output changes depending on TUNE_PKGARCH, which in the 
general case it should not do.

If we need to do some optimisation to avoid the packagegroup recipe rebuilding 
when it shouldn't due to packages it "contains" changing, we can certainly 
look at that.

> * drop virtual/kernel dependency from packagegroup-core-boot
>   because kernel isn't needed to build packagegroup and building
>   it doesn't influence if it's included in image or not.

Yes, I agree this seems erroneous.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

