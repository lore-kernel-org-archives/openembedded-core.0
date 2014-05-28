Return-Path: <danismostlikely@gmail.com>
Received: from mail-qg0-f47.google.com (unknown [209.85.192.47])
	by mail.openembedded.org (Postfix) with ESMTP id BE8DE6FA85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 21:23:36 +0000 (UTC)
Received: by mail-qg0-f47.google.com with SMTP id j107so19698687qga.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=e8y0WCDPIFS3vKFfnZBUczdOrv1EA7ka8XoXyHSTWBA=;
	b=ilyV30gnvBrOmIFli5kK6L2LyPlaEnueW6FK1ia07veq/3qIy/61BzQjpOtRbLH1M6
	+9bfLhePBfn6oW+3+jqF37f2kTG6+QRvmJ2fXeBfO4yfdMGsXAw/s9Y3MrDQlp0vf7nL
	wulRGEwRV1Et/JvOiYPuqRQaEaDVuTBCcJCGCNgNvdfVkuSNDFjrgs/W2lQMsoL3aFC2
	Xn4ZAPJwZ4NEvUV3UqVkdXixWDj5pYgBWq1/tlN5Wuce1hbn2cJ+8pir5UlgNyhKVu5W
	dGBr/evJ8BwSLl3Pv2rJ0aN78/tS9afqxtP/ZGSfxZze4gJ7LZ2GyfW/SyhmI1J2bGGc
	yF9A==
MIME-Version: 1.0
X-Received: by 10.224.56.5 with SMTP id w5mr3754174qag.60.1401312216940; Wed,
	28 May 2014 14:23:36 -0700 (PDT)
Received: by 10.96.84.232 with HTTP; Wed, 28 May 2014 14:23:36 -0700 (PDT)
In-Reply-To: <CAMKF1soJxRchiG2YCNs8oiQZEmeD8Xx7JBFEb0RVxEtwKCaeHA@mail.gmail.com>
References: <CACS+7ZSGKFG06F_jFOJZu7FJqLh2F+FgkW30PSMRQ8Xdio51Qw@mail.gmail.com>
	<CAMKF1soJxRchiG2YCNs8oiQZEmeD8Xx7JBFEb0RVxEtwKCaeHA@mail.gmail.com>
Date: Wed, 28 May 2014 15:23:36 -0600
Message-ID: <CACS+7ZQD0m-toLMkk30gH-n+H40GRSCey=krt9QhHsC7mbTjxg@mail.gmail.com>
From: Dan McGregor <danismostlikely@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gzip: Avoid host contamination during build
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
X-List-Received-Date: Wed, 28 May 2014 21:23:37 -0000
Content-Type: text/plain; charset=UTF-8

It's encoded in zgrep, which is part of the gzip package.

On 28 May 2014 14:29, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, May 27, 2014 at 4:38 PM, Dan McGregor <danismostlikely@gmail.com> wrote:
>> +EXTRA_OEMAKE = "GREP=${base_bindir}/grep"
>
> is this grep path encoded into gzip and then referred when running ?

