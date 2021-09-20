Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.71.1632155563239200042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Sep 2021 09:32:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JMK0FyRB;
 spf=pass (domain: gmail.com, ip: 209.85.215.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f180.google.com with SMTP id u18so17985917pgf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Sep 2021 09:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=6rEkgXe14FgIh5lp4YjAF6gTcqV8vYOpqkqd3FNRQVk=;
        b=JMK0FyRBfr5KrAMZjfPkQIIo//CVuu61aYvS3lZun/D4Cx2HYiQOc46vnATIo5NVBQ
         UWUstOFj7hOV4MurX023UZvlDKv30afQ6BUXkImyxhzzxFY+tujpEkdQoTxMsWrsBS6O
         V4C9VxARf3GBxUwAThzl3mPa8HlMeuxdYbW4vEh6q5H1e8DV3y4eLaYbxZvdiNEzl8ZV
         q3Z1WLsFRqWeWo8Q5f9qs/vRq1FIq4rzPzzrCh1VSkCHma8/7eCH/+Amn7P45vLv+Tyw
         I3VYx7kd1OwT2WIhUKq7k1tVXoV+S26W+MH/7BZ3gJImaoV45hO+DfTiX5GXjD0VKUIU
         OZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=6rEkgXe14FgIh5lp4YjAF6gTcqV8vYOpqkqd3FNRQVk=;
        b=wOsohwputt7fINnINK13pTXFzhcdrUBJi9W0UA6rW6zmjaYEGb9qb4YARwIZBdf9CI
         RIUF3mE5LuBEMHfbhORSyxwqYf9SolIC/Q9gM/HlntZUrXX5UuWqoxceTJTC03sbJDXG
         osLwwzfy1nDN9X0QiJemPIf/X3g+1YcMC+FV5idncjcYeTuxwaUP5SYkR1BoxbJGHn1K
         XTpkckeW/i8Gzix/4BytnxxTAKJRXE7Jwa1DMgGXr6kXyFT7mRuzNpq+vu4wvh4BZsIL
         NAuYg3qYzRROxizImtOHOp5xjBbiHv74H95J5k3aG4u6peR3BucUCuMDPNspTMKB8J1D
         EhlA==
X-Gm-Message-State: AOAM533bxZOUw2GfU0xYNL8jBOvGzpmhI+VbY9p9Alxc/X56amHQXxHd
	t6LGnVkIeaQls+YogyEXO0k=
X-Google-Smtp-Source: ABdhPJwsngKNqIkkH8Ubb+2x7Pqh9HcxnUGYhVg1hn5CAPNEc90dkKY7cPHnaXoDMvZibCV/UxmV7w==
X-Received: by 2002:a63:6d89:: with SMTP id i131mr24120760pgc.235.1632155562282;
        Mon, 20 Sep 2021 09:32:42 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:5c66:1dc6:5acd:f9a2? ([2601:646:9200:a0f0:5c66:1dc6:5acd:f9a2])
        by smtp.gmail.com with ESMTPSA id h18sm6349423pfr.89.2021.09.20.09.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Sep 2021 09:32:41 -0700 (PDT)
Message-ID: <01765ca0-de7c-2e32-7e46-455d18737705@gmail.com>
Date: Mon, 20 Sep 2021 09:32:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.1
Subject: Re: [OE-core] [RFC PATCH 11/14] populate_sdk_base/images: Drop use of 'meta' class and hence do_build dependencies
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210920124621.1576702-1-richard.purdie@linuxfoundation.org>
 <16A6887F33E2E04C.31899@lists.openembedded.org>
 <3efdb496fefa59a9a7edec21f2ca751de5439bd5.camel@linuxfoundation.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <3efdb496fefa59a9a7edec21f2ca751de5439bd5.camel@linuxfoundation.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/20/21 5:51 AM, Richard Purdie wrote:
> On Mon, 2021-09-20 at 13:46 +0100, Richard Purdie via lists.openembedded.org
> wrote:
>> The 'meta' is old and not very useful. It empties PACKAGES and creates
>> recursive do_build dependencies.
>>
>> We shouldn't need such recursive build dependencies any more so simplify the code.
>>
>> This does cause behaviour changes as some dependencies are no longer built.
>> It did show up issues with qemu-helper-native handling for example but those
>> issues look like real races and the underlying dependency chains were not correct.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>   meta/classes/populate_sdk_base.bbclass | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
>> index ccfe2232895..49e166e697d 100644
>> --- a/meta/classes/populate_sdk_base.bbclass
>> +++ b/meta/classes/populate_sdk_base.bbclass
>> @@ -1,4 +1,6 @@
>> -inherit meta image-postinst-intercepts image-artifact-names
>> +PACKAGES = ""
>> +
>> +inherit image-postinst-intercepts image-artifact-names
>>   
>>   # Wildcards specifying complementary packages to install for every package that has been explicitly
>>   # installed into the rootfs
> 
> This change is probably high impact in that it changes behaviour the most of any
> of the changes. It does make image builds use a lot less sstate and in theory,
> if there are issues with failures from this, there are probably existing races.
> 
> It does also have CI impact as it changes the things which are built as not all
> build tasks now run. Open to opinions on whether we should do this now or not.
> 


I definitely like this change and want it in upcoming LTS in 2022, not 
comfortable with rushing it into this release. It will cause fair bit of 
work for rest of layers in ecosystem.


> The meta class is pretty useless and should be removed regardless.
> 

yes

> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
