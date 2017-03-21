Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f50.google.com (mail-lf0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id 47A3271B50
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 21 Mar 2017 06:13:19 +0000 (UTC)
Received: by mail-lf0-f50.google.com with SMTP id z15so63343460lfd.1
	for <Openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 23:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=XkmxMiQgKtbAvWAqvxksr5n/2wVWOYvvgYKlTG7mZWg=;
	b=IoVcJSR/OhtCgLIETml67BYBKYqfWj+tNDmaMfxaVsWFxXSjyvodhVct/VJr7/ZR4i
	dB44fKSTI3y3H5I9VNdiQg1keuSnS2u+VDm0x7uJpMQ04lM0c6YkDqm/T2YOHXVXsZoJ
	2fJqb9XiqOCND3WdfcseFPPjUrRuqDK7erdHq4GpV4K+8QizMp8QJwBWq1NkDUnWX7F+
	BIPOTx1H45dD8LdWkip7OIjphuOoJzh7rCWu5r/ynlPUsZxQYnEAOGvdtm56QN7CLRpb
	SzwNmoFIwXJwGoy2f05618Ny27i+Es9O3JTNfVyYKBCZrv41R7ylYIzugtuXuPrFF7AQ
	Wf7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=XkmxMiQgKtbAvWAqvxksr5n/2wVWOYvvgYKlTG7mZWg=;
	b=iAI6Qe0DDPrM+9ox1Fpg4XQyyJPhiMhVbh862QxTQBC/uGVU1J7JE1FmQB1MQoZtZZ
	2b437a4s2VZf/GseOP7O7sZ934va+YFT2P+gnKfh+z0zmMnGf5LbMX72dN//knNriAuN
	6CQ/QQxJ98HbQFWAHZpXKx1Xeb2yHtYSWD3u1tCjjsOSOAzahQHRpHFAf9TBMF+xde/i
	w6GUED3+lZI21eeaPYeK5hRqz5glKjIPOnOEa/+1N435PohB5K9pYVKFdUzptRGZdQJz
	Zsgui/q432v5Tn4WZvh039ia+pOKT7NACqWbRcvLT26ElSjdvY84Bbv57uXKZO5DLaGw
	Gxew==
X-Gm-Message-State: AFeK/H2yYX0ykoEkM8v3dLufBfLPY/kJJKFrTkgw9QAaeksoq99UYgY92ehlBUzcTJTruQ==
X-Received: by 10.25.17.153 with SMTP id 25mr8958608lfr.39.1490076800108;
	Mon, 20 Mar 2017 23:13:20 -0700 (PDT)
Received: from [10.20.33.128] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	w68sm1568896lff.15.2017.03.20.23.13.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Mar 2017 23:13:19 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <7780ce1c-7e26-0cac-9813-ec713251c7b9@mender.io>
	<CAMKF1sp6C9qqzt1azPQwOpxySj34_KifVosn5aSp2bzDjfoS6w@mail.gmail.com>
	<1490023039.13980.142.camel@linuxfoundation.org>
	<CAMKF1sqgsN6Q+JrpOC83hxP3Vm8G0Wm_fjsN3yW=nZMOX88Oiw@mail.gmail.com>
	<CAMKF1srC3vQpSOb7N9YwVkwjA4Y5Q8N4sCfKXfjpMysyBEEKAw@mail.gmail.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <8d64350c-3ea3-beba-30d3-80b330eb9499@mender.io>
Date: Tue, 21 Mar 2017 07:13:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srC3vQpSOb7N9YwVkwjA4Y5Q8N4sCfKXfjpMysyBEEKAw@mail.gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Subject: Re: go-bootstrap / go-native conflict during do_rootfs
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
X-List-Received-Date: Tue, 21 Mar 2017 06:13:21 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 20/03/17 17:50, Khem Raj wrote:
> On Mon, Mar 20, 2017 at 8:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Mon, Mar 20, 2017 at 8:17 AM, Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> On Mon, 2017-03-20 at 07:49 -0700, Khem Raj wrote:
>>>> On Mon, Mar 20, 2017 at 6:47 AM, Kristian Amlie
>>>> <kristian.amlie@mender.io> wrote:
>>>>>
>>>>> --------------------------------------------------
>>>>>
>>>>> Additionally, in the logs I found these two snippets:
>>>>>
>>>>> --------------------------------------------------
>>>>> Considering setscene task: ['go-native', 'do_populate_sysroot']
>>>>>   considering dependency: ['go-native', 'do_populate_sysroot']
>>>>>   considering dependency: ['mender-artifact-native',
>>>>> 'do_populate_sysroot']
>>>>> Adding dependency on go-native
>>>>> ...
>>>>> Considering setscene task: ['go-bootstrap-native',
>>>>> 'do_populate_sysroot']
>>>>>   considering dependency: ['go-native', 'do_populate_sysroot']
>>>>> Adding dependency on go-bootstrap-native
>>>>> --------------------------------------------------
>>>>>
>>>>> which lead me to believe that all dependencies are being pulled in
>>>>> simultaneously by do_rootfs, but go-native and go-bootstrap-native
>>>>> are
>>>>> in fact mutually exclusive, since they install to the sysroot in
>>>>> the
>>>>> same location. Note that both compilers build just fine, it's only
>>>>> at
>>>>> the do_rootfs stage that this shows up.
>>>>>
>>>>> I think the oe-meta-go layer solved this by having go-bootstrap-
>>>>> native
>>>>> install in a different location, but I'm unsure what is the best
>>>>> approach for OE.
>>>> go-bootstrap is only needed for few recipes. I think we should find
>>>> out
>>>> a way to keep this dep limited to those recipes and not reflect in
>>>> final
>>>> image rootfs creation. That seems to be not useful.
>>>
>>> There is code in sstate.bbclass in setscene_depvalid:
>>>
>>>         # Consider sysroot depending on sysroot tasks
>>>         if taskdependees[task][1] == 'do_populate_sysroot' and taskdependees[dep][1] == 'do_populate_sysroot':
>>>             [...]
>>>             # Nothing need depend on libc-initial/gcc-cross-initial
>>>             if "-initial" in taskdependees[task][0]:
>>>                 continue
>>>
>>> so if go-bootstrap-native were renamed go-native-initial, things might
>>> happen to work better...
>>
>> ah thats right, forgot about that, I think we should rename the recipe
>> to go-native-initial
>>
>>>
> 
> Can you try
> 
> http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134372.html
> 
> and see if this works out for you ?

That worked, thanks!

-- 
Kristian

