Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E94916C856
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 06:49:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G6n652025893
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 23:49:06 -0700 (PDT)
Received: from [128.224.162.168] (128.224.162.168) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 23:49:05 -0700
Message-ID: <525E36E3.4020002@windriver.com>
Date: Wed, 16 Oct 2013 14:49:07 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com>
	<CAP9ODKpmjfkkNu=Cyrom8-WE-_QJ7+5CtvXwXzuHJBy9RwZg3Q@mail.gmail.com>
In-Reply-To: <CAP9ODKpmjfkkNu=Cyrom8-WE-_QJ7+5CtvXwXzuHJBy9RwZg3Q@mail.gmail.com>
Cc: zhenhua.luo@freescale.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] populate_sdk_base: repeat to tar archive file five time
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
X-List-Received-Date: Wed, 16 Oct 2013 06:49:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/16/2013 02:39 PM, Otavio Salvador wrote:
> On Wed, Oct 16, 2013 at 3:34 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
>>
>>
>> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
>>>
>>> On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
>>>>
>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>
>>>> [YOCTO #5287]
>>>>
>>>> tar failed and reported that file changed as we read it, now
>>>> we workaround it
>>>>
>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>
>>>
>>> You must be kidding right?! loop 5 times?!? why not fix the root cause
>>> of the change?
>>>
>>
>> Sorry, I do not know the root cause, and I see many people spent
>> lots of efforts to investigate, but do not find the root cause,
>> sometime we suspect it is the building servers kernel issue,
>> if it is true, we can not fix the building servers, we only
>> workaround the code.
>
> The only possible cause is it starting to prepare the tar /before/ all
> packages are unpack. This would be a missing dependency against a task
> or something like that.
>
> How can I reproduce the issue?
>

Describe in the bugzillar:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=4757

-- 
Best Reagrds,
Roy | RongQing Li

