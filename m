Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id DB1746011C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Jul 2016 19:27:46 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Jul 2016 12:27:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,576,1459839600"; d="scan'208";a="989058347"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.5.49])
	([10.219.5.49])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2016 12:27:46 -0700
To: benjamin.esquivel@intel.com, openembedded-core@lists.openembedded.org
References: <cover.1467610017.git.mariano.lopez@linux.intel.com>
	<932369064295b6f68c10ed6753e2adefedc294b3.1467610017.git.mariano.lopez@linux.intel.com>
	<006601d1d606$d2c5eef0$7851ccd0$@linux.intel.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <577AB8B7.70808@linux.intel.com>
Date: Mon, 4 Jul 2016 14:27:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <006601d1d606$d2c5eef0$7851ccd0$@linux.intel.com>
Subject: Re: [PATCH 1/1] oetest.py: Add command line parameter support for tag in testexport
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
X-List-Received-Date: Mon, 04 Jul 2016 19:27:48 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 07/04/2016 10:14 AM, Benjamin Esquivel wrote:
> Hello Mariano, comments below
>
>>   class ExportTestContext(RuntimeTestContext):
>> -    def __init__(self, d, target, exported=False):
>> +    def __init__(self, d, target, exported=False, *args, **kwargs):
> Is the use of kwargs necessary? If not, it would be preferable to have a
> Named var here instead. Kwargs breaks readability.

Is not really necessary at this point. The idea here was to be easier to 
extend the class in child classes, but I see your point with the kwargs 
being to generic.

>>       target.exportStart()
>> -    tc = ExportTestContext(d, target, True)
>> +    tc = ExportTestContext(d, target, True, **kwargs)
> If you don't want to mess with the inputs of this function by using kwargs
> then you can consider passing an object that includes the variables you want. I'd
> only suggest it if this function signature will grow.
>

Right now, it just require a single variable that is an argument from 
the cli, so I will use a dict for that purpose, per our discussion.

-- 
Mariano Lopez

