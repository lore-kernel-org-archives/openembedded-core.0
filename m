Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 41FF4763F2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 15:11:27 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 30 Jul 2015 08:11:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="758474516"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 30 Jul 2015 08:11:27 -0700
Message-ID: <55BA3EDD.4030600@linux.intel.com>
Date: Thu, 30 Jul 2015 18:12:29 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1438262915.git.alexander.kanavin@linux.intel.com>
	<0c7f8aaf4b04cf1bb866dae6af21509af051fbe6.1438262915.git.alexander.kanavin@linux.intel.com>
	<20150730142900.GB2457@jama>
In-Reply-To: <20150730142900.GB2457@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/26] libproxy: update SRC_URI to not use Google Code
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
X-List-Received-Date: Thu, 30 Jul 2015 15:11:28 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07/30/2015 05:29 PM, Martin Jansa wrote:

>> -SRC_URI = "http://libproxy.googlecode.com/files/libproxy-${PV}.zip \
>> +SRC_URI = "${DEBIAN_MIRROR}/main/libp/${BPN}/${BPN}_${PV}.orig.tar.gz \
>>              file://0001-test-Include-sys-select.h-for-select.patch \
>>             "
>> -
>> -SRC_URI[md5sum] = "06be230b8b612e64997f8f15af6373aa"
>> -SRC_URI[sha256sum] = "3175abcb49c0b37fd82c697927783bf7d53de3884a8559bc594e59caa09bdb04"
>> +SRC_URI[md5sum] = "3cd1ae2a4abecf44b3f24d6639d2cd84"
>> +SRC_URI[sha256sum] = "dc3f33de54163718f82b3e7c496a7de97f8862578414b8ecaad3cbfe4821864b"
>
> Why has debian mirror different checksums?
>
> Include the diff in commit message and warn premirror maintainers that
> they need to drop old file (otherwise it will fail) - which is very
> annoying.

I guess this is not needed because they are in fact two different 
filenames/formats?


Alex


