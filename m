Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 986707C268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 20:55:18 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id n32so16705676qte.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jan 2019 12:55:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mWFRgRxnZkeEs3E6c5JIAbMyIsqUPc/Yby3C+1JtVzo=;
	b=gGbWGU4fpRPjYQkqFKY7R0jJSjCUL5+qI4+jr3VGmMAu9AYv8pnOnOrW64Qqciorf7
	sNY+KdQ0KmgvoG6VA8PbOrI59JUjE0jIqdlXIT0Xa158S+MxMwIYE4e2ZnINUhoy9hcu
	TIb0LeFjPQufMxsbiAxY7cl/odf1zbj9TgeAlfcbIuVPytFWMmqFOuV3sQyXq47dw0WX
	B/hKKtlih0RtQuCNfKYuln6GrMBGWj02JDf7xgKPO5GraXF7RzBVrNXIeycP8oUxJApq
	EZu2uRe/8GPs6UyDJ7AzBfsbto/xOUe4qkC9I6lJzrd5NBhYUocoVHv7pNE5KlUYs1Wm
	2wRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mWFRgRxnZkeEs3E6c5JIAbMyIsqUPc/Yby3C+1JtVzo=;
	b=Z2UCaS9tdmh7GoR0ZCn1Xfh3Qr99BAk7StFca49VNApAeij6fu+4KxYnuu0tm83ed3
	t+S8Lk/+AVB8l7P2VfEBibZUYR/1yviOty0lbKxm7si5plucwC8TQYkPsGLISVRkjowE
	dUO5cOwdp/hsa4J49s8AzXDYbVJTqFeVlQVA3aGsnuURn/Pv4Zt3q6DnzhLm6FU2JlXk
	iuEyxItb2osLXfqEKiRMcXAHAk/Cs4mnKj0mF6gyQJlQfn/EIKICJbD7OinQpqB56a2G
	dRUl11ybaPuq/B7JOemM9JeK7geiLDK3rL/uK3vuJKz/+aJQPKXDT+bUz6t+i7NYb2q8
	a4fg==
X-Gm-Message-State: AJcUukfH4t6qn2/YeVooNPem04BmVWZIQst/gUWsb0dC9UBkxxhLfqm9
	BbDcq8x8Q6yz13il2zHX89Ko1GCoXX9an8kiBhU=
X-Google-Smtp-Source: ALg8bN4BulKAvdH5J8ZavC0vnD13Q8p0dKiPM8rM3XQxChqX+2J7tXdXy5MOp32cRvp3MudUd4zM1o6bKYbYocECjIQ=
X-Received: by 2002:aed:3eac:: with SMTP id n41mr17508335qtf.196.1547844919444;
	Fri, 18 Jan 2019 12:55:19 -0800 (PST)
MIME-Version: 1.0
References: <20190117071227.57387-1-kai.kang@windriver.com>
	<CAMKF1srbHBH8ZUT7ChbJXqc=0f2HxGM=ZWJyY=osE=RLzxTW_w@mail.gmail.com>
	<CAJTo0Lb-wU6Mre2uqg6e2x=_FAAr21s4sqP_oj-saQznQQsNbA@mail.gmail.com>
In-Reply-To: <CAJTo0Lb-wU6Mre2uqg6e2x=_FAAr21s4sqP_oj-saQznQQsNbA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 18 Jan 2019 12:54:52 -0800
Message-ID: <CAMKF1sots+CQU4CucnE7VfQbVsJzh-urOCWZbnQ_whbMP93WHA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf: reset default value of DEBUG_PREFIX_MAP
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
X-List-Received-Date: Fri, 18 Jan 2019 20:55:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 18, 2019 at 12:43 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Fri, 18 Jan 2019 at 17:55, Khem Raj <raj.khem@gmail.com> wrote:
> > I am bit concerned about using -ffile-prefix-map here, its gcc only
> > option so will cause clang to fail
>
> It's almost like we need a toolchain override so this can be gcc-specific...
>
> I've been meaning to do that for about a year now :(
>
> Until then, couldn't meta-clang just override the value from the layer?

yes it can, but one by one there are many changes to keep and core becomes
tied to gcc. We should be conscious about it.

>
> Ross

