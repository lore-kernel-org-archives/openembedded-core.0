Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 91DE5783DE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 19 Aug 2017 22:01:43 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2017 15:01:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,399,1498546800"; d="scan'208";a="141696972"
Received: from lsandov1-mobl3.amr.corp.intel.com (HELO [10.255.78.29])
	([10.255.78.29])
	by fmsmga005.fm.intel.com with ESMTP; 19 Aug 2017 15:01:43 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170815190828.82873-1-leonardo.sandoval.gonzalez@linux.intel.com>
	<20170815190828.82873-2-leonardo.sandoval.gonzalez@linux.intel.com>
	<1503177266.32591.25.camel@linuxfoundation.org>
From: "Sandoval Gonzalez, Leonardo"
	<leonardo.sandoval.gonzalez@linux.intel.com>
Message-ID: <35f36156-ba9c-86e4-ab6f-1b287d862f7d@linux.intel.com>
Date: Sat, 19 Aug 2017 17:01:42 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1503177266.32591.25.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/2] build-appliance-image: include proxy on pip3 installation
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
X-List-Received-Date: Sat, 19 Aug 2017 22:01:43 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: es-ES



El 8/19/2017 a las 4:14 PM, Richard Purdie escribió:
> On Tue, 2017-08-15 at 12:08 -0700,
> leonardo.sandoval.gonzalez@linux.intel.com wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> Otherwise, we get timeouts, leading to errors:
>>
>>      pip._vendor.requests.exceptions.ConnectTimeout:
>> HTTPSConnectionPool(host='pypi.python.org', port=443): Max retries
>> exceeded with url: /pypi/pip/json (Caused by
>> ConnectTimeoutError(<pip._vendor.requests.packages.urllib3.connection
>> .VerifiedHTTPSConnection object at 0x7ff741bb3ef0>, 'Connection to
>> pypi.python.org timed out. (connect timeout=5)'))
>>      WARNING: TOPDIR/tmp/work/qemux86-poky-linux/build-appliance-
>> image/15.0.0-r0/temp/run.do_populate_poky_src.185123:1 exit 1 from
>> 'pip3 install --user -I -U -v -r TOPDIR/tmp/work/qemux86-poky-
>> linux/build-appliance-image/15.0.0-
>> r0/rootfs/home/builder/poky/bitbake/toaster-requirements.txt'
>>      DEBUG: Python function do_image finished
>>
>> Complete log at [1]
>>
>> [1] http://errors.yoctoproject.org/Errors/Build/43393/
>>
>> Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.in
>> tel.com>
>> ---
>>   meta/recipes-core/images/build-appliance-image_15.0.0.bb | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
> Something isn't correct here:
>
> https://autobuilder.yoctoproject.org/main/builders/build-appliance/builds/1176/steps/BuildImages_1/logs/stdio

rigth. Missing quotes on the if -n expression. V2 pending.

Leo

>
> Cheers,
>
> Richard
>


