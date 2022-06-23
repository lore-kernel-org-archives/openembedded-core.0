Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AF78C433EF
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 14:47:49 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.8301.1655995661721326608
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 07:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYsq8TVf;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id a13so23917255lfr.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Jun 2022 07:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dXfSXBDccT/cHTrVXngwBgGr77bCDJVH91WfONZpSo=;
        b=UYsq8TVf/OW8msgPEGwA8t+YCjggKF37Zg/4PDgxyanFUsit8Tnsp3PgXCchX5M/wu
         Tj/TXza1wi4hOlsVBDvm684j2xFpdzYSaZ6ll/61ADZsGupSv7fmoaqdJcJiFR2rnbUj
         2q9iXDhv9qoNu7aVPr2/2aoC130NvLuPCAcx1IVnWt7dU4dksa1QfdHCAB6jFH/4QjAe
         buNEj1KkDtPY3WKE661O64+t2kJrJCycy6h5chpumEpiAPWm29Vut8jY1yS68b6NT0o1
         myLvEeyGO4uDvkyfyUl0VoExWf+IEzM3KR/235ZQgpfdXedu1s04zsIj7sH3ZBnYZ8jB
         NmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dXfSXBDccT/cHTrVXngwBgGr77bCDJVH91WfONZpSo=;
        b=HODu1V/oubekd9DmMOwvun4+Dq3h8F8vC3UJdqKGZXDgscAgIXYymOIsvP2DpYQRoC
         AaDDOmrMX+on9nPrRdTUyhCity9d7DhBllTw+nYnFBnv8b9U9fbugnjch4IKk1RXxolB
         ouOKNEy1bSHj9jMEmsgRKe5C3DHkFLIVp+stBLqtrAXGnv/zyaEnfj6gYZe8F+3psaVh
         YQwe73CvrnHewXHwbvehN5MPuQCxcwSnYN9AvsMqN/PRODgKzuVgvPvGE8a3OMwk0Uzv
         saunifm4T1VBGYz41qgoCSs8J1jGRV8oftp0s87uI7M+gEurJnePSJ/cUHbOeLZ+aEsZ
         D4Gg==
X-Gm-Message-State: AJIora/dbODBQXSWtV4MlAg8vldFEY8ABkJQV+IAFqcmPuD9mx9HkeWr
	SOahThX2vBHhWU8j074X6iPQDKCkOud5+9UoMnU=
X-Google-Smtp-Source: 
 AGRyM1vReX4OR72egzgCs92wXDtsU+sYk0flEO0hlniRipU4wl56+Myq90bTvrIMGkTD03V7QMbkl6qUokS0hVbNpoI=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr5912318lfa.380.1655995659505; Thu, 23
 Jun 2022 07:47:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220617124820.3030925-1-ross.burton@arm.com>
In-Reply-To: <20220617124820.3030925-1-ross.burton@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 23 Jun 2022 16:47:29 +0200
Message-ID: 
 <CANNYZj9MAVCDE0ypESkUasY9O-rMR8w65PYBpkMuTHt3A9Jd9A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: fix a race condition in the
 test_socket.testSockName test
To: Ross Burton <ross.burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Jun 2022 14:47:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167270

I trust this will be submitted upstream right after the python CLA is
signed and approved?

Alex

On Fri, 17 Jun 2022 at 14:48, Ross Burton <ross.burton@arm.com> wrote:
>
> This test uses find_unused_port() which is inherently racey, so retry
> it a few times before failing.
>
> [ YOCTO #14840 ]
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...e-the-race-condition-in-testSockName.patch | 47 +++++++++++++++++++
>  .../recipes-devtools/python/python3_3.10.4.bb |  1 +
>  2 files changed, 48 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
>
> diff --git a/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch b/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
> new file mode 100644
> index 00000000000..e19df08f870
> --- /dev/null
> +++ b/meta/recipes-devtools/python/python3/0001-Mitigate-the-race-condition-in-testSockName.patch
> @@ -0,0 +1,47 @@
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +From 8103b90148e8768456c3ab707de105d63d9d5b20 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@arm.com>
> +Date: Fri, 17 Jun 2022 11:53:59 +0100
> +Subject: [PATCH] Mitigate the race condition in testSockName
> +
> +find_unused_port() has an inherent race condition, but we can't use
> +bind_port() as that uses .getsockname() which this test is exercising.
> +
> +Try binding to unused ports a few times before failing.
> +---
> + Lib/test/test_socket.py | 15 +++++++++++++--
> + 1 file changed, 13 insertions(+), 2 deletions(-)
> +
> +diff --git a/Lib/test/test_socket.py b/Lib/test/test_socket.py
> +index c981903824..b1630d18b6 100644
> +--- a/Lib/test/test_socket.py
> ++++ b/Lib/test/test_socket.py
> +@@ -1390,10 +1390,21 @@ def testStringToIPv6(self):
> +
> +     def testSockName(self):
> +         # Testing getsockname()
> +-        port = socket_helper.find_unused_port()
> +         sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
> +         self.addCleanup(sock.close)
> +-        sock.bind(("0.0.0.0", port))
> ++
> ++        # Since find_unused_port() is inherently subject to race conditions, we
> ++        # call it a couple times if necessary.
> ++        for i in itertools.count():
> ++            port = socket_helper.find_unused_port()
> ++            try:
> ++                sock.bind(("0.0.0.0", port))
> ++            except OSError as e:
> ++                if e.errno != errno.EADDRINUSE or i == 5:
> ++                    raise
> ++            else:
> ++                break
> ++
> +         name = sock.getsockname()
> +         # XXX(nnorwitz): http://tinyurl.com/os5jz seems to indicate
> +         # it reasonable to get the host's addr in addition to 0.0.0.0.
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-devtools/python/python3_3.10.4.bb b/meta/recipes-devtools/python/python3_3.10.4.bb
> index 6bd3a6aba84..db0c2bf9ee8 100644
> --- a/meta/recipes-devtools/python/python3_3.10.4.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.4.bb
> @@ -34,6 +34,7 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
>             file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
>             file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
>             file://deterministic_imports.patch \
> +           file://0001-Mitigate-the-race-condition-in-testSockName.patch \
>             "
>
>  SRC_URI:append:class-native = " \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167023): https://lists.openembedded.org/g/openembedded-core/message/167023
> Mute This Topic: https://lists.openembedded.org/mt/91820207/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

