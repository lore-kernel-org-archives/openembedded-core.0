Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F63C433EF
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 17:40:14 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.2979.1636652412673103220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:40:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=F+WNnEYx;
 spf=pass (domain: burtonini.com, ip: 209.85.221.46,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f46.google.com with SMTP id i5so11138971wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 09:40:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LJN0pqpbkf+Oj3ZjergLrREJ3CRrOLgpV1uadLUt53A=;
        b=F+WNnEYx7TpUM2sTQO7vgK6Kk07aiOsJjMG5tIRxgL6FGOGt57XeojFe3z9fFxGeTH
         6wHV/hNEu/ko0kYunrdPKe4UXOZ48PGzN1snE8Ac1nEnP7D97iq941/qT4leATAZ1O1y
         uO7UdXbw4J3IcCE1dHuSTUbI0+YrkWwsAXSZKMAQRZCf5Yf0gkG1KzjHb1p0sY48Md39
         QjeIaIru0nNIR0jru1PrGeNTUmGooolifT4yhgf6MjmKFdn7aVQXo3CsesVgc6kBsB1X
         4sEbRmkTDDuCrpLC+TYd3WJ2gAoFMMCbGkSW9zf095q4xQDBcA8Uf+fD3y9ZTSm4w/MW
         G7DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LJN0pqpbkf+Oj3ZjergLrREJ3CRrOLgpV1uadLUt53A=;
        b=F7gPRSlFzlFbeLyyxce0XO3U356r4SekmQY/J19pvmHJoIh9N+8dUfZcZSREAyUYfv
         V2wbaEePNXaS3yYxgzaFLAN0+tMOn7QkUa8Ov9kYZbWLHQ4YrFDQirtKlEZ4f2jn9k+b
         hXZTrPRQkGBLRPQSEDL6tmLIXYVDpLi1Rg7hQDOASgZ7DXu043fQkN4j78w529b+FN7h
         KtHAFNWQRxq30C5VoRA0bR0hmqcTQJPermXxFGbl4PkIBCBf8uD1RdNaV1Eb/pIOCctN
         ajZ9kk89G1URkiJ5tPnTcSVLxWV2Dh4jne5o2cGzHT4Wuhe1/5eXWjHCBWHYl4RINLfm
         +glg==
X-Gm-Message-State: AOAM530s1x7+eHdJbKJj7zL4Te1Gu3fsWnQwDnax+hInCbFeC1lDeGok
	YJnhVj/2XdLRkJszzx8Zc1y3KqhSBtoUyKkyBOOEhw==
X-Google-Smtp-Source: 
 ABdhPJz3HZcBbsqLW74MOrd0/3Za0zziji6FoqIx6zR48blQyZ1w0oU9AAGf29NDu3Pk47aJQiAXQMIvBHiSSJeDeLw=
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr10748041wrn.49.1636652410763;
 Thu, 11 Nov 2021 09:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20211111170650.3112950-1-anibal.limon@linaro.org>
In-Reply-To: <20211111170650.3112950-1-anibal.limon@linaro.org>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 11 Nov 2021 17:39:59 +0000
Message-ID: 
 <CAAnfSTs0RK0KnKiQgJF6F83d4QrMs+Rj2q4-bJzenwLx0MVffQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCHv2] recipe-graphics/waffle: Add depends on
 cmake-native
To: Anibal Limon <anibal.limon@linaro.org>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 17:40:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158196

On Thu, 11 Nov 2021 at 17:07, Anibal Limon <anibal.limon@linaro.org> wrote:
>
> Fixes,
>
>   ...
>     File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/mesonbuild/modules/cmake.py", line 241, in detect_cmake
>       p, stdout, stderr = mesonlib.Popen_safe(cmakebin.get_command() + ['--system-information', '-G', 'Ninja'])[0:3]
>     File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/site-packages/mesonbuild/mesonlib/universal.py", line 1397, in Popen_safe
>       p = subprocess.Popen(args, universal_newlines=True, close_fds=False,
>     File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py", line 966, in __init__
>       self._execute_child(args, executable, preexec_fn, close_fds,
>     File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/subprocess.py", line 1717, in _execute_child
>       and os.path.dirname(executable)
>     File "/home/builds/oe-rpb-master/build-410c/tmp-rpb-glibc/work/cortexa53-linaro-linux/waffle/1.7.0-r0/recipe-sysroot-native/usr/lib/python3.10/posixpath.py", line 152, in dirname
>       p = os.fspath(p)
>   ...

But why does the Meson build want CMake?

> Not inherit cmake class because expects meson-log.txt,

Not inheriting the cmake class as then you're inheriting both cmake
and meson classes, and only one of those will be running the build.

Ross

