Return-Path: <kamensky@cisco.com>
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
	by mail.openembedded.org (Postfix) with ESMTP id E5BF47865E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 05:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1982; q=dns/txt; s=iport;
	t=1521956250; x=1523165850;
	h=date:from:to:cc:subject:in-reply-to:message-id:
	references:mime-version;
	bh=XvmI5VNH5GC2tHuvhgWHgIobvceK1eW9gbJSA23zhac=;
	b=aIF9vXPXxJPu9kcftXE0PyNnXpWrF0EbBxuUZSnzR3NjtQWzkw2/nVPz
	xL+oiQzi5cvluS7X7nCjvLBiKKNFOS4+yzIttLYyB/9l9iBrUu9Tr10ie
	Lx5+VC/dDwgvkMNIGNSgQzKvGJ36nCyGTtukVwwys8grTCROlfCc4+z5+ w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0BUAQCxNLda/4oNJK1dGQEBAQEBAQEBA?=
	=?us-ascii?q?QEBAQcBAQEBAYMWK2FwKItcX4wugVMhgRGSUYIGCx+EZgKDcCE0GAECAQEBAQE?=
	=?us-ascii?q?BAmsohSUBAQEDATgCPwULCxguVwYThQYID6xDiD2CGoZde4IUgTqCWYMICwOHM?=
	=?us-ascii?q?gOMV4poCIVSig+DV4JbhFeJE4Y8AgQLAhMBgSUcOIFSTSMVgn0JghgYewEOjS0?=
	=?us-ascii?q?fMJAfAQE?=
X-IronPort-AV: E=Sophos;i="5.48,358,1517875200"; d="scan'208";a="88508077"
Received: from alln-core-5.cisco.com ([173.36.13.138])
	by alln-iport-8.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Mar 2018 05:37:29 +0000
Received: from sjc-ads-6991 (sjc-ads-6991.cisco.com [10.30.218.111])
	by alln-core-5.cisco.com (8.14.5/8.14.5) with ESMTP id w2P5bSBj015433
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sun, 25 Mar 2018 05:37:29 GMT
Date: Sat, 24 Mar 2018 22:37:28 -0700 (PDT)
From: Victor Kamensky <kamensky@cisco.com>
To: Andre McCurdy <armccurdy@gmail.com>
In-Reply-To: <CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
Message-ID: <alpine.LRH.2.00.1803242204010.40806@sjc-ads-6991.cisco.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
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
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
	<CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
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
X-List-Received-Date: Sun, 25 Mar 2018 05:37:29 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII



On Sat, 24 Mar 2018, Andre McCurdy wrote:

> On Sat, Mar 24, 2018 at 5:09 PM, Victor Kamensky <kamensky@cisco.com> wrote:
>> On Sat, 24 Mar 2018, Burton, Ross wrote:
>>> On 24 March 2018 at 20:12, Victor Kamensky <kamensky@cisco.com> wrote:
>>>>
>>>> Here is another crazy idea how to deal with it, just
>>>> brainstorming what options are on the table: disable
>>>> renameat2 with help of seccomp and force coreutils to
>>>> use other calls. Something along the lines that were
>>>> suggested with intercept of syscall function call, but
>>>> let kernel to do interception work.
>>>
>>> Wow, that's impressively magic.  Does this depend on kernel options or
>>> specific recent versions?
>
> Yeah, it's impressive but perhaps overkill for this situation.
>
> Having the kernel run a BPF script on every syscall is going to have a
> much bigger performance impact than intercepting one specific libc
> function in user space.

I don't think we should worry about overhead in pseudo case.

> Also, AFAIK, seccomp can't be nested - so building within an
> environment which has already been secured with seccomp (e.g. recent
> versions of docker?) might be a problem if pseudo starts to rely on
> seccomp too.

Above is true. It was on my mind.

Note I have no problem whatsoever if you can intercept syscall
function correctly. Function intercepting way is definitely more
aligned with what pseudo does. I was just listing other
possible options.

But please note syscall function takes a
variable number of arguments and call another variable
number of argument function, real syscall implementation, in
general, cannot be done. One would need to have complimentary
vsyscall function taking va_list. I.e like printf and vprintf.

Please see http://c-faq.com/varargs/handoff.html

But maybe something special can be done for syscall case.
Disclaimer: I did not read full thread, maybe you already
discussed this.

Thanks,
Victor

