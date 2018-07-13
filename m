Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 08E8578797
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2018 02:20:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6D2KSDK026796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jul 2018 19:20:28 -0700 (PDT)
Received: from [128.224.162.161] (128.224.162.161) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 12 Jul 2018 19:20:28 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Chen Qi
	<Qi.Chen@windriver.com>
References: <cover.1528252931.git.liezhi.yang@windriver.com>
	<99ad3edc2b6c1e86c3a9a377a1bf245bced38148.1528252931.git.liezhi.yang@windriver.com>
	<52791220.vcYpphDNgo@localhost.localdomain>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <10f16c0d-2722-fe45-ae04-45afc93bbcb8@windriver.com>
Date: Fri, 13 Jul 2018 10:23:47 +0800
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
X-List-Received-Date: Fri, 13 Jul 2018 02:20:39 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

HI Paul,

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

I think that a bb.note() is enough for it, we don't set them by default,
but set by users, so they should know something is excluded. So I will add
a bb.note for it:

bb.note('Exclude %s since it is in SDK_CONF_MANIFEST_EXCLUDE' % fn)

> 
> Apart from that I'd like to see a different name for the variable here - we
> don't use the prefix ESDK_ anywhere else, so perhaps SDK_CONF_MANIFEST_EXCLUDE
> ?

Thanks, I will update to SDK_CONF_MANIFEST_EXCLUDE in V4.

// Robert

> 
> Cheers,
> Paul
> 
> 
> 

