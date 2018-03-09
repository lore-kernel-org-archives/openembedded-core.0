Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 4D39A7892F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 21:29:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 13:29:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,447,1515484800"; d="scan'208";a="23940347"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 09 Mar 2018 13:29:55 -0800
To: Victor Kamensky <kamensky@cisco.com>
References: <1520358641-7062-1-git-send-email-kamensky@cisco.com>
	<6da3d33d-8c32-a49d-0b61-70b360232f12@linux.intel.com>
	<alpine.LRH.2.00.1803091243390.27538@sjc-ads-6991.cisco.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0b5870e6-7c1a-f474-443c-d5979b94f0b4@linux.intel.com>
Date: Fri, 9 Mar 2018 23:23:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.00.1803091243390.27538@sjc-ads-6991.cisco.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 0/5] systemtap adding sysroot, cross compiling of user land related scripts
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
X-List-Received-Date: Fri, 09 Mar 2018 21:29:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/09/2018 10:55 PM, Victor Kamensky wrote:
> I've set to write response why systemtap-utils is really
> needed and ended up doing below :). Does it look acceptable
> direction to you?

Yes.

> The only controvercial item left from my original ask is
> IMAGE_GEN_COMBINED_DEBUGFS build option that is supposed to
> build rootfs-dbg containing combined target and debug symbols. 

You can probably repost that as a regular patch.

Alex

