Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AF9117E686
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 12:17:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5SCHf8j022153
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2019 05:17:41 -0700 (PDT)
Received: from localhost.corp.ad.wrs.com (128.224.162.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Fri, 28 Jun 2019 05:17:34 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1561724553.git.liezhi.yang@windriver.com>
	<37d251c3a3f0b81fa910df996f54bc0be22cf846.1561724553.git.liezhi.yang@windriver.com>
	<CAJTo0LYyTbnvKE2_YAK4_Xu1csQaqLcMg5fCKCMxJ49vk3SepA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <d7d18185-b72d-828c-68a3-87ea23458c09@windriver.com>
Date: Fri, 28 Jun 2019 20:18:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
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
X-List-Received-Date: Fri, 28 Jun 2019 12:17:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 6/28/19 8:15 PM, Burton, Ross wrote:
> Did you just do the minimum required, or take a new copy of waf from upstream?
> 
> (https://gitlab.com/ita1024/waf/)

No, I didn't take it from upstream, I just modified it and ran:

$ bitbake eglinfo-fb eglinfo-x11 eglinfo-wayland

// RObert

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

