Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EA6E170527
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 17:25:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 10:13:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="574186809"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 16 Jul 2014 10:18:23 -0700
Message-ID: <53C6B3DF.3040300@linux.intel.com>
Date: Wed, 16 Jul 2014 10:18:23 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: akuster <akuster@mvista.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1405437238-28782-1-git-send-email-akuster@mvista.com>	<CAJTo0La7owsx7Bpz9NDm2AdUtU08n_bWVkVYh-T2MTGRcOxzgw@mail.gmail.com>
	<53C54A18.4030907@mvista.com>
In-Reply-To: <53C54A18.4030907@mvista.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] [v2] nettle: update to version 3.0
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
X-List-Received-Date: Wed, 16 Jul 2014 17:25:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2014 08:34 AM, akuster wrote:
>
> On 07/15/2014 08:24 AM, Burton, Ross wrote:
>> On 15 July 2014 16:13, Armin Kuster <akuster@mvista.com> wrote:
>>> +LICENSE = "LGPLv2.1 & GPLv2 & GPLv3"
>> The manual says:
>>
>> "Nettle is dual licenced under the GNU General Public License version
>> 2 or later, and the GNU Lesser General Public License version 3 or
>> later. When using Nettle, you must comply fully with all conditions of
>> at least one of these licenses."
>>
>> So I think you mean LICENSE="GPLv2+ | LGPLv3+"
>>
>> I'm undecided whether this means we can drop the old Nettle or not...
>
> Ok. I will wait for the dust to settle before I submit patch v3.
>

So I checked on this and it would be an or ('|').

The only other concern I have is there is a COPYING.GPLv3, you might 
want to check with the upstream what the intent of having that License 
file is for, do they intend on some parts being v3 and if so which parts?

I am not sure if the INCOMPATIBLE_LICENSE will handle the OR properly, 
but we should just have one version.

Sau!

> - Armin
>>
>> Ross
>

