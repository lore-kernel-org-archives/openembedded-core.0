Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF342734B8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 09:51:07 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 16 Nov 2015 01:51:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,302,1444719600"; d="scan'208";a="600997543"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 16 Nov 2015 01:51:07 -0800
Message-ID: <5649A752.2060308@linux.intel.com>
Date: Mon, 16 Nov 2015 11:52:18 +0200
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
	<5641FFD4.1050506@windriver.com> <56420F08.1050209@linux.intel.com>
	<56421DA6.5080700@windriver.com> <56433886.3060700@linux.intel.com>
	<564343E9.9020702@windriver.com> <5643497F.1080106@linux.intel.com>
	<5645EB64.4020200@windriver.com>
	<60657.10.252.13.130.1447431170.squirrel@linux.intel.com>
	<56461044.2020202@windriver.com>
In-Reply-To: <56461044.2020202@windriver.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 16 Nov 2015 09:51:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/2015 06:31 PM, Mark Hatle wrote:

> The compiler today support many more instructions for a given architecture
> family then QEMU models for that same architecture.
>
> IA32 -- some of the current and even some former generate i7 instructions fall
> under this problem.  If you host system does not have the same instruction set,
> QEMU doesn't know how to emulate everything.
>
> MIPS64 (Such as the Octeon III) is a good example.
>
> PowerPC has many variants as well that QEMU does not support.
>
> It would be wonderful if there was a tie together of what gcc/as and qemu
> supported -- at least from an application perspective, but that simply doesn't
> happen in the real world.

How about approaching this from the other side then? Machines can be 
defined so that if gobject introspection distro feature is enabled, then 
the standard qemu-supported compiler settings are used (same as 
qemumips64 for instance). If not, then people can tweak the compiler to 
their heart's content.


Alex


