Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id D767578928
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2018 10:25:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Mar 2018 03:25:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,464,1515484800"; d="scan'208";a="182232165"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 13 Mar 2018 03:25:49 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	Zhang Xiao <xiao.zhang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20180312091303.121887-1-xiao.zhang@windriver.com>
	<7673ca98-3ed5-c770-180e-88d599736d92@linux.intel.com>
	<a739f962-dad5-1d0f-5795-b46bee65c26d@windriver.com>
	<dcc91a62-07a3-9374-5f5c-41fae23fb682@linux.intel.com>
	<cc14195a-81df-190f-23fa-9c914e21e6d9@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4813fff9-6e19-4c8d-e22e-2ab6ce5e8989@linux.intel.com>
Date: Tue, 13 Mar 2018 12:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <cc14195a-81df-190f-23fa-9c914e21e6d9@windriver.com>
Subject: Re: [PATCH 1/7] eudev: fix file conflict when multilib enabled
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
X-List-Received-Date: Tue, 13 Mar 2018 10:25:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/12/2018 09:48 PM, Mark Hatle wrote:
> Then an advanced user to select a specific version of the 'alternatives'.  The
> key with all of this is that it needs to be 'reasonable' for both the recipe
> maintainer and the end user.  Having to manually rename things, use the existing
> update-alternatives, etc really isn't a good idea -- even if it solves (some of)
> the user issues.

But what is the specific need for having both 32 and 64 bit development 
packages *installed at the same time*? You do need to explain this, 
because any solution will add complexity and headaches for oe-core 
maintainers, and multilib is already far too complex and tricky.

If the customer is fine with switching between the two sets, then this 
can be trivially solved using existing tools:

1. Deinstall 32 bit dev packages on device.
2. Install matching 64 bit dev packages on device

... or vice versa. Just wrap it in a script.


Alex



