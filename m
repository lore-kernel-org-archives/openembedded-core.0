Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id E779F789A9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 09:24:44 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id CBC8A156A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 11:24:44 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
References: <20180717093523.5582-1-dv@pseudoterminal.org>
	<ab21735150494d73905719782959b68d@XBOX02.axis.com>
	<86a38562-8785-a272-eb22-dc864e16d30a@pseudoterminal.org>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <1d99b3a2-e691-1f63-cbdf-96621d508156@pseudoterminal.org>
Date: Thu, 19 Jul 2018 11:24:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <86a38562-8785-a272-eb22-dc864e16d30a@pseudoterminal.org>
Subject: Re: [PATCH 1/6] gstreamer1.0-plugin-base: Update packageconfigs
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
X-List-Received-Date: Thu, 19 Jul 2018 09:24:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Alright, I am working on a v2 with the packageconfigs added back in. I 
also am adding patches for adding configuration switches for libgbm, 
libpng, and libjpeg.


On 2018-07-18 15:03, Carlos Rafael Giani wrote:
> On 2018-07-18 14:16, Peter Kjellerstedt wrote:
>>> -----Original Message-----
>>> From: openembedded-core-bounces@lists.openembedded.org
>>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>>> Carlos Rafael Giani
>>> Sent: den 17 juli 2018 11:35
>>> To: openembedded-core@lists.openembedded.org
>>> Subject: [OE-core] [PATCH 1/6] gstreamer1.0-plugin-base: Update
>>> packageconfigs
>>>
>>> * Always enable zlib, since it is part of oe-core, and dependencies 
>>> that
>>>    are in oe-core can be always enabled
>> Just because it can be enabled does not mean it should be 
>> unconditionally
>> enabled. If building for an environment where, e.g., flash memory is 
>> scarce,
>> every byte counts. Keeping the packageconfig and leaving it enabled by
>> default will give the same result, but for someone trying to remove 
>> anything
>> they do not need, it is then more obvious that the jpeg dependency is
>> optional and can be removed if wanted.
>>
>>> * The jpeg packageconfig is not needed, since there are no 
>>> configuration
>>>    switches to enable or disable it, and libjpeg-turbo is part of 
>>> oe-core
>> Same here as for zlib.
>>
>>> * libpng is a dependency, and is part of oe-core, so add it to DEPENDS
>> This too is optional and should have a packageconfig (which can be
>> enabled by default since it is pulled in anyway due to other 
>> dependencies).
>
> Well, okay, I can add them back in. However, there are no config 
> switches for the jpeg support. If someone enables a shared sysroot, 
> and there's libjpeg, gst-plugins-base will enable its support.
>
>>
>>> * There is no libvisual recipe in oe-core or in meta-openembedded, so
>>>    the visual packageconfig needs to go
>>> * Reorder the packageconfigs alphabetically
>> You also add dependencies on libgudev and libdrm, without mentioning 
>> it here.
>> Why is this? They too are optional, and they have not been needed 
>> before.
>> If you want to add support for them, then do so by adding packageconfigs
>> (which I don't think should be enabled by default to maintain the
>> configuration as it was).
>
> These are now needed for the Mesa GBM based EGL contexts. However, 
> just as with jpeg, there are no config switches for them. Now that you 
> mention it, yeah, it makes more sense to patch this..


