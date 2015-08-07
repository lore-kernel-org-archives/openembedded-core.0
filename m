Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 39B8A76773
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 12:08:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 07 Aug 2015 05:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,629,1432623600"; d="scan'208";a="744102707"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 07 Aug 2015 05:08:21 -0700
Message-ID: <55C49FFC.4010006@linux.intel.com>
Date: Fri, 07 Aug 2015 15:09:32 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<e5437695391e1dd4fe0ecad10dec483cb0e3a8bc.1438262915.git.alexander.kanavin@linux.intel.com>
	<120CC689-4105-4DE2-8602-96A9BF548DEE@gmail.com>
In-Reply-To: <120CC689-4105-4DE2-8602-96A9BF548DEE@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/26] lsb: set PV to 1.4 to match upstream tarball version
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
X-List-Received-Date: Fri, 07 Aug 2015 12:08:24 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/07/2015 10:21 AM, Khem Raj wrote:

>> This allows upstream version check to work
>>
>> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
>> ---
>> meta/recipes-extended/lsb/lsb_4.1.bb | 1 +
>> 1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
>> index 6215b62..171a6c8 100644
>> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
>> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
>>             file://lsb_pidofproc \
>>             file://lsb_start_daemon \
>>             "
>> +PV = “1.4”
>>
>
> it will send version backwards, why is this needed ?

See above - "This allows upstream version check to work".

Alex



