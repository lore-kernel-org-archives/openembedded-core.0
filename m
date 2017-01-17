Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 458A260621
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2017 12:04:21 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jan 2017 04:04:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,244,1477983600"; d="scan'208";a="49661930"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 17 Jan 2017 04:04:21 -0800
To: openembedded-core@lists.openembedded.org
References: <1484237986-31888-1-git-send-email-anibal.limon@linux.intel.com>
	<CAJTo0LYtE6TECPVqOfsdwdXnOFyvxEhXj2SHD79N1jmsScJkGA@mail.gmail.com>
	<587CF82F.9090207@linux.intel.com>
	<CAJTo0LaB5jYL2rjU3AHXAzzYeM49tcsb1dY3K+XH2=mv_x3T4w@mail.gmail.com>
	<587D3E59.30206@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8bce3503-07a2-d37f-0f3f-e71524058ef0@linux.intel.com>
Date: Tue, 17 Jan 2017 14:04:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <587D3E59.30206@linux.intel.com>
Subject: Re: [PATCHv2] qemu: Upgrade to 2.8.0
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
X-List-Received-Date: Tue, 17 Jan 2017 12:04:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 01/16/2017 11:42 PM, Aníbal Limón wrote:

> (gdb) info threds
>   Id   Target Id         Frame
>   1    Thread 0x7ffff7fd0780 (LWP 25006) "qemu-ppc"
> pthread_cond_wait@@GLIBC_2.3.2 () at
> ../nptl/sysdeps/unix/sysv/linux/x86_64/pthread_cond_wait.S:185
>   2    Thread 0x7ffff647e700 (LWP 25010) "qemu-ppc" syscall () at
> ../sysdeps/unix/sysv/linux/x86_64/syscall.S:38
> * 3    Thread 0x7ffff7f4d700 (LWP 25011) "qemu-ppc" 0x000000000086e204
> in static_code_gen_buffer ()
>
> I'll send an email to the qemu mailing list.

If this isn't fixed in reasonable time, we should probably disable qemu 
usermode on ppc - unfortunate, but that's the deal with using it for 
anything.

You would need to just copy/tweak the corresponding line from 
meta/conf/machine/include/powerpc/arch-powerpc64.inc

Alex


