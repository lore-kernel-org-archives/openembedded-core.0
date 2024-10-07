Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 871EDCFB43C
	for <webhook@archiver.kernel.org>; Mon,  7 Oct 2024 03:24:20 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.45175.1728271451589811441
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Oct 2024 20:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nthWXzoZ;
 spf=pass (domain: gmail.com, ip: 209.85.161.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5e5568f1baaso2089160eaf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 06 Oct 2024 20:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728271451; x=1728876251; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F5QAZUbEvOftktNIqOCcnVDwGZ+f9u7s/cmEfA0BKTM=;
        b=nthWXzoZT4xb34TQl7HkhoiKfQIjkidIEY8OpzxUlwsG+Sp6fhQdfrAu2ZrVGN4sUA
         zN7KLjeDzcA9yZcayIY81Te4nf0Hvif0wldwcBnEniIsMsZyeFdF6R9qd6vXn+iPLm81
         2XHRGkjMHwVpRTEpj1ttkvpO7Rlwb4IUN1W2kHV2koKw5CqNjRzYhmBC1Zd4106X8BYD
         N2XFL427OOhZEcNZDu1YA0a4/0h1z6VfE2rwvZrPnJt3f+wkXi1S0HtKqM1wboP/kj5I
         OfBI34ya2rmX9IZhHS1cE7GVDFgxnlR0vVrhlPq7ngcFcndRUspFL85woPmJn65ZSEqZ
         /8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728271451; x=1728876251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F5QAZUbEvOftktNIqOCcnVDwGZ+f9u7s/cmEfA0BKTM=;
        b=fgIYXnrWsNtSjANU7rrzefdrRswWQrbtASkW0NYJfl9AIjEsv6Q3rVLwH2dEuaapwS
         asTOv/OstOgIU+PPkRldsyzSko4zaAzJsP1NHNJzvGk+3ie+GeDCGqb6PTsWiyVTZnT8
         tNS2JbWjO0zeBZy6MfqAc4Tezt3XA4REqeReNcRH1jy0xAunj0MWniIrwrAhWPed/9KL
         F70LyBMUkH07S2B/HGXNXvDVaO4BZVR19/Jz4kdKegQf9WzGEcEmMfrSOBhmeX2IRDe4
         +AlMcNKaV2VV+c4m5XAFNBB52QNIke2n4FxcyKUVzBUEuWRHf5BDeyl64N5fwdVqKR7S
         9NYg==
X-Gm-Message-State: AOJu0YxRVXUekZzBXgRLoPiWVmVASaEtk3FmHwtJx1GhgKHi22jHkFV4
	fL/7klV+Wn4SVWjKCC6hG+1fm359qmH+Z7ryGcAsp612gdf43cGZqTXswD+I035yd8rKlBwCSqk
	sK+UnxnTDLDojYi6rq3thwKr2DWg=
X-Google-Smtp-Source: AGHT+IFKkknyZB8s5Pv6hnkLekncF50xMfLKm2RXtGEZwinhwN9fOR85mQGeuzFpDLjEWaMrnYbJorlp8sW8xjMAWUE=
X-Received: by 2002:a05:6870:3041:b0:278:222c:98c4 with SMTP id
 586e51a60fabf-287c1eba0d8mr7440900fac.21.1728271450698; Sun, 06 Oct 2024
 20:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1728266000.git.steve@sakoman.com>
In-Reply-To: <cover.1728266000.git.steve@sakoman.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Oct 2024 20:23:44 -0700
Message-ID: <CAMKF1srca3ScY1Bkq0iqZNVH4AJF6mYRcn3ysdnPX2P+mK-tgA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap 00/10] Patch review
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Oct 2024 03:24:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205259

series looks ok to me.

