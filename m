Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3E35A73CC7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 20:15:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7JKFwOT019300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Aug 2015 13:15:58 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 19 Aug 2015 13:15:58 -0700
Message-ID: <55D4E3EB.40502@windriver.com>
Date: Wed, 19 Aug 2015 16:15:39 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Nathan Lynch
	<Nathan_Lynch@mentor.com>
References: <1440006296-15277-1-git-send-email-raj.khem@gmail.com>
	<55D4E00C.9060601@mentor.com>
	<CAJTo0LasGyh_erWWWPPKWtOwbBi0tWVXudxKgXnZhL42SL3WWQ@mail.gmail.com>
In-Reply-To: <CAJTo0LasGyh_erWWWPPKWtOwbBi0tWVXudxKgXnZhL42SL3WWQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch: Force BFD kernel when using gcc for linking
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
X-List-Received-Date: Wed, 19 Aug 2015 20:16:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 15-08-19 04:12 PM, Burton, Ross wrote:
> On 19 August 2015 at 20:59, Nathan Lynch <Nathan_Lynch@mentor.com
> <mailto:Nathan_Lynch@mentor.com>> wrote:
>
>     On 08/19/2015 12:44 PM, Khem Raj wrote:
>     > We redefine LD to point to ld.bfd when building kernel, which works in
>     > most cases since kbuild system calls out for bare LD most of the time,
>     > however some of newer kernels e.g. 4.1+ have some code added which can
>     > call gcc directly to do the linking job e.g. arm vdso code
>     >
>     > This causes build failures when we have configured the default cross
>     > toolchain to use gold linker as default. Errors like
>     >
>     > BFD: arch/arm/vdso/vdso.so: Not enough room for program headers, try
>     > linking with -N
>     > | arm-angstrom-linux-gnueabi-objcopy:arch/arm/vdso/vdso.so[.hash]: Bad
>     > value
>     >
>     > start happening.
>     >
>     > With this patch we force gcc to choose bfd linker as well
>
>
>     This is fixed upstream as of:
>
>     commit d2b30cd4b7223a96e606dfc8120626f66d81e091
>     Author: Nathan Lynch <nathan_lynch@mentor.com
>     <mailto:nathan_lynch@mentor.com>>
>     Date:   Wed Jun 3 00:41:15 2015 +0100
>
>          ARM: 8384/1: VDSO: force use of BFD linker
>
>     which should make it to 4.1-stable soon.
>
>
>   CC'ing Bruce.
>
> I'll stage the fix from Khem in my master-unde-test branch.  Bruce: if
> you end up merging this fix into the oe-core kernels, please remind me
> to revert Khem's patch. :)

Noted. And will do.

Bruce

>
> Ross


