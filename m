Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C88B6780BD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Feb 2018 12:23:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Feb 2018 04:23:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,473,1511856000"; d="scan'208";a="25448926"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 07 Feb 2018 04:23:18 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1516102686.29722.267.camel@linuxfoundation.org>
	<1517070952.756.40.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <73704abe-4307-e1fa-bf2e-ca55617c64a7@linux.intel.com>
Date: Wed, 7 Feb 2018 14:17:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <1517070952.756.40.camel@linuxfoundation.org>
Subject: Re: Yocto Project, Spectre and Meltdown
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
X-List-Received-Date: Wed, 07 Feb 2018 12:23:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01/27/2018 06:35 PM, Richard Purdie wrote:
> On Tue, 2018-01-16 at 11:38 +0000, Richard Purdie wrote:
>> I just wanted to give people an update on where the project stands
>> with these issues.
> 
> Master now contains gcc and kernel fixes (in linux-yocto). meta-yocto-
> bsp updates are still pending.
> 
> rocko-next also has those fixes and is undergoing testing which if it
> passes, will get pushed to rocko.

A quick way to check what degree of protection there is on a system is 
to look at what is in /sys/devices/system/cpu/vulnerabilities:

ak@linux-f9zs:/sys/devices/system/cpu/vulnerabilities> ls
meltdown  spectre_v1  spectre_v2

ak@linux-f9zs:/sys/devices/system/cpu/vulnerabilities> cat spectre_v1 
spectre_v2 meltdown
Vulnerable
Mitigation: Full generic retpoline
Mitigation: PTI

Of course, outdated, unprotected kernels do not have this directory at all.


Paul, perhaps this could go to release notes?


Alex