On Sun, Oct 6, 2024 at 6:55=E2=80=AFPM Steve Sakoman via
lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
wrote:
>
> Please review this set of changes for scarthgap and have comments back by
> end of day Tuesday, October 8
>
> Passed a-full on autobuilder:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7374
>
> The following changes since commit 3d894863f442188bad446095bd7fdd82665bb5=
4b:
>
>   makedevs: Fix issue when rootdir of / is given (2024-09-28 05:21:51 -07=
00)
>
> are available in the Git repository at:
>
>   https://git.openembedded.org/openembedded-core-contrib stable/scarthgap=
-nut
>   https://git.openembedded.org/openembedded-core-contrib/log/?h=3Dstable/=
scarthgap-nut
>
> Deepesh Varatharajan (1):
>   glibc: stable 2.39 branch updates.
>
> Hitendra Prajapati (1):
>   webkitgtk: upgrade 2.44.1 -> 2.44.3
>
> Khem Raj (2):
>   gnupg: Document CVE-2022-3219 and mark wontfix
>   openssh: Mark CVE-2023-51767 as wont-fix
>
> Martin Jansa (2):
>   populate_sdk_base: inherit nopackages
>   meta-world-pkgdata: Inherit nopackages
>
> Peter Marko (3):
>   wpa-supplicant: Ignore CVE-2024-5290
>   wpa-supplicant: Patch CVE-2024-3596
>   wpa-supplicant: Patch security advisory 2024-2
>
> Wang Mingyu (1):
>   cryptodev: upgrade 1.13 -> 1.14
>
>  meta/classes-recipe/populate_sdk_base.bbclass |   2 +-
>  .../openssh/openssh_9.6p1.bb                  |   1 +
>  ...valid-Rejected-Groups-element-length.patch |  52 ++++++
>  ...valid-Rejected-Groups-element-length.patch |  50 ++++++
>  ...id-Rejected-Groups-element-in-the-pa.patch |  38 ++++
>  .../wpa-supplicant/CVE-2024-3596_00.patch     |  82 +++++++++
>  .../wpa-supplicant/CVE-2024-3596_01.patch     | 165 ++++++++++++++++++
>  .../wpa-supplicant/CVE-2024-3596_02.patch     |  62 +++++++
>  .../wpa-supplicant/CVE-2024-3596_03.patch     |  37 ++++
>  .../wpa-supplicant/CVE-2024-3596_04.patch     |  52 ++++++
>  .../wpa-supplicant/CVE-2024-3596_05.patch     |  51 ++++++
>  .../wpa-supplicant/CVE-2024-3596_06.patch     |  46 +++++
>  .../wpa-supplicant/CVE-2024-3596_07.patch     |  67 +++++++
>  .../wpa-supplicant/CVE-2024-3596_08.patch     |  47 +++++
>  .../wpa-supplicant/wpa-supplicant_2.10.bb     |  14 ++
>  meta/recipes-core/glibc/glibc-version.inc     |   2 +-
>  meta/recipes-core/meta/meta-world-pkgdata.bb  |   1 +
>  ...-linux_1.13.bb =3D> cryptodev-linux_1.14.bb} |   0
>  ...odule_1.13.bb =3D> cryptodev-module_1.14.bb} |   3 -
>  ...-tests_1.13.bb =3D> cryptodev-tests_1.14.bb} |   4 -
>  meta/recipes-kernel/cryptodev/cryptodev.inc   |   4 +-
>  ...ng-header-file-provided-by-another-p.patch |  25 ---
>  ...001-tests-Makefile-do-not-use-Werror.patch |  25 ---
>  ...able-to-control-macro-__PAS_ALWAYS_I.patch |   6 +-
>  ...spection.cmake-prefix-variables-obta.patch |   2 +-
>  ...fic-declarations-in-FELighting.h-unn.patch |  44 -----
>  ...icDowncast-adoption-in-platform-code.patch |  65 -------
>  ...d5e22213fdaca2a29ec3400c927d710a37a8.patch |   2 +-
>  .../webkit/webkitgtk/no-musttail-arm.patch    |   6 +-
>  .../webkit/webkitgtk/reproducibility.patch    |   2 +-
>  .../webkit/webkitgtk/t6-not-declared.patch    |  12 +-
>  ...ebkitgtk_2.44.1.bb =3D> webkitgtk_2.44.3.bb} |   6 +-
>  meta/recipes-support/gnupg/gnupg_2.4.4.bb     |   1 +
>  33 files changed, 786 insertions(+), 190 deletions(-)
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0001-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0002-SAE-Check-for-invalid-Rejected-Groups-element-length.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/0003-SAE-Reject-invalid-Rejected-Groups-element-in-the-pa.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_00.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_01.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_02.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_03.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_04.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_05.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_06.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_07.patch
>  create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplica=
nt/CVE-2024-3596_08.patch
>  rename meta/recipes-kernel/cryptodev/{cryptodev-linux_1.13.bb =3D> crypt=
odev-linux_1.14.bb} (100%)
>  rename meta/recipes-kernel/cryptodev/{cryptodev-module_1.13.bb =3D> cryp=
todev-module_1.14.bb} (74%)
>  rename meta/recipes-kernel/cryptodev/{cryptodev-tests_1.13.bb =3D> crypt=
odev-tests_1.14.bb} (74%)
>  delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-Disable-inst=
alling-header-file-provided-by-another-p.patch
>  delete mode 100644 meta/recipes-kernel/cryptodev/files/0001-tests-Makefi=
le-do-not-use-Werror.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Remove-ARM-sp=
ecific-declarations-in-FELighting.h-unn.patch
>  delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-More-dynamicD=
owncast-adoption-in-platform-code.patch
>  rename meta/recipes-sato/webkit/{webkitgtk_2.44.1.bb =3D> webkitgtk_2.44=
.3.bb} (96%)
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205248): https://lists.openembedded.org/g/openembedde=
d-core/message/205248
> Mute This Topic: https://lists.openembedded.org/mt/108861069/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

