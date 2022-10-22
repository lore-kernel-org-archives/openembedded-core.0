Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354A7C04A95
	for <webhook@archiver.kernel.org>; Sat, 22 Oct 2022 19:05:55 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web12.1588.1666465548043047253
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Oct 2022 12:05:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NEwwy/xz;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id r14so10577454lfm.2
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 12:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jVq45lhwfqMQ0hrGjetR5EParTi+AaVQwgFRWH8LuAs=;
        b=NEwwy/xzkrtOTP2FYMsRRQqpMPIYftSD2eUBmDF+hJNkyNwxZtNHQxoNIioxSxaCIK
         IGqRHKGn7gCdOKvp4X5tSPN5j5tsU92IpbWaNKIGSV3/cP5egzPpK2cOv+zJCAGC34c2
         XVHwy4+o/mroJUvK0zrt2EK6oHKeCKHBiBBGWjBo93Ig/s/w/EttBPoTvWel0cljkIe+
         FGhiz9f9ie5U7vyPb7pnUTcoQIEUhBx7Cvss/SIfWwswiO/Hy7arl/ddeRPoCnDHU81s
         /kWdM6v7fbsxaqqX2F5QehpVZMEqQqQ+FIY9PLkynG1HtbZxvRuYQbNTnIbluGh0MpDh
         ETXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVq45lhwfqMQ0hrGjetR5EParTi+AaVQwgFRWH8LuAs=;
        b=LU9pcHpE5xQYMkW3vIq9fTOlAK/kkV0mBUE46mTb7W+if+pTmb79erQ1QCtBR7XHrv
         KMBXMpiSPJvJQ/xrlSJAG+d7KP/ZMj11BUBGbAmEqQiBmjndDWYWLhguM3ckbmu/2O7m
         MSd7uIXmdTWMBC4G2sUodNh1CXL5nzFrmn5nNKalcxQz2Ub6LPTQtt78ZXNRufdY2aFS
         HhJu8nYXv4Sdbsn0OGrpjxa0YTlzKBcxBCAzyNQOOEzUKX8LVjsKGMZr81VMPTR+WIkB
         rp0OS9bF0wqluqa8KNahBvdqz0IEE7yMXvYgOBF5E57qyDi24iAmwz6PunCTKWAFEVMx
         Dt4A==
X-Gm-Message-State: ACrzQf1ZczK/sjsbvilt+zRZI0q9/BEXIkigcDKkZYFHcwfy1TyU7JyN
	LDPLki1RbmI8CGDwWBs+Nvqm1edBgVyV4oHoqqo=
X-Google-Smtp-Source: AMsMyM572G8SIKmunu5SV8SMKo55sxA8p920xkwog8rORbc+QG4IzgV6X9EwZaFRMYKNVmjL992LgWGrJdN20wXhGgk=
X-Received: by 2002:a05:6512:398d:b0:4a2:7d72:8629 with SMTP id
 j13-20020a056512398d00b004a27d728629mr8616324lfu.445.1666465546220; Sat, 22
 Oct 2022 12:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221022171036.85415-1-vince@underview.tech>
In-Reply-To: <20221022171036.85415-1-vince@underview.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 22 Oct 2022 21:05:34 +0200
Message-ID: <CANNYZj__oO_F=t3DZDupCwFi8L_Q8FEZG=p8+iA48A_UY4xzuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libglvnd: add new recipe libglvnd v1.5.0
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Oct 2022 19:05:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172063

Any new recipe needs to be justified for inclusion in core. The criteria are:

- is this something that fulfils a significant, broadly applicable
embedded linux use case or developer workflow?
- is this a dependency of something else in core that would enable the
previous point?

Alex

On Sat, 22 Oct 2022 at 19:13, Vincent Davis Jr <vince@underview.tech> wrote:
>
> Signed-off-by: Vincent Davis Jr <vince@underview.tech>
> ---
>  .../libglvnd/libglvnd_1.5.0.bb                | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
>
> diff --git a/meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb b/meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
> new file mode 100644
> index 0000000000..b92bad46e0
> --- /dev/null
> +++ b/meta/recipes-graphics/libglvnd/libglvnd_1.5.0.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "libglvnd is a vendor-neutral dispatch layer for arbitrating \
> +OpenGL API calls between multiple vendors."
> +HOMEPAGE = "https://gitlab.freedesktop.org/glvnd/libglvnd"
> +LICENSE = "MIT & BSD-1-Clause & BSD-3-Clause & GPL-3.0-with-autoconf-exception"
> +LIC_FILES_CHKSUM = "file://README.md;beginline=323;md5=7ac5f0111f648b92fe5427efeb08e8c4"
> +
> +SRC_URI = "git://git@gitlab.freedesktop.org/glvnd/libglvnd.git;protocol=https;branch=master"
> +
> +# v1.5.0 tag
> +SRCREV = "c7cdf0cc4395b57563294d1f340b6bb1b95366a0"
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +
> +inherit meson pkgconfig features_check
> +
> +S = "${WORKDIR}/git"
> +
> +PACKAGECONFIG ?= "\
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl gles1 gles2', '', d)} \
> +  ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
> +  "
> +
> +PACKAGECONFIG[x11] = "-Dx11=enabled,-Dx11=disabled,libx11 libxext xorgproto"
> +PACKAGECONFIG[glx] = "-Dglx=enabled,-Dglx=disabled,libx11 libxext xorgproto"
> +PACKAGECONFIG[egl] = "-Degl=true,-Degl=false,"
> +PACKAGECONFIG[gles1] = "-Dgles1=true,-Dgles1=false,"
> +PACKAGECONFIG[gles2] = "-Dgles2=true,-Dgles2=false,"
> +
> +BBCLASSEXTEND = "native nativesdk"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172062): https://lists.openembedded.org/g/openembedded-core/message/172062
> Mute This Topic: https://lists.openembedded.org/mt/94500417/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

