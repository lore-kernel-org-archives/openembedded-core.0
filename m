Return-Path: <kamensky@cisco.com>
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by mail.openembedded.org (Postfix) with ESMTP id DB5F96069C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 00:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1274; q=dns/txt; s=iport;
	t=1521936582; x=1523146182;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=a0Vr9q1WUIPLCpTHCVz79ANJWfN1Aby4u7BwU/TEMDI=;
	b=bpLq2R3YG4attPq29wBtKoPyhd12T+iidyTe9y8/+mStot1s2JsyApTU
	3hQJki6Hohv7JQPp3Gf1c30zVygGnzbrQJk9b/8xVY4JERqgHzWbv98M2
	LONS6BaxIvk5NVl+7EMUbpfC8Stw2WOWtTMcCvzwwKVQVHC6J6d6pvarE s=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0AyAQBy6LZa/5pdJa1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYNBYXAoi1xfjC6BUyGBEZJRggYLJYQUTAKDcCE0GAECAQEBAQE?=
	=?us-ascii?q?BAmsohSUBAQEDATgCPwULCxguVwYThQYID6xiiD+CFQWFPoIaghSBOoJZgxMCg?=
	=?us-ascii?q?ReGHAOMV4poCIVSig+GMoRXiROGPAIECwITAYElHDiBUk0jFYJ9kHAfMJAyAQE?=
X-IronPort-AV: E=Sophos;i="5.48,357,1517875200"; d="scan'208";a="88417100"
Received: from rcdn-core-3.cisco.com ([173.37.93.154])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Mar 2018 00:09:31 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by rcdn-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w2P09ViY022457
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 25 Mar 2018 00:09:31 GMT
Date: Sat, 24 Mar 2018 17:09:31 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: "Burton, Ross" <ross.burton@intel.com>
In-Reply-To: <CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
User-Agent: Alpine 2.00 (LRH 1167 2008-08-23)
MIME-Version: 1.0
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sun, 25 Mar 2018 00:09:41 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed



On Sat, 24 Mar 2018, Burton, Ross wrote:

> On 24 March 2018 at 20:12, Victor Kamensky <kamensky@cisco.com> wrote:
>> Here is another crazy idea how to deal with it, just
>> brainstorming what options are on the table: disable
>> renameat2 with help of seccomp and force coreutils to
>> use other calls. Something along the lines that were
>> suggested with intercept of syscall function call, but
>> let kernel to do interception work.
>
> Wow, that's impressively magic.  Does this depend on kernel options or
> specific recent versions?

Not very recent, but relatively mordern. As far as I read
kernel code seccomp syscall BPF filtering [1] was introduced
in 2012 in 3.5 kernel by chromium project guys.

It is controlled by CONFIG_SECCOMP_FILTER which depends on
HAVE_ARCH_SECCOMP_FILTER that all major CPU architectures
do support by now. And I think CONFIG_SECCOMP_FILTER should
be set for all major cases - AFAIK chrome browser uses it
as one of its sandboxing mechanisms.

But you are right, if any code would use it, it needs to
check whether usable seccomp syscall filtering is present
on the system.

[1] https://github.com/torvalds/linux/blob/master/Documentation/userspace-api/seccomp_filter.rst

Thanks,
Victor

> Ross
>

