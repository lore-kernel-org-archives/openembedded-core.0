Return-Path: <raj.khem@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0C0B66023E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:30:01 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id l4so2953505ilj.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=9A3T7zYrR0uFw6Glhbd7PoP3OI3wYYyndP7IIGii9W0=;
	b=NQpyt3xHsT5hVGkDIy8SguTNH4B5Odh9LEwh/agi6etTeJD2So7y8XDn4FwYhj7iY5
	66nJyHhQige3MdNnVhVizNoA8qFzFGYTNfAxQ79KaRMSNOOQWlEqKtFynAb8xmvQlBTj
	WeM+DSTCDiVhEG3TTbB+cnEcKcNtRIr0rRzISlRwccSSpxqXmRRmpchhQzWxktDHG0vP
	bKeqIXW7vDCzL1nsNwoOTHNGbVxlfDATMoX6l8PW6QjvvdNRKwQHABSsTpivchYpAM4X
	GzF1HfwCiabKlXNY0fhr9leXeKpl/eWcuvov6kL8eyYPqHC/AubgjhXwdStRUy7PUgNO
	uTaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=9A3T7zYrR0uFw6Glhbd7PoP3OI3wYYyndP7IIGii9W0=;
	b=N7dUQpNDS5CxlfNgc0w+dsSkKlv+gH0Y0OAZFaU9TCUEnN6FE8zBlhziyRPoyA/zlO
	yXijDs2jlS1trcPu1o1hUwfw4RtHqX4969mQGt6ompqvCDZXOHcHbz3+Qi78f6zBs6UT
	C/jFEavY3nG8uCc7urDd9Yij398B4xzXnmQOMUZdOvr+uLJCB1osI/x646U/ADANs8is
	whU1HJO6VjpIGJKm5JQ63jE0p48mR0qdZSkdUbjEywUSjfFJAHXP7LkIHY0jynoUwR61
	0CVo66iu/JAjBXE7x4bqv95Z2yimy0cqcAOoix2lAxVt8yuzrRcVm2fyV8m/r+73grH9
	Hr5w==
X-Gm-Message-State: APjAAAXUSboa+aYflA1TVILNm6T06mja/hkQcqQhDMYPLqkpphHa1b5K
	n0yUuoMPsrXfBeAcNENwD4jHLjKjdo0=
X-Google-Smtp-Source: APXvYqxeUwQrawsXB6skBIBKQSjdXVA0FaTdtDMzw+pSq+Ex8bhzazieptoDdnG8gqOrFVhCczOvDg==
X-Received: by 2002:a92:8dda:: with SMTP id w87mr39451769ill.55.1582324202183; 
	Fri, 21 Feb 2020 14:30:02 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:949d:f94a:fa18:f7b4?
	([2601:646:9200:4e0:949d:f94a:fa18:f7b4])
	by smtp.gmail.com with ESMTPSA id w5sm1334405ila.41.2020.02.21.14.30.01
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 21 Feb 2020 14:30:01 -0800 (PST)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20200214035737.9975-1-zhe.he@windriver.com>
	<CAJdd5GZPffGwjXH+RWxBtLwDcgR2p+4KbsNLqc7WUBWKo1fGQQ@mail.gmail.com>
	<74a29374-e918-807e-c01d-ff29132f0c82@gmail.com>
	<CADkTA4PRZsy2yvQ8rG8V=vXYhwFrBPTi63XsN+t=HPesAv9Wzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <9c19e3eb-d6de-a3eb-05ae-9c33f2a51000@gmail.com>
Date: Fri, 21 Feb 2020 14:30:00 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PRZsy2yvQ8rG8V=vXYhwFrBPTi63XsN+t=HPesAv9Wzg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] perf: Correct the substitution of python shebangs
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
X-List-Received-Date: Fri, 21 Feb 2020 22:30:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/21/20 2:23 PM, Bruce Ashfield wrote:
> On Fri, Feb 21, 2020 at 5:16 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 2/21/20 1:43 PM, Joshua Watt wrote:
>>> On Thu, Feb 13, 2020 at 9:58 PM <zhe.he@windriver.com> wrote:
>>>>
>>>> From: He Zhe <zhe.he@windriver.com>
>>>>
>>>> To make the native python3 is always used,
>>>>
>>>> - Use sed one-liner instead
>>>> - Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
>>>>     following warning.
>>>>
>>>> File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
>>>> _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
>>>> ModuleNotFoundError: No module named '_sysconfigdata'
>>>>
>>>> This issue is first reported by Joel Stanley <joel@jms.id.au>
>>>> The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>
>>>>
>>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>> ---
>>>>    meta/recipes-kernel/perf/perf.bb | 7 ++-----
>>>>    1 file changed, 2 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>>>> index 6d1b06693d..a6fb51d3db 100644
>>>> --- a/meta/recipes-kernel/perf/perf.bb
>>>> +++ b/meta/recipes-kernel/perf/perf.bb
>>>> @@ -239,11 +239,8 @@ do_configure_prepend () {
>>>>        fi
>>>>
>>>>        # use /usr/bin/env instead of version specific python
>>>> -    for s in `find ${S}/tools/perf/ -name '*.py'`; do
>>>> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>>>> -        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>>>> -        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>>>> -        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
>>>> +    for s in `find ${S}/tools/perf/ -name '*.py'` ${S}/scripts/bpf_helpers_doc.py; do
>>>
>>> Do we have to hard code bpf_helpers_doc.py? It doesn't exist in older
>>> versions (e.g. 4.14) and causes do_configure to fail.
>>
>> Probably not, I also stumbled into this problem.
> 
> Yah,
> 
> We can either just do the entire directory (but during the review, we
> were talking about the fact that since we aren't using them, we don't
> actually know if they are py3 safe, so blindly converting the shebang
> isnt' a great idea either).
> 
> But the solution we use in the devsrc recipe would work easily enough
> here, just do $(find . -name ${S}/scripts/bpf_helpers_doc.py) and let
> it return nothing for those older kernels.

then perhaps its better to callout each script by name and check if that 
file exists, so older kernels can ignore that

> 
> Bruce
> 
>>
>>>
>>>> +        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
>>>>        done
>>>>
>>>>        # unistd.h can be out of sync between libc-headers and the captured version in the perf source
>>>> --
>>>> 2.24.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> Openembedded-core mailing list
>>>> Openembedded-core@lists.openembedded.org
>>>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
> 
> 

