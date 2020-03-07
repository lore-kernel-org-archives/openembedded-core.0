Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
	[209.85.210.67])
	by mail.openembedded.org (Postfix) with ESMTP id DF1F9619CF
	for <openembedded-core@lists.openembedded.org>;
	Sat,  7 Mar 2020 16:01:06 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id x19so5487881otp.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 07 Mar 2020 08:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=RYkYyJHF16ywWcaOjraJukM2nPkWOs/euGPpG8CdCkI=;
	b=XKgsRW+v9/40hEtgqPonZDBW35GwgSisnw7s1h76Ewgq6sf6QIr2PHnEFffMnfxZwA
	N4B/jh5sVY0kMN0PM26o++IkyfD8FjJBI100WcGQ5PpejPgboytLilfqI2oyRLa6Jq+m
	HlPjGPuPcrglXDOUSPw164CFJhgfdTmaU+vlNizoMqNPvUP14yKaruxW/WbFEXgV78Nb
	o37rr5gHN1ewYnNBtFKnrKvIN7LzOPTMNt+hDlI+Kc+pABnc/UZwTFHBzM4BxAZVrphk
	Pa2LkCKH+nFFbyQ4PYIvkWBh9MquMuOpmxfKQW0+cZ/u8NZcmxHulLFdtZpOVohkiUAp
	ssig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=RYkYyJHF16ywWcaOjraJukM2nPkWOs/euGPpG8CdCkI=;
	b=JcwgNwpZTAyXEXXxOTeqfBROFSSO49Gale5EPOIj0mi8caJJYMgWbf25pJtEtWdf/q
	e+dhpv70iNBuu0bsGoyeuOuXWWJdZDHqKE+0ymi2o+oqekWcEqipDdukwF1zRLXMKAjy
	hMqLSTL/OWhUkjTGpXGUIrGz22xpTYvKQqiOEquRtvqotPJtFU0p3B4+PsTnP9HqaIOs
	yEyhHOapA/SRSozSojFxBkwf/ndOs5QaKe5rRVMa7f+wyWxkkZnnwnFL/7DDFM+ktmb4
	tXMrEtcoA18v04k8WOXxJ7/hFAJACimnagznG+xjzo8x2C97uwEgI5mb8rg5kgXclhKz
	RROw==
X-Gm-Message-State: ANhLgQ2jkr3CzuI5X/UCMdV2FlJN8GdMJccbYkDO2so9m5e9qj4Hracn
	01cYCRRcFSZXL8DCG1YtrNj30tDoZ1I=
X-Google-Smtp-Source: ADFU+vt5QsqFq+520CH435NNFiJGSGDZJIiOHOCOnmcbC9p6sBB8hYSZWoJ+WJ1bcXJygHrevlpDYQ==
X-Received: by 2002:a9d:3d23:: with SMTP id a32mr6560994otc.13.1583596867595; 
	Sat, 07 Mar 2020 08:01:07 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:9cc1:d49d:3a28:1e7f?
	([2600:1700:4c90:60a0:9cc1:d49d:3a28:1e7f])
	by smtp.gmail.com with ESMTPSA id w5sm3431151otj.39.2020.03.07.08.01.06
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Sat, 07 Mar 2020 08:01:06 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <20200307140548.13517-1-jpuhlman@mvista.com>
	<20200307143223.2277.46482@do>
	<3d264f5439b9216788b9bdd50996c88dd3cc0b38.camel@linuxfoundation.org>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <c9b03578-45a8-a626-45b3-faa16e50917f@mvista.com>
Date: Sat, 7 Mar 2020 08:01:04 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3d264f5439b9216788b9bdd50996c88dd3cc0b38.camel@linuxfoundation.org>
Subject: =?UTF-8?B?UmU6IOKclyBwYXRjaHRlc3Q6IGZhaWx1cmUgZm9yIGdyb2ZmOiBNYWtlIG1hbnBhZ2VzIGJpbmFyeSBpZGVudGljYWw=?=
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
X-List-Received-Date: Sat, 07 Mar 2020 16:01:07 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 3/7/2020 7:59 AM, Richard Purdie wrote:
> On Sat, 2020-03-07 at 14:32 +0000, Patchwork wrote:
>> == Series Details ==
>>
>> Series: groff: Make manpages binary identical
>> Revision: 1
>> URL   : https://patchwork.openembedded.org/series/23145/
>> State : failure
>>
>> == Summary ==
>>
>>
>> Thank you for submitting this patch series to OpenEmbedded Core. This
>> is
>> an automated response. Several tests have been executed on the
>> proposed
>> series by patchtest resulting in the following failures:
>>
>>
>>
>> * Issue             Upstream-Status is in incorrect format
>> [test_upstream_status_presence_format]
>>    Suggested fix    Fix Upstream-Status format in 0001-Make-manpages-
>> mulitlib-identical.patch
>>    Current          Upstream-status: Pending
>>    Standard format  Upstream-Status: <Valid status>
>>    Valid status     Pending, Accepted, Backport, Denied, Inappropriate
>> [reason], Submitted [where]
>>
> I fixed status -> Status and queued in -next.
Ah sorry about that. I was blind to the case difference. Thank you.
>
> Cheers,
>
> Richard
>
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


