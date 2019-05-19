Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id AAFD87D712
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 May 2019 04:46:13 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id 145so5164786pgg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2019 21:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=PCPuvzkk0zB57Pze5x3VjqtS/zHWd+BL0ZS/cRI4604=;
	b=AEfeY/+/di7ZGZyDoxe7RURik8dwxG9L+niK9DeuwqiKQN07/AU4tfOthCWrOfookb
	iY839xrsq0rSUC1FEw/HSxDjVxgwWh+pRL+Z7FFBeDZgMxoNy7QftONQFMwHLO2vxN+0
	HIJ36C8nl1csY3Um5EAGheS7PhANgi5Kwcxr+Ez9hmwswMqTtEW7bVq5S2uGysAd1JdE
	KSzgI7QMewjpR4ofglSRAbsET4CUUWfOI56WI2rkDpYTo0xMCyMA/eM/GMlHVJqoLQXA
	UkwrtKWOhuKcTyOU6UWpeKPbJVtfzb5+CPfafw2Ke6oItvb3MEeCHmMFyxrOIiaCLXq6
	mFWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PCPuvzkk0zB57Pze5x3VjqtS/zHWd+BL0ZS/cRI4604=;
	b=etna5aXfHn9fWWWym/p4IPrloypj33GaeY4D9/23lzdfQHUH6zNNoRZPWX+dI41/Mm
	9MskPoBSpmxu4y9Y1VsK3bnpCUJ9TqFWDk5DimULtoDl67MYf7PYk5kjoS/++vpE/WGL
	i2tCLi8JPyNzXAeOuuKWr602RtKpCYAvF3D5lamtWH+v9HbsGoUxmY9uP/Q5ptfBB26g
	B7380o2PUkEATLdcMkcVIeDH7ofGw1shjjEfncwbxQTQa4ul298LgTawQXJgDBjxfpT4
	QIhPrC3Kw/MUnprMfRqc8U9z/Tlbu3SNJmxxOI8uuan7b37ZOLxBAwMSohmuoBzroxMy
	/Bpw==
X-Gm-Message-State: APjAAAUbcrahdWaFmdfdhD+qNwSWf3zcAWrchTBmraqvPr2A/h3RyLAZ
	SNQleVjhjO29nVJrF+1+x0x/i4dgDm4=
X-Google-Smtp-Source: APXvYqy/ur507T2YO8BzKNx8EWhTALh+9AIxpwMVtV48RwrEYKeglBN4/rE5fa8SC5JxfbzE0Q9ERg==
X-Received: by 2002:a62:640e:: with SMTP id y14mr52828404pfb.109.1558241174117;
	Sat, 18 May 2019 21:46:14 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:2991:b26a:5bdc:753c])
	by smtp.gmail.com with ESMTPSA id
	q27sm20725890pfg.49.2019.05.18.21.46.10
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 May 2019 21:46:12 -0700 (PDT)
To: akuster808 <akuster808@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190517181151.44001-1-alex.kanavin@gmail.com>
	<20190517181151.44001-11-alex.kanavin@gmail.com>
	<4723f59c-19d4-fafe-fa56-ee0e564d220b@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <aae4c321-973e-7a4e-9333-a2a64fc803a5@gmail.com>
Date: Sat, 18 May 2019 21:46:10 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <4723f59c-19d4-fafe-fa56-ee0e564d220b@gmail.com>
Subject: Re: [PATCH 11/37] go: update 1.12.1->1.12.5
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
X-List-Received-Date: Sun, 19 May 2019 04:46:13 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/17/19 11:25 AM, akuster808 wrote:
> 
> 
> On 5/17/19 11:11 AM, Alexander Kanavin wrote:
>> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
>> ---
>>   meta/recipes-devtools/go/go-1.12.inc | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/go/go-1.12.inc b/meta/recipes-devtools/go/go-1.12.inc
>> index 0cf0a63ff65..7c4cac1fc25 100644
>> --- a/meta/recipes-devtools/go/go-1.12.inc
>> +++ b/meta/recipes-devtools/go/go-1.12.inc
> any indication on testing?

I think we dont have extensive unit testing or ptest except go 
helloworld, maybe we should have a ptest to run it on emulator

1.11 ia kept for users to migrate to 1.12, maybe we can remove it now.

> 
> any reason why 1.11 can't be dropped?
> 
> - armin
>> @@ -1,7 +1,7 @@
>>   require go-common.inc
>>   
>>   GO_BASEVERSION = "1.12"
>> -GO_MINOR = ".1"
>> +GO_MINOR = ".5"
>>   PV .= "${GO_MINOR}"
>>   FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
>>   
>> @@ -19,5 +19,5 @@ SRC_URI += "\
>>   "
>>   SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
>>   
>> -SRC_URI[main.md5sum] = "09fe592343465560b4b8431d870b3df3"
>> -SRC_URI[main.sha256sum] = "0be127684df4b842a64e58093154f9d15422f1405f1fcff4b2c36ffc6a15818a"
>> +SRC_URI[main.md5sum] = "cb6f594d22dd79af4fff9779607b1b47"
>> +SRC_URI[main.sha256sum] = "2aa5f088cbb332e73fc3def546800616b38d3bfe6b8713b8a6404060f22503e8"
> 

