Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6942BC433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 08:39:48 +0000 (UTC)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com
 [209.85.217.49])
 by mx.groups.io with SMTP id smtpd.web11.6771.1648024787282425863
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 01:39:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ckECW35/;
 spf=pass (domain: gmail.com, ip: 209.85.217.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f49.google.com with SMTP id o67so736091vsc.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Mar 2022 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dtXhOoylP5YYKEL9amSZGmvdI3TML5XCTOQ5HdKYz0M=;
        b=ckECW35/1/Aa92Lx8DZpPVvwrAyopftV2nMXlGO+CvokT7N2XxA+y+N3go2crIxL0a
         h52SZjId4f8SY+mYIfLTksS/o1ydZ8hIP7CvsjVm4/8yc9cMFiv2i6Me+wiHJtvWgHTI
         loVnNIY+P5TR8PLiRz91UAYYKeEDpLqfETX6pydcH9o5Cv+0lPbNzINE6k6dEOXDAci4
         /hPD4a8H4MOB280TfVuHob82O5WbxojRRWgL37l5X/VcT9v95TSFWKXAvnRKkDgOfGQD
         173JYSBIFYk0+/vwtTGsjX5UB8QXa8Z1/d0UIQY6E5rpL26il+a58g1i8c0qZDehxb8V
         PXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dtXhOoylP5YYKEL9amSZGmvdI3TML5XCTOQ5HdKYz0M=;
        b=j6+anzP2EIw1ye+fNr4SSoxQtzpoZSHB7WWGn82gVg2Pg5uTThKu6E6g/zPEPbjSnK
         v8bHUyX+8R5y+c2fy/OOfeViwk2QKIpCBBsCGtVR4WbIdpGK2koMKXzf1smlSU1VDfaO
         qE5ExIAiOaPA9eNPzZz1z9DZqTMdSAhsdbv3Hvt6kW0XUSp5iTMo+bMdhMMBdSA2tyqK
         v85FUlShclggfOAqr5vuKePx6oI3mmKnH6HczyRmFZhHaY/OZRjN6nMRcskzUxvpTn+L
         s9SITgODXoz4QqPMwcCKDLVoKUh2kQTfdodq3Zx7gsQkCtJXYks8KOpI+spAzJw069wh
         qghQ==
X-Gm-Message-State: AOAM532O/2q0sXpNCR5GkLGDalYNBi+QCa9VVgfSf46vsYi8MTGLqZco
	qwI0Ag7tOMoKFg/6xVrunaYzNKG/Sjd19Oq9iKU=
X-Google-Smtp-Source: 
 ABdhPJwzJq8tvksjn/VomY0fLOkimAB71sMG191NUf54lr/rRfrNhkZM9X/LHVokbbTKbQN0zHcrJFCcBQVHuF31T28=
X-Received: by 2002:a05:6102:915:b0:325:33c8:cd25 with SMTP id
 x21-20020a056102091500b0032533c8cd25mr3713540vsh.38.1648024786348; Wed, 23
 Mar 2022 01:39:46 -0700 (PDT)
MIME-Version: 1.0
References: <1648022502-11770-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1648022502-11770-1-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 23 Mar 2022 09:39:35 +0100
Message-ID: 
 <CANNYZj_hFxsyawFnsU+wb_Kh=uDp2oD3suN+iHUzuHRgG_fs=w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rng-tools: enable macro
 JENT_CONF_ENABLE_INTERNAL_TIMER
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Mar 2022 08:39:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163580

This error is not seen on the autobuilder, can you please check why it
occurs only in your local setup? The macro probably needs to be
enabled in a more targeted way.

Alex

On Wed, 23 Mar 2022 at 09:02, wangmy <wangmy@fujitsu.com> wrote:
>
> do_compile error :
> | ../git/rngd_jitter.c: In function 'rngd_notime_start':
> | ../git/rngd_jitter.c:56:45: error: invalid use of undefined type 'struct jent_notime_ctx'
> |    56 |         ret = -pthread_attr_init(&thread_ctx->notime_pthread_attr);
>
> enable macro JENT_CONF_ENABLE_INTERNAL_TIMER to use struct jent_notime_ctx
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-support/rng-tools/rng-tools_6.15.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools_6.15.bb b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> index ae974f9f6f..0696351903 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_6.15.bb
> @@ -34,6 +34,8 @@ INITSCRIPT_PARAMS = "start 03 2 3 4 5 . stop 30 0 6 1 ."
>
>  SYSTEMD_SERVICE:${PN} = "rngd.service"
>
> +CFLAGS += " -DJENT_CONF_ENABLE_INTERNAL_TIMER "
> +
>  # Refer autogen.sh in rng-tools
>  do_configure:prepend() {
>      cp ${S}/README.md ${S}/README
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163579): https://lists.openembedded.org/g/openembedded-core/message/163579
> Mute This Topic: https://lists.openembedded.org/mt/89971134/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

