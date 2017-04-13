Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5712E77A8A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 10:19:04 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Apr 2017 03:19:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,194,1488873600"; d="scan'208";a="845420585"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Apr 2017 03:19:04 -0700
To: openembedded-core@lists.openembedded.org
References: <20170413083344.22737-1-dmitry.rozhkov@linux.intel.com>
	<85c346c4-f6d6-c853-bfc5-0daa64ea2db8@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e2a6b8d9-5c53-29c2-0ee2-810e83fefc86@linux.intel.com>
Date: Thu, 13 Apr 2017 13:18:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <85c346c4-f6d6-c853-bfc5-0daa64ea2db8@linux.intel.com>
Subject: Re: [PATCH] python: make python2 and python3 alternatives to python
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
X-List-Received-Date: Thu, 13 Apr 2017 10:19:05 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/13/2017 01:15 PM, Alexander Kanavin wrote:
> On 04/13/2017 11:33 AM, Dmitry Rozhkov wrote:
>> If only python3 is installed on an image nothing provides
>> /usr/bin/python even though many scripts compatible with
>> both python2 and python3 just state `#!/usr/bin/env python`
>> in their shebang line.
>>
>> Make python and python3 recipes provide alternatives for
>> /usr/bin/python and /usr/bin/python-config. By default
>> python2 has higher priority over python3.
>
> This runs against upstream recommendation and common distro practice.
> And it will break scripts that have not been ported to Python 3. Please
> fix the scripts instead to refer to python 3 whenever possible.

Also, if there are scripts on the image that refer to 'python', yet 
python 2.7 is not installed into the image, that's a missing RDEPENDS in 
the scripts recipe.

Alex


