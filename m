Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id AB38B60807
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 08:03:51 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id x75so31142673itb.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Feb 2017 00:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=b1hC0Zcji/A1MItxWJQqFkRKiXxE50LeYj0LSuJ+I/U=;
	b=uHyohqi9MHV8VoAqZOGVMjiIbPYdK7I1qipr3igSxCnGJg3M1mKhedFoXFAwbMJEQ2
	8izFzNT7GI4UXwyUiFYF8pRfADRDJZY2D3AQPpwHX5cYrAAD7oaBGvK5lppRrw5fvV5y
	l5zrVOjZGf0aNdXu3OMBa9G7Cv+SCIGxodBK/Wadr3u4uCwo1DNTUCxSKieJY93l5LXG
	8xahNyLMLIG4NlaWq5ZY3GsNA6lUHwQz2A5Rw5DbPhNwWHaumFVoAVFCgMl+O0xGDyom
	5knyhjhk+0+sEuGD08hqS7snvuRv5j9Jn2CaUQiDhsjoJFM5Z20JfKMCXHDKIjfYLq37
	8K9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=b1hC0Zcji/A1MItxWJQqFkRKiXxE50LeYj0LSuJ+I/U=;
	b=nSXe0qAsvnu83bazFDQzJFb/Tx1CiUqK52GZJrx2BK7WUKBUmjUdYod47pjO9kkCDM
	k4MxlzMKe0K0SFfCUwzvYWIPFQARrDPomS00VIK0zNrxk9+ZxFIJfEQ4DF9Gp5FiF/Bd
	4LsXH1caxXGPhmMwqA6941PLj0eN+tK0BCcQ9D72cqHWvGY1WUed/Kd2U/a9cbphY4Xm
	IzV5GzO8llTyVAlB0dwaqN8TBkAC0xDMxoCnae91eYWjWt4QvCv0AxQ4w1gxyFGqshi4
	J2vyGUaquAx3NhmokeylThqgm0buUFARwznWGZklt+Z36FBGr+S62/fv9AQhXSfjB6OG
	J+5w==
X-Gm-Message-State: AMke39nT+l3Hw91rJ8GmsCUI28NFbKfRNSXwsWEBckjOxCGJTK9l6nr83r1nNYar1eWNYhbX
X-Received: by 10.36.139.1 with SMTP id g1mr5055708ite.120.1487405031363;
	Sat, 18 Feb 2017 00:03:51 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DBB1.dip0.t-ipconnect.de. [93.232.219.177])
	by smtp.gmail.com with ESMTPSA id
	w77sm2272046ioi.20.2017.02.18.00.03.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Feb 2017 00:03:49 -0800 (PST)
Message-ID: <1487405026.13854.559.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, "Neri, Ricardo"
	<ricardo.neri@intel.com>
Date: Sat, 18 Feb 2017 09:03:46 +0100
In-Reply-To: <1487365991.4999.49.camel@linuxfoundation.org>
References: <cover.51e0eb88ea69468cf5a410aa7194c25cf61d57b7.1485530988.git-series.patrick.ohly@intel.com>
	<fe94df71a407adfc7082faff5bbe6441984a85d6.1485530988.git-series.patrick.ohly@intel.com>
	<1487365991.4999.49.camel@linuxfoundation.org>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 01/12] acpica: move from meta-oe to OE-core
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
X-List-Received-Date: Sat, 18 Feb 2017 08:03:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello Ricardo,

can you perhaps help?

I'm traveling next week and don't have much time.

Thanks, Patrick

On Fri, 2017-02-17 at 13:13 -0800, Richard Purdie wrote:
> On Fri, 2017-01-27 at 16:30 +0100, Patrick Ohly wrote:
> > From: Fathi Boudra <fathi.boudra@linaro.org>
> > 
> > qemu support for UEFI in OE-core depends on OVMF, which needs the
> > iasl
> > tools provided by this recipe. There's also an iasl recipe in
> > meta-luv, but than can and will be replaced by this one, thus
> > reducing
> > overall maintenance work.
> > 
> > Copied from meta-openembedded rev fa65be9ba (current master).
> > 
> > Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> 
> This fails on musl:
> 
> https://autobuilder.yocto.io/builders/nightly-musl/builds/160/steps/BuildImages/logs/stdio
> 
> |      ^~~~~~~~~~~~~~
> | i586-poky-linux-musl-gcc  -m32 -march=i586 --sysroot=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot -c  -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0=/usr/src/debug/acpica/20150515-r0 -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot-native= -fdebug-prefix-map=/home/pokybuild/yocto-autobuilder/yocto-worker/nightly-musl/build/build/tmp/work/i586-poky-linux-musl/acpica/20150515-r0/recipe-sysroot=  -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -D_CYGWIN -D_GNU_SOURCE -I../../../source/include -DACPI_ASL_COMPILER -I../../../source/compiler -Iobj -Wall -o obj/asllistsup.o ../../../source/compiler/asllistsup.c
> | ../../../source/compiler/aslfiles.c: In function 'FlOpenMiscOutputFiles':
> | ../../../source/compiler/aslfiles.c:595:45: error: invalid application of 'sizeof' to incomplete type 'FILE {aka struct _IO_FILE}'
> |              memcpy (stderr, stdout, sizeof (FILE));
> |                                              ^~~~
> | Copied obj/acpiexamples to ../bin/acpiexamples
> 
> Cheers,
> 
> Richard



