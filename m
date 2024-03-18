Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A56C54E58
	for <webhook@archiver.kernel.org>; Mon, 18 Mar 2024 13:20:05 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.44040.1710767998374390595
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Mar 2024 06:19:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AK2oerGZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d46dd5f222so47951761fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710767996; x=1711372796; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ltq61nv3ZUOnePteRuBUQkM88IWivvIDwzub7/dU93E=;
        b=AK2oerGZR4+wcp3ogYRwo0A8eYKElQUz66EvKgNWc2QxTXAc+93vu2gP5ApQgMTmH3
         ZuR+tEPwBW1tK8XjMs18ubICTrehUBgfYOVldELmzCKFveeBJOK+VnKGUm4LnmUUVmxt
         LAuT8Oo54Yity6SaXqklkWNGgCzOsbRLl9evPE8ZB/L1uCldeSEk3FXqHcB/b2wUOiZw
         cInjeFase1urgvOUXgHfqCZtPfEAPHnPgkKQenbMoL1RAt6H5VPiLPeahchsaNIBr7Fm
         fGfwA5ZFcnI3tCGmsK4FcXZ6RcKLgPlvEJ8wT234Yz+HZVJ76ixWb9RJMIbFI3mi3Unc
         s9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710767996; x=1711372796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ltq61nv3ZUOnePteRuBUQkM88IWivvIDwzub7/dU93E=;
        b=UZgQa9fHw9T+DILOy2FVw9y/Jqn7UvjRLC9raJiXhzIIK1OkScjwrcvDVr/fdEh3sS
         9dU5uO6w28HWDMIWhw/y7pKE+tg+PuvYT/ARsrmUvXb2nk9POCWbsee0Q2YzVRkJ1Y4b
         mGW7TEkJPEDYq8D9AH6EtSsjJ4qOOOvGigFcfOqFq5nFMWYW+F1SnIttxgVs57h3Dr0+
         Gtvcvd30Rnc6iQAgROvVmlyT+jkGVLI8X5LrgOghcedagVgK2RH1DSKZg6pCpTxDFJ5v
         sxDH3w2JA30nal93Wio4q0XFolN3khV927w+uPCbh5a5wF+pZn/1FlN1Ok8I6s1X3bLH
         SC2Q==
X-Gm-Message-State: AOJu0Yx5x9RK5IngY5mkZd4M0yGYB5mX/WabR2RMgbCL5bvHM1Bj3eCo
	DKPAWZ7xq+usB8HyfGw7d+IAK7NSHTc3yg0JJEAtKRnPUFn+a0rsb/tBUi136scktgu9MqqnYhr
	xRaUeufFIqTLiMn1xgHbiCF/BEHk=
X-Google-Smtp-Source: AGHT+IHOZHF3Ko0y126RSkJjz/aeJJBwSPjXLfMkL4CwGk8V3Q+Wxl5eA4KAbjwLxHxkDbyuW5etEmDVo87L9z8iqqs=
X-Received: by 2002:a2e:9243:0:b0:2d4:a041:874d with SMTP id
 v3-20020a2e9243000000b002d4a041874dmr3212407ljg.48.1710767996283; Mon, 18 Mar
 2024 06:19:56 -0700 (PDT)
MIME-Version: 1.0
References: <f53c085e-3d24-42d3-ba62-e1c543311dd1@bootlin.com>
In-Reply-To: <f53c085e-3d24-42d3-ba62-e1c543311dd1@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Mar 2024 14:19:45 +0100
Message-ID: <CANNYZj8KxPxPxmLDQrOgMAXo8csysaz6u4Upd07=MCv23M9D9g@mail.gmail.com>
Subject: Re: [OE-core] Call for contributions to the 5.0 release notes
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Mar 2024 13:20:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197306

So I have looked through my commits over the past year that
*definitely* need documenting, and identified these standouts:

- https://git.yoctoproject.org/poky/commit/?id=63e53fb8b60d38315015844bd3357fa1649cd639
"build-sysroots: target or native sysroot population need to be
selected explicitly"
Easy fix to existing docs, will send asap.

- https://git.yoctoproject.org/poky/commit/?id=2187e823ad66eaaee6a4ed7d748f2c68028a45e7
"selftest/sstatetests: add tests for 'bitbake -S printdiff'"
This functionality needs to be documented; a review of whether there's
something for bitbake-diffsigs (which is related) is also needed. I'll
do this after the first item.

 - https://git.yoctoproject.org/poky/commit/?id=6f29e2319cf8f6124de4998e887efab90bc63ba4
"meta/conf/templates/default/conf-summary.txt: add a template summary"
Needs to be documented everywhere where config templates or config
template descriptions are mentioned. Also on todo list.

- https://git.yoctoproject.org/poky/commit/?id=c390b2e615930b60db0d7f3e72d056e0c67ef5bc
"oe-setup-build: add a tool for discovering config templates and
setting up builds"

This was added to master very recently and documenting it is pending
an important fixup:
https://patchwork.yoctoproject.org/project/oe-core/patch/20240305073749.4133403-1-alex@linutronix.de/
which I hope lands in master soon, but for some reason isn't in master-next.

Alex



On Fri, 15 Mar 2024 at 09:12, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
>
> Greetings,
>
> If you contributed new features to the upcoming release, or if you are
> interested in figuring out what's new in 5.0, that would be great if you
> could help us by submitting bits of release notes about them too.
>
> If you are familiar with the Sphinx / ReStructured Text format, you can
> directly send patches against the yocto-docs "master-next" branch
> (https://git.yoctoproject.org/yocto-docs/log/?h=master-next). However,
> I'm also happy to accept raw text as well and format it or even
> elaborate on it by myself.
>
> We may also need proper documentation for the new features, not only
> release notes. I am thinking about documenting the new variables in
> ref-manual/variables.rst, for example.
> Thanks in advance
> Cheers
> Michael.
>
> --
> Michael Opdenacker, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197128): https://lists.openembedded.org/g/openembedded-core/message/197128
> Mute This Topic: https://lists.openembedded.org/mt/104943580/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

