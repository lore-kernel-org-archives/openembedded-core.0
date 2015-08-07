Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A6E9176794
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:25:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 07 Aug 2015 05:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,629,1432623600"; d="scan'208";a="537727312"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2015 05:25:56 -0700
Message-ID: <55C4A41B.9080303@linux.intel.com>
Date: Fri, 07 Aug 2015 15:27:07 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1438619216.git.alexander.kanavin@linux.intel.com>	
	<6a9899fa17063139292c39c162444d1a1356ccce.1438619216.git.alexander.kanavin@linux.intel.com>
	<1438945283.30467.32.camel@linuxfoundation.org>
In-Reply-To: <1438945283.30467.32.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/7] fotowall: update SRC_URI to use github instead of qt-apps.org
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
X-List-Received-Date: Fri, 07 Aug 2015 12:25:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2015 02:01 PM, Richard Purdie wrote:
>> GitHub is where upstream development is happening, so we are more likely
>> to find out about new releases from there
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>>   meta/recipes-qt/qt-apps/fotowall_0.9.bb | 6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>
> Also fails on patch application:
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-arm64/builds/83/steps/BuildImages/logs/stdio
>
> so are these really the same version?

Apologies, I was pretty sure that I tested that all of the things in the 
original 26-patch set build, but seems like some were forgotten, or 
tested, then updated to fix something, then not re-tested again. I'll 
send an updated patchset.


Alex

