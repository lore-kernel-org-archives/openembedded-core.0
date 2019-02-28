Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 61E337C763
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 23:07:35 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id q1so23850373wrp.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Feb 2019 15:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=QqjLtSbGuiWlZiYOyOLLF+rHRVBAtab479TJ+LMn8w4=;
	b=g44n+DkTJj7uQCDze0Mzs3Nn+xmP8YHkCYQtcs/kRvhNtrFmyns7rAbxfhipp4WYvW
	ZXWss5edd2jb4+BMOik7sEo8P0hpY3tMtUtRfq8Fxt7eumHJQZVXJG0GDXvYuXlHW/CO
	lSqJHUS6McQb1bChYnEweiwwpSnR/qIyXv+sZitkkdM1gef2iW0LKoosZoog2R6FDJEO
	QMW79uhn54xrvEFB4P9bsbOGGaLfCK7feS429S/ESsElm/ZdyLxHdHi80PkWX0uc9ALT
	fVr7K9VaZJW3JV2tu/SzHcf6lQCytuF8DRVOJ3ENFd9Y6aRjX6t7nzFr5rc7lmR6lTlI
	bvGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=QqjLtSbGuiWlZiYOyOLLF+rHRVBAtab479TJ+LMn8w4=;
	b=quwkbqmuMSdSRkqpu18tzmJ66CBJHEvRD9MY7pe+kU/adMY5eQ1JFoGjHTG0tXpt2i
	B930gfg7sFsoEj+RyL9xEwR/WjlUhLmYsAe9uH2TvWKWgkry35r0aytXZPCV6Ea0MMeX
	M3mdrxGKscRA4CXvUuahPqeMkjZ3DgSwZWfldeeCQD/99iQzOtbzL8qE2zpjARJPRIVm
	BczUFmPGlGXCQc8iMQB9JzIGnAHH9tbHr9oxTUNDe3jbsgiRE2cJEsHiQFxFHs8iG58D
	ztVM2bK9rv3wT2S5ARBINK2kkqp2GLVqxc3FiGI4cs3AG8OfPCpEoMv3WCGP5XnZ6qiQ
	hs6g==
X-Gm-Message-State: APjAAAW+ToMxt+e9qsXb3/wvVr8H0hRuAk3Zbih9Umno8NDvn+MilF/Q
	YvlK81V3/jQnmJ65/XPw2Ho=
X-Google-Smtp-Source: APXvYqwkZnO6rJYDg3qsUeXp0FjwAzUVpB7ye1ntTwZC1Sb3vAFo8c4gCt75tWP1uC8QOOI76jB0GQ==
X-Received: by 2002:a5d:668e:: with SMTP id l14mr1195194wru.198.1551395255912; 
	Thu, 28 Feb 2019 15:07:35 -0800 (PST)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	o30sm23805313wro.57.2019.02.28.15.07.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Feb 2019 15:07:34 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 1 Mar 2019 00:07:36 +0100
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190228230736.GC1503@jama>
References: <20190227180725.21396-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190227180725.21396-1-raj.khem@gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Cc: Alexey Brodkin <abrodkin@synopsys.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2] gcc: Update to 8.3 latest on 8.x release
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
X-List-Received-Date: Thu, 28 Feb 2019 23:07:35 -0000
X-Groupsio-MsgNum: 121767
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline

--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 27, 2019 at 10:07:25AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Add checksums and fix version

Something probably doesn't get rebuilt properly, I've noticed one
failure in incremental build after applying this:

ERROR: libvpx-1.7.0-r0 do_compile: Function failed: do_compile (log file is located at /OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/libvpx/1.7.0-r0/temp/log.do_compile.28823)
ERROR: Logfile of failure stored in: /OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/libvpx/1.7.0-r0/temp/log.do_compile.28823
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 9
|     [DEP] test/test_vectors.cc.d
|     [DEP] vp8/common/entropymv.c.d
|     [DEP] vpx_dsp/skin_detection.c.d
|     [DEP] vp8/encoder/dct.c.d
|     [DEP] vp8/common/idctllm.c.d
| make[1]: *** No rule to make target '/OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/libvpx/1.7.0-r0/recipe-sysroot-native/usr/lib/i586-webos-linux/gcc/i586-webos-linux/8.2.0/include/stddef.h', needed by 'vpx/src/vpx_decoder.c.o'.  Stop.
| Makefile:17: recipe for target '.DEFAULT' failed
| make: *** [.DEFAULT] Error 2
| ERROR: oe_runmake failed
| WARNING: /OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/libvpx/1.7.0-r0/temp/run.do_compile.28823:1 exit 1 from 'exit 1'
| ERROR: Function failed: do_compile (log file is located at /OE/build/luneos-master/webos-ports/tmp-glibc/work/i586-webos-linux/libvpx/1.7.0-r0/temp/log.do_compile.28823)
NOTE: recipe libvpx-1.7.0-r0: task do_compile: Failed
ERROR: Task (/OE/build/luneos-master/webos-ports/meta-openembedded/meta-oe/recipes-multimedia/webm/libvpx_1.7.0.bb:do_compile) failed with exit code '1'

I will check where the path with 8.2.0 came from, but cleaning the libvpx WORKDIR fixes the failure.

Maybe there is something wrong with the WORKDIR cleanup when do_configure is being re-executed (like fdt issue in qemu-native reported in the other thread).

Well libvpx doesn't use autotools/cmake with separate B/S directories, so the automatic cleanup during do_configure cannot do much.

Regards,

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCXHhptwAKCRA3VSO3ZXaA
HDIOAJwJOJYaBvGuo9bR/RCfOHeZDvGXCACgq9AWMMWY6BKw5hyC1zNwHcf5TJU=
=D+c5
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--
