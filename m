Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wr0-f174.google.com (mail-wr0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 01079785B9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 19:12:51 +0000 (UTC)
Received: by mail-wr0-f174.google.com with SMTP id y43so183010501wrd.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=U3RzrHMsSsL6zfiB3P0aDouLTnyh2yXAATQkM0ZmMf8=;
	b=bJ6JnQ6jGrQS51IuRnuvkGkzlcz04qPDl2Kvls59oM8t4J/L+h5bLXbriUScRB+Obe
	cPKfW7clwIbzngANjjuPRhpaYHJ8eTQyVd6/a42cKF8B3PfJqrIrSHhnz1wKiKhzTlKO
	WSCviZcEkxFOI8fQAybKowo0M+G/Tfv6UyNLwvQ1EpXoDtq7K2GZmL7fyFWLMCB/fg6+
	JXt9pXxM7zylZwnvZmDLfq1CSjeZiwlm4/O4auX1bpOHXTb9bri/f/EBfnpuSbcTLlsY
	f1HNwA06c9E7kMZOxmnLztpA+lH+2py3Gm+U1lzHfBz6d3EAJlzoSErSnnYEeM7aW4NX
	+rLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=U3RzrHMsSsL6zfiB3P0aDouLTnyh2yXAATQkM0ZmMf8=;
	b=I28EehueVYhuuaNIKSIlZYmd5Ph9rnavcEdvgdW++Rso4OA199Z8jqQMpNWCntM14F
	5oLdlkNh4Xj8yIxNMjgzx3sMr5jThh7ueeLQOGy+4KI+hKfCM6FUZxtoBNn74qiQqsdv
	dnMTty5FSTyXb66/i1Q0Cabre7bBijg1Nt0Fdlgi3lOAYKgThgycSvzBvMXRoH3j2+I8
	rSJBY2a7Lge1YqPueEatealU0J3602HZGo+6uBLKCqIdqZJ63C4UO4fIfqFptSEhB3Vi
	Tp72D91W88tqG/Ss7ttRESekMW5UdUt6t55fpOukV1Lx1oYMlFLdzhU1JANfaSfWpdA6
	pwMA==
X-Gm-Message-State: AIVw110mpZ9KX9aUoVweYsmmr5r507IYvrGdDcjpVBCmewWCnkweVUGa
	9PTUnG/OP9IQEsVGef0=
X-Received: by 10.223.142.164 with SMTP id q33mr15351031wrb.13.1501528372222; 
	Mon, 31 Jul 2017 12:12:52 -0700 (PDT)
Received: from mail-wr0-f177.google.com (mail-wr0-f177.google.com.
	[209.85.128.177]) by smtp.gmail.com with ESMTPSA id
	v8sm31366341wrv.16.2017.07.31.12.12.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Jul 2017 12:12:51 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f177.google.com with SMTP id 12so183284799wrb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Jul 2017 12:12:51 -0700 (PDT)
X-Received: by 10.223.179.216 with SMTP id x24mr13151389wrd.7.1501528371036;
	Mon, 31 Jul 2017 12:12:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.198.70 with HTTP; Mon, 31 Jul 2017 12:12:50 -0700 (PDT)
In-Reply-To: <CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
References: <20170728180734.1920-1-otavio@ossystems.com.br>
	<CAJTo0LbhyV1g4w4PG_hxMEioTTJdthaDvmgQhU-r2V-w3RHLeA@mail.gmail.com>
Date: Mon, 31 Jul 2017 16:12:50 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
Message-ID: <CAP9ODKqb2hLkkLpbnTSRnGHPRcczZqn_g=Uythiey8Tz+Y_Gcw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>, Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go-dep: Add 0.2.0 release
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
X-List-Received-Date: Mon, 31 Jul 2017 19:12:52 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Ross,
Hello Khem,

On Sat, Jul 29, 2017 at 3:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Failed in the no-x11 builder at least so far:
>
> ERROR: go-dep-0.2.0-r0 do_package: QA Issue: go-dep: Files/directories were
> installed but not shipped in any package:
>   /usr/lib/x86_64-poky-linux/go/bin/dep
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
>
> https://autobuilder.yoctoproject.org/main/builders/nightly-no-x11/builds/537

I did reproduce this; I could only reproduce it if I built it with a
machine which matches the architecture of host, in my case x86-64.
When building for other arch (e.g: ARM) it works as expected.

The problem seems to be a generic problem and I am not experienced
enough on the Golang toolchain to look at this. Khem could you take a
look and see if you find the root cause?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

