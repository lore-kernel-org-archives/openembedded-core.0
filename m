Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id EA17A71985
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 10:13:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 02:13:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,398,1505804400"; 
   d="scan'208";a="5183085"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 15 Nov 2017 02:13:51 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20171114145754.9643-1-alexander.kanavin@linux.intel.com>
	<20171114145754.9643-26-alexander.kanavin@linux.intel.com>
	<CAMKF1spFf70gSgvNsNsFZjQUFW64fw4mfeCQZHjMWTrzrXKO1A@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <81d760ab-9d3e-b349-b2bc-d9469f239eec@linux.intel.com>
Date: Wed, 15 Nov 2017 12:14:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spFf70gSgvNsNsFZjQUFW64fw4mfeCQZHjMWTrzrXKO1A@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 26/27] ffmpeg: update to 3.4
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
X-List-Received-Date: Wed, 15 Nov 2017 10:13:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/14/2017 09:41 PM, Khem Raj wrote:

>>   SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
>>              file://mips64_cpu_detection.patch \
>> -           file://0001-build-fix-for-mips.patch \
>> -          "
> 
> This patch is not deleted along with this omission. Perhaps an oversight ?
> 

Yes, must be 'devtool finish' not removing old files, which we just 
discussed with Paul. I'll resend.

Alex

