Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD424EF06FA
	for <webhook@archiver.kernel.org>; Sun,  8 Feb 2026 23:30:52 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36706.1770593451358634658
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Feb 2026 15:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ma5tJagX;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so59510075e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 15:30:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770593450; x=1771198250; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9oU8EmvEI4KEY4PqgpWJsYc27tk2dV9EWUgNH71LRog=;
        b=ma5tJagX/1v8DHLTscK3ZFAlhofR8+CB7m6ZbrViOAaY33qKLlt48kP7ftFPhWdlMv
         iScdusEMMinwTWr85oONJ94JpmeYw76U0JujcAIenIxj5jpfxxcElopPrEfKe0su6Z36
         iCrmnFHM4KcKnjXgP7mwRNrPR7R4oogx9TNII=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770593450; x=1771198250;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9oU8EmvEI4KEY4PqgpWJsYc27tk2dV9EWUgNH71LRog=;
        b=pMcN1BtjSoW0EqtE9I4bxgT7VaDhls2WlSMQxogc/n6/MD4/VO3eoysxh4hDQtMZY/
         5VYpgzQhWddn5bBNU6bOK7qiIrk9n9ioRzweJY5g6kseI60de1znesCIEZuXxLf6r5Dv
         /yQUWY1pj7DGLKtRVq56SBZ5i9Av+OmRwy7KXJ2KlCQF6aDEnyLzS5J+l4bvLfJhSL+b
         /rok6M8/j1raagteOU3aCbeZbwV4hfrAuCVEqgO3wRahbc5aTMbe4S3PIIdpFeLPNAp0
         kmDEJsYZzvIVd3irh5PGxQUbBCZJYpuoI3tQrkHCKVLDyoXYjgZ9XN7wxWnsDot8rN0s
         aVkg==
X-Forwarded-Encrypted: i=1; AJvYcCWTOg1C1sCB63NUHC2TqWprt50JOuqv3QZ1HnYUrq1a6jFj85HnCrsFm/Jelb/NUK30q5nM7Si/qPDXEcDnlCZdtA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxWAoyhiT2DgbUXl1Jt034C7c4DfOlDgwhFO5Emx2xwAmd+M5mt
	4aq82NNHdFe89dhGN7109ErttxEBEQ7W7RY5Ljox9XCSSPdO9PSMY29PFhv3rtwLekM=
X-Gm-Gg: AZuq6aJsqE2UTx62GNHiiUZfKe+lTot79SkvmAc4ss6bTw3bHAgXSf3GyOsNqy22hu9
	/Cm4DJxC3KkzKSl6HV7xaW1+lT54zfm33l8sqekO5KRoT0Iyl7aEqk4+1YLe19XW7e7cCdfTB1n
	wTxrJtuo61/DQxFIamvy+LXwiu/MRTX6RtTdzQ3qC3b8hg7+YQ8g5LRziKTnzvzYXzTBO0c6Kdk
	DFRJSl9HTVhYg5FQZE14kem+itp5M/hCExbMleBo9THb/NAupO8UAalARF26Tk4bvbv80znYByM
	rfd2x3uV+ClmbUlx3O4EVr1EqSlvcwV9pr8v8ws19Hf/lP34Is/G7OW81NB+uy7BHVEeY0mgkGT
	ATOUbpCKyiGEr/at9MIxM6bhMLKh5OmA6MqIkq7MX8Su16FqibqvLbySOgi+7ajVe7cQGHPX3wi
	Af6I9XZt/Zh5jr21iLY8D4Q0EqC9Ti7khjDMGYTccAmyzwGfjwBqtsBuBdmEoBeoR+ngUEvlRD7
	pU=
X-Received: by 2002:a05:600c:64c6:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-483201fffeamr130845085e9.3.1770593449718;
        Sun, 08 Feb 2026 15:30:49 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48333bad79bsm141581195e9.8.2026.02.08.15.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Feb 2026 15:30:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Feb 2026 00:30:48 +0100
Message-Id: <DG9YZT9XHLW3.1OYVF5QZPT565@smile.fr>
Subject: Re: [OE-core][scarthgap][PATCH 1/2] libpcre2: Enable Ptest Support
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <careers.myinfo@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260120073632.508451-1-moins@kpit.com>
In-Reply-To: <20260120073632.508451-1-moins@kpit.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Feb 2026 23:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230701

On Tue Jan 20, 2026 at 8:36 AM CET, Shaik Moin via lists.openembedded.org w=
rote:
> Install libpcre2 test suite and run it as ptest.
>
> Add tests for POSIX wrapper (pcre2posix_test), core PCRE2 engine (RunTest=
), and grep utility (RunGrepTest).
>
> pcre2posix_test: Verifies the POSIX wrapper API
> RunTest: Executes the core PCRE2 test suite through pcre2test
> RunGrepTest: Checks pcre2grep to ensure its grep=C3=A2=E2=82=AC=E2=80=98s=
tyle matching works as expected with various patterns and input files.
>
> Signed-off-by: Shaik Moin <moins@kpit.com>
> ---
>  .../distro/include/ptest-packagelists.inc     |  1 +
>  .../libpcre/libpcre2/run-ptest                | 45 +++++++++++++++++++
>  .../recipes-support/libpcre/libpcre2_10.43.bb | 21 ++++++++-
>  3 files changed, 65 insertions(+), 2 deletions(-)
>  create mode 100644 meta/recipes-support/libpcre/libpcre2/run-ptest

Hello,

Thanks for the patches but adding ptest is not usually acceptable under
the stable policy[0]. That also applies to your kirkstone patch.

[0]: https://wiki.yoctoproject.org/wiki/Stable_Release_and_LTS#Stable/LTS_P=
atch_Acceptance_Policies

Regards,
--=20
Yoann Congal
Smile ECS


