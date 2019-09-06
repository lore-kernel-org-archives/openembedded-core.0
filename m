Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id A223B7F3B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Sep 2019 13:54:38 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id u185so12814862iod.10
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Sep 2019 06:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:subject:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=Jz5ipXhwAMjiYIwf5y1fuKvjChBw7Wb9bpfLLy1Hdas=;
	b=rJSESs6IcTKJFIajNz+pKGgzF3cPswGgzqBw8pyXfKveRFeIlEhkkhYawiG8aJGJ8s
	btSrMTsfbf/91mpM6bpSe8UARpYEcu1+B8pNUgQLlrgivhCNjsk3oT6Y5caIjiAzegoB
	rHuAREf42CCVq3bEXEMi/uul8crVT8TWiATLFO3p8STfffJukmp9Pk/9I9vRANJe1Mxa
	zU+7Yjn6SxEaKJ5L+EOTbXT0dmfj5SboUo7bAS2sUvz7pjjFZ6ZpRk4/tQUdhi3TdSai
	zWQu30rIGDtqPYiHgUUizjE9yQ69z9o+0qUh0Udt3GRkv3mxLxVRny1XbXVvwkOsD682
	sb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:subject:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=Jz5ipXhwAMjiYIwf5y1fuKvjChBw7Wb9bpfLLy1Hdas=;
	b=Qn8404UgzcIuW1l29MX2VkqGR9PU7X8oY+mNcXO631elrxF1F1Be3oXeesUR0rS9Fi
	8jxnRWriS8KQMGehTwiL2n0Su8IPx6Ow18D6cRMyNaBPyx2UoKDdEiz8P4TQ2Q8Moz+W
	YWVzuDdjPawlJRTIxgxMZxlizdDGAdxEZQGITP1MD7t5h5gxLya9M1sGsTfTBKYKQ09J
	/LK8p2V5vbXzHG7U4JlFu+OyYKSL6qbEYWXh3L8OYcy33ndHxLX3yktEfQFMlL7SGiIA
	Sap3Pwycwkn2nJPWoOELqyUbyHBxy9b2hs0N4Ae2oPXac7nKwpr6bjp3lJ/mZh0P9oF7
	NVzg==
X-Gm-Message-State: APjAAAUwFm6y6LJuSomrF63yGwPpciTL9Ye3Lsx1HHEegCrTiwziXXfU
	Jb+Dn1P+ZBr7PH8xvkgmVKDbH0O3
X-Google-Smtp-Source: APXvYqxT730qSzKhZFCYV3VLby0Z1GaqgiDix7K+wpA7CXWGkG77POztf+/n+c9JEH9Fj3y+xfOd4A==
X-Received: by 2002:a02:7009:: with SMTP id f9mr10285527jac.81.1567778079362; 
	Fri, 06 Sep 2019 06:54:39 -0700 (PDT)
Received: from [10.30.197.57] ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	u124sm9456309ioe.63.2019.09.06.06.54.38
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Sep 2019 06:54:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org,
	Nathan Rossi <nathan@nathanrossi.com>
References: <20190905135444.16261-1-JPEWhacker@gmail.com>
	<e4f98f46bf6430a9ada9b2ef796e45dfc1f7cbcc.camel@linuxfoundation.org>
Message-ID: <6d557d32-b81e-2cd0-33f3-a7ceba08b8c4@gmail.com>
Date: Fri, 6 Sep 2019 08:54:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <e4f98f46bf6430a9ada9b2ef796e45dfc1f7cbcc.camel@linuxfoundation.org>
Subject: Re: [PATCH] resulttool: Add reproducible log extraction
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
X-List-Received-Date: Fri, 06 Sep 2019 13:54:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 9/6/19 4:49 AM, Richard Purdie wrote:
> On Thu, 2019-09-05 at 08:54 -0500, Joshua Watt wrote:
>> Adds an argument to the log subcommand to extract the raw logs from
>> the
>> reproducible selftest.
>>
>> To prevent ambiguity, the "--raw" argument has been renamed
>> "--raw-ptest", although the old "--raw" argument is kept around for
>> compatibility.
>>
>> [YOCTO #13324]
>>
>> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
>> ---
>>   scripts/lib/resulttool/log.py | 33 ++++++++++++++++++++++++++++++---
>>   1 file changed, 30 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/lib/resulttool/log.py
>> b/scripts/lib/resulttool/log.py
>> index 25c3396717e..2352c767d91 100644
>> --- a/scripts/lib/resulttool/log.py
>> +++ b/scripts/lib/resulttool/log.py
>> @@ -16,6 +16,16 @@ def show_ptest(result, ptest, logger):
>>       print("ptest '%s' not found" % ptest)
>>       return 1
>>   
>> +def show_reproducible(result, reproducible, logger):
>> +    try:
>> +        print(result['reproducible'][reproducible]['diffoscope.text'
>> ])
>> +        return 0
>> +
>> +    except KeyError:
>> +        print("reproducible '%s' not found" % reproducible)
>> +        return 1
>> +
>> +
>>   def log(args, logger):
>>       results = resultutils.load_resultsdata(args.source)
>>   
>> @@ -40,17 +50,28 @@ def log(args, logger):
>>                           with open(dest, 'w') as f:
>>                               f.write(ptest['log'])
>>
> You might want to consider this in autobuilder context:
>
> http://git.yoctoproject.org/cgit.cgi/yocto-autobuilder-helper/tree/scripts/generate-testresult-index.py#n121
>
> Since the indexer could extract reproducible logs as well as ptest
> ones.

Yes, I've though about that, but so far I've purposely not done anything 
because I'm not sure what to do. Originally, I tried making the QA build 
run diffoscope on the package files that failed to build reproducible, 
but this took way too long and generated way too much data for the logs. 
I think that alternative *might* be to include the binary data from the 
packages so that diffoscope can be run on them offline, but this still 
seems like too much data.

Anyway, until we decide on a reasonable thing to do, I've omitted the 
--dump-reproducible option from resulttool. This does have the 
unfortunate side effect that you can't easily debug non-reproducible 
builds when the AB finds them, short of re-running the test locally, so 
it is something we should resolve soon.

>
> Nathan: We probably need to think about the new testsuite pieces in
> this context too...
>
> Cheers,
>
> Richard
>

