Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06054C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 22:50:47 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.26093.1702075838855889188
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 14:50:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I8nXCBXF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8771860003;
	Fri,  8 Dec 2023 22:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702075836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KT1YGEXrIDbIt9GUgGroOEUd6AR+vNSXAmdJ99+O40I=;
	b=I8nXCBXFsHT9ujs0Gh1uylx8g/kHz+jiJ17BCalIzLJ97mNFBFwSZrUFt2vwjo6bd2poiq
	RMNWvms9RMtOr++5r9w87dgMiagYkpDUqUcBYx3U5B6c8lGQGr+qReg2LAT8IUlYHCkov0
	T37zY8K2boRPE4KeGjbXMIgJrUF18AQT5SyBeoowdYx1FzK5T8W5oAswNw7Wdb++wv0IgZ
	t5g1C9wsf9tbtPRGNjbqPGZkGVrF4JSmsn2cIJi6cbDK51zJo3h9pkXLFOEOOCWQkFYZhC
	kGqkSqQuwN/ArJoQUrmlVyLfNDjRro9X9Jyatd0b7tCMi6gPQHUrZksBIZOFXQ==
Date: Fri, 8 Dec 2023 23:50:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/6] Add 'maturin' python backend support
Message-ID: <20231208225036585d7237@mail.local>
References: <cover.1701989368.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1701989368.git.tim.orling@konsulko.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 22:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192085

Hello Tim,

I got this failure, can you check?

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6166/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6159/steps/14/logs/stdio


2023-12-08 22:03:18,822 - oe-selftest - INFO - FAIL: recipetool.RecipetoolCreateTests.test_recipetool_create_python3_pep517_maturin (subunit.RemotedTestCase)
2023-12-08 22:03:18,822 - oe-selftest - INFO - ----------------------------------------------------------------------
2023-12-08 22:03:18,823 - oe-selftest - INFO - testtools.testresult.real._StringException: Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/recipetool.py", line 698, in test_recipetool_create_python3_pep517_maturin
    self._test_recipe_contents(recipefile, checkvars, inherits)
  File "/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/lib/oeqa/selftest/cases/devtool.py", line 178, in _test_recipe_contents
    self.assertEqual(missingvars, {}, 'Some expected variables not found in recipe: %s' % checkvars)
  File "/usr/lib64/python3.11/unittest/case.py", line 873, in assertEqual
    assertion_func(first, second, msg=msg)
  File "/usr/lib64/python3.11/unittest/case.py", line 1172, in assertDictEqual
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib64/python3.11/unittest/case.py", line 703, in fail
    raise self.failureException(msg)
AssertionError: {'SRC_URI': 'https://files.pythonhosted.or[586 chars]238'} != {}
Diff is 656 characters long. Set self.maxDiff to None to see it. : Some expected variables not found in recipe: {'SRC_URI': 'https://files.pythonhosted.org/packages/64/26/cffb93fe9c6b5a91c497f37fae14a4b073ecbc47fc36a9979c7aa888b245/pydantic_core-${PV}.tar.gz', 'SRC_URI[md5sum]': '1eb13c211147496c1c9484ff7f8ac438', 'SRC_URI[sha1sum]': '0803a731aa793f3eaf4d52f656d7300408ca0b36', 'SRC_URI[sha256sum]': '6d30226dfc816dd0fdf120cae611dd2215117e4f9b124af8c60ab9093b6e8e71', 'SRC_URI[sha384sum]': 'cca6d9f0ba72ff92e16aaf3d6c628b8df33bdf244cc39c9d59cff9d541f35d4e87ec136e60e4b040ad73c5c69b27cec6', 'SRC_URI[sha512sum]': 'e6c3081dfa58d9b59f8c33dfe80712d732ac3048a2f8240f9a0f5448d9bfc83e222c1e08b8bb49779b84f685c3bec3060cc935c113a818b1ab8aa955f3df2238'}




On 07/12/2023 15:13:17-0800, Tim Orling wrote:
> We are increasingly seeing Rust extensions for Python added in the
> ecosystem. The current best practices approach has moved from using
> 'setuptools-rust' to using 'maturin'.
> 
> * Add python3-maturin, including 'native' and 'nativesdk' support.
> * Add a 'python_maturin' bbclass for the PEP-517 backend.
> * Add recipetool support for the 'maturin' PEP-517 backend.
> * Add a very basic 'maturin list-python' smoke test added to oeqa for
>   both 'runtime' (-c testimage) and 'sdk' (-c testsdk).
> 
> The following changes since commit 70ad9b9b309575134834757468cb32c9e3b87448:
> 
>   bitbake: hashserv: sqlite: Ensure sync propagates to database connections (2023-12-04 22:36:09 +0000)
> 
> are available in the Git repository at:
> 
>   https://git.yoctoproject.org/poky-contrib timo/maturin_1.3.2
>   https://git.yoctoproject.org/poky-contrib/log/?h=timo/maturin_1.3.2
> 
> Tim Orling (6):
>   python3-setuptools-rust: BBCLASSEXTEND + nativesdk
>   python3-maturin: add v1.3.2
>   classes-recipe: add python_maturin.bbclass
>   recipetool: add python_maturin support
>   oe-selfest: add maturn runtime (testimage) test
>   python3-maturin: add sdk (testsdk) test case
> 
>  meta/classes-recipe/python_maturin.bbclass    |  17 +
>  meta/conf/distro/include/maintainers.inc      |   1 +
>  meta/lib/oeqa/runtime/cases/maturin.py        |  23 +
>  meta/lib/oeqa/sdk/cases/maturin.py            |  33 +
>  meta/lib/oeqa/selftest/cases/recipetool.py    |  34 ++
>  .../python/python3-maturin-crates.inc         | 572 ++++++++++++++++++
>  .../python/python3-maturin_1.3.2.bb           |  40 ++
>  .../python/python3-setuptools-rust_1.8.1.bb   |   2 +-
>  .../lib/recipetool/create_buildsys_python.py  |   1 +
>  9 files changed, 722 insertions(+), 1 deletion(-)
>  create mode 100644 meta/classes-recipe/python_maturin.bbclass
>  create mode 100644 meta/lib/oeqa/runtime/cases/maturin.py
>  create mode 100644 meta/lib/oeqa/sdk/cases/maturin.py
>  create mode 100644 meta/recipes-devtools/python/python3-maturin-crates.inc
>  create mode 100644 meta/recipes-devtools/python/python3-maturin_1.3.2.bb
> 
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191981): https://lists.openembedded.org/g/openembedded-core/message/191981
> Mute This Topic: https://lists.openembedded.org/mt/103045095/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

