Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
	[209.85.221.53])
	by mail.openembedded.org (Postfix) with ESMTP id B62B265CF3
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 23:12:50 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id x1so46585791wrr.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 16:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=0+qQt4XTgBzwrGZ1/arGBjZgW3hM1QM8JI0gb4iK16k=;
	b=NEOgZZ/Xnnn5NLejrymEsw8bw1g3soPl5BQ9pi/92pbbZo2PTHBMyTq73oJMFb5KEV
	fiFS5xrVzDgt87aJRh+lFTFEzMrPcDKYjZHvGkbhDKeILU9cVxTe70NM1IN8neS+SV+K
	/njWs0nbQPRa3g1qGmdMEgDICl6QMIQ7Kw/VM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=0+qQt4XTgBzwrGZ1/arGBjZgW3hM1QM8JI0gb4iK16k=;
	b=nA7cOalHrKEXr/8COYqnOOoT1WMgj6le3zSnee0whl0St47PzmqIJu9Z3e9Uw10Iu1
	sSrL/a/baCeZ21zuwM2Wt3Bj4RN+5hSEAf+/5+3pzfBhvM5H5Sw4aIWWd7qzon7KiEkS
	HyDgCe9cM2Jy1tRQFoSHNdz38RKz6CTyRklHii0CObqQDX9uv18EhzmUX/mnoUHZP4+F
	Mq5QNiFEOqDEVrJr4r5WGjt2V8oOniuui/Opjprd3uDQvDqFCRTnrOqsPo9+x5zxL94L
	wH5IOOSwGd91rzb5jWiSlWji/WcU/gJRLH8EuLH06X0/f/INtEJEB2GVf1LITqochl83
	PY6Q==
X-Gm-Message-State: APjAAAX6a5qOoA7tcZnR9ZWuyGZ1VV6BVx6a939HAjKx7HUsUcA5gkUb
	u9LOCVHX/lnXCzMzfB48Wipq2A==
X-Google-Smtp-Source: APXvYqxFn2U3FtMKAuWLkCw5kpHN9QXowLPOWBAmRQ6O5iH6QBKKWHa2DdhXWbslomZ5sT0h7JdTng==
X-Received: by 2002:adf:e444:: with SMTP id t4mr18807072wrm.262.1565305971396; 
	Thu, 08 Aug 2019 16:12:51 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id a6sm3466812wmj.15.2019.08.08.16.12.49
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 16:12:50 -0700 (PDT)
Message-ID: <1ffd556dac8fdc3fad8db8391b2b5a5f232d7331.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Jacob Kroon <jacob.kroon@mikrodidakt.se>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Fri, 09 Aug 2019 00:12:48 +0100
In-Reply-To: <3d17555f-62a3-ecfb-45be-afd08cc1156f@mikrodidakt.se>
References: <a3cde6526f42e115340654402a3e89bed42facd8.camel@linuxfoundation.org>
	<3d17555f-62a3-ecfb-45be-afd08cc1156f@mikrodidakt.se>
User-Agent: Evolution 3.32.2-1 
MIME-Version: 1.0
Cc: Joshua Watt <JPEW.hacker@gmail.com>
Subject: Re: Hash Equivalency - What this means for developer productivity
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
X-List-Received-Date: Thu, 08 Aug 2019 23:12:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2019-08-08 at 10:18 +0000, Jacob Kroon wrote:
> Checking for built ipk packages I see:
> 
> [jkroon@manatarms-greyskull <snip>]$ find
> /tmp/ramdisk/<snip>/deploy/ipk/|grep eudev
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dbg_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dev_3.2.8-r0_i686.ipk
> 
> If I then do:
> 
> bitbake -c cleansstate eudev
> bitbake eudev
> 
> then I get:
> 
> [jkroon@manatarms-greyskull <snip>]$ find
> /tmp/ramdisk/<snip>/deploy/ipk/|grep eudev
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dev_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-dbg_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-hwdb_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev_3.2.8-r0_i686.ipk
> /tmp/ramdisk/<snip>/deploy/ipk/i686/eudev-src_3.2.8-r0_i686.ipk
> 
> and then I can complete building the image.
> 
> I did not have hash equivalency enabled in the beginning, I've just
> recently enabled it, without wiping tmp-build/ or sstate in between.

I've just seen this with dnf on the autobuilders and an rpm build. The
most interesting bit was:

[pokybuild@centos7-ty-1 temp]$ pwd
/home/pokybuild/yocto-worker/genericx86-lsb/build/build/tmp/work/core2-32-poky-linux/dnf/4.2.2-r0/temp
[pokybuild@centos7-ty-1 temp]$ cat log.task_order 
do_populate_lic_setscene (19174): log.do_populate_lic_setscene.19174
do_fetch (89722): log.do_fetch.89722
do_unpack (93503): log.do_unpack.93503
do_patch (97696): log.do_patch.97696
do_generate_toolchain_file (114754): log.do_generate_toolchain_file.114754
do_populate_sysroot_setscene (107361): log.do_populate_sysroot_setscene.107361
do_package (108444): log.do_package.108444
do_packagedata (28709): log.do_packagedata.28709
do_package_qa (21415): log.do_package_qa.21415
do_package_write_rpm (21400): log.do_package_write_rpm.21400
do_package_write_deb (94084): log.do_package_write_deb.94084
do_package_write_ipk (94059): log.do_package_write_ipk.94059

i.e. do_populate_sysroot_setscene let it skip do_configure, do_compile
and do_install and just run do_package. Which is very clearly badly
wrong!

I'll poke into this further tomorrow but I have some idea of how this 
might happen...

Cheers,

Richard



