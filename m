Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8821BC54E94
	for <webhook@archiver.kernel.org>; Thu, 26 Jan 2023 12:39:13 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.72428.1674736745545022787
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jan 2023 04:39:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CzClYjzC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id t18so1655317wro.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 04:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QH8kbLWtq3+WM84yFMLRRL6cv8JRyDcm1fOIZc5/uP4=;
        b=CzClYjzCOxNFPlX1CKGF5cXF0Wj0PWETG7l2adorL9qigioO43sjsYkC/9Wwp33pXa
         tCs197YByu3qYyo/Hii0RVOwoqBgqqVt5kPoqKF7TYmGfmF5fgA7co2lx2k5M3sj6LA/
         EavvoArAHjBOStBcP7AoruJByaCzZg0J2f3Ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QH8kbLWtq3+WM84yFMLRRL6cv8JRyDcm1fOIZc5/uP4=;
        b=vs4edgzK8PjhYbPfg1d4WEO4W0WspYra0XmGXZk+aH9VwhAYRQIZVHTJdaHnFxgsje
         EJ+RodP0tqZOdllKznjBRgxKmDwIw9odneTr0522SRtwkVr5cs8qZLFlTHKlx5/6OkVb
         /P/TSudD17VLCBkxUPL3qXOyOMu94FTXS8RZ0Fn3FLC6pQdJpV82+7fmkJ1/GDVKZ+s+
         DYewwDTEPuSzS5DwADTQ9cg4n8GfI1a8F4kIAC/wqzKUvevxF1EmkJ2hKeqChPms0NIv
         OUGm18xQQ4B0YdNmhpGrJLfcQTNh7qInzdMe2J504u4RSNNllDvPq78rW84e42sR+gZ1
         vAng==
X-Gm-Message-State: AFqh2krpgIokJ/Vp2hLzJSzs3k/ME+YE7qmLI7eRfQRLZRXVbGTduSE4
	LrPB5JouPvn+7Z5Ffy8G5zHzvw==
X-Google-Smtp-Source: AMrXdXtNgtFf9s2DIM4U0FW2yDw7zcDhnG9Bgrb6r0bAEwIzQ0ART6qG7V7lK0CJqW4UdQQvp1UfQw==
X-Received: by 2002:a05:6000:388:b0:2bc:7ec3:8b2 with SMTP id u8-20020a056000038800b002bc7ec308b2mr34206764wrf.68.1674736743699;
        Thu, 26 Jan 2023 04:39:03 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:f2d7:e330:f537:35d8? ([2001:8b0:aba:5f3c:f2d7:e330:f537:35d8])
        by smtp.gmail.com with ESMTPSA id p6-20020a5d48c6000000b002bfc0558ecdsm1143297wrs.113.2023.01.26.04.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 04:39:03 -0800 (PST)
Message-ID: <030b78056586e38cbaca26055da1af61a9786e0d.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/2] kernel-yocto: drop 5.19 recipes and make 6.1 default
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 26 Jan 2023 12:39:02 +0000
In-Reply-To: <cover.1674597466.git.bruce.ashfield@gmail.com>
References: <cover.1674597466.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Jan 2023 12:39:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176392

On Tue, 2023-01-24 at 16:59 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Richard,
>=20
> As promised, here are the commits to switch us over to 6.1 as the
> default.
>=20
> I'll also send a series for poky to bump things there as well.
>=20
> Also, if there are any significant problems, we'll just shelve this
> while I look at any issues. But at this point, it is worth getting
> the patches out there to move the needle to 6.1

Thanks!

I think the issues are:

a) two selftest failures:

  oe-selftest -r devtool.DevtoolUpgradeTests.test_devtool_virtual_kernel_mo=
dify
  oe-selftest -r efibootpartition.GenericEFITest.test_boot_efi

b) meta-arm issues

c) meta-virt issue (which you have a patch pending for in -next)

I suspect we can switch poky-tiny and defer the removal patches for a
few days to give meta-arm time to sort itself out. The only question
then becomes the selftest issues. I'm taking a quick look to see if
they're simple to sort.

Cheers,

Richard

