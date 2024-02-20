Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1422C5475B
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 13:14:25 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web11.12752.1708434858008339580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Feb 2024 05:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Y+oruXJ4;
 spf=pass (domain: gmail.com, ip: 209.85.208.177, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d1080cba75so51877241fa.0
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 05:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708434856; x=1709039656; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IVdlWDfIqIrzCUXo14dnGI0ulpu5U6U713hesX5rXh4=;
        b=Y+oruXJ4e8epV6k6oqngqhlg7O/949C4CtIA/ac5wN/uT3btqJxXaWkFC9jGj5sgKG
         MfO9rqy0QAPbhJb5S5hSWXUxWsNiDfh7WCPwT6WTwtiJTjUzfAvQ1FdksiX4r9jhQymw
         x7zcbCl+np7AFK2nlfriDnk+w7rA6SEZ8z5sxJ0IUIveZz0pP8CqTpls/69XFpXv0Nxx
         s25mCs3riqWi/9oH7Gg2Id4YZPOX9d210hj7oQuoTJ1RNZrYnL8YKzaPZKrAbN3nZlxG
         ShayWFgSJ0BO0AHm3JOaknwy4KQsPGgnsNqFFoTPvk56aIYx/MvTZyUAQQjsF4MqFaCc
         mt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708434856; x=1709039656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IVdlWDfIqIrzCUXo14dnGI0ulpu5U6U713hesX5rXh4=;
        b=ofJRg9bnrrCA3lcyx8HsHtzd42mHJJNsCnrMnbkMzeMbbhFw3/+HRjBuOiY6RHMBzL
         e8xplfxnSYBDFDAjceP7wqJG7b0HxuOA5MklZO3BL9kkiMLRVRvQ1Xbii9EipFoiR4Rw
         UMRobheTWRfRzt2QTnH6m6hSDt6ih1lhERUBB79rNq7Owu2GpimHVd9E6AdUH/+aMeiF
         ThtX4ZVN0i/E9+sunpzLaLsjMNEKdgPLS4+j99ZNyhHsSlPvECdFtDa2UgDmDWSQn6sZ
         vEFGUVplXgQrWMzljlwJVUrGB8qhBEboxCgyueo6uH3hFpN5ZJPV/ifQMDIAr0LXDrnM
         b1BA==
X-Gm-Message-State: AOJu0YycoHmEqestDXHqnGwYPX/wID8HVmex71NOVW198m86paPwrsAi
	BGrkXDjqcvY/h0X6gXkTNw607hZTufV1FL0rqJOlIu9lgJWC18y2e2DHvFbsKj6yYLZC88zrm3X
	HiYLkXlMA7OYT9E/WV0UI3UjCGZM=
X-Google-Smtp-Source: AGHT+IGyRrWPuApU/4wh4jHh4THUUV71ym0Bkg/TgX+ZlrKg21szxDF03QkKfFhdEC/vVxaCSzHQ7dlt61fmaJ6qnC8=
X-Received: by 2002:a2e:1309:0:b0:2d2:2abf:16e with SMTP id
 9-20020a2e1309000000b002d22abf016emr2740821ljt.6.1708434855968; Tue, 20 Feb
 2024 05:14:15 -0800 (PST)
MIME-Version: 1.0
References: <PsPw.1708432537487658267.ZIry@lists.openembedded.org>
In-Reply-To: <PsPw.1708432537487658267.ZIry@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 20 Feb 2024 14:14:04 +0100
Message-ID: <CANNYZj9GT6wV8S7HZLTvjYe77cze_g5RXyvRmWW6jYotZj3i6g@mail.gmail.com>
Subject: Re: [OE-core] Dbus EXTRA_OECONF
To: Steffen Olsen <steffen.olsen@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Feb 2024 13:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195916

On Tue, 20 Feb 2024 at 13:35, Steffen Olsen <steffen.olsen@gmail.com> wrote=
:
> We are currently in the process of examining a memory leak in systemd, wh=
ich has led us to investigate how dbus is built for our targets (we are cur=
rently using Kirkstone).
>
> When kirkstone was introduced, there was made a couple of changes in how =
dbus is built (oe-core cfecef). It seems like the dbus-test and dbus recipe=
s were merged, which ultimately changed how (normal) dbus is built. Especia=
lly interesting is the changes on EXTRA_OECONF where the following flags ar=
e enabled for the "ordinary" dbus recipe
>
> --enable-tests
> --enable-checks
> --enable-asserts
>
> In dunfell, it seems dbus is built using '--disable-tests'
>
> As far as I can understand, these flags are now enabled for "production b=
uild of dbus". We definitely see a link between the mentioned systemd memor=
y leak and the introduction of these flags (especially the '--enable-tests'=
). Our question is really about whether these flags should be enabled when =
bitbaking production dbus? When building dbus with the current recipe we do=
 get the following result in the dbus log.do_configure log file
>
> NOTE: building with unit tests increases the size of the installed librar=
y and renders it insecure
>
> NOTE: building with assertions increases library size and decreases perfo=
rmance.
>
> Further, from official dbus maintainers we have the following in the NEWS=
 describing that production builds should be compiled with checks but witho=
ut assertions. To have some comparison we have tried looking into what othe=
r distros do when building dbus, and as far as we can see, at least debian =
does not set these flags (some are set in dbg packages).
>
> Obviously, we can make a bbappend or something similar to cater for our n=
eeds, but we are wondering if this recipe is correct as it stands at the mo=
ment. We would appreciate any input on the matter.

Thanks for spotting these. I took a look at the source code to see
what conditions trigger those two notes:

if test x$enable_embedded_tests =3D xyes; then
        echo "NOTE: building with unit tests increases the size of the
installed library and renders it insecure."
fi

if test x$enable_asserts =3D xyes; then
        echo "NOTE: building with assertions increases library size
and decreases performance."
fi

As far as I understand it's only those embedded tests that are
problematic, and other kinds of tests (e.g. modular tests) don't
affect how the library is built. So perhaps you can make a patch that
passes in (or removes) the respective autoconf options, so that the
above conditions no longer are true?

Alex

