Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id EDBF17CF19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 15:01:11 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id 9so7615250pfj.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2019 08:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=OvWUWYeJ7pZ67LOjaCiR4tYm/b4AesrKcJ4WKmhlKbM=;
	b=GL6C/q17c6OSL2yiQpNS1HmHwQceZpS4FFvy1cCJZTXJrJ2toqsOlPsQEogrzfKBV6
	tpOwArhw5HiDdZnSj+WcOTnSeOPY0zQTEphK9gyRgboS6wkm1itIItDWsEaQK+NwZBKg
	DYE9Qh2FjgRiRXxQlbv+Gx8BwCC4K7XetCSMbC1vmpzefvg+b7m1DkNUQaGgqfjrD7vv
	leW4+sanP4Nt5xl0zyjC2Weh/L6hGRFMMEt6L93cXuNPbC4EvQhoGYSMGHIr6Fs87Xhb
	znqKfw5FUHHMGM+L+ef+oJ6J9ikG1zgQ+M9bu2ktfizDgGOuw5QozgkOzO6MWqIzPHWe
	MY6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=OvWUWYeJ7pZ67LOjaCiR4tYm/b4AesrKcJ4WKmhlKbM=;
	b=t/RYp40REkpsddSR3MyPpWGphAUpD8OnO4GgDHV2lgMgEhcUho3JPcAIgEpjMC/7IE
	hCJZqR80hWoWDHcc9ymnmS1JG+AsOC5lQuO5y8cfSFIeJFeGh+VYIuP+z5Skl9VrD54m
	hKUcYKgipCWp/8W7Oa+a9yWkU95AyeGGQpeVmWbX3e4skzHVoqqy/ItQ/RYWODSPtkm+
	ayWgGAGlp7gfVNFfpKY+VOlnk1eCcbjDmW0PN6S0PBXHJ8ulekpvfLMhSAId7z7lPdmD
	JC2d2kdZsM4QjvvShtjfQNdkr7fjDobVLQKomqONNmwCBwZswns6tV6G6bB5eNHlfb63
	4O9Q==
X-Gm-Message-State: APjAAAVpSGAbHasJOKwvXNnJy8RdvCfl5hfxCSEVpA6ZkhUWLl9cHBnV
	Qf98WI/LVTpXqHRB+QZRWD0+TFuv
X-Google-Smtp-Source: APXvYqxcktJsb94W4l6nEr4/PBy6QQK2+TKBJVYrQk45ewR/CBxWMyh18jSSE3Vgksx/W4fdaFAq7A==
X-Received: by 2002:a63:c605:: with SMTP id w5mr24515126pgg.355.1556031671589; 
	Tue, 23 Apr 2019 08:01:11 -0700 (PDT)
Received: from [192.168.0.33] (75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id
	e23sm21689879pfd.11.2019.04.23.08.01.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 23 Apr 2019 08:01:10 -0700 (PDT)
To: richard.purdie@linuxfoundation.org,
	"Jain, Sangeeta" <sangeeta.jain@intel.com>,
	"'yocto@yoctoproject.org'" <yocto@yoctoproject.org>,
	"Eggleton, Paul" <paul.eggleton@intel.com>,
	'Michael Halstead' <mhalstead@linuxfoundation.org>,
	"Erway, Tracey M" <tracey.m.erway@intel.com>,
	"'sjolley.yp.pm@gmail.com'" <sjolley.yp.pm@gmail.com>,
	"'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
References: <015AB11D45F2C442929CB2765DAE738634DD6D05@PGSMSX110.gar.corp.intel.com>
	<24835a616c9ec53fba5e4424f12b72f9e0f8d94d.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <7e8c39cc-6794-638a-bfae-07cc5b254821@gmail.com>
Date: Tue, 23 Apr 2019 09:01:08 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <24835a616c9ec53fba5e4424f12b72f9e0f8d94d.camel@linuxfoundation.org>
Subject: Re: QA cycle report for 2.5.3 RC3
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
X-List-Received-Date: Tue, 23 Apr 2019 15:01:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 4/23/19 7:35 AM, richard.purdie@linuxfoundation.org wrote:
> On Thu, 2019-04-18 at 04:58 +0000, Jain, Sangeeta wrote:
>>  
>> QA cycle report for 2.5.3 RC3:
>>  
>> No high milestone defects. 
>> Test results are available at following location:
>> ·        For results of all automated tests, refer to results at
>> public AB [1].
>> ·        For other test results, refer to attachment [2].
>> ·        For test report for test cases run by Intel and WR team,
>> refer attachment [3]
>> ·        For full test report, refer attachment [4]
>> ·        For ptest results, please refer to results at public AB [5]
>> ·        For ptest report, refer to attachment [6]
>> No new defects are found in this cycle.
>> Number of existing issues observed in this release is 2- toaster [7]
>> and Build-appliance [8]
>> For ptest, regression data is not available for this release. No
>> timeout issues.
>> Test result report on Public AB shows no failures.
> I've been discussing with Tracy and Vineela how to best handle the test
> results for the release for 2.5.3. In the end I:
>
> a) Copied in the ptest results to the right place. This will happen
> automagically in all future builds:
>
> https://autobuilder.yocto.io/pub/releases/yocto-2.5.3/testresults/qemux86-64-ptest/
>
> b) Copied in the intel test results to their own directory:
>
> https://autobuilder.yocto.io/pub/releases/yocto-2.5.3/testresults-intel/
>
> c) Manually generated an updated test report for the combined results
> with the commands:
>
> $ cd /srv/autobuilder/autobuilder.yoctoproject.org/pub/releases/yocto-
> 2.5.3
> $resulttool report . > testreport.txt
>
> d) Added a header to the report which consisted of the report from QA
> with details of the bugs etc.
>
> This means we have a top level testreport file which contains all the
> test information about the release.
>
> I'd like to make this the standard procedure for release. The release
> notes and announcement can refer to the test report included with the
> release and the test results as its there all together.
>
> Ultimately I'd like to improve the formatting of the report (separate
> out ptest regressions from the other regressions, maybe html, maybe
> graphs, better regression information) but that is something for the
> future.
>
> Does that work for everyone?
This works for me.

- armin
>
> Cheers,
>
> Richard
>
>


