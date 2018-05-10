Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9BEF06FFA1;
	Thu, 10 May 2018 18:53:58 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id j20-v6so1495937pff.10;
	Thu, 10 May 2018 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:organization:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WGT7C7mYl8t90b1Xx7BZ8c9pKuRdqCN/tzIE9yyQP2E=;
	b=Ei5QR7Tb1yKQp0Wa+FRSapRowOHTxht5ucnrg0YsVvJhGRBjwR+5fL3/JGi4ifhPU7
	Nk8s9dBMOSNpbTmFFsSAF0CRvVoANKRV13xoH5jBo+7EZeyvDywpSdHaD4pIpBL3FHoC
	2onSxaiaUMlg4T7daMg8gDsCjWH7HkNuaMXnavWcVyY+42S59GizWKYKkEp/Bc8cYT+y
	ZrCCvYLhJ5UP4cEDy9E+rWvKxy5WZvFtYz0QMGRBgqA55inQ87C+5wE8Wd0K04mbcy7a
	DLDz14ShSPc/c5//nxpBs8MUoa+AdyaFDDT5hpaRTrQIjkAA9uY5AH1ifpxErqpOgjAf
	MnXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WGT7C7mYl8t90b1Xx7BZ8c9pKuRdqCN/tzIE9yyQP2E=;
	b=HGbp2zfNVoQQC1jPad9PFDEVqegTPgAiXDBckjF2gITIEl0I8ND2wgYTtta/vLRaNt
	CoCbDhHgEAKIoPmB+i5KSO7fG0BMZe5teORN1BcGzPnieUspZM9rz81fKXLLMhH76Pe1
	f86+og8uoIrdZXPd82QmwHkSIUZBrXvrDssxWvopudaubm6UOwq0yoVnC8HcnY/7R8/C
	d1zbg1HcJM1LO5CTFQ8+5nNndoLoIQ+f69r0uHHZs2y/5ZqGCxn54x82Xdtywz525SnG
	oUcoipsQlFVtnKwORq60XM7segAnEfAloUjEBBk98gU7JM92y8Dkdmc+h+aVN5Yvbm0u
	u/3A==
X-Gm-Message-State: ALKqPwfYnsQfd8Iad/XQrnS5dkvhWlct6YW6+jbe01uqEGlG4TU9HK6W
	qH9OFEsGBT6anHA9UspeRpg=
X-Google-Smtp-Source: AB8JxZqswIDYDxq8hfFwQzkiPrfeN95kIKhA/vT6rRAU+GTG41suSg7HQ8ZlPIFmS2e+55LnrzovHg==
X-Received: by 2002:a65:6349:: with SMTP id
	p9-v6mr1977192pgv.111.1525978439610; 
	Thu, 10 May 2018 11:53:59 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:49fa:9382:bcbc:28ae])
	by smtp.gmail.com with ESMTPSA id
	h191-v6sm2854665pgc.11.2018.05.10.11.53.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 10 May 2018 11:53:58 -0700 (PDT)
To: Dan McGregor <danismostlikely@gmail.com>
References: <CAMKF1spa1bbrUjQWbhdUw3C4Cxu99fU=Be3sEm+SYFNq_oxEKw@mail.gmail.com>
	<CACS+7ZR6F1PgKxQxxh=iJzTQNmrrMVOQ01EuhcnotSAhB=AiEA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <1ceb098b-1836-4693-d03f-8801ac354c25@gmail.com>
Date: Thu, 10 May 2018 11:53:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <CACS+7ZR6F1PgKxQxxh=iJzTQNmrrMVOQ01EuhcnotSAhB=AiEA@mail.gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFT] GCC 8.1
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
X-List-Received-Date: Thu, 10 May 2018 18:54:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Dan,

Thanks for testing

On 5/10/18 7:34 AM, Dan McGregor wrote:
> On 4 May 2018 at 18:26, Khem Raj <raj.khem@gmail.com> wrote:
>> Hi All
>>
>> As you might have noticed that gcc 8.1 was released this week, I am
>> calling out for some testing help on testing branch so we can weed out
>> issues you might see in your setups. so if you have your
>> builders idling over weekend, then you know what they can do this weekend :)
>>
> 
> Thanks for this. The only two issues I noticed are that the
> Wandboard's kernel doesn't compile with gcc 8.1,


what errors do you see ?

  and gcc-sanitizers
> now throws a packaging error on (at least) x86_64.
> ${libdir}/liblsan_preinit.o is a new file that should go into
> liblsan-dev.

That seems to be the case, I wonder why my world build for qemux86_64 
did not find this error. I would like to reproduce this and the fix is 
then simple.

> 
>> Highlighted changes are
>>
>> https://gcc.gnu.org/gcc-8/changes.html
>>
>> and porting doc is
>>
>> https://gcc.gnu.org/gcc-8/porting_to.html
>>
>> The branch is here
>>
>> http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc-8
>>
>> Its uptodate on top of current master oe-core
>>
>> May fourth be with you !!
>>
>> Cheers!
>>
>> -Khem
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

