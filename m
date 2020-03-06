Return-Path: <jpuhlman@mvista.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A4FC61086
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Mar 2020 22:03:50 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id b3so3997790otp.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Mar 2020 14:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=9tY26JZm2kY8xyujNJNNwHlfa3wwnXsNhix9rhWM5rY=;
	b=htR8nLN1moLJM9n3jPMRexWSRyUK1Bx+NCxRacXzR5s4uyFwcwYD1C5jodnZa/RsAw
	1Nr/hS0ik3p7Eh0BCodehb3Oo5H+UPXnruY9+Jtc3YrV2bX0clAxLfxGfBfjU9eglxWt
	lBRpXVvhKqxsGFZiQdBP9tO49gegtHOG8qxgm+w2cXYZl3oUq0n58v81b1g+DluQtnV/
	/Tb7Aby/ggXvWcutjmEAA7r/GgMBYVus7Ou70vZUY13jmAhQC+/rzV9MKZlzcTdpzm8a
	nPzc20HIpTTl7bg0wHvWtHCsa2zU6o35ETIaKUMi/Le0ou2U5C1hpZv63Ag6rGngBIn7
	j/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=9tY26JZm2kY8xyujNJNNwHlfa3wwnXsNhix9rhWM5rY=;
	b=e4hmFzqujKj8SMw13F7bUV8I9dOkceuU7L2+IriEndyk1qRk808op4ZR+Rg7ez7DL2
	oaifObeEv4Eg9DY5g8Dt/xeDFRp2W9d5lFm4F0mcvwvFws1c5ztJ09TsB10/ucvkhhQP
	JLMwJpFnT51BtZLGtplMfiE4Z2jWN8x3lJ2iZT0vUfdM63aldsm6A/M07rzRWTdtlHBx
	F2XMae45EYIan6NtOpZsIw/AonytSEQPitj4fc+cZ7xzv8+F8Os7k6U89dHdgdaqJnPI
	i8Umd/Ad6mR8TOY9hlbNDdqrCt+G1xD3vM4UsBOFC3C6I+xtUnfT2GbYUATtyF98TvQn
	mSzw==
X-Gm-Message-State: ANhLgQ0vEV97Gqz7SEOYqiqlc5t1UHvKxJdHRa5iGSyoPaxu5SQodirR
	anNZ0o7e99oi8xa+5ZgdXg9rSaVey9s=
X-Google-Smtp-Source: ADFU+vuqAcOT5Yh4MnW6zdeWPojraZadM7rmZCsjPC0oG3yDaLm+YjNOpljXLS2SN7PwUF/N0e9hrA==
X-Received: by 2002:a05:6830:1245:: with SMTP id
	s5mr4061295otp.43.1583532230761; 
	Fri, 06 Mar 2020 14:03:50 -0800 (PST)
Received: from ?IPv6:2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3?
	([2600:1700:4c90:60a0:30e1:1fb2:1aa0:5ad3])
	by smtp.gmail.com with ESMTPSA id
	y193sm275257oia.38.2020.03.06.14.03.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 06 Mar 2020 14:03:50 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
References: <62ba6d2a-098e-acbd-db0e-b2283a3b476a@mvista.com>
	<446c96a2d520e581eee85d519233fdb961c9d1c2.camel@linuxfoundation.org>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <620f2c52-9492-77dd-f629-65649ab432d7@mvista.com>
Date: Fri, 6 Mar 2020 14:03:36 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
	Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <446c96a2d520e581eee85d519233fdb961c9d1c2.camel@linuxfoundation.org>
Subject: Re: Multilib conflicts in man pages.
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
X-List-Received-Date: Fri, 06 Mar 2020 22:03:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/6/2020 2:00 PM, Richard Purdie wrote:
> On Tue, 2020-03-03 at 15:22 -0800, Jeremy Puhlman wrote:
>> Is there a preferred method in oe-core for dealing with man pages
>> that conflict due to differences in multilib pathing.
>>
>> For example an application lives in /usr/lib/foo/bar for one abi but
>> /usr/lib64/foo/bar in another, and
>> that kind of information is encoded in to the man pages.
>>
>> Some things i have seen done in the past, is move the man pages
>> under
>> /user/share/man/${PN} or
>> use something like mutlilib script to deal with it.
>>
>> I am just curious if there is a canned, preferred way the project
>> handles those or wants to handle them?
>>
>> xinit, xserver-org, and groff each exhibit  these issues.
> Could we just put a placeholder into the man page so they'd be
> identical? Multiple copies seems like overkill for something as
> trivial...

Yeah, that works as well. Just need to brush up on my man-page-fu.

>
> Cheers,
>
> Richard
>
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


