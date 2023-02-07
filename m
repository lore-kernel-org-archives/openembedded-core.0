Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01701C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 18:05:03 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.90581.1675793101528703253
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 10:05:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Kcb7rjDG;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id br9so23449942lfb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 10:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f65+9drfwIabkapGk6jbmOMCRZdIzv6SG1FXNe4eLV0=;
        b=Kcb7rjDGPBVurMGNOJTy39LF+lwYUfhWA4IcuHP4dcSI3I+anHTjQi6CNDOv2MZ1nJ
         izlyXFrwn6Q88eKgWI+QA8YrC0XSPAw1+BZVODDud3ZHj2NNnFeEGx32g6M4dcLGVrNC
         Z5XJ8piywOA0S6BWIiHxLKeikqYQ/e40Pn0gqwIVy25kTjp5/Gi0p5Yabju63NIhcKQO
         2ndKWGjmdcWtLoOxIOZKmONPoAHHd9SQUScqzwPwojtxWaRxByhGcqyDmsczQzk+OKNv
         K+SqrkY+qkjO+SAExEt1V8gO+cnRdfSBi09Wmse5QHWBMwstnNFjBI5cDZR3ToBeqggH
         aS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f65+9drfwIabkapGk6jbmOMCRZdIzv6SG1FXNe4eLV0=;
        b=ds/FKBO2kEPvPxjCZc1nPEDEoj0SM7nmpNlipCYhiluIPEdpt+aKuN9m0oUQ84cs9W
         e0OKmoqtcsgHkKx0hwGq/mxH9TOKRo9MoRUhkUzNjCYl/dGzo4zgKlk/Gq+VG9j0SvxC
         sWGZ6q0kP2cwVWijsWTxv6BTFzGvUvvLUgJIyQC7wwpFXbboY5v9U1vV3b7Ed235RHxL
         wSydwggRokaKoobTBFAqHf22LStW0QnxQOwV5A+4Z/ZfUraazSfcTF7XlV2YfRAIGnBY
         mhoHPi5ExnRhRtthQMjVE4R+KgrXOFXmYHc1ze7hZpi+6B7Rgn/czc1rH1ddU0PzttDC
         nY/Q==
X-Gm-Message-State: AO0yUKXbN8boaCiemlM0okPO4wmNeQMkG0BEcs3nupgyJSO4fYX0eT8h
	mWBX8ebV9n5zsJu+lzmYssPzGhP8X3YSPxwxXvU=
X-Google-Smtp-Source: AK7set9hh45RbX7mDfQrfSXiLb66kgCAx4T1BEyDPw5AYkFRywnrYFlHxVAFXxYfRoGb9rsxnpeCgKklso57iwkKlAM=
X-Received: by 2002:a05:6512:21cb:b0:4d8:76f9:7387 with SMTP id
 d11-20020a05651221cb00b004d876f97387mr522699lft.266.1675793099469; Tue, 07
 Feb 2023 10:04:59 -0800 (PST)
MIME-Version: 1.0
References: <20230207163451.3886205-1-dragos.panait@windriver.com>
In-Reply-To: <20230207163451.3886205-1-dragos.panait@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Feb 2023 19:04:48 +0100
Message-ID: <CANNYZj_BM4bM1QMW7cba=wR-vmjObkdBYzOdffce7yvQc8M8-w@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH] plocate: add recipe
To: Dragos-Marian Panait <dragos.panait@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 18:05:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176828

This should go to openembedded-devel mailing list.

Alex

On Tue, 7 Feb 2023 at 17:35, Dragos-Marian Panait
<dragos.panait@windriver.com> wrote:
>
> From: Catalin Enache <catalin.enache@windriver.com>
>
> plocate, a much faster locate
>
> Signed-off-by: Catalin Enache <catalin.enache@windriver.com>
> Signed-off-by: Dragos-Marian Panait <dragos.panait@windriver.com>
> ---
>  meta-oe/recipes-extended/plocate/plocate.inc       | 9 +++++++++
>  meta-oe/recipes-extended/plocate/plocate_1.1.17.bb | 9 +++++++++
>  2 files changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/plocate/plocate.inc
>  create mode 100644 meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
>
> diff --git a/meta-oe/recipes-extended/plocate/plocate.inc b/meta-oe/recipes-extended/plocate/plocate.inc
> new file mode 100644
> index 0000000000..166fc2d561
> --- /dev/null
> +++ b/meta-oe/recipes-extended/plocate/plocate.inc
> @@ -0,0 +1,9 @@
> +SUMMARY = "plocate, a much faster locate"
> +HOMEPAGE = "https://plocate.sesse.net/"
> +DESCRIPTION = "plocate is a locate(1) based on posting lists, completely replacing mlocate with a much faster (and smaller) index. It is suitable as a default locate on your system."
> +SECTION = "base"
> +LICENSE = "GPL-2.0-only"
> +
> +inherit meson pkgconfig
> +
> +DEPENDS = "zstd liburing"
> diff --git a/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
> new file mode 100644
> index 0000000000..ef36754bac
> --- /dev/null
> +++ b/meta-oe/recipes-extended/plocate/plocate_1.1.17.bb
> @@ -0,0 +1,9 @@
> +require plocate.inc
> +# GPL-2.0-only
> +LICENSE = "GPL-2.0-only"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRC_URI = "git://git.sesse.net/plocate;protocol=https;branch=master"
> +
> +SRCREV = "7e5defd4e7e075cb9226e7d2d9a80f943c482d11"
> +S = "${WORKDIR}/git"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176820): https://lists.openembedded.org/g/openembedded-core/message/176820
> Mute This Topic: https://lists.openembedded.org/mt/96810815/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

