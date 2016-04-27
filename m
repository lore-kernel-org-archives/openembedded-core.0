Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A48E86FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Apr 2016 12:51:24 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 27 Apr 2016 05:51:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,541,1455004800"; d="scan'208";a="92883877"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 27 Apr 2016 05:51:25 -0700
To: openembedded-core@lists.openembedded.org
References: <571E0BF3.8080408@linux.intel.com> <571E3387.6090201@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5720B5EB.80309@linux.intel.com>
Date: Wed, 27 Apr 2016 15:51:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <571E3387.6090201@gmail.com>
Subject: Re: moving OpenEmbedded-core to Python 3
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
X-List-Received-Date: Wed, 27 Apr 2016 12:51:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2016 06:11 PM, akuster808 wrote:
>> we want to deprecate Python 2 in oe-core and set Python 3 as the
>> default, preferred choice. What does this mean?
>
> What is the target to make  Python3 default, 2.2?

There is no specific target when the task is 'totally done', it's an 
ongoing activity that will span multiple releases. I plan to have the 
initial patchset merged into master in 2.2 cycle, but there's more work 
to be done when upstream components currently stuck in python 2 will 
finally more to python 3, and fixing up any loose ends, obscure 
regressions etc.

>> 1) Introducing new Python 2 dependencies via new recipes or additional
>> DEPENDS etc. in existing recipes will be discouraged: you'll have to
>> provide a reason.
>
> Will there be any kind of QA warning for these dependencies? this will
> help  scope how many recipes need to be looked at. there are a lot of
> layers out there.

I think there will not be. There are too many recipes in oe-core that 
are python 2 only (and even more outside of oe-core), and it's too much 
work to add warning suppressions to them all. Also, we don't want to 
force python 3 transition on anyone outside of oe-core, people can do it 
at their own pace and schedule.

>> 2) Bitbake itself is at the moment Python 2 only - which will be addressed.
>
> What will the env setup script display then?

This is a question for bitbake developers I guess, not me.

Alex

