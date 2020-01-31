Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38A9B60661
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 18:25:12 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id t26so9154848ioi.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Jan 2020 10:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=i4BUElLMopmEatKfQz/X8R1eFnlbqdEU8difDo7Q7Io=;
	b=Z66+jjaet7isc23cucsPohq1NEsPbm1PNWoh6w8O78CjrqZS+6D+UXAR4ZAq0RCxEA
	o2vf5AqdYwytY0+W+jDarXSQkZVaMgCzCNksWhTa8/N+JP4cwUOwAyWYHFWPdsmvjUO8
	67E7XY6c13/yP+6DwAGYuO65TuvUZkDFYRiC11RkKkUxhFI1TjNNjVXyYGKnz1mrlrBS
	5gwTCXlBGM1xHyrp9u10TUDUADLeIBvvLmHsG92FV9gGyPmLNiTtXV3tDnCcZ8ERj7di
	iChOpOWlQV9ed3GWWDXrzyKA42d6c+gnRrj7Evy1nFEcdBjQh9eCesIqTGn/+U5Oe93o
	SHVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=i4BUElLMopmEatKfQz/X8R1eFnlbqdEU8difDo7Q7Io=;
	b=R0v1s/jCBP7L7G4upId59NK58QhYtr3uVIVa/KIzXzmHYtTWJAbTLJi2p02Byj6BFF
	xBjbUcjms92rv7Rkh7nceGm99gmJYUYztRpd5MudsGPrKIap6fhu68UmwlXkEixyAPDO
	cgkLTx7CnBDn5Tjw17J4D4/R1ZlKB9Gta6U8tNkC6kasjfmvBEbUanOC33JiMuIhb2th
	Wp6OfwoU5jntoDGfY7Oy1ztU1Xf/Td3KkY1sMUaxSEfaUHgq1dshbP80m1CWyqLYcZkf
	0CZaAFsmEcPbYRfnwukk1afUnTVVWkPLjB94ckk5iVem1F1znIshe/CkZNvfT8y7cPwQ
	vPBQ==
X-Gm-Message-State: APjAAAUnqSb1DGVlPOz1MGNfjPniHkkGz1MHXcbbio5/7u92A/ldCYev
	A89PPNMGycxMCjJfCDlWpTRAN0+zscE=
X-Google-Smtp-Source: APXvYqzZ6TXsiwEdQp4DB9FTM45vaf0eNG1j6sTpJ8tvF0I8QLSmBzbFkOm68SKM36IYbvHSCd6xKg==
X-Received: by 2002:a5d:8908:: with SMTP id b8mr9133086ion.89.1580495112220;
	Fri, 31 Jan 2020 10:25:12 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:808d:d66e:9108:2692?
	([2601:646:9200:4e0:808d:d66e:9108:2692])
	by smtp.gmail.com with ESMTPSA id
	r14sm3440657ilg.59.2020.01.31.10.25.10
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 31 Jan 2020 10:25:11 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1580248809.git.bruce.ashfield@gmail.com>
	<CANNYZj_O7cMwJs_ND_MOwADb7PCc2XKJq3b1gQ0xaO7SbBr58g@mail.gmail.com>
	<CADkTA4PZm6X0duFUx0prC4-kz=RUjsmO5vK_6Ox6w5GSGhJ0wQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4789b1f1-8dc1-dead-1a19-d18f17c0d709@gmail.com>
Date: Fri, 31 Jan 2020 10:25:09 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4PZm6X0duFUx0prC4-kz=RUjsmO5vK_6Ox6w5GSGhJ0wQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3][RFT]: kernel-yocto: v5.4 LTS kernel
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
X-List-Received-Date: Fri, 31 Jan 2020 18:25:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 1/29/20 4:48 AM, Bruce Ashfield wrote:
> On Wed, Jan 29, 2020 at 2:31 AM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
>>
>> Can these issues be bisected? That's how the two kernel regressions (both found last year via ptests) were tracked down to specific commits.
>>
> 
> mips64 was already bisected, and reported upstream, not much help
> there .. I've already reached out to some more hardcore mips folks for
> more help, so hopefully that works :D
> 
can you point to link where this thread is

> The musl one didn't bisect in my attempt(s), but in that config it is
> an easy issue to trigger. I'm out of time to debug it for the next two
> weeks, hence why I'm broadcasting to see if others want to take a
> look.
> 

As I saw, I do not see this with latest master-next

> Bruce
> 
>> Alex
>>
>> On Tue, 28 Jan 2020 at 23:14, <bruce.ashfield@gmail.com> wrote:
>>>
>>> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>>>
>>> Hi all,
>>>
>>> I just wanted to send these to the list, so everyone could see the
>>> reference kernel that we are planning for the upcoming release.
>>>
>>> I have other patches to drop 4.19, 5.2 and make this the default
>>> kernel for the various reference platforms as well, but I'm not
>>> sending them, since we still have two outstanding issues:
>>>
>>> 1) mips64 init is segfaulting after / during some self tests.
>>>
>>>     https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/1520/steps/8/logs/step6c
>>>
>>> 2) x86 musl is getting a gpf on many commands:
>>>
>>>     https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1501/steps/8/logs/step1c
>>>
>>> I've looked into both, and don't have any great ideas on how to debug
>>> or fix them.
>>>
>>> So if anyone has ideas, or wants to poke at these, feel free to follow up.
>>> But as of now, we still can't merge the v5.4 kernel as the reference due
>>> to these remaining problems.
>>>
>>> Bruce
>>>
>>>
>>> The following changes since commit ca3993cc4b13d4e661228cee6fb9448adfd0a4ba:
>>>
>>>    bitbake: tests/fetch: Allow wget upgrade tests to run against a local server (2020-01-22 15:56:39 +0000)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.pokylinux.org/poky-contrib zedd/kernel-oe
>>>    http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel-oe
>>>
>>> Bruce Ashfield (3):
>>>    linux-yocto: introduce 5.4 recipes
>>>    kern-tools: update Kconfiglib to latest (for 5.4+ kernel)
>>>    kernel-devsrc: update to v5.4+
>>>
>>>   .../kern-tools/kern-tools-native_git.bb       |  2 +-
>>>   meta/recipes-kernel/linux/kernel-devsrc.bb    |  8 +--
>>>   .../linux/linux-yocto-rt_5.4.bb               | 44 +++++++++++++++
>>>   .../linux/linux-yocto-tiny_5.4.bb             | 32 +++++++++++
>>>   meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 54 +++++++++++++++++++
>>>   5 files changed, 136 insertions(+), 4 deletions(-)
>>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
>>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
>>>   create mode 100644 meta/recipes-kernel/linux/linux-yocto_5.4.bb
>>>
>>> --
>>> 2.19.1
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 


