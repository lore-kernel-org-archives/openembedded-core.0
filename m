Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9037CDF0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Mar 2019 04:31:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id i19so13180137pfd.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 20:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=09XM1tii1d0z6G/jNIaVQAzWniigwlmfgnEo2WY3+Fo=;
	b=cIVImZz356/qc7BOKX/Z3or3OfMio0FkzFJNBsjplVJCDT2COO1+2LXh4zGczO2+VX
	kXo0qC3x6p3R4wnM6XsuipwiUzKVx5+Hbd5GS8lYMPQb0OicgT65s6F0uGl9mvBkBZWO
	7XHjW04MM7ZgzKFfIKA7BBS7Wc4lXGvBW+Y1J19/+yVW5xXEcggTkYpLcxI3K8GmxTrk
	gXFuRgHO++KNcfIL1fyxCTNnwWJX0to3orhjy1/3o/VcS1T4QAchVVMWnFMoQI5hJQUc
	7w0JhWOMaIcS4t9HJqpO7tilQTfb0phqzqEJu8UwrHhCRdwhlhVf4L0HiXs4oYDJkjc/
	cLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=09XM1tii1d0z6G/jNIaVQAzWniigwlmfgnEo2WY3+Fo=;
	b=pwZ6/62aR6nlpwefVjBQq2cDgIT8N2SyPE8mApn1MYfb7wGyg8ndtc6zkOhfe+cCB/
	xR3QSugwFWLIvxarGlXbWvmG9jNOuLMOFl3194R65hoN6IyySGHg28T0Ot33hl5AVtSh
	f694xLixJtYSYS/rz8OlGMVzYmVX5VAYe7RgD53/OOOtWYjIo0Es8TqC0sucPdK+5HTJ
	A278DQXtSnPYQWL30r15LRnMbxRhK1sdAd3SVG5852C9wGW61SAtV/ciUWsHD7QCyPYz
	4s48PVzUG31diJH8rMROBz2Fs2JAQNcfK0Nzt7FYjDE4uptnliGjCj+/+6XznAWEpGg9
	1l3A==
X-Gm-Message-State: APjAAAW1H4SvzMfXcbIRnyQDIUSNnKaZJPmxdWlCfLr3u85N57Qtzlgy
	7f8rhRIJpwp0ZywJo7JhYcmuWCFG
X-Google-Smtp-Source: APXvYqxIBfXaF5UmI4RTph2ARCMjr59RsPxLKbleLImJGYjuxbl0tfKDp108UBP92FcGTpeTZoM0DQ==
X-Received: by 2002:a62:46cc:: with SMTP id o73mr16872486pfi.182.1552019463309;
	Thu, 07 Mar 2019 20:31:03 -0800 (PST)
Received: from hermes.local ([2601:646:8500:6bc6:b833:ede1:aa51:1d40])
	by smtp.gmail.com with ESMTPSA id
	k3sm15657836pfc.59.2019.03.07.20.31.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 20:31:02 -0800 (PST)
To: Tom Rini <trini@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1551882973-8710-1-git-send-email-trini@konsulko.com>
	<1551882973-8710-3-git-send-email-trini@konsulko.com>
	<c7b91b44ea5055df61ce39287342dbf7926d970d.camel@linuxfoundation.org>
	<20190308042042.GA5026@bill-the-cat>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <eba93c1f-c398-8759-9660-8fecefcb8238@gmail.com>
Date: Thu, 7 Mar 2019 20:31:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:66.0)
	Gecko/20100101 Thunderbird/66.0
MIME-Version: 1.0
In-Reply-To: <20190308042042.GA5026@bill-the-cat>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 2/4] inetutils: Import version 1.9.4
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
X-List-Received-Date: Fri, 08 Mar 2019 04:31:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/7/19 8:20 PM, Tom Rini wrote:
> On Thu, Mar 07, 2019 at 09:50:51PM +0000, Richard Purdie wrote:
>> On Wed, 2019-03-06 at 09:36 -0500, Tom Rini wrote:
>>> In order to have more robust stand-alone network tools in oe-core,
>>> bring
>>> in inetutils from meta-openembedded/meta-networking.  This imports
>>> the
>>> recipes as of git commit:
>>> commit 408204073e6bdcd8ac586e05d5b75213417673f2
>>> Author: Martin Jansa <martin.jansa@gmail.com>
>>> Date:   Thu Aug 16 20:39:15 2018 +0000
>>>
>>>      inetutils: fix build with glibc-2.28
>>>
>>> Signed-off-by: Tom Rini <trini@konsulko.com>
>>
>> Somehow in all the noise from other failures we missed:
>>
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rcp or /usr/bin/rcp.inetutils) does not exist, skipping...
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rlogin or /usr/bin/rlogin.inetutils) does not exist, skipping...
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/rsh or /usr/bin/rsh.inetutils) does not exist, skipping...
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alternative target (/usr/bin/talk or /usr/bin/talk.inetutils) does not exist, skipping...
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rcp: /usr/bin/rcp.inetutils does not exist
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rlogin: /usr/bin/rlogin.inetutils does not exist
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/rsh: /usr/bin/rsh.inetutils does not exist
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/sbin/rshd: /usr/sbin/in.rshd does not exist
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/sbin/rlogind: /usr/sbin/in.rlogind does not exist
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: NOT adding alternative provide /usr/bin/talk: /usr/bin/talk.inetutils does not exist
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rcp == /usr/bin/rcp
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rlogin == /usr/bin/rlogin
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/rsh == /usr/bin/rsh
>> WARNING: inetutils-1.9.4-r0 do_package: inetutils: alt_link == alt_target: /usr/bin/talk == /usr/bin/talk
>>
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/374
>> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/375
>>
> 
> Hurk.   Which self-test do I need to run to see that?
> 

I see these errors in build logs when I use poky distro or yoe distro, I 
guess you need to enable additional QA errors +  warnings e.g. see

https://github.com/YoeDistro/meta-yoe/blob/master/conf/distro/yoe.inc#L53-L58

