Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF6E2782E4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 16:34:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Oct 2017 09:34:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,391,1503385200"; d="scan'208";a="1206800593"
Received: from jlock-mobl3.ger.corp.intel.com ([10.252.27.30])
	by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2017 09:34:14 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20171017150506.17803-1-joshua.g.lock@intel.com>
	<20171017110002.b1a3df797fdbf5767a5e6f57@linux.intel.com>
	<2eb0d895-21c0-e1ef-f5ef-f12ed014ac6c@linux.intel.com>
	<CAJTo0LZp+kdkO3pMmqEiLUNj4i6eE_Jt08MQGFcPdUM1FZjFnA@mail.gmail.com>
From: Joshua Lock <joshua.g.lock@linux.intel.com>
Message-ID: <c3b48865-6846-bb95-8a2e-01e6f646582e@linux.intel.com>
Date: Tue, 17 Oct 2017 17:34:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZp+kdkO3pMmqEiLUNj4i6eE_Jt08MQGFcPdUM1FZjFnA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] devtool: ensure temp directory is created
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
X-List-Received-Date: Tue, 17 Oct 2017 16:34:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 17/10/17 17:12, Burton, Ross wrote:
> On 17 October 2017 at 17:02, Joshua Lock <joshua.g.lock@linux.intel.com 
> <mailto:joshua.g.lock@linux.intel.com>> wrote:
> 
>     FWIW the failure has been observed on multiple host distros (Ubuntu
>     16.04, Fedora 26, Tumbleweed) and I could replicate it very easily
>     on my Fedora 26 host with an use of devtool modify -x.
> 
> 
> If you can replicate it on demand how about using a tracing tool to 
> figure out if a) the mkdir doesn't actually happen or b) something 
> deletes the directory.

It seems it's not as easy to reproduce as I thought. I can't reproduce 
it at all today on either of my two systems.

I will attempt to gather some logs next time we see it on the autobuilder.

Joshua

