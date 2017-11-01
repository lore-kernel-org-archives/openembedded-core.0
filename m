Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id A422078215
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Nov 2017 08:38:39 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 01 Nov 2017 01:38:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,327,1505804400"; d="scan'208";a="170401913"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 01 Nov 2017 01:38:39 -0700
To: Randy MacLeod <randy.macleod@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <20171031174357.9502-1-alexander.kanavin@linux.intel.com>
	<20171031174357.9502-2-alexander.kanavin@linux.intel.com>
	<b0ee4a6c-d008-0d49-0651-a3e9c9e7c948@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <c6d3f2d7-7964-48e8-afac-981ccd92684c@linux.intel.com>
Date: Wed, 1 Nov 2017 10:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <b0ee4a6c-d008-0d49-0651-a3e9c9e7c948@windriver.com>
Subject: Re: [PATCH 2/2] oe-core: take UPSTREAM_CHECK_COMMITS into use where possible
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
X-List-Received-Date: Wed, 01 Nov 2017 08:38:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 10/31/2017 11:03 PM, Randy MacLeod wrote:
> On 2017-10-31 01:43 PM, Alexander Kanavin wrote:
>> This greatly reduces the amount of recipes for which upstream
>> version check fails: from about 30 to about 8.
> 
> Has anyone looked into piggy-backing off:
>     https://release-monitoring.org/
> Currently 15791 projects are being monitored by Anitya.
>     https://github.com/release-monitoring/anitya
> I *suspect* this is a Redhat backed project so it's likely
> to remain active and up to date.
> 
> Hmmm, I just tried a few of the packages listed below and only
> 2 of 8 were tracked packages but this is an outliers list so
> maybe that's a sign that the r-m.org site is doing better than
> our tracker.

Their data is not of sufficient quality unfortunately. For Python they 
report 3.7.0 as the latest version even though it won't be released 
until june 2018. Python 2.x is neglected altogether. Latest 3.6 version 
is 3.6.3 released a month ago, but they report only 3.6.2.

Similar issues with webkitgtk: they report 2.19.1 (a pre-release), but 
not 2.18.2 (actual latest release).

Then there's the question of who maintains the mapping of their database 
to our package names.

Our tracker has over 98% accuracy, while this one failed both of the 
randomly chosen samples ;)

Alex

