Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 0E9D5780CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:57:50 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id s62so27676679ywg.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 04:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=YDGqmpBmUY6gEU4nHxWPReGh+VRw0+pHOsnhjlERTME=;
	b=qSY4kAGcgD7bpbvNWjMBaKna/J9P5eio5bEQNqja9/tqsVeapZiyECGl5LvvvSVj/l
	LRq2G/lRNWYB5kZ4e/dsggRyN1LI6SlAL+9lVnJdG3CZJcn0QnecV3qZuN3Ztp+lSO7E
	c7ER39a4scgyM4+XQZ4ijYJH87XkWYl36zasjPlaPR94JzQkulvQ6Pv7wiM+t4eHbNcg
	+hBgkvYBlWFUS6dWIQoCQ8lkaez4tbdveQRrC09tHPyHdDbRe7KSB8dCvhNSDxENCvpl
	fcB/3JWpBU3P4nF94H8bK+Ta5pSZLTqPX9MBoVkhi2jvzkJxAnPez/pGMkCCtVZ11Pxk
	i64g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=YDGqmpBmUY6gEU4nHxWPReGh+VRw0+pHOsnhjlERTME=;
	b=E/wpumNnwveyYgBPi9bFLiSfinhu3CAbOptfkL72lvBjhmLk4FXFw2mFwLBRQXXOxE
	AubufxHmpkBWkRM5e945gGOQZY/Ttkg31qQWn1MEnnMC6P494Af9Gd/zffIcG92J66Lv
	ocOTbn7HbWkrgACO2F/Q83JtjKaxSibAm5IGbWvQunpLGf5bcNSCIZE5cCD+JKSR+Pko
	uuyg3UKZ87Kql2hp4lZyAKfsqgs5OjNoI+DKimtiqUE1UA1OOrLsPy6qay2c5Y/HrpAg
	1y7NVkHVxKoos55k1NRW7wGFauNYupTpGZUcQQsI/C88oeAHotALHxhJYBySprKpxuNa
	LJiw==
X-Gm-Message-State: AHPjjUhcXnD3C4/QtzY7F68Ut9qMDCUgbRdFlRfAm/SzCUrEYRCyH4NV
	OmXWKWBgHl9/5SzirII=
X-Received: by 10.129.118.75 with SMTP id j11mr5463498ywk.472.1505217472009;
	Tue, 12 Sep 2017 04:57:52 -0700 (PDT)
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com.
	[209.85.223.180]) by smtp.gmail.com with ESMTPSA id
	p125sm3769540ywb.29.2017.09.12.04.57.50
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 04:57:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f180.google.com with SMTP id g32so27600750ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 04:57:50 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA7GtIQ+81j1xS0nH5IglqGoP5RNJypGhSvoF4ZvIk3ocxamG0l0GKMPeyBnp5V4N8QVE3JPm+SJ9QBY5ZsLsU=
X-Received: by 10.202.224.130 with SMTP id x124mr13374683oig.100.1505217470315;
	Tue, 12 Sep 2017 04:57:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 04:57:49 -0700 (PDT)
In-Reply-To: <1505209529.18640.15.camel@linuxfoundation.org>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
	<1505209529.18640.15.camel@linuxfoundation.org>
Date: Tue, 12 Sep 2017 08:57:49 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoQSuwdhjPUGwdoFOMh08UdzO4unbmOmoV12GFR60TVNw@mail.gmail.com>
Message-ID: <CAP9ODKoQSuwdhjPUGwdoFOMh08UdzO4unbmOmoV12GFR60TVNw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 00/12] Revamp the Go support
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
X-List-Received-Date: Tue, 12 Sep 2017 11:57:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 6:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Mon, 2017-09-11 at 15:28 -0300, Otavio Salvador wrote:
>> This improves the Go support on OE-Core.
>>
>> We are trying to port as much as possible work done by Matt on
>> meta-golang back to OE-Core and also to avoid carrying old releases
>> as
>> there is no need to support more versions of Go toolchain.
>>
>> This fixes issues in existing support as well as add support for SDK
>> generation which supports Go.
>
> https://autobuilder.yocto.io/builders/nightly-no-x11/builds/471/steps/BuildImages/logs/stdio
>
> ERROR: go-dep-0.3.0-r0 do_package_qa: QA Issue: /usr/lib/go/src/github.com/golang/dep/vendor/github.com/pelletier/go-toml/test.sh contained in package go-dep-dev requires /bin/bash, but no providers found in RDEPENDS_go-dep-dev? [file-rdeps]
> ERROR: go-dep-0.3.0-r0 do_package_qa: QA run found fatal errors. Please consider fixing them.
> ERROR: go-dep-0.3.0-r0 do_package_qa: Function failed: do_package_qa
>
> Should be easy to fix hopefully!

I will try to reproduce it. I guess it may be varying when build host
is == target. Checking ...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

