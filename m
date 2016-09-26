Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EAE9F60777
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 13:08:52 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 26 Sep 2016 06:08:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,399,1470726000"; d="scan'208";a="1062405151"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.49])
	([10.237.68.49])
	by fmsmga002.fm.intel.com with ESMTP; 26 Sep 2016 06:08:53 -0700
To: openembedded-core@lists.openembedded.org
References: <20160923164301.560-1-otavio@ossystems.com.br>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2ac658b5-b45f-337a-972c-e949ee78b85e@linux.intel.com>
Date: Mon, 26 Sep 2016 16:06:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.2.0
MIME-Version: 1.0
In-Reply-To: <20160923164301.560-1-otavio@ossystems.com.br>
Subject: Re: [PATCH 1/2] qemu.bbclass: Allow use different QEMU binary depending of target
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
X-List-Received-Date: Mon, 26 Sep 2016 13:08:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/23/2016 07:42 PM, Otavio Salvador wrote:
> There are architectures which support running in 32 and 64 bit
> flavours however the simulation is provided in a specific QEMU
> setting, requiring us to use a different binary. This patch allow this
> to be done using, for example:
>
> QEMU_TARGET_BINARY_ppce5500 = "qemu-ppc64abi32"

Should there also be a patch that makes use of this feature?

Alex


