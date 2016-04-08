Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id B69F47680A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 03:49:49 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id e185so14659805vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 20:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=sEUYpxsiSicVK/J4rxAqyY49k9igga32qyZRNlOx0nY=;
	b=fxE/bfNf4z7S/dvzPzE0uDPm7OymNqKvTj6GGpvUP1lD3cn4B7PaRKg6upzJE4Lwlo
	nDaErCsilV10XMkoseLHooLH6Sfx+oK+HT222i4IYonWLXJO8wyXOee3XKYSp1RaUrJK
	fc1mIXVoZeQGVwGz4eUiRh7+EKie9YUjYEquG+qnH4Hg27DZy3FMDxsrxozLFd3YQr2K
	spVBi3mQcFMsteIW3vB4h3t+s7lVvpM16h+AdUKBifWzZuB4yDa+9Kuuu1FU7LZOG76Y
	az1vQwpudR4lS/XSTc8VSrGa4xduYcTzcST4lBhk0xFzSAaPt/xeRxkUgF11gxzTa4FG
	oT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=sEUYpxsiSicVK/J4rxAqyY49k9igga32qyZRNlOx0nY=;
	b=AUs6c/p4abf1u67x4Tuh0uyDQLC1twfjLoSjmIfaTn00jWFdt3CQMbb4p5vIMYyI1U
	9FYbKebJAvFb7MHyBOkcuXz+W+s4PiDkP5070VEROvJwPF8Roes3uNYJIAiBpF81LTzV
	z0/rrDdXMZbvdvP6SLis55X8x9tTb8snvXR2tY0yE07HZPmC/H1TE3RghA08mqW1ZuzW
	s6+DESSKAW/r7gZ6hUj8imTrQvacdNhGVJZJ/hd0uyBOiSt9HrzPCu3ZUqkNXKfL7eOb
	rPPhLVFmVhHh6Gye/Fs7PSIzV1JR+TlEZ62ixBA3v5iRbncJlDSr4QbdzNeg/gCNwa8g
	x4RQ==
X-Gm-Message-State: AD7BkJLxWd1E5htsYlBmQPKyRBLlu7O7oFhyIZ/wnwLJZQkt+Q2ruJno7cTkb7Hh9Sbf+yokJUTUlTPMkNzD5w==
MIME-Version: 1.0
X-Received: by 10.159.36.240 with SMTP id 103mr3069504uar.98.1460087389424;
	Thu, 07 Apr 2016 20:49:49 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Thu, 7 Apr 2016 20:49:49 -0700 (PDT)
In-Reply-To: <5706FF8B.1060706@windriver.com>
References: <cover.1460015043.git.liezhi.yang@windriver.com>
	<0186a488dc4ff5d3daf5ef0d1fd54bb0e79763a7.1460015043.git.liezhi.yang@windriver.com>
	<CACS+7ZQ55g1EQkWD5OQOH0zU=S1p9BRx_Nn8u5FKQmL3_-QEcw@mail.gmail.com>
	<570664CD.4090501@windriver.com>
	<CACS+7ZSOJg9gpWGKAKM2dA6Y6Se4wcj+DWFpjOdKS014fqZWYQ@mail.gmail.com>
	<5706FF8B.1060706@windriver.com>
Date: Thu, 7 Apr 2016 21:49:49 -0600
Message-ID: <CACS+7ZQJOwbjMvcpbogdr2KsZouGfa=PHeRNBpEYS3Hm_T3XEA@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] fs-perms.txt: fix ROOT_HOME's permission
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
X-List-Received-Date: Fri, 08 Apr 2016 03:49:49 -0000
Content-Type: text/plain; charset=UTF-8

