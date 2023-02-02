Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E590CC636D3
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 12:16:05 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web10.13074.1675340162578432578
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Feb 2023 04:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XgCH58yc;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id b14so1682012ljr.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=I3LZtcMcEJh+IDsEAuzoKQeSvhVh/NUc+fmoKFAI4lk=;
        b=XgCH58ycorE5113J8ejk4G/2CXNdG0gbPPYRggwcN4rMWw9f63/mYyiFfiYQtDyaid
         zIdt8sgZbmB8Kxu70teHxQvALCQ/6dq0nToXoMlT7uNE2OPiaWQfrHD2gXixRW8Ujaes
         mKy1RL5fOBMjddYNj2wW7OO1gfuWvcPigv6mDH6/JNnysMuYtqO6o72OpSWWbaHWF4oE
         B29WlImB38bNX8YGKltW1J1BqNYjUMSUQlQ6DVK2g7CDlN9vnYKCjiJ1G84BuGDUfoUA
         DSKgc1akARLVy4+P1UESbpoPfc1UpWX2ssGYE1LZ4WsXYIq3JWTzUsMIRfb3NJm0kGFV
         uqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I3LZtcMcEJh+IDsEAuzoKQeSvhVh/NUc+fmoKFAI4lk=;
        b=1QfcT49lSfnn/S9mmfDH4seyJsX1Nq867Nsk4sbi/HTTOhj1ijBDJ4kADOzx8V0h9D
         rD8nymW4KxrKUM3jYpOBp+T2f42V75WQ7tcIvFOM3FNMKP60pBwotoQoPr5o+994xW5x
         rzBuAz1bCnVOZggveyXOYLfMJNkUYS8ZUTHPgg97YxZ0C3OwzeNKT/aMZm3ndmL+JIaQ
         GHIbY0IhbansqbSNqJvxfPb5EVON/ZQydK5LsgvONOs5EF8OE9MQcfhF1raN6Lkr7f/A
         GWcV+q+461N03/yibl8i/XDqRzWL+HCXumH6ySNLt6z9WpoYW9gSmK8v64de4ZSvb4F1
         rrGQ==
X-Gm-Message-State: AO0yUKVdgTxEx9T4g5Vqimw0yaL5pPr/og0hqnuSnzlDy13IWOO+ut2z
	eXCfu9ZBLC9i0jk9o1Ok+iu0WeTbVvMJgF1pdEa1rVFk
X-Google-Smtp-Source: AK7set/nGG7h4WqpYeFXRi03o1rs/xXwadFaOxPR1ubW7MqF1hDg8CWXglXZRs+TBgMPF35e5gWiGgvao5iNzo8Kam8=
X-Received: by 2002:a2e:b5a4:0:b0:28f:7d5c:4507 with SMTP id
 f4-20020a2eb5a4000000b0028f7d5c4507mr866672ljn.162.1675340160823; Thu, 02 Feb
 2023 04:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
In-Reply-To: <20230202080219.3465767-1-wuxiaotian@loongson.cn>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 2 Feb 2023 13:15:48 +0100
Message-ID: <CANNYZj_-8sWxdsR9h+vsEB3s-dV7c++YAR1HZhbG5y6d1OG3uQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v1 0/5] Add support for LoongArch
To: Xiaotian Wu <wuxiaotian@loongson.cn>
Cc: openembedded-core@lists.openembedded.org, chenjiping@loongson.cn, 
	zhuqizheng@loongson.cn
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Feb 2023 12:16:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176693

Thank you, the patches overall seem fine; I only added a couple of
small comments that should be easy to address.

Alex

On Thu, 2 Feb 2023 at 09:02, Xiaotian Wu <wuxiaotian@loongson.cn> wrote:
>
> LoongArch is a new architecture, already supported by linux-6.1, gcc-12, I want to add support to openembedded.
>
> These patch sets add basic support, and it can run cross-compile on on x86_64.
> The next step is to add support for yocto repositories, such as yocto-kernel-cache.
>
> Please review these patches, thanks.
>
> Xiaotian Wu (5):
>   base: add support for loongarch64
>   linux: add loongarch64 support
>   binutils: disable gold on loongarch64
>   loongarch: disable seccomp from default feature
>   uboot: loongarch64
>
>  meta/classes-recipe/kernel-arch.bbclass       |  2 ++
>  meta/classes-recipe/siteinfo.bbclass          |  4 +++
>  .../distro/include/default-distrovars.inc     |  3 ++
>  meta/conf/machine-sdk/loongarch64.conf        |  2 ++
>  .../include/loongarch/arch-loongarch.inc      |  7 ++++
>  .../include/loongarch/qemuloongarch.inc       | 35 +++++++++++++++++++
>  .../include/loongarch/tune-loongarch.inc      | 13 +++++++
>  meta/conf/machine/qemuloongarch64.conf        | 11 ++++++
>  meta/conf/templates/default/local.conf.sample |  1 +
>  meta/lib/oe/elf.py                            |  2 ++
>  meta/recipes-bsp/u-boot/u-boot-tools.inc      |  1 +
>  meta/recipes-devtools/binutils/binutils.inc   |  5 +--
>  meta/recipes-devtools/meson/meson_1.0.0.bb    |  2 ++
>  meta/recipes-devtools/qemu/qemu.inc           |  2 +-
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
>  meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  4 ++-
>  meta/site/loongarch64-linux                   | 11 ++++++
>  scripts/lib/wic/canned-wks/qemuloongarch.wks  |  3 ++
>  scripts/runqemu                               |  4 ++-
>  19 files changed, 108 insertions(+), 6 deletions(-)
>  create mode 100644 meta/conf/machine-sdk/loongarch64.conf
>  create mode 100644 meta/conf/machine/include/loongarch/arch-loongarch.inc
>  create mode 100644 meta/conf/machine/include/loongarch/qemuloongarch.inc
>  create mode 100644 meta/conf/machine/include/loongarch/tune-loongarch.inc
>  create mode 100644 meta/conf/machine/qemuloongarch64.conf
>  create mode 100644 meta/site/loongarch64-linux
>  create mode 100644 scripts/lib/wic/canned-wks/qemuloongarch.wks
>
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176676): https://lists.openembedded.org/g/openembedded-core/message/176676
> Mute This Topic: https://lists.openembedded.org/mt/96696073/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

