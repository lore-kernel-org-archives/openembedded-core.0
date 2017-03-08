Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1DEE8774E6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Mar 2017 17:44:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v28HiZTq010859
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 8 Mar 2017 09:44:35 -0800
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 8 Mar 2017 09:44:34 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1488992224-2962-1-git-send-email-ross.burton@intel.com>
	<982f2830-f150-faa5-eebf-ff5ccb7972c5@windriver.com>
	<1488994536.22968.75.camel@linuxfoundation.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <788f018b-c5d7-ab94-a213-e99422650ed1@windriver.com>
Date: Wed, 8 Mar 2017 11:44:33 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1488994536.22968.75.camel@linuxfoundation.org>
Subject: Re: [PATCH] openssl: disable cryptodev by default
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
X-List-Received-Date: Wed, 08 Mar 2017 17:44:38 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 3/8/17 11:35 AM, Richard Purdie wrote:
> On Wed, 2017-03-08 at 11:28 -0600, Mark Hatle wrote:
>> On 3/8/17 10:57 AM, Ross Burton wrote:
>>>
>>> Cryptodev is a way for userspace to access the kernel crypto
>>> drivers (and so,
>>> hardware crypto).
>> If the BSP does not support crypto dev, what is the harm in this?  It
>> should fall back to standard behaviors.
> 
> Note that the implication here is that openssl depends on the kernel
> building and many other pieces of the system depend on openssl so it
> does bottleneck the build somewhat. 

I thought the crypto dev interface had been standardized and no longer required
a specific kernel-specific instance.  If this is not true, then it's effectively
machine specific already.

> It also means a kernel rebuild ends up triggering half the userspace to
> rebuild which is annoying for users.
> 
> 
>>> Not all hardware supports cryptodev so this is something that
>>> should be enabled
>>> in a BSP layer instead of in oe-core.
>> This would make the package be machine specific, which I'm not sure
>> is good for
>> a package like openssl.  (Distro specific, I'm fine with -- machine
>> I've got
>> concerns.)
> 
> How commonly are kernel crypto drivers used?

We are seeing it used a lot, especially on IA platforms.  (I have seen some
usage on an arm platform, but don't remember which.)

--Mark

> Cheers,
> 
> Richard
> 


