Return-Path: <petr.vorel@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 052EF60593
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Feb 2020 06:46:57 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z15so5867185wrl.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 22:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-disposition:in-reply-to;
	bh=O5pYWs0i4dCMvtgoErFW60AExgpPEIv4nIDyqW4aBu8=;
	b=LIVz/xdA+Ao1XLswpWYjZ+W8YxkQyk6PsZVRZYxFEld3TFU/h6kpTnG04EqSnIIPBd
	6pUHx2Y+bi8RI2UF1lVFFzk71Jua3p1m+FGdbt0XMOUWOW/apQd5YOUTJwibeGNkvwwx
	1e7skcOp71jqLTs6Z+nqc73/wbcljY/5D/h2C8UcrhLPxgSQ5Lgwxnn7GTnZR4e3ii7h
	BBRWNgx/Zx2eGIk0I3dgzcDl/NNOH4IWapeKQfrSmZDTzwhtJxyetq7tO1ZsRLxV8dh7
	tjAXGkG3PFc9gHwHCjvYaz/Q+UmDYyTElmnqu7AO2NWJt5apaVDVEwiBbgyKO8mOx+Gr
	3gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-disposition:in-reply-to;
	bh=O5pYWs0i4dCMvtgoErFW60AExgpPEIv4nIDyqW4aBu8=;
	b=A3T+F3Hj8X0sj3Jc5pTVbUmcuhDlK2C2sWbNJuNX0aBXGDLJlmnADOj41ugQ87BZOO
	iLTA3L5qgIv9Ka1IAhRtKhZ81+lkK71rHkvPs45S6lNCPt2mKB3DunC5s0LNjgkzRJM5
	ZqbLVjQXtwHi39AGxJhB+bPz8UMHP5b8vYXEUOCoRv4Gc0ZIKeFoIKWepKbCVxwZNWuG
	xMFO4gE3ChgL5807IZE7pw1tyBtb+aYVEWYpMPXEkAXytnI6BzdWVs+N8NvoXfRpCw8g
	/107tn+Cz07CPi5HXAUlQiA4NTEpvcAwt+sbc3Zql4pbG8LMqJXnztNvGENPM1WvV/sR
	9ThA==
X-Gm-Message-State: APjAAAUDNgq8XVvlDW8gyepBHp+7jmNP1FZJGy522xOEiuOt+PE+3IaM
	LCrrElj3huTiXGnjJgcQcdM=
X-Google-Smtp-Source: APXvYqzIteWUQIseph+U74FgOTm15Vk3zE5oe/cyZ37XIKqEUtWMNzuzK7mnboHzLU+3ctLGRkgUQw==
X-Received: by 2002:a5d:55d2:: with SMTP id i18mr8682849wrw.287.1582958818651; 
	Fri, 28 Feb 2020 22:46:58 -0800 (PST)
Received: from x230 ([62.201.25.198]) by smtp.gmail.com with ESMTPSA id
	i8sm10140007wrq.10.2020.02.28.22.46.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 28 Feb 2020 22:46:57 -0800 (PST)
Date: Sat, 29 Feb 2020 07:46:56 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>
Message-ID: <20200229064656.GA4045619@x230>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <20200228175731.10604-1-petr.vorel@gmail.com>
	<e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <e64730b1908726a7e8ca4dd5e27b0f7567dd0a57.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v5 1/2] ltp: Update to 20200120
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
X-List-Received-Date: Sat, 29 Feb 2020 06:46:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Richard, Khem,

> > Changes v4->v5:
> > * Put back 0002-kernel-controllers-Link-with-libfts-explicitly-on-
> > mu.patch
> > as it still needed on MUSL (although it should not be needed,
> > strange).
> > Reported by Anuj Mittal

> I'm sorry to say that this still isn't quite right for musl:

> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/1634
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1630

> Still having the fts issue :(
OK, step1b is still problematic:
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3224: undefined reference to `fts_read'
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3224: undefined reference to `fts_read'
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3269: undefined reference to `fts_close'
/home/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/core2-64-poky-linux-musl/ltp/20200120-r0/recipe-sysroot-native/usr/bin/x86_64-poky-linux-musl/../../libexec/x86_64-poky-linux-musl/gcc/x86_64-poky-linux-musl/9.2.0/ld: /usr/src/debug/ltp/20200120-r0/git/testcases/kernel/controllers/cpuset/cpuset_lib/libcpuset.c:3277: undefined reference to `fts_close'

At least we know, that once we solve this problem, we can remove
0002-kernel-controllers-Link-with-libfts-explicitly-on-mu.patch

Please, how to reproduce this build locally? Is it:
. oe-init-build-env
TCLIBC=musl bitbake ltp

Or do I need to put something into config files conf/local.conf
or conf/bblayers.conf ?

I need to double check if musl-fts is really built and whether the order of
-lfts is correct. But all this has been solved even for static build for Buildroot,
so I guess it's some issue related to openembedded. Unfortunately, I'm not much
experienced in openembedded (stepped in, because nobody else has updated LTP
package yet).

Khem, any idea, what can be wrong?

Kind regards,
Petr

