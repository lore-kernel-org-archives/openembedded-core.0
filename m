Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2DCD97D5A1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 11:40:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c5so14834328wrs.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 04:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=D9ynKfhNbtUiEj8Ju3LNHdh4LqkYgZ4BhYwtUkr2Ud8=;
	b=UdYSASHQLMqrH9woSK5G/5XG3PwBdeRIvV2KsBCS2taDSwzvNRrvv+PJofh+SawT9E
	AjelflWEP17R2pffyhnjb0M+MQitDGaRaAnC0wapkMReFQHBA5ujlHxYvkdEgJH+LRfc
	c9Ad7tqxMPn/HcJLmjZfVP0IwGL0q/FgMwKAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=D9ynKfhNbtUiEj8Ju3LNHdh4LqkYgZ4BhYwtUkr2Ud8=;
	b=QHfRU/JwZNYJNeUQGCd1wb8WWP48oLCDuubbrnCZ6RU3vb/deCg8wxg1m8trUvgvJb
	j/lj8MYuf35f8OvYdoOflS7OWYYjJZt6/eL4I6/+5SwAB4j9aBardNOQHglMtHaLoPIQ
	PU8QkyJasLrTjppIQGD726931++vWkGmtPpWjwAoE74aTjc7lFEn+5xRcGfMJ9qWvB5s
	V+Refp4ubeppWW8lT1SwcRiIcVzvkABPuNABi8VwNydgrTXKiyYDzLXavf4pX9zgyiPI
	YjDc4SycuIOPQ/mc2V/aZTw0kv1J1Wn7CmZIk7rlJMnPemJjLa5RiAXVVAHRmDX7jxXS
	+QkQ==
X-Gm-Message-State: APjAAAVovdW+Qje8eSbB8IR00mOcCQmNc9Pgx408dfDSBsWcztYJc7mS
	WeLUTpnnl15wulSnrrGq2UBHug==
X-Google-Smtp-Source: APXvYqyGIvLa6k5YDunCCBkHEvGt+O6NXgMQHGoyJcWbrlwyh4tvbQlXlmRovM+/hcr4Ehwh+KKVfw==
X-Received: by 2002:adf:d4ca:: with SMTP id w10mr16926540wrk.293.1557747655961;
	Mon, 13 May 2019 04:40:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	t10sm12362360wmj.17.2019.05.13.04.40.54
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 13 May 2019 04:40:55 -0700 (PDT)
Message-ID: <2bb4d4b8a5c395ed9f0647bcbd1945cf2ef280bd.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mark Hatle <mark.hatle@windriver.com>, Khem Raj <raj.khem@gmail.com>, 
	Andreas =?ISO-8859-1?Q?M=FCller?=
	<schnitzeltony@gmail.com>, Bas Mevissen <abuse@basmevissen.nl>
Date: Mon, 13 May 2019 12:40:53 +0100
In-Reply-To: <ceb5ee6b-3965-de63-4237-805a6a97e92b@windriver.com>
References: <20190427113714.30173-1-schnitzeltony@gmail.com>
	<d935a0811d57ce8681e7aeeedaf2722233242ae4.camel@linuxfoundation.org>
	<CALbNGRSBsq7c8AAdpHUfkYytbeBMddDns5R7HeQ=9bWZU_OLyA@mail.gmail.com>
	<a45f59b03312a7693bd5d4e4ae04c600@basmevissen.nl>
	<CALbNGRT_FRQfA0jpP7DHsFOxnt97JW-KEjyGXOkW9V2w+Ujgyw@mail.gmail.com>
	<CALbNGRR_YxL=+u7Kc5x8OiTXLFhRjqK_jp53xB5Q_9WZS-rZ+Q@mail.gmail.com>
	<ec77d08feb85f543bbc79372d276092c10336035.camel@linuxfoundation.org>
	<b53e6c90-2a8d-7ae7-b5f7-e7a80b258da3@gmail.com>
	<ceb5ee6b-3965-de63-4237-805a6a97e92b@windriver.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] vte-native: reduce c++ requirements from c++17 -> c++11
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
X-List-Received-Date: Mon, 13 May 2019 11:40:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2019-05-13 at 14:34 +0300, Mark Hatle wrote:
> On 5/11/19 4:42 AM, Khem Raj wrote:
> > 
> > Can we require centos7 and other hosts which use old compilers to 
> > install the additional packages to have newer compilers ? e.g. for 
> > centos installing devtoolset-7 will fix this issue
> 
> I think we need to consider disabling this by default, as Ross
> indicated he
> wasn't sure it was really required, as well as consider the c++14
> patch (if
> standard CentOS supports C++-14).
> 
> I do think it's reasonable to try to patch this component, assuming
> it can be
> done in a reasonable way with a reasonable end result.  (10-lines is
> pretty easy
> to understand/support, 1000 lines... no so much.)
> 
> However, once we get past one component into multiples, then we need
> a better
> answer.  Either a set of buildtools the user can build/download, or
> items
> standard distributions have that they can install.
> 
> Unfortunately CentOS 7 (and corresponding RHEL) is ancient by
> compiler
> standards, but is heavily used as a replacement is not yet ready.  So
> this is a
> problem we'll need to deal with for a while still.  Until CentOS 7
> era is really
> no longer heavily used I think we don't have a choice here but to
> deal with this
> one way or another.

We avoided the problem by dropping the dependency so we're ok again for
now. We haven't required special things be installed on hosts as it
increases the documentation problem quite a lot. We run our autobuilder
test workers fairly standard for this reason.

The problem is going to get worse over time and the other solution
could be we require one of our own buildtools-tarballs installed too.
We have used this approach on our autobuilder workers in the past.

I am keen to avoid extra distro specific documentaiton (and patches to
detect the conditions) if we can help it...

Cheers,

Richard





