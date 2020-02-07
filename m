Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7407160D36
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:09:29 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id w12so3782437wrt.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=Yz0MgB3C2Cr+GhtUuiuSFlFfbqK1dqZbz4I+q1ZgJbs=;
	b=OjqTFJMURbV6VM8xkL8A/bxcH9Mo7WK5GcamRpgr1hAwtIKfXHypTFscSwPKYqQ5M3
	LEpRIfFP7RQSvyV6tNwNnIX4vr88zZ9GNU7DgT0VXeanaQYPRpL8eDurYifgRewJ6tSp
	LfoDvfREnLka1SUQRRi8PIPTFSAh/GiQnomIU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=Yz0MgB3C2Cr+GhtUuiuSFlFfbqK1dqZbz4I+q1ZgJbs=;
	b=FaYu6NeaomUwQKqkjLW7M55RMekBR+h2mxZYDS2iNe8/AYXSSvM9ejWnjuJJW3waUY
	kUb4ycLrbNHg2GR2CC7LvyLx6AAvI+1DMUoAilIECROYfpFhHm00bGLaM3++6Zrcwesf
	2UVvceQvy2Y5zPyEwsnH12DQMv+JSkNcR0hKK/O0IEHCi71vK0DLn+IHUSWC3RzoSRi/
	HHWV7wK0Ur9BZ2PjsWN1Nkn2e9VheRN8yHLGEhpbFmDt4qjtV1vjIt676Q2Zb3etwj0s
	fwebLhKa8D+aSXvYZLs8To8PoYK6StHJ0h+DjxBPun5+BghYErIeYLjDWnYBlyIFc5vH
	Mx2g==
X-Gm-Message-State: APjAAAVpPR1bDaMV/2RINIUunSu21s7d8t40Z9tj6isd/gh/UwtHV+k/
	aBcJ4ufwyi9WRFEATDkWklrkeA==
X-Google-Smtp-Source: APXvYqwJA695HzwgrzxTBKVouazg0Km7kEgeAUsEoJL3s8WXKkbbxAiHu2FQ9XiufPA5rJ0xig9NLg==
X-Received: by 2002:adf:e683:: with SMTP id r3mr301307wrm.38.1581098970105;
	Fri, 07 Feb 2020 10:09:30 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	g25sm17572333wmh.3.2020.02.07.10.09.29
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 07 Feb 2020 10:09:29 -0800 (PST)
Message-ID: <396189a7541b8b73d5bfff4949d9873ab5079fd2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 07 Feb 2020 18:09:28 +0000
In-Reply-To: <20200205054120.1461132-2-raj.khem@gmail.com>
References: <20200205054120.1461132-1-raj.khem@gmail.com>
	<20200205054120.1461132-2-raj.khem@gmail.com>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] oeqa: autoreconf cpio before building
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
X-List-Received-Date: Fri, 07 Feb 2020 18:09:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-02-04 at 21:41 -0800, Khem Raj wrote:
> since the versions of autotools might differ in OE especially
> so recreate config.h.in, aclocal.m4, configure, and Makefile.in
> 
> [YOCTO #13779]
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
>  meta/lib/oeqa/sdk/cases/buildcpio.py     | 1 +
>  meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py
> b/meta/lib/oeqa/runtime/cases/buildcpio.py
> index 4bd72dd37e..9cc261c314 100644
> --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
>      @OEHasPackage(['autoconf'])
>      def test_cpio(self):
>          self.project.download_archive()
> -        self.project.run_configure()
> +        self.project.run_configure('','autoreconf --force;')
>          self.project.run_make()
>          self.project.run_install()
> diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py
> b/meta/lib/oeqa/sdk/cases/buildcpio.py
> index b0beafb38f..ec10149d34 100644
> --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> @@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
>              self.assertTrue(os.path.isdir(dirs["source"]))
>              os.makedirs(dirs["build"])
>  
> +            self._run("cd {source} && autoreconf --force")
>              self._run("cd {build} && {source}/configure
> $CONFIGURE_FLAGS".format(**dirs))
>              self._run("cd {build} && make -j".format(**dirs))
>              self._run("cd {build} && make install
> DESTDIR={install}".format(**dirs))
> diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py
> b/meta/lib/oeqa/selftest/cases/meta_ide.py
> index 809142559a..46398c7e2d 100644
> --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
>                          "
> https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
>                          self.tmpdir_metaideQA, self.td['DATETIME'],
> dl_dir=dl_dir)
>          self.project.download_archive()
> -        self.assertEqual(self.project.run_configure(), 0,
> +        self.assertEqual(self.project.run_configure('','autoreconf
> --force;'), 0,
>                          msg="Running configure failed")
>          self.assertEqual(self.project.run_make(), 0,
>                          msg="Running make failed")
> -- 
> 2.25.0

This breaks the SDK everywhere:

https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1552/steps/8/logs/step2c

(and many more)

Cheers,

Richard



