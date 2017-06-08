Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A13E9781FA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 12:37:05 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Jun 2017 05:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,314,1493708400"; d="scan'208";a="95929953"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 08 Jun 2017 05:37:01 -0700
To: "Puustinen, Ismo" <ismo.puustinen@intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170607134942.13281-1-ismo.puustinen@intel.com>
	<75435a83-d29b-4b68-3e27-90746b31c970@linux.intel.com>
	<1496925313.23488.6.camel@intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6a293ae0-944e-ccf3-91a4-56593c158505@linux.intel.com>
Date: Thu, 8 Jun 2017 15:37:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1496925313.23488.6.camel@intel.com>
Subject: Re: [PATCH v2] python3: make readline, gdbm, and db support conditional.
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
X-List-Received-Date: Thu, 08 Jun 2017 12:37:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/08/2017 03:35 PM, Puustinen, Ismo wrote:

>> db should be taken out from this patch, it's no longer a gplv3
>> concern
>> now that we're providing db 5.x only :)
>
> I can leave db out of the patch then. Is db 5.x a long-term solution or
> do we have to change to 6.x at some point? Is anyone maintaining db 5
> (security fixes especially) anymore?

We have no plans to change to 6.x.

5.x is what all major Linux distros are using, so we can take security 
fixes from them as needed. 6.x has been more or less rejected by open 
source community.

Alex

