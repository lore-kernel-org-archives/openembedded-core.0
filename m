Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0FC067833E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Nov 2017 07:36:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2017 23:36:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,340,1508828400"; d="scan'208";a="11338399"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 29 Nov 2017 23:36:35 -0800
To: Robert Yang <liezhi.yang@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
References: <7f75c29b-312b-2047-c002-a6c45b4b132b@windriver.com>
	<2245890.VsGoLmxMeA@peggleto-mobl.ger.corp.intel.com>
	<8d950b8b-c9f4-75c4-2cbf-655ac7d452a9@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d418ae77-e614-1f5b-3069-4822671cf5a2@linux.intel.com>
Date: Thu, 30 Nov 2017 09:37:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <8d950b8b-c9f4-75c4-2cbf-655ac7d452a9@windriver.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: About auto-upgrade-helper's enhancement
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
X-List-Received-Date: Thu, 30 Nov 2017 07:36:36 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/30/2017 05:54 AM, Robert Yang wrote:
>> Have you looked at devtool upgrade at all?
> 
> I tried "devtool upgrade less --version 529" just now. What I like AUH 
> most is
> it can help update md5sum, do the commit, and do build testing on a few 
> qemu
> machines, that really helps a lot, which can enhance the quality of 
> patches.
> Does "devtool upgrade" has a plan to do that, please ?

For a while there was this unfortunate situation where devtool and AUH 
were 'in competition' with each other, but the plan is to clearly 
separate their responsibilities and replace the part of AUH that devtool 
also does with simply calling devtool. So you'll get the nice parts of 
both AUH (making commits and testing them) and devtool (rebasing 
patches, ability to manually fix failures).


Alex

