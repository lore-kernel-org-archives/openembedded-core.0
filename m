Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7A45F78255
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Aug 2017 13:00:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Aug 2017 06:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,444,1498546800"; d="scan'208";a="895161545"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 29 Aug 2017 06:00:18 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20170829114526.37559-1-alexander.kanavin@linux.intel.com>
	<20170829114526.37559-2-alexander.kanavin@linux.intel.com>
	<1504010995.2175.2.camel@linuxfoundation.org>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <a691910e-8d87-803b-f135-7f71a71105dd@linux.intel.com>
Date: Tue, 29 Aug 2017 15:57:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1504010995.2175.2.camel@linuxfoundation.org>
Subject: Re: [PATCH 2/3] subversion: inherit pkgconfig, so that serf can be found
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
X-List-Received-Date: Tue, 29 Aug 2017 13:00:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 08/29/2017 03:49 PM, Richard Purdie wrote:

>> --- a/meta/recipes-devtools/subversion/subversion_1.9.6.bb
>> +++ b/meta/recipes-devtools/subversion/subversion_1.9.6.bb
>> @@ -8,7 +8,7 @@ HOMEPAGE = "http://subversion.tigris.org"
>>   
>>   BBCLASSEXTEND = "native"
>>   
>> -inherit gettext
>> +inherit gettext pkgconfig
>>   
>>   SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>>              file://disable_macos.patch \
> 
> Any idea why we haven't had errors from this? Did it mean we just lost
> something like https support?

We didn't get errors because subversion's build system didn't deem 
absence of pkgconfig (and thus, disabling of serf) an error. Also, I 
think we no longer have any recipes in oe-core that fetch from svn, so 
nothing is testing that subversion-native does in fact work.

How necessary is subversion nowadays for those company-internal repos?

Alex

