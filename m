Return-Path: <anibal.limon@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 7755E780F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 14:56:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 12 Jul 2017 07:56:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,350,1496127600"; d="scan'208";a="878050958"
Received: from alimonb-mobl1.zpn.intel.com (HELO [10.219.128.139])
	([10.219.128.139])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jul 2017 07:56:28 -0700
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
	<18c26d81808842d3ab4272a5f6d0090fa99aa0f0.1499803885.git.anibal.limon@linux.intel.com>
	<1499869984.5349.41.camel@linux.intel.com>
From: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Message-ID: <8e338e26-dda0-0341-d8a6-8097135d33fa@linux.intel.com>
Date: Wed, 12 Jul 2017 09:56:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1499869984.5349.41.camel@linux.intel.com>
Cc: joshua.g.lock@intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 28/30] argparse_oe: Add int_positive type
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
X-List-Received-Date: Wed, 12 Jul 2017 14:56:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit



On 07/12/2017 09:33 AM, Leonardo Sandoval wrote:
> On Tue, 2017-07-11 at 15:23 -0500, Aníbal Limón wrote:
>> Sometimes only expect positive values from cmdline so it's better
>> to filter at parsing cmdline step instead of validate later.
>>
>> Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
>> ---
>>  scripts/lib/argparse_oe.py | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
>> index bf6eb17197b..9bdfc1ceca2 100644
>> --- a/scripts/lib/argparse_oe.py
>> +++ b/scripts/lib/argparse_oe.py
>> @@ -167,3 +167,10 @@ class OeHelpFormatter(argparse.HelpFormatter):
>>              return '\n'.join(lines)
>>          else:
>>              return super(OeHelpFormatter, self)._format_action(action)
>> +
> 
> 
> when adding an argument into a script, one can define the type expected
> so and the library itself does what you are doing for free, so not sure
> if this is needed.

The argparse only has int type so i need to ensure that only positive
numbers are allowed.

Anibal
> 
> 
> 
>> +def int_positive(value):
>> +    ivalue = int(value)
>> +    if ivalue <= 0:
>> +        raise argparse.ArgumentTypeError(
>> +                "%s is not a positive int value" % value)
>> +    return ivalue
> 
> 

