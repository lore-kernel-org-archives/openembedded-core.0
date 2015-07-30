Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 162B07649B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:21:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 30 Jul 2015 08:21:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758481397"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 08:21:55 -0700
Message-ID: <55BA4151.3010609@linux.intel.com>
Date: Thu, 30 Jul 2015 18:22:57 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<e5437695391e1dd4fe0ecad10dec483cb0e3a8bc.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730143213.GF2457@jama>
In-Reply-To: <20150730143213.GF2457@jama>
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
X-List-Received-Date: Thu, 30 Jul 2015 15:21:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 05:32 PM, Martin Jansa wrote:

>> diff --git a/meta/recipes-extended/lsb/lsb_4.1.bb b/meta/recipes-extended/lsb/lsb_4.1.bb
>> index 6215b62..171a6c8 100644
>> --- a/meta/recipes-extended/lsb/lsb_4.1.bb
>> +++ b/meta/recipes-extended/lsb/lsb_4.1.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/1.4/lsb-release-1.4.tar
>> +PV = "1.4"
>
> And isn't it confusing to say 4.1 in recipe name and 1.4 inside of the
> recipe?

It's confusing to begin with to say the recipe is 4.1, but the tarball 
it fetches is 1.4. I don't see how this makes the confusion much worse, 
but at least it fixes the upstream version check.


Alex

