Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88E6AC87FD1
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 08:43:54 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web10.17438.1754383434072559388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 01:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X/q6G49I;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b075cd3cdbso22216691cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754383433; x=1754988233; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bWRInjGJydluDdSXu0xki6Nucx9NOP+PPAkUrqcBeQQ=;
        b=X/q6G49I07XmzWl4vlppCImwF87itnu3qTG3w8lxjEzLbJubIxmjYmhes3KKZCGKMN
         H1SxBojKArQiL/JPeQnT2QHBkd9M/LDcVVmmh3v3HMo2FcyjnbVxbmiHV7z7vOuwkzua
         /RqBPkvY+/oBgyo/vCccgO16o8E1jqyAKkPCld/uJ6VNa+Rkt3vXCLyoAFUSVB1Wj0a8
         fB2aeLKs1zNbCJjuYrO/7l5X5WnGu/RdpSXPScTHyUuicQTSWJprYHUH5O4SBnXoqJpU
         N0NsOEXLTGAOlc4EefTAxFqAOhOhVJ+ku0Ez1cMFqx4ZA5Q0vfkPbQeJpWxneu3vjES2
         o73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754383433; x=1754988233;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bWRInjGJydluDdSXu0xki6Nucx9NOP+PPAkUrqcBeQQ=;
        b=NncX7K8clErWIJxrQYs2NmKuSf6DZ1dffpL2o/XO8gtfjzQQ30aRgjRw4Z69eaAvDv
         M7wWaLRuAKnj75vbv0m9r6B9RCMepj0MKUnIfDIwlkwgTsYu6oX9hpkzCMLLIemGzVOL
         XjDwq2R9Lil27jjpt2ylJdHG/JfQrFCbke3UE8VtCLaZ7wq4sWrSdXSDbfPs49BdtJeH
         js1OTaV4RHkQ5XPappllWLD+MdvDeOR7mxk/wGVf1g/7+SJFXO+wA3hU2gCzpv/q9xyt
         u6ko8vGQlvWZs6F4/5ac/Wjai7/ogCbynQeio0ni4RTEQmA5UHluKJwm7Tf8CRw9BC32
         qCsw==
X-Gm-Message-State: AOJu0YzOXEYOltosh6GX/4zlij9cXlAmmuNk/v4mlStcbp8gKez4mNc2
	Opo7rOktddHj5njWCSaoAQDPAP+SHSVBMkDCnMwmguZLTjcy1u4xMciFQEx/6LI3mlk+4Xf7yUY
	gFaPWY4rp7lHEJcpCH54DrRyHaZjV5OpMh4Gv
X-Gm-Gg: ASbGnctFwncNxkueWalZoND7iAHOY52L4fCeS2kBzSaTBUL5lHjXKFvliE181npUObY
	7SyQ37EFLPk2D5kmBcE7lcm1P7KYHP8EYFgaoQXx+b9+z6FmXC9MDtIyQbJA6nz4YxsCVN0rhVR
	T9cWE51nP59Z2FkBo4PfDJPz/EP14Kg7RsPDm8kn4znwZLUYbNQ6zdlxFifBotMv/3+Tnt54IS8
	sWBXkBUygeQH31UxquVOz9K/Z320Os130vtEBXQypb8WUWMnKuP
X-Google-Smtp-Source: AGHT+IEMNnuXZModouvVz/R16/iEQdg4WlBsm128gzRsWskzAf3JB0iwEj3xWvG3MGxVOk91jIk4gVTkhsZZ+o+oSxs=
X-Received: by 2002:a05:622a:2a17:b0:4b0:7ff2:5558 with SMTP id
 d75a77b69052e-4b07ff25a23mr36905721cf.60.1754383432909; Tue, 05 Aug 2025
 01:43:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250805063925.771875-1-skandigraun@gmail.com> <20250805063925.771875-2-skandigraun@gmail.com>
In-Reply-To: <20250805063925.771875-2-skandigraun@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 5 Aug 2025 10:43:42 +0200
X-Gm-Features: Ac12FXw6mTQCy9DU-z0izeC5921Ka1kGTQNQVZYfWO4NYlVksLoccDyVl1d7Tew
Message-ID: <CANNYZj9zXWjmUkrP_hVVQtAZbWp9mZVUsVQ7CWbH4UxjD50ZxQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] librsvg: add ptest support
To: skandigraun@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 08:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221463

On Tue, 5 Aug 2025 at 08:39, Gyorgy Sarvari via lists.openembedded.org
<skandigraun=gmail.com@lists.openembedded.org> wrote:
> +do_install_ptest(){
> +       install -d  ${D}${PTEST_PATH}/tests/bin \
> +                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/api \
> +                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions \
> +                   ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading
> +
> +       install ${B}/librsvg-c/tests-c/api ${D}${PTEST_PATH}/tests/bin/
> +       install ${S}/rsvg/tests/fixtures/api/* ${D}${PTEST_PATH}/rsvg/tests/fixtures/api/
> +
> +       install ${S}/rsvg/tests/fixtures/dimensions/bug608102.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
> +       install ${S}/rsvg/tests/fixtures/dimensions/bug612951.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
> +       install ${S}/rsvg/tests/fixtures/dimensions/bug614018.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
> +       install ${S}/rsvg/tests/fixtures/dimensions/sub-rect-no-unit.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
> +       install ${S}/rsvg/tests/fixtures/dimensions/bug521-with-viewbox.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
> +       install ${S}/rsvg/tests/fixtures/dimensions/bug823-position-sub.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/dimensions
> +
> +       install ${S}/rsvg/tests/fixtures/loading/bar.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
> +       install ${S}/rsvg/tests/fixtures/loading/gnome-cool.svg ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
> +       install ${S}/rsvg/tests/fixtures/loading/gnome-cool.svgz ${D}${PTEST_PATH}/rsvg/tests/fixtures/loading/
> +}

Cherry-picking particular files from tests/ is prone to regressions
(for example if new tests are added, they won't be installed). Is it
possible to just install all of ${S}/rsvg/tests/ ?

Better yet, add a patch to install tests to upstream. Gnome components
are generally doing that already, and there are examples (e.g.
installed_tests option in glib or gstreamer that is used by respective
recipes).

Alex

