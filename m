Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0F6DE6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 15:20:52 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id i88so127858135pfk.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 07:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=5MiSbCvq1qngKAA97u2jbr9xUOfgvWKdKackAKpZ5i8=;
	b=NO573QwdY0kYFKRuAiP6mHp0L2itf71H01aVutkx5K4e8lfPhQx5ckb+LrBv9Mnar/
	mthcNPMqxPu1gt4OcUfTN2O06H78c/OE8zsTsViHsha/kS4lqORBlh1UW6RO8hUDPye5
	AJHZjG3R6W1822Fxgx3Kurg9At9rMlzhWnMd+siXUjcXkxC0ZN8gCr1KEP36/9bROHiX
	dt+tQA/dzj2NK2JRNuyCwt9o8iDotXAqywJl7ESK//MLY2t3aMf9tGPjGiq1JBOfwozU
	95dGP9J+VNSCgJPvlHOTUJp0cI275I8GewS+hSphkt9D+WIHxg4RdQv38Z82luxuEv64
	5krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:cc:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=5MiSbCvq1qngKAA97u2jbr9xUOfgvWKdKackAKpZ5i8=;
	b=D3ZYrSuMKwtC7msSP69vcPotLG0JVf9v+OvzqMG8tZyg3DsLSoNioKUY5MqjZJI7LU
	tZSBgaYk0zS9gX7ZRw12Cz5UqSHx4ACmWIut5jMx+cFiIfwqFlq6k0maBYP7zdVL8qAV
	FItPmDgwarsdOe0kpbogPvgpVopzBMl4TE9jbW3tl9sSNVm1kvEA7tsAPydVIcEp2Ih6
	8oTJFlpbrThL7fankhqrXCIuJ9h+wUDQLtBUZYcteCRwaLDmQ9gTG9OpQmiOGJ1TwJXK
	zy6D/sAyWHleERcT8Xv3x5FSta9ZGBA8xX29g9GTFvR+K8kALaV8HRNEhpO2/KTAYYer
	WeLQ==
X-Gm-Message-State: ABUngvc1fBJRZ4PJ3qTC89NL3ZQJQFk1rKUkbNbWxPVMr6VdK+SwzfjoFLZ4d6Ch/PeHDQ==
X-Received: by 10.99.150.10 with SMTP id c10mr15857864pge.46.1478704854112;
	Wed, 09 Nov 2016 07:20:54 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:b5e1:5184:77d2:e8cb?
	([2601:202:4001:9ea0:b5e1:5184:77d2:e8cb])
	by smtp.gmail.com with ESMTPSA id r1sm81989pfg.56.2016.11.09.07.20.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 09 Nov 2016 07:20:53 -0800 (PST)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <1478694607.23123.176.camel@linuxfoundation.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <20b7d7ec-377d-0efe-b09b-fd733214093e@gmail.com>
Date: Wed, 9 Nov 2016 07:20:52 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1478694607.23123.176.camel@linuxfoundation.org>
Subject: Re: krogoth 2.1.2 status
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
X-List-Received-Date: Wed, 09 Nov 2016 15:20:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/09/2016 04:30 AM, Richard Purdie wrote:
> I ran a krogoth 2.1.2 build. It did have some issues:
>
> * one runtime sanity test had a timeout issue
> * some urls are stale (perpetual problem)
> * musl runtime testing fails (never tested on krogoth previously)
> * no-x11 runtime testing had a failure (never tested on krogoth
> previously)
Can we get those issues bugged ( if not done so already) so we can make 
decisions on what to do with each.
>
> I suspect we can call this good enough to put into QA but there were
> enough 'failures' I wanted to send this out in case someone objects.
>
> Part of the problem here is we apply our current autobuilder test setup
> to the older releases as well. I'm aware there may be better ways to do
> this but I don't know anyone with time to work on that, we have other
> more pressing problems.
I suspect Jethro will have similar or worse issues.

- Armin
>
> Cheers,
>
> Richard
>


