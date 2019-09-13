Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id ECA0E7ED56
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 22:42:37 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i1so10122578pfa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2019 15:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=5CjUM2n+1Uy3CuGSNraX6S1MVrrTrQgNJcvHsDljBjY=;
	b=SCX2gt8hR0psovawV+Y+dv3UeaNGspvwUrOa49XVbK5w+a4GylCdAALYZAkTmE/tXC
	2Dv5bYsUYGzctk95hZemafV16kh03C8whmm/V4VkOwezLH8rC3JPZYIxt9AsCiyj+paZ
	Svu0CUC2UAtGx/IMGjpHOpTTK0LMjF3M/pXRvXoc2eWww6kAyvv0Bi41BQCz8ARe9Pd6
	yZwvoVfm61pdHDlMVei8ENh7E+ZlpbiJfOCpFtqUXo2HZu40oXMOOVIe7dJvxZFWBiyf
	rJLeD2WyIFxHMk0aRmB500ujUUr4so4UwiuIW4S8JYQBI1tIRZg94OB7B9lWOfmiXzot
	l4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=5CjUM2n+1Uy3CuGSNraX6S1MVrrTrQgNJcvHsDljBjY=;
	b=CSZM7M/FMZFECcu4S5aGiYt8pu+CGuMqn98kxvcLEXNZ9wsNKPxYUx3E7JeUUZ1Cjf
	IlCFsoSUYwNJor2WsMSCW5pHrxXj4lZpCKV/u9rPKv0a4N+OAF+ZKkxWOZ4453pcDAa0
	NLxFV4he5SFvvivj4IU+jAV4KB26eU0s+D6G0guLhjc8o7FT61xEzN4rV5Pzaywr9t3L
	MgQmEgR9hkYiSe0V5SMLGSfDqXG5HfKUuIczhyyhDK6FcvM+HHxt+47lrk8c63XXJbiT
	bW2wS6saV6nmT/PFZLkGbQ156QhZFLu22nPAJvqLs9wXhwq5uThSqASQxTkfaDMn+Yg7
	c+QQ==
X-Gm-Message-State: APjAAAUloaQpDrFeo9YA3l3gAH14yOa4VGO2vFkzFajZCkws6Npk/jwo
	+4ygXysYqAdG6ROGhGkgp64u1H3QQAY=
X-Google-Smtp-Source: APXvYqzs4ljWm8mo1VKQq/TlRy+xLZW9SPJ9cCp4n4g5ry9OkrcIozVshU7yqhdFUukRUGhyfSTe+A==
X-Received: by 2002:a17:90a:6586:: with SMTP id
	k6mr7921731pjj.20.1568414558753; 
	Fri, 13 Sep 2019 15:42:38 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:b812:1f2e:5b35:90e5?
	([2601:202:4180:c33:b812:1f2e:5b35:90e5])
	by smtp.gmail.com with ESMTPSA id g8sm23450327pgk.1.2019.09.13.15.42.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 13 Sep 2019 15:42:38 -0700 (PDT)
To: Scott Murray <scott.murray@konsulko.com>, Adrian Bunk <bunk@stusta.de>
References: <20190913215809.34402-1-scott.murray@konsulko.com>
	<20190913221123.GA31095@localhost>
	<alpine.LFD.2.21.1909131822190.5588@godzilla.spiteful.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <01f9c9d2-619e-b365-8b52-7e844d424d50@gmail.com>
Date: Fri, 13 Sep 2019 15:42:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.1909131822190.5588@godzilla.spiteful.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] systemd: upgrade to 243
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
X-List-Received-Date: Fri, 13 Sep 2019 22:42:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/13/19 3:28 PM, Scott Murray wrote:
> On Sat, 14 Sep 2019, Adrian Bunk wrote:
>
>> On Fri, Sep 13, 2019 at 05:58:09PM -0400, Scott Murray wrote:
>>> ...
>>> --- /dev/null
>>> +++ b/meta/recipes-core/systemd/systemd/0002-src-login-brightness.c-include-wait.h.patch
>>> @@ -0,0 +1,25 @@
>>> +Include wait.h
>>> +
>>> +Fixes:
>>> +src/login/logind-brightness.c:158:85: error: 'WEXITED' undeclared (first use in this function); did you mean 'WIFEXITED'?
>>> +  158 |         r = sd_event_add_child(w->manager->event, &w->child_event_source, w->child, WEXITED, on_brightness_writer_exit, w);
>>> +      |                                                                                     ^~~~~~~
>>> ...
>>> +--- a/src/login/logind-brightness.c
>>> ++++ b/src/login/logind-brightness.c
>>> +@@ -1,5 +1,6 @@
>>> + /* SPDX-License-Identifier: LGPL-2.1+ */
>>> +
>>> ++#include <wait.h>
>>> ...
>> This should be
>>   #include <sys/wait.h>
> Okay.
>
>>> --- /dev/null
>>> +++ b/meta/recipes-core/systemd/systemd/0004-src-shared-cpu-set-util.h-add-__cpu_mask-definition.patch
>>> @@ -0,0 +1,54 @@
>>> +Handle __cpu_mask usage
>>> +
>>> +Fixes errors:
>>> +
>>> +src/test/test-cpu-set-util.c:18:54: error: '__cpu_mask' undeclared (first use in this function)
>>> +src/test/test-sizeof.c:73:14: error: '__cpu_mask' undeclared (first use in this function)
>>> +
>>> +__cpu_mask is an internal type of glibc's cpu_set implementation, not
>>> +part of the POSIX definition, which is problematic when building with
>>> +musl, which does not define a matching type.  From inspection of musl's
>>> +sched.h, however, it is clear that the corresponding type would be long,
>>> +which does match glibc's actual __CPU_MASK_TYPE.  So, add a typedef to
>>> +cpu-set-util.h defining __cpu_mask appropriately.
>>> ...
>>> +--- a/src/shared/cpu-set-util.h
>>> ++++ b/src/shared/cpu-set-util.h
>>> +@@ -6,6 +6,8 @@
>>> + #include "macro.h"
>>> + #include "missing_syscall.h"
>>> +
>>> ++typedef long __cpu_mask;
>>> ...
>> Signed looks wrong.
> I went that way since the usage is all with sizeof, and both glibc and musl
> use sizeof(long) in their internal definitions of the set array.  The array
> element type is unsigned long and my comment is actually wrong since
> glibc's __CPU_MASK_TYPE is __SYSCALL_ULONG_TYPE, so I'll fix this.  I'll
> upload a v3 shortly.

When your happy with the series, I will through it on AB this weekend
for a testrun.

let me know.

- armin
> Thanks,
>
> Scott
>
>


