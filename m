Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f52.google.com (mail-pl0-f52.google.com
	[209.85.160.52])
	by mail.openembedded.org (Postfix) with ESMTP id 763FD74E40
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 00:29:56 +0000 (UTC)
Received: by mail-pl0-f52.google.com with SMTP id v5-v6so14630207plo.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Apr 2018 17:29:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=7ck4qHALcBlBQbZ8PUzQccctd6Z9/PsEvvSkEvimEwY=;
	b=SIQ9OAQUjtmM92kocRe/4MDeJfuhGF4bxhRyI2+ttXUt5LffZS4mHxPErbbdPJjfrA
	cS2zrKRnNkM5krPulpOtCjxSsAM6DlrlAHa0BTjM+Wahu3DqDV73rn8ySFgu8rroRdDf
	sGi5GphPSMhVDpAZcUQ+KHA4SJ/XjBDgq7Wh47TVhcUoW7nV7UrtUT0+aPTIob/mwBcA
	wozHnnA/6/AGUoElCphXhluB0Rzpg9ZTpdkXhKYyNL+gioEbacaammoDUTT05P8obsIs
	+UgfgLfmmQM0vN3SlshsdO6UYk3i/4wE0hiBJNyp3VhicCs9QkhaRdtLGRfN9jRdimaz
	xU8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=7ck4qHALcBlBQbZ8PUzQccctd6Z9/PsEvvSkEvimEwY=;
	b=hQweVg/KChLcDVEek8jBtL4TFqpseQ6QCDUtOTMV8IjKaxJrfQpxFtrfsApUFtF3eS
	DpoyZaZDDQh9HqBCx+WfbNdUZfElYHHymjEiTPbQi6v+qDl9FTVgGgHglu8/d3SxIqvz
	i2tlvS5I3CReauNPrQtLhtEC7N78o2lhZEjVAz8Ar8md/xYwiuPnSh/voMoQIls9t7a/
	Ec5grDiP9M8NbQDH3iuLS0/fIZ86Y4cXdnZGRyP0w5nLN+vZLYY0tUTHxAEjHGqkYtmW
	cHb3yRN7dQ+89AsHH0ynSjmu7aT+PRi/uaQDs1r47U62HlTCUgo5dqdXR1bgkYx5tz4t
	+Vgg==
X-Gm-Message-State: AElRT7H/a6myGdMD0QEjwa8yC0rB1YOQXR7pyzlEaDtrhEDXGhTF19YO
	uxdOV/PhFXEVsHuv42XMyxGXHdeV
X-Google-Smtp-Source: AIpwx48rrFgryj6pa5KGq4JrpZRpWbcCQHe7fmIZRgyKm+NXVGhzOfU7WHYyTn98cPlU3WACsQLaxQ==
X-Received: by 2002:a17:902:bc41:: with SMTP id
	t1-v6mr20440973plz.56.1522888197336; 
	Wed, 04 Apr 2018 17:29:57 -0700 (PDT)
Received: from ?IPv6:2601:646:8880:466c:fde8:8784:7436:3e7a?
	([2601:646:8880:466c:fde8:8784:7436:3e7a])
	by smtp.gmail.com with ESMTPSA id
	a6sm10437905pfi.12.2018.04.04.17.29.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Apr 2018 17:29:56 -0700 (PDT)
To: Seebs <seebs@seebs.net>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<39787e20-0d21-00bd-a5bb-73faa52c0839@gmail.com>
	<20180404164505.00553b97@seebsdell>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <819256f6-b2b0-bb24-6524-292d6ab7442b@gmail.com>
Date: Wed, 4 Apr 2018 17:29:56 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:59.0)
	Gecko/20100101 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20180404164505.00553b97@seebsdell>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Thu, 05 Apr 2018 00:29:56 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/4/18 2:45 PM, Seebs wrote:
> On Wed, 4 Apr 2018 14:28:11 -0700
> Khem Raj <raj.khem@gmail.com> wrote:
> 
>> what is the performance impact of adding another stack frame and
>> function call in the chain here. Do we have data ?
> 
> Very close to unmeasurable, because *almost nothing ever uses syscall*.
> 
> This is used only for the case where someone is explicitly calling
> syscall(), not for any other system call use case. And my
> implementation (which is not the same as this one) also overrides the
> wrapper generation, so there's no standard pseudo wrapper overhead
> (which is several times larger and involves mutexes and signal mask
> changing), it's just passing the call on unless it's SYS_renameat2.
> 

Thanks for this

> -s
> 


