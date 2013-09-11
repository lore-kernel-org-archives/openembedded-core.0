Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 148DC6B3A2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 10:04:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 11 Sep 2013 03:01:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,883,1371106800"; d="scan'208";a="401690573"
Received: from pmcgurk-mobl.ger.corp.intel.com (HELO helios.localnet)
	([10.252.123.175])
	by orsmga002.jf.intel.com with ESMTP; 11 Sep 2013 03:04:21 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Mark Hatle <mark.hatle@windriver.com>
Date: Wed, 11 Sep 2013 11:04:20 +0100
Message-ID: <4927217.dsrI5AkMql@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-29-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <522FCFAD.2030400@windriver.com>
References: <1378864775-7094-1-git-send-email-mark.hatle@windriver.com>
	<522FCFAD.2030400@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] python-smartpm: Add an attempt install mode
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
X-List-Received-Date: Wed, 11 Sep 2013 10:04:21 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Mark,

On Tuesday 10 September 2013 21:04:29 Mark Hatle wrote:
> Time measurements with:
> 
> MACHINE = "qemux86"
> PACKAGE_CLASSES = "package_rpm"
> EXTRA_IMAGE_FEATURES = "dev-pkgs staticdev-pkgs doc-pkgs dbg-pkgs
> ptest-pkgs" BB_NUMBER_THREADS ?= "8"
> PARALLEL_MAKE ?= "-j 8"
> 
> image: core-image-sato
> 
> Quad Core i7 workstation...
> 
> With all of the recipes built, and just executing the do_rootfs:
> 
> Before this change:
>   real    26m2.541s
>   user    21m8.458s
>   sys     7m9.683s
> 
> After this change:
>   real    14m43.436s
>   user    15m57.525s
>   sys     5m16.412s
> 
> This is a significant performance boost when using the 'complementary'
> installs and attemptonly installs.  The performance is by doing the
> complementary installs as a batch instead of one at a time, ignoring
> failures.

This is a significant improvement, well done! My concern about not catching 
failures stands though, which is why I hadn't implemented this yet. How do we 
ensure that genuine failures are caught with this mode?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

