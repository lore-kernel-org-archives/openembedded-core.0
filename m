Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DF7B974BCA
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2018 09:18:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 May 2018 02:18:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,377,1520924400"; d="scan'208";a="53353635"
Received: from anmitta2-mobl1.png.intel.com (HELO [10.221.23.24])
	([10.221.23.24])
	by fmsmga001.fm.intel.com with ESMTP; 08 May 2018 02:18:06 -0700
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20180503081758.4661-2-anuj.mittal@intel.com>
	<20180504132838.21692-1-anuj.mittal@intel.com>
	<b353fb40-7ec2-2172-77f0-808018ddb672@linux.intel.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <eb19ca4a-bc0f-1e2b-4cd9-ad4c4efaaa41@intel.com>
Date: Tue, 8 May 2018 17:18:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <b353fb40-7ec2-2172-77f0-808018ddb672@linux.intel.com>
Subject: Re: [PATCH v2] gst-plugins-base: upgrade 1.12.4 -> 1.14.0
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
X-List-Received-Date: Tue, 08 May 2018 09:18:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/07/2018 06:42 PM, Alexander Kanavin wrote:
> On 05/04/2018 04:28 PM, Anuj Mittal wrote:
>> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>> index 6616e2cf0d..dc15d93eb0 100644
>> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
>> @@ -1,16 +1,17 @@
>> -From 990b653c7b6de1937ec759019982d6c5f15770f7 Mon Sep 17 00:00:00 2001
>> +From f523721e453febfb3f62f3ba1e9fefb31dcec471 Mon Sep 17 00:00:00 2001
>>   From: Alexander Kanavin <alex.kanavin@gmail.com>
>> -Date: Mon, 26 Oct 2015 16:38:18 +0200
>> -Subject: [PATCH 2/4] Makefile.am: prefix calls to pkg-config with
>> +Date: Thu, 5 Apr 2018 10:26:25 +0800
>> +Subject: [PATCH] Makefile.am: prefix calls to pkg-config with
>>    PKG_CONFIG_SYSROOT_DIR
>>   
>>   Upstream-Status: Pending [review on oe-core maillist]
>>   Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> +Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
>> +
>>   ---
>>    gst-libs/gst/allocators/Makefile.am |  4 ++--
>>    gst-libs/gst/app/Makefile.am        |  4 ++--
>>    gst-libs/gst/audio/Makefile.am      | 12 ++++++------
>> - gst-libs/gst/fft/Makefile.am        |  4 ++--
>>    gst-libs/gst/pbutils/Makefile.am    | 12 ++++++------
>>    gst-libs/gst/riff/Makefile.am       |  8 ++++----
>>    gst-libs/gst/rtp/Makefile.am        |  8 ++++----
>> @@ -18,13 +19,13 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>>    gst-libs/gst/sdp/Makefile.am        |  4 ++--
>>    gst-libs/gst/tag/Makefile.am        |  8 ++++----
>>    gst-libs/gst/video/Makefile.am      |  8 ++++----
> 
> This patch needs to be updated to also include gst-libs/gst/gl and fix 
> it in a similar way to other dirs. Can you do that please? This will 
> avoid the host contamination issue that you've seen on your machine 
> (build succeeding because the host has the needed files).
> 

Thanks Alex for taking a look at it. I will send the update.

Thanks,

Anuj


