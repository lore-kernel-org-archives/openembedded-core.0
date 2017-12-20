Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7E939783F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Dec 2017 20:16:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Dec 2017 12:16:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,433,1508828400"; 
   d="scan'208";a="4124475"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga008.fm.intel.com with ESMTP; 20 Dec 2017 12:16:47 -0800
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171220154511.12364-1-alexander.kanavin@linux.intel.com>
	<20171220154511.12364-3-alexander.kanavin@linux.intel.com>
	<CAJTo0Lbj3Qr888ai7c9jG84_gLyt9A5Uu-PzbtBMNqD2fq8cKg@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <9aab6e2c-eb38-efa2-d191-7d7b3e03b1f7@linux.intel.com>
Date: Wed, 20 Dec 2017 22:11:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lbj3Qr888ai7c9jG84_gLyt9A5Uu-PzbtBMNqD2fq8cKg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] runtime/cases/ptest.py: fail when ptests fail on target
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
X-List-Received-Date: Wed, 20 Dec 2017 20:16:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 12/20/2017 07:23 PM, Burton, Ross wrote:
> So the context was that so many ptests were failing that the test 
> couldn't be done automatically and expected to succeed. Bugs were filed 
> and the problem chipped away at, but last I looked it wasn't in a state 
> to be enabled.
> 
> If a core-image-sato passes with ptests enabled then that's great, but 
> I'll be surprised if it does!

It doesn't. In fact, it never finishes, because bluez ptest hangs 
forever. That shouldn't be a problem though, because ptests are not 
included by default in any of the standard images, and so the test is 
simply skipped (see patch 1 of 3). The point of this patch is to 
eliminate misleading passing behaviour when people do include ptests - 
either for everything in their image or for specific packages they 
maintain, and want, for example, to check for regressions on version 
upgrades.

Alex

