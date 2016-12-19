Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD9E73163
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 15:23:26 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id b194so19335314ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 07:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=xDBs+ILTqSdUGsJL2BooPU9BkFaOPltMPP7zPX4iteY=;
	b=W+c/B1yJMZhceMX9UesVcXd/msmHCcG4glXjslf+Eu+at44toM0SM6P5G4GZnzBDpv
	KlBiEGaJ38hkl/uJ+uaNn0hQ0onbDLg7lIv2A8ByYjbcVqHzeehuO1n46bHjNG90QrgV
	2OHokIauoZ7mAlU6K8oM5Fhcf2SyPFiA2x4RxgzscCAM822r22eb/d1JEvxOR6MID3ox
	ygbTaOQ5g8jarwvAPK+yzf/kr1h82riQ1iZYFSTH69sr1xk9u4AWvpu5q2phjgFx30Vo
	TMBEFQcmkjvDJ8n3RyIHjGCvGO9nUHv1tHyiW+YNmCCK7eR48V57ehhF63cvRkMyKL5q
	xNEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=xDBs+ILTqSdUGsJL2BooPU9BkFaOPltMPP7zPX4iteY=;
	b=KUk6Fv6/0oqTXqEZDhTG0cxhQaEKyYieMeUJ1DxSXzOO2gyY89HhAXJGttpriKRO7C
	TV9qLyDQtLl8FToz7Dy86SkOxKG3J0YUNHxQuR10zuPj5hnnKRlaLdi55+t2uz219AG0
	M+VEtgind8fktkTVThDdxmo5fOobCq7PQyiGng5gkfI4y3MJzBW3tKK+asfZEwosyku0
	Ly51bUqQMb1fvv+wtUr+RTWOIeKtMx2Gfx7pO66IYQgYiYEe0xZfdKSffy4hQZKJ727u
	ilZHmF7E7FmJzxccMfmvnBmdhcDq3gtsgW7rd686ymwgAqTVdAvHHVYqLKcxqt+ZD6JA
	DTuw==
X-Gm-Message-State: AIkVDXLr10ZAzCExfUyEgpKw135LQTC1N5iCdGBi4jDKvNy5U6joh0shYf9tyAuHHLVIvA==
X-Received: by 10.107.166.145 with SMTP id p139mr15494058ioe.228.1482161007443;
	Mon, 19 Dec 2016 07:23:27 -0800 (PST)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	w17sm8403995iod.22.2016.12.19.07.23.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Dec 2016 07:23:26 -0800 (PST)
Date: Mon, 19 Dec 2016 10:23:24 -0500
From: Trevor Woerner <twoerner@gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20161219152324.GA1056@openSUSE-i7.site>
References: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1481599839-114211-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] util-linux: 2.28.1 -> 2.29
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
X-List-Received-Date: Mon, 19 Dec 2016 15:23:26 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Is anyone else seeing build failures as a result of this commit?

	... [lots of lines omitted] ...
	| cfdisk.c:(.text+0x207b): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x20a4): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x2268): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x2284): undefined reference to `_nc_acs_map'
	| cfdisk.c:(.text+0x2290): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x22b9): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x22d4): undefined reference to `_nc_acs_map'
	| cfdisk.c:(.text+0x22e5): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x2304): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x231d): undefined reference to `_nc_acs_map'
	| cfdisk.c:(.text+0x2329): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x2374): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x2392): undefined reference to `_nc_acs_map'
	| cfdisk.c:(.text+0x239e): undefined reference to `_nc_stdscr'
	| disk-utils/cfdisk-cfdisk.o: In function `ui_menu_resize':
	| cfdisk.c:(.text+0x244a): undefined reference to `_nc_stdscr'
	| disk-utils/cfdisk-cfdisk.o: In function `ui_refresh':
	| cfdisk.c:(.text+0x24c5): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x24d2): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text+0x24ff): undefined reference to `_nc_stdscr'
	| disk-utils/cfdisk-cfdisk.o:cfdisk.c:(.text+0x2587): more undefined references to `_nc_stdscr' follow
	| disk-utils/cfdisk-cfdisk.o: In function `main':
	| cfdisk.c:(.text.startup+0x334): undefined reference to `_nc_LINES'
	| cfdisk.c:(.text.startup+0x342): undefined reference to `_nc_COLS'
	| cfdisk.c:(.text.startup+0x39d): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text.startup+0x45b): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text.startup+0x4d3): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text.startup+0x4e0): undefined reference to `_nc_stdscr'
	| cfdisk.c:(.text.startup+0x77d): undefined reference to `_nc_stdscr'
	| disk-utils/cfdisk-cfdisk.o:cfdisk.c:(.text.startup+0x8fd): more undefined references to `_nc_stdscr' follow
	| collect2: error: ld returned 1 exit status
	| Makefile:5737: recipe for target 'cfdisk' failed
	| make[2]: *** [cfdisk] Error 1
	| make[2]: Leaving directory '/z/layerindex-master/raspi3/tmp-glibc/work/x86_64-linux/util-linux-native/2.29-r0/build'
	| Makefile:11450: recipe for target 'all-recursive' failed
	| make[1]: *** [all-recursive] Error 1
	| make[1]: Leaving directory '/z/layerindex-master/raspi3/tmp-glibc/work/x86_64-linux/util-linux-native/2.29-r0/build'
	| Makefile:4781: recipe for target 'all' failed
	| make: *** [all] Error 2
	| ERROR: Function failed: do_compile (log file is located at /z/layerindex-master/raspi3/tmp-glibc/work/x86_64-linux/util-linux-native/2.29-r0/temp/log.do_compile.18807)
	ERROR: Task (virtual:native:/z/layerindex-master/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.29.bb:do_compile) failed with exit code '1'

