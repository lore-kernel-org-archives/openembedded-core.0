Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ACDE57EFF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2019 02:59:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x6B2xAPV021430
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Jul 2019 19:59:10 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 10 Jul 2019 19:59:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1561724553.git.liezhi.yang@windriver.com>
	<37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
	<CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <add0a48c-e769-9b86-1de7-88a156b3a599@windriver.com>
Date: Thu, 11 Jul 2019 11:00:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/6] waf: python2 -> python3
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
X-List-Received-Date: Thu, 11 Jul 2019 02:59:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ross,

On 6/28/19 8:15 PM, Burton, Ross wrote:
> Did you just do the minimum required, or take a new copy of waf from upstream?
> 
> (https://gitlab.com/ita1024/waf/)

I checked the one from upstream, it is still python2. The waf is the only one
which still requires python2 in oe-core. We can get rid of python2 after this
patch, what's your opinion, please?

// Robert

> 
> Ross
> 
> On Fri, 28 Jun 2019 at 13:01, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/recipes-graphics/eglinfo/files/waf | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/recipes-graphics/eglinfo/files/waf b/meta/recipes-graphics/eglinfo/files/waf
>> index 04ddd9f..2c83ed4 100755
>> --- a/meta/recipes-graphics/eglinfo/files/waf
>> +++ b/meta/recipes-graphics/eglinfo/files/waf
>> @@ -1,4 +1,4 @@
>> -#!/usr/bin/env python
>> +#!/usr/bin/env python3
>>   # encoding: latin-1
>>   # Thomas Nagy, 2005-2018
>>   #
>> @@ -113,7 +113,7 @@ def unpack_wafdir(dir, src):
>>          os.remove(tmp)
>>          os.chdir(cwd)
>>
>> -       try: dir = unicode(dir, 'mbcs')
>> +       try: dir = str(dir, 'mbcs')
>>          except: pass
>>          try:
>>                  from ctypes import windll
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

