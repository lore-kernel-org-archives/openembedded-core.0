Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8D00E770CA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 13:57:18 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 11 Nov 2015 05:57:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,276,1444719600"; d="scan'208";a="598284010"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Nov 2015 05:57:17 -0800
Message-ID: <5643497F.1080106@linux.intel.com>
Date: Wed, 11 Nov 2015 15:58:23 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>, 
	openembedded-core@lists.openembedded.org
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com>
In-Reply-To: <564343E9.9020702@windriver.com>
Subject: Re: [PATCH 00/29] Add gobject introspection support to oe-core
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
X-List-Received-Date: Wed, 11 Nov 2015 13:57:19 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2015 03:34 PM, Mark Hatle wrote:

> For the same architecture (i.e. MIPS64) and the same ABI (n64), the resulting
> data structures, packing and similar should all be standard.  Only the generated
> instructions and execution order would/could change.
>
> So you would need a way to generate, cache, store the results by arch/abi combo
> in order to do this.  The issue of course is that you would need to declare the
> arch and abi -- the tune files are the natural place to do this (we really are
> declaring it there ANYWAY), and the tune features in many cases may have already
> done this...
>
> Something to consider -- the alternative is the dual object (one generic
> [arch/abi], one optimized for the tune) that can be used to run on QEMU.  Twice
> the compile time but should work fine.

Hmm, maybe it's simpler to just fix QEMU so it can handle the missing 
instructions?


Alex


