Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F49C35274
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 09:27:04 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.40757.1702891619201087220
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 01:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NV0o7L2a;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-50e3c6f1c10so406501e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 01:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702891617; x=1703496417; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jcRiI5La6UGPlK7ARYzDyoS3WIihPhfKtjJOu5xSLd4=;
        b=NV0o7L2aRnOK8+ITbcwIbHA5WngKZIJ8vwW2w3+i4cVjeMvxfZbCt/TypSV0eaXwP+
         C8f4oBZoO9IgDJUyvkHi0iZYv3uaQnVbaiE7xHbLNB9fc4J/cQ6k34fE9lVjzQjbCQNV
         KVhFgP0BAcHVXSpCqr3gdCBF8vm4ksfeOr1frL4eP5wBfBk7jbdZ2OUkRnxJRaVuajbA
         UlUVIwMvowPDBeb9kyAGI+VJX+ysf2Eg3a0J01XK3vU0h1GcRDNL4RYJOpVrBUO8GHWZ
         zjeH8XCwV2sZBowHxl4p8uejYNUjSgftBfn9m9MEKoGnncaJCFN/YY9izluTnlyRibc2
         3o2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702891617; x=1703496417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jcRiI5La6UGPlK7ARYzDyoS3WIihPhfKtjJOu5xSLd4=;
        b=RuYTzSQV5x3liXEFDFnR2Q+bZT4j2t0hliE/gIpnCUGHVS3oo7zJKthuAgCvo60Ra4
         DuvubNzazjIizuYaIpq/W5f1njUMXBlvwJXyHGeZ3dugKAj7tVUfqTVmhsmY+5jhcogF
         t6MQp3LR0UKR4aSX3oyJI7xnea7KWjQiTqXIjBYtkdhfh3YxADkH//k0FPH8yyW8QVwk
         qkfQTGHnqez0kUsOmknmX3qFSs6z8fcMgxfJK4qD3fOyMOzee+tawsHX9v7GoJOLKEXG
         sqD7LKcBVo/S9b8994O24EIvfloq5GZGLt7ClLP8X4pDCshcyWMETYvYvteMMF3Fsm9D
         539A==
X-Gm-Message-State: AOJu0YxtqInVveZvkyCqdaf/abkn5xoo65KakiNvgG19lg3wUCfNNls5
	WH5ls56X3v3iwEbCNGhYzkbIEayX8R18HFVQs/8=
X-Google-Smtp-Source: AGHT+IF2Z9SKCB7CB5T36k4y0OKEDEK9qTEqFAotwvUy49ASZaeH3S3xbK/i0kXu6K+8wjDVXHE1fQsEaNSAVkiGXYc=
X-Received: by 2002:a05:6512:3582:b0:50e:3a23:9d05 with SMTP id
 m2-20020a056512358200b0050e3a239d05mr171166lfr.66.1702891617297; Mon, 18 Dec
 2023 01:26:57 -0800 (PST)
MIME-Version: 1.0
References: <CANNYZj_DszK94DujKJ_a52HsAhW92nP0eVtitfuKueKeMNQ3QA@mail.gmail.com>
 <20231218091332.3090320-1-mingli.yu@windriver.com>
In-Reply-To: <20231218091332.3090320-1-mingli.yu@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 18 Dec 2023 10:26:45 +0100
Message-ID: <CANNYZj9aLEa=zCFMxv3cdjmwDdk3ZRyhsn+qtYFeY1LLBDyfPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] python3-license-expression: Fix the ptest failure
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 09:27:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192627

On Mon, 18 Dec 2023 at 10:13, Yu, Mingli <mingli.yu@eng.windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fix the below ptest failure:
>  self = <test_skeleton_codestyle.BaseTests testMethod=test_skeleton_codestyle>
>  def test_skeleton_codestyle(self):
>  """
>  This test shouldn't run in proliferated repositories.
>  """
>  setup_cfg = configparser.ConfigParser()
>  setup_cfg.read("setup.cfg")
>  > if setup_cfg["metadata"]["name"] != "skeleton":
>  tests/test_skeleton_codestyle.py:22:
>  self = <configparser.ConfigParser object at 0x7fd87cf55110>, key = 'metadata'
>  def _getitem_(self, key):
>  if key != self.default_section and not self.has_section(key):
>  > raise KeyError(key)
>  E KeyError: 'metadata'

I went and checked why this isn't seen on the autobulder - this ptest
is actually excluded from testing because it's in PTESTS_PROBLEMS.
Please add it to PTESTS_FAST (if it's quick enough), and then it's
good.

Alex

