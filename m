Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 72CCA6AC4B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:48:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 14 Dec 2015 07:49:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,427,1444719600"; d="scan'208";a="871185472"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.5.48]) ([10.219.5.48])
	by orsmga002.jf.intel.com with ESMTP; 14 Dec 2015 07:48:59 -0800
To: Nathan Lynch <Nathan_Lynch@mentor.com>
References: <cover.1449523356.git.anibal.limon@linux.intel.com>
	<75b7c85d17559f2f279039e1606fbf1e1e1dee23.1449523356.git.anibal.limon@linux.intel.com>
	<566B5B0C.2000501@mentor.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <566EE52B.4010203@linux.intel.com>
Date: Mon, 14 Dec 2015 09:50:03 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <566B5B0C.2000501@mentor.com>
Cc: paul.eggleton@linux.intel.com, georgex.l.musat@intel.com, bjst@enea.com,
	benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] ptest-runner: Add version 2.0 re-implementation in python.
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
X-List-Received-Date: Mon, 14 Dec 2015 15:49:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 12/11/2015 05:23 PM, Nathan Lynch wrote:
> On 12/07/2015 03:26 PM, Aníbal Limón wrote:
>> The new ptest-runner supports timeout of upstream tests executed,
>> it looks for stdout of process and if no information is available
>> in certain time (defaults to 5m) the process is treaty as blocked
>> and ptest-runner kills it, this handles problems of ptest-runner
>> being blocked indefinitly for upstream test suites.
> 
> Having the option to specify a timeout is obviously useful, but please
> add the ability to wait indefinitely, and consider making this the
> default behavior.  The appropriate value for a timeout, if any, will
> always be a function of the particular circumstances of the test run.
> An indefinite wait at least gives one the opportunity to investigate a
> misbehaving test without racing the test harness.

I'll add the ability to wait indefinitely adding a -1 to timeout option
but for default i think is better to wait certain time by default
because when ptest-runner is used in automatically manner
(i.e.testimage) this cause the block indefinitely.

> 
>> +DEFAULT_TIMEOUT_SECS = 500
> 
> The change description says the default is five minutes, but this is not
> five minutes :-)

Thanks for notice it, it was a mistake :).

> 
> 

