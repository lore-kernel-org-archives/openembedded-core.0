Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 411687CFE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 14:15:50 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id w34so2092748pga.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 07:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=fgOAJLuRgC2c7/yp4HUQ+q0n25hR7bgjKBT62Ve8vAw=;
	b=EILTlbLYrbn9QGY/LI+TWo+mZQ1Ghlgadpw826KF0U53FZ2lET3fQc5W8L8q2ndqhV
	jxxzQu8IZD7cNOvZ1JT6p7JB+ts936e86tyLWKCAiz1oYHiUJqYH2ljGcDF6KL91PI5n
	f+qdEu+2e3pRfkMpW9TLWnDTa+OKXH29HK/TV7Zw4s+yYgWT9il9KUkD+jrAoqSxxmLe
	BBGr7/BOE34MjVV2yOEngr8m/uQPD+ThvaH02OaM1QBoaSTow2ubJVoJgYxgq9g57CpC
	xvtEK8S022k9HKPycJ+IaxCKzfpUEjsNzkIuqdd0TGuQBStnJ5tww82MmvrvzVxuniKM
	kUgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=fgOAJLuRgC2c7/yp4HUQ+q0n25hR7bgjKBT62Ve8vAw=;
	b=IIKmd+8NvjTPdCaLQ5LFFjXgTLayH14NXgS0Elq1aZjFDsO86js9x2joODIkvZLG3i
	0hPPjOIZWlrWTO9prB88Zk5Bnf9qGlitFRATxR8cQ8LITHIZkU7U7zSVbra/RSx0ath/
	3K0tcJe6OXmboiLlNL2ptASGRnGbdn83k8ie7A9KdmrZK9mvpGWFIjasgSsw+sXu681b
	PnA4eqfl/aTP7OZTResJCmxtqBsBMbolGb+7YFWRifqMFZIDkqq2gHsrdjyclJYA3xAv
	f/Muph29Xi0JFTWEkuAQOo+w/zfs9DAcO49oihem2Ic5QjZaLsEOQJLXkNUqd1t4njNb
	WVMQ==
X-Gm-Message-State: APjAAAV672tlhscByiCTef3RWOQAz27IZGUlSFsYBvXtYTVm1HOnbNUh
	HxqYa4AvUZ6dy4+q+a211vZSCmQP
X-Google-Smtp-Source: APXvYqzTA4nBF+gibOJfn/VT2NBsSGD7oRkQkjxnjeueSHk1WYUCf5pYuOoU+NLE/3mnf6nBqn/wUg==
X-Received: by 2002:a63:c750:: with SMTP id v16mr3883352pgg.409.1559225751301; 
	Thu, 30 May 2019 07:15:51 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:c33:4865:9151:ec2:e220?
	([2601:202:4180:c33:4865:9151:ec2:e220])
	by smtp.gmail.com with ESMTPSA id
	y12sm2865192pgp.63.2019.05.30.07.15.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 07:15:50 -0700 (PDT)
To: Adrian Bunk <bunk@stusta.de>, richard.purdie@linuxfoundation.org
References: <4c62af9f-8bff-726e-db35-6f6ed7ebafc2@gmail.com>
	<8798dc0e5d91991953720388b601c9c5b3174c42.camel@linuxfoundation.org>
	<321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
	<20190530135949.GA318@localhost>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <9639c0df-d57b-39bc-69ce-6f68d5a9a915@gmail.com>
Date: Thu, 30 May 2019 07:15:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190530135949.GA318@localhost>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Thu, 30 May 2019 14:15:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 5/30/19 6:59 AM, Adrian Bunk wrote:
> On Thu, May 30, 2019 at 09:13:02AM +0100, richard.purdie@linuxfoundation.org wrote:
>> ...
>> I'm torn, partly as if we stick with bz2, we effectively do that
>> perpetually and given the size difference, we should switch.
>>
>> Tim mentions we could fix the crops container and I'm tempted to switch
>> given we're so close with the current patchset...
>>
>> We can add xz to HOSTTOOLS in master and that makes sense for a number
>> of other reasons but gets tricky as we can't add it to ASSUME_PROVIDED
>> as easily due to the libs it provides. I think we only need to worry
>> about this on master though.
> There are also some other related topics that might be considered
> on how this should develop long-term:
>
> 1. How important is it to support host distributions that are not 
> listed as supported? Not limited to uninative it can be painful
> adding support for new distributions to stable branches.

When new hosts are added to the AB and a stable branch builds and all
tests pass on that host, we have updated the docs to reflect such an
addition.
its not a fun exercise and gets harder the older the stable branch is.

It is also noted in the Stable branch maintenance story on wiki and has
been SOP for years.

- armin
>
> 2. Does using uninative by default bring enough benefits to outweight 
> the problems with new host distributions, or should it become 
> non-default in master?
>
> The sum of the two points above is especially problematic:
> "re-use of native shared state artifacts across different host 
> distributions" is a more exotic feature, and effectively supporting
> this for unsupported host distributions is the problem here.
>
> 3. uninative is so fragile because it tries to fix the C library
> only. A lot of problems with host distributions (not limited to
> uninative) would go away if one host distribution would be picked
> and provided as container for people who are using other distributions.
>
>> Cheers,
>>
>> Richard
> cu
> Adrian
>


