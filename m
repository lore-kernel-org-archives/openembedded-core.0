Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8E59C61921
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2020 21:33:44 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j7so328016plt.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Mar 2020 13:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tmQ4mZRqeYSWX97CzcHvoU3RXw1sWu1UrnsggtVinf0=;
	b=YsqyiHzftcBZ4PuyDWzcfD4/b42a7ODEsBe80DC03EjdbuiGmkAtVVjJoiz/uVl9Tz
	f0zyR8A0JV14QzPhclMasWbtNVoO/o8oNlzkr6UWvFm0MALaa3zDFTF7jGFfAIxGB9C6
	5+Y+Bs2rcIL3MQHpBTaasQdCzrBAVhtG+CcAOFmedPw8xfm60wz+SBQ38m1kzpUJH9Fp
	pXbG/KWbT8W1OnI6qd7OrCCh4fHSlFKzRb5pKGVvPAhHhXqVvyJ6zY8b7vR75Xe5YF/n
	YyfYd0bhAKjpHuK2W7PnF4vvwCbJoBv478GObnK/W0jhlpmAfoRcR3cxJqA94yPb8sJt
	KKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tmQ4mZRqeYSWX97CzcHvoU3RXw1sWu1UrnsggtVinf0=;
	b=rhYTKCTxGCpfLOS1ZqkYnRAzAsdrODGF83jr94fHx937jJnH1lDbjMDG/4RloHcU6A
	EmgZb3OEBGKQAHhwmg39J8uQxV8d4vBXIn5YrXg7L7crgid1ML5iWQeWkQJFlplTf/JR
	lmv/kOAgTf/HUHvfMsYciQ3z6+T4uLnaYQ3gVq0kim+OUPSHuH8kr53BBNilpQyqRLmU
	qvFytk/qXR26c1gR3VZGeoLYW2VWvjYYY4D4nN12A8VHImVxC9m77EFFd02rfslE1/1I
	lo4ZPk10unnrmgEyC6ZDvjiGuztakSPJ9D0u6Y+ndtI0V4z+6AQT07LzYOwWRj3JCGv8
	4Ftg==
X-Gm-Message-State: ANhLgQ2G2F9gbHJWIrw3KWXkXFLNlo8DmBh6taacHqMRHK4AFyH2Rviq
	3/yUKyKdEs+p2U59hQNTHEI1qWPxxJ4=
X-Google-Smtp-Source: ADFU+vuMOsZ8vcVAqncFnIfWXcwCjJh/eNejBpl0JsOfLxjZ9pltQrQsO/LFXMQWK+MXeYAdXdbQjw==
X-Received: by 2002:a17:902:8ec9:: with SMTP id
	x9mr1062979plo.182.1583184824795; 
	Mon, 02 Mar 2020 13:33:44 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:8446:2edf:6d4c:9a00?
	([2601:646:9200:4e0:8446:2edf:6d4c:9a00])
	by smtp.gmail.com with ESMTPSA id 22sm5703746pfc.14.2020.03.02.13.33.43
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 02 Mar 2020 13:33:43 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20200301014301.805156-1-raj.khem@gmail.com>
	<20200301014301.805156-2-raj.khem@gmail.com>
	<6ebd8c098cac7dab116f9043e7b64fe9b3376601.camel@linuxfoundation.org>
	<CAMKF1spJ_aBK=JdZvr0yFLEHBgYeQcZhUFHBaHDcHt=J05O8=g@mail.gmail.com>
	<7737c4f098af15087a434de3b1a09d8d651ebaa8.camel@linuxfoundation.org>
	<CAMKF1sqVqVDgUac2+G6VX4GmvD7+ecF9HzO731s=OsrWESk+dg@mail.gmail.com>
	<6ac648b5b9d02cb857e9d784d7bf95e071567ca1.camel@linuxfoundation.org>
	<b98ca563ed2c5dd64b276ed6a283de33c8434e35.camel@linuxfoundation.org>
	<c1e072be-0b1b-a2c0-1801-0f1464f028c6@gmail.com>
	<62e5739220e0f491acd489c2abcc35213d91d138.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <7ad45b7f-cb58-a584-fdfb-aa9dca2862dd@gmail.com>
