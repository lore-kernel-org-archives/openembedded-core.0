Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4949ECA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 11:49:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.14595.1757677765082530013
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 04:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=IKOLkWHA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 442391A0DCD
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 11:49:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1131060638;
	Fri, 12 Sep 2025 11:49:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B3BEB102F29C2;
	Fri, 12 Sep 2025 13:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757677762; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=on83Y0sI6MqE8QnAGGO21mXTOpYiz9/urxe+ZY0fhlk=;
	b=IKOLkWHA2lkeYYnN2ro81ysJpxsqqnRUIoF1nXzkA0tA4LEkD7r6eO7hQloVJMCo030Jkg
	McSWSB80nTJ1SJvWtmjNzB0qzgFmAhn4ApQHmAtW7Tf2Zh5X2mBySvcaIDdOta3FzDNW4f
	4JM3OKvHbRNlZv5ziH14pGt9fVgUgQZGqPW4OL0ZMghJfCjVbeQzxLJULXrMhgkMIJ733Y
	XeCLmtOGUnGDPFQfOGeKn/7qyWUZTSQanOe8aOABfxmJLz2QT+4VG1ZHYEQd1p9VawlHPM
	FCvqpSDHU6aPjzK8s+2PfMCOTRj7D3c/IIxH6Xs9yRwla0Se5hGVutwdQdGMng==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 13:49:19 +0200
Message-Id: <DCQSRJKXVV8H.2AMMZTE5FDBAB@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] vulkan-samples: update to latest revision
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250911211137.3678240-1-skandigraun@gmail.com>
In-Reply-To: <20250911211137.3678240-1-skandigraun@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 11:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223308

On Thu Sep 11, 2025 at 11:11 PM CEST, Gyorgy Sarvari via lists.openembedded=
.org wrote:
> Dropped 0001-SPIRV-SpvBuilder.h-add-missing-cstdint-include.patch,
> because the dependency it was patching (glslang submodule) has been
> removed by the project, so it became obsolete.
>
> Shortlog:
> Unify vkb::PhysicalDevice and vkb::core::HPPPhysicalDevice into vkb::core=
::PhysicalDevice<bindingType>
> Update Apple min deployment versions and iOS Simulator build config
> Add example for dynamic_rendering_local_read
> Add Slang and HLSL shaders to first set of samples
> Fix use of --width and --height by setting extent earlier
> Unify vkb::Instance and vkb::core::HPPInstance into vkb::core::Instance<b=
indingType>
> Remove vkb::filesystem::init() from astc to fix memory leak and batch mod=
e stability
> Update VVL version to 1.4.321.0 for Android
> Update NDK version to r28c for Android
> Fix variable descriptor count info not used in descriptor set creation
> Fix layer settings regression on Apple platforms for MoltenVK config
> Update shader interfaces to match sample's vertex input description
> Fix regression on iOS Simulator by including TargetConditionals.h in gui.=
h
> Add CMAKE_OSX_DEPLOYMENT_TARGET to macOS build docs and CI script
> Add possible Linux WSI options
> Unify vkb::Gui and vkb::HPPGui into vkb::Gui<bindingType>
> Remove submodule CTPL, replace its functionality by calls to std::async
> fix: fix the surface resize logic when use wayland wsi
> Implement simple cache for decoded ASTC textures
> Unify vkb::Device and vkb::core::HPPDevice into vkb::core::Device<binding=
Type>
> Port of latest changes in api sample hello_triangle to hpp_hello_triangle
> Fix crash in sample on android
> Improve and fix async compute sample
> Fix MacOS cmake build instructions
> Replace runtime shader compilation with offline compiled SPIR-V shaders
> Transcoded version of api sample hello_triangle_1_3 based on Vulkan-Hpp
> Unify vkb::RenderFrame and vkb::rendering::HPPRenderFrame into vkb::rende=
ring::RenderFrame<bindingType>
> Increase base version to Vulkan 1.1
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

It looks like vulkan-samples is used by the test_devtool_git_submodules
selftest, so it results in some error after this update:

2025-09-12 06:53:10,870 - oe-selftest - INFO - devtool.DevtoolUpdateTests.t=
est_devtool_git_submodules (subunit.RemotedTestCase)
2025-09-12 06:53:10,871 - oe-selftest - INFO -  ... FAIL
...
2025-09-12 06:53:10,872 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/devtool.py", line 1729, in test_devtool_git_submodules
    self._check_repo_status(recipedir, expected_status)
  File "/srv/pokybuild/yocto-worker/oe-selftest-armhost/build/meta/lib/oeqa=
/selftest/cases/devtool.py", line 135, in _check_repo_status
    self.fail('Unexpected modified file in line: %s' % line)
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: Unexpected modified file in line: ?? meta/recipes-graphics/=
vulkan/vulkan-samples/

Can you have a look at what is going on there?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


