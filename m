Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 9FC02731DF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:33:15 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 01 Aug 2016 09:33:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,456,1464678000"; d="scan'208";a="1006409213"
Received: from amrendax-mobl4.amr.corp.intel.com (HELO [10.255.77.92])
	([10.255.77.92])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2016 09:33:15 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <1469728851-20606-1-git-send-email-alejandro.hernandez@linux.intel.com>
	<1469741983.9142.34.camel@linuxfoundation.org>
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
Message-ID: <80aaf536-45aa-239f-4c8c-15c3768adc18@linux.intel.com>
Date: Mon, 1 Aug 2016 11:33:14 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1469741983.9142.34.camel@linuxfoundation.org>
Subject: Re: [PATCH v3] python-setuptools: Upgrade to v 25.1.0
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
X-List-Received-Date: Mon, 01 Aug 2016 16:33:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


On 07/28/2016 04:39 PM, Richard Purdie wrote:
> On Thu, 2016-07-28 at 18:00 +0000, Alejandro Hernandez wrote:
>> LICENCE checksum did not change, it is emebedded on the setup.py
>> file,
>> this file changed, so the line number where we get the checksum
>> changed.
>>
>> Signed-off-by: Alejandro Hernandez <
>> alejandro.hernandez@linux.intel.com>
>> ---
>>   meta/recipes-devtools/python/python-setuptools.inc |  6 ++--
>>   .../python/python-setuptools_22.0.5.bb             | 38 ------------
>> ----------
>>   .../python/python-setuptools_25.1.0.bb             | 38
>> ++++++++++++++++++++++
>>   3 files changed, 41 insertions(+), 41 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/python/python
>> -setuptools_22.0.5.bb
>>   create mode 100644 meta/recipes-devtools/python/python
>> -setuptools_25.1.0.bb
> This patch results in:
>
> ERROR: python3-setuptools-22.0.5-r0 do_fetch: Checksum failure fetching https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-22.0.5.tar.gz
> ERROR: python3-setuptools-22.0.5-r0 do_fetch: Function failed: Fetcher failure for URL: 'https://files.pythonhosted.org/packages/source/s/setuptools/setuptools-22.0.5.tar.gz'. Checksum mismatch!
> File: '/media/build3/sources/setuptools-22.0.5.tar.gz' has md5 checksum 869f3029dcc66a64ba39875e2a2f044a when a4814dead37e74a86883c66f7d420d73 was expected
> File: '/media/build3/sources/setuptools-22.0.5.tar.gz' has sha256 checksum 19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb when 6a0f8111feb5a3438c6309cda49810a16d23e73c173331281edc37dd1374d1d5 was expected
> If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
> SRC_URI[md5sum] = "869f3029dcc66a64ba39875e2a2f044a"
> SRC_URI[sha256sum] = "19aad19471052d5daefe96f2c1fa2e88dcdb17488bf8708d7e6356881ea833cb"
> Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
>
> ERROR: Logfile of failure stored in: /media/build1/poky/build/tmp/work/core2-64-poky-linux/python3-setuptools/22.0.5-r0/temp/log.do_fetch.131527
> ERROR: Task /media/build1/poky/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb:do_fetch (/media/build1/poky/meta/recipes-devtools/python/python3-setuptools_22.0.5.bb:do_fetch) failed with exit code '1'
>
> Since I suspect there is a common file between python and python3...

Oh sorry, I forgot to rename the python3-setuptools bb file, sending it 
soon.
>
> Cheers,
>
> Richard


