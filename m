Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 215BA784A0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 10:56:15 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 03:56:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,387,1498546800"; d="scan'208";a="124693685"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 17 Aug 2017 03:56:12 -0700
To: Mark Hatle <mark.hatle@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
	<1502890461.13978.127.camel@linuxfoundation.org>
	<e285fe7c-320d-db44-98fd-ff1d06df5706@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d01a078c-ad1a-2979-3fc2-fc5d4052ae02@linux.intel.com>
Date: Thu, 17 Aug 2017 13:53:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <e285fe7c-320d-db44-98fd-ff1d06df5706@windriver.com>
Cc: peter.kjellerstedt@axis.com
Subject: Re: [PATCH 0/6 v2] Fix RPM4 regressions based on Pyro
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
X-List-Received-Date: Thu, 17 Aug 2017 10:56:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/16/2017 06:37 PM, Mark Hatle wrote:
> Are there any examples?  I was looking there and simply didn't see any.  I saw
> the packaging for instance exercised python interfaces, version comparison
> tools, etc.. but nothing that built a recipe/package and then verified the
> contents were 'correct'.
> 
> Ideally the test would be to fabricate something with a known set of file
> dependencies, produce a package from it and then verify that the package
> properly included those dependencies.
> 
> I had looked at just picking some random library out of the deploy directory,
> and doing a pattern search on it's provides.. but I'm not sure that type of test
> would be very robust.

How was this regression discovered in the first place? I guess that some 
recipe used to build without error with rpm5, and stopped building with 
rpm4. This is what you could test for: isolate the problematic bit, 
remove everything else, and write a simple recipe(s) that can be placed 
into meta-selftest. Then simply build those from the selftest; if they 
build without error, you don't need to do more sophisticated checks.


Alex

