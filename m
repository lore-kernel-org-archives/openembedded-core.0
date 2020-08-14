Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.74.1597442774056388654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2020 15:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JHTcGQwO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id y3so9575853wrl.4
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2020 15:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=TTpR1yhskdUW5tmfUuL0PEx496JYognFfL7MNaI0VTY=;
        b=JHTcGQwO/vSpAFXoXmMwYVTWg0zWzvmm2tRsEorOM20U1ciX4oUaSKQeWHHkClQvLi
         +rIg4YbswSFmdmgXc8Y3Lwk9fSRQ8YM9VUJCW713PFvnWeqQfrx6GX3yfpHotWNAwuhB
         jNEhP1HbdphHeMH0It/vPR4LMpK0tFobmno6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TTpR1yhskdUW5tmfUuL0PEx496JYognFfL7MNaI0VTY=;
        b=MD5UJ8K9FDyhzAfNXNqtHd9IK0vh2zOx7S2/oIcUyWUTF2OqqSyKm7jRSmKzW40oCx
         UA7+l090smOTvOLIxMFi2fiaJQbYNIG6Y7lGmlzOX3nt0XMJAN/vRnHupBaOZh0HBxli
         a6SJAl7j9gpawXkZvBPG0Cqmkhnsi1weokS8clcSC7ttLXSMFy0ufgKjQi0YgymbWosF
         vry67rPDwxsqe1LqqxAn0k4FG3XzgETaJLlEOtUu61A5i44u+liHWYaHQ+4f89sXRuHc
         1HsH/orQMqBhOYP48gOXaM+yKX1VkicXIEanP646am4NnlQBRm7rOHRbk1dDvwkd2whg
         3GxA==
X-Gm-Message-State: AOAM5324ih0i4z6kMRuj+zXGHCjEaZgUHC7/dap5mVV65z9/gaq06lC0
	ZPdi7hlR9AhLdVpZb++uhkn/og==
X-Google-Smtp-Source: ABdhPJyOG9ekuGoKt5zKstGNloq73YRfqbRZR8F0OZzEVC9ZAPssmk7/yfRgSQnVvCVEa3IombL99Q==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr4258911wrq.407.1597442772526;
        Fri, 14 Aug 2020 15:06:12 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.2.b.8.e.7.7.2.a.f.d.7.4.c.d.e.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:edc4:7dfa:277e:8b29])
        by smtp.gmail.com with ESMTPSA id n5sm17436976wrx.22.2020.08.14.15.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2020 15:06:11 -0700 (PDT)
Message-ID: <ccc06ed3053f5c8fb7f64ec50320d494376f4e4b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V3 2/2] libubootenv: uprev to v0.3
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, Ming Liu <liu.ming50@gmail.com>
Cc: Patches and discussions about the oe-core layer
	 <openembedded-core@lists.openembedded.org>, Adrian Bunk <bunk@stusta.de>
Date: Fri, 14 Aug 2020 23:06:09 +0100
In-Reply-To: <CAMKF1soXJ0Jm_WzUYCKhNyaE-eAHg9jG4OEemTSaLu7u5t-SSQ@mail.gmail.com>
References: <20200814092914.4160-1-liu.ming50@gmail.com>
	 <20200814092914.4160-3-liu.ming50@gmail.com>
	 <CAMKF1soXJ0Jm_WzUYCKhNyaE-eAHg9jG4OEemTSaLu7u5t-SSQ@mail.gmail.com>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2020-08-14 at 13:12 -0700, Khem Raj wrote:
> for qemumips I am still seeing
> 
> 00:01:59.669 WARNING: No bb files in default matched
> BBFILE_PATTERN_odroid-extras
> '^/mnt/jenkins/workspace/yocto-world-glibc/sources/meta-odroid/meta-odroid-extras/'
> 00:02:03.245 ERROR: Nothing RPROVIDES 'u-boot-default-env' (but
> /mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> RDEPENDS on or otherwise requires it)
> 00:02:03.534 ERROR: Nothing RPROVIDES 'libubootenv-dev' (but
> /mnt/jenkins/workspace/yocto-world-glibc/sources/openembedded-core/meta/recipes-bsp/u-boot/libubootenv_0.3.bb
> RDEPENDS on or otherwise requires it)
> 00:02:03.534 No eligible RPROVIDERs exist for 'libubootenv-dev'

Its also breaking sstate testing:

"oe-selftest -r sstatetests.SStateTests.test_sstate_sametune_samesigs" 

causing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1248/steps/8/logs/step2d

2020-08-14 19:36:15,406 - oe-selftest - INFO - sstatetests.SStateTests.test_sstate_sametune_samesigs (subunit.RemotedTestCase)
2020-08-14 19:36:15,407 - oe-selftest - INFO -  ... FAIL
2020-08-14 19:36:15,407 - oe-selftest - INFO - 9: 38/38 378/414 (153.36s) (sstatetests.SStateTests.test_sstate_sametune_samesigs)
2020-08-14 19:36:15,407 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/lib/oeqa/selftest/cases/sstatetests.py", line 449, in test_sstate_sametune_samesigs
    self.assertCountEqual(files1, files2)
  File "/usr/lib64/python3.6/unittest/case.py", line 1200, in assertCountEqual
    self.fail(msg)
  File "/usr/lib64/python3.6/unittest/case.py", line 687, in fail
    raise self.failureException(msg)
AssertionError: Element counts were not equal:
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_write_rpm.sigdata.05d757878a1583dd222357a916105e1723de0b287d61d4d217953102ef4b6710'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_qa.sigdata.d5d478843b014fcf9715070611562e969b0ebf37e49b284509293a5956d3544b'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_package_qa.sigdata.f8638f649c6aebeda30a11f6d2e9379c7e389ded8b84f6b5b57fa36c18868bfb'
First has 1, Second has 0:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_package_write_rpm.sigdata.f74b2e6332d343f4800eefa823f0462649a549edd90c2c671f623493f9598756'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_qa.sigdata.a60efa593fff1e0ed60834ecd0fb7f20b94a9534bb66e1b5fd968aca5a9eb831'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/core2-32-poky-linux/libubootenv/0.3-r0.do_package_write_rpm.sigdata.b7097c279aba4be43e13e35cfeccc331bdf11dc2d6240da12430c953926796b1'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_package_write_rpm.sigdata.0cd26580e083cbf8ac677e1deb8cbfa1c4ef4c35e29b2ea2bb61282b48cda68a'
First has 0, Second has 1:  '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-3335289/tmp-sstatesamehash/stamps/x86-pokymllib32-linux/lib32-libubootenv/0.3-r0.do_package_qa.sigdata.89a10fd2c56db51620a1b5492a894abacb4b38e9eee8ba05fe70f4ca46278ccd'

Cheers,

Richard

