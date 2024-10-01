Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C226CEACE1
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 16:06:40 +0000 (UTC)
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.web11.85725.1727798793625490067
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Oct 2024 09:06:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d7zOgxpm;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-27cdb92376aso2817768fac.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 09:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727798793; x=1728403593; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2q1wkUM4hJS8nuLyMySjz9AVzGe2/UXnK7qFYzBPgNM=;
        b=d7zOgxpm6XnZN0OH95oZkhig0xibmjg21IZu6nnW96vd8ab8yqWB+Db0eFCMdlp+00
         CdWgwvZgcbyGgedAljUNVCUkE68XGbAvbWZYWteE6WFSO4F1lUXdsTW+FIfhMKs2VMwj
         MzrbTfPGr0+DI+ruV/ChZNo4ZjNg+EDOqvETN2gBZNQHggEo2mn1CpZQNQ4EApkMNbIq
         o6zQn28zRef9zENqbEAZ4nOSJods6BZn0rTSAUBCf+QvAbzpYxtMeSadvHyBnATnrkGG
         FiEgq5M8Y8ZqQ6CFVz8ABtBxAOhH0wV7XM9OQrt2bSC09jCS9qEbEYvPz1rQ61aam6Ed
         mHHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798793; x=1728403593;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2q1wkUM4hJS8nuLyMySjz9AVzGe2/UXnK7qFYzBPgNM=;
        b=eYtvxTCzOL5Q2pKPPGKloKgjtWrNTIspN5Xww5DnG3OjcbY1a5i+nQlzUiNT7Tw8dq
         MqM3o/GoZPIRWYr/p8F65VnprwvXCqWLb0+1OlKgppPfubuRLCr6DcinzV0oXBpgKwbO
         ICevhq+ztcxjqWOPL9q6TeCpIupTk0eIaa/7MLD4ikYquqHhU5NwMVMI/VfToGZwi78P
         PauNqJcucrv+wfgc8vvNMsM9RW2B4SV/ME1KhIg20YOSDrERKPf/MdbC1Ztl1VhFf+E8
         aQ3IYeACb592IV4Hv3Cb685XktCpQ+ChVwSAcef/5aPlf2X8Kmk8nvcLv3p2S7aAZDIa
         8k7g==
X-Gm-Message-State: AOJu0YxMWolnhPqZuo084fo9GIWUidrCDuHg/qFrVBTdwyBdRqETVfwk
	NVADx7Cdjvvw0dHMrVNBz5k+qbZ8+pcgSNgG/RhffLs0UM1dZCr+lb6O436YtjVjbF0K4yVt/5B
	zWinDlQpX95WU6v0TSiOpUvACTbQ=
X-Google-Smtp-Source: AGHT+IE+nombSPwal1auneeYGf+Nej3yXJK5JiyrWujDVHAz29S5EOxCmpRQScNSX8XKg/7tOz3TqvSDbcDhYfg+VgU=
X-Received: by 2002:a05:6871:7a6:b0:260:eae3:5ec2 with SMTP id
 586e51a60fabf-28710aadb08mr9561822fac.26.1727798792698; Tue, 01 Oct 2024
 09:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com> <1727246960-20665-30-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1727246960-20665-30-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 1 Oct 2024 09:06:06 -0700
Message-ID: <CAMKF1spddf1DCpOxw52w-kjibfJCGb+cWRq53b8f079Y5-nxKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 30/47] python3-pyasn1: upgrade 0.6.0 -> 0.6.1
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Oct 2024 16:06:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205175

On Tue, Sep 24, 2024 at 11:50=E2=80=AFPM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Added support for Python 3.13.
> - Cleaned Python 2-related code.
> - Removed bdist_wheel universal flag from setup.cfg.
>

This causes a ptest regression on pyasn1-modules recipe from meta-python

ERROR: tests/test_rfc5755.py:tests/test_rfc5755.py
ImportError while importing test module
'/usr/lib/python3-pyasn1-modules/ptest/tests/test_rfc6032.py'

octets.py has been removed in 0.6.1 release. Fortunately, there is a
patch for pyasn1-modules
https://github.com/pyasn1/pyasn1-modules/pull/22

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../python/{python3-pyasn1_0.6.0.bb =3D> python3-pyasn1_0.6.1.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-pyasn1_0.6.0.bb =3D> python=
3-pyasn1_0.6.1.bb} (88%)
>
> diff --git a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb b/meta/=
recipes-devtools/python/python3-pyasn1_0.6.1.bb
> similarity index 88%
> rename from meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
> rename to meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
> index 7237557f44..3913cb51d2 100644
> --- a/meta/recipes-devtools/python/python3-pyasn1_0.6.0.bb
> +++ b/meta/recipes-devtools/python/python3-pyasn1_0.6.1.bb
> @@ -3,7 +3,7 @@ HOMEPAGE =3D "http://pyasn1.sourceforge.net/"
>  LICENSE =3D "BSD-2-Clause"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.rst;md5=3D190f79253908c986e6cacf380=
c3a5f6d"
>
> -SRC_URI[sha256sum] =3D "3a35ab2c4b5ef98e17dfdec8ab074046fbda76e281c5a706=
ccd82328cfc8f64c"
> +SRC_URI[sha256sum] =3D "6f580d2bdd84365380830acf45550f2511469f673cb4a5ae=
3857a3170128b034"
>
>  inherit pypi python_setuptools_build_meta ptest
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204929): https://lists.openembedded.org/g/openembedde=
d-core/message/204929
> Mute This Topic: https://lists.openembedded.org/mt/108643630/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

