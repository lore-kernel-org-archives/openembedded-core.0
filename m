Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id ED310602D9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 19:22:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 11:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,465,1505804400"; d="scan'208";a="10222588"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 27 Nov 2017 11:22:43 -0800
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20171127145454.19146-1-alexander.kanavin@linux.intel.com>
	<3bd86191-d785-95c0-8625-fe8ee4b8efd5@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <b9190a91-6e8b-8f6a-357f-74d1d2919eee@linux.intel.com>
Date: Mon, 27 Nov 2017 21:23:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <3bd86191-d785-95c0-8625-fe8ee4b8efd5@gmail.com>
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
X-List-Received-Date: Mon, 27 Nov 2017 19:22:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/27/2017 08:11 PM, Khem Raj wrote:
>> 3) and the cool part: devtool will create a diff of the old and new 
>> licenses,
>> and write the diff into the workspace recipe as a comment, like this:
>>
> 
> adding a comment in recipe itself might start folks sending patches with 
> this text in the recipe changes. It should just be in commit message.

I'm not sure if this was clear, but the auto-generated license diff is 
meant as a starting point for a commit summary written by a human, and 
once the summary is written, should be deleted, regardless of whether it 
was placed in a recipe, commit message or a separate file. Devtool does 
not create or manage commits from the changes it makes to recipes, and 
so placing this into the recipe felt the most appropriate to me 
(separate files are more cumbersome to manage and printing to stdout can 
be forgotten). We can have an automatic patch qa check that it's not 
accidentally left over, similar to the existing check that license 
changes have an explanation.


Alex

