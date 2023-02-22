Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60F11C636D7
	for <webhook@archiver.kernel.org>; Wed, 22 Feb 2023 02:13:16 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web11.2717.1677031989020342632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Feb 2023 18:13:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jSBFC1V3;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bi17so6452150oib.3
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Feb 2023 18:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=paW3R4CDMQydnMnwp8M2nFF1WvSwx5OcImIE/e/7yvc=;
        b=jSBFC1V3VbZF1TSocCbch4FZCLewi5s1HDtdol3MrCJANfqFVT5/h4493FtOqVywRI
         DXreHuouxTwL6a8df7jiKqLLB8lBdKPb4peCayOA4c9P9JQtdDJvpvOK3RgpMeANZjQ3
         Kh+puAkI7uxkN1lTLiAoj0fWiUbRfwAgNrlvDqDBZRCibTrMoylvDl/+r5Wmr1o7s1sm
         SCxctU5+He02JkAYqro92fH93OxY+IFDYl+qCBSMOCUqtNYvSZpbSSPcWOV6Z7Nrus/4
         jgMtQxHtw6dCSB73fNWBiC6SYJlLjjVx3i/A5nZFkZMTZnVs4kyNfN7kqEojYYkJp0fb
         bCKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paW3R4CDMQydnMnwp8M2nFF1WvSwx5OcImIE/e/7yvc=;
        b=OSyRzyVxDByjc8MR7HKHjUowieD5pkAGhasY9OVbGucim4/KPpAayfQ3qMJZvan6u4
         vWBXpbLU3Pdb1NPccH6zMkk3rib0cfiKoDVpLH9gkajgRhAGdbEip5Yzl5xQIAwsNvJW
         I5DzN3uoinjc5OKybt2ywhGnxcaBvn4Ahh3MRB8X3Aore1HmjmDVNxnzCHDiIUh8bfTZ
         4Y4RAXUaEGVs+WzY5QsZqdMrjUUXd4YKaSi+RJcpoCfYXEz4elYKa+tjSR4n12u9JGV7
         vCmByjn6Xt1M3OPEyND3PDh3cj272QwlCTmxN0Hb4Iw+4RR6D3eImlmB+Qaqvd2WEZA4
         fRkA==
X-Gm-Message-State: AO0yUKWWZAELLvgAGA8a5n7f+6cF6sfBbComaCaAeQerHnL6lTplkGUw
	j8Edi4QYedO1D/yE4zitGRVuA9eaPeAOG0MY9J8=
X-Google-Smtp-Source: AK7set+bi1HXBGBss8PKkpxcNTBZ2JBnFY9AqJjg1ydBE4y/M6clBx0e5nuM6UF1EccV1dCu0Bq3xhV8eJTa9GitFoc=
X-Received: by 2002:a05:6808:331a:b0:37b:592b:ec39 with SMTP id
 ca26-20020a056808331a00b0037b592bec39mr929059oib.262.1677031986585; Tue, 21
 Feb 2023 18:13:06 -0800 (PST)
MIME-Version: 1.0
References: <20230221204445.23931-1-twoerner@gmail.com> <20230221204445.23931-10-twoerner@gmail.com>
In-Reply-To: <20230221204445.23931-10-twoerner@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2023 18:12:40 -0800
Message-ID: <CAMKF1sokWTdXds9Q3D5NNHVP_9=T=Fm0mYnKrY0mOXF8cqJgKQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 09/11] build-appliance-image: QB_MEM: allow user config
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Feb 2023 02:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177555

On Tue, Feb 21, 2023 at 12:45 PM Trevor Woerner <twoerner@gmail.com> wrote:
>
> Allow the user to specify a QB_MEM value of their choosing, otherwise set it
> to a default value.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/recipes-core/images/build-appliance-image_15.0.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/images/build-appliance-image_15.0.0.bb b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> index 1f7b96a9fcf4..aa1e87763d57 100644
> --- a/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> +++ b/meta/recipes-core/images/build-appliance-image_15.0.0.bb
> @@ -11,7 +11,7 @@ IMAGE_INSTALL = "packagegroup-core-boot packagegroup-core-ssh-openssh packagegro
>
>  IMAGE_FEATURES += "x11-base package-management splash"
>
> -QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
> +QB_MEM ?= '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m 512", "-m 256", d)}'
>

it would be good to see if we can say something like minimum memory
needed so it should be a fallback
if user sets higher value then it should use that. So for that matter
it looks its fine unless someone sets
QB_MEM < minmem then it will get some trouble.

>  # Ensure there's enough space to do a core-image-sato build, with rm_work enabled
>  IMAGE_ROOTFS_EXTRA_SPACE = "41943040"
> --
> 2.36.0.rc2.17.g4027e30c53
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177547): https://lists.openembedded.org/g/openembedded-core/message/177547
> Mute This Topic: https://lists.openembedded.org/mt/97118452/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

