Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id BAA866006A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 09:45:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 May 2018 02:45:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,436,1520924400"; d="scan'208";a="43840143"
Received: from mmak-mobl.gar.corp.intel.com (HELO [10.255.168.251])
	([10.255.168.251])
	by orsmga008.jf.intel.com with ESMTP; 24 May 2018 02:45:22 -0700
To: Alistair Francis <alistair.francis@wdc.com>,
	openembedded-core@lists.openembedded.org
References: <20180502204907.137185-1-alistair.francis@wdc.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <53bbe673-b84c-e155-7edf-c497b90b7ad1@intel.com>
Date: Thu, 24 May 2018 17:45:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180502204907.137185-1-alistair.francis@wdc.com>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [PATCH] recipes-kernel/linux: Enable NUMA Kconfig from MACHINE_FEATURES
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
X-List-Received-Date: Thu, 24 May 2018 09:45:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/03/2018 04:49 AM, Alistair Francis wrote:
> +KERNEL_FEATURES_append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"

Isn't this enough to pull in the required configuration from

https://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/numa/numa.cfg

If numa.cfg is missing something in yocto-kernel-cache that should be
applied to all machines, perhaps these configurations should be added there?

