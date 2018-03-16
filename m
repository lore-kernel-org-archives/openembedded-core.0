Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C54E878889
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 17:26:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Mar 2018 10:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,316,1517904000"; d="scan'208";a="35638195"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 16 Mar 2018 10:26:42 -0700
To: openembedded-core@lists.openembedded.org
References: <20180316092126.1D843440088@auh.yoctoproject.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <84b3852d-d89f-a672-e8b8-d1b477df49d2@linux.intel.com>
Date: Fri, 16 Mar 2018 19:19:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180316092126.1D843440088@auh.yoctoproject.org>
Subject: Re: [AUH] Upgrade status: 2018-03-16
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
X-List-Received-Date: Fri, 16 Mar 2018 17:26:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/16/2018 11:21 AM, auh@auh.yoctoproject.org wrote:
>      * Failed(other errors): 41

This is due to xcb-proto having to be updated in tandem with libxcb. If 
just one is updated, it thwarts the rest of the updates. I'll fix this 
and re-run AUH.

Alex

