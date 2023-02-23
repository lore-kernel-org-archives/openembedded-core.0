Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 466D6C636D6
	for <webhook@archiver.kernel.org>; Thu, 23 Feb 2023 14:13:40 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web11.11375.1677161614355400172
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 06:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=GgXR+rof;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.178, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f178.google.com with SMTP id 132so5672109pgh.13
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 06:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JZoYTd8gumK6M2aKulYw8I64Mfv0mBjsTuu9bvNx8y4=;
        b=GgXR+rof2fvf0duov8we8LDsJu7OEtPTo27qXaxAyrA/Gbt/dudkQYSKyfZnbJ6QFF
         aM4kRO7ptHghTDDvgJ76rsNuItDyoHmhMqOk8uyvJmnvNJ4IYwj0AyfzOfp6ogWEapHi
         MmJ0W4l3/Ednje56U+hwu49YCUU2v48UwXDFh/8KK/nwfGa641VQdH76kV36TtB4Ik9K
         KzSrz3l77hdndc3//e8WI3RD9JtqEchsjdHJQ1CYNbp4gu996SXwNeNkecSyc5BC7rZ2
         ir5KhgrTMRYsP7xtfRN+ZhEhHlL1ahlAORyWePFgWn+WJNAou+5UOfsC/sp/HxOrfRev
         kZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZoYTd8gumK6M2aKulYw8I64Mfv0mBjsTuu9bvNx8y4=;
        b=7b+6OdMzHR1pefaW73RfNgRuV7k8O33X/8MTz2ZsKFug1Bg0dGcJ4ejSCY+ar7hhj2
         7WPSUADRteLPgGHKb6jc6uRYE3PWYj/t/EnjWSka/iupXpx0Rh7ZM5ZoOlnpPBxLSG2z
         nVkQgS2EIq5FL1tRV5yHtNh0q5uDWlBTwdJBoZls6/ExmK/MMFIhJjQXR2ZaFvUuSB/u
         GJ+yhJd6l9jlRp3/5rbl0DMTsUqwgATKm45JbkJR9WfCsxP2vYnB9oEQsBhqE8eW5Acl
         qmUGb20dFAaDm49xAl8T0n5pCFJFGhcCpWZxsZjUV5axdkXf/k/gTvj9ba9pZ+OZZ7xI
         6Csw==
X-Gm-Message-State: AO0yUKUUUOaQ053uJW+F1UxQqAalX6i8tBs9xAPDsYZrD/X63klIrjzi
	+BYmsAANAzu5uBRuILZl4EOLGk4FBmiBqvpBAw8=
X-Google-Smtp-Source: AK7set84OLK58Hn0cbq5flsvEx4b5cBj2OjpZFtqnuNLEsGOWmuNT8XmdIv+iA9jzaR4rC9UM4tVzQ==
X-Received: by 2002:aa7:9537:0:b0:590:7616:41eb with SMTP id c23-20020aa79537000000b00590761641ebmr11376121pfp.30.1677161612948;
        Thu, 23 Feb 2023 06:13:32 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id bm2-20020a056a00320200b005ac419804d5sm1645944pfb.98.2023.02.23.06.13.31
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 06:13:32 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/16] Pull request (cover letter only)
Date: Thu, 23 Feb 2023 04:13:26 -1000
Message-Id: <cover.1677161523.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Feb 2023 14:13:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177611

The following changes since commit daaee6fcb0d201f041678af433d8e1cd6f924d09:

  build-appliance-image: Update to dunfell head revision (2023-02-13 07:48:21 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (1):
  oeqa/qemurunner: do not use Popen.poll() when terminating runqemu with
    a signal

Antonin Godard (2):
  busybox: always start do_compile with orig config files
  busybox: rm temporary files if do_compile was interrupted

Hitendra Prajapati (1):
  git: CVE-2022-23521 gitattributes parsing integer overflow

Martin Jansa (1):
  meta: remove True option to getVar and getVarFlag calls (again)

Mikko Rapeli (1):
  oeqa context.py: fix --target-ip comment to include ssh port number

Omkar Patil (1):
  sudo: Fix CVE-2023-22809

Pawel Zalewski (1):
  classes/fs-uuid: Fix command output decoding issue

Richard Purdie (3):
  nativesdk: Handle chown/chgrp calls in nativesdk do_install tasks
  make-mod-scripts: Ensure kernel build output is deterministic
  libc-locale: Fix on target locale generation

Ross Burton (3):
  quilt: fix intermittent failure in faildiff.test
  quilt: use upstreamed faildiff.test fix
  git: ignore CVE-2022-41953

Steve Sakoman (1):
  qemu: Fix slirp determinism issue

Vivek Kumbhar (1):
  qemu: fix CVE-2021-3929 nvme DMA reentrancy issue leads to
    use-after-free

 meta/classes/fs-uuid.bbclass                  |   2 +-
 meta/classes/image.bbclass                    |   2 +-
 meta/classes/libc-package.bbclass             |   1 +
 meta/classes/license_image.bbclass            |   2 +-
 meta/classes/nativesdk.bbclass                |   2 +
 meta/lib/oeqa/runtime/context.py              |   4 +-
 meta/lib/oeqa/utils/qemurunner.py             |  11 +-
 meta/recipes-core/busybox/busybox.inc         |  27 +-
 .../git/files/CVE-2022-23521.patch            | 367 ++++++++++++++++++
 meta/recipes-devtools/git/git.inc             |   4 +-
 meta/recipes-devtools/go/go_1.14.bb           |   4 +-
 .../qemu/qemu-system-native_4.2.0.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2021-3929.patch             |  78 ++++
 meta/recipes-devtools/qemu/qemu_4.2.0.bb      |   4 +-
 meta/recipes-devtools/quilt/quilt.inc         |   1 +
 .../quilt/quilt/faildiff-order.patch          |  41 ++
 .../sudo/files/CVE-2023-22809.patch           | 113 ++++++
 meta/recipes-extended/sudo/sudo_1.8.32.bb     |   1 +
 .../make-mod-scripts/make-mod-scripts_1.0.bb  |   2 +-
 scripts/lib/devtool/menuconfig.py             |   2 +-
 scripts/nativesdk-intercept/chgrp             |  27 ++
 scripts/nativesdk-intercept/chown             |  27 ++
 23 files changed, 702 insertions(+), 25 deletions(-)
 create mode 100644 meta/recipes-devtools/git/files/CVE-2022-23521.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3929.patch
 create mode 100644 meta/recipes-devtools/quilt/quilt/faildiff-order.patch
 create mode 100644 meta/recipes-extended/sudo/files/CVE-2023-22809.patch
 create mode 100755 scripts/nativesdk-intercept/chgrp
 create mode 100755 scripts/nativesdk-intercept/chown

-- 
2.34.1


