Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B4422608B7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Dec 2015 10:50:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Dec 2015 02:50:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,380,1444719600"; d="scan'208";a="864575478"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga002.jf.intel.com with ESMTP; 04 Dec 2015 02:50:42 -0800
Date: Fri, 4 Dec 2015 08:03:06 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20151204060306.GA28070@mbabyjoh-mobl.fi.intel.com>
References: <1449042969-24132-1-git-send-email-maxin.john@intel.com>
	<CAJTo0LZjk_FQBhpm-K95rsO9k2ux-a7x+a4+uGL6GuFi2oj_pA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZjk_FQBhpm-K95rsO9k2ux-a7x+a4+uGL6GuFi2oj_pA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] libjpeg: Replace libjpeg with libjpeg-turbo
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
X-List-Received-Date: Fri, 04 Dec 2015 10:50:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ross,

On Fri, Dec 04, 2015 at 09:11:59AM +0000, Burton, Ross wrote:
>Hi Maxin,
>
>>On 2 December 2015 at 07:56, Maxin B. John <maxin.john@intel.com> wrote:
>>
>>    Moving libjpeg-turbo from meta-oe as a replacement for libjpeg
>>        package. libjpeg-turbo has same API/ABI as libjpeg. It is
>>            relatively faster in JPEG compression/decompression than libjpeg.
>>
>
>   As jpeg-turbo has assembler bits it's getting all confused about x32:
>
>            | checking if we have SIMD optimisations for cpu type... yes (x86_64)
>            | checking for nasm... nasm
>            | checking for object file format of host system... ELF64
>            | checking for object file format specifier (NAFLAGS) ... -felf64 -DELF -D__x86_64__
>            | checking whether the assembler (nasm -felf64 -DELF -D__x86_64__) works... yes
>            | checking whether the linker accepts assembler output... no
>            | configure: error: configuration problem: maybe object file format mismatch.
>
>            (https://autobuilder.yoctoproject.org/main/builders/nightly-x32/builds/545)

There was a discussion about supporting x32 support in libjpeg-turbo:
http://sourceforge.net/p/libjpeg-turbo/patches/35/

Due to some reasons, that ended up in "closed-wont-integrate".

Work-around could be to build with "--without-simd" for x32 or implement the x32 assembly SIMD 
routines to support that feature (long and painful).

>Ross

Best Regards,
Maxin

