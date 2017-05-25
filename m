Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3718577FDE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 08:04:14 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 01:04:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,390,1491289200"; d="scan'208";a="266193587"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 25 May 2017 01:03:57 -0700
To: Marek Vasut <marex@denx.de>, openembedded-core@lists.openembedded.org
References: <20170524204615.2748-1-marex@denx.de>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0a6178cd-a30c-26e6-52b0-5b651766a3ba@linux.intel.com>
Date: Thu, 25 May 2017 11:02:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170524204615.2748-1-marex@denx.de>
Subject: Re: [PATCH] u-boot: Fix build with OpenSSL 1.1.x
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
X-List-Received-Date: Thu, 25 May 2017 08:04:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/24/2017 11:46 PM, Marek Vasut wrote:
> Pick two patches from the U-Boot ML fixing build with OpenSSL 1.1.x .

Thanks :) This was holding up the transition to 1.1 (u-boot cannot stay 
at 1.0 as it will cause a sysroot clash).

Alex.


