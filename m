Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 093CF7FD72
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 11:56:25 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id c9so1632513wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jan 2020 03:56:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=dG/QUtafH/LuUjw6wK33dscbBJpIM7eE/ipEiIM7GhM=;
	b=B55qIaPgYeVd0+rVW00oo7RUZt8ggMK8l4qRcpuXEsGszrYB7+CJJvXoAGbQ9IPgOF
	Z6vIO9YWnbh1K3dpEXerhNfHD5ukdVEzQm+8yrV0aTE1joJ8CU0QDI/yQ8AeTRvf0OQO
	PP4M18c9Hl+DSi1WTl8T2jVZbrSfS2rWWcaEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=dG/QUtafH/LuUjw6wK33dscbBJpIM7eE/ipEiIM7GhM=;
	b=ieFhmFKnfpUOzZaDlx5+tf8Q9SIFpkqH7iGLXEv23YUYksYnxj4kLPehmNPtH55y8L
	uTZksvKmJlyHkdWeaHHMwOR3xGgvhXUY0snMSwP4I/KG+XgqMWdlWqEAlK2SifkRF1JD
	TwXoyNln8f4Kbb5MkV5ULZW7EvT9NGE7K6Ot1MKIgUXWw1Y8PVREIlKnmc6UBkVWipyN
	bq6oBjGKKu/Jela3pDTRdOd8y7eOfUUHTCpEEaJfdrR4KOwhCHOGg9Qll63NgQNZSQZ4
	+FTirsFwSSGMk2sSBtyhjOece8p+zZnLewG7/O8RTHhPoEGICCk9F7a1FzRFpixSp0P2
	r9Mg==
X-Gm-Message-State: APjAAAVeYkT2zoIIxKKIXeaQuUFaMHwmI5u/7x4+4OQoXewnezH3c2W+
	w5pvWKM6EDLXrwWbnxHdL4xIvg==
X-Google-Smtp-Source: APXvYqyTVarFzhPCGMepE/h8QeGKsruROtT6oagcgF0l8HLIUU5S5h9onrkB+SUQSQGrgthF3NQb1g==
X-Received: by 2002:a5d:4cc9:: with SMTP id c9mr3952812wrt.70.1579866986467;
	Fri, 24 Jan 2020 03:56:26 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	o15sm7059522wra.83.2020.01.24.03.56.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 24 Jan 2020 03:56:25 -0800 (PST)
Message-ID: <3d7273734bd7ce04a6b6ca76f210204a948328dc.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jean-Marie LEMETAYER <jean-marie.lemetayer@savoirfairelinux.com>, 
	openembedded-core@lists.openembedded.org
Date: Fri, 24 Jan 2020 11:56:23 +0000
In-Reply-To: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
References: <20200120102705.20916-1-jean-marie.lemetayer@savoirfairelinux.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: jonaskgandersson@gmail.com, paul.eggleton@linux.intel.com, bunk@stusta.de,
	cdelston0@gmail.com, rennes-dev@savoirfairelinux.com
Subject: Re: [PATCH v5 00/13] NPM refactoring
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
X-List-Received-Date: Fri, 24 Jan 2020 11:56:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-01-20 at 11:26 +0100, Jean-Marie LEMETAYER wrote:
> Hi folks and happy new year,
> 
> For readability here is a link if you want the history of this patchset:
> http://lists.openembedded.org/pipermail/openembedded-core/2019-December/290298.html

Thanks for this! I think we're nearly there.

There were some selftest failures:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/632

The reproducible one isn't from your patches but some are:

2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - devtool.DevtoolAddTests.test_devtool_add_npm: FAILED (16.29s)
2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpgradeTests.test_devtool_finish_upgrade_origlayer: FAILED (31.89s)
2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpgradeTests.test_devtool_finish_upgrade_otherlayer: FAILED (44.65s)
2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - devtool.DevtoolUpgradeTests.test_devtool_upgrade: FAILED (33.96s)
2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolTests.test_recipetool_create: FAILED (8.81s)
2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolTests.test_recipetool_create_cmake: FAILED (9.25s)
2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolTests.test_recipetool_create_npm: FAILED (3.56s)
2020-01-23 18:32:58,726 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolTests.test_recipetool_create_python3_distutils: FAILED (8.60s)
2020-01-23 18:32:58,727 - oe-selftest - INFO - RESULTS - recipetool.RecipetoolTests.test_recipetool_create_python3_setuptools: FAILED (9.33s)
2020-01-23 18:32:58,727 - oe-selftest - INFO - RESULTS - reproducible.ReproducibleTests.test_reproducible_builds: FAILED (3620.27s)

Mostly things like:

Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/devtool", line 334, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/devtool", line 321, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/lib/devtool/upgrade.py", line 557, in upgrade
    tinfoil, rd)
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/scripts/lib/devtool/upgrade.py", line 218, in _extract_new_source
    md5 = checksums['md5sum']
KeyError: 'md5sum'

from some of the checksum code changes but also some nodejs-native
being missing (incorrect guards on npm code?)

Could you have a look into those please?

Cheers,

Richard




