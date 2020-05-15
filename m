Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.10430.1589538147792812743
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 May 2020 03:22:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: liezhi.yang@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 04FALmFX008873
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Fri, 15 May 2020 03:21:58 -0700
Received: from [128.224.162.181] (128.224.162.181) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Fri, 15 May 2020
 03:21:26 -0700
Subject: Re: [OE-core] [PATCH 1/1] archiver.bbclass: Add ENABLE_COPYLEFT_FILTER to enable/disable copyleft_filter.bbclass
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
References: <cover.1589536566.git.liezhi.yang@windriver.com>
 <38eda2606c19cf817d09b35f1eb49d50170a52ae.1589536566.git.liezhi.yang@windriver.com>
 <CAM9ZRVuv+aL55apdEvFeqrHx_Nq=CKA1EAk=QkfhC92+9UrSMw@mail.gmail.com>
From: "Robert Yang" <liezhi.yang@windriver.com>
Message-ID: <cb24e3cb-d771-7100-dc4a-7c59ee002b7d@windriver.com>
Date: Fri, 15 May 2020 18:20:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAM9ZRVuv+aL55apdEvFeqrHx_Nq=CKA1EAk=QkfhC92+9UrSMw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 5/15/20 6:16 PM, Paul Barker wrote:
> On Fri, 15 May 2020 at 10:57, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> Set it to 0 can make it archive all the used sources during the build, nothing
>> will be filtered out, this is useful when we want to archive all the sources.
>>
>> This equals to:
>> COPYLEFT_LICENSE_INCLUDE = "*"
>> COPYLEFT_LICENSE_EXCLUDE = ""
>>
>> But there are a lot of settings in copyleft_filter.bbclass, so it may not work
>> when its default settings are changed, add the var ENABLE_COPYLEFT_FILTER will
>> make it more reliable.
> 
> Why would copyleft_filter.bbclass not work when the settings are
> changed? They're intended to be configurable.
> 
> I've been using `COPYLEFT_LICENSE_INCLUDE = "*"` in several projects
> for years now. I'm not sure that we need another overlapping variable
> which could confuse users further.

As you know, there other settings in copyleft_filter.bbclass may affect
the result, such as:

COPYLEFT_RECIPE_TYPES
COPYLEFT_PN_INCLUDE
COPYLEFT_PN_EXCLUDE

These settings maybe changed, and it's not easy to detect the changes,
the ENABLE_COPYLEFT_FILTER can make it more reliable.

// Robert

> 
> Thanks,
> Paul
> 
