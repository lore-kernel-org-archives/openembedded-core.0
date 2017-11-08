Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6ABD671BE5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Nov 2017 13:14:22 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 08 Nov 2017 05:14:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,364,1505804400"; d="scan'208";a="173690610"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 08 Nov 2017 05:14:23 -0800
To: Neal Gompa <ngompa13@gmail.com>
References: <20171018121423.1310-1-alexander.kanavin@linux.intel.com>
	<264c9619-62e7-ef43-9412-f00e9a1028ba@linux.intel.com>
	<634edf6c-23d9-1dbf-6c51-caef2f30c06f@windriver.com>
	<d4391631-e05e-bae9-363e-6d9fb7f3e3b6@linux.intel.com>
	<CAEg-Je-MW3k897aKZmmjh4Q-eFD8Kko=7FLRByv19sGYK1ZxRg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <0afcb034-1acf-3a4b-b27a-010b7073a308@linux.intel.com>
Date: Wed, 8 Nov 2017 15:14:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAEg-Je-MW3k897aKZmmjh4Q-eFD8Kko=7FLRByv19sGYK1ZxRg@mail.gmail.com>
Cc: Mark Wielaard <mjw@redhat.com>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: update to 4.14.0
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
X-List-Received-Date: Wed, 08 Nov 2017 13:14:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/07/2017 11:17 PM, Neal Gompa wrote:

>> Thanks, this is the offending commit:
>>
>> https://github.com/rpm-software-management/rpm/commit/88989572fff1f31e0c4f972a6895585e4742ef4b
>>
>> Looks like they added sophisticated in-place processing/rewriting of the
>> actual binary (that is not possible to switch off). And it fails in case of
>> grub modules.
>>
>> We, on the other hand, only need to extract the list of debug source code
>> files. Any hint on how to do that without the use of rpm/debugedit? Perhaps
>> something from binutils/elfutils?
>>
> 
> This is the first time I'm hearing of this. Has anyone talked to Mark
> Wielaard (CC'd to this email) about fixing this properly for you guys?
We don't have any particular interest in debugedit though. It is only 
used as a crutch to extract the debug source locations. If readelf can 
do the same thing, we'll use that - please do understand that reporting 
issues upstream costs time, especially if upstream replies with 
NEEDINFO, WORKSFORME or WONTFIX type of thing, so we prioritize what's 
truly critical :)

Alex

