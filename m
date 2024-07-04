Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD49C30653
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 09:45:05 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.6693.1720086299433223933
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 02:44:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aHlBCBN6;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52d259dbe3cso424751e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 02:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720086297; x=1720691097; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vRosJNFnOopTjjU4DeUHY/UcVkp8FBqxf9FSt87Zf40=;
        b=aHlBCBN69X7JOr6o/XNwS+zTk7JYrK65uXLbJOfQ02RsTUbK1VzRFhT4TvY08/ErBC
         Rp3sqgzk4eH8ZX1jmyg/TX2nxeolCaSAhHnGxIVYs7R57RSUy8XcEpAhGNed0Dy5A9Nc
         SAMOjx616TEREz1/WvJhCICtnepRfJ/G2UmWG24IApQ6rMLynnL5HadburPXvoCL3JC8
         Vjc9tBhFY0Kcf17SYBxuULUweng3I+AKoinLCBCc93rdPfQIDi9Oc1B9wXFIMbyk0fSV
         s+XFm378Xn+F1su9W0KMGe6F6VbaJxv4sdgdlF3X7/LReUbGouArIWcOAwszObGB+nkA
         toTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720086298; x=1720691098;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vRosJNFnOopTjjU4DeUHY/UcVkp8FBqxf9FSt87Zf40=;
        b=aWbbfUHLwrrX/Fm80rpN0uh6yrpV5ctmkWnZ4Ns8Jbz/wPlfxE6qnPi3t7IR0UWUSh
         lvb5XmrQ+4AmcgJkISRVDL+7e7mNxGCFgHUpx7RFwfhMdgL6//uV6wYAV6IaqzRW/YOx
         4JIHZW3oTUPAr9afnq/99aITfyTr8Z1HaUCzgv3w+HH95WhipAUYDjE2UEzdZwf3zLGo
         DZpBXv6C/DkUBYoLfOLDbezuCoW6K9b+xj7wziLAnn4iusfP3+1J+FRjrKSp7LfAggV6
         hbnUBgifDb9N19z2NG6qO9HNk424lrQaOx8+304jvXtfnWKY2Zyqh82cuHq9bs+9Tez1
         7fyA==
X-Gm-Message-State: AOJu0YzkNqPwrVxGA17KZAccCdmAQ19NS8gJDq5fK6P3bPby8ISlBy/U
	Xh0VAf1X8Jp32Lme1bejtcAHhe5z23pRb6jbqu9+U8/CDzokQVMZW9bIEpJBQ97UAxcfd8fcMiF
	d/NgIyQkQH2o+bZEL3xyKtOJ7HfQ=
X-Google-Smtp-Source: AGHT+IG/js/MnXvefxUsLgYZfn6nMQ/cJLcbFZ/TaoOR034eFZmRdfgRLz1V5URI8TOMnj6hSndXWgOCkjFH0fG/INs=
X-Received: by 2002:a19:6454:0:b0:52c:de29:9ff with SMTP id
 2adb3069b0e04-52ea0622c23mr720659e87.2.1720086297364; Thu, 04 Jul 2024
 02:44:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240703235626.1542975-1-gudni.m.g@gmail.com>
In-Reply-To: <20240703235626.1542975-1-gudni.m.g@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 4 Jul 2024 11:44:45 +0200
Message-ID: <CANNYZj9G2fCXGDT4fhMq8C=Dg7vOFDNM9hhiEkOrzs4P4vvNbQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.76
To: gudni.m.g@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 09:45:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201528

On Thu, 4 Jul 2024 at 01:57, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org <gudni.m.g=3Dgmail.com@lists.openembedded.org>
wrote:
> * Add a patch file to resolve an issue introduce in version 5.73 where
>   --disable-cups configuration breaks the build. A
>   patch was submitted upstream a while ago but was denied (silently) due
> to failing CI checks according to one of the BlueZ maintainers, see: http=
s://github.com/bluez/bluez/issues/773#issuecomment-2200883833

Can you re-submit this in a new pull request please?

Alex

