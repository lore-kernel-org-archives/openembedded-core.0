Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9E8B978C26
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 02:43:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jul 2018 19:43:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,430,1526367600"; d="scan'208";a="244990192"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.21.171])
	([10.221.21.171])
	by orsmga005.jf.intel.com with ESMTP; 31 Jul 2018 19:43:04 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"Maxin B. John" <maxin.john@intel.com>,
	openembedded-core@lists.openembedded.org
References: <1533046545-18047-1-git-send-email-maxin.john@intel.com>
	<86a14d593b662d9d9f10248343e515d16afdb8b3.camel@linuxfoundation.org>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <b0fb4501-ba1d-425b-1753-9ba1f1d82091@intel.com>
Date: Wed, 1 Aug 2018 10:43:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <86a14d593b662d9d9f10248343e515d16afdb8b3.camel@linuxfoundation.org>
Subject: Re: [PATCH] machine: remove kernel-modules from RRECOMMENDS
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
X-List-Received-Date: Wed, 01 Aug 2018 02:43:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07/31/2018 11:22 PM, openembedded-core-bounces@lists.openembedded.org
wrote:
> On Tue, 2018-07-31 at 17:15 +0300, Maxin B. John wrote:
>> qemumips,qemumips64 and x86 based machines include kernel-modules by
>> default. Remove the kernel modules from RRECOMMENDS to make it
>> consistent
>> across the machines.
>>
>> Tested using core-image-sato on qemumips, qemumips64, qemux86 and
>> qemux86-64
>>
>> [YOCTO #12383]
>>
>> Signed-off-by: Maxin B. John <maxin.john@intel.com>
>> ---
>>  meta/conf/machine/include/x86-base.inc | 2 --
>>  meta/conf/machine/qemumips.conf        | 2 --
>>  meta/conf/machine/qemumips64.conf      | 2 --
>>  3 files changed, 6 deletions(-)
> 
> Looks good, do we need to add this to genericx86 or anything in meta-
> intel given its changing x86-base.inc?
> 

meta-intel explicitly includes the modules so no change needed there. I
have sent the patch for genericx86 where it should be included now.

Thanks,
Anuj

