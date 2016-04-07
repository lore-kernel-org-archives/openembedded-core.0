Return-Path: <danismostlikely@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8866373167
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Apr 2016 15:55:17 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id e185so12557585vkb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Apr 2016 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=zfWQMNZ5YCT16AkAu3PBuzaPzfy40ruD+eyaf24O6mE=;
	b=RrWtwxU4x8luRwTJTFiUGi372EyQ0w5Zb/zpirw3warQq49m30b4Kly5bDfd4TlaLK
	P2ywwfhOoRpOw4iPLWWD6ay72zN+cg7hCWP/ZR2HjLsZSzFL9//ryF+Xf3AjdO1Wjx0w
	bLVIYJsb14V/mIbzc00KV0BEIFYZRb76Zy+crvmF7WJa/4701t0SKqjvWQa5HTvojZ9Z
	/c8RoONbZG/tfdrLRRCvrF5Hz/Dfw/zCabFHcDhcEylAIGnYRU9C+kSajsEqIEjqbYiS
	FWaVykESQpA1T1KiZzcqQZUrE2srWbfB2Zk/AAlx+/SJEgvNTgE41iz5CVEArhNquTYx
	M3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=zfWQMNZ5YCT16AkAu3PBuzaPzfy40ruD+eyaf24O6mE=;
	b=k5BmutfzYtdBvsbmlljOuwJSt1+lontdOyNc8k/TfW6ScNWM9Ak+l/d1D9MSBNJORi
	/bqapxcJ1+zmnyx9iiTzB/rDm0q5mUrxmBffm8Mryyb/PG2PV9sV/pIOwBhGqJl78u5M
	lY2jWZo7s06SZ03KmMd1IhVg7CxkDw3/2y6T7kAx3DdA3/4JPLlHK7x0p5DLOQPmeT4O
	s3yHhscY3bsOaODGNjPaEQUbpVkezECrX8zHHBzcuXjUUNr2e2MNRsWkiiLN0h60qj78
	FN8K+MyoQQcoTGTMBl161HOVg3fpQIBlNqDCLvh5cPzQk1xnGujffyqRzW+6dJhVsjLG
	YmWg==
X-Gm-Message-State: AD7BkJKGln/OqGh7E7ZPL4NH/GhzYDxEjapnNZksES3HHAEUu5+yTuR/RSfQkvn2DHYwoi+Z3X+S5+/E4aPkGQ==
MIME-Version: 1.0
X-Received: by 10.159.39.97 with SMTP id a88mr1839088uaa.133.1460044518567;
	Thu, 07 Apr 2016 08:55:18 -0700 (PDT)
Received: by 10.103.94.2 with HTTP; Thu, 7 Apr 2016 08:55:18 -0700 (PDT)
In-Reply-To: <570664CD.4090501@windriver.com>
References: <cover.1460015043.git.liezhi.yang@windriver.com>
	<0186a488dc4ff5d3daf5ef0d1fd54bb0e79763a7.1460015043.git.liezhi.yang@windriver.com>
	<CACS+7ZQ55g1EQkWD5OQOH0zU=S1p9BRx_Nn8u5FKQmL3_-QEcw@mail.gmail.com>
	<570664CD.4090501@windriver.com>
Date: Thu, 7 Apr 2016 09:55:18 -0600
Message-ID: <CACS+7ZSOJg9gpWGKAKM2dA6Y6Se4wcj+DWFpjOdKS014fqZWYQ@mail.gmail.com>
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
X-List-Received-Date: Thu, 07 Apr 2016 15:55:19 -0000
Content-Type: text/plain; charset=UTF-8

On 7 April 2016 at 07:46, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 04/07/2016 09:30 PM, Dan McGregor wrote:
>>
>> On 7 April 2016 at 01:50, Robert Yang <liezhi.yang@windriver.com> wrote:
>>>
>>> It should be 0700 rather than 0755.
>>>
>>> Reported-by: Charles Chan <charles.wh.chan@gmail.com>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   meta/files/fs-perms.txt | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/meta/files/fs-perms.txt b/meta/files/fs-perms.txt
>>> index 109cbe5..1d74da7 100644
>>> --- a/meta/files/fs-perms.txt
>>> +++ b/meta/files/fs-perms.txt
>>> @@ -51,6 +51,7 @@ ${localstatedir}/lock link    /run/lock
>>>   ${localstatedir}/tmp   link    volatile/tmp
>>>
>>>   /home                          0755    root    root    false - - -
>>> +${ROOT_HOME}                   0700    root    root    false - - -
>>
>>
>> I'd like to see this in the section labelled "Special permissions from
>> base-files" around line 58. I think that makes it more clear that this
>> is a special permission setting.
>
>
> Thanks, updated in the repo:
>
>   git://git.openembedded.org/openembedded-core-contrib rbt/home
>
> http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/home
>
>
> commit ccc59f44f5fc6c6ccef6b0fed58b0d582c9ee32b
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
> index 109cbe5..6c1083c 100644
> --- a/meta/files/fs-perms.txt
> +++ b/meta/files/fs-perms.txt
> @@ -59,6 +59,7 @@ ${localstatedir}/local                0755    root    root
> false - - -
>  # Set 1777
>  /tmp                           01777   root    root    false - - -
>  ${localstatedir}/volatile/tmp  01777   root    root    false - - -
> +${ROOT_HOME}                   0700    root    root    false - - -
>

Thanks, this is the right track, but this implies that ${ROOT_HOME}
should be mode 1777, how about:

+
+# Set 700
+${ROOT_HOME}                   0700    root    root    false - - -

>  # Set 755-lsb
>  /srv                           0755    root    root    false - - -
>
>
> // Robert
>
>
>>
>>
>>>   /srv                           0755    root    root    false - - -
>>>   ${prefix}/src                  0755    root    root    false - - -
>>>   ${localstatedir}/local         0755    root    root    false - - -
>>> --
>>> 2.8.0
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>>
>

