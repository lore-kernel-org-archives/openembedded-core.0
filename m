Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id D349860E23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 12:12:31 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 22 May 2014 05:12:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,887,1392192000"; d="scan'208";a="435507544"
Received: from mcomyns-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.122])
	by azsmga001.ch.intel.com with ESMTP; 22 May 2014 05:12:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 May 2014 13:12:29 +0100
Message-ID: <1792805.5zgpScJvS1@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CAJTo0LYT6ujkqgE1Z3HjovsFJTBD3XMG6jDM+Yj_C-sHLeokBw@mail.gmail.com>
References: <1400685003-28267-1-git-send-email-georgex.l.musat@intel.com>
	<CAJTo0LYT6ujkqgE1Z3HjovsFJTBD3XMG6jDM+Yj_C-sHLeokBw@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] Added test case numbers to test cases to aid in future automation of testopia status change.
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
X-List-Received-Date: Thu, 22 May 2014 12:12:35 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 22 May 2014 11:52:09 Burton, Ross wrote:
> On 21 May 2014 16:10, Lucian Musat <georgex.l.musat@intel.com> wrote:
> > -    def test_bitbakelayers_showcrossdepends(self):
> 
> > +    def test_bitbakelayers_showcrossdepends_tc_756(self):
> That's a bit ugly, and not very easy to extract.
> 
> Assuming that we control the logging, I'd suggest using a decorator to
> add the test case numbers to the function objects:
> 
> # This decorator takes an argument and sets it as the test_case member
> def testcase(number):
>     def decorator(func):
>         func.test_case = number
>         return func
>     return decorator
> 
> @testcase(42)
> def test_method():
>     print "Hello, world!"
> 
> print "Executing test (test case %d)" % test_method.test_case
> test_method()
> 
> Now you can extract the test case programatically, instead of relying
> on the method name containing the number.  The decorator can be
> extended to set more fields to other useful information too.

Good call, I wouldn't have thought of using a decorator in this way.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