Date: Mon, 2 Mar 2020 13:33:42 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <62e5739220e0f491acd489c2abcc35213d91d138.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] dbus-test: Fix QA host-contamination errors
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
X-List-Received-Date: Mon, 02 Mar 2020 21:33:44 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 3/2/20 1:08 PM, Richard Purdie wrote:
> On Mon, 2020-03-02 at 10:49 -0800, Khem Raj wrote:
>> On 3/1/20 9:05 AM, Richard Purdie wrote:
>>> On Sun, 2020-03-01 at 08:20 +0000, Richard Purdie wrote:
>>>> On Sun, 2020-03-01 at 00:17 -0800, Khem Raj wrote:
>>>> I understand the need for the fixes, I'm just very concerned we
>>>> have
>>>> what amounts to undetected non-determinism in the build :(
>>>>
>>>> I'm more concerned about fixing that (and ensuring we can
>>>> detect/fix
>>>> all cases) than I am about the individual errors.
>>>
>>> I did a bit more thinking/checking on this.
>>>
>>> An interesting command to experiment with is:
>>>
>>> $ touch /tmp/test; ls -la /tmp/test; ./tmp/sysroots-
>>> components/x86_64/pseudo-native/usr/bin/pseudo sh -c "ls -la
>>> /tmp/test*; cp /tmp/test /tmp/test2; ls -la /tmp/test*; rm
>>> /tmp/test*"
>>>
>>> which for me shows:
>>>
>>> -rw-rw-r-- 1 richard richard 0 Mar  1 17:03 /tmp/test
>>> Warning: PSEUDO_PREFIX unset, defaulting to XXX./tmp/sysroots-
>>> components/x86_64/pseudo-native/usr.
>>> -rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
>>> -rw-rw-r-- 1 1000 1000 0 Mar  1 17:03 /tmp/test
>>> -rw-rw-r-- 1    0    0 0 Mar  1 17:03 /tmp/test2
>>>
>>> Can you see if that is different on your two machines?
>>
>> above cmd output is exactly same as yours.
>>
>> -rw-r--r-- 1 build build 0 Mar  2 18:49 /tmp/test
>> Warning: PSEUDO_PREFIX unset, defaulting to
>> /mnt/b/yoe/build/./tmp/sysroots-components/x86_64/pseudo-native/usr.
>> -rw-r--r-- 1 1000 1000 0 Mar  2 18:49 /tmp/test
>> -rw-r--r-- 1 1000 1000 0 Mar  2 18:49 /tmp/test
>> -rw-r--r-- 1    0    0 0 Mar  2 18:49 /tmp/test2
> 
> Hmm, this means the test is flawed as we need to find out how
> /tmp/test2 becomes owned by 1000.1000.
> 
> Any ideas how we can simplify this down to reproduce that?
> 


Even on baremetal ubuntu 18.04 I am seeing

dlm-4.0.9: dlm: /usr/lib/libdlmcontrol.so is owned by uid 3004, which is 
the same as the user running bitbake. This may be due to host contamination
dlm: /usr/lib/libdlm_lt.so is owned by uid 3004, which is the same as 
the user running bitbake. This may be due to host contamination
dlm: /usr/lib/libdlm.so is owned by uid 3004, which is the same as the 
user running bitbake. This may be due to host contamination 
[host-user-contaminated]
dlm-4.0.9: dlm: /usr/lib/libdlmcontrol.so.3 is owned by uid 3004, which 
is the same as the user running bitbake. This may be due to host 
contamination
dlm: /usr/lib/libdlm_lt.so.3 is owned by uid 3004, which is the same as 
the user running bitbake. This may be due to host contamination
dlm: /usr/lib/libdlm.so.3 is owned by uid 3004, which is the same as the 
user running bitbake. This may be due to host contamination 
[host-user-contaminated]


this might be again a dlm issue to fix.  but perhaps a good one to try 
if AB system can build it without these QA diagnostics.

dlm is in meta-networking.

> I did wonder if its coreutils-native was somehow creeping into DEPENDS
> and had a different config between your two hosts which was causing
> different behaviour but I'd need to check into whether that happens.
> 
> Any other ideas why the behaviour difference or how to reproduce it?
> 

can you promote host-user-contaminated form QA warning to QA error in 
poky and see if builds fail ?

> Cheers,
> 
> Richard
> 
> 
> 
> 

