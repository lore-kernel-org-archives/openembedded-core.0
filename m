Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C246C4345F
	for <webhook@archiver.kernel.org>; Fri, 26 Apr 2024 08:37:04 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.9226.1714120620559166239
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Apr 2024 01:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QfUQob1G;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so2562074e87.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714120618; x=1714725418; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NGaaBTt8ryTQggZF2bkbqiVsRLT+1kZ+foxY4ZBaMIw=;
        b=QfUQob1GVo7IupxW2kuTMHTkScvO7Iz+Qp1em6iAN/2tlhFM46mShFeQ3L4jOo9ttj
         Mr3HRI09VriPgoBgrxRZRFH9I36quZpH6prpVFmH+JH85Gd78/+eEX7ZUNW5rUV3+qSL
         D3K6sw178LtfWYMbgLMdVL0KT5BTCmXUSOZK8fB4F4DVR5ZGEWj3QfaqxcpLZVeW38fQ
         09k0m5MaIUfMErF0vwcjGXBlcjhSKUT3ojOdxYylbfBzG6fW1jgp3KDV+UNAgtstgRqM
         4uDSRgaj2RFqKdfApN0w/lVyQ6yYWrJZbufqnU4jB8sFFQIzlndm/8p/P3+NBg0NVXTz
         aPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714120618; x=1714725418;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NGaaBTt8ryTQggZF2bkbqiVsRLT+1kZ+foxY4ZBaMIw=;
        b=hhC+liCMB/u1ojfDy5EYBJREDqxfg2xrJGXw5POqOS5PiF3sRJgftN0ffB9uJJ6UmW
         B2zAo+w2CpiXtWWGojw4HcGVqLOu/oBZwnFIMqt35F3DG44irPHLx8jJC5ewiTgyIV99
         hrf2WkSImCGnDCyheXl+jgpX6RANXXGTE5CNo88DoVucGBXjMD9SZOEXrNXkbcGLcrvr
         imlyTayMORyD+e/qIaqNQgXyCQKdYgbGkYu1DwxFl6yBG5ArL8zS7wPnjKU/RSjIN/3A
         vIlgzLwlZc1Zp7vK+oRS5gw/aPw54ME6tNLCKwGfWX6CsUzHf3L4EKIpp31YFd1T9dHV
         gi4w==
X-Gm-Message-State: AOJu0YxOX8bowZAeEYYMErlxNL8UyMB7ut+WdW2hZe2qLHlG7WJw27zN
	OYTvGuRu8LgBVWcrexX94rWif9Od6k7jYq/bzLlpabUQc8/CxgZ2sCeCsZ5t00zRMtWsCMmdFg5
	mwLh2MqCL5TWzhDXvlgXE3ghczCE=
X-Google-Smtp-Source: AGHT+IHVI7TEDniqs6SsUDKQOdeMRy24uWTBpFOpexLos+9Tm5ozmHVPHjPiEo1hlgmvGUmOPHRsna/CWTkpSjedobo=
X-Received: by 2002:a19:760f:0:b0:518:d4c3:4682 with SMTP id
 c15-20020a19760f000000b00518d4c34682mr1046161lff.24.1714120618349; Fri, 26
 Apr 2024 01:36:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240426083038.8555-1-alexandre.truong@smile.fr>
In-Reply-To: <20240426083038.8555-1-alexandre.truong@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 26 Apr 2024 10:36:46 +0200
Message-ID: <CANNYZj-hFdie-BZsFTYRBFuQrvkw2B8+vU5pHdEx_517puUAkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] Revert "oeqa/selftest/devtool: fix test_devtool_add_git_style2"
To: alexandre.truong@smile.fr
Cc: openembedded-core@lists.openembedded.org, 
	Yoann Congal <yoann.congal@smile.fr>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Apr 2024 08:37:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198716

When you revert something, you need to explain why.

Alex

On Fri, 26 Apr 2024 at 10:31, Alexandre Truong via
lists.openembedded.org
<alexandre.truong=smile.fr@lists.openembedded.org> wrote:
>
> This reverts commit ab6d3e3d645ffc343f434bf731339fa237df027a
> from poky repository.
>
> Signed-off-by: Alexandre Truong <alexandre.truong@smile.fr>
> Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
> ---
>  meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
> index 51949e3c93..1f8781a28b 100644
> --- a/meta/lib/oeqa/selftest/cases/devtool.py
> +++ b/meta/lib/oeqa/selftest/cases/devtool.py
> @@ -482,7 +482,7 @@ class DevtoolAddTests(DevtoolBase):
>          pn = 'mbedtls'
>          # this will trigger reformat_git_uri with branch parameter in url
>          git_url = "'git://git@github.com/ARMmbed/mbedtls.git;protocol=https'"
> -        resulting_src_uri = "gitsm://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
> +        resulting_src_uri = "git://git@github.com/ARMmbed/mbedtls.git;protocol=https;branch=master"
>          self._test_devtool_add_git_url(git_url, version, pn, resulting_src_uri)
>
>      def test_devtool_add_library(self):
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198715): https://lists.openembedded.org/g/openembedded-core/message/198715
> Mute This Topic: https://lists.openembedded.org/mt/105746807/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

