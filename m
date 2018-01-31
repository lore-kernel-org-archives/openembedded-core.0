Return-Path: <alexander.kanavin@linux.intel.com>
X-Greylist: delayed 573 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 31 Jan 2018 08:37:29 UTC
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 9C72D78879
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jan 2018 08:37:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2018 00:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,438,1511856000"; d="scan'208";a="26876293"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 31 Jan 2018 00:27:56 -0800
To: Hongxu Jia <hongxu.jia@windriver.com>,
	openembedded-core@lists.openembedded.org,
	Leonardo Sandoval <leonardo.sandoval.gonzalez@intel.com>
References: <cover.1517383469.git.hongxu.jia@windriver.com>
	<ec85ad1d59af3b628e885b63624f611affbfeb5e.1517383469.git.hongxu.jia@windriver.com>
	<b9238af1-23a0-4e71-3188-c0be9f92e9f9@linux.intel.com>
	<b96c9baf-4817-52a5-bb22-ba10f4e553f9@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d077472e-a6ea-9b78-31b8-2ee5e42f5267@linux.intel.com>
Date: Wed, 31 Jan 2018 10:27:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <b96c9baf-4817-52a5-bb22-ba10f4e553f9@windriver.com>
Subject: Re: [PATCH 2/7] pigz: 2.3.4 -> 2.4
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
X-List-Received-Date: Wed, 31 Jan 2018 08:37:29 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/31/2018 10:29 AM, Hongxu Jia wrote:
> On 2018年01月31日 16:14, Alexander Kanavin wrote:
>> On 01/31/2018 09:48 AM, Hongxu Jia wrote:
>>> -LIC_FILES_CHKSUM = 
>>> "file://pigz.c;beginline=7;endline=21;md5=a21d4075cb00ab4ca17fce5e7534ca95" 
>>>
>>> +LIC_FILES_CHKSUM = 
>>> "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline=7;endline=21" 
>>>
>>
>> Please explain what changed here?
>>
> 
> No change, only version bump up

You need to mention this in the commit message.

I still wonder why patchtest won't tell that anymore; we changed it to 
look for a tag, and somehow that isn't working :(

Alex

