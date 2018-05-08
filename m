Return-Path: <california.l.sullivan@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BE80574E09
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 20:19:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2018 13:19:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,379,1520924400"; d="scan'208";a="54260305"
Received: from clsulliv.jf.intel.com ([10.7.201.36])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2018 13:19:19 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Patrick Ohly <patrick.ohly@intel.com>, Ross Burton <ross.burton@intel.com>
References: <7787493.mkkD0rIuAZ@peggleto-mobl.ger.corp.intel.com>
From: Cal Sullivan <california.l.sullivan@intel.com>
Message-ID: <7dcc4aba-8453-1dbf-11c6-446b58d2b6c3@intel.com>
Date: Tue, 8 May 2018 13:19:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <7787493.mkkD0rIuAZ@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: read-only-rootfs and EFI configuration
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
X-List-Received-Date: Tue, 08 May 2018 20:19:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

You're right. Since its adding to APPEND from rootfs-postcommands, which 
is inherited by images, its in the local space instead of global and 
won't be picked up by these recipes...

Right now it won't actually affect anything out of the box, as that 
method of booting isn't default due to lack of random UUID support, but 
its something that will need to be solved in the future.

Thanks,
Cal

On 05/07/2018 08:39 PM, Paul Eggleton wrote:
> Hi folks,
>
> So I was looking at the following commit today:
>
>    http://cgit.openembedded.org/openembedded-core/commit/?id=cfc09de06ecc12bb42181004689e881c75072665
>
> Given we've just moved the creation of the configuration to its own recipe
> (grub-bootconf or systemd-bootconf depending on the bootloader selected)
> doesn't that now pose a problem for the effectiveness of this change given
> that it's setting it at the image level? Let me know if I'm missing something.
>
> Cheers,
> Paul
>


