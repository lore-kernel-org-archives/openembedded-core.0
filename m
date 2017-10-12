Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D259671A92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Oct 2017 12:59:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP; 12 Oct 2017 05:59:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,366,1503385200"; d="scan'208";a="1181257001"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 12 Oct 2017 05:59:05 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1507735448.git.alexander.kanavin@linux.intel.com>
	<c0a64a67f9b38870e57ad6b2870b56a4bec3ab3b.1507735448.git.alexander.kanavin@linux.intel.com>
	<CAMKF1srBmLrP=7suUdZEhRDUWzjYD3B6CMTpL8qtaZv6nVkJ5Q@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3f064a29-c6ce-11e8-ce96-69a6affa474d@linux.intel.com>
Date: Thu, 12 Oct 2017 15:55:32 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srBmLrP=7suUdZEhRDUWzjYD3B6CMTpL8qtaZv6nVkJ5Q@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/50] webkitgtk: update to 2.18.0
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
X-List-Received-Date: Thu, 12 Oct 2017 12:59:06 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/12/2017 08:09 AM, Khem Raj wrote:
>> +Upstream-Status: Inappropriate [needs to use musl-specific defines to be upstreamable]
> 
> I think using __GLIBC__ is sub optimal here. So this change should be
> upstreamable.
> 
>> +-#if OS(DARWIN) || ((OS(FREEBSD) || defined(__GLIBC__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
>> ++#if OS(DARWIN) || ((OS(FREEBSD) || defined(__linux__)) && (CPU(X86) || CPU(X86_64) || CPU(ARM) || CPU(ARM64) || CPU(MIPS)))
> 
> We should probably use (OS(LINUX)  instead of defined(__linux__)
> and this could be upstreamed too.
> 

I'm not sure if LINUX or __linux___ is optimal either. Perhaps__GLIBC___ 
|| __musl___ would be better?


I've changed the upstream-status to Pending in the branch.

Alex

