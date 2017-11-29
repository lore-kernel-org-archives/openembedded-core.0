Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 8C2476FFCD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 09:57:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 01:57:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,472,1505804400"; d="scan'208";a="10923860"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2017 01:57:07 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171127145454.19146-1-alexander.kanavin@linux.intel.com>
	<3bd86191-d785-95c0-8625-fe8ee4b8efd5@gmail.com>
	<b9190a91-6e8b-8f6a-357f-74d1d2919eee@linux.intel.com>
	<CAMKF1sq1NFnDOAOi0eZdmSPpsuKmi90qL==NBV69NLWkuRz-AQ@mail.gmail.com>
	<3b26a13c-78b2-fc20-8050-d2048f28f271@linux.intel.com>
	<CAJTo0LaXiuPjXBH4PZ6PDASmiSz=r06sFNXMvZm9-NUKwngSig@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5e7391dc-a3fe-24de-ac7e-d93bfe1a19a6@linux.intel.com>
Date: Wed, 29 Nov 2017 11:57:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaXiuPjXBH4PZ6PDASmiSz=r06sFNXMvZm9-NUKwngSig@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: add license checksum change handling to 'devtool upgrade'
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
X-List-Received-Date: Wed, 29 Nov 2017 09:57:09 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/29/2017 11:10 AM, Burton, Ross wrote:
> I just tested this new behaviour and I for one like how it worked.  It's 
> sufficiently verbose that it obviously needs to be deleted and is 
> stashed somewhere useful.

FWIW, I will modify AUH so that it will move the info from recipe into 
commit, when creating one. So then a human will only need to amend the 
commit message. The broader goal is to automate the upgrade process as 
much as possible, give the commits directly to autobuilder and post them 
to oe-core list, and if they pass and don't need amending, I think it's 
fine to push them to straight to master with the 'From' still containing 
a robot name :)

So that I (and other recipe maintainers) can spend time on more 
interesting things.

> A new patchtest test to automatically tell people if they left it in the 
> recipe would be good too.

Yes; will be done after I'm happy with the way AUH works :)

Alex

