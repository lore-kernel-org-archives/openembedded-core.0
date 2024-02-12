Return-Path: <baruch@tkos.co.il>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80081C48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 14:24:09 +0000 (UTC)
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by mx.groups.io with SMTP id smtpd.web11.7506.1707747840144405304
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Feb 2024 06:24:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tkos.co.il header.s=default header.b=aCfOnhNu;
 spf=pass (domain: tkos.co.il, ip: 84.110.109.230, mailfrom: baruch@tkos.co.il)
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id B758B440865;
	Mon, 12 Feb 2024 16:23:21 +0200 (IST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1707747801;
	bh=S4ja6xJXhxq1XRXxXXfmAZ+7q+G0u1uGd9c7SlPc7TQ=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:From;
	b=aCfOnhNuKvIlvOLiTMPWTj0Z6UxiQePXY4CT0Qz0FCyn7WAK7fTp0MheZBwH794Du
	 HKQBhXVgc92GxKCrQcHtHm39qqG/WhLFYSj4OtQrIDiouCdHX6XB54t3vLYa9DVA2U
	 88FUMBCItrgXM2uI2PrtaX9H/AIu8nUsBtevwcn1kVnPwSh3b3D9Bil6ahHxATOtgz
	 XGSk906AsVM6KL+jPyDGCCz7zJl+5P5F4hcSKpSoeHKjhcjZFzyEzjFZ6xYlknvAtd
	 zz8MdAIdsPHglR0KSyJbolXYWTq7SMiw0500RE1vlBmCuc548k+xLuBuwbdPj4mbfj
	 4Piga81/HUhWg==
References: <391a7b90f3cb6a7b276904b69a2251bf0d3849c9.1707376966.git.baruch@tkos.co.il>
 <5066577e-7447-4f4f-8212-7729a3ada8ba@gmail.com> <87cyt35dcy.fsf@tarshish>
 <33d0888f-281c-4bc1-8a03-3bc3fcd182d6@gmail.com>
User-agent: mu4e 1.10.8; emacs 29.1
From: Baruch Siach <baruch@tkos.co.il>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] overlayfs-etc: take read-only-rootfs into account
Date: Mon, 12 Feb 2024 16:21:02 +0200
In-reply-to: <33d0888f-281c-4bc1-8a03-3bc3fcd182d6@gmail.com>
Message-ID: <87o7cl3gn7.fsf@tarshish>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Feb 2024 14:24:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195335

Hi Slava,

On Sun, Feb 11 2024, Vyacheslav Yurkov wrote:
> On 11.02.2024 14:23, Baruch Siach wrote:
> Use this command:
> oe-selftest -r overlayfs.OverlayFSEtcRunTimeTests.test_sbin_init_preinit
>
> Check also this link https://wiki.yoctoproject.org/wiki/Oe-selftest and prepare your environment first

I reproduced the test failure. The output does not give much of a clue
as to the cause of failure. How can I run the same qemu command
interactively? Is qemu test console output saved somewhere? This log
might be useful.

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

