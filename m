Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by mail.openembedded.org (Postfix) with ESMTP id F2FA2784E8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 19:20:03 +0000 (UTC)
Received: by mail-yw0-f173.google.com with SMTP id v72so28261684ywa.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=7SWws7eOX2/l42MOnIu0EizdYC9N/u2mz6bP6JKnqsE=;
	b=FDmGkTmnzz0gQXfEAtdduK9r451gWjv1MRD8HpL3zGEZy4RVUZAeAga1/auV9pIVkr
	tW9poUqmcxO4Npjk8S3d8FwE7jQV6oi8dwW49BksvWLWoa/whgej86AHe0aHUfc4UdRl
	L8AhC98b/5mta0UWjW/m1nJ7E12B4m4l/z7ADzbPWrLO2ey237ELGuuoQ3doNHBAkNfH
	9UB6GZcWux1PhK5pWNYBRC42FbIXgj/niYA7j/YBqr23TKrKC9DDcN2TDVlzO/hAb1uC
	rO6/Snte4FNj9KZTBVH7fXZcdQMXYK/UmdJdHstkzcJozUDMAsKFsXr9DXCgQcHnnE0c
	HSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=7SWws7eOX2/l42MOnIu0EizdYC9N/u2mz6bP6JKnqsE=;
	b=QlXY0Ns3prxUmDtqaulN93ownohX0dp2DoBpcbRQvK2fFi/1t/q6S5qSm5kZlDd4ko
	oF9gt8V1hQkRwruN767lbxwUi2U74Jx3Sxpl1/dHnppOyyTsdHvdD9PS9/LhcgWFFprv
	MwV8x0pMikOKs6XNfxsWmdx7Dzdm1hVuInOf7idWx1BaLHbQLRte65ccaUg43MdhQFnp
	UT5WgoXpXF4v4Of0/28cmj+3PgdsZbcO9N0Hc/UcHE6CJS7ZFuWusTcuVYFtupyZiMRG
	MiGMLonueItJS8L59DbwyuDYZgND5Gz7kBgyaS4b5mlKh1lEEOw/epJ4n0hcAgApA0qB
	ktkg==
X-Gm-Message-State: AHPjjUinyQ+vt7Tjgzn2E8dklTwwNzz4BLb94wDJflYIfNi4ohKvMXDi
	ctjHIwJr2vy+/nP9lms=
X-Received: by 10.129.147.133 with SMTP id k127mr14415011ywg.240.1505244004579;
	Tue, 12 Sep 2017 12:20:04 -0700 (PDT)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com.
	[209.85.223.177]) by smtp.gmail.com with ESMTPSA id
	t64sm4158677ywf.91.2017.09.12.12.20.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Sep 2017 12:20:03 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-io0-f177.google.com with SMTP id g32so36105415ioj.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:20:03 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QA9EsWqJqxGCAfbvQcdfCkeYF/Sl9leRkM8M4pK3tNCfJbU1VCcN3CRclp2GAh+jBP8jBFAgUNshLWl6JrJV8Q=
X-Received: by 10.202.94.67 with SMTP id s64mr6381766oib.249.1505244002691;
	Tue, 12 Sep 2017 12:20:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 12 Sep 2017 12:20:01 -0700 (PDT)
In-Reply-To: <CA+chaQcSMj-47DzgRrwWoUGNyc4WKoGM72bqKSf1YZHO2sskpQ@mail.gmail.com>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
	<20170912125031.4009-7-otavio@ossystems.com.br>
	<CA+chaQckTsnPoOeup9v563r1p3Rh5Yn1kDy=4BFaJbT6JPn3KQ@mail.gmail.com>
	<CAP9ODKoODpumO+yN7qmkEynJ46fZxC6nNW=+oPtnH20sMQT9aw@mail.gmail.com>
	<CA+chaQcSMj-47DzgRrwWoUGNyc4WKoGM72bqKSf1YZHO2sskpQ@mail.gmail.com>
Date: Tue, 12 Sep 2017 16:20:01 -0300
X-Gmail-Original-Message-ID: <CAP9ODKocG317bbmcnDvOGp5VJnAUsFy8DbRBVZ51a3akkg5tSQ@mail.gmail.com>
Message-ID: <CAP9ODKocG317bbmcnDvOGp5VJnAUsFy8DbRBVZ51a3akkg5tSQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>, Matt Madison <matt@madison.systems>
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v8 06/13] go-dep: Move bash dependency to -dev package
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
X-List-Received-Date: Tue, 12 Sep 2017 19:20:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 12, 2017 at 3:58 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Seems like this version was already picked to master-next, so probably
> better to leave as standalone change now.
>
> The version currently in master fails to build for arm with thumb enabled:
> http://errors.yoctoproject.org/Errors/Details/155765/
>
> Is it fixed somewhere in this new patchset?
>
> # github.com/golang/dep/cmd/dep
> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/recipe-sysroot-native/usr/lib/arm-oe-linux-gnueabi/go/pkg/tool/linux_amd64/link:
> R_ARM_THM_CALL, are you using -marm?
> WARNING: exit code 2 from a shell command.
> ERROR: Function failed: do_compile (log file is located at
> TOPDIR/tmp-glibc/work/armv5te-oe-linux-gnueabi/go-dep/0.3.0-r0/temp/log.do_compile.13531)

No, it is not.

It seems that Go, when using CGO, does not play nice with Thumb. Matt,
do you know if there is a known fix for it?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

