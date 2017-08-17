Return-Path: <juan.m.cruz.alcaraz@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 74A29782DE
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Aug 2017 15:06:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Aug 2017 08:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,388,1498546800"; d="scan'208";a="1163657737"
Received: from jmcruzal-thinkpad-w540.zpn.intel.com (HELO [10.219.128.125])
	([10.219.128.125])
	by orsmga001.jf.intel.com with ESMTP; 17 Aug 2017 08:06:33 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170817013615.5900-1-juan.m.cruz.alcaraz@linux.intel.com>
	<1502955374.13978.182.camel@linuxfoundation.org>
	<1812364.na1VDiqueP@peggleto-mobl.ger.corp.intel.com>
From: Juan Manuel <juan.m.cruz.alcaraz@linux.intel.com>
Message-ID: <d79f4903-2e81-88fd-3000-7d50dd1e107b@linux.intel.com>
Date: Thu, 17 Aug 2017 10:17:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1812364.na1VDiqueP@peggleto-mobl.ger.corp.intel.com>
Subject: Re: [PATCH v2] devtool/copy_buildsystem: adds meta-skeleton layer in the eSDK installation.
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
X-List-Received-Date: Thu, 17 Aug 2017 15:06:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 17/08/17 03:59, Paul Eggleton wrote:
> On Thursday, 17 August 2017 7:36:14 PM NZST Richard Purdie wrote:
>> On Wed, 2017-08-16 at 18:36 -0700, juan.m.cruz.alcaraz@linux.intel.com
>> wrote:
>>> From: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.com>
>>>
>>> The eSDK installation requires the meta-skeleton layer.
>>> The build system might use the meta-skeleton recipes as layout
>>> to create custom recipes. An example is the recipetool script
>>> that uses the meta-skeleton kernel recipe when creating a custom
>>> kernel recipe.
>>>
>>> [YOCTO #11102]
>>>
>>> Signed-off-by: Juan M Cruz Alcaraz <juan.m.cruz.alcaraz@linux.intel.c
>>> om>
>>> ---
>>>   meta/lib/oe/copy_buildsystem.py | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>> Failed to build on the autobuilder I'm afraid:
>>
>> https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/1216/
> steps/BuildImages_2/logs/stdio
>
> Right, the assumption that the first part will be "poky/" is probably the
> issue here. I suspect you will have to step through the list and remove
> anything that ends with '/meta-skeleton'.
Certainly that is the problem. I'll fix and send back.

> Cheers,
> Paul
>
>


