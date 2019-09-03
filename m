Return-Path: <ross.burton@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AA54D606D0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 15:19:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Sep 2019 08:20:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,463,1559545200"; d="scan'208";a="194375514"
Received: from oakcakay-mobl2.ger.corp.intel.com (HELO blackadder.local)
	([10.252.38.52])
	by orsmga002.jf.intel.com with ESMTP; 03 Sep 2019 08:19:57 -0700
To: openembedded-core@lists.openembedded.org
References: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <540b8349-cbf0-5cd7-d77f-9327f5195117@intel.com>
Date: Tue, 3 Sep 2019 16:19:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <a01c66d2-4603-5633-9b3e-6180ba8c904d@windriver.com>
Subject: Re: boost 1.69 -> 1.71 upgrade for 3.0?
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
X-List-Received-Date: Tue, 03 Sep 2019 15:19:59 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 22/08/2019 20:19, Randy MacLeod wrote:
> I'm checking if you have done any work on upgrading the
> boost recipe? Trevor will work on it if you haven't started.
> He's relatively new to YP so depending on how easy the
> update is he might bail or need help or take a while.

I know I'm late to this thread, but as a warning to anyone else: Boost 
is *not a simple recipe*.  Boost has a custom build system that is - to 
put it politely - quite challenging to use.  I recommend browsing the 
recipe and observing at what point the original author of the recipe 
started to go mad.

Ross

