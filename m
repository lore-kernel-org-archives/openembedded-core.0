Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5575A6CA74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 07:37:31 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id n2so295236oag.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=j5Y4omuEFWGjeaMkTCszt7nLpJ4mhOhs845o8582Epo=;
	b=N85mfrWqebiIx/mgwq3CVxRVT31LG8oqOb9bog8IaRtSpOzxeE7Yl7dygaB8PSD6YV
	BRDPxjQVK1WbIeHTka0b53Y52HpTdWb/WQoWItLDkI6sriZzGwjRREptpNX+ZGbuplCN
	k/DaJkB5hmfy+Ox4feDGqdZZQ0nj5fNQ1hSwdxd/vBkNl9nbVHQpHAlFjJOzxZ8ZAMM7
	O7ySrXf8ZWc4l3UPRb/gXLmttH+aeZlhYuSOTLRt9nEm6VCZHHU9VMC5ruxzSqJlWoQH
	HEBpfEth9qtcrjaSA+dakcAT8eJ14QNHczSnnb4XRJ9UqERRbONM0YuekQoJ7xdVHGHF
	5NGg==
MIME-Version: 1.0
X-Received: by 10.182.66.164 with SMTP id g4mr610563obt.47.1381909052724; Wed,
	16 Oct 2013 00:37:32 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 16 Oct 2013 00:37:32 -0700 (PDT)
In-Reply-To: <525E36E3.4020002@windriver.com>
References: <1381902795-3187-1-git-send-email-rongqing.li@windriver.com>
	<CAP9ODKpm_zpo+TyFDe0TSAXHs=MvFjouPjRNE0GcE9i6Lk_7Aw@mail.gmail.com>
	<525E3378.3070604@windriver.com>
	<CAP9ODKpmjfkkNu=Cyrom8-WE-_QJ7+5CtvXwXzuHJBy9RwZg3Q@mail.gmail.com>
	<525E36E3.4020002@windriver.com>
Date: Wed, 16 Oct 2013 04:37:32 -0300
X-Google-Sender-Auth: DS7jP9CRLjk_ZcRZflL6LQXu6E0
Message-ID: <CAP9ODKoXCBVCifcU-dqMU-JG4ebh6UbQkThYwvsckyg2idz0HA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Rongqing Li <rongqing.li@windriver.com>
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Wed, 16 Oct 2013 07:37:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 16, 2013 at 3:49 AM, Rongqing Li <rongqing.li@windriver.com> wrote:
>
>
> On 10/16/2013 02:39 PM, Otavio Salvador wrote:
>>
>> On Wed, Oct 16, 2013 at 3:34 AM, Rongqing Li <rongqing.li@windriver.com>
>> wrote:
>>>
>>>
>>>
>>> On 10/16/2013 02:24 PM, Otavio Salvador wrote:
>>>>
>>>>
>>>> On Wed, Oct 16, 2013 at 2:53 AM,  <rongqing.li@windriver.com> wrote:
>>>>>
>>>>>
>>>>> From: Roy Li <rongqing.li@windriver.com>
>>>>>
>>>>> [YOCTO #5287]
>>>>>
>>>>> tar failed and reported that file changed as we read it, now
>>>>> we workaround it
>>>>>
>>>>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>>>>
>>>>
>>>>
>>>> You must be kidding right?! loop 5 times?!? why not fix the root cause
>>>> of the change?
>>>>
>>>
>>> Sorry, I do not know the root cause, and I see many people spent
>>> lots of efforts to investigate, but do not find the root cause,
>>> sometime we suspect it is the building servers kernel issue,
>>> if it is true, we can not fix the building servers, we only
>>> workaround the code.
>>
>>
>> The only possible cause is it starting to prepare the tar /before/ all
>> packages are unpack. This would be a missing dependency against a task
>> or something like that.
>>
>> How can I reproduce the issue?
>>
>
> Describe in the bugzillar:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4757

This seems quote system specific.

I am wondering if this could be 'workarounded' issuing a sync before
running the tar.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

