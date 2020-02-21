Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id EA7DF61756
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 22:15:45 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g6so1455751plt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2020 14:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=lBJwimLUTXhuDiNagPKYIs/xp0zHFgXruA2Waabjj80=;
	b=AxnFbmc9ygvkQ4RaU/zzHaF6XNA0X6Zr3dvHflVk7CGEF+akalOmXDGPLJcuNAq1oN
	RNHQnhlsjdSvJbfL+mYV2lEqMtNuvzu/zruKKNYXHdyrlO4IZiYVN3uOqdPuaqhJjjnS
	TyQn6EBQgThrP6WGkwD5zmIZDn3QD9WBk9NfQCcSdcFZPu3r1fToJKCYuXqmOMtCCcaJ
	IpZai2zDLCDWIbF6HeKMDxt8J/ApiHXtLAibXEsYWoq07l3kje96zlFpzCyq9AvXljN8
	flvSUFw60kMQWICcxIKCRXVrvgZ1asxYBnBBAO7BBS0dnuOMJaLhnc7PdXSX/WnyKyEO
	ImuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=lBJwimLUTXhuDiNagPKYIs/xp0zHFgXruA2Waabjj80=;
	b=ABZqsnqWgVrxAcY5/WJtCmdqgWopiayQeKRe4awba/8TxCcf0gDc2FWzXkCaT/yALz
	fzM0TNikQWsmvDY3Fuk13SHxRNZTnIXan/ZUgt/eksks+Sj7L+pg2DBLfA2M2a+lX1N6
	zsK8GT/wyOM5vjM6H0aNRjgvRIkb6eJKUJlAce6WKBy4qCPMfCqVpvBGNi3OOxUdzWyu
	0IeFK0pVA4HURvF6q9FSOJHPNWZqaexm04GOZYNu5LpS/LrZ9mDXa2dzcSJFtuA3aTrn
	f8o2eZHQA4oJwgYcd5++kU+fW6oO5df91CG5cnohMNlA2AmckFkpJYUet4zSnxLD7yI8
	IJWg==
X-Gm-Message-State: APjAAAXM/mIqqfHpi1Qp5vaJ5E5M4G0H8kmToflSVaaWU5Gmh02uuidq
	H0pvHlJ+xNdrLTJEo8yxN0BTKW00RsY=
X-Google-Smtp-Source: APXvYqxVifwSuP0jeMWad0dcfhUL4MfcU14SUhvAonVLsP7tlSKBTDVeSc5oQF1Md3btuWvF8QOi6Q==
X-Received: by 2002:a17:90a:fb4f:: with SMTP id
	iq15mr5615352pjb.86.1582323346173; 
	Fri, 21 Feb 2020 14:15:46 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:949d:f94a:fa18:f7b4?
	([2601:646:9200:4e0:949d:f94a:fa18:f7b4])
	by smtp.gmail.com with ESMTPSA id x7sm3907167pfp.93.2020.02.21.14.15.45
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 21 Feb 2020 14:15:45 -0800 (PST)
To: Joshua Watt <jpewhacker@gmail.com>, zhe.he@windriver.com
References: <20200214035737.9975-1-zhe.he@windriver.com>
	<CAJdd5GZPffGwjXH+RWxBtLwDcgR2p+4KbsNLqc7WUBWKo1fGQQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <74a29374-e918-807e-c01d-ff29132f0c82@gmail.com>
Date: Fri, 21 Feb 2020 14:15:44 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAJdd5GZPffGwjXH+RWxBtLwDcgR2p+4KbsNLqc7WUBWKo1fGQQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 21 Feb 2020 22:15:46 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 2/21/20 1:43 PM, Joshua Watt wrote:
> On Thu, Feb 13, 2020 at 9:58 PM <zhe.he@windriver.com> wrote:
>>
>> From: He Zhe <zhe.he@windriver.com>
>>
>> To make the native python3 is always used,
>>
>> - Use sed one-liner instead
>> - Add substitution for ${S}/scripts/bpf_helpers_doc.py to fix the
>>    following warning.
>>
>> File "/usr/lib/python3.6/sysconfig.py", line 421, in _init_posix
>> _temp = __import__(name, globals(), locals(), ['build_time_vars'], 0)
>> ModuleNotFoundError: No module named '_sysconfigdata'
>>
>> This issue is first reported by Joel Stanley <joel@jms.id.au>
>> The sed one-liner is credited to Anuj Mittal <anuj.mittal@intel.com>
>>
>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>> ---
>>   meta/recipes-kernel/perf/perf.bb | 7 ++-----
>>   1 file changed, 2 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
>> index 6d1b06693d..a6fb51d3db 100644
>> --- a/meta/recipes-kernel/perf/perf.bb
>> +++ b/meta/recipes-kernel/perf/perf.bb
>> @@ -239,11 +239,8 @@ do_configure_prepend () {
>>       fi
>>
>>       # use /usr/bin/env instead of version specific python
>> -    for s in `find ${S}/tools/perf/ -name '*.py'`; do
>> -        sed -i 's,/usr/bin/python,/usr/bin/env python3,' "${s}"
>> -        sed -i 's,/usr/bin/python2,/usr/bin/env python3,' "${s}"
>> -        sed -i 's,/usr/bin/env python2,/usr/bin/env python3,' "${s}"
>> -        sed -i 's,/usr/bin/python3,/usr/bin/env python3,' "${s}"
>> +    for s in `find ${S}/tools/perf/ -name '*.py'` ${S}/scripts/bpf_helpers_doc.py; do
> 
> Do we have to hard code bpf_helpers_doc.py? It doesn't exist in older
> versions (e.g. 4.14) and causes do_configure to fail.

Probably not, I also stumbled into this problem.

> 
>> +        sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${s}
>>       done
>>
>>       # unistd.h can be out of sync between libc-headers and the captured version in the perf source
>> --
>> 2.24.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

