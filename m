Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8BF2071951
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Nov 2017 12:24:15 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Nov 2017 05:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,333,1505804400"; d="scan'208";a="145118740"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 02 Nov 2017 05:24:15 -0700
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20171102053922.33426-1-raj.khem@gmail.com>
	<44258d74-acbd-45cf-0a00-c82554be03ec@linux.intel.com>
	<CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e7b239be-9c34-18b1-7b63-006334d7d2db@linux.intel.com>
Date: Thu, 2 Nov 2017 14:24:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAP9ODKqKMjmPLm0yP91ojS3OX5rLkEW34uwrvR02V5rcs4VWGA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] musl: Update to 1.1.18
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
X-List-Received-Date: Thu, 02 Nov 2017 12:24:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/02/2017 02:21 PM, Otavio Salvador wrote:
> On Thu, Nov 2, 2017 at 10:19 AM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 11/02/2017 07:39 AM, Khem Raj wrote:
>>
>>> Changes since v2: Move to 1.1.18 release
>>> -PV = "1.1.16+git${SRCPV}"
>>> +PV = "1.1.18+git${SRCPV}"
>>
>>
>> Can you drop this, and simply rename the recipe to musl_1.1.18.bb please?
> 
> Why? keeping it on _git makes sense to me.

Only if it's a random development revision (e.g. 1.1.18 plus a bunch of 
commits) - if the version taken is a pristine tagged release, it should 
be indicated as such, regardless of whether it's taken from a tarball or 
a git checkout.

Alex

