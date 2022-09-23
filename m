Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EF96C6FA82
	for <webhook@archiver.kernel.org>; Fri, 23 Sep 2022 15:12:34 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.8706.1663945944504341440
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 08:12:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AQ/wawY5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id t7so434348wrm.10
        for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Sep 2022 08:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=SzCJOqI16WcsGf+Zs//BW1wec076LxSzqBuhqdaYcXA=;
        b=AQ/wawY5oCBsto1otln13ODcFiGVEOLfMvq4qO49kvu8moDtBOOUDO+I0s5WdN01RW
         edUD22lWs5ZKlvQg+REnXnHjP3y8T0kWwBaOj0vjMWs6jKObZ1PtgbIeJSPY4bD99aiG
         BKoU3cvQVUhKB4XMvoRFmhaXfIGcYo/orQ4gE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=SzCJOqI16WcsGf+Zs//BW1wec076LxSzqBuhqdaYcXA=;
        b=auwCOroFRpx+njJYI1ln/0TAbyAleyUkGKy5CyrE4AT3T8Ci3EozJSmhEFUQ5w9TR5
         1wT7VsndI/GrpBwi3ktkVlMAOED2Z178P2+DaVUOE0eYQh9ucxVQ4+5m2QAVLJoSzqBC
         KBmyoC8ap9KHHNT3HvdEx3kr7/OZYlQukO+XGkBi5KGfnDjk5h2BqYVFL/WRzJBwwA+V
         0QvVHOUmlGd8PjylHJmHAj61gUPpqpGi696uijlpuu/wANomAWSZmJBJY08hsFU3wThe
         n5+151YJCd/0QeGlR8xIyxVtS94OCquF/AAnFnTod8uxO/PQbmBYYCPXgJX5ISn5nRQN
         Tgkw==
X-Gm-Message-State: ACrzQf2Q+vxcj5GnWDDprTHqaH6L/7NN35o9O3cghJRYGYJBsyacO87Q
	+jAIhE9maKsWEeT8DbVnFKWZQw==
X-Google-Smtp-Source: 
 AMsMyM42VE9Sx1Y/TAgtrYg3+JGeEDiNLHAJKYyViNRWVyY4+P8XvVpicaOrq/258VfJvKiBUO0QQg==
X-Received: by 2002:a5d:6c6e:0:b0:22a:c36d:e411 with SMTP id
 r14-20020a5d6c6e000000b0022ac36de411mr5417587wrz.183.1663945942914;
        Fri, 23 Sep 2022 08:12:22 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:7946:c7c6:1ddc:ce8e?
 ([2001:8b0:aba:5f3c:7946:c7c6:1ddc:ce8e])
        by smtp.gmail.com with ESMTPSA id
 q18-20020adfdfd2000000b0022ad393ba3csm7637764wrn.107.2022.09.23.08.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Sep 2022 08:12:22 -0700 (PDT)
Message-ID: 
 <c92673306b99fa5c7c12a9b810f8a82ab0414571.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] lttng-tools: Disable ptest for qemuriscv32
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: He Zhe <zhe.he@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Jonathan Rajotte-Julien <jonathan.rajotte-julien@efficios.com>
Date: Fri, 23 Sep 2022 16:12:21 +0100
In-Reply-To: <20220923031844.1630492-1-zhe.he@windriver.com>
References: <20220923031844.1630492-1-zhe.he@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Sep 2022 15:12:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170998

On Fri, 2022-09-23 at 11:18 +0800, He Zhe wrote:
> lttng-tools ptest requires SYS_ppoll and SYS_pselect which are not
> supported by qemuriscv32.
>=20
> Back port a not merged patch from upstream to be able to disable the test
> build and disable the ptest build for qemuriscv32. This way the main
> package can still be used or at least built.
>=20
> See the following link for more details.
> https://github.com/lttng/lttng-tools/pull/162

This commit message and patch are confused. It isn't a backport if it
wasn't merged upstream first.

The patch below has:

"Upstream-Status: Inappropriate [oe-core specific]"

which isn't really true either. The correct status may be Submitted or
possibly Rejected but not Inappropriate. At the very least the link to
the github issue should be in the patch header to explain the status
and let people get more information.

>=20
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/lttng/lttng-platforms.inc |  4 ++
>  .../0001-configure.ac-add-disable-tests.patch | 38 +++++++++++++++++++
>  .../lttng/lttng-tools_2.13.8.bb               |  6 ++-
>  3 files changed, 46 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-kernel/lttng/lttng-tools/0001-configure.=
ac-add-disable-tests.patch
>=20
> diff --git a/meta/recipes-kernel/lttng/lttng-platforms.inc b/meta/recipes=
-kernel/lttng/lttng-platforms.inc
> index 933c65d85d..2351df08b8 100644
> --- a/meta/recipes-kernel/lttng/lttng-platforms.inc
> +++ b/meta/recipes-kernel/lttng/lttng-platforms.inc
> @@ -15,3 +15,7 @@ LTTNGUST:arc =3D ""
> =20
>  COMPATIBLE_HOST:arc:pn-lttng-ust =3D "null"
> =20
> +# Whether the platform supports lttng-tools-ptest
> +# lttng-tools-ptest uses syscall SYS_ppoll and SYS_pselect6 which are no=
t supported for some platforms.
> +LTTNGTOOLSPTEST =3D "ptest"
> +LTTNGTOOLSPTEST:qemuriscv32 =3D ""

If the lttng-tools ptests don't work, will lttng itself work on the
platform? Would we be better off simply disabling lttng on the platform
until it is supported?

Cheers,

Richard

