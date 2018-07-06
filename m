Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5105178B20
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 10:17:11 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w66AHAVU007193
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 6 Jul 2018 03:17:11 -0700
Received: from [128.224.16.191] (128.224.16.191) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 6 Jul 2018 03:17:09 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Chen Qi
	<Qi.Chen@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
	<99ad3edc2b6c1e86c3a9a377a1bf245bced38148.1528252931.git.liezhi.yang@windriver.com>
	<52791220.vcYpphDNgo@localhost.localdomain>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <5ada2181-c328-82ce-587d-c0299d1a3db0@windriver.com>
Date: Fri, 6 Jul 2018 18:17:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <52791220.vcYpphDNgo@localhost.localdomain>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 09/11] populate_sdk_ext.bbclass: add ESDK_MANIFEST_EXCLUDES
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
X-List-Received-Date: Fri, 06 Jul 2018 10:17:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 07/06/2018 06:12 PM, Paul Eggleton wrote:
> Hi Robert / Chen
> 
> On Wednesday, 6 June 2018 4:54:44 AM CEST Robert Yang wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Add ESDK_MANIFEST_EXCLUDES to enable excluding items in sdk-conf-manifest.
>>
>> By default, files under conf/ are all added to sdk-conf-manifest, as the
>> manifest file is set to 'conf/*'.
>>
>> However, there are situations where some configuration files under conf/
>> directory are not intended to be added to sdk-conf-manifest, thus adding
>> ESDK_MANIFEST_EXCLUDES to enable users to do this.
>>
>> This variable takes the form of glob matching.
>> e.g.
>> ESDK_MANIFEST_EXCLUDES = "conf/autogen*"
>> This would exclude all files under conf/ starting with 'autogen' from
>> sdk-conf-manifest.
> 
> This patch (and 05/11, SDK_LAYERS_EXCLUDE*) worry me a little in that they
> have the potential to break the resulting eSDK or make it behave in a manner
> that is different from the build system that produced it. Having said that
> it's going to be reasonably clear to the user what's happened, assuming they
> remember they set these variables and in any case I don't expect these are
> going to be set by many people. Accordingly I won't object to these patches,
> but could you please add a warning about this issue to the commit message for
> both? We'd also better ensure they get documented with similar warnings.
> 
> Apart from that I'd like to see a different name for the variable here - we
> don't use the prefix ESDK_ anywhere else, so perhaps SDK_CONF_MANIFEST_EXCLUDE
> ?

Thanks, make sense, will update it next week.

// Robert

> 
> Cheers,
> Paul
> 
> 
> 

