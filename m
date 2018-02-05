Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 53B1078432
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Feb 2018 14:51:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Feb 2018 06:51:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,465,1511856000"; d="scan'208";a="171776686"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 05 Feb 2018 06:51:56 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
References: <20180201180210.21652-1-alexander.kanavin@linux.intel.com>
	<20180201180210.21652-16-alexander.kanavin@linux.intel.com>
	<CAJTo0LZFzhjunzJANsfm6Poo=idkyd-y6N7BnANc3kjD51Z26Q@mail.gmail.com>
	<CAMKF1spkfhB7su3w1afLHcfz0wSrvOKvJ9AOQQktSLyHH-mCwg@mail.gmail.com>
	<cf9b1424-a148-fe3b-fc77-49b6c7b89e0f@linux.intel.com>
Message-ID: <7452a226-371f-7bcb-d183-8d22a69f8e11@linux.intel.com>
Date: Mon, 5 Feb 2018 16:52:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <cf9b1424-a148-fe3b-fc77-49b6c7b89e0f@linux.intel.com>
Cc: Marek Vasut <marex@denx.de>, trini@konsulko.com,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 16/20] dtc: upgrade to 1.4.6
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
X-List-Received-Date: Mon, 05 Feb 2018 14:51:57 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 02/05/2018 12:42 PM, Alexander Kanavin wrote:
>>> /data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/recipe-sysroot-native/usr/include/libfdt_env.h:70:30: 
>>>
>>> error: conflicting types for 'fdt64_t'
>>> |  typedef uint64_t FDT_BITWISE fdt64_t;
>>> |                               ^~~~~~~
>>> | In file included from <command-line>:0:0:
>>> |
>>> /data/poky-tmp/master/work/beaglebone_yocto-poky-linux-gnueabi/u-boot/1_2018.01-r0/git/include/libfdt_env.h:19:16: 
>>>
>>> note: previous declaration of 'fdt64_t' was here
>>> |  typedef __be64 fdt64_t;
>>> |                 ^~~~~~~
>>>
>>
>> I have a patch to u-boot which is fixing similar issue. see
>> see if this helps.
>>
>> https://gist.github.com/kraj/70d613d1ead4be98a5787928d8518434
>>
> 
> Thanks, I think u-boot upstream also has a fix for it. I'll check.

Unfortunately, latest u-boot upstream still fails in the same way. As I 
really have no idea about when system includes vs bundled includes 
should be used (and no way to test anything u-boot related), let's defer 
this update until either upstream takes care of this issue.

Alex


