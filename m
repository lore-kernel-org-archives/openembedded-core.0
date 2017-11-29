Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADF1601F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Nov 2017 08:07:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 00:07:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,471,1505804400"; d="scan'208";a="10890933"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2017 00:07:21 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20171127145454.19146-1-alexander.kanavin@linux.intel.com>
	<3bd86191-d785-95c0-8625-fe8ee4b8efd5@gmail.com>
	<b9190a91-6e8b-8f6a-357f-74d1d2919eee@linux.intel.com>
	<CAMKF1sq1NFnDOAOi0eZdmSPpsuKmi90qL==NBV69NLWkuRz-AQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <3b26a13c-78b2-fc20-8050-d2048f28f271@linux.intel.com>
Date: Wed, 29 Nov 2017 10:07:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sq1NFnDOAOi0eZdmSPpsuKmi90qL==NBV69NLWkuRz-AQ@mail.gmail.com>
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
X-List-Received-Date: Wed, 29 Nov 2017 08:07:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/29/2017 09:43 AM, Khem Raj wrote:
>> I'm not sure if this was clear, but the auto-generated license diff is meant
>> as a starting point for a commit summary written by a human, and once the
>> summary is written, should be deleted, regardless of whether it was placed
>> in a recipe, commit message or a separate file. Devtool does not create or
>> manage commits from the changes it makes to recipes, and so placing this
>> into the recipe felt the most appropriate to me (separate files are more
>> cumbersome to manage and printing to stdout can be forgotten). We can have
>> an automatic patch qa check that it's not accidentally left over, similar to
>> the existing check that license changes have an explanation.
> 
> I think emitting this info to stdout should be enough.

Between issuing 'devtool upgrade' and issuing 'git commit' with the 
upgrade a lot of things can happen. Patches need to be rebased by hand, 
build failures need to be dealt with, fixes need to be submitted 
upstream. Oh, and the changes need to be tested on target sometimes. 
Between all that, what the original command printed can be easily lost 
or forgottten. Much better to stash it somewhere where it will be safe.

Alex


