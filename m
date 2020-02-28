Return-Path: <petr.vorel@gmail.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id EB695618EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 06:18:35 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id m10so8576045wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=owP/ABZ4HUqwgBKCUmdLlA27wGej7lNQTEVVW+y6vR8=;
	b=foLme40p6GCHI9gbB1mOPvoowCsUUWJYQxkLq3146Y34xkBkhte/+TAjYU/JPiqahe
	X3Q3sTMCxHPvwct8ZhVo9pPFSf3xkIJRIbYUFZIlxmz6rZZhxZttPpglBw25hmxbvdXF
	eNMMDxdqRiKcdlS4uTeBt3vVmOfOUJYexZEnx3sJzxakyE6cU3I24UkSfP+7zAylNpqB
	bmwX1awgIgwJQogBd0Gj6/+D1kUyEuZskHxFpYuB/Xe0xha5jDbBfvzYWNSaBrpPenZB
	njIkvHlzeIldYn8XBdmOvKOW9YfMxF/Aw2D3OewbYc42ud7mYmgoP7x1/Pe/cp0+kUIv
	nSBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=owP/ABZ4HUqwgBKCUmdLlA27wGej7lNQTEVVW+y6vR8=;
	b=Vkwg9xIaTxu10sRTnkrxL5lMvlH23D8UCiml4Hbj/19aJb/pjrS8uKySgQlPVqoi/N
	CvcdZeOyjYDg2XKLht1beCZif7bud6WCtO8e6dL3D9k91WxBRd1aRNQryrbQ2xkB/O9a
	ETWexkHPtOoPrhMg/2sweXv3IsfdXBIivg3JZVqAjl5EFEnwT7mLIDVpOwKRj3OuZOj2
	71DvFEhErTs+QYtkIJIboMCD5FAmW2sktdsFJtfqgzJD4VWIu6HpuOdlbu/urd/UQ/ec
	0VHmw5Jgp4Dw54h9Tg2L7MbHGIitUlzJwmhN/zPKXsK1AWHfIug32XRCUHoLlT+9tANY
	4j2g==
X-Gm-Message-State: APjAAAX8yp4U1q2R/KWnLxxq0XDY9sHqNCiQNJI4a8A1YieV8jwoTZ2q
	YVxOpOntzsGR96IbyQ2AuV4=
X-Google-Smtp-Source: APXvYqw2ohLDIH3C6Og0eQvs9qnl/qKQeo6YA4xIoY/ZL/6LXnZDzOFGFE8gBuLYxcu8imK02tMKwg==
X-Received: by 2002:a1c:488a:: with SMTP id v132mr3043258wma.153.1582870716599;
	Thu, 27 Feb 2020 22:18:36 -0800 (PST)
Received: from dell5510 ([62.201.25.198])
	by smtp.gmail.com with ESMTPSA id f127sm748597wma.4.2020.02.27.22.18.35
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 22:18:35 -0800 (PST)
Date: Fri, 28 Feb 2020 07:18:34 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20200228061834.GA30343@dell5510>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200227212940.12327-1-petr.vorel@gmail.com>
	<3db4501b-68e6-7a41-2ac5-268675583bec@intel.com>
	<e25440e3-f3c4-ea7f-c473-7fee90e89079@gmail.com>
MIME-Version: 1.0
In-Reply-To: <e25440e3-f3c4-ea7f-c473-7fee90e89079@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Fri, 28 Feb 2020 06:18:36 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Khem,

> > It looks like this is failing with musl:

> > /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/9.2.0/ld: /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_memory_test/../cpuset_lib/libcpu_set.a(libcpuset.o):
> > in function `cpuset_fts_open':
> > /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3214:
> > undefined reference to `fts_open'
> > /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3224:
> > undefined reference to `fts_read'
> > /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3269:
> > undefined reference to `fts_close'
> > /home/pokybuild/yocto-worker/musl-qemux86/build/build/tmp/work/core2-32-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/i686-poky-linux-musl/../../libexec/i686-poky-linux-musl/gcc/i686-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3277:
> > undefined reference to `fts_close'

> I think we need to add

> DEPENDS_append_libc-musl = " fts "
> EXTRA_OEMAKE_append_libc-musl = " LIBS=-lfts"

Thanks! LIBS=-lfts should fix missing fts. I've sent it as v4.

I'm trying to test it on TARGET_SYS = "x86_64-oe-linux-musl"
(run via TCLIBC=musl bitbake ltp, I should probably test it also on other arch:
MACHINE=qemuarm TCLIBC=musl bitbake ltp).

Anuj, can you test it as well?

Kind regards,
Petr