On 7 April 2016 at 18:47, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 04/07/2016 11:55 PM, Dan McGregor wrote:
>>
>> On 7 April 2016 at 07:46, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>
>>>
>>>
>>> On 04/07/2016 09:30 PM, Dan McGregor wrote:
>>>>
>>>>
>>>> On 7 April 2016 at 01:50, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>>>
>>>>>
>>>>> It should be 0700 rather than 0755.
>>>>>
>>>>> Reported-by: Charles Chan <charles.wh.chan@gmail.com>
>>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>>> ---
>>>>>    meta/files/fs-perms.txt | 1 +
>>>>>    1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
>>>>> index 109cbe5..1d74da7 100644
>>>>> --- a/meta/files/fs-perms.txt
>>>>> +++ b/meta/files/fs-perms.txt
>>>>> @@ -51,6 +51,7 @@ ${localstatedir}/lock link    /run/lock
>>>>>    ${localstatedir}/tmp   link    volatile/tmp
>>>>>
>>>>>    /home                          0755    root    root    false - - -
>>>>> +${ROOT_HOME}                   0700    root    root    false - - -
>>>>
>>>>
>>>>
>>>> I'd like to see this in the section labelled "Special permissions from
>>>> base-files" around line 58. I think that makes it more clear that this
>>>> is a special permission setting.
>>>
>>>
>>>
>>> Thanks, updated in the repo:
>>>
>>>    git://git.openembedded.org/openembedded-core-contrib rbt/home
>>>
>>>
>>> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/home
>>>
>>>
>>> commit ccc59f44f5fc6c6ccef6b0fed58b0d582c9ee32b
>>> Author: Robert Yang <liezhi.yang@windriver.com>
>>> Date:   Tue Apr 5 22:34:25 2016 -0700
>>>
>>>      fs-perms.txt: fix ROOT_HOME's permission
>>>
>>>      It should be 0700 rather than 0755.
>>>
>>>      Reported-by: Charles Chan <charles.wh.chan@gmail.com>
>>>      Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>
>>> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
>>> index 109cbe5..6c1083c 100644
>>> --- a/meta/files/fs-perms.txt
>>> +++ b/meta/files/fs-perms.txt
>>> @@ -59,6 +59,7 @@ ${localstatedir}/local                0755    root
>>> root
>>> false - - -
>>>   # Set 1777
>>>   /tmp                           01777   root    root    false - - -
>>>   ${localstatedir}/volatile/tmp  01777   root    root    false - - -
>>> +${ROOT_HOME}                   0700    root    root    false - - -
>>>
>>
>> Thanks, this is the right track, but this implies that ${ROOT_HOME}
>> should be mode 1777, how about:
>>
>> +
>> +# Set 700
>> +${ROOT_HOME}                   0700    root    root    false - - -
>
>
> Thanks, updated in the repo:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/home
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/home
>
>
> commit 5d0c64fd55edc957d8fb6340c9842bf8498a485d
> Author: Robert Yang <liezhi.yang@windriver.com>
> Date:   Tue Apr 5 22:34:25 2016 -0700
>
>     fs-perms.txt: fix ROOT_HOME's permission
>
>     It should be 0700 rather than 0755.
>
>     Reported-by: Charles Chan <charles.wh.chan@gmail.com>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>
> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
> index 109cbe5..3d00e86 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -60,6 +60,9 @@ ${localstatedir}/local                0755    root    root
> false - - -
>  /tmp                           01777   root    root    false - - -
>  ${localstatedir}/volatile/tmp  01777   root    root    false - - -
>
> +# Set 0700
> +${ROOT_HOME}                   0700    root    root    false - - -
> +
>
>  # Set 755-lsb
>  /srv                           0755    root    root    false - - -
>

Looks good to me.

>
> // Robert
>
>>
>>>   # Set 755-lsb
>>>   /srv                           0755    root    root    false - - -
>>>
>>>
>>> // Robert
>>>
>>>
>>>>
>>>>
>>>>>    /srv                           0755    root    root    false - - -
>>>>>    ${prefix}/src                  0755    root    root    false - - -
>>>>>    ${localstatedir}/local         0755    root    root    false - - -
>>>>> --
>>>>> 2.8.0
>>>>>
>>>>> --
>>>>> _______________________________________________
>>>>> Openembedded-core mailing list
>>>>> Openembedded-core@lists.openembedded.org
>>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>>
>>>>
>>>>
>>>
>>
>

