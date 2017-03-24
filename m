Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7A66677BA0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 06:39:15 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y90so656574wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Mar 2017 23:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gryxwxLlqGN5WvsRvCe2BXxe1+v0n06T6TRGGPuhv+4=;
	b=JmneP5rgAKNWnIyqs+naHqvK0P9+foEqLoZeyR9rEliSMu2EnMxFaVytzGaE4isd2E
	duEesYXgDb4A8qHtqnUkOS9NqurASVUBZwCQCgsY0HCOtDRY2zADVqIv71EMgHe6NnMj
	9re2fC74U4y0cvg4TdxuXWrnPCQQBMyMMz2Z08p+QcH6aQCh/1USqcx6H49FPokPzAdH
	wXrP504XYMNQY7g53+LEef1jqKLK5BprsrkkO+IxJXE1L+Q9tM7cUZFgoK6Z+ScACNKn
	annN2MgT9PDXa7MyfAhpTOYgy0SF8cDDbdD9VnvZbyKsWrVcJkU1uAJFWkFQGLZEb/iI
	k45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gryxwxLlqGN5WvsRvCe2BXxe1+v0n06T6TRGGPuhv+4=;
	b=J594aiOThj4XMXAavZ872KsHtOD4HAjOP9s8MD36KrdIeN2Wpcpmi0KAPAIVetUm6X
	jAM7giJoTtAttDAPKN2ftNKgF3s2aEbPl3TACPJUnrT/VoOp2GsAzBVIK1/lvlF7Zw2V
	4WO20DmL66wAMTT4ne64toGYq9exsLsw8sCZLxYN6h40LXbSwXiYzgoxe2ciKRY5s7VV
	7jm7I7M2/JncUJOJbXCrpjzlGlwt+EmRugdzI0ETnJxvuVYFU3eMIioO4rFULE+BCf1I
	6e98zKql+r+iQz3/mQR5W1b/32b9gplbvXE9dkgr9PZ/9WwPzek8s6kDtbA2UHcCoKVK
	EtZg==
X-Gm-Message-State: AFeK/H1kMxJyaIwXkOwK2Xxs08gTqqilY7TJbEbNEvefxj1ITCLs+OY6MJa7mrnC5g4zm0hLnh7Rq9+IUUhtOA==
X-Received: by 10.223.164.201 with SMTP id h9mr5568117wrb.175.1490337557049;
	Thu, 23 Mar 2017 23:39:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Thu, 23 Mar 2017 23:38:46 -0700 (PDT)
In-Reply-To: <CAGNsrLBy2phUWevgVdR4njdQJPUaGRW=PTHTZG2wU_e6Hp9_BA@mail.gmail.com>
References: <20170323055412.10238-1-fathi.boudra@linaro.org>
	<CAMKF1sq9UMGWoCBEOp-8gmpPekA4p6MEKg3FiJvrFr85mFjxVQ@mail.gmail.com>
	<CAGNsrLBy2phUWevgVdR4njdQJPUaGRW=PTHTZG2wU_e6Hp9_BA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Mar 2017 23:38:46 -0700
Message-ID: <CAMKF1spcsqxXg58_i7qoAdKjB=+DCv+WEUJJM=nAR+2CpME2gw@mail.gmail.com>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc: add missing TRAP_BRANCH/TRAP_HWBKPT definitions
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
X-List-Received-Date: Fri, 24 Mar 2017 06:39:17 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 23, 2017 at 12:11 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> On 23 March 2017 at 19:22, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Mar 22, 2017 at 10:54 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
>>> Patch submitted upstream, pending to be merged:
>>> https://sourceware.org/bugzilla/show_bug.cgi?id=21286
>>
>> Patch to glibc is fine provided you resent it with proper SRC_URI change
>> and report on how it builds in OE with this change applied
>
> we'll need a v2 to address the backslash, but also the patch itself.
> It's currently incomplete, it misses the inclusion on other
> architectures siginfo headers.

yes, I saw that but I thought its not causing any regressions so we
can accept it, however if you are working  on pan-arch solution then
we should wait.

