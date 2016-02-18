Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 70E6A600B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Feb 2016 18:21:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 18 Feb 2016 10:21:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,466,1449561600"; d="scan'208";a="918688466"
Received: from afshjern.zpn.intel.com (HELO [10.219.5.147]) ([10.219.5.147])
	by fmsmga002.fm.intel.com with ESMTP; 18 Feb 2016 10:21:42 -0800
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1455702940-5840-1-git-send-email-alejandro.franco@linux.intel.com>
	<1455806750.28376.85.camel@linuxfoundation.org>
From: Alex Franco <alejandro.franco@linux.intel.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <56C60C00.7010606@linux.intel.com>
Date: Thu, 18 Feb 2016 12:22:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1455806750.28376.85.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/2] testimage: add/modify DEFAULT_TEST_SUITES
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
X-List-Received-Date: Thu, 18 Feb 2016 18:21:44 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

So I'm currently running a couple lsb builds, but even though they
aren't finished, I think this patch may be the culprit, since I am
defining DEFAULT_TEST_SUITES_pn-core-image-lsb with exactly the tests
that are failing, so I'll most likely be sending an update soon.

Alex Franco

On 02/18/2016 08:45 AM, Richard Purdie wrote:
> On Wed, 2016-02-17 at 09:55 +0000, Alex Franco wrote:
>> - Add generic variables to reuse values in default test suites
>> - Add more default test suites variables
>> - Modify existing test suites to use generic vars when possible
>>
>> [YOCTO #8410]
>>
>> Alex Franco (2):
>>   testimage: add DEFAULT_TEST_SUITES for more images
>>   testimage: reuse generic test suites
> Results in failures on the autobuilder, e.g.:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/b=
uilds/667/steps/Running%20Sanity%20Tests/logs/stdio
>
> (I'm guessing it was from these patches)
>
> Cheers,
>
> Richard



