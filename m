Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72606C433EF
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 19:51:11 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.38.1647978670247415312
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:51:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=J8T6vJku;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.53,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f53.google.com with SMTP id d10so38464974eje.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 12:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rnrUD9rGKkHcoT5V2B9sSIXofJcS8AIFZK6Jv9Njx4Q=;
        b=J8T6vJku4Z7HN/mrUH4TYYRBWVZWCtbFeG8OmcjdzjjVMw3mZcfoYLJ1xwaWuGcJbZ
         qLY/iiEy3DCjZJ8G0d0SXHXApRg2o1QWrhCe93UwuGBPP1LII00fZ6vHBdbaXL+MR1wn
         pogP42KmC/AJA0sfPI2n8R+EfJ5aStAcC9Q1gp+EyW0Ffu2iNd0tfLm8IW9eDY/M8omi
         dEzgKDvldqyD4TDckL/J0e/rCKMky3Pr66sHn0nQ/XEkoR+fFOwkGTaJgCVG5SnrY8XY
         kr1mzuEL0i+U3xvAS7+N1VJUUC9ioTFLIGWH9igF4FmB440km+f0hqcJBESydWN7bXoE
         WLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rnrUD9rGKkHcoT5V2B9sSIXofJcS8AIFZK6Jv9Njx4Q=;
        b=6KRFtWn344oQTWTqj8O3KsELuUnuH7cq8z7GoBF81OUvQZisLiFfnKbZHlQk60GvUM
         Wu+AoWan7rQG1mQHLktQDmenA/XgZCxsV3b0LrsZl1x6v7DGJ/OqCY5hlIZzhubDDzvg
         f3BOW0agCugaXUCe7oyy5G/tOPKLCy/ohemZ/Ku7yO4Y0tpz4VFQO1Z2M/xaCQLV6PU7
         SA7oJHmQoC0YeCUpB1MBAz1/fB+lUHgw7GGZJRoaSWUaOkYp/hZyD6aHzoeHGp+WnCbh
         vfejbfnXD41AXJbZ3ypah8S4cxrfazbJg+CAslzzWlqUTXDEUcxmeO3RE0KesZCsxsre
         puSg==
X-Gm-Message-State: AOAM533DHuucmAA0hEa+OpLErJEcEvZZCJ5CQyizowcngiF60AnmS3fE
	vSAxWGGnxmZyemtebeoyYjpKPUEh78jCBKu5ZE0QaQ==
X-Google-Smtp-Source: 
 ABdhPJwwgDN9WVhlAQaHUfesxrND+tTFNRfDLHsdVvSWFDbqVEajbqz4XGZQJ+n/6Z69E6+bRMTntVNlsfYtc8hyc94=
X-Received: by 2002:a17:907:7f04:b0:6e0:39a2:79a6 with SMTP id
 qf4-20020a1709077f0400b006e039a279a6mr5263755ejc.243.1647978668432; Tue, 22
 Mar 2022 12:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220322192738.13527-1-flowergom@gmail.com>
 <20220322192738.13527-2-flowergom@gmail.com>
In-Reply-To: <20220322192738.13527-2-flowergom@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 22 Mar 2022 09:50:57 -1000
Message-ID: 
 <CAOSpxda14M+y3Ddn96wrF2M3g1-sRfkGM4v=dhY5kgiVmMKQgg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH 2/2] virglrenderer: update SRC_URI
To: Minjae Kim <flowergom@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 19:51:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163570

On Tue, Mar 22, 2022 at 9:28 AM Minjae Kim <flowergom@gmail.com> wrote:
>
> The git repo for gnu-config was changed, so update the
                             ^^^^^^^^^
cut/paste error - I fixed it, so no need to do anything

Thanks,

Steve

> SRC_URI accordingly with the new link.
>
> Signed-off-by:Minjae Kim <flowergom@gmail.com>
> ---
>  meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> index 772db5bbaf..31c45ef89c 100644
> --- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> +++ b/meta/recipes-graphics/virglrenderer/virglrenderer_0.8.2.bb
> @@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
>
>  DEPENDS = "libdrm mesa libepoxy"
>  SRCREV = "7d204f3927be65fb3365dce01dbcd04d447a4985"
> -SRC_URI = "git://anongit.freedesktop.org/virglrenderer;branch=master \
> +SRC_URI = "git://anongit.freedesktop.org/git/virglrenderer;branch=master \
>             file://0001-gallium-Expand-libc-check-to-be-platform-OS-check.patch \
>             file://0001-meson.build-use-python3-directly-for-python.patch \
>             "
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163569): https://lists.openembedded.org/g/openembedded-core/message/163569
> Mute This Topic: https://lists.openembedded.org/mt/89960297/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

