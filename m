Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0EAFD0C5EC
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:13:06 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.7884.1729847585623957538
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=W+Q5mhrq;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539e3f35268so2319965e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 02:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729847584; x=1730452384; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NxWbw6zn25hnY7FbmoTGxbHbrD9Awo1hqQeLlX64jUI=;
        b=W+Q5mhrqWWNNFQjVrwi4SS41dp3fL9oh3Chbbj9Z4TsBvyAY6lOnLo0daqYDZbKWMP
         SgQPkIjDfAd2wz/imQuxuilcX6a6sJ7sFiZBHQLliQ2bMCVGXFSFZIszeeZ7rwkGr/DZ
         xnSFFroq/YDT6OvpbLmyknFWBajsy0fPB+BmLXeqVyRwfrUBdTXUpQP53HBBSrV+gUFb
         itYvQua8yp75mZEKdgGg5IBgW34g+WeUh4vlSek+qzqAN2CtvtoxHOS8rh7FoOqFKUIq
         hWFQKYTQ6LkAfyJYPyt8q/I3wYGNWO8spRpr6Tx6UM3Z/wQKUyOME+LBi5KV9OL63SEk
         +/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729847584; x=1730452384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxWbw6zn25hnY7FbmoTGxbHbrD9Awo1hqQeLlX64jUI=;
        b=HMNLJfXYYtopzmhaT+Iiq91Oy1JMfQNB+2tdlmzWte5ESdh2ach7l7BANtfUlqOsv4
         HPHMbULXMcVhuQbJIJ/9HrFctAnUbqilXZi8+TW3vhAloVLV5KtkvT09OF1wz8hnEBYq
         +crzkJ7HjmtzMf6c5wG2a/ztu6dcbZma/91WN7Rw1vR1E1i7KE/T/2POvDmXXhxk4dB+
         3yP/TiIpzQxCKtQCcHypeHflGesqKxMBEk1ziYDPz1xVSEyq9jc+kMbiwM02nDsHWVn8
         rqTzr7vz9/XGoyNFEVFHor0ykTB1fzoX/HWg0QchBK4V8g7HMgvYh/EkEk3zwCu7pVP+
         ciwg==
X-Gm-Message-State: AOJu0YxRqTZdpBAbuWgyzg/+rY4LOZQ94pNdv0VYYmr7e3L8DQlid3t9
	qonmeTGA39Y6/BygI+gROn7rfYioy4JupEfbn/uKA9fw6aLzjQR1QKLnk5fJw4pVJWCtjlcZEtM
	Mc13dLdYwyjvggN5CywXiZnwvKUD6CAuk
X-Google-Smtp-Source: AGHT+IGF+DUkLy10wgbEDX3ZdeNIxtq2tTWDmvR5cCv0aJ6G1vZgdXnNafxYJE4yy7LVVct0bTCPr3rsgoKKAt4eUo4=
X-Received: by 2002:a05:6512:acc:b0:536:a583:2777 with SMTP id
 2adb3069b0e04-53b1a2f1f01mr5169667e87.9.1729847583570; Fri, 25 Oct 2024
 02:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <1729834769-4717-1-git-send-email-wangmy@fujitsu.com> <1729834769-4717-14-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1729834769-4717-14-git-send-email-wangmy@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Oct 2024 11:12:51 +0200
Message-ID: <CANNYZj_BGyi_Gz=h_62x2QSU+BWE2Ae-UB_fmbTP6BnVuccscg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 14/22] ptest-runner: upgrade 2.4.5 -> 2.5.1
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:13:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206343

The new version is actually 2.4.5.1:
https://git.yoctoproject.org/ptest-runner2/log/

I once again suggest that you use 'devtool upgrade' (or output from
AUH that is posted on this list twice a month), so mistakes like this
can be avoided.

Alex

On Fri, 25 Oct 2024 at 07:40, wangmy via lists.openembedded.org
<wangmy=fujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{ptest-runner_2.4.5.bb => ptest-runner_2.5.1.bb}            | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.5.bb => ptest-runner_2.5.1.bb} (95%)
>
> diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
> similarity index 95%
> rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
> rename to meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
> index d28ae7ca91..e07f5d444b 100644
> --- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.bb
> +++ b/meta/recipes-support/ptest-runner/ptest-runner_2.5.1.bb
> @@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
>  LICENSE = "GPL-2.0-or-later"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
>
> -SRCREV = "aea9f42f87f2a78a973ae22cade8e45259f754e1"
> +SRCREV = "c99e8c2737ff802f110612cc2d90c60233c33255"
>  PV .= "+git"
>
>  SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206325): https://lists.openembedded.org/g/openembedded-core/message/206325
> Mute This Topic: https://lists.openembedded.org/mt/109203593/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

