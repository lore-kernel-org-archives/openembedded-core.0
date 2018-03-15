Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id D53FC788E6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 18:09:35 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id e5-v6so7542678lfb.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 11:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6cgpZpyczokorRnZaw2DZeackaEaEyS5Qdbyn4vGwu8=;
	b=msEEbXZqveA8avmJULMK5geg2UmBgjlNWEAEvAN28zxAARrxbVeIRQ3DjA4qhROkGf
	aUNKBwqGUb4MRk8r54b8ofpmd2bSHzvYCT5ebRXYICJMZJ5G2aUKF4FSO/JxDJ0pEt02
	giR+oaKWMe4fzafFxFHTTZCQIZx3E1MczEVhwwAZnDZKcgItuskU82OOdrm4oNJs3J1A
	Ne4rOH41hlehJ3GFeAdGgm7XePS3hrZNuG8ebdhcXKMUxvquYcgPyID6tX7J2WnXMjSw
	aAxChpUW9IWbYO0OKNp0IegjbOczS+ceUoaZl/PCU4QMxkFL/ohtGeSBAwEHOj11JM/n
	+QIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6cgpZpyczokorRnZaw2DZeackaEaEyS5Qdbyn4vGwu8=;
	b=iLfchtRW7RkxhuHrfQ9Orv4jBAlAVpAohqlN8hBHCA+rQsWmwYql/K2p7tw63cT46M
	EkgGY/ylfqDWuC+zTHaIqRMtkmr8CDtGO6l3LD78H4nqa7Lsv9dOVNKwWLFldPZnYgTn
	k8h7OXpocK5hX63RQwYb9kdqY+J+IyBESDACjoFmq0JU92eEgmJxoLVbi5Thd7NjjcGy
	pXNG+2dBwfLkN+Dh84BzZhofFTwirmRVIqd5ARKOGiwiIyzQZwxVFFYtKc0+YkGneBsm
	6wJDbsKEIsaaPBn3+57OjCMHwYhXWqMRBMvy7GOPpNjaHffKw4lD8kxZaNwe7tkLaxZW
	9ysQ==
X-Gm-Message-State: AElRT7E1T2CjtE99TpdIKQJCmhfP027hAV33BLVKDsArZw4wl1K5EnBX
	h4KnSOceNhKd4xGZR2nqbVgg8U7cAIUERfBhtIo=
X-Google-Smtp-Source: AG47ELv3gzAdAxCnR3MKNTIEQUbiBvmlDu9EC6iwzfVYZ0aGl9k4ugklakB9hIj4GyFbxeFSiMFmjzO53YPI4V4Ozl4=
X-Received: by 2002:a19:97d0:: with SMTP id
	z199-v6mr6714790lfd.94.1521137376208; 
	Thu, 15 Mar 2018 11:09:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Thu, 15 Mar 2018 11:09:35 -0700 (PDT)
In-Reply-To: <5c0c563b-bbe2-e1b9-2da0-bb260a946042@yahoo.com>
References: <c1fcdce0-7ad4-d7ce-287b-3783579fc631@yahoo.com>
	<8ef4b697-ea48-80eb-9068-7b15fd7cc944@yahoo.com>
	<ff44760a-886b-b868-c309-3cf52dc142f5@linux.intel.com>
	<5c0c563b-bbe2-e1b9-2da0-bb260a946042@yahoo.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 15 Mar 2018 14:09:35 -0400
Message-ID: <CADkTA4Os5uhyWpWZsVJQx2m4LPnQoeNF8osdhK3JcPpO3svUhQ@mail.gmail.com>
To: Martin Vuille <jpmv27@yahoo.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Recipe for Linux page-types tool
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
X-List-Received-Date: Thu, 15 Mar 2018 18:09:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 15, 2018 at 12:43 PM, Martin Vuille <jpmv27@yahoo.com> wrote:
> On 03/15/18 06:49, Alexander Kanavin wrote:
>>
>> On 03/15/2018 12:20 AM, Martin Vuille wrote:
>>>
>>> page-types is a simple Linux kernel debugging tool to list information
>>> about
>>> the state of virtual memory (VM) pages.
>>>
>>> The source is distributed as part of the kernel tree:
>>> tools/vm/page-types.c
>>>
>>> MV
>>>
>>> On 03/14/18 11:22, Martin Vuille wrote:
>>>>
>>>> I have a recipe for building the page-types Linux kernel VM tool.
>>>> Is there any interest in this?
>>>> If so, to what project/layer should I send it?
>>
>>
>>
>> This questions is probably better asked on the linux-yocto mailing list
>> then?
>>
>> Alex
>
>
> Perhaps I'm missing something. I'm offering a bitbake recipe. linux-yocto
> doesn't seem to contain any layers or recipes.

But it is where we tend to discuss a lot of kernel things, i.e. perf,
kernel builds, etc.

In this case, if the tool comes from the kernel source tree, it would
be build not unlike
perf or the other userspace utilities that are part of the kernel
tree. Which means that
the patching of it is different than other userspace applications
(since you can't
dictate the version, etc). If the tool isn't build directly from the
kernel source, then we
have to deal with something that needs to be manually sync'd to the
kernel tree to
be kept up to date.

Cheers,

Bruce



>
> MV
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

