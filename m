Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BDEB1705EA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 15:17:40 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 15 Jul 2014 08:12:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,666,1400050800"; d="scan'208";a="573482167"
Received: from unknown (HELO [10.255.12.224]) ([10.255.12.224])
	by orsmga002.jf.intel.com with ESMTP; 15 Jul 2014 08:13:37 -0700
Message-ID: <53C54520.6000704@linux.intel.com>
Date: Tue, 15 Jul 2014 08:13:36 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: akuster808 <akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <1405430855-12398-1-git-send-email-akuster@mvista.com>	<CAJTo0LYfG4kCxWHbKK9rM7YScB2NAqVqmTVmMKpGb7UD7WE0Bg@mail.gmail.com>
	<53C5387D.6040503@gmail.com>
In-Reply-To: <53C5387D.6040503@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] nettle: update to version 3.0
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
X-List-Received-Date: Tue, 15 Jul 2014 15:17:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/15/2014 07:19 AM, akuster808 wrote:
> Ross,
>
> Since we are keeping both versions, should I define  a PREFERRED_VERSION?
>
No need to do that since the newer version will be used by default, and 
when INCOMPATIBLE_LICENSE with GPLv3 is set, the GPLv3 will be 
blacklisted and the older GPLv2 version will be used.

Sau!

> - Armin
>
> On 07/15/2014 06:49 AM, Burton, Ross wrote:
>> On 15 July 2014 14:27, Armin Kuster <akuster@mvista.com> wrote:
>>> Add GNUv3 license
>>
>> If nettle 3 contains GPLv3 code then we probably don't want to remove
>> nettle 2.1, for people building without any v3 code in the images.
>>
>> Ross
>>

