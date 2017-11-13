Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0925E784EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Nov 2017 09:04:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Nov 2017 01:04:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,388,1505804400"; d="scan'208";a="172881534"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 13 Nov 2017 01:04:30 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1510275834.git.liezhi.yang@windriver.com>
	<65b92ba827b1b5252355bb8d656b73286ec182fb.1510275834.git.liezhi.yang@windriver.com>
	<6adc72a1-8fd1-7e85-36c4-565d659fb438@linux.intel.com>
	<1110a3c8-f1b7-e37b-73e9-be14561f2042@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4e79c869-8af8-0135-c249-ce21d6107ff5@linux.intel.com>
Date: Mon, 13 Nov 2017 11:04:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1110a3c8-f1b7-e37b-73e9-be14561f2042@windriver.com>
Subject: Re: [PATCH 13/23] package_manager.py: reverse archs correctly
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
X-List-Received-Date: Mon, 13 Nov 2017 09:04:31 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 11/13/2017 10:40 AM, Robert Yang wrote:
>> Can you place all of this in a helper function please?
> 
> Thanks, updated in the repo:
> +        self._arch_reverse_helper()

Don't make the helper update class variables. It makes the code hard to 
understand or reason about. Instead, call like this:

self.archs = _determine_archs(arch_var)

and do the rest in the helper. So that self.archs is assigned to only once.

Alex

