Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BD510780C0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:55:46 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 07:54:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,350,1496127600"; d="scan'208";a="1194530244"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by fmsmga002.fm.intel.com with ESMTP; 12 Jul 2017 07:54:57 -0700
To: Patrick Ohly <patrick.ohly@intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<3e458a34a75f4a0b1e351b780034cce5f26cae89.1499803885.git.anibal.limon@linux.intel.com>
	<1499842595.20211.104.camel@intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <edfc24d2-a82d-3151-f3c3-466a06b6a937@linux.intel.com>
Date: Wed, 12 Jul 2017 09:55:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1499842595.20211.104.camel@intel.com>
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 18/30] oeqa/selftest/cases: tinfoil to run in the main thread
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
X-List-Received-Date: Wed, 12 Jul 2017 14:55:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/12/2017 01:56 AM, Patrick Ohly wrote:
> On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
>> The tinfoil tests needs to initialize bitbake internals and wasn't
>> designed to be in a thread environment causing problems when try
>> for example set signal handlers in a thread different than the
>> main one.
>>
>> To workaround this execute tinfoil tests in the main thread and
>> don't use custom builddir because isn't make sense too.
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>> ---
>>  meta/lib/oeqa/selftest/cases/tinfoil.py | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/lib/oeqa/selftest/cases/tinfoil.py
>> b/meta/lib/oeqa/selftest/cases/tinfoil.py
>> index aa1af7e0423..7248b755812 100644
>> --- a/meta/lib/oeqa/selftest/cases/tinfoil.py
>> +++ b/meta/lib/oeqa/selftest/cases/tinfoil.py
>> @@ -9,7 +9,6 @@ from oeqa.core.decorator.oeid import OETestID
>>  
>>  class TinfoilTests(OESelftestTestCase):
>>      """ Basic tests for the tinfoil API """
>> -
>>      @OETestID(1568)
>>      def test_getvar(self):
>>          with bb.tinfoil.Tinfoil() as tinfoil:
> 
> There's just a line removal in this patch. That's probably not what was
> intended?

Yes, thanks for pointing it, i changed the default behaviour to the old
one it means run by default into the main thread and uses the same build
dir, so this patch needs to be removed.

Cheers,
Anibal

> 

