Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QruhK-00009B-H0
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 18:35:02 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 12 Aug 2011 09:30:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,363,1309762800"; d="scan'208";a="38832773"
Received: from unknown (HELO envy.home) ([10.255.14.228])
	by fmsmga002.fm.intel.com with ESMTP; 12 Aug 2011 09:30:25 -0700
Message-ID: <4E455522.6040303@linux.intel.com>
Date: Fri, 12 Aug 2011 09:30:26 -0700
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1313134270.git.sgw@linux.intel.com>
	<37738c9649d8a17c9f99713d9cbc4a93c803f977.1313134270.git.sgw@linux.intel.com>
	<1313165371.14274.509.camel@rex>
In-Reply-To: <1313165371.14274.509.camel@rex>
Subject: Re: [CONSOLIDATED PULL 17/25] meta-rt: rt-tests v0.73 instead of AUTOREV
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Aug 2011 16:35:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 08/12/2011 09:09 AM, Richard Purdie wrote:
> On Fri, 2011-08-12 at 00:50 -0700, Saul Wold wrote:
>> From: Darren Hart <dvhart@linux.intel.com>
>>
>> AUTOREV is handy is a development aid, but it really shouldn't be used as a
>> default as it breaks the consistency and repeatability of a build. It also
>> causes additional fetches which may not be desired or expected.
>>
>> Signed-off-by: Darren Hart <dvhart@linux.intel.com>
>> ---
>>  .../{rt-tests_git.bb => rt-tests_0.73.bb}          |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>  rename meta-rt/recipes-tests/{rt-tests_git.bb => rt-tests_0.73.bb} (97%)
>>
>> diff --git a/meta-rt/recipes-tests/rt-tests_git.bb b/meta-rt/recipes-tests/rt-tests_0.73.bb
>> similarity index 97%
>> rename from meta-rt/recipes-tests/rt-tests_git.bb
>> rename to meta-rt/recipes-tests/rt-tests_0.73.bb
>> index 35af022..6334bcd 100644
>> --- a/meta-rt/recipes-tests/rt-tests_git.bb
>> +++ b/meta-rt/recipes-tests/rt-tests_0.73.bb
>> @@ -6,7 +6,7 @@ LICENSE = "GPLv2 & GPLv2+"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
>>                      file://src/cyclictest/cyclictest.c;beginline=7;endline=9;md5=ce162fe491d19d2ec67dff6dbc938d50 \
>>                      file://src/pi_tests/pi_stress.c;beginline=6;endline=19;md5=bd426a634a43ec612e9fbf125dfcc949"
>> -SRCREV = ${AUTOREV}
>> +SRCREV = v0.73
>>  PV = "git${SRCPV}"
>>  PR = "r0"
> 
> Sorry, but this is nearly as bad as the system has to hit the network to
> resolve "v0.73" into a revision. Please can you do something like:

Duh. Apologies. I'll spin up a fix immediately.

--
Darren

> 
> # This revision is v0.73
> SRCREV = "xxx"
> 
> which I appreciate is ugly but there is no nice way to do this (and
> support offline builds).
> 
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


