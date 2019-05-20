Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 949257E097
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 20:50:19 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id 13so7801098pfw.9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 13:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=4NoSOtoEbx2LlZJ5uekyPaAeZ19UTZ+UTBg9cfS2o/g=;
	b=o2sIGT6IKhlC0fzoWksfddZFNahGkLBSYs0uONgaEUqaZlIDbU7zCohCHp4rNMyrmZ
	r+miuSVng8A+H90xPjrNUaKjS/Fur3BwkeQdePpoGpqr5tAVx0CQU5VIw/E0uYgk/wQ+
	r17Pzr0PiI9H6aG/4xXKCBoxZ9cM8htAY60KHStXtK2SLi2zmi8v2N5YoAm6DOfNAFjs
	MTrrjFLuevHOoMGorUx024m6vemaaLUVEjzLICqW3WojFgkFMuf6XCVPAoP0AmOhOIEn
	7HNh96cJSZb8geGSqDd/iev1YUMsLuPL4hgPr0zMcTZ3osrlYyMBlzRc5YBicPgj3o77
	7IpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=4NoSOtoEbx2LlZJ5uekyPaAeZ19UTZ+UTBg9cfS2o/g=;
	b=rZCGfNCin+YzvqaiHVjfP7Xxu5MdMwfLADLBrPETUxujowXAnWZcScNoRo/wGz0lSK
	PF64XbrABMHL+rQi/DZayckoJwKfkJqWeuiCnKn6UDENShdLLSnVnL1Q97cwGPBOOnQ5
	+w2C3UhORDpMBq4+JRnPo9k8w7HMw5k82HSbuxVZE0wZ+jW5c3/rK+Lal9nOnWdtdu0s
	a6CqnyvbZ1AmifmGXJkdOWIdRiaKN+dHUUPuuOAWPTrF5b/jm56yIQxTw5aslul92NSt
	aAf/gV6vKiCAwQ0ikr+MUCXnRjDd/DEyFWUtB9p060M78wt9l9A7gYspFA1A1kKcEoyM
	30EQ==
X-Gm-Message-State: APjAAAW8xGGoO73bH1cYyb/kaHiOxWPyrLjRqyvfw+70ah/aaBpHsT0B
	KVpFNG93iJaGoHYVnprVR3N53kGgfH0=
X-Google-Smtp-Source: APXvYqyjQEGOorxlMpR53WUZJJxHh65lWjp9XoBajYVA4fBBXok733+fLM82dYN5YxuUxLnVdzhuDg==
X-Received: by 2002:a63:e408:: with SMTP id a8mr77839835pgi.146.1558385419971; 
	Mon, 20 May 2019 13:50:19 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	c15sm21981698pfi.172.2019.05.20.13.50.18
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 13:50:19 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, Hongxu Jia <hongxu.jia@windriver.com>
References: <1557912193-40178-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRT7NFoRN8EXYDiQ64+0g-bB=jvd7HcfUCRn+_26iRQX4Q@mail.gmail.com>
	<0ffc3e2e-2321-0edb-c90a-76225017472d@windriver.com>
	<20190515110813.GA13420@localhost>
	<6e3c7d20-a86b-9487-5640-0de47f716d95@windriver.com>
	<20190515134218.GA20396@localhost>
	<da1db475-e2ea-d474-e335-1c56285b9361@windriver.com>
	<20190515140253.GA23229@localhost>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <6bbf07c4-f276-0aa8-b6c7-19dcdf2b660e@gmail.com>
Date: Mon, 20 May 2019 13:50:18 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190515140253.GA23229@localhost>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] autotools.bbclass: output failed config.log
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
X-List-Received-Date: Mon, 20 May 2019 20:50:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 5/15/19 7:02 AM, Adrian Bunk wrote:
> On Wed, May 15, 2019 at 09:50:35PM +0800, Hongxu Jia wrote:
>>
>> After applying my fix, here is the sample
>>
>> ...
>>
>> checking for i586-wrs-linux-gcc... i586-wrs-linux-gcc  -m32 -march=i586 --sysroot=/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/recipe-sysroot
>> checking whether the C compiler works... no
>> configure: error: in `/buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build':
>> configure: error: C compiler cannot create executables
>> See `config.log' for more details
>> NOTE: The following config.log files may provide further information.
>> NOTE: /buildarea1/hjia/wrlinux-1019/build_master-wr_qemux86_2019051509/build/tmp-glibc/work/i586-wrs-linux/grub/2.02-r0/build/config.log
>> NOTE: This file contains any messages produced by compilers while
>> NOTE: running configure, to aid debugging if configure makes a mistake.
>>
>> ...
>>
>> The content of config.log has prefix `NOTE:' and also tells user
>> ...
> 
> The problem is that the last > 1000 lines are NOTE: - and they all get
> dumped to the terminal.
> 
> It is a problem when you have to scroll up through more than a thousand
> lines of mostly irrelvant information before you are seeing the most
> relevant information.
> 


It would be good to extract relevant information from config.log and 
dump that instead of verbose concatenation of the whole file.

Are there any markers we can use  ?

>> //Hongxu
> 
> cu
> Adrian
> 

