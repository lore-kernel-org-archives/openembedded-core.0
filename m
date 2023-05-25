Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17A28C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 08:47:08 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.7369.1685004425767403367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 01:47:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=bin0H0qe;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f00d41df22so881727e87.1
        for <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685004424; x=1687596424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0ZTmDUFTZgAs9ebqm4ociSMK4QRyzvCrcJKHCre2mr4=;
        b=bin0H0qeVKfCndpfAm5cu04K71A1kyHQxmWd+NBycBf+bFIegCuKQEwrOY1YD5Zbcu
         83LaSdlKJ7fIl5S2wnWj/H5iQ9W24SOneo7ulEX4cPIh3Z8MlQU4ZO1Sjml7x2AJwQA8
         W6LVSJK7Df9IsBw7fE2K5h2jtq8obXAsWSHKLRUKlZ6Wo26dfWYUCuPzrKNHmAtN9jIe
         hbzbvF+//khHK8QIhwQrbhQi7ZgZQMC9Gv83Cdl4IQryEOhhoP5GrPl+0HifK4cfcDMw
         0iKYB31n6P79a9qV748hrs4ihyj32dyoeJ9YLKM/IvGxz0LobuzEBdYd2YJcTZI8Rxg+
         ok7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685004424; x=1687596424;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0ZTmDUFTZgAs9ebqm4ociSMK4QRyzvCrcJKHCre2mr4=;
        b=BaD8L0+BvGoMJUnMB6kbtt1VGW9mbldkeO3uBVh7yJ6qYQZ/zwNfOxkWVTMMG54Xjw
         6vpEvnujTAhdzUdeZ3HjxbK+uOx3bnuhzjhw2IL19ojdlui8RWqXh0psrRSJavcD2dUc
         Iu3FZc02E/JghNi63UQZSDPUih1X1nyEA7p9zk1UfYSTjO3PG9IfMclrd+yCG/g3JalG
         w2wtGC9W20rtdNGFDbmw/2ljQw2gxvL0s1tCDunClIIyVs9oB3CBT/xEC0n8/3ciXj8z
         mDmpw7ZvYe0/tRBjQqoxG/UobtWJfzAepMw+r4Paln9WFA+16KlXXasv1bwj4DdUtbOm
         obvQ==
X-Gm-Message-State: AC+VfDxKitPbrJ8Ml/SID5CJ6wOpQ7YR3q5kOt92Cgvi9CXzxXqR8lad
	vcHc3eRZnUygttK8a7fN1t5162y7DQa2RmaRIcQ=
X-Google-Smtp-Source: ACHHUZ4EVZC/jpCRpT/7j3hcoBeqiIT982zFPfILHFdT9VXcHM9tLlrvVz73QqiSSveqW8/wy15JjxFrnfqdOCGmDvc=
X-Received: by 2002:ac2:59c3:0:b0:4f4:b38c:1f87 with SMTP id
 x3-20020ac259c3000000b004f4b38c1f87mr530570lfn.12.1685004423640; Thu, 25 May
 2023 01:47:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230524215526.323283-1-charlie.johnston@ni.com> <20230524215526.323283-2-charlie.johnston@ni.com>
In-Reply-To: <20230524215526.323283-2-charlie.johnston@ni.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 25 May 2023 10:46:52 +0200
Message-ID: <CANNYZj9qufy5ryo0xT3fV1YKWS+1Ue1+L019kaWHD7t2SB53-g@mail.gmail.com>
Subject: Re: [oe-core][PATCH 2/2] classes: Add new packagefeed class.
To: Charlie Johnston <charlie.johnston@ni.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181705

What happens if several recipes inherit this class, and are processed
at the same time? Won't they step on each other, writing the same
index files into the deploy directory? I think package-index recipe is
deliberately standalone for that reason: you have to build it in a
separate step.

Alex

On Wed, 24 May 2023 at 23:55, Charlie Johnston <charlie.johnston@ni.com> wrote:
>
> Added a new packagefeed class that contains both a
> packagegroup and the package index builds. This allows a
> one-line bitbake for a packagegroup that defines a feed
> without explicitly needing to run the package-index recipe.
>
> Signed-off-by: Charlie Johnston <charlie.johnston@ni.com>
> ---
>  meta/classes/packagefeed.bbclass | 5 +++++
>  1 file changed, 5 insertions(+)
>  create mode 100644 meta/classes/packagefeed.bbclass
>
> diff --git a/meta/classes/packagefeed.bbclass b/meta/classes/packagefeed.bbclass
> new file mode 100644
> index 0000000000..b83ac54f21
> --- /dev/null
> +++ b/meta/classes/packagefeed.bbclass
> @@ -0,0 +1,5 @@
> +#
> +#   Special case of packagegroup that includes package index builds.
> +#
> +
> +inherit packagegroup package_index
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181693): https://lists.openembedded.org/g/openembedded-core/message/181693
> Mute This Topic: https://lists.openembedded.org/mt/99118888/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

